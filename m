Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7763020F1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jul 2023 05:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690434666; x=1721970666;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8F3eZzsZ9aWZKy0M4UsUs6GIEuI5ahC3i2ftc4snAyI=;
  b=UV+MLIOTnU8frp3lfwohkcxdeowzAdI/xL/pXDuGNiphoHZjXplYPou8
   ZNnTQRvgthCywblpyrNWJn6HZK6MffAdFh6y9fYChznJIPS8z262iD9ji
   +5X8WGeI4WPCBkzA+tXzOVqC6Yd/pDhhn3WO7g9EgxnN9fg/VzZOSuuXJ
   AIbfgkhyu0fw5lgwRnMm1iNYrdBAl23dFvgkrsGG6p+X/U0mK0Qa3vnym
   FgNDQmiy3Joc1nZtNNOU6fnbH1sYpNyKEWt42Ke7YfTgZpKbE/wgKNo/q
   1f31OCS1EKmGSsgIBN5d7h+IjKGkbnnku4opQ25cc2PLp99LEVmbN6qI5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="399144429"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; 
   d="scan'208";a="399144429"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 22:10:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="676973551"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; 
   d="scan'208";a="676973551"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 26 Jul 2023 22:10:57 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOtGx-0001x9-2q;
	Thu, 27 Jul 2023 05:10:48 +0000
Date: Thu, 27 Jul 2023 13:09:37 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 2/2] drivers/char/hw_random/amd-rng.c:167:22:
 warning: assignment to 'void *' from 'int' makes pointer from integer
 without a cast
Message-ID: <202307271309.Y9e6ZlTn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rob,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   683789ff1e1c0a9373ca20daed4bbc700eccc22e
commit: 683789ff1e1c0a9373ca20daed4bbc700eccc22e [2/2] hw_random: Enable COMPILE_TEST for more drivers
config: openrisc-randconfig-r001-20230726 (https://download.01.org/0day-ci/archive/20230727/202307271309.Y9e6ZlTn-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307271309.Y9e6ZlTn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307271309.Y9e6ZlTn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/char/hw_random/amd-rng.c: In function 'amd_rng_mod_init':
   drivers/char/hw_random/amd-rng.c:167:24: error: implicit declaration of function 'ioport_map'; did you mean 'ioremap'? [-Werror=implicit-function-declaration]
     167 |         priv->iobase = ioport_map(pmbase + PMBASE_OFFSET, PMBASE_SIZE);
         |                        ^~~~~~~~~~
         |                        ioremap
>> drivers/char/hw_random/amd-rng.c:167:22: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     167 |         priv->iobase = ioport_map(pmbase + PMBASE_OFFSET, PMBASE_SIZE);
         |                      ^
   drivers/char/hw_random/amd-rng.c:187:9: error: implicit declaration of function 'ioport_unmap' [-Werror=implicit-function-declaration]
     187 |         ioport_unmap(priv->iobase);
         |         ^~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +167 drivers/char/hw_random/amd-rng.c

96d63c0297ccfd Michael Buesch   2006-06-26  126  
f0d9ff8c8efb90 Randy Dunlap     2021-07-11  127  static int __init amd_rng_mod_init(void)
96d63c0297ccfd Michael Buesch   2006-06-26  128  {
b7c3635e56d656 Colin Ian King   2021-04-29  129  	int err;
96d63c0297ccfd Michael Buesch   2006-06-26  130  	struct pci_dev *pdev = NULL;
96d63c0297ccfd Michael Buesch   2006-06-26  131  	const struct pci_device_id *ent;
96d63c0297ccfd Michael Buesch   2006-06-26  132  	u32 pmbase;
7bad2cc062b343 Corentin LABBE   2016-08-26  133  	struct amd768_priv *priv;
96d63c0297ccfd Michael Buesch   2006-06-26  134  
96d63c0297ccfd Michael Buesch   2006-06-26  135  	for_each_pci_dev(pdev) {
96d63c0297ccfd Michael Buesch   2006-06-26  136  		ent = pci_match_id(pci_tbl, pdev);
96d63c0297ccfd Michael Buesch   2006-06-26  137  		if (ent)
96d63c0297ccfd Michael Buesch   2006-06-26  138  			goto found;
96d63c0297ccfd Michael Buesch   2006-06-26  139  	}
96d63c0297ccfd Michael Buesch   2006-06-26  140  	/* Device not found. */
7bad2cc062b343 Corentin LABBE   2016-08-26  141  	return -ENODEV;
96d63c0297ccfd Michael Buesch   2006-06-26  142  
96d63c0297ccfd Michael Buesch   2006-06-26  143  found:
96d63c0297ccfd Michael Buesch   2006-06-26  144  	err = pci_read_config_dword(pdev, 0x58, &pmbase);
96d63c0297ccfd Michael Buesch   2006-06-26  145  	if (err)
ecadb5b0111ea1 Xiongfeng Wang   2022-12-02  146  		goto put_dev;
7bad2cc062b343 Corentin LABBE   2016-08-26  147  
96d63c0297ccfd Michael Buesch   2006-06-26  148  	pmbase &= 0x0000FF00;
ecadb5b0111ea1 Xiongfeng Wang   2022-12-02  149  	if (pmbase == 0) {
ecadb5b0111ea1 Xiongfeng Wang   2022-12-02  150  		err = -EIO;
ecadb5b0111ea1 Xiongfeng Wang   2022-12-02  151  		goto put_dev;
ecadb5b0111ea1 Xiongfeng Wang   2022-12-02  152  	}
7bad2cc062b343 Corentin LABBE   2016-08-26  153  
69db7009318758 Prarit Bhargava  2017-03-14  154  	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
ecadb5b0111ea1 Xiongfeng Wang   2022-12-02  155  	if (!priv) {
ecadb5b0111ea1 Xiongfeng Wang   2022-12-02  156  		err = -ENOMEM;
ecadb5b0111ea1 Xiongfeng Wang   2022-12-02  157  		goto put_dev;
ecadb5b0111ea1 Xiongfeng Wang   2022-12-02  158  	}
7bad2cc062b343 Corentin LABBE   2016-08-26  159  
69db7009318758 Prarit Bhargava  2017-03-14  160  	if (!request_region(pmbase + PMBASE_OFFSET, PMBASE_SIZE, DRV_NAME)) {
f8169bfb4955eb Corentin LABBE   2016-08-26  161  		dev_err(&pdev->dev, DRV_NAME " region 0x%x already in use!\n",
bd68ccb390f0d9 Dmitry Baryshkov 2011-04-27  162  			pmbase + 0xF0);
69db7009318758 Prarit Bhargava  2017-03-14  163  		err = -EBUSY;
69db7009318758 Prarit Bhargava  2017-03-14  164  		goto out;
bd68ccb390f0d9 Dmitry Baryshkov 2011-04-27  165  	}
3c343a37644c5f Corentin LABBE   2016-08-26  166  
69db7009318758 Prarit Bhargava  2017-03-14 @167  	priv->iobase = ioport_map(pmbase + PMBASE_OFFSET, PMBASE_SIZE);
f7eca278a8f81e Wei Yongjun      2016-09-16  168  	if (!priv->iobase) {
3c343a37644c5f Corentin LABBE   2016-08-26  169  		pr_err(DRV_NAME "Cannot map ioport\n");
69db7009318758 Prarit Bhargava  2017-03-14  170  		err = -EINVAL;
69db7009318758 Prarit Bhargava  2017-03-14  171  		goto err_iomap;
3c343a37644c5f Corentin LABBE   2016-08-26  172  	}
3c343a37644c5f Corentin LABBE   2016-08-26  173  
7bad2cc062b343 Corentin LABBE   2016-08-26  174  	amd_rng.priv = (unsigned long)priv;
69db7009318758 Prarit Bhargava  2017-03-14  175  	priv->pmbase = pmbase;
7bad2cc062b343 Corentin LABBE   2016-08-26  176  	priv->pcidev = pdev;
96d63c0297ccfd Michael Buesch   2006-06-26  177  
f8169bfb4955eb Corentin LABBE   2016-08-26  178  	pr_info(DRV_NAME " detected\n");
69db7009318758 Prarit Bhargava  2017-03-14  179  	err = hwrng_register(&amd_rng);
69db7009318758 Prarit Bhargava  2017-03-14  180  	if (err) {
69db7009318758 Prarit Bhargava  2017-03-14  181  		pr_err(DRV_NAME " registering failed (%d)\n", err);
69db7009318758 Prarit Bhargava  2017-03-14  182  		goto err_hwrng;
69db7009318758 Prarit Bhargava  2017-03-14  183  	}
69db7009318758 Prarit Bhargava  2017-03-14  184  	return 0;
69db7009318758 Prarit Bhargava  2017-03-14  185  
69db7009318758 Prarit Bhargava  2017-03-14  186  err_hwrng:
69db7009318758 Prarit Bhargava  2017-03-14  187  	ioport_unmap(priv->iobase);
69db7009318758 Prarit Bhargava  2017-03-14  188  err_iomap:
69db7009318758 Prarit Bhargava  2017-03-14  189  	release_region(pmbase + PMBASE_OFFSET, PMBASE_SIZE);
69db7009318758 Prarit Bhargava  2017-03-14  190  out:
69db7009318758 Prarit Bhargava  2017-03-14  191  	kfree(priv);
ecadb5b0111ea1 Xiongfeng Wang   2022-12-02  192  put_dev:
ecadb5b0111ea1 Xiongfeng Wang   2022-12-02  193  	pci_dev_put(pdev);
69db7009318758 Prarit Bhargava  2017-03-14  194  	return err;
96d63c0297ccfd Michael Buesch   2006-06-26  195  }
96d63c0297ccfd Michael Buesch   2006-06-26  196  

:::::: The code at line 167 was first introduced by commit
:::::: 69db7009318758769d625b023402161c750f7876 hwrng: amd - Revert managed API changes

:::::: TO: Prarit Bhargava <prarit@redhat.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
