Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7721FB899
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 10:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731493918; cv=none; b=qFsmfTQ+g1apqAaNYiQgxB+yOts90UvmAH3Ej6c1AfsrFR4A+JHRdO2lV3KMKJF6GSPyTkAtXKwB1J+1pK4cz2BZREkckt0c2Oeg4eDS/vTCP8/tv3FuM8JDx80DPpwW8TelkV8sAFDXfg5tdKb8jDcx7+vhSglCTR4wSEYTzh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731493918; c=relaxed/simple;
	bh=/XlsdWM8m7wFGbxEyqtaPkocTZvoD6h8eVX12T6VUiI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EX7hIyt52GaeKyPerCNw5FUo89kWIjj6daBSc5AvJTjLq0NCQ35skDzzYE9mZxiRn7IBzbioi6TRJ2ISPAAQEBeoMP+crvKMBybAtuHQY/llaLDZKx7HX53UNW1CzH/OZelvi1EUh7518HGyHXnA3w4tKXpD5UxCEcZqCugk83I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vkhidyim; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vkhidyim"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731493918; x=1763029918;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/XlsdWM8m7wFGbxEyqtaPkocTZvoD6h8eVX12T6VUiI=;
  b=Vkhidyim8mGMz6O3OYyNJ4IZt8rs+qD6IS7JSpmmIcfxz4q9P5c6uC31
   hC9EG+bsSs74EoTQwpR+jTvdDj+UqkKJ6Yeg49+aN5ezi5w1e/4X4EKl+
   CGzNGTwlY4rx6EbOg8q798YdRiALncF0NCfMbLHEysSo5pI1EsP28RbMb
   tcmYOTq6WvnX4+wFmM+AzEz3/60bZPcLTOZGrzJZuu4vqFqtMcGeywgPF
   mTw+CKbpobZ8rxFeLlIsSt/Nf06k8mD7mn/Gn+LKdhUHcSBeHKlMVAsdC
   dgdWsl0CFEk3tjWSaaCvLjQJWfRFSKGKVNLvFmB5PRDeYuL+268dXiPdM
   A==;
X-CSE-ConnectionGUID: v8HPj2KZTt26fmO45WtNBg==
X-CSE-MsgGUID: Wza2W+3BQA+SKSCA/UgQpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="48830492"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="48830492"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 02:31:57 -0800
X-CSE-ConnectionGUID: ZfqzMQWyTr2YRzjU4pVxpw==
X-CSE-MsgGUID: F7LxGS5DQnKWaQ8p5kq0fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="87941959"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Nov 2024 02:31:54 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBAfA-0000F3-0N;
	Wed, 13 Nov 2024 10:31:52 +0000
Date: Wed, 13 Nov 2024 18:31:51 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 1423/30000] kismet: WARNING: unmet
 direct dependencies detected for ASYMMETRIC_KEY_TYPE when selected by
 INCREMENTAL_FS
Message-ID: <202411131830.AluAcJxs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   069e12986fd81e33097f806c8f2787f5d5416bfd
commit: 1be052b20ba04b635cf87bcff80de5314697953e [1423/30000] ANDROID: Initial commit of Incremental FS
config: x86_64-kismet-CONFIG_ASYMMETRIC_KEY_TYPE-CONFIG_INCREMENTAL_FS-0-0 (https://download.01.org/0day-ci/archive/20241113/202411131830.AluAcJxs-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241113/202411131830.AluAcJxs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411131830.AluAcJxs-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ASYMMETRIC_KEY_TYPE when selected by INCREMENTAL_FS
   WARNING: unmet direct dependencies detected for ASYMMETRIC_KEY_TYPE
     Depends on [n]: CRYPTO [=y] && KEYS [=n]
     Selected by [y]:
     - INCREMENTAL_FS [=y] && BLOCK [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
