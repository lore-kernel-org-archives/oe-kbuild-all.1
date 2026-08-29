Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3678418368
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Aug 2026 23:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788047206; cv=none; b=HOXCsjVyeB+ajslOuozy/uNfXDbGoU2tGi+S9Si1PM0W9VzrTyH2swYdssUYuFIBD3Jm9DxjOE7Bo0Va+PprK+/hOKfJSph2A/vuH7ysoHIL09BmaR2xxrMRGT7ainfVCJq1OO6WLHlANbdPaFL6H7JMTSauL4KI4HpHZEu+UK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788047206; c=relaxed/simple;
	bh=LCgBBs0O+PzChpOtdGjs2ABqlJKMlIXvIPg6aN3Khb4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C1c5E3g3z9av2sYdPMcaWQAmJA3GyuJSKfgc3o7Ayx6B5iaeveit9sJl3bo8zml2MVRwOyr1yr3d/0V2zrOsCcDiv2yA7W/6tB/8njZEVUN86FEcuNiGMiNuhns1rtS9eNlxxH/Aaw0eal+LYrRqNEkpZNZHVSZPYNYOB81EBUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VVi9N1/X; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VVi9N1/X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788047204; x=1819583204;
  h=date:from:to:cc:subject:message-id;
  bh=LCgBBs0O+PzChpOtdGjs2ABqlJKMlIXvIPg6aN3Khb4=;
  b=VVi9N1/Xt7By3q1N+IVq2gEk2ieDOG3KCM/cIsT7gviM932u7+7Jquoh
   WGtd6XBi78WDgjCf616zON0CDprM+odvM6PtMgNL3i+roWz4FRWEigfig
   srsETbK1ku5JqBr2A9l45NK5+cnJ4VOmoKxQltZnhgSv3G9wXP6kvr3JY
   oYDahMOeXy0r6w+uylXz1FD6gd0vqiltyDPVvmcO2AElG2NJVACu+sKz4
   plRskiiviH70u+6E/eJ7k1ZijvZsllxS1HmJFhl0bVd+e+5dIw2fBU6iw
   7IFKY8fArGGb56LJqL96fisxAhIOuFbp8p1heD/yOVEDi9dVcVchS+Zvu
   w==;
X-CSE-ConnectionGUID: W8DAzGRKT+ix7sDaap6DSg==
X-CSE-MsgGUID: HXdmHR0GQKeppPhH6AWlGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11890"; a="114041310"
X-IronPort-AV: E=Sophos;i="6.25,251,1779174000"; 
   d="scan'208";a="114041310"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2026 16:46:43 -0700
X-CSE-ConnectionGUID: qNMOFv7MTL+dOTglZS8s9w==
X-CSE-MsgGUID: RxXLX8x8S5eLUS91Hs08Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,251,1779174000"; 
   d="scan'208";a="267910349"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Aug 2026 16:46:42 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0Skx-00000000DOy-3Od3;
	Sat, 29 Aug 2026 23:46:39 +0000
Date: Sun, 30 Aug 2026 07:46:37 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.2/zen-sauce 2/26] drivers/scsi/vhba/vhba.c:192:23:
 error: variable 'vhost' set but not used
Message-ID: <202608300752.IHSEB0Rz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 7.2/zen-sauce
head:   299e73098bef8870b60c6ce830084457d222b0f5
commit: 429980f9a64cd983a4ad0c636518e1a4217c7303 [2/26] ZEN: Add VHBA driver
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260830/202608300752.IHSEB0Rz-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 52774473867e49b5891ab9381accf4e5a3ce0024)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260830/202608300752.IHSEB0Rz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608300752.IHSEB0Rz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/scsi/vhba/vhba.c:192:23: error: variable 'vhost' set but not used [-Werror,-Wunused-but-set-variable]
     192 |     struct vhba_host *vhost;
         |                       ^
   1 error generated.


vim +/vhost +192 drivers/scsi/vhba/vhba.c

   189	
   190	static int vhba_device_queue (struct vhba_device *vdev, struct scsi_cmnd *cmd)
   191	{
 > 192	    struct vhba_host *vhost;
   193	    struct vhba_command *vcmd;
   194	    unsigned long flags;
   195	
   196	    vhost = platform_get_drvdata(&vhba_platform_device);
   197	
   198	    vcmd = vhba_alloc_command();
   199	    if (!vcmd) {
   200	        return SCSI_MLQUEUE_HOST_BUSY;
   201	    }
   202	
   203	    vcmd->cmd = cmd;
   204	
   205	    spin_lock_irqsave(&vdev->cmd_lock, flags);
   206	#if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 15, 0)
   207	    vcmd->metatag = scsi_cmd_to_rq(vcmd->cmd)->tag;
   208	#else
   209	    vcmd->metatag = vcmd->cmd->request->tag;
   210	#endif
   211	    list_add_tail(&vcmd->entry, &vdev->cmd_list);
   212	    spin_unlock_irqrestore(&vdev->cmd_lock, flags);
   213	
   214	    wake_up_interruptible(&vdev->cmd_wq);
   215	
   216	    return 0;
   217	}
   218	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
