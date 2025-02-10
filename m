Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50831C9B97
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Feb 2025 10:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739184544; cv=none; b=I1tXIJz5TdGzeYiqZvrk1Jir1aFnolVWSD/JC6E1NK8bNrFoTBVm6EXpy0dPkzXdVkeV2jxMr+6+CLd8R2Vp45AlS1XZUJ/4fPP6JLhc3CIdLp2J4jryoRIoHLQg5Dy4JBbQgCjdWwVuuO+o9Y4tbkR+ErQnNOUu902C+oAb08c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739184544; c=relaxed/simple;
	bh=sCsyzRoAkTRE3Q4p3/PgIKcdpnxdQCg0eAUitLHJXMw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ab+AE5+ymvq1maz61Rp2QPJ4ZdsR4Hrh6meDAsbKqz3HJq7Fi9IdQm8Cxji3YAAz51QNLNQxzqFd/7BSwrKgTAjChyPbYN9OBm5DzBFa5jh140WI+E0baA6QlbxewlEkWnh0Es/umaRh6LEEmm7WQWPG31goyRVIIEomNXkxbuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EM8LTIp1; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EM8LTIp1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739184543; x=1770720543;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sCsyzRoAkTRE3Q4p3/PgIKcdpnxdQCg0eAUitLHJXMw=;
  b=EM8LTIp1x7PLJh328ngCCRYvGIx2jVmYE1TTXNCcqpgCHXg/rqdn/8ar
   O7K9xObpfYTRZIylIGU8uvrZWcFH1engxRFrYUD8I78tvbgOUraC2c9gC
   AFWwQO5XCmHJ2zG5meCOCku73numZ0VGvupEmXKJdI+CyTBKzoHQgc5EG
   f/gfwaojMuV8E6E7+Zhb5AJSmea+xRsWVFblolk9zKe6nOc7NcF+GUZcw
   5q7N+FNlbJlMyBFt3XGWNDrhRRTxTXhWKdrlIv3fHkgcg5GmUUADezrVr
   0CLKo3+i2islvx2em2btep5tdLhNXDWPESYiv2OJe/6yI4o559EqvfVDi
   A==;
X-CSE-ConnectionGUID: OkZhYl5UQMCGYFHvc7ni5g==
X-CSE-MsgGUID: OduhjZcUT1G5FfKHsALd0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="39645764"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="39645764"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 02:49:02 -0800
X-CSE-ConnectionGUID: izbxna8+Qc2j6u896KBx6Q==
X-CSE-MsgGUID: SH3d3mozQD2+eGE8P1700Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="111990293"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Feb 2025 02:49:00 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thRLW-0012d9-2G;
	Mon, 10 Feb 2025 10:48:58 +0000
Date: Mon, 10 Feb 2025 18:47:58 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/020-dart 10/22] kismet: WARNING: unmet direct
 dependencies detected for OF_IOMMU when selected by APPLE_DART
Message-ID: <202502101803.viLFOg9M-lkp@intel.com>
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
config: alpha-kismet-CONFIG_OF_IOMMU-CONFIG_APPLE_DART-0-0 (https://download.01.org/0day-ci/archive/20250210/202502101803.viLFOg9M-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250210/202502101803.viLFOg9M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502101803.viLFOg9M-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for OF_IOMMU when selected by APPLE_DART
   WARNING: unmet direct dependencies detected for OF_IOMMU
     Depends on [n]: IOMMU_SUPPORT [=y] && OF [=n] && IOMMU_API [=y]
     Selected by [y]:
     - APPLE_DART [=y] && IOMMU_SUPPORT [=y] && (ARCH_APPLE || COMPILE_TEST [=y]) && !GENERIC_ATOMIC64 [=n]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
