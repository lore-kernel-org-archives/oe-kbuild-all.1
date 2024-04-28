Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56AFC2905
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Apr 2024 15:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714316678; cv=none; b=nCmYmdqZ1DJDNOmIn/r4gSxw+IREL0fUo3ffsRMlFSoYC6Cl4bTZ/DOKDbOJ8QCT6YBYusd5oJSsYyA5c2Q30ccbiC2UHvH0GW3G4krA6HAJmY02BwtcVDhmp1VrmNmAElsTbwBNXjC1l/g1QL/yGFWr2ffc059XDMm7CVr8ZpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714316678; c=relaxed/simple;
	bh=GhNGTE+0qgvZ4Vo2V/qMbAKZOgOh2tL3Hk8BAVnY9K0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SZ6lrpcsgxnuYOxJOYgKQFNPJxacMhPv9xcVX8p9R6FHzgnlYivxD+SdmyHDQ7OA3wXDsR7CTBMRR3AOejtUuz71yqfpzS/5XLKvrmr9aJbtWm/poeZsywsf1ZB67y23DJlHwwPZFEV1ZC6QKzS7tYPgpfuNQi0QkxAtV2Ym/eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bsa2rgsk; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bsa2rgsk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714316676; x=1745852676;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GhNGTE+0qgvZ4Vo2V/qMbAKZOgOh2tL3Hk8BAVnY9K0=;
  b=Bsa2rgskYfinHq5G5JxaEDKHUXanruNxJImVI78QM1WnB/DXBagwLGeF
   uSK2O6W3vY/X7MH4Qw91Sccv11eBEFgmyyc2U6nHu8P+SQwu/LQ1nr4u6
   qD5jgYlqj4iWn8G5+P1E1EVoqFy6H2A4WtXBOvbCirhh3fgbiLMbV0UYc
   wM3md1RY1XaZPKnRnrJRcCPL1WFGhqCDCeN62hKphNilojCxs595RP+vp
   0tfXy3Mgt4ycacmiubbkxpLpfAyjhIhH7JqAXB1kPabgczZIjgrINIj/y
   Nz+EwlOq4mWQWauOwuAN+VXOy+KwxGkeI88WaO+KJdkaMgD67/s4ejMpv
   w==;
X-CSE-ConnectionGUID: Dk1S6fD2QX2PhOJwG3ciGw==
X-CSE-MsgGUID: rf4LMI+nTaGfVxm0WN/l4w==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="13762606"
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="13762606"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 08:04:35 -0700
X-CSE-ConnectionGUID: UPZHQGsfSFO9ln230MLaKA==
X-CSE-MsgGUID: oyQ9dx3ZT9WVG8fcSIQnyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="26510488"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 Apr 2024 08:04:35 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s164u-0006QE-0g;
	Sun, 28 Apr 2024 15:04:32 +0000
Date: Sun, 28 Apr 2024 23:04:26 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 4777/11728]
 drivers/tee/crypto/tee_skcipher.c:467:5: warning: no previous prototype for
 function 'tee_crypt_algapi_init'
Message-ID: <202404282202.k1p1Eag9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   37770f55ac9c4f6cd958eb5544939207eed8478f
commit: fdf1dcebfcb499dfb4843df4d0be7c9c840cbf40 [4777/11728] tee: crypto: enable support for skcipher
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240428/202404282202.k1p1Eag9-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404282202.k1p1Eag9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404282202.k1p1Eag9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tee/crypto/tee_skcipher.c:467:5: warning: no previous prototype for function 'tee_crypt_algapi_init' [-Wmissing-prototypes]
   int tee_crypt_algapi_init(void)
       ^
   drivers/tee/crypto/tee_skcipher.c:467:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int tee_crypt_algapi_init(void)
   ^
   static 
>> drivers/tee/crypto/tee_skcipher.c:494:6: warning: no previous prototype for function 'tee_crypt_algapi_exit' [-Wmissing-prototypes]
   void tee_crypt_algapi_exit(void)
        ^
   drivers/tee/crypto/tee_skcipher.c:494:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void tee_crypt_algapi_exit(void)
   ^
   static 
   2 warnings generated.


vim +/tee_crypt_algapi_init +467 drivers/tee/crypto/tee_skcipher.c

   466	
 > 467	int tee_crypt_algapi_init(void)
   468	{
   469		int i = 0, ret = 0;
   470		bool registered = false;
   471	
   472		for (i = 0; i < ARRAY_SIZE(driver_algs); i++) {
   473			struct tee_crypt_skcipher_alg *t_alg = driver_algs + i;
   474	
   475			tee_crypt_skcipher_alg_init(t_alg);
   476	
   477			ret = crypto_register_skcipher(&t_alg->skcipher);
   478			if (ret) {
   479				pr_warn("%s alg registration failed\n",
   480					t_alg->skcipher.base.cra_driver_name);
   481				continue;
   482			}
   483	
   484			t_alg->registered = true;
   485			registered = true;
   486		}
   487	
   488		if (registered)
   489			pr_info("tee_crypt algorithms registered in /proc/crypto\n");
   490	
   491		return ret;
   492	}
   493	
 > 494	void tee_crypt_algapi_exit(void)
   495	{
   496		int i;
   497	
   498		for (i = 0; i < ARRAY_SIZE(driver_algs); i++) {
   499			struct tee_crypt_skcipher_alg *t_alg = driver_algs + i;
   500	
   501			if (t_alg->registered)
   502				crypto_unregister_skcipher(&t_alg->skcipher);
   503		}
   504	}
   505	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
