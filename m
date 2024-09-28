Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF356487B0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 11:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727521336; cv=none; b=r4G/caZbOrRPklqPaTLWmGEd4wmlLjvghPOY3gB2t/KV8HiIadH2sINDfsYI1GcC0/PEj8EMFN2KKc/DRVMfUWluJ+pUZ72adCfL4M9OouBcoPDW64NcmllbczE8T2Ivlv08iBoKsvAG6VrIKvsoAr7FJ9DdZstkKNhAzfEbO1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727521336; c=relaxed/simple;
	bh=Kgu8rzwX802ZtrS2LAjUZSXom4/91cUwSkBuQbF81+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cX+HhR0Z9fGmSt7VuTmkS21L0WyAkcn7bzTAJ2RkBqOn1/Uj0TT9wQgvuyGWlR4KPXWx9NzKeOJMuJbbWkTTw+36SJCnohTsAOve/X1KrA7ikVhozenQNu2upr5nKSz4j6GTKo96QNblAgDFWTm7o2Gc/CfqBHIyuPx5MpzkMiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fPknidOW; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fPknidOW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727521334; x=1759057334;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kgu8rzwX802ZtrS2LAjUZSXom4/91cUwSkBuQbF81+Y=;
  b=fPknidOW52yyhKA0GlbBPJt21La21S7VOLlK2+7H/IJzF9wz6USiyTGd
   uTdAhEQgy6XC7JCNLYQsO/+g60xRWDdHPTATktAjeoKPOdNqioUzHZfIB
   4BwIiFKDuVhJ4302g6GwEwk1C5f8VtSaf1llKoY5NEMFSR7HiPMT+Q+To
   yt+v+3caGH1Y3wQNdw7lk5iXBJvl+HUM9yjCarN2OaXnKtrTAxznG79rD
   wEaLIP+0bGnEtGpq+kz+IBYW9vgATQ6q0OVwLiCcZosTvephp277p9v+Z
   XNtlnzUPpm97IFqbTP0cEI9xU/kpdjH6OMtnz0aXJ53gRxZaLzUQHkfWN
   w==;
X-CSE-ConnectionGUID: kNCrEChWR3aBEpSURyIvpQ==
X-CSE-MsgGUID: OgHON+MVSVaJcHv2pQvFWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="52076573"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="52076573"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 04:02:13 -0700
X-CSE-ConnectionGUID: Wkz1xgjAQymKPZE5gCUi+w==
X-CSE-MsgGUID: xE4dJZQ7S9Wvf29aMRUFWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="73107922"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Sep 2024 04:02:13 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suVDG-000NCR-1a;
	Sat, 28 Sep 2024 11:02:10 +0000
Date: Sat, 28 Sep 2024 19:01:43 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 4777/16788]
 drivers/tee/crypto/tee_skcipher.c:467:5: warning: no previous prototype for
 'tee_crypt_algapi_init'
Message-ID: <202409281951.4YdDr3yq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: fdf1dcebfcb499dfb4843df4d0be7c9c840cbf40 [4777/16788] tee: crypto: enable support for skcipher
config: arm64-randconfig-001-20240928 (https://download.01.org/0day-ci/archive/20240928/202409281951.4YdDr3yq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409281951.4YdDr3yq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409281951.4YdDr3yq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tee/crypto/tee_skcipher.c:467:5: warning: no previous prototype for 'tee_crypt_algapi_init' [-Wmissing-prototypes]
     467 | int tee_crypt_algapi_init(void)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/tee/crypto/tee_skcipher.c:494:6: warning: no previous prototype for 'tee_crypt_algapi_exit' [-Wmissing-prototypes]
     494 | void tee_crypt_algapi_exit(void)
         |      ^~~~~~~~~~~~~~~~~~~~~


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
