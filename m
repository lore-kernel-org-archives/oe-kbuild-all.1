Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D88119E971
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Dec 2024 21:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734040792; cv=none; b=uTL+LSFVgYKTTEgNMIqzE2ddnCSPqgtRrRtqVF465BBBXm+yyjiJojLeK2DCNRRL6h5kZwG2PmCpeQvFsCgKCPvbmreihbRGOV+OgupWxUM1HlZ1d8q7NtbX9X+wfq/YQxgoBMI8P1EUzBhzCAx0jcAAC41mno4MbqTubBeEnCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734040792; c=relaxed/simple;
	bh=DYp+uMOYO/qm19Sll3A62v0HuMo8WAQ/N5NYDnXXCew=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oH1SswQYN9IgAqszYT5o54Cmob/GRSm0Dug6u/L+Xh+fqo+TPuxvGy52cGqWtKofAjTt4r4POoriMWYElov/GLfmraTmkzuM9Y4hhdCmmeccy/2zfVuyR/luG2P7U8JMcXhON9kYOBI5DcViWJLkZFAE1qPjlMBKhygMhMC6AYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aCQsLWhW; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aCQsLWhW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734040790; x=1765576790;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DYp+uMOYO/qm19Sll3A62v0HuMo8WAQ/N5NYDnXXCew=;
  b=aCQsLWhWTOt3PVBeyqRUsVMTbskP/A/sAFjOiIrDd9sU6Bs+jwgnoid7
   0wyieX86cjKri/gcVhnODrXp5kAsc01BpmA+VwnXAwV0I3CHE+timlQry
   q5rGSGC7RpWjhpWEZU4qxhQ8M7YY3XuWLUOCOm0gYeEiF5g5Q9kpNbtul
   XMgS79aWDLccXYfzI0OD66Wk+S/Ri8MdUaVP6lCuLT/M9NS6esOZDXc9Z
   Ht01hyzuLtzXHSqkFhP+qkSh8Q7zQ16H+YOEB+K85Sopmm0z/vZ9YSefX
   vcoZIPa4UqDdmQFjRYfY9RjzTAhVi1tCzmd7o+oF1IFagF7c2UXOGVnHi
   Q==;
X-CSE-ConnectionGUID: xbHlGLC6TBSuFeLjiWE5ig==
X-CSE-MsgGUID: UCpB3Pa4Q5icGJiuRTWkcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="52009029"
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; 
   d="scan'208";a="52009029"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 13:59:49 -0800
X-CSE-ConnectionGUID: 3XGEEM0wQsW/D48v5VkKMQ==
X-CSE-MsgGUID: q6X4MXJdQrqx3yeukctvbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101314311"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Dec 2024 13:59:45 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLrDi-000BPN-0v;
	Thu, 12 Dec 2024 21:59:42 +0000
Date: Fri, 13 Dec 2024 05:58:53 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2579/2579]
 drivers/gpu/drm/inspur/inspur_drm_drv.c:30:13: warning: no previous
 prototype for 'inspur_drm_interrupt'
Message-ID: <202412130515.0Aw10X06-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hongchen,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   ff5378fff024fcb2552e6da22811cf933fe4a4c0
commit: b9d65551a3adfa87a7c5d33391187ee60a1b501d [2579/2579] drm: add inspur drm driver support
config: arm64-randconfig-001-20241213 (https://download.01.org/0day-ci/archive/20241213/202412130515.0Aw10X06-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241213/202412130515.0Aw10X06-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412130515.0Aw10X06-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/inspur/inspur_drm_drv.c:30:13: warning: no previous prototype for 'inspur_drm_interrupt' [-Wmissing-prototypes]
      30 | irqreturn_t inspur_drm_interrupt(int irq, void *arg)
         |             ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/inspur/inspur_drm_drv.c: In function 'inspur_pci_probe':
   drivers/gpu/drm/inspur/inspur_drm_drv.c:379:36: warning: unused variable 'priv' [-Wunused-variable]
     379 |         struct inspur_drm_private *priv;
         |                                    ^~~~


vim +/inspur_drm_interrupt +30 drivers/gpu/drm/inspur/inspur_drm_drv.c

    27	
    28	
    29	DEFINE_DRM_GEM_FOPS(inspur_fops);
  > 30	irqreturn_t inspur_drm_interrupt(int irq, void *arg)
    31	{
    32		struct drm_device *dev = (struct drm_device *)arg;
    33		struct inspur_drm_private *priv =
    34			(struct inspur_drm_private *)dev->dev_private;
    35		u32 status;
    36	
    37		status = readl(priv->mmio + INSPUR_RAW_INTERRUPT);
    38	
    39		if (status & INSPUR_RAW_INTERRUPT_VBLANK(1)) {
    40			writel(INSPUR_RAW_INTERRUPT_VBLANK(1),
    41			       priv->mmio + INSPUR_RAW_INTERRUPT);
    42			drm_handle_vblank(dev, 0);
    43		}
    44	
    45		return IRQ_HANDLED;
    46	}
    47	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
