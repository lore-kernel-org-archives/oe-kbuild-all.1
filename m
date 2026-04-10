Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751CE39F192
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 11:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775820337; cv=none; b=U05Jrtg61OWlyspKtnpoujUDY90ZRKbfbqYnw/KcDTXg/qkR2pvV7HpR1pBOccqkf1kye3cv0e/WnljPfpg3hEnd+ikpE5opwrwBD9ksL2ZGKd7jwjhKJdR8UxR+o4KfKSx0Lt+6uc790ujr+2ZygX3EyYf+vlpTBw1sYklYKPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775820337; c=relaxed/simple;
	bh=N9GPjQOluMrUA6MhE7qXprCLLs1/Pk9MpNJf0ngu85U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fAsc/881BYsonnnDLbFYopybbvovFHBfgxRBKxlw5GDk/Sv6Z6Efn7+CCWpsFvaQ9Ifa6GAfK95dXfHBu+ZLe4Ub+Cx46LUPyhZWySJgcByb6dNo0wBxlhFnu0G4MK7ehX4VWQbVi8wkFdAtfSJMkIOX5bQsjMugPhuNRKsRZ4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HhvC3AV2; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HhvC3AV2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775820336; x=1807356336;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N9GPjQOluMrUA6MhE7qXprCLLs1/Pk9MpNJf0ngu85U=;
  b=HhvC3AV2aNvqQX4XqXNgSicCooIy81nuMpcyeNbR5B8+VZ8XsZR3HPOs
   KbjEOQZD3j1tbP2+j5oWfbUkyWViLLqo0lttCw5oE45IWcNEjmEN4n5bg
   2tXNuYTIKnneXGvuKWT82CDs95w+BbhIfAYtxIvpqHDg7qmhc6lPRiMRm
   X6NgdEIjVSyhNgCwpOEqbPxjtALJK5o8zVIFtJsUSlZwdmAC+JLvRRdmS
   X3dCwaMnDnQQiwl1DgJzpKBBAo19kGvBaG91QcWCXq14ElvwgC9X/SF2l
   L9Lpp6CXV3kDzhZSj3cXickQcBnIPeOBRjz0lEgAh8K4u6SHCXU+D2bkj
   Q==;
X-CSE-ConnectionGUID: XtsyRHWIR/qRnXWlNtRcqg==
X-CSE-MsgGUID: hTmZnb1kQLicBUPEx9HThw==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76855773"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="76855773"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 04:25:34 -0700
X-CSE-ConnectionGUID: NGhCKURwQx6un/QUOJ4tew==
X-CSE-MsgGUID: zOpRfWYhR5yljoyrEYLxTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="252221590"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Apr 2026 04:25:31 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wB9zN-000000003eN-2e0S;
	Fri, 10 Apr 2026 11:25:29 +0000
Date: Fri, 10 Apr 2026 19:24:53 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?"C=C3=A1ssio?= Gabriel" <cassiogabrielcontato@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Takashi Iwai <tiwai@suse.de>
Subject: [linux-next:master 12399/13151]
 sound/isa/gus/interwave.c:489:13: warning: 'snd_interwave_restore_memory'
 defined but not used
Message-ID: <202604101958.x16oNkfo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3fa7d958829eb9bc3b469ed07f11de3d2804ef71
commit: 6f800c3397b7f64da4c9eb636a1206f8d8636c95 [12399/13151] ALSA: interwave: add ISA and PnP suspend and resume callbacks
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260410/202604101958.x16oNkfo-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604101958.x16oNkfo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604101958.x16oNkfo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/isa/gus/interwave.c:489:13: warning: 'snd_interwave_restore_memory' defined but not used [-Wunused-function]
     489 | static void snd_interwave_restore_memory(struct snd_gus_card *gus)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/isa/gus/interwave.c:483:13: warning: 'snd_interwave_restore_regs' defined but not used [-Wunused-function]
     483 | static void snd_interwave_restore_regs(struct snd_gus_card *gus)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/snd_interwave_restore_memory +489 sound/isa/gus/interwave.c

   482	
 > 483	static void snd_interwave_restore_regs(struct snd_gus_card *gus)
   484	{
   485		scoped_guard(spinlock_irqsave, &gus->reg_lock)
   486			__snd_interwave_restore_regs(gus);
   487	}
   488	
 > 489	static void snd_interwave_restore_memory(struct snd_gus_card *gus)
   490	{
   491		unsigned short mem_cfg;
   492		unsigned int lmct = 0;
   493		int i, lmc_cfg;
   494	
   495		if (!gus->gf1.memory)
   496			return;
   497	
   498		for (i = 0; i < 4; i++)
   499			lmct |= (gus->gf1.mem_alloc.banks_16[i].size >> 18) << (i * 8);
   500	
   501		lmc_cfg = snd_interwave_find_memory_config(lmct);
   502		if (lmc_cfg < 0) {
   503			if (!gus->gf1.enh_mode) {
   504				lmc_cfg = 2;
   505			} else {
   506				dev_warn(gus->card->dev,
   507					 "cannot restore InterWave memory layout 0x%08x\n",
   508					 lmct);
   509				return;
   510			}
   511		}
   512	
   513		scoped_guard(spinlock_irqsave, &gus->reg_lock) {
   514			mem_cfg = snd_gf1_look16(gus, SNDRV_GF1_GW_MEMORY_CONFIG);
   515			mem_cfg = (mem_cfg & 0xfff0) | lmc_cfg;
   516			mem_cfg = (mem_cfg & 0xff1f) | (4 << 5);
   517			snd_gf1_write16(gus, SNDRV_GF1_GW_MEMORY_CONFIG, mem_cfg);
   518		}
   519	}
   520	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
