Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE11684A35
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Feb 2026 16:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771260560; cv=none; b=ScyAU+x1PgKzCtJJdmDBXLuJ8ar+dP0lMQ8kXwGPamn+G6h1wQ8XaSu6tGHbhECSx3qsJq82y+6fbknrMztCxx1vx2ZOsMrGfrAJCRJm6yBiul34/TQepsK9o/K2qy7OGoetQjzWHke0e6JyJdgC/bZUJQOgYtiP6TH0eOYtsq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771260560; c=relaxed/simple;
	bh=ByfD1jLMls/Ui3qkcVJRTB55fZBDHdize3Aa2PfzRok=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qL1WnGzYtlNQlgHLRRk1j0W8FEXv363dhOHTrghKLnlrjZj0PILWcOlRt8JiF/iVfFHVoPSfzymDzuOdr+dDR6HNionxZ7CTHUPfeROdLZ7MQ09gPDxL580n7JXCdu+ROJwW5YNILs5uowkcWGA54Y/r81dvbaDnORH+rLRqb1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q+pQT7uF; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q+pQT7uF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771260559; x=1802796559;
  h=date:from:to:cc:subject:message-id;
  bh=ByfD1jLMls/Ui3qkcVJRTB55fZBDHdize3Aa2PfzRok=;
  b=Q+pQT7uFJTMtqmZheoZZZQwzxZOWM+mS37vGwgktQ0eLz97naLTTFRYS
   9kWvNF085uak0IXI/QPTxXxouPpJbOE/9ks89UlhpaAHt/Mpp5HA5IUgA
   GnOIBDyuxEJQCspVNpXTH30JDsI6bX9hDIKrOPhCez0M3jK3+xrNcHLuA
   v0L6866hfG1ozD2QwBSqK0AfGBdW/XSs74rRQ6qDZI/oMEbdA5QT5vQpI
   D7egheIGB2yiOA6aORb+LRPhcH7fqWmYf3HM1LNZUI69K7hZGPhXHrAql
   ptN7j/yb39OCF1y4X+3Q3SS1/wa95DnadkCfmzgoroWy68CdGTbsViN7/
   g==;
X-CSE-ConnectionGUID: nIj523dLT0Ocu5EqA8sMBQ==
X-CSE-MsgGUID: SgI8sW3SRc+nAYKjiao5JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72242012"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="72242012"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 08:49:19 -0800
X-CSE-ConnectionGUID: ixZhJ8hQRdm3JD9vagyckw==
X-CSE-MsgGUID: 9Vp5fC+sTxq7Zw4pugVCJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="212197357"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Feb 2026 08:49:17 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vs1md-00000001064-0yk1;
	Mon, 16 Feb 2026 16:49:15 +0000
Date: Tue, 17 Feb 2026 00:48:51 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.18/zen-sauce 2/29] drivers/scsi/vhba/vhba.c:192:23:
 error: variable 'vhost' set but not used
Message-ID: <202602170009.gAgfxev9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 6.18/zen-sauce
head:   0c87fdcd1f9f7f1a09e8928422160159b8966784
commit: 64164f0372696265baef02378f2ce21a82a6c8ab [2/29] ZEN: Add VHBA driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260217/202602170009.gAgfxev9-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602170009.gAgfxev9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602170009.gAgfxev9-lkp@intel.com/

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
