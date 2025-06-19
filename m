Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB721581F8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jun 2025 20:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750365165; cv=none; b=BGr2CtxTyOI/epRfk3Cr220kRhBeD9994aESzH5wH2YXnYc2DYziqm63n2dxwEVhT2G+oqAaSJoUgxHrjkHNugbhO1lQwpZfCdq1i9962R7ZPCdb1qUVU7Ku4XdVxBEQGTGxuz0+gt3A37B+dWB3+ijwavOlpRkLaKEIpGTrbus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750365165; c=relaxed/simple;
	bh=+B3ZPBab3ajgpa+4/galRtOXaPYDYayjqTN/eo8n7hk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J13DJvpIuSrbKuU7tF3W7GaPtVZLimSs4M3g46L9GSGrppezDiRYZsVuYthtFtX658H0/wBMju4bKbC8jRLg31DKS/38AwU0sdT8jDL4MLh7ThRT+o9T792MieOxYaZmC8/cO2KYKh+WI6pxut2yR4fZ7+iyOgg1qlu4ngJPPk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hma0lGCI; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hma0lGCI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750365164; x=1781901164;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+B3ZPBab3ajgpa+4/galRtOXaPYDYayjqTN/eo8n7hk=;
  b=Hma0lGCI5MLzrJ96IPvpY7ga2CulIhjS1KJaThIYpQvcz4KsU5vhH7Oj
   gKOI4AEZhkRfvH2uErlQon96dxmnURYCIQ9rQGkclYTvHItNsUksrCSnW
   grc2wn12BwUSpyNuzxNLL+P6c1dJBNVP/7+d+xfwpNc+JzJR1kjzngEbl
   Hk8BbCLsPQ7RfuvzEacYgpcn5v+KmECf2WRPKArbk+vEfRbGvujb2rAa3
   0q1c9ab9WanYQY+e6cDvDbsS9zRNgvf1XajKNgRALGWZzoCpHDNGsE7Dq
   Vet//qwDU/q1IG83Lz7ZZechLu7xX6n3Hxyp2zTqdUyIpdmprSedVczCK
   w==;
X-CSE-ConnectionGUID: D+ju6bN2R9aBGyW4gOtnUg==
X-CSE-MsgGUID: ghRkQizcSJm6C0GzOJzGaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52492919"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="52492919"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 13:32:44 -0700
X-CSE-ConnectionGUID: BgvhtpHnTqutvf5SfgLksw==
X-CSE-MsgGUID: qviqbRbAQjGwd6hJLK3Z/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150537932"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 19 Jun 2025 13:32:42 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSLw7-000L5l-2g;
	Thu, 19 Jun 2025 20:32:39 +0000
Date: Fri, 20 Jun 2025 04:32:18 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-upstream-xen 5/22]
 drivers/virtio/virtio_msg.c:418:23: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202506200409.ESNsGUkZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Viresh,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-upstream-xen
head:   144cb011a0ee7a93a82e3cc6c47d5a01d76b4c6e
commit: 93956f0dea686d819b42ce4a8fd37cc25f0056da [5/22] virtio-msg: Add support for loopback bus
config: x86_64-randconfig-122-20250620 (https://download.01.org/0day-ci/archive/20250620/202506200409.ESNsGUkZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250620/202506200409.ESNsGUkZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506200409.ESNsGUkZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/virtio/virtio_msg.c:418:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] size @@     got restricted __le64 [usertype] @@
   drivers/virtio/virtio_msg.c:418:23: sparse:     expected restricted __le32 [usertype] size
   drivers/virtio/virtio_msg.c:418:23: sparse:     got restricted __le64 [usertype]

vim +418 drivers/virtio/virtio_msg.c

db5bb09ef745b4 Viresh Kumar 2024-08-16  410  
db5bb09ef745b4 Viresh Kumar 2024-08-16  411  static int virtio_msg_vq_set(struct virtio_msg_device *vmdev,
db5bb09ef745b4 Viresh Kumar 2024-08-16  412  			     struct virtqueue *vq, unsigned int index)
db5bb09ef745b4 Viresh Kumar 2024-08-16  413  {
db5bb09ef745b4 Viresh Kumar 2024-08-16  414  	struct set_vqueue *payload = virtio_msg_payload(vmdev->request);
db5bb09ef745b4 Viresh Kumar 2024-08-16  415  
db5bb09ef745b4 Viresh Kumar 2024-08-16  416  	transport_msg_prepare(vmdev, VIRTIO_MSG_SET_VQUEUE, sizeof(*payload));
db5bb09ef745b4 Viresh Kumar 2024-08-16  417  	payload->index = cpu_to_le32(index);
db5bb09ef745b4 Viresh Kumar 2024-08-16 @418  	payload->size = cpu_to_le64(virtqueue_get_vring_size(vq));
db5bb09ef745b4 Viresh Kumar 2024-08-16  419  	payload->descriptor_addr = cpu_to_le64(virtqueue_get_desc_addr(vq));
db5bb09ef745b4 Viresh Kumar 2024-08-16  420  	payload->driver_addr = cpu_to_le64(virtqueue_get_avail_addr(vq));
db5bb09ef745b4 Viresh Kumar 2024-08-16  421  	payload->device_addr = cpu_to_le64(virtqueue_get_used_addr(vq));
db5bb09ef745b4 Viresh Kumar 2024-08-16  422  
db5bb09ef745b4 Viresh Kumar 2024-08-16  423  	return virtio_msg_xfer(vmdev);
db5bb09ef745b4 Viresh Kumar 2024-08-16  424  }
db5bb09ef745b4 Viresh Kumar 2024-08-16  425  

:::::: The code at line 418 was first introduced by commit
:::::: db5bb09ef745b4ef1b2e2f258cc295362c87be1b virtio: Add support for virtio-msg transport

:::::: TO: Viresh Kumar <viresh.kumar@linaro.org>
:::::: CC: Viresh Kumar <viresh.kumar@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
