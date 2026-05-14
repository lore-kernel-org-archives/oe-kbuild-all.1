Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C589E3D648F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 07:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778744636; cv=none; b=qeEiwW/+x9junz/vJHYVZAn2V4WvMumK1wxZjcCc4v8VR+nBwovIl7ovPGq4SX9J2taJWUGgrORPXpSTWmMI3eKUca+6vWbRLD2KLlAn1jostKjcMBCpPF3NkxXorxDvd5NLIKZvl0M5+40m1Mr/rWAR0pwBTPCEviJTO+Ot0zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778744636; c=relaxed/simple;
	bh=4YDcOwiM17aOqi0JQtc9PL7YAgMHASrvm+TirGbscL8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YiUu0rkiZB9eboLLzi2C5smrcearWsfoEcfBj3GZOAlDpNh3GEL66Gl9dgpP2qNJa70rDquzKZfJBUeHjQhyWzDCN75pxtd8PAs4k5ntdhDlSzKbIBB11JhMGwsZUgzrWLl19MVgCFS6V5lotK6PN4ln0tKkOaLJNOxJiLwhVkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WS6MU4Ae; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WS6MU4Ae"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778744634; x=1810280634;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4YDcOwiM17aOqi0JQtc9PL7YAgMHASrvm+TirGbscL8=;
  b=WS6MU4AeGSpHjZpJjgtoBxQ0TqzIEmYHXeJzEN/EORAGPnlEYfo8VRsA
   amHyV8gWHqJzdJoqo37qVfjiCUunF9HcvxMLhA27NeG44TS3ayqtCZ2nS
   sy28MnBHQXB02hrs+1ko+JsGFDggWOse5U2Ek1u73PoM3VQLzOgDwFdVd
   oIBHkZkmKqVXdZ/u3ldyF/0N+hCBDqUUD4YLBseWx5CzZFHwNOBrxqqi8
   fMgUXtdlJHYWXKUbLDb6R5fVhD8uSvCd/hKy/PvozHR/taBwsd6czcUvB
   QypLG8Iva2oTbTFJnZUS4r3FXhHHvU0zc0hkYMw8Si10+qr5FzT1qkk/S
   w==;
X-CSE-ConnectionGUID: L9uaTICbSxS+OxLmhaq11Q==
X-CSE-MsgGUID: ObZ0G7nzTB2Xm8+5dRsqnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="67210065"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="67210065"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 00:43:53 -0700
X-CSE-ConnectionGUID: CHCqfuz2TFS+BCYrfGo6+g==
X-CSE-MsgGUID: eeD3IcchRrS1y3uH8ruJtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="261832371"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 May 2026 00:43:50 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNQjT-0000000063d-2lDm;
	Thu, 14 May 2026 07:43:47 +0000
Date: Thu, 14 May 2026 15:43:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>,
 Johannes Berg <johannes@sipsolutions.net>,
 David Gow <davidgow@google.com>
Subject: drivers/scsi/bnx2fc/bnx2fc_hwi.c:1665:47: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202605141506.xPdfd7Ju-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e1914add2799225a87502051415fc5c32aeb02ae
commit: 031cdd3bc3f369553933c1b0f4cb18000162c8ff kunit: Enable PCI on UML without triggering WARN()
date:   8 months ago
config: um-randconfig-r123-20260514 (https://download.01.org/0day-ci/archive/20260514/202605141506.xPdfd7Ju-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605141506.xPdfd7Ju-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 031cdd3bc3f3 ("kunit: Enable PCI on UML without triggering WARN()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605141506.xPdfd7Ju-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:505:29: sparse:     got unsigned int [usertype] fcoe_conn_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:613:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] fr_crc @@     got restricted __le32 [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:613:28: sparse:     expected unsigned int [usertype] fr_crc
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:613:28: sparse:     got restricted __le32 [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:695:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] xid @@     got restricted __le16 [usertype] ox_id @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:695:21: sparse:     expected unsigned short [usertype] xid
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:695:21: sparse:     got restricted __le16 [usertype] ox_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:727:27: sparse: sparse: cast from restricted __le32
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:728:26: sparse: sparse: cast from restricted __le32
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:807:23: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] ox_id @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:807:23: sparse:     expected unsigned short [usertype] val
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:807:23: sparse:     got restricted __le16 [usertype] ox_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:807:23: sparse: sparse: cast from restricted __le16
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:807:23: sparse: sparse: cast from restricted __le16
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:807:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] xid @@     got restricted __be16 [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:807:21: sparse:     expected unsigned short [usertype] xid
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:807:21: sparse:     got restricted __be16 [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:821:27: sparse: sparse: cast from restricted __le32
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:822:26: sparse: sparse: cast from restricted __le32
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:886:45: sparse: sparse: restricted __le16 degrades to integer
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:963:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] doorbell_cq_cons @@     got int @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:963:33: sparse:     expected restricted __le16 [usertype] doorbell_cq_cons
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:963:33: sparse:     got int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:966:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:966:16: sparse:     expected unsigned int [usertype] value
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:966:16: sparse:     got restricted __le32 [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1019:43: sparse: sparse: restricted __le16 degrades to integer
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1089:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] wqe @@     got restricted __le16 [usertype] wqe @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1089:22: sparse:     expected unsigned short [usertype] wqe
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1089:22: sparse:     got restricted __le16 [usertype] wqe
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1253:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] conn_id @@     got restricted __le32 [usertype] fcoe_conn_id @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1253:17: sparse:     expected unsigned int [usertype] conn_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1253:17: sparse:     got restricted __le32 [usertype] fcoe_conn_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1369:53: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int [usertype] err_code @@     got restricted __le32 [usertype] completion_status @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1369:53: sparse:     expected unsigned int [usertype] err_code
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1369:53: sparse:     got restricted __le32 [usertype] completion_status
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1420:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] wqe @@     got int @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1420:18: sparse:     expected restricted __le16 [usertype] wqe
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1420:18: sparse:     got int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1421:18: sparse: sparse: invalid assignment: |=
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1421:18: sparse:    left side has type restricted __le16
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1421:18: sparse:    right side has type int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1439:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1439:16: sparse:     expected unsigned int [usertype] value
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1439:16: sparse:     got restricted __le32 [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1522:46: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] init_flags @@     got unsigned int @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1522:46: sparse:     expected restricted __le32 [usertype] init_flags
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1522:46: sparse:     got unsigned int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1524:46: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] init_flags @@     got unsigned int @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1524:46: sparse:     expected restricted __le32 [usertype] init_flags
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1524:46: sparse:     got unsigned int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1527:63: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] cleaned_task_id @@     got unsigned short [usertype] orig_xid @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1527:63: sparse:     expected restricted __le16 [usertype] cleaned_task_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1527:63: sparse:     got unsigned short [usertype] orig_xid
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1530:69: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] rolled_tx_data_offset @@     got unsigned int [usertype] offset @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1530:69: sparse:     expected restricted __le32 [usertype] rolled_tx_data_offset
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1530:69: sparse:     got unsigned int [usertype] offset
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1536:35: sparse: sparse: restricted __le16 degrades to integer
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1538:24: sparse: sparse: invalid assignment: -=
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1538:24: sparse:    left side has type unsigned int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1538:24: sparse:    right side has type restricted __le16
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1543:69: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] lo @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1543:69: sparse:     expected restricted __le32 [usertype] lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1543:69: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1545:69: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] hi @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1545:69: sparse:     expected restricted __le32 [usertype] hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1545:69: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1549:65: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] cur_sge_off @@     got unsigned int [usertype] offset @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1549:65: sparse:     expected restricted __le16 [usertype] cur_sge_off
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1549:65: sparse:     got unsigned int [usertype] offset
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1556:46: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] lo @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1556:46: sparse:     expected restricted __le32 [usertype] lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1556:46: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1557:46: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] hi @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1557:46: sparse:     expected restricted __le32 [usertype] hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1557:46: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1559:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] cur_sge_off @@     got unsigned int [usertype] offset @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1559:42: sparse:     expected restricted __le16 [usertype] cur_sge_off
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1559:42: sparse:     got unsigned int [usertype] offset
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1564:55: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] low_exp_ro @@     got unsigned int [usertype] orig_offset @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1564:55: sparse:     expected restricted __le32 [usertype] low_exp_ro
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1564:55: sparse:     got unsigned int [usertype] orig_offset
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1565:56: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] high_exp_ro @@     got unsigned int [usertype] orig_offset @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1565:56: sparse:     expected restricted __le32 [usertype] high_exp_ro
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1565:56: sparse:     got unsigned int [usertype] orig_offset
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1592:63: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] cleaned_task_id @@     got unsigned short [usertype] orig_xid @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1592:63: sparse:     expected restricted __le16 [usertype] cleaned_task_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1592:63: sparse:     got unsigned short [usertype] orig_xid
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1600:46: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] init_flags @@     got unsigned int @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1600:46: sparse:     expected restricted __le32 [usertype] init_flags
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1600:46: sparse:     got unsigned int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1602:42: sparse: sparse: invalid assignment: |=
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1602:42: sparse:    left side has type restricted __le16
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1602:42: sparse:    right side has type int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1638:69: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] lo @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1638:69: sparse:     expected restricted __le32 [usertype] lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1638:69: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1640:69: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] hi @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1640:69: sparse:     expected restricted __le32 [usertype] hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1640:69: sparse:     got unsigned int [usertype]
>> drivers/scsi/bnx2fc/bnx2fc_hwi.c:1665:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] data_2_trns @@     got unsigned int [usertype] data_xfer_len @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1665:47: sparse:     expected restricted __le32 [usertype] data_2_trns
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1665:47: sparse:     got unsigned int [usertype] data_xfer_len
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1668:42: sparse: sparse: invalid assignment: |=
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1668:42: sparse:    left side has type restricted __le16
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1668:42: sparse:    right side has type int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1672:46: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] init_flags @@     got unsigned int @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1672:46: sparse:     expected restricted __le32 [usertype] init_flags
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1672:46: sparse:     got unsigned int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1679:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] rx_id @@     got int @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1679:47: sparse:     expected restricted __le16 [usertype] rx_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1679:47: sparse:     got int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1687:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __be64 [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1687:16: sparse:     expected unsigned long long [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1687:16: sparse:     got restricted __be64 [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1688:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __be64 [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1688:16: sparse:     expected unsigned long long [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1688:16: sparse:     got restricted __be64 [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1689:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __be64 [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1689:16: sparse:     expected unsigned long long [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1689:16: sparse:     got restricted __be64 [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1695:46: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] lo @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1695:46: sparse:     expected restricted __le32 [usertype] lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1695:46: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1696:46: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] hi @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1696:46: sparse:     expected restricted __le32 [usertype] hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1696:46: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1749:77: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] lo @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1749:77: sparse:     expected restricted __le32 [usertype] lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1749:77: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1751:77: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] hi @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1751:77: sparse:     expected restricted __le32 [usertype] hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1751:77: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1779:54: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] seq_cnt @@     got int @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1779:54: sparse:     expected restricted __le16 [usertype] seq_cnt
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1779:54: sparse:     got int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1793:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __be64 [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1793:31: sparse:     expected unsigned long long [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1793:31: sparse:     got restricted __be64 [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1798:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] data_2_trns @@     got unsigned int [usertype] data_xfer_len @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1798:47: sparse:     expected restricted __le32 [usertype] data_2_trns
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1798:47: sparse:     got unsigned int [usertype] data_xfer_len
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1801:46: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] init_flags @@     got unsigned int @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1801:46: sparse:     expected restricted __le32 [usertype] init_flags
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1801:46: sparse:     got unsigned int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1806:42: sparse: sparse: invalid assignment: |=
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1806:42: sparse:    left side has type restricted __le16
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1806:42: sparse:    right side has type int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1809:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] rx_id @@     got int @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1809:39: sparse:     expected restricted __le16 [usertype] rx_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1809:39: sparse:     got int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1845:54: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] lo @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1845:54: sparse:     expected restricted __le32 [usertype] lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1845:54: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1846:54: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] hi @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1846:54: sparse:     expected restricted __le32 [usertype] hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1846:54: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1851:46: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] lo @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1851:46: sparse:     expected restricted __le32 [usertype] lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1851:46: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1852:46: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] hi @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1852:46: sparse:     expected restricted __le32 [usertype] hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1852:46: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:2001:47: sparse: sparse: cast to restricted __le32
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:2003:54: sparse: sparse: cast to restricted __le32
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:2076:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:2076:22: sparse:     expected unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:2076:22: sparse:     got restricted __le32 [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:2078:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:2078:22: sparse:     expected unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:2078:22: sparse:     got restricted __le32 [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:2146:45: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] lo @@     got unsigned long long @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:2146:45: sparse:     expected restricted __le32 [usertype] lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:2146:45: sparse:     got unsigned long long
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:2147:45: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] hi @@     got unsigned long long @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:2147:45: sparse:     expected restricted __le32 [usertype] hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:2147:45: sparse:     got unsigned long long

vim +1665 drivers/scsi/bnx2fc/bnx2fc_hwi.c

853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1487  
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1488  void bnx2fc_init_seq_cleanup_task(struct bnx2fc_cmd *seq_clnp_req,
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1489  				  struct fcoe_task_ctx_entry *task,
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1490  				  struct bnx2fc_cmd *orig_io_req,
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1491  				  u32 offset)
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1492  {
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1493  	struct scsi_cmnd *sc_cmd = orig_io_req->sc_cmd;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1494  	struct bnx2fc_rport *tgt = seq_clnp_req->tgt;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1495  	struct fcoe_bd_ctx *bd = orig_io_req->bd_tbl->bd_tbl;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1496  	struct fcoe_ext_mul_sges_ctx *sgl;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1497  	u8 task_type = FCOE_TASK_TYPE_SEQUENCE_CLEANUP;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1498  	u8 orig_task_type;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1499  	u16 orig_xid = orig_io_req->xid;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1500  	u32 context_id = tgt->context_id;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1501  	u64 phys_addr = (u64)orig_io_req->bd_tbl->bd_tbl_dma;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1502  	u32 orig_offset = offset;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1503  	int bd_count;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1504  	int i;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1505  
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1506  	memset(task, 0, sizeof(struct fcoe_task_ctx_entry));
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1507  
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1508  	if (sc_cmd->sc_data_direction == DMA_TO_DEVICE)
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1509  		orig_task_type = FCOE_TASK_TYPE_WRITE;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1510  	else
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1511  		orig_task_type = FCOE_TASK_TYPE_READ;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1512  
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1513  	/* Tx flags */
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1514  	task->txwr_rxrd.const_ctx.tx_flags =
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1515  				FCOE_TASK_TX_STATE_SEQUENCE_CLEANUP <<
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1516  				FCOE_TCE_TX_WR_RX_RD_CONST_TX_STATE_SHIFT;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1517  	/* init flags */
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1518  	task->txwr_rxrd.const_ctx.init_flags = task_type <<
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1519  				FCOE_TCE_TX_WR_RX_RD_CONST_TASK_TYPE_SHIFT;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1520  	task->txwr_rxrd.const_ctx.init_flags |= FCOE_TASK_CLASS_TYPE_3 <<
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1521  				FCOE_TCE_TX_WR_RX_RD_CONST_CLASS_TYPE_SHIFT;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1522  	task->rxwr_txrd.const_ctx.init_flags = context_id <<
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1523  				FCOE_TCE_RX_WR_TX_RD_CONST_CID_SHIFT;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1524  	task->rxwr_txrd.const_ctx.init_flags = context_id <<
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1525  				FCOE_TCE_RX_WR_TX_RD_CONST_CID_SHIFT;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1526  
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1527  	task->txwr_rxrd.union_ctx.cleanup.ctx.cleaned_task_id = orig_xid;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1528  
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1529  	task->txwr_rxrd.union_ctx.cleanup.ctx.rolled_tx_seq_cnt = 0;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1530  	task->txwr_rxrd.union_ctx.cleanup.ctx.rolled_tx_data_offset = offset;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1531  
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1532  	bd_count = orig_io_req->bd_tbl->bd_valid;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1533  
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1534  	/* obtain the appropriate bd entry from relative offset */
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1535  	for (i = 0; i < bd_count; i++) {
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1536  		if (offset < bd[i].buf_len)
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1537  			break;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1538  		offset -= bd[i].buf_len;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1539  	}
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1540  	phys_addr += (i * sizeof(struct fcoe_bd_ctx));
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1541  
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1542  	if (orig_task_type == FCOE_TASK_TYPE_WRITE) {
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1543  		task->txwr_only.sgl_ctx.sgl.mul_sgl.cur_sge_addr.lo =
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1544  				(u32)phys_addr;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1545  		task->txwr_only.sgl_ctx.sgl.mul_sgl.cur_sge_addr.hi =
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1546  				(u32)((u64)phys_addr >> 32);
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1547  		task->txwr_only.sgl_ctx.sgl.mul_sgl.sgl_size =
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1548  				bd_count;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1549  		task->txwr_only.sgl_ctx.sgl.mul_sgl.cur_sge_off =
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1550  				offset; /* adjusted offset */
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1551  		task->txwr_only.sgl_ctx.sgl.mul_sgl.cur_sge_idx = i;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1552  	} else {
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1553  
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1554  		/* Multiple SGEs were used for this IO */
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1555  		sgl = &task->rxwr_only.union_ctx.read_info.sgl_ctx.sgl;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1556  		sgl->mul_sgl.cur_sge_addr.lo = (u32)phys_addr;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1557  		sgl->mul_sgl.cur_sge_addr.hi = (u32)((u64)phys_addr >> 32);
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1558  		sgl->mul_sgl.sgl_size = bd_count;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1559  		sgl->mul_sgl.cur_sge_off = offset; /*adjusted offset */
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1560  		sgl->mul_sgl.cur_sge_idx = i;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1561  
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1562  		memset(&task->rxwr_only.rx_seq_ctx, 0,
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1563  		       sizeof(struct fcoe_rx_seq_ctx));
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1564  		task->rxwr_only.rx_seq_ctx.low_exp_ro = orig_offset;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1565  		task->rxwr_only.rx_seq_ctx.high_exp_ro = orig_offset;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1566  	}
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1567  }
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1568  void bnx2fc_init_cleanup_task(struct bnx2fc_cmd *io_req,
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1569  			      struct fcoe_task_ctx_entry *task,
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1570  			      u16 orig_xid)
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1571  {
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1572  	u8 task_type = FCOE_TASK_TYPE_EXCHANGE_CLEANUP;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1573  	struct bnx2fc_rport *tgt = io_req->tgt;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1574  	u32 context_id = tgt->context_id;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1575  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1576  	memset(task, 0, sizeof(struct fcoe_task_ctx_entry));
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1577  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1578  	/* Tx Write Rx Read */
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1579  	/* init flags */
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1580  	task->txwr_rxrd.const_ctx.init_flags = task_type <<
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1581  				FCOE_TCE_TX_WR_RX_RD_CONST_TASK_TYPE_SHIFT;
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1582  	task->txwr_rxrd.const_ctx.init_flags |= FCOE_TASK_CLASS_TYPE_3 <<
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1583  				FCOE_TCE_TX_WR_RX_RD_CONST_CLASS_TYPE_SHIFT;
f3820b719d91a0 Bhanu Prakash Gollapudi 2011-07-27  1584  	if (tgt->dev_type == TYPE_TAPE)
f3820b719d91a0 Bhanu Prakash Gollapudi 2011-07-27  1585  		task->txwr_rxrd.const_ctx.init_flags |=
f3820b719d91a0 Bhanu Prakash Gollapudi 2011-07-27  1586  				FCOE_TASK_DEV_TYPE_TAPE <<
f3820b719d91a0 Bhanu Prakash Gollapudi 2011-07-27  1587  				FCOE_TCE_TX_WR_RX_RD_CONST_DEV_TYPE_SHIFT;
f3820b719d91a0 Bhanu Prakash Gollapudi 2011-07-27  1588  	else
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1589  		task->txwr_rxrd.const_ctx.init_flags |=
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1590  				FCOE_TASK_DEV_TYPE_DISK <<
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1591  				FCOE_TCE_TX_WR_RX_RD_CONST_DEV_TYPE_SHIFT;
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1592  	task->txwr_rxrd.union_ctx.cleanup.ctx.cleaned_task_id = orig_xid;
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1593  
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1594  	/* Tx flags */
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1595  	task->txwr_rxrd.const_ctx.tx_flags =
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1596  				FCOE_TASK_TX_STATE_EXCHANGE_CLEANUP <<
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1597  				FCOE_TCE_TX_WR_RX_RD_CONST_TX_STATE_SHIFT;
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1598  
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1599  	/* Rx Read Tx Write */
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1600  	task->rxwr_txrd.const_ctx.init_flags = context_id <<
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1601  				FCOE_TCE_RX_WR_TX_RD_CONST_CID_SHIFT;
619c5cb6885b93 Vlad Zolotarov          2011-06-14 @1602  	task->rxwr_txrd.var_ctx.rx_flags |= 1 <<
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1603  				FCOE_TCE_RX_WR_TX_RD_VAR_EXP_FIRST_FRAME_SHIFT;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1604  }
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1605  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1606  void bnx2fc_init_mp_task(struct bnx2fc_cmd *io_req,
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1607  				struct fcoe_task_ctx_entry *task)
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1608  {
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1609  	struct bnx2fc_mp_req *mp_req = &(io_req->mp_req);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1610  	struct bnx2fc_rport *tgt = io_req->tgt;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1611  	struct fc_frame_header *fc_hdr;
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1612  	struct fcoe_ext_mul_sges_ctx *sgl;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1613  	u8 task_type = 0;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1614  	u64 *hdr;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1615  	u64 temp_hdr[3];
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1616  	u32 context_id;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1617  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1618  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1619  	/* Obtain task_type */
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1620  	if ((io_req->cmd_type == BNX2FC_TASK_MGMT_CMD) ||
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1621  	    (io_req->cmd_type == BNX2FC_ELS)) {
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1622  		task_type = FCOE_TASK_TYPE_MIDPATH;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1623  	} else if (io_req->cmd_type == BNX2FC_ABTS) {
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1624  		task_type = FCOE_TASK_TYPE_ABTS;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1625  	}
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1626  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1627  	memset(task, 0, sizeof(struct fcoe_task_ctx_entry));
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1628  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1629  	/* Setup the task from io_req for easy reference */
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1630  	io_req->task = task;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1631  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1632  	BNX2FC_IO_DBG(io_req, "Init MP task for cmd_type = %d task_type = %d\n",
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1633  		io_req->cmd_type, task_type);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1634  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1635  	/* Tx only */
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1636  	if ((task_type == FCOE_TASK_TYPE_MIDPATH) ||
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1637  	    (task_type == FCOE_TASK_TYPE_UNSOLICITED)) {
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1638  		task->txwr_only.sgl_ctx.sgl.mul_sgl.cur_sge_addr.lo =
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1639  				(u32)mp_req->mp_req_bd_dma;
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1640  		task->txwr_only.sgl_ctx.sgl.mul_sgl.cur_sge_addr.hi =
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1641  				(u32)((u64)mp_req->mp_req_bd_dma >> 32);
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1642  		task->txwr_only.sgl_ctx.sgl.mul_sgl.sgl_size = 1;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1643  	}
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1644  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1645  	/* Tx Write Rx Read */
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1646  	/* init flags */
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1647  	task->txwr_rxrd.const_ctx.init_flags = task_type <<
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1648  				FCOE_TCE_TX_WR_RX_RD_CONST_TASK_TYPE_SHIFT;
f3820b719d91a0 Bhanu Prakash Gollapudi 2011-07-27  1649  	if (tgt->dev_type == TYPE_TAPE)
f3820b719d91a0 Bhanu Prakash Gollapudi 2011-07-27  1650  		task->txwr_rxrd.const_ctx.init_flags |=
f3820b719d91a0 Bhanu Prakash Gollapudi 2011-07-27  1651  				FCOE_TASK_DEV_TYPE_TAPE <<
f3820b719d91a0 Bhanu Prakash Gollapudi 2011-07-27  1652  				FCOE_TCE_TX_WR_RX_RD_CONST_DEV_TYPE_SHIFT;
f3820b719d91a0 Bhanu Prakash Gollapudi 2011-07-27  1653  	else
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1654  		task->txwr_rxrd.const_ctx.init_flags |=
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1655  				FCOE_TASK_DEV_TYPE_DISK <<
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1656  				FCOE_TCE_TX_WR_RX_RD_CONST_DEV_TYPE_SHIFT;
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1657  	task->txwr_rxrd.const_ctx.init_flags |= FCOE_TASK_CLASS_TYPE_3 <<
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1658  				FCOE_TCE_TX_WR_RX_RD_CONST_CLASS_TYPE_SHIFT;
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1659  
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1660  	/* tx flags */
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1661  	task->txwr_rxrd.const_ctx.tx_flags = FCOE_TASK_TX_STATE_INIT <<
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1662  				FCOE_TCE_TX_WR_RX_RD_CONST_TX_STATE_SHIFT;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1663  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1664  	/* Rx Write Tx Read */
619c5cb6885b93 Vlad Zolotarov          2011-06-14 @1665  	task->rxwr_txrd.const_ctx.data_2_trns = io_req->data_xfer_len;
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1666  
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1667  	/* rx flags */
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1668  	task->rxwr_txrd.var_ctx.rx_flags |= 1 <<
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1669  				FCOE_TCE_RX_WR_TX_RD_VAR_EXP_FIRST_FRAME_SHIFT;
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1670  
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1671  	context_id = tgt->context_id;
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1672  	task->rxwr_txrd.const_ctx.init_flags = context_id <<
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1673  				FCOE_TCE_RX_WR_TX_RD_CONST_CID_SHIFT;
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1674  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1675  	fc_hdr = &(mp_req->req_fc_hdr);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1676  	if (task_type == FCOE_TASK_TYPE_MIDPATH) {
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1677  		fc_hdr->fh_ox_id = cpu_to_be16(io_req->xid);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1678  		fc_hdr->fh_rx_id = htons(0xffff);
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1679  		task->rxwr_txrd.var_ctx.rx_id = 0xffff;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1680  	} else if (task_type == FCOE_TASK_TYPE_UNSOLICITED) {
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1681  		fc_hdr->fh_rx_id = cpu_to_be16(io_req->xid);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1682  	}
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1683  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1684  	/* Fill FC Header into middle path buffer */
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1685  	hdr = (u64 *) &task->txwr_rxrd.union_ctx.tx_frame.fc_hdr;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1686  	memcpy(temp_hdr, fc_hdr, sizeof(temp_hdr));
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1687  	hdr[0] = cpu_to_be64(temp_hdr[0]);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1688  	hdr[1] = cpu_to_be64(temp_hdr[1]);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1689  	hdr[2] = cpu_to_be64(temp_hdr[2]);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1690  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1691  	/* Rx Only */
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1692  	if (task_type == FCOE_TASK_TYPE_MIDPATH) {
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1693  		sgl = &task->rxwr_only.union_ctx.read_info.sgl_ctx.sgl;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1694  
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1695  		sgl->mul_sgl.cur_sge_addr.lo = (u32)mp_req->mp_resp_bd_dma;
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1696  		sgl->mul_sgl.cur_sge_addr.hi =
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1697  				(u32)((u64)mp_req->mp_resp_bd_dma >> 32);
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1698  		sgl->mul_sgl.sgl_size = 1;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1699  	}
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1700  }
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1701  

:::::: The code at line 1665 was first introduced by commit
:::::: 619c5cb6885b936c44ae1422ef805b69c6291485 New 7.0 FW: bnx2x, cnic, bnx2i, bnx2fc

:::::: TO: Vlad Zolotarov <vladz@broadcom.com>
:::::: CC: David S. Miller <davem@conan.davemloft.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
