Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E92315D3E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Nov 2025 10:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764240702; cv=none; b=Isxg8C0qOCsdy2rqMEUGfdyG2FEwUz84Lkwev/854mzpZ5bpAthFBSKIV5qLmE/fJEJeLeL6oYov0tJTmp0pgwTUpRupy36OYEXMQD3xEkVQpyEVTc2l+sibTH7vN/0f8xocg/C3Gzs9HcMOtwKpOwOXOFuaZ5z9YpE6NleFa+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764240702; c=relaxed/simple;
	bh=ctQk0nOmx7HOFK8TjovJG2Q3EavZkNmVWkjHNn8F0Lw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zxv10uALNi8WdpyewpIhzUgROKv75+m5Od4BPZgP6V1qT3nfBHl5etnJH3C1rnmYZtlz4guwAP4PMteZNr+UhH+MTmKk5PEjFeE+9csOJ2SfqLUHMds2KLtSjqywwqkDmAODWD16MpDjjLTsK7zuIKXqSjRnJTEMHai3oTJsINE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YK5Vzqkr; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YK5Vzqkr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764240700; x=1795776700;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ctQk0nOmx7HOFK8TjovJG2Q3EavZkNmVWkjHNn8F0Lw=;
  b=YK5VzqkrqtSdRoWiaOIAYPAA2OWpDgtCqK9RBV1XKDx0l7imHrKnXqil
   PYD3486edqvXRGKKxnsgBPSFlGsC/jk5nvkLY4CvYz493P3tvoNA/vPYD
   +OcBTKtd6r4vDntjd9uX648BVnqVAgcCHIptjIr90Ht/n48ktPFvYTaMf
   s/BV5L6XV4O8ugRBIu0RmYLG6A9PQxQ863xn9M3ah2pJKGWqFToKD7Zxc
   RfdNTUTCSXA9H3JtBs7dbA/9qegSYQp1OSDF6iiFm5WtzPvJUXbTBXhZB
   ELXwNKM5O5hiYaxOfW4jo2U4haS9VZZTZJ97uOnLHCMk5HozEdWLJU6Gf
   w==;
X-CSE-ConnectionGUID: 5i6FWkFyR1KXDPBxB+HJ0Q==
X-CSE-MsgGUID: 2+3Z2zlfQCmDiYng+WaYaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66173995"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="66173995"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 02:51:40 -0800
X-CSE-ConnectionGUID: it3jG3iqSQyw7n6N+d743A==
X-CSE-MsgGUID: pTaQwaGyTFmxS1witVDS/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="192866998"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 27 Nov 2025 02:51:38 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOZb6-000000001ib-3gPk;
	Thu, 27 Nov 2025 10:51:36 +0000
Date: Thu, 27 Nov 2025 11:51:01 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Fengyan Mu <mufengyan@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3392/3392] htmldocs:
 Documentation/networking/ub/unic.rst:11: WARNING: undefined label:
 'documentation/ub/ubase/ubase.rst' [ref.ref]
Message-ID: <202511271132.wMULonCl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   97b857c8129b11551aca289222b52d36c973e450
commit: 22011d4678c0cbd6a7e136a52e3f8da53d3bccc9 [3392/3392] net: unic: Add a doc for unic driver
reproduce: (https://download.01.org/0day-ci/archive/20251127/202511271132.wMULonCl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511271132.wMULonCl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/virt/coco/csv-guest.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/virt/kvm/arm/pvsched.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/virt/kvm/arm/pvsgi.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/vm/memcg_memfs_info.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/networking/ub/ubl.rst:63: WARNING: undefined label: 'documentation/networking/ub/unic.rst' [ref.ref]
>> Documentation/networking/ub/unic.rst:11: WARNING: undefined label: 'documentation/ub/ubase/ubase.rst' [ref.ref]
>> Documentation/networking/ub/unic.rst:11: WARNING: undefined label: 'documentation/networking/ub/ubl.rst' [ref.ref]


vim +11 Documentation/networking/ub/unic.rst

     8	
     9	Overview
    10	========
  > 11	unic is a UB (UnifiedBus) networking driver based on ubase driver's auxiliary
    12	device through auxiliary bus, supporting both ethernet and UB link layer.
    13	See :ref:`Documentation/ub/ubase/ubase.rst` for more information about ubase
    14	driver and :ref:`Documentation/networking/ub/ubl.rst` for more information about
    15	UB link layer.
    16	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
