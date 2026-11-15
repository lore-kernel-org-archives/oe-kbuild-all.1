Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794779473;
	b=v+uV7PuRHHi55ZTBw3tZsQYCoRvkQ2Upc5UuO90u74xfe47IntN0p974o850r3HwNHB+
	 snim3DoDyEyOQVtdtP0Be3tCYY7/sp9Gj3oBMvuoxj/+Ahjr8MHzRYzS8fsreegj7nTmw
	 MjvM/9WECYtfuwHPYREMPL3DIKmwv/euCCHmP7Bh9nV+b2dogYnOCOdSAoPqrD5C0R23N
	 2/Oyez+1ePeyUHP+k9AaFyYkbgyF6Ym2o6VasncW0rP/TSOPqXVAei/6/Kt17ioOGN3oQ
	 eMp9J4BRCrYJ3WSenllMF5pmxlB/YjvTuD0ITxvmDmoLnV5FSm7oQfq7N3EkzAX2Miw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794779473;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=TejlI4XyQmK95NJbKENKBXOObkxOpY3POL5Iav54HGY=;
	b=Oz9HEp9/mekekOrrxsjlMFqEfJkFzLPBxsI4GINEPW+gHuEv5vqGOZ7uZggEUU0RvvxO
	 pl/wmzmSMwREdBbRQ8hL+KbcO6frGV/ur7Qm10WBQMxBE1RcWqmUfiwsyGgncnvCNWymN
	 bmnWOJwfXGL8pS+Ks7H4JDIK1wPoktQY7ld314OSudb4hwyA3AtQuVZL8ffQRFfw+hdGt
	 GYQZWsqPuxDvHWCYpLmdAviyuTXFvdsNewm9r9LwK4uzb/AQv17VZIfA2eKtIF52xPfFj
	 uyKcYez3QwCy/yICjj3uSnun2grTenA1hn8sVMcgWniZWO0DdTmee7auRA8jiL2tNlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="i/R/2gtU";
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE72B606A32C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Nov 2026 21:51:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE72B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i/R/2gtU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794779471; x=1826315471;
  h=date:from:to:cc:subject:message-id;
  bh=yUWrzt9WWU/LSJqvTCYAjJyZWHlbiwdJWoQgkr3tHS4=;
  b=i/R/2gtUH2NOxYqgKihHHQDPJg5XuK9aLHjWCAecAT5pNpJ+Kmw62RVQ
   iPqCbCFpwzMlU9pXojlo/zXXkXCBcKLUOa3sR00p+zy2nclHtpPgci+pg
   xi6iJh/8fISZUuFZgGMB3nEkqsVyueRP3Bp3VVi+KAJHsj0fkFHaWT9AW
   Tzkhh/8RAjK+eqnidpdX1jSr8cAPM1USl5NPSwRfz6SMQYJtIZ8+1udFl
   4MyqTZySx5B2ydFR/C5ZeARxS0Yd85DCO1fd9+DhAY4VawercISNzEMBu
   bOwlolbEMMeVnC9qVSKbK3h9NBhOdKLLp7OgNUSDmEkgU0EbhyvfNLaAN
   A==;
X-CSE-ConnectionGUID: QsPff2JsQ2ee7ti3/aIqKw==
X-CSE-MsgGUID: TERfhoD5TwiZqeV1FoT94w==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3368316"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3368316"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 13:51:11 -0800
X-CSE-ConnectionGUID: MPuCaUs4TYCv8qsGwgTw0A==
X-CSE-MsgGUID: vJyT3fmxRWOkdkdtvLfkgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="9707423"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 15 Nov 2026 13:51:11 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSi7w-000000002RL-0339;
	Sun, 15 Nov 2026 21:51:08 +0000
Date: Sun, 15 Nov 2026 22:50:33 +0100
From: kernel test robot <lkp@intel.com>
To: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cornelisnetworks:for-upstream_20261115-1518 17/35]
 checkpatch: WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on
 each line
Message-ID: <202611152254.3RcN6Ki9-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/cornelisnetworks/linux.git for-upstream_20261115-1518
head:   16b51e7cd1a98a98348c7b3d5824a3507c8132fa
commit: 262533e119d2b388216d992039e0747feefbeb62 [17/35] RDMA/hfi2: Add SDMA engine infrastructure
reproduce: (https://download.01.org/0day-ci/archive/20261115/202611152254.3RcN6Ki9-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#4052: FILE: drivers/infiniband/hw/hfi2/sdma.c:4015:
+			/*
+			* SW initiated halt does not perform engines

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
