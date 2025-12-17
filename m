Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6955337694
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 14:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765983294; cv=none; b=huRn+saFEpzHHRA9jvkYyDtJwbsBD0WE3h7fUQplrSxWIPt1aPVr5hv/qBhSG2QW92otxcZXCPBzh9l2QT187oHssrimsaK1Kf0CALb6WEDtqyeswEjVCHvAOkm9e5ZplrE7rQmBaqLgGaEZLju9Jc/SVO7tzHvm/YM/Dti4V28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765983294; c=relaxed/simple;
	bh=jbbZlpt8LHzWdDH9hPI4mqcGcQp1mqakX5oCanoUQVU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PhNmwX7MDi+mBZw5SDcESEs+Q0vQJY0motGEj4BIfHlG05FTIeikOl3gyGwfPyt+C+3BkAFl42rnwWd0tF4eQiTovxBrA3QI12dDXTuXPpUyYwMF6OpTHCwbFmJ3/CmqxATUbTwCECBc+nJb+sWScAcuANJi+ZbYnVJAX8AJWxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AY615mM3; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AY615mM3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765983291; x=1797519291;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jbbZlpt8LHzWdDH9hPI4mqcGcQp1mqakX5oCanoUQVU=;
  b=AY615mM3O0xNrm9kvOc+r1VR8mYHZhHZeo2bmVRJ1YRPGzxcsX1aj9Fu
   OBRTP9x/hau2LHfu9+76LIR8pOflaodOoxKjzyXgWEEmZCHz7Elx1W6Qv
   4l0t+wTBNbffEF2tvXhYB+dnvXnU8wJE3gkOgOESGUKkZRf0+YafLRZvu
   ME46AqvqKzs+g7rbQHIh1NUrfId6N3n2lujSF/El/84yNImQ4mlWqeZ5C
   IlDCpD3s4759HkiPfhuRU0RqI29/QFqP00bbFEpwjAymxy/m1zzDn3j1K
   Ru2NclFNFMA8yH5cCXlX0/tKNp8WKrIIYLKyz2eDxwPWRHn2Te7RLkD5C
   g==;
X-CSE-ConnectionGUID: j9ZQ08mpRMS7dniG+MbHBQ==
X-CSE-MsgGUID: 7Z5v0MXtREOXSsHsomf8nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="85338353"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="85338353"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 06:54:50 -0800
X-CSE-ConnectionGUID: khPNM5vkQrGyYJhGUmcOLA==
X-CSE-MsgGUID: vlEPDFAMQDiR6fcA+Hvucw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="197585213"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Dec 2025 06:54:50 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVsvP-000000000o3-3Tbq;
	Wed, 17 Dec 2025 14:54:47 +0000
Date: Wed, 17 Dec 2025 22:54:46 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 50/50]
 drivers/block/virtio_blk_ext.c:170:6: warning: no previous prototype for
 'virtblk_set_ext_feature'
Message-ID: <202512172208.BKsxbOXq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   1546e00ce4ffc99b7a0f7a3f7d29cfdd8c354001
commit: 7a001416425efc00ef3093e3bec76674cc7aa44b [50/50] anolis: virtio-blk: add ext_feature negotiation method and ring-pair feature bit
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20251217/202512172208.BKsxbOXq-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512172208.BKsxbOXq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512172208.BKsxbOXq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/block/virtio_blk.c:25:
   drivers/block/virtio_blk_ext.c:111:5: warning: no previous prototype for 'virtblk_get_ext_feature_bar' [-Wmissing-prototypes]
     111 | int virtblk_get_ext_feature_bar(struct virtio_device *vdev, u32 *bar_offset)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/virtio_blk_ext.c:155:5: warning: no previous prototype for 'virtblk_get_ext_feature' [-Wmissing-prototypes]
     155 | int virtblk_get_ext_feature(void __iomem *ioaddr, u32 *host_features)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/block/virtio_blk_ext.c:170:6: warning: no previous prototype for 'virtblk_set_ext_feature' [-Wmissing-prototypes]
     170 | void virtblk_set_ext_feature(void __iomem *ioaddr, u32 guest_ext_features)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/virtio_blk.c:1807:5: warning: no previous prototype for 'check_ext_feature' [-Wmissing-prototypes]
    1807 | int check_ext_feature(struct virtio_blk *vblk, void __iomem *ioaddr,
         |     ^~~~~~~~~~~~~~~~~


vim +/virtblk_set_ext_feature +170 drivers/block/virtio_blk_ext.c

   169	
 > 170	void virtblk_set_ext_feature(void __iomem *ioaddr, u32 guest_ext_features)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
