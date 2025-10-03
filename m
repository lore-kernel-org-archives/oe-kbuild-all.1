Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5FB2DC34D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Oct 2025 17:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759513014; cv=none; b=iaNknqTw66liYrgaJ0WKqdWMQ3HG8MJsJYsTLWgYvp0nJ/KksUytVQa0Z8P5NYJJuXOISVngk9ZRqXyx4wj+gDS8VXQq+IlkdvFXFCgLpr0DAdcMW3Eoiw9O8hDHmp6UbjEI4SqrQuZeiWrmIpvXUjzZOUYoDQZ7opvTA6sEfo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759513014; c=relaxed/simple;
	bh=7ZYKW0pPiNP5n6tlAxx1IEvgdqegBATjwH4C9fMcaW4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O/Qjb2JRLTeo6VyP+1C2fbstxGae14m/4rYrO6rDT4moo/tVPIC1p3ZbmfR2dxY1epODuIGksT74mQJbv3ogbfnUB8wXG0GFMbi5LtuE0nzqEvNjPTHKJok9dEO8r5ZoSO7SxjxuZtAiDDRtU4S3pxs0FLCSucMNlSY3ev7sUfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WiMP5udY; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WiMP5udY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759513012; x=1791049012;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7ZYKW0pPiNP5n6tlAxx1IEvgdqegBATjwH4C9fMcaW4=;
  b=WiMP5udYbImKYIyP2GBGHwfG/uiJQJT46BOzhn863CWkCspMkTgwtKqo
   TT0PAuFX6BVpTj1mbkUYegBJlcMF1khwESV5iAekAOjgONAbA7rxnmzeO
   EkAq3ayr5N6ekIEY8eBAlZpikiAof7JPz+R+r4xv0o6/WAa2IWYINEyq/
   fxaHRcWZ698MYYYTquS3tDQDV9hVvpIRzaLFrkQI4/sxc6HA97ONXreFI
   3tvsFYh+iWtyU4jfI0VhdBDCFlhnJQwN1GH6dX2iV6lBoiG7Ho4n54WIT
   vVo6rJKly8hl6Bw6KDl10YZOB4w15BKP3mLhSo5wiQKpIkZo2w4+tqj6k
   w==;
X-CSE-ConnectionGUID: LsnVKc96Tv6xXhgcSynVZw==
X-CSE-MsgGUID: UNOO2wWBS1OBysbFcrdipQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="61707897"
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; 
   d="scan'208";a="61707897"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2025 10:36:52 -0700
X-CSE-ConnectionGUID: oMnWl1pxQk+LKQngernfpg==
X-CSE-MsgGUID: Cmz9bYvES6mBnqKuvh4cYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; 
   d="scan'208";a="203086266"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Oct 2025 10:36:42 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4jhv-0004mJ-2o;
	Fri, 03 Oct 2025 17:36:39 +0000
Date: Sat, 4 Oct 2025 01:36:24 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.17/zen-sauce 2/29] drivers/scsi/vhba/vhba.c:192:23: error:
 variable 'vhost' set but not used
Message-ID: <202510040157.XNxYMtHU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.17/zen-sauce
head:   c962d79d9e0133c53f1b88081abc3e3ad54265a0
commit: 332c0f76c995d92d920da1a7ba19825db065a713 [2/29] ZEN: Add VHBA driver
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20251004/202510040157.XNxYMtHU-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251004/202510040157.XNxYMtHU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510040157.XNxYMtHU-lkp@intel.com/

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
