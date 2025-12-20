Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB6F2EFD86
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 14:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766239205; cv=none; b=uxVR2PBz4te1UG4KmVfob4vNFWzMtOnbn5tMVsMic/6a5J0Gfgpq6yyZ+xNnGKn3eGHd1o8lqVgZBLY7ejUIXb+GIiMNoqZ9d1cHup7jxjzf9GRDcOJ7GYB+vv4XOY4r49X5EkIl7i9NAMDQCNJfImqPuG3d+WZul+LB/MawGLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766239205; c=relaxed/simple;
	bh=mzOf6ar6q2c6m/GaVpoTVkc1MvO7K2hEeKtUg65cGWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iz/aI5Hnc23pUjNxsYME8jp9zJbxj6gj5mSFMQfChNKpVbrVUBMd9XmDVEf0iLrs3kSWxBiiZL1I8I4PTbLxq3/hGPnzZckCqOSNe7U3d6lAkXfpHtgDsCoUw3CmH4RyC85SYZQJrGwDS+n4P3kneT6jTg98pEMpzIY/hgA50Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VRearACq; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VRearACq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766239203; x=1797775203;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mzOf6ar6q2c6m/GaVpoTVkc1MvO7K2hEeKtUg65cGWU=;
  b=VRearACqM9PEqovGEoco0BwxcR3306BkiI4GQ5Ik4ahYNTuc9qmpv/6r
   qsRFnO58162eR65qFhtPdEF85tQppTga3P0dfTapoYb6Ry80gsuYjQBpQ
   lhRC3jKPWuf9kU+tK8xdBcTuIIUAYBfPLNPOcXRrQcdL0hcLt4ttFo66N
   Xt+G/h/hpuR43wg2MFCpo8gnHC6t/MkbuGi3UCrAQwDRRfXv+99eS36AV
   g7b1V92xhv7NF80XOhGqIIZY2zB5vnQjPwxRna/9GpmaYu3XwOmrv2ZdR
   4b8/z1P4TqRw2pMgnwwVzgJMaZ4o/Yb0olZCR9aAuxa4elapBVi0jS4PJ
   w==;
X-CSE-ConnectionGUID: 3SWCd96HRvSeoYMgRpJaQg==
X-CSE-MsgGUID: zFsXlACDRWq/j6AmGxh3rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="85759182"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="85759182"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 05:59:57 -0800
X-CSE-ConnectionGUID: iLHwEN9UTo+xraTv6loz0Q==
X-CSE-MsgGUID: XJFoM3ttRlGVWgxkPvVTIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199093298"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 Dec 2025 05:59:57 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWxUv-000000004b3-3fH4;
	Sat, 20 Dec 2025 13:59:53 +0000
Date: Sat, 20 Dec 2025 21:59:52 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Shlyakhov <roman.shlyakhov.rs@gmail.com>,
	Bjorn Helgaas <helgaas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-pci@vger.kernel.org
Subject: Re: [PATCH] pci: extend pci-stub to support explicit binding by PCI
 BUSID
Message-ID: <202512202126.F1IQYL9V-lkp@intel.com>
References: <20251219131038.21052-1-roman.shlyakhov.rs@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219131038.21052-1-roman.shlyakhov.rs@gmail.com>

Hi Roman,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus linus/master v6.19-rc1 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Roman-Shlyakhov/pci-extend-pci-stub-to-support-explicit-binding-by-PCI-BUSID/20251219-211130
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20251219131038.21052-1-roman.shlyakhov.rs%40gmail.com
patch subject: [PATCH] pci: extend pci-stub to support explicit binding by PCI BUSID
config: i386-buildonly-randconfig-003-20251220 (https://download.01.org/0day-ci/archive/20251220/202512202126.F1IQYL9V-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202126.F1IQYL9V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202126.F1IQYL9V-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/pci/pci-stub.c:55 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Checking if the PCI device matches the BUSID list.
   Warning: drivers/pci/pci-stub.c:122 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Parsing a single BUSID.
   Warning: drivers/pci/pci-stub.c:148 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Parsing the "busid" kernel parameter.
   Warning: drivers/pci/pci-stub.c:207 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * early_param "pci_stub_busid" handler for the built-in module.
   Warning: drivers/pci/pci-stub.c:222 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Binding devices by BUSID via dynamic IDs.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
