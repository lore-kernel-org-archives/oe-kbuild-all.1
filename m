Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C0A2066D3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Feb 2025 08:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739435468; cv=none; b=roRVAwrfj1QnW0+hOoMqhjrNOSRQjkKc9T3Tu3IvbjNpLnGeV+aTruUCyy0Y9Xe/J41yMR1YNmMts7TPPvemMSiEO7vIw7xS95U5KWhDYr7JsIZbwDbcdYVtbSTGUNQdur3Cr2/1jicaERRyS98zin5ZB6JO2QkQvi33u+Y367g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739435468; c=relaxed/simple;
	bh=tEA0Byc+ppVC6QbfCcbNtnO9sl0V+gqizcThzhBI4hc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ArRTp6LrkZCMFJkUXXH3eXPON0EPdAco6/1qSBQmpeq0Xx16p6afkZl/m4xwKxtfJuqCizK8qGBqYeBbRDPjMiXgs1uzY4WmvkrOHtPtaczDjZwshUFtrDSTdGUxehNQv417eMNkNqwANCh68mJZw0goVJMzGP3vJl+rqrDnPgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cl0Dk0SW; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cl0Dk0SW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739435466; x=1770971466;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tEA0Byc+ppVC6QbfCcbNtnO9sl0V+gqizcThzhBI4hc=;
  b=cl0Dk0SW2mF7X4PvcCnO35rRRLWlC7vVQQ3IivmwMT2K3eX2YWoi/6d0
   po39xB6B8V5mdUH3qEEBNgMXoXaw2tynHwO4nJjQX7y/5CGW6mac0eC1M
   JsqL+ZLmim3EsY0qwRsPeFiQOisuGT1U2c7NFekmI/dZmGccoVIHyyyVq
   3wfdnyZPz8YER+iIFwBfJotvUnWR6zB6WHxYUfB0UQNTuW8PT18SCuPqI
   AXftZDkJnw1/VDMzo96C/tMtu4rr1V99x2pRcWo8IDgA7MK2OCMRcQeud
   z/pa5VWRV+2PP/RKyONaSg+BOJkTFauTX86NKobmXJXnVhnlddeZJqAP/
   g==;
X-CSE-ConnectionGUID: 77s5jxBcTiOgPNNK402ovg==
X-CSE-MsgGUID: OEurzneDTM+w1OfASq0Ixw==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="50773032"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="50773032"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 00:31:04 -0800
X-CSE-ConnectionGUID: H8EM1sk1Ti6K4ZEIQEk4DA==
X-CSE-MsgGUID: vZPKhXH7RJCqHrwBYihoAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="113065383"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Feb 2025 00:31:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiUcc-0016oB-2E;
	Thu, 13 Feb 2025 08:30:58 +0000
Date: Thu, 13 Feb 2025 16:30:25 +0800
From: kernel test robot <lkp@intel.com>
To: Akhil R <akhilrajeev@nvidia.com>, herbert@gondor.apana.org.au,
	davem@davemloft.net, thierry.reding@gmail.com, jonathanh@nvidia.com,
	linux-crypto@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Akhil R <akhilrajeev@nvidia.com>
Subject: Re: [PATCH v2 09/10] crypto: tegra: Reserve keyslots to allocate
 dynamically
Message-ID: <202502131627.mj5t3YOe-lkp@intel.com>
References: <20250211171713.65770-10-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211171713.65770-10-akhilrajeev@nvidia.com>

Hi Akhil,

kernel test robot noticed the following build warnings:

[auto build test WARNING on herbert-crypto-2.6/master]
[also build test WARNING on herbert-cryptodev-2.6/master linus/master v6.14-rc2 next-20250213]
[cannot apply to tegra/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Akhil-R/crypto-tegra-Use-separate-buffer-for-setkey/20250212-012434
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6.git master
patch link:    https://lore.kernel.org/r/20250211171713.65770-10-akhilrajeev%40nvidia.com
patch subject: [PATCH v2 09/10] crypto: tegra: Reserve keyslots to allocate dynamically
config: nios2-randconfig-r112-20250213 (https://download.01.org/0day-ci/archive/20250213/202502131627.mj5t3YOe-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250213/202502131627.mj5t3YOe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502131627.mj5t3YOe-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/crypto/tegra/tegra-se-aes.c: note: in included file:
>> drivers/crypto/tegra/tegra-se.h:509:37: sparse: sparse: marked inline, but without a definition
>> drivers/crypto/tegra/tegra-se.h:509:37: sparse: sparse: marked inline, but without a definition
   drivers/crypto/tegra/tegra-se-aes.c: note: in included file (through include/uapi/linux/swab.h, include/linux/swab.h, include/uapi/linux/byteorder/little_endian.h, ...):
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   drivers/crypto/tegra/tegra-se-aes.c: note: in included file:
>> drivers/crypto/tegra/tegra-se.h:509:37: sparse: sparse: marked inline, but without a definition
>> drivers/crypto/tegra/tegra-se.h:509:37: sparse: sparse: marked inline, but without a definition
>> drivers/crypto/tegra/tegra-se.h:509:37: sparse: sparse: marked inline, but without a definition

vim +509 drivers/crypto/tegra/tegra-se.h

   500	
   501	/* Functions */
   502	int tegra_init_aes(struct tegra_se *se);
   503	int tegra_init_hash(struct tegra_se *se);
   504	void tegra_deinit_aes(struct tegra_se *se);
   505	void tegra_deinit_hash(struct tegra_se *se);
   506	int tegra_key_submit(struct tegra_se *se, const u8 *key,
   507			     u32 keylen, u32 alg, u32 *keyid);
   508	
 > 509	inline int tegra_key_submit_reserved(struct tegra_se *se, const u8 *key,
   510					     u32 keylen, u32 alg, u32 *keyid);
   511	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
