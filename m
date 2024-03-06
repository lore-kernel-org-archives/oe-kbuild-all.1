Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01801CA89
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Mar 2024 23:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709768800; cv=none; b=A+e/jp3scImP8kxZbknq7PueSvZx0hDAHvKJQ5OUQHfX/VTybVSqY2Tlqh/fKkhyNMe+z9S5EQFDVnQ+BASOSV6UqjRRB98EAAKh8+RalpFqYtAAk+yO/KRP5ayWowwQ0ogClqVB/GFRQ1neb1NRpujQZC/pTD0jgpe7SWRC8iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709768800; c=relaxed/simple;
	bh=BCGR3OQ2NcbFGS6PUTGStEOXl8KPyOvCezEEvgcz11A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QR2pM0aWetaDhDME9DIlLSBA4D+pDroHHvSJRnrCrpUVQ9dqkGokxy2gtysnoMtV/0avdhovjwQMwJePy/VMCcM92ohiFRvgi/7SUY2mgNoDKxGGAoUMSk9Z9qW/ElV2pyuwN2yalSe2d8AUOXJW+4pG9B64M5Tt4zZzXohDbIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vrp0u6bn; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vrp0u6bn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709768799; x=1741304799;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BCGR3OQ2NcbFGS6PUTGStEOXl8KPyOvCezEEvgcz11A=;
  b=Vrp0u6bn0HMrVjye3hVHTy6EdQiqmvd3d6sFrsl5yYF0RF56C//bu1hS
   CckV0Okwbw5sX3oIwQXETaMqLykAmUY3AMICF5UFEb+MzNovL1gy3+0cC
   0HV5KqpT/J7hW0YcmmoRU9ILMUqQ4zfA0oxbR1Wctr6mHWQsgnAIBrkGz
   /HQjcezRHPm+AkespSd2Vi5O8/HOtcghg3vFhLnJ6yv7PsEEwaSTTz4zu
   +j5+flg/u8iy9bleQZJMu68mv9BWKjDMWHjP5wS3Rtbk67lVrGywZtYbG
   T7vG4TOjaY3v6uMfT2Gv98tcwS/awto+Xwo1zEYwp8RtgDL/nccj6yVAA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4346677"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="4346677"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 15:46:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="40906555"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 06 Mar 2024 15:46:37 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ri0y3-0004dF-0O;
	Wed, 06 Mar 2024 23:46:35 +0000
Date: Thu, 7 Mar 2024 07:46:05 +0800
From: kernel test robot <lkp@intel.com>
To: Stafford Horne <shorne@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [stffrdhrn:or1k-fpu-regs 1/1] arch/openrisc/kernel/entry.S:855:
 Error: unrecognized form of instruction `l.sw TASK_THFPU state for handler
 to inspect.3'
Message-ID: <202403070749.Ik5HqvUp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/stffrdhrn/linux.git or1k-fpu-regs
head:   f15f5a5cbfc3fd7cb7c85a2ec2fdd2d45f0e1367
commit: f15f5a5cbfc3fd7cb7c85a2ec2fdd2d45f0e1367 [1/1] openrisc: Move FPU state out of pt_regs
config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/20240307/202403070749.Ik5HqvUp-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240307/202403070749.Ik5HqvUp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403070749.Ik5HqvUp-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/openrisc/kernel/entry.S: Assembler messages:
>> arch/openrisc/kernel/entry.S:855: Error: unrecognized form of instruction `l.sw TASK_THFPU state for handler to inspect.3'


vim +855 arch/openrisc/kernel/entry.S

   849	
   850	EXCEPTION_ENTRY(_fpe_trap_handler)
   851		CLEAR_LWA_FLAG(r3)
   852	
   853		/* Store the FPU state for handler to inspect. */
   854		l.mfspr	r3,r0,SPR_FPCSR
 > 855		l.sw	TASK_THFPU state for handler to inspect.3
   856	
   857		/* r4: EA of fault (set by EXCEPTION_HANDLE) */
   858		l.jal   do_fpe_trap
   859		 l.addi  r3,r1,0 /* pt_regs */
   860	
   861		l.j     _ret_from_exception
   862		 l.nop
   863	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
