Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9958313AC4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Mar 2024 22:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710974729; cv=none; b=WiYyyAcd6JNhV4y9qZibUIjj05ulcFNUkoNROiMhbNI3WUAjzhSiwJ8yFt+iXSbNAepWJpyuCtuYjNlG/s6XQr5eD1AhxHOzCbVD2J7giSlztVW49OW9Qd6pU50JYbnz80yNkhVRRRWns+B8yGch1BrX+1o8rpiY1qHRHaPelp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710974729; c=relaxed/simple;
	bh=/VbaTZ/FXdGt22HOxG9UjDTV0Wj8jZxLwO39FzfLfAI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sQQGsTcp4Rd2u51G/0WkgGS3GNbNwiBRb0mSPrTher6RU0mHYRKIeqFZz1ZJeT1Wsoe5HCqto2I+gLmlGwzhIqJ7bEgLujuY8EG9l26cwTlR2DDwJAlZyfWIqR9Geot6YlB331QLT6cNrDPx93dsnhuyL0mf0X+UHBkvXHTqfx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mqpbxvNT; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mqpbxvNT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710974727; x=1742510727;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/VbaTZ/FXdGt22HOxG9UjDTV0Wj8jZxLwO39FzfLfAI=;
  b=mqpbxvNTEPgFcB9ox72xXHBEgjMLfPbX2YDw7q9SSohXpNO4ZZl5Zfl8
   ZQVmOufltGMzi8KW0iYzPI6+mhXfbVRpc6/DAwI7V2+xhfdhcAHNON7Rq
   pec37E1J7ELABkXL/e6RChb2FBr9b0Q2gLj8r1HGVGbGbqgeLdFF1LMXi
   Tu4rfT4nn2OLjPs3bE2WM8GRPq65eZ77GiTe1LNmi+20Dk49saAEBahlI
   mX8CWTSVVSyOmf1mFfESdUVDyMCHa8mfgYXGbm/i4nVwz9HNRgpIyOLcu
   W9Hhrf8Si6Cu4ak4YJUS4tBP0fMw5d9pSzfku6+JnSSZdQDoGY2pl+WU3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="16575911"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; 
   d="scan'208";a="16575911"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 15:45:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; 
   d="scan'208";a="18776764"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Mar 2024 15:45:25 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rn4gV-000IyJ-0d;
	Wed, 20 Mar 2024 22:45:23 +0000
Date: Thu, 21 Mar 2024 06:45:09 +0800
From: kernel test robot <lkp@intel.com>
To: Navneet Singh <navneet.singh@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Ira Weiny <ira.weiny@intel.com>
Subject: [weiny2:dcd-2024-03-20 16/28] csky-linux-ld: mbox.c:undefined
 reference to `cxl_ed_add_one_extent'
Message-ID: <202403210638.eOrxSPaW-lkp@intel.com>
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
commit: 453539c929e1170cefe10a9baa215eef177863cf [16/28] cxl/region: Read existing extents on region creation
config: csky-allyesconfig (https://download.01.org/0day-ci/archive/20240321/202403210638.eOrxSPaW-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240321/202403210638.eOrxSPaW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403210638.eOrxSPaW-lkp@intel.com/

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
   mbox.c:(.text+0x1266): undefined reference to `cxl_ed_add_one_extent'
>> csky-linux-ld: mbox.c:(.text+0x12ec): undefined reference to `cxl_ed_add_one_extent'
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
