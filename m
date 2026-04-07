Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E8934F255
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 04:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534679; cv=none; b=b5YZ5k+iHr4AUhGVg4+0Bg6axcNfjl4nD78bclrqA58itwI79pwslmMK70mLT4tLjdJSrfMKuZMKbwRN0z4wCawVX52X3NKaShXq4n+gZcNdqTmRmOiQySOPUyMkII7kSMqZNbj8zUmsPSIsBTLHQ4WiL+mmFUzxeYVHE2XA9YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534679; c=relaxed/simple;
	bh=VPDURLZtQ9exond7D6tItqT1TkPy/x5hr4JIKx4pS6k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q9PIOtm1SZTCynBd2wmbn/96oWBPpi7jwuVqlGSFqQR6EaFBfMNbRRsOb3foR81bq1j0xeNJ5GUqbPb8yNT39lKEQvvZSxJKedYaxI7G7jyc1B/mvb3YboSO1+VzAz6uy3CZ/0KQY9Q9+lsuQkBISRZ69Rl5Vt1YohqWYQHumzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cdqT03kN; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cdqT03kN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534678; x=1807070678;
  h=date:from:to:cc:subject:message-id;
  bh=VPDURLZtQ9exond7D6tItqT1TkPy/x5hr4JIKx4pS6k=;
  b=cdqT03kNeyIhCMkGprfT4546iTcpuGqQk9sTdVakM5SyyUTgVG4YUMIo
   YJ5BdFWqBKkttiFMD+D0j0F81YzrqFBBklDVHDkygfv8yOZUhLU+GCcyT
   rDVMRTSHQ7tEW543aST/gqS6Y/ZKC5c1kCG/EbI0v26GiNn7yDlJM1YrL
   RyZDj6K/kO37TyG7tMCXdj3kP0mpDkHW3/EFJXz1QnDTTJaV9JcnpCMVJ
   Oj7gxnDJ+dKLKqlfH5qM6JN4S54u8v2dwlaQWy2uTzJllnLjLto//LOu1
   vxRoHcH4nid868KZPHCWySaI9lhLQCr00QtWMvrrGeD94ePQpewSSJC/k
   g==;
X-CSE-ConnectionGUID: tWUAk5TkQz2yNNmZVKkD5w==
X-CSE-MsgGUID: XoqOBOewQViac0tDmU7FNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87193697"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="87193697"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 21:04:38 -0700
X-CSE-ConnectionGUID: 73dgpN5KSQe/ar2BAS1Irg==
X-CSE-MsgGUID: fTIMY3nkQ7yUSbq62FJv5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="228319728"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 Apr 2026 21:04:37 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xg2-0000000009T-19tu;
	Tue, 07 Apr 2026 04:04:34 +0000
Date: Tue, 07 Apr 2026 12:03:59 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.19/zen-sauce 2/34] drivers/scsi/vhba/vhba.c:192:23:
 error: variable 'vhost' set but not used
Message-ID: <202604071151.ZXsUoGYa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 6.19/zen-sauce
head:   d17b2b02b5cf029f5248299f56e4a0a041548604
commit: d0b6bde752e9f31adb57b06fb0e3f05c47e99d94 [2/34] ZEN: Add VHBA driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260407/202604071151.ZXsUoGYa-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260407/202604071151.ZXsUoGYa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604071151.ZXsUoGYa-lkp@intel.com/

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
