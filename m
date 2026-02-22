Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DF735028D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Feb 2026 18:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771786796; cv=none; b=dHZsM8MCUEbVs+inSSpk9E/vA8JdhAOtV7M+rv+8vRjHgG6ejoYuF53cOCo8qjo6zrgq9w6XQNu/UuuUj9RhikGNn6uJ0O/CLJNc4kxeuYkn6L5ydjT2xt6d0OOheUgCHbmZlOCh3jHAlddvKIdTsbKv1+3RIKgF5kq0MpYKMjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771786796; c=relaxed/simple;
	bh=rfAz8RA3krFOY0Dr2FCKhwUQHKfmwWA7LvFAapaXJLM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VX83NNVoIEV6qZpdfdTdZhb2iDoUWt7ZHCiaV7VXkCDP5/Ovv+wzliddYZX/5RFDcKu+iPuSvO3oC/cQ/aeo1v/28wtxeAuS+qL/pQhdcUezns3Dqzq4G/UYAbI34s0wv+Pb4livKPgStnRyTk9xeG0a7ha6SyroLkWb+8kYaTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TOktZfF0; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TOktZfF0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771786795; x=1803322795;
  h=date:from:to:cc:subject:message-id;
  bh=rfAz8RA3krFOY0Dr2FCKhwUQHKfmwWA7LvFAapaXJLM=;
  b=TOktZfF06gHSlKMAXjA6fOH9SkH1BqbtSkaNa5ILuTjuvHQQOQK3Tf4X
   hCjxF7ywocIjDCOqTj/DzsAxs4xcatw2dPdEPWj8fF1DLPZSKWKZsdRzz
   OBa8XOOlviDR3fVmh9PkrgzDUFGP/eUhr7mzVe+FqYGGAJmgaEA888yt6
   14dwpg/UiztovfGqBPacP0+vtFXMKMkkd8ZkIwEPYoim7bQ0eqzirBTXy
   vCUywbJo9ZZlOjBuNMEOpmW2BC1V0dw538vVcY1mGyOCmxIpFPeI7+u6Y
   Zn1Kuo5F4it4x1r43gLFTL9bTpjquptshd0nGJ+pGTqQKfYMUgm9i9bcC
   g==;
X-CSE-ConnectionGUID: ToU6WlqZRgqaRYsuewQo2w==
X-CSE-MsgGUID: h54SAilySPCd/CSe6AyIAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="76657898"
X-IronPort-AV: E=Sophos;i="6.21,305,1763452800"; 
   d="scan'208";a="76657898"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2026 10:59:54 -0800
X-CSE-ConnectionGUID: uaLquzeTT1KyXZopWjfMrw==
X-CSE-MsgGUID: OzsPp0YdTw6AUt6ZlvgviQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,305,1763452800"; 
   d="scan'208";a="213797331"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 22 Feb 2026 10:59:53 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuEgI-000000015f2-3JKU;
	Sun, 22 Feb 2026 18:59:50 +0000
Date: Mon, 23 Feb 2026 02:58:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 0/1]
 drivers/usb/gadget/configfs.c:1620:2: error: implicit declaration of function
 'acc_disconnect'
Message-ID: <202602230256.yQDLp1xq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Ronak,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   971288cc479ceec2e82d57cd8a7ad8af48cc0828
commit: 80fef39de7e9dbe706d0cbc820a09b5c05dc366f [0/1] ANDROID: usb: gadget: Resolve NULL pointer dereference in composite_disconnect
config: i386-randconfig-013-20260223 (https://download.01.org/0day-ci/archive/20260223/202602230256.yQDLp1xq-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e86750b29fa0ff207cd43213d66dabe565417638)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260223/202602230256.yQDLp1xq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602230256.yQDLp1xq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/gadget/configfs.c:1620:2: error: implicit declaration of function 'acc_disconnect' [-Werror,-Wimplicit-function-declaration]
    1620 |         acc_disconnect();
         |         ^
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]


vim +/acc_disconnect +1620 drivers/usb/gadget/configfs.c

  1603	
  1604	static void configfs_composite_disconnect(struct usb_gadget *gadget)
  1605	{
  1606		struct usb_composite_dev *cdev;
  1607		struct gadget_info *gi;
  1608		unsigned long flags;
  1609	
  1610		cdev = get_gadget_data(gadget);
  1611		if (!cdev)
  1612			return;
  1613	
  1614	#ifdef CONFIG_USB_CONFIGFS_F_ACC
  1615		/*
  1616		 * accessory HID support can be active while the
  1617		 * accessory function is not actually enabled,
  1618		 * so we need to inform it when we are disconnected.
  1619		 */
> 1620		acc_disconnect();
  1621	#endif
  1622		gi = container_of(cdev, struct gadget_info, cdev);
  1623		spin_lock_irqsave(&gi->spinlock, flags);
  1624		cdev = get_gadget_data(gadget);
  1625		if (!cdev || gi->unbind) {
  1626			spin_unlock_irqrestore(&gi->spinlock, flags);
  1627			return;
  1628		}
  1629	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
