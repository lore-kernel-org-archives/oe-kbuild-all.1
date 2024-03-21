Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6556D1C05
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Mar 2024 04:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710995319; cv=none; b=JWocQKhse3Z3CEH21hg3e1zu3EhL+V2SBYDXkyq7SCwuKIxjyKlxPN3u5f5ORzq2zNZKDiVm7i2ktKOe8bEu7VlHXVeVOQqS3iepepgsllKog6yW41vg9h05Zct7BLRkoGrshyDaaFDIf4w3vyqAFprvojUBg1spgvu0DQvrlrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710995319; c=relaxed/simple;
	bh=T0boty4YwG8apwFsqkLqDNsHGeecRCLcxKZc6or/kZo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tBqeM3KTvfQ2PLszdecJpa7SKOr9IhOXiB5v++J0RYLcLYPrZVaD8XY8cUrmkxqPifzdxMJmyoD6ClyimroSnvulsuKOguXo/kstpw8N51zMjrS+V3CrSNmv2M3x/CLmagxLI91VN048FNcoxiuMY+sL55DS4vIgZOK7Fj/dL5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ARe+G1IN; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ARe+G1IN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710995317; x=1742531317;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T0boty4YwG8apwFsqkLqDNsHGeecRCLcxKZc6or/kZo=;
  b=ARe+G1INoESA25vIxHhoofXX4gcT5KmFW3J+7p9leVDNm9B9/U21USXo
   w3dcnaKUzyxtQudySbwhwGeQb1kC70bH6FhyNb89bL9Aa1Nty2G89wezL
   ZsERwh40xcaD0DdAsTM1KlOolxdiLONDWnIZfe819CBalZE227etqwtlP
   Rbg0k5evNBm50+p2j//T7LvGp9Kg7XU5M9ayaA2d0lGh39TnxzPJHHwzs
   GJkJMdYO5Sfh6OJV9PGB1adAM821pKx1FcxxZuS809eb/9uNJ0czysi9f
   EFKcpKTi5kj8LhCG+DosvtMTTz33mzA1juIcrs2/mjWhwS2px88O2mC6m
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="17099992"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; 
   d="scan'208";a="17099992"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 21:28:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; 
   d="scan'208";a="14452796"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Mar 2024 21:28:33 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnA2Z-000JAJ-0I;
	Thu, 21 Mar 2024 04:28:31 +0000
Date: Thu, 21 Mar 2024 12:28:13 +0800
From: kernel test robot <lkp@intel.com>
To: Navneet Singh <navneet.singh@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Ira Weiny <ira.weiny@intel.com>
Subject: [weiny2:dcd-2024-03-20 20/28] undefined reference to
 `cxl_region_notify_extent'
Message-ID: <202403211232.ZpaOJqwY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git dcd-2024-03-20
head:   8a3f02fa89dfa853c12a8bbd8abb2dd73a5d320d
commit: 2b5129529c2d1ff1ca757ebda1c46288f554bd40 [20/28] cxl/mem: Handle DCD add and release capacity events.
config: csky-allyesconfig (https://download.01.org/0day-ci/archive/20240321/202403211232.ZpaOJqwY-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240321/202403211232.ZpaOJqwY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403211232.ZpaOJqwY-lkp@intel.com/

All errors (new ones prefixed by >>):

   `.exit.text' referenced in section `__jump_table' of fs/smb/client/cifsfs.o: defined in discarded section `.exit.text' of fs/smb/client/cifsfs.o
   `.exit.text' referenced in section `__jump_table' of fs/smb/client/cifsfs.o: defined in discarded section `.exit.text' of fs/smb/client/cifsfs.o
   `.exit.text' referenced in section `__jump_table' of fs/fuse/inode.o: defined in discarded section `.exit.text' of fs/fuse/inode.o
   `.exit.text' referenced in section `__jump_table' of fs/fuse/inode.o: defined in discarded section `.exit.text' of fs/fuse/inode.o
   `.exit.text' referenced in section `__jump_table' of fs/ceph/super.o: defined in discarded section `.exit.text' of fs/ceph/super.o
   `.exit.text' referenced in section `__jump_table' of fs/ceph/super.o: defined in discarded section `.exit.text' of fs/ceph/super.o
   `.exit.text' referenced in section `__jump_table' of lib/test_dynamic_debug.o: defined in discarded section `.exit.text' of lib/test_dynamic_debug.o
   `.exit.text' referenced in section `__jump_table' of lib/test_dynamic_debug.o: defined in discarded section `.exit.text' of lib/test_dynamic_debug.o
   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/rio_cm.o: defined in discarded section `.exit.text' of drivers/rapidio/rio_cm.o
   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/rio_cm.o: defined in discarded section `.exit.text' of drivers/rapidio/rio_cm.o
   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen2.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen2.o
   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen2.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen2.o
   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen2.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen2.o
   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen2.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen2.o
   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen3.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen3.o
   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen3.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen3.o
   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen3.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen3.o
   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen3.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen3.o
   `.exit.text' referenced in section `__jump_table' of drivers/video/fbdev/vt8623fb.o: defined in discarded section `.exit.text' of drivers/video/fbdev/vt8623fb.o
   `.exit.text' referenced in section `__jump_table' of drivers/video/fbdev/vt8623fb.o: defined in discarded section `.exit.text' of drivers/video/fbdev/vt8623fb.o
   `.exit.text' referenced in section `__jump_table' of drivers/video/fbdev/s3fb.o: defined in discarded section `.exit.text' of drivers/video/fbdev/s3fb.o
   `.exit.text' referenced in section `__jump_table' of drivers/video/fbdev/s3fb.o: defined in discarded section `.exit.text' of drivers/video/fbdev/s3fb.o
   `.exit.text' referenced in section `__jump_table' of drivers/video/fbdev/arkfb.o: defined in discarded section `.exit.text' of drivers/video/fbdev/arkfb.o
   `.exit.text' referenced in section `__jump_table' of drivers/video/fbdev/arkfb.o: defined in discarded section `.exit.text' of drivers/video/fbdev/arkfb.o
   `.exit.text' referenced in section `__jump_table' of drivers/misc/phantom.o: defined in discarded section `.exit.text' of drivers/misc/phantom.o
   `.exit.text' referenced in section `__jump_table' of drivers/misc/phantom.o: defined in discarded section `.exit.text' of drivers/misc/phantom.o
   csky-linux-ld: drivers/cxl/core/mbox.o: in function `cxl_dev_get_dc_extents':
   mbox.c:(.text+0x10be): undefined reference to `cxl_ed_add_one_extent'
   csky-linux-ld: mbox.c:(.text+0x1114): undefined reference to `cxl_ed_add_one_extent'
   csky-linux-ld: drivers/cxl/core/extent.o: in function `dax_region_create_ext':
>> (.text+0x23c): undefined reference to `cxl_region_notify_extent'
>> csky-linux-ld: (.text+0x2e4): undefined reference to `cxl_region_notify_extent'
   `.exit.text' referenced in section `__jump_table' of drivers/scsi/fcoe/fcoe.o: defined in discarded section `.exit.text' of drivers/scsi/fcoe/fcoe.o
   `.exit.text' referenced in section `__jump_table' of drivers/scsi/fcoe/fcoe.o: defined in discarded section `.exit.text' of drivers/scsi/fcoe/fcoe.o
   `.exit.text' referenced in section `__jump_table' of drivers/scsi/cxgbi/libcxgbi.o: defined in discarded section `.exit.text' of drivers/scsi/cxgbi/libcxgbi.o
   `.exit.text' referenced in section `__jump_table' of drivers/scsi/cxgbi/libcxgbi.o: defined in discarded section `.exit.text' of drivers/scsi/cxgbi/libcxgbi.o
   `.exit.text' referenced in section `__jump_table' of drivers/target/target_core_configfs.o: defined in discarded section `.exit.text' of drivers/target/target_core_configfs.o
   `.exit.text' referenced in section `__jump_table' of drivers/target/target_core_configfs.o: defined in discarded section `.exit.text' of drivers/target/target_core_configfs.o
   `.exit.text' referenced in section `__jump_table' of drivers/mtd/maps/pcmciamtd.o: defined in discarded section `.exit.text' of drivers/mtd/maps/pcmciamtd.o
   `.exit.text' referenced in section `__jump_table' of drivers/mtd/maps/pcmciamtd.o: defined in discarded section `.exit.text' of drivers/mtd/maps/pcmciamtd.o
   `.exit.text' referenced in section `__jump_table' of drivers/net/wireless/purelifi/plfxlc/usb.o: defined in discarded section `.exit.text' of drivers/net/wireless/purelifi/plfxlc/usb.o
   `.exit.text' referenced in section `__jump_table' of drivers/net/wireless/purelifi/plfxlc/usb.o: defined in discarded section `.exit.text' of drivers/net/wireless/purelifi/plfxlc/usb.o
   `.exit.text' referenced in section `__jump_table' of drivers/net/wireless/zydas/zd1211rw/zd_usb.o: defined in discarded section `.exit.text' of drivers/net/wireless/zydas/zd1211rw/zd_usb.o
   `.exit.text' referenced in section `__jump_table' of drivers/net/wireless/zydas/zd1211rw/zd_usb.o: defined in discarded section `.exit.text' of drivers/net/wireless/zydas/zd1211rw/zd_usb.o
   `.exit.text' referenced in section `__jump_table' of drivers/net/wireless/virtual/mac80211_hwsim.o: defined in discarded section `.exit.text' of drivers/net/wireless/virtual/mac80211_hwsim.o
   `.exit.text' referenced in section `__jump_table' of drivers/net/wireless/virtual/mac80211_hwsim.o: defined in discarded section `.exit.text' of drivers/net/wireless/virtual/mac80211_hwsim.o
   `.exit.text' referenced in section `__jump_table' of drivers/usb/gadget/legacy/inode.o: defined in discarded section `.exit.text' of drivers/usb/gadget/legacy/inode.o
   `.exit.text' referenced in section `__jump_table' of drivers/usb/gadget/legacy/inode.o: defined in discarded section `.exit.text' of drivers/usb/gadget/legacy/inode.o
   `.exit.text' referenced in section `__jump_table' of drivers/media/common/siano/smscoreapi.o: defined in discarded section `.exit.text' of drivers/media/common/siano/smscoreapi.o
   `.exit.text' referenced in section `__jump_table' of drivers/media/common/siano/smscoreapi.o: defined in discarded section `.exit.text' of drivers/media/common/siano/smscoreapi.o
   `.exit.text' referenced in section `__jump_table' of drivers/hid/hid-sony.o: defined in discarded section `.exit.text' of drivers/hid/hid-sony.o
   `.exit.text' referenced in section `__jump_table' of drivers/hid/hid-sony.o: defined in discarded section `.exit.text' of drivers/hid/hid-sony.o
   `.exit.text' referenced in section `__jump_table' of drivers/staging/vme_user/vme_fake.o: defined in discarded section `.exit.text' of drivers/staging/vme_user/vme_fake.o
   `.exit.text' referenced in section `__jump_table' of drivers/staging/vme_user/vme_fake.o: defined in discarded section `.exit.text' of drivers/staging/vme_user/vme_fake.o
   `.exit.text' referenced in section `__jump_table' of net/netfilter/nf_conntrack_h323_main.o: defined in discarded section `.exit.text' of net/netfilter/nf_conntrack_h323_main.o
   `.exit.text' referenced in section `__jump_table' of net/netfilter/nf_conntrack_h323_main.o: defined in discarded section `.exit.text' of net/netfilter/nf_conntrack_h323_main.o
   `.exit.text' referenced in section `__jump_table' of net/netfilter/ipset/ip_set_core.o: defined in discarded section `.exit.text' of net/netfilter/ipset/ip_set_core.o
   `.exit.text' referenced in section `__jump_table' of net/netfilter/ipset/ip_set_core.o: defined in discarded section `.exit.text' of net/netfilter/ipset/ip_set_core.o
   `.exit.text' referenced in section `__jump_table' of net/rds/rdma_transport.o: defined in discarded section `.exit.text' of net/rds/rdma_transport.o
   `.exit.text' referenced in section `__jump_table' of net/rds/rdma_transport.o: defined in discarded section `.exit.text' of net/rds/rdma_transport.o
   `.exit.text' referenced in section `__jump_table' of net/rds/rdma_transport.o: defined in discarded section `.exit.text' of net/rds/rdma_transport.o
   `.exit.text' referenced in section `__jump_table' of net/rds/rdma_transport.o: defined in discarded section `.exit.text' of net/rds/rdma_transport.o
   `.exit.text' referenced in section `__jump_table' of net/ceph/ceph_common.o: defined in discarded section `.exit.text' of net/ceph/ceph_common.o
   `.exit.text' referenced in section `__jump_table' of net/ceph/ceph_common.o: defined in discarded section `.exit.text' of net/ceph/ceph_common.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
