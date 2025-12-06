Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C852D8797
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Dec 2025 06:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765004149; cv=none; b=kNlyITG4wIBx8//BFH3YA1Z0ZwKM1ADhKsHr5EKa7nMoXGdlaOcFxrCOuEsD5J+SEVoEa3DHY1g0SL+xOI21ZW1vHYa/HWovdPFMp5iiDMKhBw0o3FM7UOF1uHQ5PyPUJVptOe+OFH1Js8mcg1nCGjuDsiWYP8EQQkFf0358pgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765004149; c=relaxed/simple;
	bh=roJJ6+k1ZVNstabFP+gln5nJgWh3ZdphYLGe1ZCC8a4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C0eatr0gA0ffi6c8bYC3BS2xCYRksN7YvvHLwUOeQl0RRQdn45xut26zA9DY6yf8+xzfNtp/S1U43HwSV2SIJWfk2TIzT8fVJnwloncxWn3UyOCiImWV/qrwbPoxrTFCOAV5ybXUo8mF7K7Nv7ajhptXDMhwitjon4K2U4WkgBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lAJvnXDn; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lAJvnXDn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765004148; x=1796540148;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=roJJ6+k1ZVNstabFP+gln5nJgWh3ZdphYLGe1ZCC8a4=;
  b=lAJvnXDnfQ10lgIXUMLOaEjWPQ3okEkte6NxZBC+AoLXh3lFM2NUdaQW
   dZSIBtuOBRx7ArztkintkotxhfS9Q2lHKnlASRu0wKMehaFMn5T5bH7tj
   CAK1j+9qtDm/LSpJqxpy7E4r5vzldMV9I9awCAT3591hmj9wiC5ZMzto2
   CLNfAAgSrHPU0tWbGn3s/7YUtqUDMP7ACVxeUPD6jD3egSF5mZOtaiX7X
   vAJNczighmO6EoXwuAILhJRVDi5B4dugobap3RB7sCxavsfcOBZjWDBeZ
   5lmQN58ST3WK2lkrG56+b1z8lZbNwgcPeluVdl1r5eP3yrmVc5i2X75tg
   A==;
X-CSE-ConnectionGUID: 3321E53SSI2Q/lBY6BW6OA==
X-CSE-MsgGUID: RaSwHw1aQraL2O4x6JK4ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="78499061"
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="78499061"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 22:55:48 -0800
X-CSE-ConnectionGUID: Kh99Wt01Szeb3C6dngaZVw==
X-CSE-MsgGUID: /Syw7FvmTRm5vP+SPlwOmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="195920717"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 Dec 2025 22:55:46 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRmCm-00000000FxX-1INA;
	Sat, 06 Dec 2025 06:55:44 +0000
Date: Sat, 6 Dec 2025 14:55:20 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 2/2] lib/crypto: tests: Add KUnit tests for ML-DSA
 verification
Message-ID: <202512061435.pNMCwRbe-lkp@intel.com>
References: <20251203072844.484893-3-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203072844.484893-3-ebiggers@kernel.org>

Hi Eric,

kernel test robot noticed the following build errors:

[auto build test ERROR on 3f9f0252130e7dd60d41be0802bf58f6471c691d]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Biggers/lib-crypto-Add-ML-DSA-verification-support/20251203-153410
base:   3f9f0252130e7dd60d41be0802bf58f6471c691d
patch link:    https://lore.kernel.org/r/20251203072844.484893-3-ebiggers%40kernel.org
patch subject: [PATCH v3 2/2] lib/crypto: tests: Add KUnit tests for ML-DSA verification
config: i386-randconfig-004-20251206 (https://download.01.org/0day-ci/archive/20251206/202512061435.pNMCwRbe-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512061435.pNMCwRbe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512061435.pNMCwRbe-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: module mldsa_kunit uses symbol mldsa_use_hint from namespace EXPORTED_FOR_KUNIT_TESTING, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
