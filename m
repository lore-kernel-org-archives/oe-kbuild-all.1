Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DF6282E1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 02:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731898070; cv=none; b=GClk5nNpEeptISGI6vB/MKPkgG/TkRmiEnOIQCl7dMmHufPxAM7ypfKhfWUuY2OgZ91KxIJmIeYOy2umH15dyr/sM8Ovhx8nryW6JRG9uEXtrwFyKzrghR9OXPsbmpae71rzodopUWdqBVtQTU9bijJE+9sfepCas8rEcl6tH8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731898070; c=relaxed/simple;
	bh=1SZLijDOeI1pOgmf82nDLs71xjSQ4cgFoF2EeqBf5P4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c6YbVDrpZDXvtAFcDV63qnXpo3gublNrXdqu2fMVXhHxtHp7V6HfwEVAWY9fyhrZJZYDbNpl1rQpu3oSj2fJEWxVz+nCmk75soQu3S7XaFl4ALfNpFx3U5UnBkNb7FpQVgS9ydXUegBSYh9wvLNa3Dg+zZcUgJxq8EQNLXAZc68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gE8sbNX7; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gE8sbNX7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731898068; x=1763434068;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1SZLijDOeI1pOgmf82nDLs71xjSQ4cgFoF2EeqBf5P4=;
  b=gE8sbNX7Ivj1xfay7C/31iAMQ/YIEJkr3arblfKoS9EXFE1a9DQPKac/
   UTuW5Fbwmo1MrOrUDHn2DekOX5Zm4z4f/u+rNDRP8CrIMOebTNL6CzING
   v2rNTa2SbcYJ0J+JxWusnP/D+Lbs2JATHm0xE6+LBgGGGihH7y5Q1QgGa
   PkdHkNyeJr8kX4YgnwvRNP7sf9BuiRsWXL+sLOxHvuDLNqLxeDrQOlyCX
   HWIhdvksI/sWCxyA/G47ynlcZB08L8yKRvMxTtw8nmvb1TclPorkwy+qD
   co6Tu+PAAMtU8tLHCLO499Hac0/GALLPSVE3L5q7rBlC2WWHqD4zVQkXO
   Q==;
X-CSE-ConnectionGUID: rlsLcOWGSiem/VC0aFcryA==
X-CSE-MsgGUID: dwjlKHLuQmWGbtk86o2VEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="43223460"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="43223460"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 18:47:47 -0800
X-CSE-ConnectionGUID: h15Lo238Qi6rYPz8DCkU8g==
X-CSE-MsgGUID: i6YiIXadSfKBnMn9IeHf5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="89252849"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Nov 2024 18:47:46 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCrnk-0002E1-0E;
	Mon, 18 Nov 2024 02:47:44 +0000
Date: Mon, 18 Nov 2024 10:47:29 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/020-dart 9/21] kismet: WARNING: unmet direct
 dependencies detected for OF_IOMMU when selected by APPLE_DART
Message-ID: <202411181043.4akFsprU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/020-dart
head:   7b4afedff097b1b09da32f01db73cbc0788bafd9
commit: 8948cde0ab313f22defe24fc60186333bd04bea3 [9/21] iommu: apple-dart: Install IOMMU_RESV_TRANSLATED mappings
config: alpha-kismet-CONFIG_OF_IOMMU-CONFIG_APPLE_DART-0-0 (https://download.01.org/0day-ci/archive/20241118/202411181043.4akFsprU-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241118/202411181043.4akFsprU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411181043.4akFsprU-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for OF_IOMMU when selected by APPLE_DART
   WARNING: unmet direct dependencies detected for OF_IOMMU
     Depends on [n]: IOMMU_SUPPORT [=y] && OF [=n] && IOMMU_API [=y]
     Selected by [y]:
     - APPLE_DART [=y] && IOMMU_SUPPORT [=y] && (ARCH_APPLE || COMPILE_TEST [=y]) && !GENERIC_ATOMIC64 [=n]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
