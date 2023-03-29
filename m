Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F02AD30
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Mar 2023 23:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680133038; x=1711669038;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s33GSXuR2J7KdPtuJFVdjpnj1F3Q7MhVqY044oCoVzg=;
  b=TwvjgJ0445ePaF9XqeMCNtKvFDOWskaNsfhJSv8wjmbZn7LexUlV7a3c
   KI8BgppFAwdodiMrxkNgvlCnionMf01wRDHQF6MvTd4OzUePWpqXhvhhP
   liM2oSA3YsRAcK4Ncl3JEdB5GGqYEIG2cD0MyBgnz8X03HiEPrmRTzYsS
   V3eLEHQaE3Kstyu24bdj9bWz01ePWutlK73KexORut+9/15JZuHw+w19x
   PXdWMyGbog/OBzIfu1P+SmRQBfD9P5bYZp51FXGAWg5GnAejzXFOCa9e8
   cIy6DdtI+Iw/XitF4lcs2TyjxCdfzmi4NO4ZH3sRW3MGAubfx9dyfgHEZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="427300063"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="427300063"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 16:37:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="858690304"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="858690304"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 29 Mar 2023 16:37:16 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phfLw-000K3C-0N;
	Wed, 29 Mar 2023 23:37:16 +0000
Date: Thu, 30 Mar 2023 07:36:50 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] net: extend drop reasons for multiple subsystems
Message-ID: <202303300741.zEwBjObJ-lkp@intel.com>
References: <20230329214620.131636-1-johannes@sipsolutions.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230329214620.131636-1-johannes@sipsolutions.net>

Hi Johannes,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on wireless-next/main]
[also build test ERROR on wireless/main horms-ipvs/master net/main net-next/main linus/master v6.3-rc4 next-20230329]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johannes-Berg/mac80211-use-the-new-drop-reasons-infrastructure/20230330-054719
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20230329214620.131636-1-johannes%40sipsolutions.net
patch subject: [RFC PATCH 1/2] net: extend drop reasons for multiple subsystems
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230330/202303300741.zEwBjObJ-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ff46d1291ffa265b9c23249a5132e6824f603ef5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Johannes-Berg/mac80211-use-the-new-drop-reasons-infrastructure/20230330-054719
        git checkout ff46d1291ffa265b9c23249a5132e6824f603ef5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash net/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303300741.zEwBjObJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/core/skbuff.c:124:21: error: 'SKB_DROP_REASON_MAX' undeclared here (not in a function); did you mean 'SKB_DROP_REASON_XDP'?
     124 | #define FN(reason) [SKB_DROP_REASON_##reason] = #reason,
         |                     ^~~~~~~~~~~~~~~~
   include/net/dropreason.h:81:9: note: in expansion of macro 'FN'
      81 |         FNe(MAX)
         |         ^~~
   net/core/skbuff.c:127:9: note: in expansion of macro 'DEFINE_DROP_REASON'
     127 |         DEFINE_DROP_REASON(FN, FN)
         |         ^~~~~~~~~~~~~~~~~~
>> net/core/skbuff.c:124:21: error: array index in initializer not of integer type
     124 | #define FN(reason) [SKB_DROP_REASON_##reason] = #reason,
         |                     ^~~~~~~~~~~~~~~~
   include/net/dropreason.h:81:9: note: in expansion of macro 'FN'
      81 |         FNe(MAX)
         |         ^~~
   net/core/skbuff.c:127:9: note: in expansion of macro 'DEFINE_DROP_REASON'
     127 |         DEFINE_DROP_REASON(FN, FN)
         |         ^~~~~~~~~~~~~~~~~~
   net/core/skbuff.c:124:21: note: (near initialization for 'drop_reasons')
     124 | #define FN(reason) [SKB_DROP_REASON_##reason] = #reason,
         |                     ^~~~~~~~~~~~~~~~
   include/net/dropreason.h:81:9: note: in expansion of macro 'FN'
      81 |         FNe(MAX)
         |         ^~~
   net/core/skbuff.c:127:9: note: in expansion of macro 'DEFINE_DROP_REASON'
     127 |         DEFINE_DROP_REASON(FN, FN)
         |         ^~~~~~~~~~~~~~~~~~


vim +124 net/core/skbuff.c

^1da177e4c3f415 Linus Torvalds 2005-04-16  122  
9cb252c4c1c53ae Menglong Dong  2022-09-05  123  #undef FN
9cb252c4c1c53ae Menglong Dong  2022-09-05 @124  #define FN(reason) [SKB_DROP_REASON_##reason] = #reason,
ff46d1291ffa265 Johannes Berg  2023-03-29  125  static const char * const drop_reasons[] = {
0e84afe8ebfbb9e Eric Dumazet   2022-10-29  126  	[SKB_CONSUMED] = "CONSUMED",
9cb252c4c1c53ae Menglong Dong  2022-09-05  127  	DEFINE_DROP_REASON(FN, FN)
9cb252c4c1c53ae Menglong Dong  2022-09-05  128  };
ff46d1291ffa265 Johannes Berg  2023-03-29  129  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
