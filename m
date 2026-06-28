Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1862A1DC985
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jun 2026 08:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782635507; cv=none; b=mx5yXsH0P2mXS550kO7OUsmiiQ7nsBhDl+p9fVPt8dUKrC+CiLUkJeH1VqmjzP40Q7UeY25q5wg3ogRy4aBnUIh9h4KHCaLr4tYhlZJjjDTEVoo5/RkIwtt7RFVpRGP/ZcgkcCUimhUzO0blkBQ5HKXuIXwb0LJ795+cYj6/f5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782635507; c=relaxed/simple;
	bh=8YMfA6Edy8ogliU0gz+QgVjG5uzg67MYUyvs/8B9OhI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=vFAL3QPCTCWfRPF8RXOgHqSF3oZZIqDp5B3jROG9PUZXHDg0ebEqvpQw5SJlHJCM1APugVbUFQyiA8fWQPeXiL62ynKPfJKXXpMh/sqHH6nKnP8DZitMlRBuY6HFYFC5PnYZgz0unC/F6O8Liv9GatZxx0DgMHw9aal2J9mALDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e1QUw3+3; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e1QUw3+3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782635505; x=1814171505;
  h=date:from:to:cc:subject:message-id;
  bh=8YMfA6Edy8ogliU0gz+QgVjG5uzg67MYUyvs/8B9OhI=;
  b=e1QUw3+3l/ZXinT5bZgAouavDrEOlgh/wqufN8IlM/3etGFnO7E1gRpz
   t8ABRbG/V2D0aIgpwq7tGTXSc5K2HOFWDVRkSj3IEH0oo8XYWswZkD3XR
   yZqcmpS4sV3474N8YCRa+yR5qRylVM/hFsO/zw7wfco2XBI00m8PAtS/0
   AriMxrQ3lPl4qLmPJDybWSrtthb9ao2XKzwg5B/1hu3XYBjIFJinfHLux
   RTI5bUOun9KPYPz5QrcCQ/KLjoCDj7XmrUHqYh6r/dDXULbzGxYmwGMOf
   IxvZM/I2wIt1j/2p4+kaO9tSLgW4iYZj7WH0qLKWs1I+ATMOfouOATCV6
   A==;
X-CSE-ConnectionGUID: ZaNNrtdUScKowna+dAn2jw==
X-CSE-MsgGUID: iOpmJTndQ5qBFIBojFAZ2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11830"; a="87197601"
X-IronPort-AV: E=Sophos;i="6.24,229,1774335600"; 
   d="scan'208";a="87197601"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2026 01:31:44 -0700
X-CSE-ConnectionGUID: aWwzA0eETBm/cVH6oRQNyQ==
X-CSE-MsgGUID: 75qZw98/TcqXSvc1UQnjng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,229,1774335600"; 
   d="scan'208";a="252330780"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 28 Jun 2026 01:31:43 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wdkvU-000000006GL-1Bx3;
	Sun, 28 Jun 2026 08:31:40 +0000
Date: Sun, 28 Jun 2026 16:30:57 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.1/zen-sauce 2/31] drivers/scsi/vhba/vhba.c:192:23:
 error: variable 'vhost' set but not used
Message-ID: <202606281627.PEVMEFpr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 7.1/zen-sauce
head:   420dbda6d6b42784ca35e6b0596fd8e68c23b219
commit: 7c4891e860507a39b03f1a899b938089dffe3dcc [2/31] ZEN: Add VHBA driver
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260628/202606281627.PEVMEFpr-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260628/202606281627.PEVMEFpr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606281627.PEVMEFpr-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/scsi/vhba/vhba.c: In function 'vhba_device_queue':
>> drivers/scsi/vhba/vhba.c:192:23: error: variable 'vhost' set but not used [-Werror=unused-but-set-variable=]
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
