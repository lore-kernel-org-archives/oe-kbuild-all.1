Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794779473;
	b=st15m1E29vnirroeHZg+e/gCCssc5ux5LvMI3heF25zmzan2XDU8yR7Fe2UcjvGxEDgI
	 TrkBnxrfS3/9+mPOQlOV5KnIh6NaGe05G1LfamLQMP5wCrrnVBCs1931/kn3PDucdapen
	 d7fwep+SbJpD5D1TuQAHyEaAb2m2r/rfgZ/jFMnjCqUaesyTqowVKe+YSYvafPRFPQ75i
	 OIQh6HaEMY8TfI9yPJtud47OuHvgNp52IY/6CFNW8xjK+t7F2cjFxVaoPO0LaEal3+bQ/
	 eYlPEf9FrYcLi+3WrpQO4UvRJJJHnLLuPqzid7BX8u2SZPn0TqB6WLNxA9NTNs1ol5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794779473;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=XvogwhKA+YqS2n4xxb40Toeg0VX2CSsKfKvyvkyhr1A=;
	b=sy+ZIgjobVj/O6nD9LOeT4e7s3YadlzXLk0QpOVItfFkbLtDvHACR0KWtloLTyv6Cw9q
	 TdbcWaJ7nfqWzZyNeL6Xe9GJf4Z5sn9YHZ0TXaF/F+oDrdGYv2o63CVJz2bdXFu2moghy
	 Q3fOksBNEoqfUzll9OEzGy6Y3o6LZ2plqfTXxaDFchgDbh5NPC0P5u1PlBet0iD+1a9AP
	 K6a2Xiap4Sj63kMqtPzyGW981oU5XItqvr/bX+sF/I+yT59HUQ/ax2UxkISJKOSBr4hzY
	 GyuQTm+ZiK/Y3yC4wIfiP7Y5q/Pxp0wSQmbdRkWGRwMSRkA6BdwPOY3kspQQqn/XvIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eeGGxS4g;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A68C606A323
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Nov 2026 21:51:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A68C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eeGGxS4g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794779473; x=1826315473;
  h=date:from:to:cc:subject:message-id;
  bh=LvuHwhhwMJiPMuEdRT81xj39EJQGJ3J4CfectedsFqU=;
  b=eeGGxS4g/j85Pf3zMcUDBNoxt6owIlwLzcuxvUj8vUg83UhnRL94pEvp
   +lyhLbyysUb6mGwE8NVjXZTooJ9REtkTbQSFM4yOgI6cxpaSLGVi8eAmD
   GFzXeM+xTFC5zQr/ZMDxIgiEOcn6cXpS7DGYAVkgu46t5Kdpa5BETkKbi
   pCnYxMC8Qz7p7X0+ITJqV8EKInJrtCP+0u78AElFW+1VqlEA4kS9CLfc0
   pQfq9wf/BAlGty5xiLqtK+aFf7+p4XNqsbMdIyEyMUUkePcJXQbb0a9SB
   nQnUe/iOxeGHaeabMzn0HOTW7klsg4SEd6hU9ezxNbON65jRYCHNRTrIz
   g==;
X-CSE-ConnectionGUID: kZgDjCOiQBuPkmig8envHA==
X-CSE-MsgGUID: TWRfidHtSM2oYWvqiSOLWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3368318"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3368318"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 13:51:11 -0800
X-CSE-ConnectionGUID: XeQHjr/QT2uprSDxJiTSzg==
X-CSE-MsgGUID: YjgfWCUyTdimnTDXor5uHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="9707426"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 15 Nov 2026 13:51:11 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSi7w-000000002RP-0Qx0;
	Sun, 15 Nov 2026 21:51:08 +0000
Date: Sun, 15 Nov 2026 22:50:48 +0100
From: kernel test robot <lkp@intel.com>
To: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cornelisnetworks:for-upstream_20261115-1518 28/35]
 checkpatch: WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on
 each line
Message-ID: <202611152259.BzUyG0TA-lkp@intel.com>
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
commit: 9c7816414e5e166dc5f3eb253be57e46c8e13183 [28/35] RDMA/hfi2: Add RoCEv2 protocol and verbs integration
reproduce: (https://download.01.org/0day-ci/archive/20261115/202611152259.BzUyG0TA-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#93: FILE: drivers/infiniband/hw/hfi2/roce.h:49:
+ *
+	 * Layout note: @common MUST be the first member, mirroring the

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#100: FILE: drivers/infiniband/hw/hfi2/roce.h:56:
+ *
+	 * Many fields here are populated lazily at modify_qp(RTR) time and

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
