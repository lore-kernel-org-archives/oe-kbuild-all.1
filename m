Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16221C68B6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Mar 2025 20:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742503913; cv=none; b=oiRnvyh5EJQinwQVjgzDaephX7Qtcq9QfpstzB2/78LiXd/narwIIv97Bb8pZPzg49sqDYih/4WmrSVTS9uAMOYivaocJhGOR2B7M9zdwSbFsnPD4W6254gJxpncG2bgN2dvw62fb1KiQTarZtmsCyJAmysmlAQlvWbOcLkKA/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742503913; c=relaxed/simple;
	bh=rhi8RdLKMCTBEOsvwSlgL4nMOJ9SmMZ/Oavc7p4JQYE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UIkCdDvl0wUO4huqkNGOMXEXFR8zAKqkhD8nxvcXr3kr5qhp3MAzHlvwMEx4Wp/yfi5s2c/xDIhpSs/TYvLb55QWZQIT761ffmc2i2BO+5plUDL+dEsfZEfBLPOkx+JXvCCPqd7HefVfjNStvq+Q05zgRDIi6l6nCVPHFetr2J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wquks/NF; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wquks/NF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742503911; x=1774039911;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rhi8RdLKMCTBEOsvwSlgL4nMOJ9SmMZ/Oavc7p4JQYE=;
  b=Wquks/NFpocfT523QZhCP41SaLmdszhb+q59XBEMkpT/T07PaE5c3W9g
   dcBWlEI0XO+VJ6mk1iRqCbAnYbjJl/Ff0HnOREZGFwmGU8jP8ngYG1lzD
   Jbo3jdm1DMJPr1M0mRkbQFz4w4kG08a73GE4vs/aopHFi7oz4hfvc9mAS
   Zbu9KEQwmN410HXc4ufAvfaUcQfgQ8UFcC+gJkcoqoHBge2TP5lwRG4vq
   sr6XtegL3lhdRl0l+McsiHnMTg8SQCiNhoEkqBam2DHexdsWFyy8sNPQV
   luRQrteRlC3i71eZlVcSwGxJbvQUeyag6hUg7GgqekIzvHqWbJu94LwyV
   Q==;
X-CSE-ConnectionGUID: QXILBOUPQKWEj7itKK3WZw==
X-CSE-MsgGUID: 1ft81sG3R6KlN9uEFZywMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43490147"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; 
   d="scan'208";a="43490147"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 13:51:50 -0700
X-CSE-ConnectionGUID: Zg/q3+UNSKiA3SuSwoCJow==
X-CSE-MsgGUID: Jfnzp3yeQ6Gv2ycCy8bZSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; 
   d="scan'208";a="154097636"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 20 Mar 2025 13:51:49 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvMri-0000l5-1v;
	Thu, 20 Mar 2025 20:51:46 +0000
Date: Fri, 21 Mar 2025 04:51:33 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/020-dart 10/22] kismet: WARNING: unmet direct
 dependencies detected for OF_IOMMU when selected by APPLE_DART
Message-ID: <202503210419.nbxhDymi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/020-dart
head:   20a369d106d69cb8fb5e42c09f6a1881dbbdfd2c
commit: d90cc3590ea460e1c574b4b7c47fdafb2794af6a [10/22] iommu: apple-dart: Install IOMMU_RESV_TRANSLATED mappings
config: alpha-kismet-CONFIG_OF_IOMMU-CONFIG_APPLE_DART-0-0 (https://download.01.org/0day-ci/archive/20250321/202503210419.nbxhDymi-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250321/202503210419.nbxhDymi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503210419.nbxhDymi-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for OF_IOMMU when selected by APPLE_DART
   WARNING: unmet direct dependencies detected for OF_IOMMU
     Depends on [n]: IOMMU_SUPPORT [=y] && OF [=n] && IOMMU_API [=y]
     Selected by [y]:
     - APPLE_DART [=y] && IOMMU_SUPPORT [=y] && (ARCH_APPLE || COMPILE_TEST [=y]) && !GENERIC_ATOMIC64 [=n]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
