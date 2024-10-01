Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564491865E0
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Oct 2024 12:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727785278; cv=none; b=chcKRFDlgXbvBJh/eFQoD+Snwe9RXvVrQJqnzYxJydFGPzJ/cfIz14xN8GdSFwnnXSoNh+gnwgjOVjpoxiZYejwodlc1mX/jb7gUKkvLhDjNc+RqE7PQXV9l6q+qbg9BsMXygiWGqoeZMc5VKKBsRuPCVpPSu80YaoXTikEBYvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727785278; c=relaxed/simple;
	bh=v2ZdrWvmXgWjdDmlu9Q+nBTaSR8DUnc+pl6DMW/g+8M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ESocfuY5r5vrGJp923huGgMhb0/GHhSdLsWxTzcMfeef7qczEKRGBJbymtgXt4ihgYMNfBt39N27fUKl+9keeab9ujoOjqbObaE8/wTOWiB36mm0W9avEW1DdExmFM2x/M5dxIC+tmBbgbcKk5ixWeSmKpJSQaZazdCShLl4tO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GKfPwLaS; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GKfPwLaS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727785276; x=1759321276;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v2ZdrWvmXgWjdDmlu9Q+nBTaSR8DUnc+pl6DMW/g+8M=;
  b=GKfPwLaSld/3ivXKnpCau5AZmEms84ZAcpqNjfhe/gUzRynEXB8wytXB
   ECBf/P2RpjGg9EPUlrtXR54aP5DyCVDI2ACM7xcGU79Alzq3+i0n5g8pn
   Q2HsgiSwmAuPj4oZyjWaiuSd6p4QcepPxb3jlmpQnb+ZKJoX8AFmjfDLZ
   N96welChc9z0vC3YaJpzluma7bIej/aEJjfU5gBhQOsmgxvS0IJ7eBe3q
   Drq4Vwbh4mr6xji014Mi3KF4/nY0SepxB8OA0fymSUKt0ObPwW11qM7z/
   rRK10vKocoQR9SMQGdyTaan3W152bLJt5uVYSXx4ZwY0jBSLaHqWs0j7X
   w==;
X-CSE-ConnectionGUID: mPKG3ZiaRliBh4W3HBWx6g==
X-CSE-MsgGUID: 4Oga8RTAS7aTq64ErkzE1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27055718"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="27055718"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 05:21:16 -0700
X-CSE-ConnectionGUID: tXregDvjRAqceqgeR/H/mg==
X-CSE-MsgGUID: vKkKbkcXS5qFoXsr0saQIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="77702803"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 01 Oct 2024 05:21:14 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svbsO-000Qfp-1z;
	Tue, 01 Oct 2024 12:21:12 +0000
Date: Tue, 1 Oct 2024 20:20:38 +0800
From: kernel test robot <lkp@intel.com>
To: Nuno Sa <nuno.sa@analog.com>
Cc: oe-kbuild-all@lists.linux.dev, Nuno Sa <noname.nuno@gmail.com>
Subject: [nsa:b4/b4-dev-adp5589-fw-conversion 7/14]
 drivers/input/keyboard/adp5589-keys.c:537:undefined reference to `__ffsdi2'
Message-ID: <202410012040.EHyuofvw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nunojsa/linux b4/b4-dev-adp5589-fw-conversion
head:   c3b3d52107fc91e0c0f51d4966c5f365d08f4a66
commit: 764e9a3482f91d868b9b5e3637499312ca40d86c [7/14] Input: adp5589-keys: add support for fw properties
config: sparc-randconfig-002-20241001 (https://download.01.org/0day-ci/archive/20241001/202410012040.EHyuofvw-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241001/202410012040.EHyuofvw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410012040.EHyuofvw-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc-linux-ld: drivers/input/keyboard/adp5589-keys.o: in function `adp5589_gpio_set_bias':
>> drivers/input/keyboard/adp5589-keys.c:537:(.text+0x7bc): undefined reference to `__ffsdi2'


vim +537 drivers/input/keyboard/adp5589-keys.c

   506	
   507	static int adp5589_gpio_set_bias(struct adp5589_kpad *kpad, unsigned int pin,
   508					 enum pin_config_param cfg)
   509	{
   510		unsigned int bank, msk;
   511		int error;
   512		u8 val;
   513	
   514		mutex_lock(&kpad->gpio_lock);
   515	
   516		if (cfg == PIN_CONFIG_BIAS_PULL_UP)
   517			val = test_bit(pin, &kpad->pull_up_100k_map) ? 2 : 0;
   518		else if (cfg == PIN_CONFIG_BIAS_PULL_DOWN)
   519			val = 1;
   520		else
   521			val = 3;
   522	
   523		/*
   524		 * For the BIAS configs, we have 4 pins per register. We need to take
   525		 * care for the adp5585 variant where we have a hole in the registers
   526		 * between rows and columns. Hence, we detect when a pin is a column and
   527		 * apply the proper offset and pin normalization.
   528		 */
   529		if (kpad->info->is_adp5585 && pin >= kpad->info->var->col_shift) {
   530			bank = 2 + (pin - kpad->info->var->col_shift) / 4;
   531			msk = adp5589_rpull_masks[(pin - kpad->info->var->col_shift) % 4];
   532		} else {
   533			bank = pin / 4;
   534			msk = adp5589_rpull_masks[pin % 4];
   535		}
   536	
 > 537		val <<= __bf_shf(msk);
   538		kpad->rpull[bank] = (kpad->rpull[bank] & ~msk) | (val & msk);
   539	
   540		error = adp5589_write(kpad->client,
   541				      kpad->info->var->reg(ADP5589_RPULL_CONFIG_A) + bank,
   542				      kpad->rpull[bank]);
   543	
   544		mutex_unlock(&kpad->gpio_lock);
   545	
   546		return error;
   547	}
   548	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
