Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794780735;
	b=tGjO8t+po9Rwz4otaoRbQ3d4QLy5LzbVRQUb0OZwLPPaqGlAshyR9aaiITK1dCw27A/O
	 fJag+YGo7ildcsrYB1IUQ4U7MoRIUCBbCx//WnQjG9OgV5MNtmkrYqxz2HbMqyF7Z99NC
	 gUdqBXS/Q7dXbn3F0lHvFWMq9jAL20YDkI+Fa2Q+lu96Fcow0h4R5Ou9yj4D8dYBDZS0P
	 es04ZmBl0UNgK2ylOU9ziH/KUW3doKKtPamMpJ2Xw1WDNQVil+1DADOjQnmNqvZSdE1EP
	 fdKG9d81/Wm5QRUA+E/GL6lTkxbj/i/8kLqTtDVnPstfpK7tBqMHc7zj2Xfd+pUXeRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794780735;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=z1KZDm/csL5Fb0JgujykMu6ZVTIpN5JKG+1RpthkhUE=;
	b=wB4RfPljQtaOSCfjPYEnyB4eTNxM/hpsujk4MLV/nPH6J0lB9SWM+yEXiD+oRYFpyUTk
	 IeTDxHQOSrUcYZwbfGmwgFhVqin5AD37WqSnj/NaSRR1HMTPoQNhjEOb7NAAZrJWIFX6b
	 RXQXbUxov+8CFATmwZiyvR208n/f0S1zknLvnJNWgW5rdWHD70UnyeS6ihdUFqHlj2TY+
	 cxTO33ebLay5Wr7cFQrFafvUDqe6/P/ZwVdS/E3BbdNMa0cN8eYKGJKoOueXg9iq7qtOG
	 F++03uOJD23s4mfd+KhJI4oWkfniLRlx28n6tXBI0ypQL1pRk3EV5CZ02j2bh/H4OVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AKmnTzGW;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD1D606A329
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Nov 2026 22:12:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AD1D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AKmnTzGW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794780735; x=1826316735;
  h=date:from:to:cc:subject:message-id;
  bh=dUw6V4QfvkOhd2fCmlySnNkvd51xhLty/tKLshZ3qcc=;
  b=AKmnTzGWxHRKj893UiuVSEU2Och4W/lWc1Zl8d591ny08i5MNAACx1Nx
   NXZkrh2cnxwntA6CZ2uGpr6IHjbgOHOfHt27XfYsiclRC+CMgRhFYKlUZ
   uk0skhUTuj8UrbM8LcfY3SzdGy+37bNuw3M4TF+kSYNVMyjaW7sWe7feX
   ALlabeK70WvNbD6QnIB5JllLwj7Ojo/tXl2cWbJUlEhFovT8ECO2er92P
   GvdZIc/luAqE2cJO0DMzLg82Q/+HnwVWSKr7CUz6aJivNC+c5NR+VsjvM
   POjmDqeIasGReh/J+e68lDszjCq/Q9kJj0vqYrtfkfMoVbruOevZLT7P4
   g==;
X-CSE-ConnectionGUID: DHIosecpTDq4H7cKTTQnFQ==
X-CSE-MsgGUID: ZvQuC1cgRj2RKljlHt8POQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3420970"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3420970"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 14:12:13 -0800
X-CSE-ConnectionGUID: GSZHfu4HReGYARC0+LpeZA==
X-CSE-MsgGUID: SxvLkMmrSeqQB9qvGME0+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="9233493"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 15 Nov 2026 14:12:13 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSiSI-000000002SV-1Pwh;
	Sun, 15 Nov 2026 22:12:10 +0000
Date: Sun, 15 Nov 2026 23:12:07 +0100
From: kernel test robot <lkp@intel.com>
To: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cornelisnetworks:for-upstream_20261115-1518 32/35]
 checkpatch: ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the
 same indent
Message-ID: <202611152351.1zgc2BK9-lkp@intel.com>
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
commit: e4583810931efa539752a83235b7a2f8b0b5695a [32/35] RDMA/hfi2: Add Bulk Transfer Service (bulksvc) core and verbs engine
reproduce: (https://download.01.org/0day-ci/archive/20261115/202611152351.1zgc2BK9-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#404: FILE: drivers/infiniband/hw/hfi2/bulksvc.c:349:
+/** Sets the JKEY for both rcd and send_context as normal, but then marks
+  * the send_context's jkey mask to allow both dms jkeys.

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#3591: FILE: drivers/infiniband/hw/hfi2/bulksvc.c:3536:
+			switch (tracker->tx.op) {
+				case HFI2_DMS_TX_TRACKER_OP_RDMA_WRITE:
[...]
+				case HFI2_DMS_TX_TRACKER_OP_RDMA_READ:
[...]
+				default:

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#3632: FILE: drivers/infiniband/hw/hfi2/bulksvc.c:3577:
+			switch (tracker->rx.op) {
+				case HFI2_DMS_RX_TRACKER_OP_RDMA_READ:
[...]
+				case HFI2_DMS_RX_TRACKER_OP_RDMA_WRITE:
[...]
+				default:

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#8251: FILE: drivers/infiniband/hw/hfi2/bulksvc_verbs.c:2632:
+	switch (txreq->wqe->wr.opcode) {
+		case IB_WR_BULKSVC_READ:
[...]
+		case IB_WR_BULKSVC_WRITE:
[...]
+		case IB_WR_BULKSVC_WRITE_WITH_IMM:
[...]
+		case IB_WR_BULKSVC_SEND:
+		case IB_WR_BULKSVC_SEND_WITH_IMM:
[...]
+		default:

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#8324: FILE: drivers/infiniband/hw/hfi2/bulksvc_verbs.c:2705:
+	/*
+	* Duplicate of an already-delivered wr_seq: a WRITE_WITH_IMM replayed

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#8907: FILE: drivers/infiniband/hw/hfi2/bulksvc_verbs.c:3288:
+		switch (cmd->op) {
+			case HFI2_BULKSVC_VERBS_CMD_OP_RDMA:
[...]
+			case HFI2_BULKSVC_VERBS_CMD_OP_MR_REG:
[...]
+			case HFI2_BULKSVC_VERBS_CMD_OP_MR_DEREG:

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#9470: FILE: drivers/infiniband/hw/hfi2/bulksvc_verbs.c:3851:
+	switch (cmd->op) {
+		case HFI2_BULKSVC_VERBS_CMD_OP_RDMA:
[...]
+		case HFI2_BULKSVC_VERBS_CMD_OP_MR_REG:
[...]
+		case HFI2_BULKSVC_VERBS_CMD_OP_MR_DEREG:
[...]
+		default:

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#9543: FILE: drivers/infiniband/hw/hfi2/bulksvc_verbs.c:3924:
+	switch (cmpl->type) {
+		case HFI2_BULKSVC_VERBS_CMPL_TYPE_CMD:
[...]
+		case HFI2_BULKSVC_VERBS_CMPL_TYPE_ACCESS:

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#10739: FILE: drivers/infiniband/hw/hfi2/bulksvc_verbs.c:5120:
+/*
+* TODO: terminal give-up is not signalled to the peer.  When the

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
