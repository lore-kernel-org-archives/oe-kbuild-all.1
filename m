Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA67381
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Sep 2023 03:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695439529; x=1726975529;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yC9b9CvUAecvQjD9KvFsgXiyVWFjP7S8sEGdLA+/M34=;
  b=eREbIGgXA4wYWgnbWV71fI0yt/fNqcaJEsxhKKN3zjieNbdyAs4YB9Ir
   uNE9493l1RJKTPXDJpLg/SlK+AsJrTSrapduTVodSC0tvj7zumTAVOdwm
   CiQ05zD624FEzCnAQrsv1aPCoiL5yS4MJ7qLydtJP43syrNd+z3t6pxiF
   m0UOXTyned/a5GEyjgSPUpC1qUM50JYo2UzAOcIfHmDM/aJ6H264jG5vn
   GZNgKsHVbG2WTp36FhAmv8HniuRJf7ILHTcWsbCsEf1E5lR1+0qQVeKjy
   cJFsnBuAhcwZli7h3a8b2dn4yDGWZQBK0RlGcMHRBPxIHLBX9h/naPJP8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="378269474"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; 
   d="scan'208";a="378269474"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 20:25:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="994757481"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; 
   d="scan'208";a="994757481"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 22 Sep 2023 20:25:25 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjtGl-0001gD-19;
	Sat, 23 Sep 2023 03:25:23 +0000
Date: Sat, 23 Sep 2023 11:24:47 +0800
From: kernel test robot <lkp@intel.com>
To: Noah Goldstein <goldstein.w.n@gmail.com>, x86@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	edumazet@google.com, tglx@linutronix.de, mingo@redhat.com,
	torvalds@linux-foundation.org, bp@alien8.de,
	dave.hansen@linux.intel.com, David.Laight@aculab.com, hpa@zytor.com,
	goldstein.w.n@gmail.com
Subject: Re: x86/csum: Remove unnecessary odd handling
Message-ID: <202309231130.ZI5MdlDc-lkp@intel.com>
References: <20230920192300.3772199-1-goldstein.w.n@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230920192300.3772199-1-goldstein.w.n@gmail.com>

Hi Noah,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/x86/core]
[also build test WARNING on tip/master tip/auto-latest linus/master v6.6-rc2 next-20230921]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Noah-Goldstein/x86-csum-Remove-unnecessary-odd-handling/20230921-032450
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20230920192300.3772199-1-goldstein.w.n%40gmail.com
patch subject: x86/csum: Remove unnecessary odd handling
config: x86_64-randconfig-121-20230921 (https://download.01.org/0day-ci/archive/20230923/202309231130.ZI5MdlDc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230923/202309231130.ZI5MdlDc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309231130.ZI5MdlDc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/lib/csum-partial_64.c:16:45: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __wsum @@     got unsigned long long @@
   arch/x86/lib/csum-partial_64.c:16:45: sparse:     expected restricted __wsum
   arch/x86/lib/csum-partial_64.c:16:45: sparse:     got unsigned long long
>> arch/x86/lib/csum-partial_64.c:16:45: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __wsum @@     got unsigned long long @@
   arch/x86/lib/csum-partial_64.c:16:45: sparse:     expected restricted __wsum
   arch/x86/lib/csum-partial_64.c:16:45: sparse:     got unsigned long long

vim +16 arch/x86/lib/csum-partial_64.c

    13	
    14	static inline __wsum csum_finalize_sum(u64 temp64)
    15	{
  > 16		return (temp64 + ror64(temp64, 32)) >> 32;
    17	}
    18	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
