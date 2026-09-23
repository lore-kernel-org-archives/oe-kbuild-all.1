Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50BF3BAD8B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 11:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161850; cv=none; b=DwTgh5VjJNsAkXy0LwXxSNs+E/IPnq8HIkmb5rARtGXPk0EiZpXvDAjJMz4+Im/pDyaFWQrBoAJ75+Xx27xgvvDw3pX2og9CBGUvgCVIXe4r97M9sMGhFxtehII42cnM2kVdd9oDpRELrWIJJq8jsxpr8d1g60yOI+yoIP3u3hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161850; c=relaxed/simple;
	bh=tt4KBdEXWOMQ88MYqyly3boZmwek4FYHDFq49ZoFcQc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MYwU7NnM5N0W3qSA9hdLXEWF+jfQdPTVNybk6GQo8jA8jPvxvhKyOHW2xq+8/55MC1KMHc8+DmUJO5T3KqK2pA6EUEooSVillzugdosqDSIntwc+Tjzl1t6j9+IRoYKaGu/0yhs0NnKvytyq1zJKwlX0GnbjL/ddYhN7hgQKvr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eJrLiFbx; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eJrLiFbx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790161848; x=1821697848;
  h=date:from:to:cc:subject:message-id;
  bh=tt4KBdEXWOMQ88MYqyly3boZmwek4FYHDFq49ZoFcQc=;
  b=eJrLiFbxaJNHMrMNLKg+GAsVQ6B6ghXh2mymrJlIzsnrApH/rwi4tvYG
   J9XoZeZWpOSuSCqNlHS2stB7hWkLstbRI5fNIzUgPXh1+nLhrxqns9jja
   k5bvfUtjNp5CLkx93FpcAkCGZLgxm2cXKkawhJL4N5s7PeZUhXW2erxr5
   SpJf3ZAMZcNq2jeBn3IgAcdE1pXzwBXm1K/VUeHaImrIs6XLvi2fuONsq
   hSEdd8XQ2+cMvcbmdxCjFtKSJQROzOAMkMKywYDcmaxcSmFDUkiM6kly/
   1ofVt86Z4SGgFxp8EtYadPcwMUuvll4aJ8i1HC7eqetJ5hsklLCppJ1ZH
   A==;
X-CSE-ConnectionGUID: E3BdD37QTAyYIbz+4Lt/ag==
X-CSE-MsgGUID: SHQ1oXefRBCUdxe2xle0Vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="116367954"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="116367954"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 04:10:47 -0700
X-CSE-ConnectionGUID: v1GJUr6zT0WjRSAziGgkYg==
X-CSE-MsgGUID: 33DscqJnSYOwgILm4h9Brw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="272756134"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 23 Sep 2026 04:10:46 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9Ks8-000000000cx-0XlG;
	Wed, 23 Sep 2026 11:10:44 +0000
Date: Wed, 23 Sep 2026 13:10:14 +0200
From: kernel test robot <lkp@intel.com>
To: "Alastair D'Silva" <alastair@d-silva.org>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: Warning: drivers/net/phy/ac300-phy.c:2 This comment starts
 with '/**', but isn't a kernel-doc comment. Refer to
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202609231302.L5QfwVqw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Alastair,

First bad commit (maybe != root cause):

tree:   https://github.com/intel-lab-lkp/linux/commits/Alastair-D-Silva/dt-bindings-net-phy-Add-Allwinner-AC300-EPHY-binding/20260916-144116
head:   6d0087c5c37fcf119011a936fef3fa18ce5d7686
commit: 5c03e0fe215f96bf5b0511b77301f5dcca2adbf6 net: phy: Add Allwinner AC300 EPHY driver
date:   7 days ago
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260923/202609231302.L5QfwVqw-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609231302.L5QfwVqw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609231302.L5QfwVqw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/net/phy/ac300-phy.c:2 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Driver for X-Powers AC300 Ethernet PHY

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
