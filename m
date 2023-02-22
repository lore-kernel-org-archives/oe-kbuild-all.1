Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6470D23A5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Feb 2023 10:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677061270; x=1708597270;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=snRzEBL5qHKYkhshn/hGVwo3j7YQDc3J7eql9qrM26M=;
  b=DUJ7jAwaMLDc/dYbE0DFKy1YPMV9U4gulWYaVuZIjivYsJAvQBzz0+Eb
   u7pR1p+iimgTX/ADA9/eA/G8GPY+tNp+pDyfV6MaG3+g3WyBEPnuC8kqB
   Il+gg8BLO/ka+UfgVzsTF/JPnV1mA6Sl1fciJrj8hYccFRQHtMXrV3lsI
   la9tI7o6N1FqCL1X9LyODeYHLOVltb/KYqBYjphsHUGAfs8h3+n18rjgS
   Sw1CnCyULukwcpPE3LEjSzHJ6ONa5CHsOeg/h7txE1otXYBCuCHYJiVB+
   RMOTGSuP0J2qKV9odUs/NGVWltp7LEve/1/2k68XGybLBSDDWtEitxQY1
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="332892063"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; 
   d="scan'208";a="332892063"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2023 02:21:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="760909917"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; 
   d="scan'208";a="760909917"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Feb 2023 02:21:09 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUmFI-0000El-0Y;
	Wed, 22 Feb 2023 10:21:08 +0000
Date: Wed, 22 Feb 2023 18:20:19 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/alternatives/info 1/1]
 arch/arm64/kernel/alternative.c:147:6: warning: no previous prototype for
 'summarize_alternatives'
Message-ID: <202302221852.fPvgpgS6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/alternatives/info
head:   840fba2983086adad6957d08ff7c0a36c39560e7
commit: 840fba2983086adad6957d08ff7c0a36c39560e7 [1/1] HACK: arm64: alternatives: dump summary of alternatives
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230222/202302221852.fPvgpgS6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?id=840fba2983086adad6957d08ff7c0a36c39560e7
        git remote add mark https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git
        git fetch --no-tags mark arm64/alternatives/info
        git checkout 840fba2983086adad6957d08ff7c0a36c39560e7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302221852.fPvgpgS6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/alternative.c:147:6: warning: no previous prototype for 'summarize_alternatives' [-Wmissing-prototypes]
     147 | void summarize_alternatives(const struct alt_region *region)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/alternative.c:358:14: warning: no previous prototype for 'alt_cb_patch_nops' [-Wmissing-prototypes]
     358 | noinstr void alt_cb_patch_nops(struct alt_instr *alt, __le32 *origptr,
         |              ^~~~~~~~~~~~~~~~~


vim +/summarize_alternatives +147 arch/arm64/kernel/alternative.c

   141	
   142	#define for_each_region_alt(region, alt)		\
   143		for (struct alt_instr *alt = (region)->begin;	\
   144		     (alt) < (region)->end;			\
   145		     (alt)++)
   146	
 > 147	void summarize_alternatives(const struct alt_region *region)
   148	{
   149		unsigned int entries[ARM64_NCAPS] = { 0 };
   150		unsigned int orig_len[ARM64_NCAPS] = { 0 };
   151		unsigned int repl_len[ARM64_NCAPS] = { 0 };
   152		unsigned int callbacks[ARM64_NCAPS] = { 0 };
   153	
   154		unsigned int total_entries = 0;
   155		unsigned int total_orig = 0;
   156		unsigned int total_repl = 0;
   157		unsigned int total_callbacks = 0;
   158	
   159		for_each_region_alt(region, alt) {
   160			int cap = ALT_CAP(alt);
   161	
   162			entries[cap]++;
   163			total_entries++;
   164	
   165			orig_len[cap] += alt->orig_len;
   166			total_orig += alt->orig_len;
   167	
   168			repl_len[cap] += alt->alt_len;
   169			total_repl += alt->alt_len;
   170	
   171			if (ALT_HAS_CB(alt)) {
   172				callbacks[cap]++;
   173				total_callbacks++;
   174			}
   175		}
   176	
   177		pr_info("Alternatives summary:\n"
   178			"    entries:      %6u (%6zu bytes)\n"
   179			"      standard:   %6d\n"
   180			"      callback:   %6d\n"
   181			"    instructions: %6u (%6u bytes)\n"
   182			"    replacements: %6u (%6u bytes)\n",
   183			total_entries,	total_entries * sizeof (struct alt_instr),
   184			total_entries - total_callbacks,
   185			total_callbacks,
   186			total_orig / AARCH64_INSN_SIZE, total_orig,
   187			total_repl / AARCH64_INSN_SIZE, total_repl);
   188	
   189		for (int i = 0; i < ARM64_NCAPS; i++) {
   190			if (!entries[i])
   191				continue;
   192	
   193			pr_info("cpucap %2d => entries: %5d, orig: %5d, repl: %5d, cb: %5d\n",
   194				i,
   195				entries[i],
   196				orig_len[i] / AARCH64_INSN_SIZE,
   197				repl_len[i] / AARCH64_INSN_SIZE,
   198				callbacks[i]);
   199		}
   200	}
   201	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
