Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794779473;
	b=By+1A/GMmtnUdppCMJgsUaT3sRwb+VIMnJWzZtkAWiNdu0rgpDMcLLnHXFGGgLcXjXfF
	 kkghMvX9v8M8RWVOTjOTfxmCyZwrq2ou7nFdK8Ev9VMVsq/qpZYmY3fkr4n4K2uXr55Ov
	 F4vj8t4YEoKRy7PkYTIx+xyUg3KYhlst/h4clhIGuDJYwuuFp1jn4IqVkCouIkKiZYQPg
	 crvPCLgG91P4OUPkBIfXUqV7hmj0C0hlWmamFp0haVeHerMVbLpSbhcjX9GD7sJDNpoV6
	 Op+mIOqn4246WraNxEKsJO9HY8A4s0WuFtF5xCpjeuLmXZdCPkWNEhlHz19jDzw9hxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794779473;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ZZzj/riTTlBk172D0ZHGxlQRGS76ww0oE6l3CgRVclo=;
	b=xc9+TS7PnKciOy0kpr3U04Ehr/D553vrf33upXxJsssF9aoZxm8sJEu2Lg0DL5QtYgpP
	 E1K0+QEpE+8pfs+AC0kY+awbUYWhFT1DM+SM+pNJedKhHgGbmAJijGUidr/pZQJKa+NKZ
	 2GTbQJBRLI6V48KXfSsQjmdPeG3gCWD+OX9mgdZtEkv/+kEIz//SZ3cIMI4RiCTNiKzhf
	 NP6c/QCx+51dhv3RfYEyrDoIOGBBBIIMkpHJvKPzz3vx/7P6yWUS+ZJCboWrhjlbfyMGY
	 tWSVXnZhBqC4GOpPWTusa1DtXe1nI5h9izZP+OBZKEvre1b2ZEfJYQtIsgZy+75cTtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ksGLM5Zn;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6E5606A329
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Nov 2026 21:51:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B6E5606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ksGLM5Zn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794779473; x=1826315473;
  h=date:from:to:cc:subject:message-id;
  bh=pJqDXuzTIfoIEASLXn6JPt1TfNC9rafcpY+3qHoJiKM=;
  b=ksGLM5ZnGuDbHeQaBck/mZexZ6GuhYJ5llbS3cdENfvidnc5AaORh6q7
   Z4TdBbRAd20ZRdjXORo8PtNgViWckCwRbWgM05VvuWFtH0pWJhISgaJPp
   BGImeq5dOq82Q9CmMdzX3W3+I5XKz10L2xVXUCpynQrykqRW1pccdqddJ
   TLfjZbfTcGtYRiU/LlHwmrW9TvjABOOuWHQhHf+cUPo5q4/PzS9lo4Q/5
   d1t5tKKQp+ar8J7/Oka767OkyQ1auiRQmacXh10wUfE68OmYpXZMnivu1
   VIsan/ego25dzhHREivWkzyEpT4GfOHdQSD6PiE6GrM1SUfdWUVCwMEet
   A==;
X-CSE-ConnectionGUID: +n2KldMLRJS+sN0JtZXziA==
X-CSE-MsgGUID: bpAQliW5Q6WtTB+YuIb8wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3368320"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3368320"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 13:51:11 -0800
X-CSE-ConnectionGUID: /qUWgbRsSem7XUpa10liyg==
X-CSE-MsgGUID: HAJsjqVhR3egCqaGYQYYDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="9707427"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 15 Nov 2026 13:51:11 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSi7w-000000002RN-0GYs;
	Sun, 15 Nov 2026 21:51:08 +0000
Date: Sun, 15 Nov 2026 22:50:34 +0100
From: kernel test robot <lkp@intel.com>
To: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cornelisnetworks:for-upstream_20261115-1518 21/35]
 checkpatch: WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on
 each line
Message-ID: <202611152219.vaQK3AdZ-lkp@intel.com>
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
commit: 96412d129e9378aecbcf5fd1f9b7656e3953f763 [21/35] RDMA/hfi2: Add integrated Memory Region, dma-buf MR, CQ, and SRQ verbs
reproduce: (https://download.01.org/0day-ci/archive/20261115/202611152219.vaQK3AdZ-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#2002: FILE: drivers/infiniband/hw/hfi2/rvt_mr.c:1303:
+		 * would have executed.
+		*/

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#2129: FILE: drivers/infiniband/hw/hfi2/rvt_mr.c:1430:
+		 * would have executed.
+		*/

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
