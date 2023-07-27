Received: from mgamail.intel.com (unknown [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8485107AD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jul 2023 10:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690452114; x=1721988114;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GSwoOHjGcSzX++B/4r0MUXhTICLXAA3CQBDWHlkJaoU=;
  b=H9WJkp7EWT28Dwc6OLJKg5gHK/9F/tZgcP5fX/FaDCR8etqic6fiYGDS
   TDXrlEVL+2FA6DFj+VDo3HsHRltM4a62jql3oaB8mBNsihHh3VuJYQ2IB
   Ub3+oNOweXr790BaOOI49NeLqlmHPjQNJTc9YJR7v7ykMYj1+toErCMei
   AddPMj1NjDG3AYRSPG7HKc6UEC5rF+U6K7nU7Nv4dACeeGEmKuXWK/ELl
   ZT1ZrjieX5xIQqZhXi+s3L/0kgYjUWz2xjAmx/kHs+2k4AGWDBrTNpdgW
   taectMT3N0AKLflElfvd2IiWZNZ007cSLCbCL7ms+UpNlNMIE6vdpDQvA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="368285303"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="368285303"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 03:01:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="792304720"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="792304720"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 27 Jul 2023 03:01:52 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOxoE-00029v-1G;
	Thu, 27 Jul 2023 10:01:35 +0000
Date: Thu, 27 Jul 2023 18:01:10 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 2/2] drivers/char/hw_random/cavium-rng.c:42:9:
 error: implicit declaration of function 'writeq'; did you mean 'writeb'?
Message-ID: <202307271705.fEfXE6Ic-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rob,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   683789ff1e1c0a9373ca20daed4bbc700eccc22e
commit: 683789ff1e1c0a9373ca20daed4bbc700eccc22e [2/2] hw_random: Enable COMPILE_TEST for more drivers
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230727/202307271705.fEfXE6Ic-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307271705.fEfXE6Ic-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307271705.fEfXE6Ic-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/char/hw_random/cavium-rng.c: In function 'cavium_rng_probe':
>> drivers/char/hw_random/cavium-rng.c:42:9: error: implicit declaration of function 'writeq'; did you mean 'writeb'? [-Werror=implicit-function-declaration]
      42 |         writeq(THUNDERX_RNM_RNG_EN | THUNDERX_RNM_ENT_EN,
         |         ^~~~~~
         |         writeb
   cc1: some warnings being treated as errors
--
   drivers/char/hw_random/cavium-rng-vf.c: In function 'is_octeontx':
>> drivers/char/hw_random/cavium-rng-vf.c:41:13: error: implicit declaration of function 'midr_is_cpu_model_range' [-Werror=implicit-function-declaration]
      41 |         if (midr_is_cpu_model_range(read_cpuid_id(), MIDR_THUNDERX_83XX,
         |             ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/char/hw_random/cavium-rng-vf.c:41:37: error: implicit declaration of function 'read_cpuid_id' [-Werror=implicit-function-declaration]
      41 |         if (midr_is_cpu_model_range(read_cpuid_id(), MIDR_THUNDERX_83XX,
         |                                     ^~~~~~~~~~~~~
>> drivers/char/hw_random/cavium-rng-vf.c:41:54: error: 'MIDR_THUNDERX_83XX' undeclared (first use in this function)
      41 |         if (midr_is_cpu_model_range(read_cpuid_id(), MIDR_THUNDERX_83XX,
         |                                                      ^~~~~~~~~~~~~~~~~~
   drivers/char/hw_random/cavium-rng-vf.c:41:54: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/char/hw_random/cavium-rng-vf.c:42:37: error: implicit declaration of function 'MIDR_CPU_VAR_REV' [-Werror=implicit-function-declaration]
      42 |                                     MIDR_CPU_VAR_REV(0, 0),
         |                                     ^~~~~~~~~~~~~~~~
>> drivers/char/hw_random/cavium-rng-vf.c:44:54: error: 'MIDR_THUNDERX_81XX' undeclared (first use in this function)
      44 |             midr_is_cpu_model_range(read_cpuid_id(), MIDR_THUNDERX_81XX,
         |                                                      ^~~~~~~~~~~~~~~~~~
>> drivers/char/hw_random/cavium-rng-vf.c:47:54: error: 'MIDR_THUNDERX' undeclared (first use in this function)
      47 |             midr_is_cpu_model_range(read_cpuid_id(), MIDR_THUNDERX,
         |                                                      ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +42 drivers/char/hw_random/cavium-rng.c

cc2f1908c6b8f62 Omer Khaliq 2016-08-23  21  
cc2f1908c6b8f62 Omer Khaliq 2016-08-23  22  /* Enable the RNG hardware and activate the VF */
cc2f1908c6b8f62 Omer Khaliq 2016-08-23  23  static int cavium_rng_probe(struct pci_dev *pdev,
cc2f1908c6b8f62 Omer Khaliq 2016-08-23  24  			const struct pci_device_id *id)
cc2f1908c6b8f62 Omer Khaliq 2016-08-23  25  {
cc2f1908c6b8f62 Omer Khaliq 2016-08-23  26  	struct	cavium_rng_pf *rng;
cc2f1908c6b8f62 Omer Khaliq 2016-08-23  27  	int	iov_err;
cc2f1908c6b8f62 Omer Khaliq 2016-08-23  28  
cc2f1908c6b8f62 Omer Khaliq 2016-08-23  29  	rng = devm_kzalloc(&pdev->dev, sizeof(*rng), GFP_KERNEL);
cc2f1908c6b8f62 Omer Khaliq 2016-08-23  30  	if (!rng)
cc2f1908c6b8f62 Omer Khaliq 2016-08-23  31  		return -ENOMEM;
cc2f1908c6b8f62 Omer Khaliq 2016-08-23  32  
cc2f1908c6b8f62 Omer Khaliq 2016-08-23  33  	/*Map the RNG control */
cc2f1908c6b8f62 Omer Khaliq 2016-08-23  34  	rng->control_status = pcim_iomap(pdev, 0, 0);
cc2f1908c6b8f62 Omer Khaliq 2016-08-23  35  	if (!rng->control_status) {
cc2f1908c6b8f62 Omer Khaliq 2016-08-23  36  		dev_err(&pdev->dev,
cc2f1908c6b8f62 Omer Khaliq 2016-08-23  37  			"Error iomap failed retrieving control_status.\n");
cc2f1908c6b8f62 Omer Khaliq 2016-08-23  38  		return -ENOMEM;
cc2f1908c6b8f62 Omer Khaliq 2016-08-23  39  	}
cc2f1908c6b8f62 Omer Khaliq 2016-08-23  40  
cc2f1908c6b8f62 Omer Khaliq 2016-08-23  41  	/* Enable the RNG hardware and entropy source */
cc2f1908c6b8f62 Omer Khaliq 2016-08-23 @42  	writeq(THUNDERX_RNM_RNG_EN | THUNDERX_RNM_ENT_EN,
cc2f1908c6b8f62 Omer Khaliq 2016-08-23  43  		rng->control_status);
cc2f1908c6b8f62 Omer Khaliq 2016-08-23  44  
cc2f1908c6b8f62 Omer Khaliq 2016-08-23  45  	pci_set_drvdata(pdev, rng);
cc2f1908c6b8f62 Omer Khaliq 2016-08-23  46  
cc2f1908c6b8f62 Omer Khaliq 2016-08-23  47  	/* Enable the Cavium RNG as a VF */
cc2f1908c6b8f62 Omer Khaliq 2016-08-23  48  	iov_err = pci_enable_sriov(pdev, 1);
cc2f1908c6b8f62 Omer Khaliq 2016-08-23  49  	if (iov_err != 0) {
cc2f1908c6b8f62 Omer Khaliq 2016-08-23  50  		/* Disable the RNG hardware and entropy source */
cc2f1908c6b8f62 Omer Khaliq 2016-08-23  51  		writeq(0, rng->control_status);
cc2f1908c6b8f62 Omer Khaliq 2016-08-23  52  		dev_err(&pdev->dev,
cc2f1908c6b8f62 Omer Khaliq 2016-08-23  53  			"Error initializing RNG virtual function,(%i).\n",
cc2f1908c6b8f62 Omer Khaliq 2016-08-23  54  			iov_err);
cc2f1908c6b8f62 Omer Khaliq 2016-08-23  55  		return iov_err;
cc2f1908c6b8f62 Omer Khaliq 2016-08-23  56  	}
cc2f1908c6b8f62 Omer Khaliq 2016-08-23  57  
cc2f1908c6b8f62 Omer Khaliq 2016-08-23  58  	return 0;
cc2f1908c6b8f62 Omer Khaliq 2016-08-23  59  }
cc2f1908c6b8f62 Omer Khaliq 2016-08-23  60  

:::::: The code at line 42 was first introduced by commit
:::::: cc2f1908c6b8f6257b7da9124ce6d859c13cba3b hwrng: cavium - Add Cavium HWRNG driver for ThunderX SoC.

:::::: TO: Omer Khaliq <okhaliq@caviumnetworks.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
