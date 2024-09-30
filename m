Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EC91F5EA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Sep 2024 06:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727676475; cv=none; b=FFcZW6gXINBsNThKHeBIrsnJ1bCnxu2ASjpxh66c09EGpagZhQ8NBJUyXqDdrhGvkN9yGOgSoZkQ1YQp7x/hDZeP2pqueF+L3bFIgPYRznVOy79gbtpsSVLtfS6dJdJIK9mMfM2WUAtzXKE2rVmCn/CirEMy1Iqwz6xa4FnZwCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727676475; c=relaxed/simple;
	bh=GtQ/dTmYdjYsEaLUnpEkC3kOGWQWtYFW1sayuux1tRI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cH/j6pVL+fos+8cgkUN7Sbj91k05cUobChWFQI5sX+XE9rW6FzB2FEa/mRJHXFNP/s64aeSSUcW6vp/t+0IxZ2SOyBwNx4W/pPKx0ISDQHGapqoR7heOB4Wwd0K1vnAD01pWGOUhAPTFup+fdVS0dlw5KCC0zVqo1w8Lz2Ku7/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N6sFdwFZ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N6sFdwFZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727676473; x=1759212473;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GtQ/dTmYdjYsEaLUnpEkC3kOGWQWtYFW1sayuux1tRI=;
  b=N6sFdwFZSSzQpAnB0TUAyC67Ron7MJpZTY0jqzMYmJa7EIzNXh9uhRw4
   ZelAXQ4IWbNDxPHdQJItXQtnoC1DLADqOXSEH5k8G2hd4pRRBwxJkBoAZ
   Wj1FnFotgpzHFlh+5pVshm0Vinyulp0T4wXYnfc/YHJrmlygkboUIT5Z9
   zWKnJF/bGaNN7VlOpi2oMoaVSPYuB3t0qMatoawcO/+5+V8pSVcRALuOL
   qbNPITUV12/9D12yBCXr9ZWEqZW+KSr342dwA+I/99RAyhqI+/6yBnjvD
   MzBEI2OsZI7BTKU0JmpNMwZm/Pb+lFckC/FY9IVTsrtsxwdxJfjwhd/AK
   g==;
X-CSE-ConnectionGUID: amiF+JXkSxmE033zw8FlhQ==
X-CSE-MsgGUID: y4RWudKnS924KSSNVUrYcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="37422110"
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="37422110"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 23:07:53 -0700
X-CSE-ConnectionGUID: fFPC4kreS4CI0ppcMLTUIw==
X-CSE-MsgGUID: 18z1DmJLTMKb2tPw/uv9mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="73325495"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 Sep 2024 23:07:51 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sv9ZV-000P5z-1b;
	Mon, 30 Sep 2024 06:07:49 +0000
Date: Mon, 30 Sep 2024 14:07:11 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/020-dart 9/21] kismet: WARNING: unmet direct
 dependencies detected for OF_IOMMU when selected by APPLE_DART
Message-ID: <202409301440.qBdaSCMW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/020-dart
head:   1cd2f413a03ac0f27339722db62d467e9ebe5b60
commit: 746bc9b71378b299efa5759d447987e5e3d71ff1 [9/21] iommu: apple-dart: Install IOMMU_RESV_TRANSLATED mappings
config: x86_64-kismet-CONFIG_OF_IOMMU-CONFIG_APPLE_DART-0-0 (https://download.01.org/0day-ci/archive/20240930/202409301440.qBdaSCMW-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240930/202409301440.qBdaSCMW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409301440.qBdaSCMW-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for OF_IOMMU when selected by APPLE_DART
   WARNING: unmet direct dependencies detected for OF_IOMMU
     Depends on [n]: IOMMU_SUPPORT [=y] && OF [=n] && IOMMU_API [=y]
     Selected by [y]:
     - APPLE_DART [=y] && IOMMU_SUPPORT [=y] && (ARCH_APPLE || COMPILE_TEST [=y]) && !GENERIC_ATOMIC64 [=n]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
