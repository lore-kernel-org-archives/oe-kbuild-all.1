Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECF62BE026
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jul 2026 06:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783317790; cv=none; b=qvhChAFV/X/Qj6uzYBwBIaWpXisQE4zefM2McuXwOEFDi7KVHDjsnGH5Zd0FvI8E/o/uj3MKaiyaoi3AJ3W/js2pJoUfPhaD4sD3vZiTZTHrauOwazBKGfQh13J6yxfPoMmxaH2ioIBWmhIq890XWqSAQVJitG2KQvn00XpnU2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783317790; c=relaxed/simple;
	bh=hgT6g0soa5LhN/adPJkuCLKGbgLOzi8+XRIsAbr3go0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pZrWAnWwbvz0E+hp0wNDKjWnzXgZKMH18v5GU8Oq0Z4sC5oFf1oxyq9PnV7hlnaMNufby3Bg6JBI1P8BQPUp/KTB4vOHlTGKhPzVN473glcz5ag7h/dwc1jGe/Oe1cR9wW1iafkC6ndDnY2bIw7oYgxnos+tpCOwmm/VEn15+JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mRLkB/eO; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mRLkB/eO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783317789; x=1814853789;
  h=date:from:to:cc:subject:message-id;
  bh=hgT6g0soa5LhN/adPJkuCLKGbgLOzi8+XRIsAbr3go0=;
  b=mRLkB/eOUF5A+Qr9qunvfsoP8gPEKlcz2rSth2ZScgXfc3lL2MP3WA1r
   tfXutrSqrw+ucyXciziGbteLhhIH6ObxQ1vdU0cvp5Ze8scrZmDckYtnd
   4y3U+phJpliTDqHSDZDV6DxLisnzlIk0KXs46O/HOjgmWa40IrNjCetqZ
   /lsFUU48pp8/4iSVxJjIBWFWpZL3EJrHcsSnAJWlwP1ojLs74SbRLOM94
   nl6pY2aES7UfFBkF302G+COQQfit3bUy9lEN6r32le+72WseumHEnNFvu
   LbIsujkvWnQueJad0ApJ6rwAbC0LvEwxk47f+fWzF+Rzsig4IbZ9RGOgI
   Q==;
X-CSE-ConnectionGUID: /PuPZjdJStG04I2ZIJbd1Q==
X-CSE-MsgGUID: 6ui9Hh9aTlWxojQGn9RnFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="87623142"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="87623142"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 23:03:09 -0700
X-CSE-ConnectionGUID: gnZ2i8csTCSTgyZeHmtxGQ==
X-CSE-MsgGUID: 4PP3eXwGRYOKJpXch9F9kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="253745009"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 05 Jul 2026 23:03:08 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgcQ5-00000000E7r-05pL;
	Mon, 06 Jul 2026 06:03:05 +0000
Date: Mon, 06 Jul 2026 14:02:52 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-dango 181/215] Warning:
 drivers/net/phy/mxl-gpy.c:588 This comment starts with '/**', but isn't a
 kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
Message-ID: <202607061352.lGy2kJAj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-dango
head:   d19514df7d0958e914bdb3435ea4d64d2fc5766a
commit: 9ff7cf620a77384912985c98eb0369776932fba2 [181/215] net: phy: mxl: toggle SGMII AN on link change
config: csky-randconfig-001 (https://download.01.org/0day-ci/archive/20260706/202607061352.lGy2kJAj-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260706/202607061352.lGy2kJAj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607061352.lGy2kJAj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/net/phy/mxl-gpy.c:588 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * in some cases the GPY211 will link up but not RX packets

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
