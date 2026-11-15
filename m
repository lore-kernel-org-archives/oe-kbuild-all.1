Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794780735;
	b=fIMjpaF7x7taJtsYzG19EhtTiuqNnY+upenxBPxP3e9KfoQ7Qx0DUcI3jOGkQSvCxjRJ
	 55FnvUZzSthFOpZ8fmLv1EVzpTJJyrmC4taasslU80zah59CApchmT3O1RA7en6rRS0gD
	 wiEffY2PkFVf1b/VhQxEHlqdB3X7jJPdVmPmdIt4BZZGK3luKnNLhUuHz2/nY4eMZSnZ2
	 AbUpoHJDRsahrVzY95ktdDF2W5LxMzZk/hZ7lb2vpqgK0MAPnehR7GthH2gMbcuStniHp
	 xK17PZVrV11IHRKEW/F0dixjuz2TW5zr5xjt8fRGVWMGZw85uGKcLqz50J7744DmAFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794780735;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=JOpoSqwGDcLSfOZI/87TmjEXvfOltlxyyRTAi07ajwY=;
	b=JPx/uPKob8tCqL8sa5E28nzA69kkdoHG3T8+RUnMATmo6EUt7YyLO2UwuFG+05r4a/OW
	 /+DORNHWC0r5bqtwWglYwPrI2TDETdoHdgmM8Xw7Ws5KX50h5PBf0Blwx1c4C+7eV2xEe
	 GqDPxMzs3eeMEahRDFhVyxwr7VablmYffywr9+MatAos/v+N/DUL3Ed+yYWDIaloQOx80
	 DIvCu6220JyZ402HJxezUF8TQEW5bY6HV2o9+qx+XoYcWsvSOFxzD+fC6FXhX8HVRT7Ob
	 rYapDs4cKfZlXGCvXBBhdBCuQBB6rqIoESSUIj3Fg9w3mK2zUUwE/V00N2qJOMddNqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=djhMczHB;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D97606A31F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Nov 2026 22:12:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9D97606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=djhMczHB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794780733; x=1826316733;
  h=date:from:to:cc:subject:message-id;
  bh=7C1tptkTVVKGocRwOIJFJS2RudlUrAX6erzI/t3WGZA=;
  b=djhMczHBdwu18+6415QGqWg8Hz2LlfMKc8sOXbZuoVXS0nr6aP4vi69J
   XPHYrludhXDptfTAw7Vrh62ydYe9Et/lPgMgClve6PFznR7KuVLa7/8vx
   Gtpbqv9yi2+roAUBf59zY63XW23i0+q5ePwH7HVSUYFcMMUdQbEHVEtyM
   EOw/ZjpopRuJxHkZomHj9Z0/dKats8SOnkw3JVxozr+9wyei0uHYIVB9R
   KL0MhhLgBdtPGezCxs4p8VoQu4AKCc1PUo3zo5uxOcaiiywRnuIoPvTK6
   HMwTDB3LJPENAKu5s6B1kIKtc1JgEDq0ZZAAEOwV9SsK4kj18MtXx64mf
   g==;
X-CSE-ConnectionGUID: /vPStLvPQ3Caylm/c8cb3Q==
X-CSE-MsgGUID: N/0v1/oFSoGUfp0ddMk/xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3420968"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3420968"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 14:12:13 -0800
X-CSE-ConnectionGUID: 3eKBWPdYSg2Ov5SnoNOObg==
X-CSE-MsgGUID: n/aFAjueRtWdu+Ds+MJAxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="9233491"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 15 Nov 2026 14:12:13 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSiSI-000000002ST-1GF5;
	Sun, 15 Nov 2026 22:12:10 +0000
Date: Sun, 15 Nov 2026 23:12:06 +0100
From: kernel test robot <lkp@intel.com>
To: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cornelisnetworks:for-upstream_20261115-1518 31/35]
 checkpatch: ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the
 same indent
Message-ID: <202611152311.BeyHCO6z-lkp@intel.com>
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
commit: 81e5140e727e6630d0aa70a88d511743f22070c0 [31/35] RDMA/hfi2: Add DMS data transfer, SDMA, RoCE, and OPFN integration
reproduce: (https://download.01.org/0day-ci/archive/20261115/202611152311.BeyHCO6z-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#14106: FILE: drivers/infiniband/hw/hfi2/dms_roce.c:13817:
+	/*
+		 * A responder FIRST owns the real QPN; a drained private reply owns

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#14109: FILE: drivers/infiniband/hw/hfi2/dms_roce.c:13820:
+		 * an unrelated inbound WRITE during requester recovery.
+	 */

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#29493: FILE: drivers/infiniband/hw/hfi2/dms_xfer.c:5555:
+	switch (nack->info.err_type) {
+		case HFI2_DMS_ERR_TYPE_CLIENT_NOT_FOUND:
[...]
+		case HFI2_DMS_ERR_TYPE_ACCESS_NOT_FOUND:
[...]
+		case HFI2_DMS_ERR_TYPE_ACCESS_RANGE_VIOLATION:
[...]
+		case HFI2_DMS_ERR_TYPE_TRANSFER_SIZE_VIOLATION:
[...]
+		case HFI2_DMS_ERR_TYPE_NO_MEMORY:
[...]
+		case HFI2_DMS_ERR_TYPE_ACCESS_BUSY:
[...]
+		case HFI2_DMS_ERR_TYPE_RNR:
[...]
+		default:

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#29520: FILE: drivers/infiniband/hw/hfi2/dms_xfer.c:5582:
+	switch (nack->info.msg_type) {
+		case HFI2_DMS_MSG_TYPE_WRITE_START:
[...]
+		case HFI2_DMS_MSG_TYPE_READ_START:
+		case HFI2_DMS_MSG_TYPE_READ_START_SPECULATIVE:
+		case HFI2_DMS_MSG_TYPE_READ_START_REPLAY:
[...]
+		default:

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#30064: FILE: drivers/infiniband/hw/hfi2/dms_xfer.c:6126:
+			/* On NOT_FOUND, bump retry accounting and reinject; once the budget is
+				 * spent, terminate with -ETIMEDOUT so a START that never lands cannot

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
