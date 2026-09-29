Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB7951D525
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Sep 2026 18:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790706024; cv=none; b=RnSSS52zJo1DBGhhNIeuhOHwUMu66p9hb/a6UqagBkk06AqJKAwflcj0JwnpI6Lz8ItXmC6NMIsDRChkK8rWhdAiWCCtIR2u4nHJirXk/4ppRG3oZ0N66Erk5zR9TONJDvSQyi+SbsVAQhSIr5iR2W8ozb2T9dwpD9qLjbC5WMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790706024; c=relaxed/simple;
	bh=g4MsWGZTJvi8Yjv6hkz4ssrDud/QNxAxgqVfzHCJzwM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=B2uw2hq/x4oJaJB9Zn13f8TA48rIuQe+KBASlouDjyDge8NsLWynFb/lrDCXuAYqgljf89NP0qe+cSFq5dXvj6HFZBzRtjmOjW25MGIQaE8ICOL4ZVIsc8p4Ray9/Hz+m1xwO/sI//NsOa6SHqJ1CP8Ub4yntM/xuWY+72hoMGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GzHO3nKh; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GzHO3nKh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790706022; x=1822242022;
  h=date:from:to:cc:subject:message-id;
  bh=g4MsWGZTJvi8Yjv6hkz4ssrDud/QNxAxgqVfzHCJzwM=;
  b=GzHO3nKhKWZ9bO2g9J/R9JDi8/IkffiEtxi34LGK7A/ChGDKxEM/o/+A
   xlmKymeca3bfsYA48caOLKPBQB7lhI7pjuqPAuMEFf2VcW6iooLeQBGDQ
   plOARf5ev0h9Rlqkq7D4+j7OQ73i8cUy6qkORGQ07VpwpT3y4zefoX/fe
   9/zIbDC5wmJaxpOQ/MdZjtkScm0cF/Qv329c9jrxnrTMsW3xqrxmBClS8
   XVEPCbfHfzPZ2DowjGrpazkYX98qkW8weR4qG0zFrHeLWDKoP6+yNc2Rp
   DQ9LZxAgTVfqdd5hnthkYXen0N0jJ4pJtHRW5FVGolih+QXdm9vNworcb
   w==;
X-CSE-ConnectionGUID: ogXdlzf+TcmlxWqg2hw3lQ==
X-CSE-MsgGUID: S3as+RRwRq6Xcl4zw05rPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="91294171"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="91294171"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 11:20:15 -0700
X-CSE-ConnectionGUID: ricNIe+ITSqjJecc1VEujg==
X-CSE-MsgGUID: Now+Ndj3QLGn6CkrMKAWVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="279256955"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 29 Sep 2026 11:20:12 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBcQz-000000001VH-2w2F;
	Tue, 29 Sep 2026 18:20:09 +0000
Date: Tue, 29 Sep 2026 20:19:39 +0200
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:nbd 2/4] include/linux/blkdev.h:130:1: sparse:
 sparse: static assertion failed: "sizeof(struct blk_integrity) == 8"
Message-ID: <202609292048.pUUT53xB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/bvanassche/linux nbd
head:   03319d5a61423e473e5419f8743fadf2a89b2e4b
commit: 6e637c10e9c9bc6b28c55f4937b315fbd06594de [2/4] block: Assign a name to the padding byte in struct blk_integrity
config: sparc-randconfig-r2307-20260929 (https://download.01.org/0day-ci/archive/20260929/202609292048.pUUT53xB-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260929/202609292048.pUUT53xB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609292048.pUUT53xB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/scsi/sr_vendor.c: note: in included file (through include/linux/cdrom.h):
>> include/linux/blkdev.h:130:1: sparse: sparse: static assertion failed: "sizeof(struct blk_integrity) == 8"
--
   drivers/scsi/scsi_debugfs.c: note: in included file (through include/scsi/scsi_cmnd.h):
>> include/linux/blkdev.h:130:1: sparse: sparse: static assertion failed: "sizeof(struct blk_integrity) == 8"
--
   drivers/scsi/scsi_lib_dma.c: note: in included file:
>> include/linux/blkdev.h:130:1: sparse: sparse: static assertion failed: "sizeof(struct blk_integrity) == 8"
--
   drivers/scsi/sr_ioctl.c: note: in included file:
>> include/linux/blkdev.h:130:1: sparse: sparse: static assertion failed: "sizeof(struct blk_integrity) == 8"
--
   drivers/scsi/scsi_trace.c: note: in included file (through include/scsi/scsi_cmnd.h, include/trace/events/scsi.h):
>> include/linux/blkdev.h:130:1: sparse: sparse: static assertion failed: "sizeof(struct blk_integrity) == 8"
--
   drivers/scsi/scsi_logging.c: note: in included file (through include/scsi/scsi_cmnd.h):
>> include/linux/blkdev.h:130:1: sparse: sparse: static assertion failed: "sizeof(struct blk_integrity) == 8"
--
   drivers/scsi/scsi_sysctl.c: note: in included file (through include/linux/blk-mq.h, include/scsi/scsi_device.h, drivers/scsi/scsi_priv.h):
>> include/linux/blkdev.h:130:1: sparse: sparse: static assertion failed: "sizeof(struct blk_integrity) == 8"
--
   drivers/scsi/constants.c: note: in included file:
>> include/linux/blkdev.h:130:1: sparse: sparse: static assertion failed: "sizeof(struct blk_integrity) == 8"
--
   drivers/scsi/scsi_devinfo.c: note: in included file:
>> include/linux/blkdev.h:130:1: sparse: sparse: static assertion failed: "sizeof(struct blk_integrity) == 8"
--
   drivers/scsi/scsi_bsg.c: note: in included file (through include/linux/blk-mq.h, include/linux/io_uring/cmd.h):
>> include/linux/blkdev.h:130:1: sparse: sparse: static assertion failed: "sizeof(struct blk_integrity) == 8"
--
   drivers/scsi/scsi_dh.c: note: in included file (through include/linux/blk-mq.h, include/scsi/scsi_device.h, include/scsi/scsi_dh.h):
>> include/linux/blkdev.h:130:1: sparse: sparse: static assertion failed: "sizeof(struct blk_integrity) == 8"
--
   drivers/scsi/sd_dif.c: note: in included file (through include/linux/blk-mq.h, include/linux/blk-integrity.h):
>> include/linux/blkdev.h:130:1: sparse: sparse: static assertion failed: "sizeof(struct blk_integrity) == 8"
--
   drivers/scsi/scsi_ioctl.c: note: in included file:
>> include/linux/blkdev.h:130:1: sparse: sparse: static assertion failed: "sizeof(struct blk_integrity) == 8"
--
   drivers/scsi/scsi_netlink.c: note: in included file (through include/linux/blk-mq.h, include/scsi/scsi_device.h, drivers/scsi/scsi_priv.h):
>> include/linux/blkdev.h:130:1: sparse: sparse: static assertion failed: "sizeof(struct blk_integrity) == 8"
--
   drivers/scsi/hosts.c: note: in included file:
>> include/linux/blkdev.h:130:1: sparse: sparse: static assertion failed: "sizeof(struct blk_integrity) == 8"
--
   drivers/scsi/sr.c: note: in included file (through include/linux/cdrom.h):
>> include/linux/blkdev.h:130:1: sparse: sparse: static assertion failed: "sizeof(struct blk_integrity) == 8"
--
   drivers/scsi/ch.c: note: in included file:
>> include/linux/blkdev.h:130:1: sparse: sparse: static assertion failed: "sizeof(struct blk_integrity) == 8"
--
   drivers/scsi/scsi.c: note: in included file:
>> include/linux/blkdev.h:130:1: sparse: sparse: static assertion failed: "sizeof(struct blk_integrity) == 8"
--
   drivers/scsi/scsicam.c: note: in included file:
>> include/linux/blkdev.h:130:1: sparse: sparse: static assertion failed: "sizeof(struct blk_integrity) == 8"
--
   drivers/scsi/scsi_transport_sas.c: note: in included file:
>> include/linux/blkdev.h:130:1: sparse: sparse: static assertion failed: "sizeof(struct blk_integrity) == 8"
--
   drivers/scsi/scsi_sysfs.c: note: in included file:
>> include/linux/blkdev.h:130:1: sparse: sparse: static assertion failed: "sizeof(struct blk_integrity) == 8"
--
   drivers/scsi/scsi_scan.c: note: in included file:
>> include/linux/blkdev.h:130:1: sparse: sparse: static assertion failed: "sizeof(struct blk_integrity) == 8"
--
   drivers/scsi/scsi_error.c: note: in included file:
>> include/linux/blkdev.h:130:1: sparse: sparse: static assertion failed: "sizeof(struct blk_integrity) == 8"
--
   drivers/scsi/scsi_lib.c: note: in included file:
>> include/linux/blkdev.h:130:1: sparse: sparse: static assertion failed: "sizeof(struct blk_integrity) == 8"
--
   drivers/scsi/scsi_transport_spi.c: note: in included file:
>> include/linux/blkdev.h:130:1: sparse: sparse: static assertion failed: "sizeof(struct blk_integrity) == 8"
--
   drivers/scsi/sd.c: note: in included file:
>> include/linux/blkdev.h:130:1: sparse: sparse: static assertion failed: "sizeof(struct blk_integrity) == 8"
--
   drivers/scsi/st.c: note: in included file (through include/linux/cdrom.h):
>> include/linux/blkdev.h:130:1: sparse: sparse: static assertion failed: "sizeof(struct blk_integrity) == 8"
--
   drivers/scsi/scsi_transport_fc.c: note: in included file (through include/linux/bsg-lib.h):
>> include/linux/blkdev.h:130:1: sparse: sparse: static assertion failed: "sizeof(struct blk_integrity) == 8"
--
   drivers/scsi/scsi_transport_iscsi.c: note: in included file (through include/linux/bsg-lib.h):
>> include/linux/blkdev.h:130:1: sparse: sparse: static assertion failed: "sizeof(struct blk_integrity) == 8"
--
   drivers/scsi/device_handler/scsi_dh_emc.c: note: in included file (through include/scsi/scsi_cmnd.h, include/scsi/scsi_eh.h):
>> include/linux/blkdev.h:130:1: sparse: sparse: static assertion failed: "sizeof(struct blk_integrity) == 8"

vim +130 include/linux/blkdev.h

   129	
 > 130	static_assert(sizeof(struct blk_integrity) == 8);
   131	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
