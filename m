Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EDD23C5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Jun 2023 18:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686421518; x=1717957518;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZoRA0+G3H0arP57IuK+U7rIIYtkXi2qsl0W4mWnmsOw=;
  b=L+xowOKuUgXFUXc35vHJuxEicAFtlC9lwfo44p45e2X6wUYWKAM6SWtC
   6s947DcXGxUcQfKvGjZ8wbAlUoUH9bWz0YSGxbavZfv20lrLtTvHdDa+O
   YuKQGlkMIl7V8YL1ZpmNswtnLbz4s/lVz1S7SHmer6sZJmuIrWHwXv/dV
   qzoe8IgWAAd3OaboraOkpi5zE0I9Tw5ggnQuu56lVrXvxuoQ1zNV67lV8
   L1pY7iLGZBb8ncMSeb2Jgg3maJLs5LJhMmQ/4TLJDm0UyRibl3QwH6vII
   9Hrb6W7WsLNJjI4pBJnYg1JktLHnfk0g7Vrp7Q4PGrIPzGFPucZX32F6G
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="356682279"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="356682279"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2023 11:25:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="688115166"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="688115166"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 10 Jun 2023 11:25:14 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q83Gz-000ALs-1L;
	Sat, 10 Jun 2023 18:25:13 +0000
Date: Sun, 11 Jun 2023 02:24:52 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v8 08/11] kbuild: implement CONFIG_TRIM_UNUSED_KSYMS
 without recursion
Message-ID: <202306110246.xCEMOjZy-lkp@intel.com>
References: <20230610091320.1054554-9-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230610091320.1054554-9-masahiroy@kernel.org>

Hi Masahiro,

kernel test robot noticed the following build errors:

[auto build test ERROR on masahiroy-kbuild/for-next]
[also build test ERROR on next-20230609]
[cannot apply to masahiroy-kbuild/fixes arnd-asm-generic/master rafael-pm/linux-next linus/master v6.4-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Masahiro-Yamada/Revert-PATCH-uml-export-symbols-added-by-GCC-hardened/20230610-171620
base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
patch link:    https://lore.kernel.org/r/20230610091320.1054554-9-masahiroy%40kernel.org
patch subject: [PATCH v8 08/11] kbuild: implement CONFIG_TRIM_UNUSED_KSYMS without recursion
config: arc-randconfig-r035-20230610 (https://download.01.org/0day-ci/archive/20230611/202306110246.xCEMOjZy-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add masahiroy-kbuild https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
        git fetch masahiroy-kbuild for-next
        git checkout masahiroy-kbuild/for-next
        b4 shazam https://lore.kernel.org/r/20230610091320.1054554-9-masahiroy@kernel.org
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash arch/arc/kernel/ drivers/infiniband/core/ drivers/media/dvb-core/ drivers/mtd/chips/ fs/ io_uring/ kernel/ lib/ mm/ net/802/ net/core/ net/ethernet/ net/ipv4/ net/ipv6/ net/llc/ net/netfilter/ net/rxrpc/ net/sched/ net/wireless/ net/xfrm/ security/keys/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306110246.xCEMOjZy-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   {standard input}:2473: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2479: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2481: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2485: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2487: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2488: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2490: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2491: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2493: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2494: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2499: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2505: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2509: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2510: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2512: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2514: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2520: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2524: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2526: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2527: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2529: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2531: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2533: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2535: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2537: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2539: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2540: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2542: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2544: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2547: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2548: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2550: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2555: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2556: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2560: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2561: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2563: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2565: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2567: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2569: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2571: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2574: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2576: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2581: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2582: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2584: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2586: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2588: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2590: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2592: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2594: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2597: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2599: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2601: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2603: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2605: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2606: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2607: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2608: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2611: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2612: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2617: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2618: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2622: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2671: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2708: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2709: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2710: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2711: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2716: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2718: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2720: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2722: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2724: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2726: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2728: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2731: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2732: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2734: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2736: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2738: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2740: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2742: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2743: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2745: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2746: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2749: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2751: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2756: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2757: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2759: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2760: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2761: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2766: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2767: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2776: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2780: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2781: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2784: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2785: Warning: dwarf line number information for .export_symbol ignored
>> arch/arc/include/asm/bitops.h:31: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2799: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2800: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2808: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2812: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2816: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2817: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2819: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2820: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2824: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2829: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2834: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2836: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2843: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2844: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2847: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2852: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2853: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2854: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2856: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2858: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2861: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2865: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2867: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2869: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2874: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2876: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2880: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2882: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2888: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2890: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2895: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2954: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2982: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2983: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2984: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2985: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2986: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2990: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2992: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2993: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2994: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2995: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2997: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:2999: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3002: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3004: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3005: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3011: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3013: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3015: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3017: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3019: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3024: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3029: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3034: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3035: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3036: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3038: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3039: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3041: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3042: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3046: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3051: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3056: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3058: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3059: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3062: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3063: Warning: dwarf line number information for .export_symbol ignored
>> arch/arc/include/asm/bitops.h:31: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3074: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3075: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3079: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3080: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3084: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3085: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3087: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3089: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3094: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3102: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3105: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3106: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3110: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3114: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3115: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3116: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3118: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3123: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3124: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3126: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3127: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3129: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3131: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3133: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3143: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3144: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3148: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3150: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3152: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3155: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3156: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3162: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3173: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3174: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3178: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3179: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3181: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3185: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3189: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3191: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3193: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3197: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3198: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3199: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3201: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3205: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3211: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3215: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3219: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3220: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3268: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3313: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3314: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3317: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3318: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3320: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3322: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3324: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3326: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3328: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3330: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3332: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3334: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3336: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3337: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3338: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3339: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3340: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3341: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3342: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3344: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3349: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3354: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3355: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3357: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3359: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3361: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3362: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3364: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3365: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3367: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3368: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3370: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3371: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3374: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3377: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3379: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3384: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3390: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3391: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3395: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3396: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3405: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3409: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3412: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3414: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3416: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3420: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3423: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:3426: Warning: dwarf line number information for .export_symbol ignored
--
   {standard input}:4867: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4869: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4872: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4873: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4875: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4876: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4882: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4884: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4886: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4887: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4888: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4891: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4892: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4895: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4896: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4897: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4905: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4906: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4909: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4910: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4913: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4917: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4919: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4920: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4922: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4923: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4925: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4926: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4927: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4929: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4930: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4933: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4936: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4939: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4942: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4944: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4945: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4948: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4950: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4952: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4954: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4956: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4957: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4959: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4961: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4963: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4965: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4967: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4968: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4970: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4972: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4974: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4976: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4978: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4979: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4982: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4985: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4987: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4989: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4990: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4992: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4994: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4996: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:4998: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5000: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5001: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5003: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5005: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5007: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5009: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5011: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5012: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5014: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5016: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5018: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5021: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5023: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5026: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5027: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5030: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5033: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5035: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5036: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5039: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5042: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5043: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5044: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5048: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5050: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5051: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5055: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5056: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5058: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5063: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5064: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5066: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5068: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5069: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5072: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5073: Warning: dwarf line number information for .export_symbol ignored
>> arch/arc/include/asm/bitops.h:31: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5085: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5086: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5089: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5090: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5092: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5095: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5096: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5098: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5100: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5102: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5106: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5107: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5108: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5109: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5110: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5112: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5114: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5116: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5119: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5120: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5126: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5127: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5129: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5130: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5132: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5137: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5139: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5140: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5142: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5144: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5146: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5148: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5152: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5153: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5157: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5161: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5167: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5168: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5173: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5177: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5182: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5183: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5184: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5185: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5187: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5188: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5191: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5195: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5200: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5201: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5202: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5204: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5210: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5212: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5213: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5214: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5215: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5219: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5223: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5229: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5234: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5236: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5242: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5245: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5246: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5252: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5253: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5254: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5258: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5259: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5261: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5262: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5264: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5266: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5268: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5274: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5275: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5279: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5281: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5283: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5284: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5286: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5287: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5289: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5290: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5292: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5293: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5294: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5299: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5300: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5301: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5306: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5307: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5309: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5311: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5315: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5316: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5318: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5323: Warning: dwarf line number information for .export_symbol ignored
   {standard input}:5324: Warning: dwarf line number information for .export_symbol ignored
..


vim +31 arch/arc/include/asm/bitops.h

1f6ccfff631467 Vineet Gupta 2013-05-13  19  
14e968bad788de Vineet Gupta 2013-01-18  20  /*
14e968bad788de Vineet Gupta 2013-01-18  21   * Count the number of zeros, starting from MSB
14e968bad788de Vineet Gupta 2013-01-18  22   * Helper for fls( ) friends
14e968bad788de Vineet Gupta 2013-01-18  23   * This is a pure count, so (1-32) or (0-31) doesn't apply
14e968bad788de Vineet Gupta 2013-01-18  24   * It could be 0 to 32, based on num of 0's in there
14e968bad788de Vineet Gupta 2013-01-18  25   * clz(0x8000_0000) = 0, clz(0xFFFF_FFFF)=0, clz(0) = 32, clz(1) = 31
14e968bad788de Vineet Gupta 2013-01-18  26   */
14e968bad788de Vineet Gupta 2013-01-18  27  static inline __attribute__ ((const)) int clz(unsigned int x)
14e968bad788de Vineet Gupta 2013-01-18  28  {
14e968bad788de Vineet Gupta 2013-01-18  29  	unsigned int res;
14e968bad788de Vineet Gupta 2013-01-18  30  
14e968bad788de Vineet Gupta 2013-01-18 @31  	__asm__ __volatile__(
14e968bad788de Vineet Gupta 2013-01-18  32  	"	norm.f  %0, %1		\n"
14e968bad788de Vineet Gupta 2013-01-18  33  	"	mov.n   %0, 0		\n"
14e968bad788de Vineet Gupta 2013-01-18  34  	"	add.p   %0, %0, 1	\n"
14e968bad788de Vineet Gupta 2013-01-18  35  	: "=r"(res)
14e968bad788de Vineet Gupta 2013-01-18  36  	: "r"(x)
14e968bad788de Vineet Gupta 2013-01-18  37  	: "cc");
14e968bad788de Vineet Gupta 2013-01-18  38  
14e968bad788de Vineet Gupta 2013-01-18  39  	return res;
14e968bad788de Vineet Gupta 2013-01-18  40  }
14e968bad788de Vineet Gupta 2013-01-18  41  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
