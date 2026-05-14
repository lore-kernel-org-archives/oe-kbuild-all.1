Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46097393DC8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 10:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778755638; cv=none; b=jXIRJgeN3auDMjJ5lr+Hg2UmyqqAnEjyeHImL70DZyY6k/yfMCr2/6SXK4vGk5SLILiVTqyP9W1bHcRKjtHwOhRZki1QXgHkezWXpqNBhoP2w/bRqn59jZ4Tkd7TLW0PTh0WgTlglty1vVynJEYP8DGye8laVKV/ldr3RcB4It0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778755638; c=relaxed/simple;
	bh=IufKTUUxsyX/KGnI4umyiGTYvfuXeZAJUV5j0oEh32A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BPdndM99B/OYZeTi3MIe0swdhZA3oUTj7DcZyBw05EilK76CDOzCO38cXU6L92dQMRcEh2LxBIxtqbpQ/MeHfaVsHWh7mrhzK8YC9ddCN8eMHRa8BXOM29y+Ph32gfe6n6yDv8mbIFGRuTzzBTwuJhTxFEEdaBjBOGksoAvNljo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W3nqcQIU; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W3nqcQIU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778755635; x=1810291635;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IufKTUUxsyX/KGnI4umyiGTYvfuXeZAJUV5j0oEh32A=;
  b=W3nqcQIUjOY4OwgYDLFjVRL5TE5Qq7Uw9bC7qUwI8BSfKljTaCoi/qyL
   4TLFPmUo/y6yBgZ8/3wKXpLl0RAdi4wk54FZqchfu4pN7z6bhxSW6sDuG
   avrAGJbkrUmv/Q54UopEd/kRXpioG8RXrrTDWH5Z+dzuPYuex2BrfBQUG
   9PMdpdORa1U1BKozogsTzlvaAB45DgdqhIjon7xYMjHRX5HGRNziI3G8u
   qRn3znBZpkg+2Z9vKf9VFEmqw3WCJnHPDxPf605r5yva5K37istRTY/O0
   NgCyiA4ZCap+evnCgz3X8vP8SCBtYzwGrcPVfb0pGghzGMW4EIMC1uiwN
   A==;
X-CSE-ConnectionGUID: RTJLotQBRVmCWHTkOTD5Jw==
X-CSE-MsgGUID: OJ7eLv7oTLir3gaBRi212g==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="90389441"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="90389441"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 03:47:14 -0700
X-CSE-ConnectionGUID: x2iDor7KRNSbzU7WFOekXA==
X-CSE-MsgGUID: 0RKbhNQbR6+FUQmD8wp1Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="234073249"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 May 2026 03:47:12 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNTav-000000006NP-1Y5B;
	Thu, 14 May 2026 10:47:09 +0000
Date: Thu, 14 May 2026 18:46:43 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>,
 Johannes Berg <johannes@sipsolutions.net>,
 David Gow <davidgow@google.com>
Subject: drivers/scsi/bnx2fc/bnx2fc_els.c:95:25: sparse: sparse:
 incorrect type in argument 1 (different base types)
Message-ID: <202605141810.1pN68O6l-lkp@intel.com>
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
config: um-randconfig-r123-20260514 (https://download.01.org/0day-ci/archive/20260514/202605141810.1pN68O6l-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605141810.1pN68O6l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 031cdd3bc3f3 ("kunit: Enable PCI on UML without triggering WARN()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605141810.1pN68O6l-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/scsi/bnx2fc/bnx2fc_els.c:95:25: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] rx_id @@
   drivers/scsi/bnx2fc/bnx2fc_els.c:95:25: sparse:     expected unsigned short [usertype] val
   drivers/scsi/bnx2fc/bnx2fc_els.c:95:25: sparse:     got restricted __le16 [usertype] rx_id
   drivers/scsi/bnx2fc/bnx2fc_els.c:95:25: sparse: sparse: cast from restricted __le16
   drivers/scsi/bnx2fc/bnx2fc_els.c:95:25: sparse: sparse: cast from restricted __le16
   drivers/scsi/bnx2fc/bnx2fc_els.c:536:44: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/bnx2fc/bnx2fc_els.c:545:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [assigned] [usertype] offset @@     got restricted __le32 [usertype] rx_buf_off @@
   drivers/scsi/bnx2fc/bnx2fc_els.c:545:40: sparse:     expected unsigned int [assigned] [usertype] offset
   drivers/scsi/bnx2fc/bnx2fc_els.c:545:40: sparse:     got restricted __le32 [usertype] rx_buf_off
   drivers/scsi/bnx2fc/bnx2fc_els.c:608:25: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] rx_id @@
   drivers/scsi/bnx2fc/bnx2fc_els.c:608:25: sparse:     expected unsigned short [usertype] val
   drivers/scsi/bnx2fc/bnx2fc_els.c:608:25: sparse:     got restricted __le16 [usertype] rx_id
   drivers/scsi/bnx2fc/bnx2fc_els.c:608:25: sparse: sparse: cast from restricted __le16
   drivers/scsi/bnx2fc/bnx2fc_els.c:608:25: sparse: sparse: cast from restricted __le16
   drivers/scsi/bnx2fc/bnx2fc_els.c:648:25: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] rx_id @@
   drivers/scsi/bnx2fc/bnx2fc_els.c:648:25: sparse:     expected unsigned short [usertype] val
   drivers/scsi/bnx2fc/bnx2fc_els.c:648:25: sparse:     got restricted __le16 [usertype] rx_id
   drivers/scsi/bnx2fc/bnx2fc_els.c:648:25: sparse: sparse: cast from restricted __le16
   drivers/scsi/bnx2fc/bnx2fc_els.c:648:25: sparse: sparse: cast from restricted __le16
   drivers/scsi/bnx2fc/bnx2fc_els.c:841:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __be64 [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_els.c:841:16: sparse:     expected unsigned long long [usertype]
   drivers/scsi/bnx2fc/bnx2fc_els.c:841:16: sparse:     got restricted __be64 [usertype]
   drivers/scsi/bnx2fc/bnx2fc_els.c:842:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __be64 [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_els.c:842:16: sparse:     expected unsigned long long [usertype]
   drivers/scsi/bnx2fc/bnx2fc_els.c:842:16: sparse:     got restricted __be64 [usertype]
   drivers/scsi/bnx2fc/bnx2fc_els.c:843:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __be64 [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_els.c:843:16: sparse:     expected unsigned long long [usertype]
   drivers/scsi/bnx2fc/bnx2fc_els.c:843:16: sparse:     got restricted __be64 [usertype]
   drivers/scsi/bnx2fc/bnx2fc_els.c:845:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] resp_len @@     got restricted __le32 [usertype] mp_payload_len @@
   drivers/scsi/bnx2fc/bnx2fc_els.c:845:26: sparse:     expected unsigned int [usertype] resp_len
   drivers/scsi/bnx2fc/bnx2fc_els.c:845:26: sparse:     got restricted __le32 [usertype] mp_payload_len
   drivers/scsi/bnx2fc/bnx2fc_els.c: note: in included file (through include/scsi/libfcoe.h, drivers/scsi/bnx2fc/bnx2fc.h):
   include/scsi/fc/fc_fcoe.h:89:36: sparse: sparse: cast truncates bits from constant value (efc becomes fc)
   include/scsi/fc/fc_fcoe.h:90:23: sparse: sparse: cast truncates bits from constant value (efc00 becomes 0)
--
   drivers/scsi/bnx2fc/bnx2fc_io.c:1638:53: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] buf_addr_lo @@     got unsigned long long @@
   drivers/scsi/bnx2fc/bnx2fc_io.c:1638:53: sparse:     expected restricted __le32 [usertype] buf_addr_lo
   drivers/scsi/bnx2fc/bnx2fc_io.c:1638:53: sparse:     got unsigned long long
   drivers/scsi/bnx2fc/bnx2fc_io.c:1639:54: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] buf_addr_hi @@     got unsigned long long @@
   drivers/scsi/bnx2fc/bnx2fc_io.c:1639:54: sparse:     expected restricted __le32 [usertype] buf_addr_hi
   drivers/scsi/bnx2fc/bnx2fc_io.c:1639:54: sparse:     got unsigned long long
   drivers/scsi/bnx2fc/bnx2fc_io.c:1640:49: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] buf_len @@     got unsigned short [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_io.c:1640:49: sparse:     expected restricted __le16 [usertype] buf_len
   drivers/scsi/bnx2fc/bnx2fc_io.c:1640:49: sparse:     got unsigned short [usertype]
   drivers/scsi/bnx2fc/bnx2fc_io.c:1682:50: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] buf_addr_lo @@     got unsigned long long @@
   drivers/scsi/bnx2fc/bnx2fc_io.c:1682:50: sparse:     expected restricted __le32 [usertype] buf_addr_lo
   drivers/scsi/bnx2fc/bnx2fc_io.c:1682:50: sparse:     got unsigned long long
   drivers/scsi/bnx2fc/bnx2fc_io.c:1683:51: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] buf_addr_hi @@     got unsigned long long @@
   drivers/scsi/bnx2fc/bnx2fc_io.c:1683:51: sparse:     expected restricted __le32 [usertype] buf_addr_hi
   drivers/scsi/bnx2fc/bnx2fc_io.c:1683:51: sparse:     got unsigned long long
   drivers/scsi/bnx2fc/bnx2fc_io.c:1684:46: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] buf_len @@     got unsigned short [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_io.c:1684:46: sparse:     expected restricted __le16 [usertype] buf_len
   drivers/scsi/bnx2fc/bnx2fc_io.c:1684:46: sparse:     got unsigned short [usertype]
   drivers/scsi/bnx2fc/bnx2fc_io.c:1771:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] fcp_resid @@     got restricted __le32 [usertype] fcp_resid @@
   drivers/scsi/bnx2fc/bnx2fc_io.c:1771:35: sparse:     expected unsigned int [usertype] fcp_resid
   drivers/scsi/bnx2fc/bnx2fc_io.c:1771:35: sparse:     got restricted __le32 [usertype] fcp_resid
   drivers/scsi/bnx2fc/bnx2fc_io.c:1788:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] rq_buff_len @@     got restricted __le32 [usertype] fcp_rsp_len @@
   drivers/scsi/bnx2fc/bnx2fc_io.c:1788:41: sparse:     expected unsigned int [usertype] rq_buff_len
   drivers/scsi/bnx2fc/bnx2fc_io.c:1788:41: sparse:     got restricted __le32 [usertype] fcp_rsp_len
   drivers/scsi/bnx2fc/bnx2fc_io.c:1793:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected int fcp_sns_len @@     got restricted __le32 [usertype] fcp_sns_len @@
   drivers/scsi/bnx2fc/bnx2fc_io.c:1793:37: sparse:     expected int fcp_sns_len
   drivers/scsi/bnx2fc/bnx2fc_io.c:1793:37: sparse:     got restricted __le32 [usertype] fcp_sns_len
   drivers/scsi/bnx2fc/bnx2fc_io.c:1794:37: sparse: sparse: invalid assignment: +=
   drivers/scsi/bnx2fc/bnx2fc_io.c:1794:37: sparse:    left side has type unsigned int
   drivers/scsi/bnx2fc/bnx2fc_io.c:1794:37: sparse:    right side has type restricted __le32
   drivers/scsi/bnx2fc/bnx2fc_io.c:639:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] buf_addr_lo @@     got unsigned int @@
   drivers/scsi/bnx2fc/bnx2fc_io.c:639:32: sparse:     expected restricted __le32 [usertype] buf_addr_lo
   drivers/scsi/bnx2fc/bnx2fc_io.c:639:32: sparse:     got unsigned int
   drivers/scsi/bnx2fc/bnx2fc_io.c:640:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] buf_addr_hi @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_io.c:640:32: sparse:     expected restricted __le32 [usertype] buf_addr_hi
   drivers/scsi/bnx2fc/bnx2fc_io.c:640:32: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_io.c:641:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] buf_len @@     got int @@
   drivers/scsi/bnx2fc/bnx2fc_io.c:641:28: sparse:     expected restricted __le16 [usertype] buf_len
   drivers/scsi/bnx2fc/bnx2fc_io.c:641:28: sparse:     got int
   drivers/scsi/bnx2fc/bnx2fc_io.c:651:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] buf_addr_lo @@     got unsigned int @@
   drivers/scsi/bnx2fc/bnx2fc_io.c:651:33: sparse:     expected restricted __le32 [usertype] buf_addr_lo
   drivers/scsi/bnx2fc/bnx2fc_io.c:651:33: sparse:     got unsigned int
   drivers/scsi/bnx2fc/bnx2fc_io.c:652:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] buf_addr_hi @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_io.c:652:33: sparse:     expected restricted __le32 [usertype] buf_addr_hi
   drivers/scsi/bnx2fc/bnx2fc_io.c:652:33: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_io.c:653:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] buf_len @@     got int @@
   drivers/scsi/bnx2fc/bnx2fc_io.c:653:29: sparse:     expected restricted __le16 [usertype] buf_len
   drivers/scsi/bnx2fc/bnx2fc_io.c:653:29: sparse:     got int
>> drivers/scsi/bnx2fc/bnx2fc_io.c:880:28: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] rx_id @@
   drivers/scsi/bnx2fc/bnx2fc_io.c:880:28: sparse:     expected unsigned short [usertype] val
   drivers/scsi/bnx2fc/bnx2fc_io.c:880:28: sparse:     got restricted __le16 [usertype] rx_id
   drivers/scsi/bnx2fc/bnx2fc_io.c:880:28: sparse: sparse: cast from restricted __le16
   drivers/scsi/bnx2fc/bnx2fc_io.c:880:28: sparse: sparse: cast from restricted __le16
   drivers/scsi/bnx2fc/bnx2fc_io.c:1553:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __be64 [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_io.c:1553:16: sparse:     expected unsigned long long [usertype]
   drivers/scsi/bnx2fc/bnx2fc_io.c:1553:16: sparse:     got restricted __be64 [usertype]
   drivers/scsi/bnx2fc/bnx2fc_io.c:1554:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __be64 [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_io.c:1554:16: sparse:     expected unsigned long long [usertype]
   drivers/scsi/bnx2fc/bnx2fc_io.c:1554:16: sparse:     got restricted __be64 [usertype]
   drivers/scsi/bnx2fc/bnx2fc_io.c:1555:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __be64 [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_io.c:1555:16: sparse:     expected unsigned long long [usertype]
   drivers/scsi/bnx2fc/bnx2fc_io.c:1555:16: sparse:     got restricted __be64 [usertype]
   drivers/scsi/bnx2fc/bnx2fc_io.c:1557:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] resp_len @@     got restricted __le32 [usertype] mp_payload_len @@
   drivers/scsi/bnx2fc/bnx2fc_io.c:1557:26: sparse:     expected unsigned int [usertype] resp_len
   drivers/scsi/bnx2fc/bnx2fc_io.c:1557:26: sparse:     got restricted __le32 [usertype] mp_payload_len
   drivers/scsi/bnx2fc/bnx2fc_io.c:1993:56: sparse: sparse: restricted __le16 degrades to integer
   drivers/scsi/bnx2fc/bnx2fc_io.c:1996:60: sparse: sparse: restricted __le16 degrades to integer
   drivers/scsi/bnx2fc/bnx2fc_io.c:1800:44: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/scsi/bnx2fc/bnx2fc_io.c:1800:44: sparse: signed value source
--
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:202:30: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] sq_addr_lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:202:30: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:203:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] sq_addr_hi @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:203:30: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] sq_addr_hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:203:30: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:205:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] rq_pbl_addr_lo @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:205:34: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] rq_pbl_addr_lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:205:34: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:206:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] rq_pbl_addr_hi @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:206:34: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] rq_pbl_addr_hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:206:34: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:208:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] rq_first_pbe_addr_lo @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:208:40: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] rq_first_pbe_addr_lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:208:40: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:209:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] rq_first_pbe_addr_hi @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:209:40: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] rq_first_pbe_addr_hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:209:40: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:212:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] rq_prod @@     got int @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:212:27: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] rq_prod
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:212:27: sparse:     got int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:221:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] tx_max_fc_pay_len @@     got unsigned short [usertype] maxframe_size @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:221:37: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] tx_max_fc_pay_len
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:221:37: sparse:     got unsigned short [usertype] maxframe_size
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:223:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] cq_addr_lo @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:223:30: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] cq_addr_lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:223:30: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:224:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] cq_addr_hi @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:224:30: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] cq_addr_hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:224:30: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:226:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] xferq_addr_lo @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:226:33: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] xferq_addr_lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:226:33: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:227:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] xferq_addr_hi @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:227:33: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] xferq_addr_hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:227:33: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:229:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] conn_db_addr_lo @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:229:35: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] conn_db_addr_lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:229:35: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:230:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] conn_db_addr_hi @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:230:35: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] conn_db_addr_hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:230:35: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:239:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] vlan_tag @@     got int @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:239:28: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] vlan_tag
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:239:28: sparse:     got int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:241:28: sparse: sparse: invalid assignment: |=
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:241:28: sparse:    left side has type restricted __le16
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:241:28: sparse:    right side has type int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:264:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] tx_total_conc_seqs @@     got unsigned short [usertype] max_seq @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:264:38: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] tx_total_conc_seqs
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:264:38: sparse:     got unsigned short [usertype] max_seq
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:267:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] rx_max_fc_pay_len @@     got unsigned int [usertype] mfs @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:267:38: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] rx_max_fc_pay_len
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:267:38: sparse:     got unsigned int [usertype] mfs
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:269:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] rx_total_conc_seqs @@     got int @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:269:38: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] rx_total_conc_seqs
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:269:38: sparse:     got int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:273:43: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] confq_first_pbe_addr_lo @@     got unsigned int [usertype] confq_dma @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:273:43: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] confq_first_pbe_addr_lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:273:43: sparse:     got unsigned int [usertype] confq_dma
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:274:43: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] confq_first_pbe_addr_hi @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:274:43: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] confq_first_pbe_addr_hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:274:43: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:332:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] lcq_addr_lo @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:332:31: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] lcq_addr_lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:332:31: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:333:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] lcq_addr_hi @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:333:31: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] lcq_addr_hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:333:31: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:335:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] confq_pbl_base_addr_lo @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:335:42: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] confq_pbl_base_addr_lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:335:42: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:336:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] confq_pbl_base_addr_hi @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:336:42: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] confq_pbl_base_addr_hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:336:42: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:410:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] context_id @@     got unsigned int [usertype] context_id @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:410:29: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] context_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:410:29: sparse:     got unsigned int [usertype] context_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:411:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] conn_id @@     got unsigned int [usertype] fcoe_conn_id @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:411:26: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] conn_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:411:26: sparse:     got unsigned int [usertype] fcoe_conn_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:469:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] context_id @@     got unsigned int [usertype] context_id @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:469:32: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] context_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:469:32: sparse:     got unsigned int [usertype] context_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:470:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] conn_id @@     got unsigned int [usertype] fcoe_conn_id @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:470:29: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] conn_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:470:29: sparse:     got unsigned int [usertype] fcoe_conn_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:504:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] context_id @@     got unsigned int [usertype] context_id @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:504:32: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] context_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:504:32: sparse:     got unsigned int [usertype] context_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:505:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] conn_id @@     got unsigned int [usertype] fcoe_conn_id @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:505:29: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] conn_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:505:29: sparse:     got unsigned int [usertype] fcoe_conn_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:613:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] fr_crc @@     got restricted __le32 [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:613:28: sparse:     expected unsigned int [usertype] fr_crc
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:613:28: sparse:     got restricted __le32 [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:695:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] xid @@     got restricted __le16 [usertype] ox_id @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:695:21: sparse:     expected unsigned short [usertype] xid
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:695:21: sparse:     got restricted __le16 [usertype] ox_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:727:27: sparse: sparse: cast from restricted __le32
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:728:26: sparse: sparse: cast from restricted __le32
>> drivers/scsi/bnx2fc/bnx2fc_hwi.c:807:23: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] ox_id @@
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
>> drivers/scsi/bnx2fc/bnx2fc_hwi.c:966:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] @@
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
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1665:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] data_2_trns @@     got unsigned int [usertype] data_xfer_len @@
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

vim +95 drivers/scsi/bnx2fc/bnx2fc_els.c

853e2bd2103aaa Bhanu Gollapudi 2011-02-04   62  
853e2bd2103aaa Bhanu Gollapudi 2011-02-04   63  	struct fc_els_rrq rrq;
853e2bd2103aaa Bhanu Gollapudi 2011-02-04   64  	struct bnx2fc_rport *tgt = aborted_io_req->tgt;
de08f46b90d3b3 Chad Dupuis     2017-06-26   65  	struct fc_lport *lport = NULL;
853e2bd2103aaa Bhanu Gollapudi 2011-02-04   66  	struct bnx2fc_els_cb_arg *cb_arg = NULL;
de08f46b90d3b3 Chad Dupuis     2017-06-26   67  	u32 sid = 0;
de08f46b90d3b3 Chad Dupuis     2017-06-26   68  	u32 r_a_tov = 0;
853e2bd2103aaa Bhanu Gollapudi 2011-02-04   69  	unsigned long start = jiffies;
853e2bd2103aaa Bhanu Gollapudi 2011-02-04   70  	int rc;
853e2bd2103aaa Bhanu Gollapudi 2011-02-04   71  
de08f46b90d3b3 Chad Dupuis     2017-06-26   72  	if (!test_bit(BNX2FC_FLAG_SESSION_READY, &tgt->flags))
de08f46b90d3b3 Chad Dupuis     2017-06-26   73  		return -EINVAL;
de08f46b90d3b3 Chad Dupuis     2017-06-26   74  
de08f46b90d3b3 Chad Dupuis     2017-06-26   75  	lport = tgt->rdata->local_port;
de08f46b90d3b3 Chad Dupuis     2017-06-26   76  	sid = tgt->sid;
de08f46b90d3b3 Chad Dupuis     2017-06-26   77  	r_a_tov = lport->r_a_tov;
de08f46b90d3b3 Chad Dupuis     2017-06-26   78  
853e2bd2103aaa Bhanu Gollapudi 2011-02-04   79  	BNX2FC_ELS_DBG("Sending RRQ orig_xid = 0x%x\n",
853e2bd2103aaa Bhanu Gollapudi 2011-02-04   80  		   aborted_io_req->xid);
853e2bd2103aaa Bhanu Gollapudi 2011-02-04   81  	memset(&rrq, 0, sizeof(rrq));
853e2bd2103aaa Bhanu Gollapudi 2011-02-04   82  
853e2bd2103aaa Bhanu Gollapudi 2011-02-04   83  	cb_arg = kzalloc(sizeof(struct bnx2fc_els_cb_arg), GFP_NOIO);
853e2bd2103aaa Bhanu Gollapudi 2011-02-04   84  	if (!cb_arg) {
853e2bd2103aaa Bhanu Gollapudi 2011-02-04   85  		printk(KERN_ERR PFX "Unable to allocate cb_arg for RRQ\n");
853e2bd2103aaa Bhanu Gollapudi 2011-02-04   86  		rc = -ENOMEM;
853e2bd2103aaa Bhanu Gollapudi 2011-02-04   87  		goto rrq_err;
853e2bd2103aaa Bhanu Gollapudi 2011-02-04   88  	}
853e2bd2103aaa Bhanu Gollapudi 2011-02-04   89  
853e2bd2103aaa Bhanu Gollapudi 2011-02-04   90  	cb_arg->aborted_io_req = aborted_io_req;
853e2bd2103aaa Bhanu Gollapudi 2011-02-04   91  
853e2bd2103aaa Bhanu Gollapudi 2011-02-04   92  	rrq.rrq_cmd = ELS_RRQ;
853e2bd2103aaa Bhanu Gollapudi 2011-02-04   93  	hton24(rrq.rrq_s_id, sid);
853e2bd2103aaa Bhanu Gollapudi 2011-02-04   94  	rrq.rrq_ox_id = htons(aborted_io_req->xid);
619c5cb6885b93 Vlad Zolotarov  2011-06-14  @95  	rrq.rrq_rx_id = htons(aborted_io_req->task->rxwr_txrd.var_ctx.rx_id);
853e2bd2103aaa Bhanu Gollapudi 2011-02-04   96  
853e2bd2103aaa Bhanu Gollapudi 2011-02-04   97  retry_rrq:
853e2bd2103aaa Bhanu Gollapudi 2011-02-04   98  	rc = bnx2fc_initiate_els(tgt, ELS_RRQ, &rrq, sizeof(rrq),
853e2bd2103aaa Bhanu Gollapudi 2011-02-04   99  				 bnx2fc_rrq_compl, cb_arg,
853e2bd2103aaa Bhanu Gollapudi 2011-02-04  100  				 r_a_tov);
853e2bd2103aaa Bhanu Gollapudi 2011-02-04  101  	if (rc == -ENOMEM) {
853e2bd2103aaa Bhanu Gollapudi 2011-02-04  102  		if (time_after(jiffies, start + (10 * HZ))) {
853e2bd2103aaa Bhanu Gollapudi 2011-02-04  103  			BNX2FC_ELS_DBG("rrq Failed\n");
853e2bd2103aaa Bhanu Gollapudi 2011-02-04  104  			rc = FAILED;
853e2bd2103aaa Bhanu Gollapudi 2011-02-04  105  			goto rrq_err;
853e2bd2103aaa Bhanu Gollapudi 2011-02-04  106  		}
853e2bd2103aaa Bhanu Gollapudi 2011-02-04  107  		msleep(20);
853e2bd2103aaa Bhanu Gollapudi 2011-02-04  108  		goto retry_rrq;
853e2bd2103aaa Bhanu Gollapudi 2011-02-04  109  	}
853e2bd2103aaa Bhanu Gollapudi 2011-02-04  110  rrq_err:
853e2bd2103aaa Bhanu Gollapudi 2011-02-04  111  	if (rc) {
853e2bd2103aaa Bhanu Gollapudi 2011-02-04  112  		BNX2FC_ELS_DBG("RRQ failed - release orig io req 0x%x\n",
853e2bd2103aaa Bhanu Gollapudi 2011-02-04  113  			aborted_io_req->xid);
853e2bd2103aaa Bhanu Gollapudi 2011-02-04  114  		kfree(cb_arg);
853e2bd2103aaa Bhanu Gollapudi 2011-02-04  115  		spin_lock_bh(&tgt->tgt_lock);
853e2bd2103aaa Bhanu Gollapudi 2011-02-04  116  		kref_put(&aborted_io_req->refcount, bnx2fc_cmd_release);
853e2bd2103aaa Bhanu Gollapudi 2011-02-04  117  		spin_unlock_bh(&tgt->tgt_lock);
853e2bd2103aaa Bhanu Gollapudi 2011-02-04  118  	}
853e2bd2103aaa Bhanu Gollapudi 2011-02-04  119  	return rc;
853e2bd2103aaa Bhanu Gollapudi 2011-02-04  120  }
853e2bd2103aaa Bhanu Gollapudi 2011-02-04  121  

:::::: The code at line 95 was first introduced by commit
:::::: 619c5cb6885b936c44ae1422ef805b69c6291485 New 7.0 FW: bnx2x, cnic, bnx2i, bnx2fc

:::::: TO: Vlad Zolotarov <vladz@broadcom.com>
:::::: CC: David S. Miller <davem@conan.davemloft.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
