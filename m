Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344BB1C6A3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Nov 2024 08:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732956827; cv=none; b=l9VYdfg4m/+INcVSc/baq2mEoauntNiSB6Ji0BZeXns+K9QdvGN7ASEYJwMDTFcpa4WdcCh4G1nGIg+91EOSRvsxuhGjYICTqtHcerTNrv4MnYYEQtSUNnJI5Sa6KYwHRnxLlfAs6WHL9di9QR9O9ui6UXW69FL98YXFBDK0REk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732956827; c=relaxed/simple;
	bh=EmDsfgJnfNMzla1TZDz7eyrK/e2Z5KIZQJnofsibtfA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gd25HLJQh/kt3pKivvC86FPFu4NUtA6y6kfttJ9kYmXeLIWqSNdE/RJlz82MQepsrUMA6y6iaqZ2s/JkYj+XRprbnQ1QKNJeuHe3i4t7F2N7cXQqKcgB4QCVWT2AD5YLot39wvdH8kICxfrrNcf67mPYL+8Dx9IRQcz4BGuSZBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hQv4o9Gf; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hQv4o9Gf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732956825; x=1764492825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EmDsfgJnfNMzla1TZDz7eyrK/e2Z5KIZQJnofsibtfA=;
  b=hQv4o9GfI34v8G4pj94jUWNvBKdijVQo6S+kYXp+noxXGwxGW8lINkZ9
   3dvmsetEoKl+VnWq00mrte2cE5uG6r37clmuNUc12Icp3MooeWxJfTlF2
   1kw8bS35yas5EG6ffEw0GwtO9a7ips1RdKCRaTO7Uptl9TIuWQiOmR4jb
   3hKZJGt3K5XaQ/6PF3rGsq3h/MnRt9sEjASuiTqMlrNTr8hQXsZoHa2vi
   MPyw9TVry4y/zF+M6jCqLvJNLZoTg7pP97DWgctauKAs2nO7s91HfGwQX
   fM6Q4W3kvEZpOTZH9UiPbBJGKsRJrktCunMTqWK1nPYWyW1Icf6D/yR++
   w==;
X-CSE-ConnectionGUID: qb7WpTNlROSMt/Jg4fLHMQ==
X-CSE-MsgGUID: QB2lizWhSii2xg4YpVJBFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="33109723"
X-IronPort-AV: E=Sophos;i="6.12,198,1728975600"; 
   d="scan'208";a="33109723"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 00:53:36 -0800
X-CSE-ConnectionGUID: APDgOlkaTTunZvBoJbpNnQ==
X-CSE-MsgGUID: AMIPHPb9QEip2sftluxKTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,198,1728975600"; 
   d="scan'208";a="123522691"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 30 Nov 2024 00:53:35 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHJEK-0000S7-0y;
	Sat, 30 Nov 2024 08:53:32 +0000
Date: Sat, 30 Nov 2024 16:53:18 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/020-dart 9/21] kismet: WARNING: unmet direct
 dependencies detected for OF_IOMMU when selected by APPLE_DART
Message-ID: <202411301656.kYajFJSF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/020-dart
head:   74ccfc2a13dcfc026633ddefdc2aab8d49e6426a
commit: 8948cde0ab313f22defe24fc60186333bd04bea3 [9/21] iommu: apple-dart: Install IOMMU_RESV_TRANSLATED mappings
config: alpha-kismet-CONFIG_OF_IOMMU-CONFIG_APPLE_DART-0-0 (https://download.01.org/0day-ci/archive/20241130/202411301656.kYajFJSF-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241130/202411301656.kYajFJSF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411301656.kYajFJSF-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for OF_IOMMU when selected by APPLE_DART
   WARNING: unmet direct dependencies detected for OF_IOMMU
     Depends on [n]: IOMMU_SUPPORT [=y] && OF [=n] && IOMMU_API [=y]
     Selected by [y]:
     - APPLE_DART [=y] && IOMMU_SUPPORT [=y] && (ARCH_APPLE || COMPILE_TEST [=y]) && !GENERIC_ATOMIC64 [=n]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
