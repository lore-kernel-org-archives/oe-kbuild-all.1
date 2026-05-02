Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBBE33EAEC
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 May 2026 12:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777723209; cv=none; b=Qwa0A6RZMY9Ir2HKv1JJhLk/Uj37fhISlJpf3p72lJ8zGjHA4tQzCIVtLnSUzCaS8DHeSKCnUbM5YUy1hM2g9XYZxnjV9EcDrfvZD8bWi5eCfepedEyamk3BhV++TdqF7huQLQvdyaOjcZWlzz2wqqHY3I+YWcsTXmN7xXKlKHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777723209; c=relaxed/simple;
	bh=QFuA51lyThWzDOlS107Hk0YaS1/agd0/IJNejTmJ4ZI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kOQAvsGb49jnUtR1AhYZUIlVkfL7ky0r/2T/IjbnPvD+5wQWrguN+IN6JIS5mFkthR+J8RfqvvEyho/IXyZwF5GAHoZq+pzAcHk8ICX6Hkb6et4ptxMnKlrXl9p05rA36Q8rhTESX+K3JP6Bodl9XYU/9zf6drwy4z2oRL9FYag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jN2D32xO; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jN2D32xO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777723206; x=1809259206;
  h=date:from:to:cc:subject:message-id;
  bh=QFuA51lyThWzDOlS107Hk0YaS1/agd0/IJNejTmJ4ZI=;
  b=jN2D32xOBuz+jxTyi3b9yGF2JSpe2NQuEj16Oqbv3b9fqx4RterwRVYt
   bN57xfOYcOz5cY3lTNI4edn28V8C4DmgCYWIBXwBum4p2m0JEV8zfyMmu
   egTSDaX9XjeFckvzVPVTK/BxGx0BWXI2gqC+ZKRu3Hh2/gKwMfK5AT6fb
   Af0m+IqKGkF7hdxEa6kRJtchFL/+re5+BqjMoBQjNPZ8C0ODJtuAb6csX
   FlvT0xMrLz9N/uMAlVIXlPjLvzUu75pFYXbIggc56plZsUqcGSunCQTBm
   baBCdvMVvDomG/2rUKd7XPQYxbBz38xwFiLxhcd/RyYxenP2PSpelSUec
   w==;
X-CSE-ConnectionGUID: 9wkZeGxqSeOOWm4z8TMzFQ==
X-CSE-MsgGUID: a0XdTTIVTj2J33DUDnyYnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="78368256"
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="78368256"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 05:00:05 -0700
X-CSE-ConnectionGUID: PtVLJjGxSyW4n+Nub8OSzw==
X-CSE-MsgGUID: B4x+dUYUS9yEp1OMM9DPsw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 02 May 2026 05:00:02 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJ90q-000000005GX-1Ioj;
	Sat, 02 May 2026 12:00:00 +0000
Date: Sat, 02 May 2026 13:59:00 +0200
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/gpu/nova/core/intr-ctrl.rst:88:
 WARNING: Inline substitution_reference start-string without end-string.
 [docutils]
Message-ID: <202605021358.ldpuPGZI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Joel-Fernandes/rust-sync-completion-add-wait_for_completion_timeout/20260502-113009
head:   4e10e05ecde578bc23419ce04c62d82020b21d1a
commit: 4e10e05ecde578bc23419ce04c62d82020b21d1a gpu: nova-core: document INTR_CTRL interrupt tree
date:   8 hours ago
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260502/202605021358.ldpuPGZI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605021358.ldpuPGZI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Examples
   ~~~~~~~~ [docutils]
   Documentation/gpu/nova/core/intr-ctrl.rst:110: ERROR: Unexpected indentation. [docutils]
>> Documentation/gpu/nova/core/intr-ctrl.rst:88: WARNING: Inline substitution_reference start-string without end-string. [docutils]
>> Documentation/gpu/nova/core/intr-ctrl.rst:111: WARNING: Line block ends without a blank line. [docutils]
>> Documentation/gpu/nova/core/intr-ctrl.rst:112: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/gpu/nova/core/intr-ctrl.rst:121: ERROR: Unexpected indentation. [docutils]
   Documentation/gpu/nova/core/intr-ctrl.rst:117: ERROR: Unexpected indentation. [docutils]
   Documentation/gpu/nova/core/intr-ctrl.rst:120: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
>> Documentation/gpu/nova/core/intr-ctrl.rst:121: WARNING: Blank line required after table. [docutils]
   Documentation/gpu/nova/core/intr-ctrl.rst:122: WARNING: Line block ends without a blank line. [docutils]
   Documentation/gpu/nova/core/intr-ctrl.rst:123: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/gpu/xe/xe_configfs:9: ./drivers/gpu/drm/xe/xe_configfs.c:27: ERROR: Unexpected section title.


vim +88 Documentation/gpu/nova/core/intr-ctrl.rst

    86	
    87	It roughly looks like the following::
  > 88	              +--------------- Engine (CE, GR, NVDEC, ...) ---------------+
    89	              |                                                           |
    90	              |   internal work completes                                 |
    91	              |          |                                                |
    92	              |          v                                                |
    93	              |   +-----------------------------------------+             |
    94	              |   | INTR_CTRL(i): programmable register     |             |
    95	              |   | (written once by GSP-RM at boot,        |             |
    96	              |   |  one such reg per engine)               |             |
    97	              |   |                                         |             |
    98	              |   |   VECTOR  = 200   (-> which leaf bit)   |             |
    99	              |   |   GFID    = 0     (-> which function's  |             |
   100	              |   |                       tree: 0=PF, N=VF) |             |
   101	              |   |   CPU     = 1     (-> copy to CPU tree?)|             |
   102	              |   |   GSP     = 0     (-> copy to GSP tree?)|             |
   103	              |   +--------------------+--------------------+             |
   104	              |                        |                                  |
   105	              |     engine builds      |                                  |
   106	              |     interrupt ctrl     |                                  |
   107	              |     command message    |                                  |
   108	              |  (all2ctrl_intr_cmd)   |                                  |
   109	              +------------------------|----------------------------------+
   110	                                       |
 > 111	                                       v
 > 112	                   +-----------------------------------------+
   113	                   | Central INTR_CTRL block                 |
   114	                   |                                         |
   115	                   | reads message; for the tree picked      |
   116	                   | by GFID, sets:                          |
   117	                   |   LEAF[ 200 / 32 ]  = LEAF[6]           |
   118	                   |   bit  ( 200 % 32 ) = bit 8             |
   119	                   | TOP subtree 3 = pending                 |
   120	                   +--------------------+--------------------+
 > 121	                                        |
   122	                                        v
   123	                                MSI to host (PF)
   124	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
