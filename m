Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8974B95B3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Oct 2026 22:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791843000; cv=none; b=NKvndiV31anm9kogCsscz43IUP3EaDHu3DhD1Ji3ZCeR5cwBZEByjIK4qOCYekMVNAP5wAZ0B5DSiM5g/IDZr8gf7pZT84q/zbtUjs4fIvi0I9puAgdbPdtIakoZ0VCaWp9nC8cSI+JY1KmgcJfRWSK+jvPg9BCiOoFGd3eQ3yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791843000; c=relaxed/simple;
	bh=RQaMg4stu4Mw7yUuuWffifyspigE1cjz6hc5rDYt+U8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MfWVh2yuYZ9f1Dzt2K9etp714N3pNv1zK0MqhjGDM59YwPAehxHmPFF9kEpSMMgwcTlM52CRKN1mcIt4aWDp57I3Mok6UDZBDVDHv2KDfgnV7eRtROwH5gYbNUSOjZ8gr48Had8gVQpRWxfkg9eeqcEDEtFSseLCRbJmMzOkNSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hEetze2m; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hEetze2m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791842999; x=1823378999;
  h=date:from:to:cc:subject:message-id;
  bh=RQaMg4stu4Mw7yUuuWffifyspigE1cjz6hc5rDYt+U8=;
  b=hEetze2m3tNvwQn8r13OvR8dn3Kbwnkk6FpNCbywjhfBPBXLXQ0f8uul
   RNEtV5WMM5nr1ZKBwmooFEAm/0spbyiuNzgw90NmaqCnsGjR6YPhkXLZm
   p+27wrIJnjeLtBsQZJZLfPhxp2dPCMWQj+bMfWWDZ0BSFJJUJbJ7x4paY
   CUyMSYP0x1XIBdznP7xdQEWBjw/JeU7Pn3R8KTthzFc5RAsk4RKU+jplg
   YDezQNNElQ7NUg/2mMeOOD6LqjSRUCr6qOpTIvhkayGxtkmMfCV8rSJPC
   Fj4+SfsM6paGwpAbvlkvkpRzUAo8wZOxAWmDLQVaSTog9pdfKge9jnNkO
   A==;
X-CSE-ConnectionGUID: BHo63+jvSnyfKt0ezJ+Kfg==
X-CSE-MsgGUID: 6Q+XTMovSJqUc7ccn6XMuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="458082"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="458082"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 15:09:58 -0700
X-CSE-ConnectionGUID: esFocDqiRj+JymSBLJrwiQ==
X-CSE-MsgGUID: 1rB4ID2iQ6uSdWuV28o4jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1369482"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 12 Oct 2026 15:09:57 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGODT-00000000AEB-1en9;
	Mon, 12 Oct 2026 22:09:55 +0000
Date: Tue, 13 Oct 2026 00:08:56 +0200
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [leon-rdma:rxe-rust-v1 88/88] htmldocs:
 Documentation/infiniband/rxe-rust-design.rst:139: WARNING: Title underline
 too short.
Message-ID: <202610130036.FDXRfpRS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rxe-rust-v1
head:   fe52737deab42b438e356282106b9418915da058
commit: fd6a83d0d7b4aba0032f93ea9c03613a0ba09a19 [88/88] Documentation: RDMA: Describe the Rust RXE ownership model
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20261013/202610130036.FDXRfpRS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610130036.FDXRfpRS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Runtime Survivability
   ===================== [docutils]
>> Documentation/infiniband/rxe-rust-design.rst:139: WARNING: Title underline too short.


vim +139 Documentation/infiniband/rxe-rust-design.rst

   137	
   138	Queues and userspace mappings
 > 139	============================
   140	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
