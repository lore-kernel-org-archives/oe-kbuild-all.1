Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838EB378804
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jan 2026 09:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769161746; cv=none; b=FMs2FoBRquXeQ6fGDwO27TP+NsoRt5AUviAdn6/wnKfNcFD38eV9z7aMgp3mxBEru5SiA/6jCh9iincpO1HZhGZDMAw3hrgzViXLFLiMyPVjbkmY2cUhYCuq0Xka09FvkMWLzyyaEByDD2mSeWMAxQIci5CIgkV58yXLJYJdAFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769161746; c=relaxed/simple;
	bh=ceSU15TBM/56CHhX2hlhXsBkS+QGYMHsjM5Arw2VYYk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kBlrVKTMIuR90zvT05h3WRDxurfxEcNHv+JcRWeDCCTHgUt/q4PG9YmVi/NJ5H90E6JHAZDDkgbpUsFvXw9hoGW+XbNCtSZGwv1dq7pjfdqyI22Dl/0/B/xt2TtUi6NwJHmudrUFZX+sDOS4JX3G3ZX4qfVrvCCW0t4k8fT1oAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QajNhbST; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QajNhbST"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769161736; x=1800697736;
  h=date:from:to:cc:subject:message-id;
  bh=ceSU15TBM/56CHhX2hlhXsBkS+QGYMHsjM5Arw2VYYk=;
  b=QajNhbSTyBZhFCQs+2NsCdgCOElF8NtsK3jJoqQfLwhRT/+xtivhgVM1
   DEaX77VciHEThI2QlwQCM5JLMUWFR8lSqRQddaDPBIhWKECsLyj3PL+ts
   VDDHk8dfvr/JYSftWdX08Ux4C1ZLV69SmndqqL9c7tOYhm+GPXDF9Ncy9
   Va57UaTo4kEd3VsTzCd/qWbEYQTEHdhEi53qCAO0xSSCi4am2xHbax/J3
   c4ptwX8QcRGqTNpEyMw8p+N8nODhwea7jpGLlQfbBdqw2+AEnzxY6/PKn
   7HHH/V9aS5lpLl8uEIK2PFcwXZN7PqHVvN3DEDt//x5EPLcIG/dzy138Q
   Q==;
X-CSE-ConnectionGUID: y/RO9O+KTxKgqb2qWtgybg==
X-CSE-MsgGUID: RiGht3BUSk+/bYvuc/mxbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="81856254"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="81856254"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 01:48:46 -0800
X-CSE-ConnectionGUID: aYeVrwPFT++G9Uzfqnte/g==
X-CSE-MsgGUID: 88h4ESy4RfemhvSW36shxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="206590648"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 23 Jan 2026 01:48:44 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjDmT-00000000Tlq-2z8c;
	Fri, 23 Jan 2026 09:48:41 +0000
Date: Fri, 23 Jan 2026 17:48:18 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 18/18]
 drivers/vfio/fsl-mc/vfio_fsl_mc.c:296:24: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202601231742.WDcxCGUz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   f440fa382add8d0ec84acc3fd7e5785e10af1ded
commit: f440fa382add8d0ec84acc3fd7e5785e10af1ded [18/18] TMP: Revert "module: Add compile-time check for embedded NUL characters"
config: powerpc-randconfig-r121-20260123 (https://download.01.org/0day-ci/archive/20260123/202601231742.WDcxCGUz-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260123/202601231742.WDcxCGUz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601231742.WDcxCGUz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/vfio/fsl-mc/vfio_fsl_mc.c:296:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] header @@     got restricted __le64 [usertype] @@
   drivers/vfio/fsl-mc/vfio_fsl_mc.c:296:24: sparse:     expected unsigned long long [usertype] header
   drivers/vfio/fsl-mc/vfio_fsl_mc.c:296:24: sparse:     got restricted __le64 [usertype]

vim +296 drivers/vfio/fsl-mc/vfio_fsl_mc.c

1bb141ed5e14f7 Diana Craciun  2020-10-05  274  
1bb141ed5e14f7 Diana Craciun  2020-10-05  275  static int vfio_fsl_mc_send_command(void __iomem *ioaddr, uint64_t *cmd_data)
1bb141ed5e14f7 Diana Craciun  2020-10-05  276  {
1bb141ed5e14f7 Diana Craciun  2020-10-05  277  	int i;
1bb141ed5e14f7 Diana Craciun  2020-10-05  278  	enum mc_cmd_status status;
1bb141ed5e14f7 Diana Craciun  2020-10-05  279  	unsigned long timeout_usecs = MC_CMD_COMPLETION_TIMEOUT_MS * 1000;
1bb141ed5e14f7 Diana Craciun  2020-10-05  280  
1bb141ed5e14f7 Diana Craciun  2020-10-05  281  	/* Write at command parameter into portal */
1bb141ed5e14f7 Diana Craciun  2020-10-05  282  	for (i = 7; i >= 1; i--)
1bb141ed5e14f7 Diana Craciun  2020-10-05  283  		writeq_relaxed(cmd_data[i], ioaddr + i * sizeof(uint64_t));
1bb141ed5e14f7 Diana Craciun  2020-10-05  284  
1bb141ed5e14f7 Diana Craciun  2020-10-05  285  	/* Write command header in the end */
1bb141ed5e14f7 Diana Craciun  2020-10-05  286  	writeq(cmd_data[0], ioaddr);
1bb141ed5e14f7 Diana Craciun  2020-10-05  287  
1bb141ed5e14f7 Diana Craciun  2020-10-05  288  	/* Wait for response before returning to user-space
1bb141ed5e14f7 Diana Craciun  2020-10-05  289  	 * This can be optimized in future to even prepare response
1bb141ed5e14f7 Diana Craciun  2020-10-05  290  	 * before returning to user-space and avoid read ioctl.
1bb141ed5e14f7 Diana Craciun  2020-10-05  291  	 */
1bb141ed5e14f7 Diana Craciun  2020-10-05  292  	for (;;) {
1bb141ed5e14f7 Diana Craciun  2020-10-05  293  		u64 header;
1bb141ed5e14f7 Diana Craciun  2020-10-05  294  		struct mc_cmd_header *resp_hdr;
1bb141ed5e14f7 Diana Craciun  2020-10-05  295  
1bb141ed5e14f7 Diana Craciun  2020-10-05 @296  		header = cpu_to_le64(readq_relaxed(ioaddr));
1bb141ed5e14f7 Diana Craciun  2020-10-05  297  
1bb141ed5e14f7 Diana Craciun  2020-10-05  298  		resp_hdr = (struct mc_cmd_header *)&header;
1bb141ed5e14f7 Diana Craciun  2020-10-05  299  		status = (enum mc_cmd_status)resp_hdr->status;
1bb141ed5e14f7 Diana Craciun  2020-10-05  300  		if (status != MC_CMD_STATUS_READY)
1bb141ed5e14f7 Diana Craciun  2020-10-05  301  			break;
1bb141ed5e14f7 Diana Craciun  2020-10-05  302  
1bb141ed5e14f7 Diana Craciun  2020-10-05  303  		udelay(MC_CMD_COMPLETION_POLLING_MAX_SLEEP_USECS);
1bb141ed5e14f7 Diana Craciun  2020-10-05  304  		timeout_usecs -= MC_CMD_COMPLETION_POLLING_MAX_SLEEP_USECS;
1bb141ed5e14f7 Diana Craciun  2020-10-05  305  		if (timeout_usecs == 0)
1bb141ed5e14f7 Diana Craciun  2020-10-05  306  			return -ETIMEDOUT;
1bb141ed5e14f7 Diana Craciun  2020-10-05  307  	}
1bb141ed5e14f7 Diana Craciun  2020-10-05  308  
1bb141ed5e14f7 Diana Craciun  2020-10-05  309  	return 0;
fb1ff4c1941573 Bharat Bhushan 2020-10-05  310  }
fb1ff4c1941573 Bharat Bhushan 2020-10-05  311  

:::::: The code at line 296 was first introduced by commit
:::::: 1bb141ed5e14f773f9e08b80fe5db3fd405399db vfio/fsl-mc: Add read/write support for fsl-mc devices

:::::: TO: Diana Craciun <diana.craciun@oss.nxp.com>
:::::: CC: Alex Williamson <alex.williamson@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
