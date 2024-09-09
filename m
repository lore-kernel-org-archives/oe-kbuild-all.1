Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362261B5EC6
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 13:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725887178; cv=none; b=MWXc34jeQKuakvZtfxm9JUjHAy4nplaKKX+LtleYHJY6j+MXSEEgo4SP8JTplSQv9W4v7MejUy7B5SKUBuOKpcoWJf7V4g+EvZSOC/HvnKTTNgYv2ng09ozHkx1o8Nz+UEhBYQYPXdHynZvdiIjjc4wUMa2ooUBszW8gjVOjKRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725887178; c=relaxed/simple;
	bh=6gsdrp0J3LNoef6NXNgAa8/OG/tdyYpaNf9vzmZlniQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AI31/y035a6vqS0KLGLYNS4/4Xpb/WfdV3WdzJZ47Wcs+6pmcOUcqbYHnBVzEsIkkIK/s5dEBae+QlROtekQuLJ8VSfmIaRZOFAslRJau1igQqEBKZfnCFweo43QVHMuQXncfnHcNkFutEp7XQyMx5iAPisiytpLqgMcXAKmRtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ObU3njb4; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ObU3njb4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725887176; x=1757423176;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6gsdrp0J3LNoef6NXNgAa8/OG/tdyYpaNf9vzmZlniQ=;
  b=ObU3njb4C6k0NAyoCBRGmbDXzJRN1T3eV+W9Gfk7WXYWzwvUuDCcKuc9
   ZEGZ36ocIkiKmRn4V+qujI5vqzutDdXP03h9Aj7k079/PUE5Is2Z2jTDT
   RhnAL+8VxAX9NBxgkspDBLmAPVGbPxSvoSGB9M7kiVCvyU001oc4wEt9C
   oBlE1ZPXYiWW/E60O4QQoG2n/N7BGBhgg0rx7CQ1CvBi4NazeeA9SpMpG
   s3BLGlRsSIVqpwqIGQZ/xTaXM19M8dw5Bifl3DMyWuBNJoy0iVv9XD4s7
   PAwvhG0rSLVf7jss1gOsy3lUXtedMepfqHxb4IsPumBHH1eQ/lNPdpGxL
   A==;
X-CSE-ConnectionGUID: jAv9LvTvRmS5+6zyElaOKw==
X-CSE-MsgGUID: 7wlv8b3kTdyjD5nbkGK99Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="47102889"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="47102889"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 06:06:16 -0700
X-CSE-ConnectionGUID: ljyxDAC1TRim4RA7Il6n7Q==
X-CSE-MsgGUID: sVFz59K2SBSBDZSlLIr7Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="66725135"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Sep 2024 06:06:14 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sne5r-000EjI-2w;
	Mon, 09 Sep 2024 13:06:11 +0000
Date: Mon, 9 Sep 2024 21:05:55 +0800
From: kernel test robot <lkp@intel.com>
To: Kamlesh Gurudasani <kamlesh@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>
Subject: [ti:ti-linux-6.6.y-wip 107/137] kismet: WARNING: unmet direct
 dependencies detected for CRYPTO_CRC64_ISO3309 when selected by
 CRYPTO_DEV_TI_MCRC64
Message-ID: <202409092042.O3V5VfoV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.6.y-wip
head:   c0deda7906ed2661afaa841e1d822932a37f38f6
commit: 2af1725d4bd6b8b24a1a2b47e1de27949d1cee9b [107/137] crypto: ti - add driver for MCRC64 engine
config: x86_64-kismet-CONFIG_CRYPTO_CRC64_ISO3309-CONFIG_CRYPTO_DEV_TI_MCRC64-0-0 (https://download.01.org/0day-ci/archive/20240909/202409092042.O3V5VfoV-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240909/202409092042.O3V5VfoV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409092042.O3V5VfoV-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CRYPTO_CRC64_ISO3309 when selected by CRYPTO_DEV_TI_MCRC64
   WARNING: unmet direct dependencies detected for CRYPTO_CRC64_ISO3309
     Depends on [n]: CRYPTO [=y] && CRC64 [=n]
     Selected by [y]:
     - CRYPTO_DEV_TI_MCRC64 [=y] && CRYPTO [=y] && CRYPTO_HW [=y] && (ARCH_K3 || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
