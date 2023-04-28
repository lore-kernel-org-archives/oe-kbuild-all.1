Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF34883E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Apr 2023 19:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682708742; x=1714244742;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rk8yYtIwamOrso5Q1PEtVxEzvWx2fR1+UcK/RdDnuXk=;
  b=AYVzekKZ8Mg8jKZiDRqO2A5T6n2/E5V3wlpBTFLs8siubhyhf+odOhin
   cYpPL8jTIKOoC9g2Vfx+xMa4bGSAAO5IdrLEGIYiDKzAoiEZNXWg5RYcA
   5Nzs9xBfRqf7Gq7DFOhB/kHYg5fHbqSkUVM2idIzALRq4WATXua2VDtMN
   t0HcmLNYlJ+ZXUfQ99FztYQ9SUJjv2L7yN9L//2HFraUDS9KgR94kFFar
   60ax6wgCVW4z+UoEWX+FQu+ZA21t1KzaeJAJBgl3FRULlWKRKOhTjFgCC
   gIbk0ylb5Qfg9ROBQeN+OYcavANUKhsczWyplVnFmgpWTe4/1W7qhGE2C
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="410938054"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; 
   d="scan'208";a="410938054"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 12:05:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="869294086"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; 
   d="scan'208";a="869294086"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 28 Apr 2023 12:05:41 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psTPY-0000cv-2P;
	Fri, 28 Apr 2023 19:05:40 +0000
Date: Sat, 29 Apr 2023 03:04:40 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/110-smc 3/23]
 drivers/platform/apple/smc_core.c:210:26: sparse: sparse: cast to restricted
 __be32
Message-ID: <202304290212.x4sN2Kfl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/110-smc
head:   196d8f8e3634a4e07a5b2f9688f233120401a253
commit: d55f4cc3a82c44e82a3fe6fc02403752ea0e2053 [3/23] platform/apple: Add new Apple Mac SMC driver
config: arm64-randconfig-s042-20230428 (https://download.01.org/0day-ci/archive/20230429/202304290212.x4sN2Kfl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/AsahiLinux/linux/commit/d55f4cc3a82c44e82a3fe6fc02403752ea0e2053
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/110-smc
        git checkout d55f4cc3a82c44e82a3fe6fc02403752ea0e2053
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/platform/apple/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304290212.x4sN2Kfl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/platform/apple/smc_core.c:210:26: sparse: sparse: cast to restricted __be32

vim +210 drivers/platform/apple/smc_core.c

   190	
   191	struct apple_smc *apple_smc_probe(struct device *dev, const struct apple_smc_backend_ops *ops, void *cookie)
   192	{
   193		struct apple_smc *smc;
   194		u32 count;
   195		int ret;
   196	
   197		smc = devm_kzalloc(dev, sizeof(*smc), GFP_KERNEL);
   198		if (!smc)
   199			return ERR_PTR(-ENOMEM);
   200	
   201		smc->dev = dev;
   202		smc->be_cookie = cookie;
   203		smc->be = ops;
   204		mutex_init(&smc->mutex);
   205		BLOCKING_INIT_NOTIFIER_HEAD(&smc->event_handlers);
   206	
   207		ret = apple_smc_read_u32(smc, SMC_KEY(#KEY), &count);
   208		if (ret)
   209			return ERR_PTR(dev_err_probe(dev, ret, "Failed to get key count"));
 > 210		smc->key_count = be32_to_cpu(count);
   211	
   212		ret = apple_smc_get_key_by_index(smc, 0, &smc->first_key);
   213		if (ret)
   214			return ERR_PTR(dev_err_probe(dev, ret, "Failed to get first key"));
   215	
   216		ret = apple_smc_get_key_by_index(smc, smc->key_count - 1, &smc->last_key);
   217		if (ret)
   218			return ERR_PTR(dev_err_probe(dev, ret, "Failed to get last key"));
   219	
   220		/* Enable notifications */
   221		apple_smc_write_flag(smc, SMC_KEY(NTAP), 1);
   222	
   223		dev_info(dev, "Initialized (%d keys %p4ch..%p4ch)\n",
   224			 smc->key_count, &smc->first_key, &smc->last_key);
   225	
   226		dev_set_drvdata(dev, smc);
   227	
   228		ret = mfd_add_devices(dev, -1, apple_smc_devs, ARRAY_SIZE(apple_smc_devs), NULL, 0, NULL);
   229		if (ret)
   230			return ERR_PTR(dev_err_probe(dev, ret, "Subdevice initialization failed"));
   231	
   232		return smc;
   233	}
   234	EXPORT_SYMBOL(apple_smc_probe);
   235	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
