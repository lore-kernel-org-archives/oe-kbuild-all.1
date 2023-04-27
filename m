Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB7F1FB1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Apr 2023 07:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682580017; x=1714116017;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=V9H/aHfCvVp/XBVhoLYicQA8XSzOtHgD9i1YqfHzTJc=;
  b=jTtOZlFzP9HQ6+D/dUsUy/KpOprmQ7OWDJ3aTP4Ih3Y2TNh6PHZF6B4W
   kyBZwg9g3rSDub1myxX2IkWW/bK9wO0wouBdkJ5xjq4Ai0oHqTROfCvVI
   Qb8oRCKBS++GYxZ8S7KVi8yAPMo8doAeRvXH0K8gSgGpYd5rWmfGTdD0Z
   WTJBiWOljuf0dvPME9zkUsxt/gmY7CoJEAbsg5LMW3KDE1uv9WDDULdkT
   VqdkNWA+7xDTXGUVvvFkB2At34lJ0+mNWyajZ9Hz5HQtMJ3Uu8VSNriBr
   A+3JKLjzU2a+uGkrMeKqQ0IT05c4rypdwL4CvJwP4KeD0ys03MkiBcj4Y
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="410378953"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="410378953"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 00:20:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="868594991"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="868594991"
Received: from lkp-server01.sh.intel.com (HELO 1e0e07564161) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 27 Apr 2023 00:20:15 -0700
Received: from kbuild by 1e0e07564161 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prvvL-00004r-1t;
	Thu, 27 Apr 2023 07:20:15 +0000
Date: Thu, 27 Apr 2023 15:19:57 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/header-cleanups 56/56]
 drivers/char/hw_random/ingenic-rng.c:128:34: error: array type has
 incomplete element type 'struct of_device_id'
Message-ID: <202304271540.N1cW3ntm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/header-cleanups
head:   4cc2262d09430892703b2d82d4a48f65679a8b53
commit: 4cc2262d09430892703b2d82d4a48f65679a8b53 [56/56] of: header cleanups
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20230427/202304271540.N1cW3ntm-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=4cc2262d09430892703b2d82d4a48f65679a8b53
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch --no-tags robh dt/header-cleanups
        git checkout 4cc2262d09430892703b2d82d4a48f65679a8b53
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/char/hw_random/ drivers/mmc/host/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304271540.N1cW3ntm-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/char/hw_random/ingenic-rng.c: In function 'ingenic_rng_probe':
>> drivers/char/hw_random/ingenic-rng.c:98:51: error: implicit declaration of function 'of_device_get_match_data' [-Werror=implicit-function-declaration]
      98 |         priv->version = (enum ingenic_rng_version)of_device_get_match_data(&pdev->dev);
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/hw_random/ingenic-rng.c: At top level:
>> drivers/char/hw_random/ingenic-rng.c:128:34: error: array type has incomplete element type 'struct of_device_id'
     128 | static const struct of_device_id ingenic_rng_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
>> drivers/char/hw_random/ingenic-trng.c:145:34: error: array type has incomplete element type 'struct of_device_id'
     145 | static const struct of_device_id ingenic_trng_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~
--
>> drivers/mmc/host/jz4740_mmc.c:1206:35: error: implicit declaration of function 'of_match_ptr' [-Werror=implicit-function-declaration]
    1206 |                 .of_match_table = of_match_ptr(jz4740_mmc_of_match),
         |                                   ^~~~~~~~~~~~
>> drivers/mmc/host/jz4740_mmc.c:1206:35: warning: initialization of 'const struct of_device_id *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/mmc/host/jz4740_mmc.c:1206:35: note: (near initialization for 'jz4740_mmc_driver.driver.of_match_table')
>> drivers/mmc/host/jz4740_mmc.c:1206:35: error: initializer element is not constant
   drivers/mmc/host/jz4740_mmc.c:1206:35: note: (near initialization for 'jz4740_mmc_driver.driver.of_match_table')
   cc1: some warnings being treated as errors


vim +128 drivers/char/hw_random/ingenic-rng.c

190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23   82) 
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23   83) static int ingenic_rng_probe(struct platform_device *pdev)
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23   84) {
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23   85) 	struct ingenic_rng *priv;
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23   86) 	int ret;
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23   87) 
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23   88) 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23   89) 	if (!priv)
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23   90) 		return -ENOMEM;
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23   91) 
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23   92) 	priv->base = devm_platform_ioremap_resource(pdev, 0);
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23   93) 	if (IS_ERR(priv->base)) {
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23   94) 		pr_err("%s: Failed to map RNG registers\n", __func__);
11a954eebc4396 Wei Yongjun          2020-08-04   95  		return PTR_ERR(priv->base);
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23   96) 	}
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23   97) 
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23  @98) 	priv->version = (enum ingenic_rng_version)of_device_get_match_data(&pdev->dev);
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23   99) 
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23  100) 	priv->rng.name = pdev->name;
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23  101) 	priv->rng.init = ingenic_rng_init;
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23  102) 	priv->rng.cleanup = ingenic_rng_cleanup;
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23  103) 	priv->rng.read = ingenic_rng_read;
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23  104) 
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23  105) 	ret = hwrng_register(&priv->rng);
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23  106) 	if (ret) {
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23  107) 		dev_err(&pdev->dev, "Failed to register hwrng\n");
11a954eebc4396 Wei Yongjun          2020-08-04  108  		return ret;
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23  109) 	}
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23  110) 
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23  111) 	platform_set_drvdata(pdev, priv);
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23  112) 
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23  113) 	dev_info(&pdev->dev, "Ingenic RNG driver registered\n");
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23  114) 	return 0;
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23  115) }
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23  116) 
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23  117) static int ingenic_rng_remove(struct platform_device *pdev)
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23  118) {
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23  119) 	struct ingenic_rng *priv = platform_get_drvdata(pdev);
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23  120) 
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23  121) 	hwrng_unregister(&priv->rng);
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23  122) 
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23  123) 	writel(0, priv->base + RNG_REG_ERNG_OFFSET);
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23  124) 
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23  125) 	return 0;
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23  126) }
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23  127) 
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23 @128) static const struct of_device_id ingenic_rng_of_match[] = {
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23  129) 	{ .compatible = "ingenic,jz4780-rng", .data = (void *) ID_JZ4780 },
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23  130) 	{ .compatible = "ingenic,x1000-rng", .data = (void *) ID_X1000 },
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23  131) 	{ /* sentinel */ }
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23  132) };
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23  133) MODULE_DEVICE_TABLE(of, ingenic_rng_of_match);
190873a0ea4500 周琰杰 (Zhou Yanjie  2020-07-23  134) 

:::::: The code at line 128 was first introduced by commit
:::::: 190873a0ea4500433ae818521cad20d37f9ee059 crypto: ingenic - Add hardware RNG for Ingenic JZ4780 and X1000

:::::: TO: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
