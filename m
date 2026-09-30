Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C59242D97
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 04:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790743502; cv=none; b=N58ZkDpzuP5o/J+OyqC3muyxJnhOHTVkZ1uj26GE9S4NzEII3m5E/38pJgqlJFK93zeU1/6tKm99JXB82m8Z2eEQ11z6HUWM94urjBKQwPzcqWLVWPTjGdP6B7RoMqne7B9NkIpmlcIQD6PXxcWQ0d5b7CxK9ssnmRZvQ1IPzuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790743502; c=relaxed/simple;
	bh=n/HE7nGfJ9fmzjHjaq0XvK7DAymx4CUl4/udBURkVyU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=c9eBCe7CtnZST4iNmgz+vMl3mypOxoI9CsBbDJKqpRfm1wB0XbDmKr6xn36YRJ3fFAGdCIZFVSk0LkdkcC4nrdEqUR4092oPg9ajtvgXAwCosqVK38znAZeBEy7d+ziRONVYxVbau4uP2kTD4Y7cqjIka+4sFCEq3cLg2Ow3QQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ktAtrf3H; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ktAtrf3H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790743500; x=1822279500;
  h=date:from:to:cc:subject:message-id;
  bh=n/HE7nGfJ9fmzjHjaq0XvK7DAymx4CUl4/udBURkVyU=;
  b=ktAtrf3HuVJRuf60xeUw78BpByZBfju5rpmVQayHpa7NgjGa9f4iUmJh
   Y4e2EUVqCtN0mai7H415/Nvru8BzXrNazGASUQsI3suPmnv2onsQaTSO5
   dpKaKcV3V4iPSoEolWIEv/cwSLueWLfK7RpkuHN0+3A+Ey+VfJRJIaUZT
   JK5cUBJYnQgV+oiUF7WBOZI+qdBh9zvMjMK59fHgBIj38wUflvuAkwuox
   wng+WLLSeRzSYdeKPAXQJMFcXwwEBGZYwSqUr6ZMYjhKUOC8yfQYWiKz9
   4/M7XRTCbYcX1vlg5gXWCRqfW1OcJ/nnhAo1Se0JKtvFF85ceK2cxA4Vm
   Q==;
X-CSE-ConnectionGUID: 8XauQVXATFeYog3VNoozkg==
X-CSE-MsgGUID: xzdYMD7mRwaeHopcwJU2jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90334047"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="90334047"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 21:45:00 -0700
X-CSE-ConnectionGUID: wFCnFLUtRrqcTinFcy4fwA==
X-CSE-MsgGUID: TshoMVUqSWScBWocGkMlOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="283666189"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 29 Sep 2026 21:44:59 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBmBc-000000001k7-2qDB;
	Wed, 30 Sep 2026 04:44:56 +0000
Date: Wed, 30 Sep 2026 06:43:55 +0200
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpirko-mlxsw:wip_attestation_pre_rfc_draft1 15/26] Warning:
 drivers/ctlv/tests/ctlv_test_child.c:42 struct member 'magic' not described
 in 'ctlv_test_child_device'
Message-ID: <202609300619.svOZD3Pt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Jiri,

First bad commit (maybe != root cause):

tree:   https://github.com/jpirko/linux_mlxsw wip_attestation_pre_rfc_draft1
head:   a18af4e1b514bf11f88ca42d29b7b68f3b375378
commit: f0d70a63c43dc04d26850534c3f5898e891e6ada [15/26] ctlv: Add the inheriting test family driver
config: arc-randconfig-r2101-20260930 (https://download.01.org/0day-ci/archive/20260930/202609300619.svOZD3Pt-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609300619.svOZD3Pt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609300619.svOZD3Pt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/ctlv/tests/ctlv_test_child.c:42 struct member 'magic' not described in 'ctlv_test_child_device'
>> Warning: drivers/ctlv/tests/ctlv_test_child.c:42 struct member 'magic' not described in 'ctlv_test_child_device'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
