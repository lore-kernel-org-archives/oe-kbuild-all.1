Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE172750E6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Apr 2026 19:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777489944; cv=none; b=Kmb8gXCnxkb5uqgbgd43q9+/0WvAhSNq2C9m7BXV1q8upALdYQxPmBPfM/RfaaOScofsFZ865hbrxR2JC75TwnSrN1azNXanFOMUNz+rSVjB1BqQz/EFc72raXsJ1zgRupI0l9QU/PpNML5363FRHYiQa+dzeTv4L7PXwYyZjJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777489944; c=relaxed/simple;
	bh=MV+NOsFkYoyITpaO4DN0YnR0LTu7pgCXK1WTFNu0T2w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mUy5SW/DbV+/O+d3nxxbYchW/OgbxkOL78DPZnCkjA4Ze2QuW8STs+LsHtKQGNVk3DvvUje9cl6yIreSKEa4BxbeqyNqN+VnH5J4pZZd77bJcoQc0+xATi8Jf/aOgb3bNhuvx3C5Bt4GAdRqfhQvaITX6gNTbrtEtdFa7Th6x6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MHqhkPQ3; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MHqhkPQ3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777489943; x=1809025943;
  h=date:from:to:cc:subject:message-id;
  bh=MV+NOsFkYoyITpaO4DN0YnR0LTu7pgCXK1WTFNu0T2w=;
  b=MHqhkPQ3i4TOT0XK5qlXlNFa3Pzw/3ai1e3QVoidsQumCz/Y7yXZAySO
   hXgnkZZQMFvEW15nP1jMOazt1CGL/db1MH7y2V6qAZg2WSk84L36zdM1t
   7MSSfM70bPXd1adHVE7RhaXvofJTbe0YwpETA4qxdkhI+USB/GQBQF4kf
   IejbeBOmy34fkT03NvDVaoPNN5RQDuU/vBoBDoEBMyxvga3CAV6aJwBRq
   PZcNfmdfhzGF1gOdE3Acon3pl9GxsNEzDc+XwuC0izW6SnAwvplXkv9EG
   OhoAWXrOjY81BjVdVV4XJnzt2mPfZq8gGIAfweWg18vTf/oMsXPDCHvdx
   A==;
X-CSE-ConnectionGUID: H9IY2JMERAefJcfQc7Yvgw==
X-CSE-MsgGUID: 3lcFrAoxQG+uVUPltrMxxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="101093407"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="101093407"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 12:12:23 -0700
X-CSE-ConnectionGUID: 6pGHqbiITbei5BFyTUULOg==
X-CSE-MsgGUID: anuIW5bZTGaBvfrwN1MQSg==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 29 Apr 2026 12:12:21 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIAKZ-000000004YX-38gg;
	Wed, 29 Apr 2026 19:12:19 +0000
Date: Wed, 29 Apr 2026 21:12:10 +0200
From: kernel test robot <lkp@intel.com>
To: Wenzhao Liao <wenzhaoliao@ruc.edu.cn>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: error: include/uapi/linux/goldfish_address_space.h: missing
 "WITH Linux-syscall-note" for SPDX-License-Identifier
Message-ID: <202604292150.JHCbIPSd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Wenzhao-Liao/uapi-add-goldfish_address_space-userspace-ABI-header/20260417-163828
head:   baf6fc99a94d4efae78273b11f66fcc307adffcf
commit: 0884317b0ceacbd0e2d07409ef19019074cdb3fc uapi: add goldfish_address_space userspace ABI header
date:   12 days ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260429/202604292150.JHCbIPSd-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260429/202604292150.JHCbIPSd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604292150.JHCbIPSd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: include/uapi/linux/goldfish_address_space.h: missing "WITH Linux-syscall-note" for SPDX-License-Identifier

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
