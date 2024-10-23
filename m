Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44B96CDAF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Oct 2024 05:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729661013; cv=none; b=r8pqf7hobcvb/HC9QgvddEZWrHdhl+zW1BVblKSKwv1riXqWQqQzRAJB+bNzv53ycc4Nji/G2CgdIMcJMGlrjzbSKAvkKmqqJ+jk/iEepLKylJdsAxmg9Xja3qESBRac+/rPmgLBpdrCL3Zo5B+HtsmJ1iqPEUJG1FiLgKfW6NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729661013; c=relaxed/simple;
	bh=3cl51WkzO3CedIytLlMWIx4xf4ywZpEvDshlRDrRpvk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q2mQkJIfsqwuDSAo6Jko1d0SWOqH1O3ZdoSkHRi/G7+9Q8K1w4W2r44RoV2cbSrDvpvuz1RngD6NivzmMFtJ2/pirkGMbKuwn57w8rvqyTKgIaKKjVSZ/2QQWP/QG+7YxAEtw0k9u1mIMQD1Yky7ca13Br4kitxbeVRw/hjnuao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lgv7Cm9w; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lgv7Cm9w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729661012; x=1761197012;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3cl51WkzO3CedIytLlMWIx4xf4ywZpEvDshlRDrRpvk=;
  b=lgv7Cm9wpYXSn3I2GW4e85kWOfeQTmPvWx6Y8WarNbcAgcQZhcX5Vca9
   SSMU7ylZ6JR532bFzXolLFYa8+Lpgy2rnwagQKOjclfcfMwmP/Y+4UDu3
   C7BPW6ueobUBprk5N6hfbIjLx93xBT9kw21JdJ8kf1Awyl9XHHMjx2zaC
   ks7QKySpiUadXjpb+rFJ+QXbUOVTab5YWf5QoL6rxs1eZXjwm/pHru2OP
   PfBHbnBd0GiNELxE+0He4a+glLFfsFoPyk0QQpUrSYJLKwzVYguIQc9rx
   gqURpreMRk4w7aExOA+1l/BA5LZH+kuRhrFwrcwa5kYa0oFpUSB3hHVRY
   Q==;
X-CSE-ConnectionGUID: 6cbohPy2TwCv3C9h8O3PCA==
X-CSE-MsgGUID: hg2QvFjMRb68edH7ccTNNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39774822"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="39774822"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 22:23:28 -0700
X-CSE-ConnectionGUID: QD5gcGF+ROKp2cg1Z7ZIYQ==
X-CSE-MsgGUID: O3rAU/7gTi+Vb9sAc3EJIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="110882530"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 Oct 2024 22:23:26 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3Tq7-000UTT-2u;
	Wed, 23 Oct 2024 05:23:23 +0000
Date: Wed, 23 Oct 2024 13:22:52 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/020-dart 9/21] kismet: WARNING: unmet direct
 dependencies detected for OF_IOMMU when selected by APPLE_DART
Message-ID: <202410231341.5UrKAqan-lkp@intel.com>
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
config: i386-kismet-CONFIG_OF_IOMMU-CONFIG_APPLE_DART-0-0 (https://download.01.org/0day-ci/archive/20241023/202410231341.5UrKAqan-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241023/202410231341.5UrKAqan-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410231341.5UrKAqan-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for OF_IOMMU when selected by APPLE_DART
   WARNING: unmet direct dependencies detected for OF_IOMMU
     Depends on [n]: IOMMU_SUPPORT [=y] && OF [=n] && IOMMU_API [=y]
     Selected by [y]:
     - APPLE_DART [=y] && IOMMU_SUPPORT [=y] && (ARCH_APPLE || COMPILE_TEST [=y]) && !GENERIC_ATOMIC64 [=n]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
