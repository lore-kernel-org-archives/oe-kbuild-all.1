Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61AFF26D4E5
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 07:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775545927; cv=none; b=kb9qh7f9DEODdZuEgTnGseM3ZrWcIzunPXy3zJn7IccXe48/wG53yeCYKYRv3Ayvemvbq5tLrugRcvyrBxCXBULZSSQpEikt8Rq/6E+IH8WXS3mAWHB7wZqRAjZ0R5YTVV570hHOOKBjZZ6LovbgFWyCzzDHcI6seldgsmhjDDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775545927; c=relaxed/simple;
	bh=7/uNCjYYX/Mw0TF8w88fRcvZKBYAw9raXkV2dVKLCd4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ijXoYRKT9nntUO31DsniCdNLjtyz7Vqp/Zdl5GA2JZIPJKSXMzS0Ib00DYpsh6mKaNzM7QMS37Yxy6U34l04ulnN5WMo6zJ7FGhK9E0aQ+8PnJ1p5yTbg6/1pMYR1W7/yIuZJncYWe3sodIoCvrQZxlyoBFsw1Vi/zWXZ4ofvBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AhyVDq8a; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AhyVDq8a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775545926; x=1807081926;
  h=date:from:to:cc:subject:message-id;
  bh=7/uNCjYYX/Mw0TF8w88fRcvZKBYAw9raXkV2dVKLCd4=;
  b=AhyVDq8a+P92cU45rph2yD3dIScLTdbRSgBseTqBO9zmMAeuJzROHcMN
   cYCKjCGMnBaVb2ghhhLfM7dKyY1YYQdbpuS1o/wxyrt5VJtv7/3kfoNSt
   Gj96X71byVjZ9+VBCBFFWO1NAROmepzRQ+QqG6llkP9R7Icp7kHnRFtKc
   MMkh29TQHsWpvvakWz4Fz1aZsXYYu1xteUPKySh7b9TtI4H+uOFJrUC7m
   BftClxxszAmhp8f8vbKjn+fOwC1A+nmJPiyIIpzmTy8D3ScOroo5qtzTB
   fy+99sV1V3+7VzEN1DUF1tKogGPI441+dDpwEvo1k5ZCiV2F6lzrxxz3h
   g==;
X-CSE-ConnectionGUID: lUPC46daR1CeQPESFS4l5w==
X-CSE-MsgGUID: aj27uVNYQgefUJ31vLgp9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="94081798"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="94081798"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 00:12:06 -0700
X-CSE-ConnectionGUID: 2jrDxCoeQRK6ccQLYhdSoQ==
X-CSE-MsgGUID: cb/qQIdPTsaZlrVhZU/Wzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="251379392"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Apr 2026 00:12:05 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wA0bS-000000000Ih-44bX;
	Tue, 07 Apr 2026 07:12:02 +0000
Date: Tue, 07 Apr 2026 15:11:44 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.19/zen-sauce 2/34] drivers/scsi/vhba/vhba.c:192:23:
 error: variable 'vhost' set but not used
Message-ID: <202604071501.enNDQjAI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 6.19/zen-sauce
head:   d17b2b02b5cf029f5248299f56e4a0a041548604
commit: d0b6bde752e9f31adb57b06fb0e3f05c47e99d94 [2/34] ZEN: Add VHBA driver
config: nios2-randconfig-r073-20260406 (https://download.01.org/0day-ci/archive/20260407/202604071501.enNDQjAI-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 9.5.0
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260407/202604071501.enNDQjAI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604071501.enNDQjAI-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/scsi/vhba/vhba.c: In function 'vhba_device_queue':
>> drivers/scsi/vhba/vhba.c:192:23: error: variable 'vhost' set but not used [-Werror=unused-but-set-variable]
     192 |     struct vhba_host *vhost;
         |                       ^~~~~
   cc1: all warnings being treated as errors


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
