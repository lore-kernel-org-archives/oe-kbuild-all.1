Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F0734E74D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jun 2026 09:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782640493; cv=none; b=G5fNiYr3dfxM5Ngu0NkRZlt18V8itm31VTWZRRXYz8ZDXeq7xsKn/ihFAZ2s2ch/3bJt9WQGKAHud8D5Jbi1kTYckx7Oo8KiQdpfrAvmnnGk9YpC/a36WkvkEFT3Ytu6SiOmGh+AiBhpYoKu7RRnhBJJkdciLHHQmTawlni7W6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782640493; c=relaxed/simple;
	bh=qrvT87oVsu/51SKOjOmbvLzxz9HWjNLUPB1jDxQ20rs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ft/tXgXRg6Ml1BXVWa94Ee9jxZfe6Y3mr1YAAyeDVkwkwH+BP8vWhVZcrmhgKQMbbgtY639guVNemb033CbXYXQOe/D4TvjF7VK2vRHvQ00El9b5a7QkLseDLuvE9986P0LfkAnQy4lt6zoSQRZMqoTeCjOJI6EYXbkZUXpVGLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VLgrHkI1; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VLgrHkI1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782640491; x=1814176491;
  h=date:from:to:cc:subject:message-id;
  bh=qrvT87oVsu/51SKOjOmbvLzxz9HWjNLUPB1jDxQ20rs=;
  b=VLgrHkI1vIad/kilytVC9mS7l2kW9PXLx3tQBmub+AUGx+KF2GYi1exg
   2bM4qFk5QI73rfqF8yMgUb1NvNnGoAAFlcB/ooYTxGfqvs32nJ4Uvnjj3
   s6gTVamLkGA8egwvjN0bk2ldA+zgi0jQwdyhyq54XT5krhjAkbNEmV4tc
   u/ggsS++s3N/1rch6JkdhOB1+hg7fQT/N8scHcMw0iqdgCpxGbM85ZWX7
   v5GFqhQgY7RwzuHhCCWHFt0gNaE7VdvBnx4hLluwZAUrLK7xsfRb9CjUF
   tjLH/eTxG7CNZK6lRL2elo+F+NPvvZDx9zbNPEXBgvB85BzlbwXzFcGKM
   Q==;
X-CSE-ConnectionGUID: kY/2ovNoQiSjBMmEjnDWeg==
X-CSE-MsgGUID: jTcS3lXGQxaRV44+wyqPZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11830"; a="87267253"
X-IronPort-AV: E=Sophos;i="6.24,229,1774335600"; 
   d="scan'208";a="87267253"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2026 02:54:50 -0700
X-CSE-ConnectionGUID: qWgdm0nOQQiC0vgCWsT3Xg==
X-CSE-MsgGUID: 996c91haTiSiGHTi0c7U7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,229,1774335600"; 
   d="scan'208";a="289816891"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 28 Jun 2026 02:54:49 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wdmDu-000000006HB-0mWf;
	Sun, 28 Jun 2026 09:54:46 +0000
Date: Sun, 28 Jun 2026 17:54:24 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.1/zen-sauce 2/31] drivers/scsi/vhba/vhba.c:192:23:
 error: variable 'vhost' set but not used
Message-ID: <202606281754.XpRcX7Zc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 7.1/zen-sauce
head:   420dbda6d6b42784ca35e6b0596fd8e68c23b219
commit: 7c4891e860507a39b03f1a899b938089dffe3dcc [2/31] ZEN: Add VHBA driver
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260628/202606281754.XpRcX7Zc-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 6cc609bb250b21b47fc7d394b4019101e9983597)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260628/202606281754.XpRcX7Zc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606281754.XpRcX7Zc-lkp@intel.com/

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
