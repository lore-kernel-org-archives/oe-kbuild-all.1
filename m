Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794780132;
	b=VQTyG6oAiIeZpFpIdyBOL5ztzWqPrA0LE+agYTuES/yxEtZL8L9pk7ri5FI+s0SrvDTH
	 7wIhqZL7rGbq8unFizlAl7H3XfxHnzsVXM79A8HGzSnrt/kdFqO+VK5E5dQ/fc/3EY47+
	 cL7AdblTG54N3yBdFtqul2ixEJBioDvSZST8coMRVnxC8Z8WDWDevnct8oP0+aMyS7gvc
	 CLq2u6Q9Rq+S1Br5srhUw0YlEIOQgVujRgA0vQ9g1f+0xnmv5GDLhMIdQhdxA470nAhTP
	 5yaIlcsf7Xcbi4OyRip/GmIhLdKXG0x2OUICJmV2o1w2ixAGYee7+7AgmLUtgkJUusQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794780132;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=INiN3hTDyuQ2r46Iba+le7OJx1XelwMPiSQerhOyNts=;
	b=WDtgP9KY9Kw7HWYqZZZ1uLSzfio0utpHsAZ89Tp8Wlvto+wyo9BUJvK4VcQb6+9jfYa1
	 3461mQqPrEM0k1J6E4ma8CbYARkLT47QooQbt1KSaOkIB+svs72OvjgzBzZ8K+cFLqeh4
	 VIdXzZcEJg7szZLHSP1Mjc8/ziQANni587pv2nVqWHSN6XDmYGyEbRr9PXAj8DumDqHUW
	 95M4Ut0JZR97lUUv7Q9L7/73Q+Rm+ERt+0lkdi+2e5sveNqW/WPUWgbWXlMpvey2IzRis
	 0pTMBeWgPm6+0HrGjZM8reljSJGZyNcsOweP0njFFL9cXt7l3pGg8hKLux+cNSP+oXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UtUp5zRA;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11194606A31F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Nov 2026 22:02:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11194606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UtUp5zRA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794780132; x=1826316132;
  h=date:from:to:cc:subject:message-id;
  bh=i3F5Y5NS99yAgYATTeYBDpWQ3atC5mOOsdvIcM0VasY=;
  b=UtUp5zRAIbyi3htGdGl3P49d+cTyvJbVWk2ZeC27+XnrXKC2bhZk57JM
   VbdKFrUW41alD1Po5PzOPjW/p+FPiMwP1PTXH/SOGRkETIvwJ2IwZrd6G
   oT1r/muU3QRbWRik2aHeTYh/tLQn+6AqStCrkiPjX2GSIRAFdNPu0ea/c
   BGGZJ7hcn9cDA9XZHupjLUU3HBkSJYW2kEOmr3MTjmqYOPY6na8IW/TCd
   +huf2wzVM6U1V7sPaQK/wpHgxUxY7dswhcStsSSK1ZvOj9XpLMUWBy2L5
   CR5qbQnget4xHhs6FHWZiJrZ1Vv0ZGB1B9km6r8FmxPYOtqBQq4W7rAOK
   Q==;
X-CSE-ConnectionGUID: 7myNcj/kT8a0dOMDxK80ow==
X-CSE-MsgGUID: hpNa1ffHSbScCuKgMRZCHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3551826"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3551826"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 14:02:12 -0800
X-CSE-ConnectionGUID: ixdZ7QU2Q+SSpeTdIywHLg==
X-CSE-MsgGUID: 8sCh8RtpSSWKH5PtBiJyyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="9646213"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 15 Nov 2026 14:02:10 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSiIa-000000002Rv-1n6j;
	Sun, 15 Nov 2026 22:02:08 +0000
Date: Sun, 15 Nov 2026 23:01:24 +0100
From: kernel test robot <lkp@intel.com>
To: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cornelisnetworks:for-upstream_20261115-1518 30/35]
 checkpatch: WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on
 each line
Message-ID: <202611152222.08MU8Fyh-lkp@intel.com>
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
commit: 0a3f4e96aef351e044df346e9d954c0c684614a7 [30/35] RDMA/hfi2: Add Data Movement Service (DMS) core protocol and state machine
reproduce: (https://download.01.org/0day-ci/archive/20261115/202611152222.08MU8Fyh-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#7586: FILE: drivers/infiniband/hw/hfi2/dms_core.c:5011:
+	/* TX side reads from local memory; receive-side write is
+		* fronted by the responder, not this inject.  See

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
