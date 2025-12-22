Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCF3274670
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 23:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766445950; cv=none; b=P1uJFBTw55MUYu9OjX0fgsmvlPP+iOFTr5793yK+WL2dlVZkTc1LFGi3yPSkcYhcFeFj+oD5xqrfhS0XAtEvQckdAuRJlbJ3vSujL/PNdYTcfN4zd0eM0XG5J+rJFXughm5k0ZQfjB4f84WMUSV5GAiYXJP26d9PMhucziNqyNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766445950; c=relaxed/simple;
	bh=aLWgQgX6ZOlwdNAGfokk80pu41lCq/OPyRGXFv/OyVM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O/mkFf/sLDpgnOID0k+QxsoRcqWN2Q2CXt0m0520kzaKFhQ2aSaMZcFdu9Q1nvwrIyMOVJdQqfT88/8HM8uUrlD4OvvxFJE20phaPwibVvI4sWW4yMJheXEhfUAy7KCjoUhcb13bZ5Ov4TFmwcISKDgNHtEISXQgEiceAAkVhSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PtIuMUqu; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PtIuMUqu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766445948; x=1797981948;
  h=date:from:to:cc:subject:message-id;
  bh=aLWgQgX6ZOlwdNAGfokk80pu41lCq/OPyRGXFv/OyVM=;
  b=PtIuMUquhkrnLNsK4pb6LBJC6805X2HQA0GPEKATLCAJoPF8cy0QGgZW
   lPxfccJ4uOlbFEd9/3PGhFXOaZ3gFL3zaQgZ8LywNeGeNAVI9PWtqMIfL
   RO/AaOOZt5cX10b8ca101LijkmTgSc8ihkix9VRFNUSFZqJeqV64GqrsS
   PgA8bLNqItNiuoaTLVYoB6uuuja4LE7VXYTgrLvj6WjmjuLFX796ERshx
   klHz93t02KB2G+2Chn1GeF8aUreqlmFNst7ef0QrthipR3PWIqXaenDk1
   fvRF7cq00rGOBOnVyC2FMlSjCRA5lPn6WSd77kgbTl32JqPzfk8frhg/u
   w==;
X-CSE-ConnectionGUID: WTADoxvDTKKP6FMC0wGJug==
X-CSE-MsgGUID: lyPS/kn+RDutviNFkW/yYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="93772277"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="93772277"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 15:25:46 -0800
X-CSE-ConnectionGUID: SApn+hdVRXmjL2vNTrgWBg==
X-CSE-MsgGUID: UOOIfvaaSw2ES14YtmV28w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="198883192"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 22 Dec 2025 15:25:44 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXpHZ-000000001DZ-3G6C;
	Mon, 22 Dec 2025 23:25:41 +0000
Date: Tue, 23 Dec 2025 07:25:22 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Joerg Roedel <joerg.roedel@amd.com>, Kevin Tian <kevin.tian@intel.com>
Subject: ERROR: modpost: "__pt_no_sw_bit"
 [drivers/iommu/generic_pt/fmt/iommu_amdv1.ko] undefined!
Message-ID: <202512230720.9y9DtWIo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b927546677c876e26eba308550207c2ddf812a43
commit: efa03dab7ce4ed786b131f412440e2fd45fba11f iommupt: Flush the CPU cache after any writes to the page table
date:   7 weeks ago
config: powerpc64-randconfig-r051-20251223 (https://download.01.org/0day-ci/archive/20251223/202512230720.9y9DtWIo-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230720.9y9DtWIo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230720.9y9DtWIo-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__pt_no_sw_bit" [drivers/iommu/generic_pt/fmt/iommu_amdv1.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
