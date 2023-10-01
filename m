Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF7B8F67
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Oct 2023 13:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696168414; x=1727704414;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eLo8LmtOAlRjDP5HZKQjdsQwbbiTUtuyFQ8jDyLeykA=;
  b=GBWmj/QK3DrTlWoCN8w6lITVLCk/iRFWR3s9UBNoI6GmhVeMnAtHCs0c
   YnQTZG6rWwDRijIwYMe7XaJbVc875S71jnPs7NOHahMK+NUjLcHy4279x
   fImdgUVGz53+JLBLB/YqaDs7mfi5vU61iQycqOV6KVDpT6ufghqQNoOJp
   EUwj9Ihk4688BJnp9rOcRGzSGucrrQoiAJ8xtnqvgjeDjEUSHHSosClRB
   FFPOvxpI3MIaVILuxTsjC5bBG0os7bqOwQ/o8RkWZgP8I+2nRHpkpApL8
   neA86vi0eTBZbmwr3Tg9eAFg4moTk0FY6+XVj0Nh/+sc8s6F63b3Zx8d3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="367581616"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="367581616"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2023 06:53:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="820652968"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="820652968"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 01 Oct 2023 06:53:32 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmwsz-00055t-2K;
	Sun, 01 Oct 2023 13:53:29 +0000
Date: Sun, 1 Oct 2023 21:52:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 3/3] arch/arm64/kernel/mte.c:201:13:
 warning: no previous prototype for 'kasan_hw_tags_enable'
Message-ID: <202310012152.bpmHW61z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   3cf9365660f9bcf3dd0b09582d9f49634436b28b
commit: 55b0b347918b1f9e8c7e8ae8cd057a9fddfffb0a [3/3] FROMGIT: arm64: kasan: mte: move GCR_EL1 switch to task switch when KASAN disabled
config: arm64-alldefconfig (https://download.01.org/0day-ci/archive/20231001/202310012152.bpmHW61z-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231001/202310012152.bpmHW61z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310012152.bpmHW61z-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the asmlinkage attribute
All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/mte.c:201:13: warning: no previous prototype for 'kasan_hw_tags_enable' [-Wmissing-prototypes]
     201 | void __init kasan_hw_tags_enable(struct alt_instr *alt, __le32 *origptr,
         |             ^~~~~~~~~~~~~~~~~~~~


vim +/kasan_hw_tags_enable +201 arch/arm64/kernel/mte.c

   200	
 > 201	void __init kasan_hw_tags_enable(struct alt_instr *alt, __le32 *origptr,
   202					 __le32 *updptr, int nr_inst)
   203	{
   204		BUG_ON(nr_inst != 1); /* Branch -> NOP */
   205	
   206		if (kasan_hw_tags_enabled())
   207			*updptr = cpu_to_le32(aarch64_insn_gen_nop());
   208	}
   209	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
