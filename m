Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09E22B56F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 18:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692730367; x=1724266367;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8M+kuekdz6w6bjwpAXlCsLiFXDMLLzRGSqjp/UZTpoQ=;
  b=l2xXjTuXxBYgqfAqYjpUnQT9DT5ExvGoS15/z+sPaPbEfJvuuZHKnZH1
   mWhiBuHod/snRuDG0DekGA2UJhq8DGdI2YSo9MRZ5OERjsyipGCapE6LB
   ppZ389zf+han0jkgyI58gsLttRG33vT0zhaExlXq3M0fCwM14Ix0AekKN
   kdaLxlX3Rm4vGAgQ5KP5RLIH0Jmm3zU+e5YshodTNYRdbKNC4tSEBhkPs
   ndFKziEq7Nx5dYhkyOWg+vLLPYzgfYvcOFCUIH3T54OSceGrAcK6xxmM/
   g1920DUHFKKn8X3BBs7YCoLX+a5YO/yl0my1B1UEOdycqOwfx1Kfkn7W2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="373941940"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="373941940"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 11:52:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="860049107"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="860049107"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 22 Aug 2023 11:52:32 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYWUN-0000S3-1g;
	Tue, 22 Aug 2023 18:52:28 +0000
Date: Wed, 23 Aug 2023 02:51:36 +0800
From: kernel test robot <lkp@intel.com>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 11594/11761]
 drivers/crypto/intel/qat/qat_common/adf_isr.c:197:47: warning: '%d'
 directive output may be truncated writing between 1 and 11 bytes into a
 region of size between 0 and 5
Message-ID: <202308230251.2EhAALdZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   28c736b0e92e11bfe2b9997688213dc43cb22182
commit: cafcef8bc67c4ee5a26e641166fd97b74bc0200b [11594/11761] Merge branch 'loongarch-next' of git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git
config: loongarch-randconfig-r021-20230823 (https://download.01.org/0day-ci/archive/20230823/202308230251.2EhAALdZ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308230251.2EhAALdZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308230251.2EhAALdZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/crypto/intel/qat/qat_common/adf_isr.c: In function 'adf_request_irqs':
>> drivers/crypto/intel/qat/qat_common/adf_isr.c:197:47: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size between 0 and 5 [-Wformat-truncation=]
     197 |                                  "qat%d-bundle%d", accel_dev->accel_id, i);
         |                                               ^~
   drivers/crypto/intel/qat/qat_common/adf_isr.c:197:34: note: directive argument in the range [-2147483643, 255]
     197 |                                  "qat%d-bundle%d", accel_dev->accel_id, i);
         |                                  ^~~~~~~~~~~~~~~~
   drivers/crypto/intel/qat/qat_common/adf_isr.c:196:25: note: 'snprintf' output between 13 and 33 bytes into a destination of size 16
     196 |                         snprintf(name, ADF_MAX_MSIX_VECTOR_NAME,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     197 |                                  "qat%d-bundle%d", accel_dev->accel_id, i);
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +197 drivers/crypto/intel/qat/qat_common/adf_isr.c

70fead3adb4eea drivers/crypto/qat/qat_common/adf_isr.c   Wojciech Ziemba  2021-09-01  178  
7afa232e76ced9 drivers/crypto/qat/qat_dh895xcc/adf_isr.c Tadeusz Struk    2014-06-05  179  static int adf_request_irqs(struct adf_accel_dev *accel_dev)
7afa232e76ced9 drivers/crypto/qat/qat_dh895xcc/adf_isr.c Tadeusz Struk    2014-06-05  180  {
7afa232e76ced9 drivers/crypto/qat/qat_dh895xcc/adf_isr.c Tadeusz Struk    2014-06-05  181  	struct adf_accel_pci *pci_dev_info = &accel_dev->accel_pci_dev;
7afa232e76ced9 drivers/crypto/qat/qat_dh895xcc/adf_isr.c Tadeusz Struk    2014-06-05  182  	struct adf_hw_device_data *hw_data = accel_dev->hw_device;
9832fdc917de0f drivers/crypto/qat/qat_common/adf_isr.c   Maksim Lukoshkov 2021-09-01  183  	struct adf_irq *irqs = pci_dev_info->msix_entries.irqs;
7afa232e76ced9 drivers/crypto/qat/qat_dh895xcc/adf_isr.c Tadeusz Struk    2014-06-05  184  	struct adf_etr_data *etr_data = accel_dev->transport;
ba79a32acfde1f drivers/crypto/qat/qat_common/adf_isr.c   Wojciech Ziemba  2021-09-01  185  	int clust_irq = hw_data->num_banks;
ba79a32acfde1f drivers/crypto/qat/qat_common/adf_isr.c   Wojciech Ziemba  2021-09-01  186  	int ret, irq, i = 0;
7afa232e76ced9 drivers/crypto/qat/qat_dh895xcc/adf_isr.c Tadeusz Struk    2014-06-05  187  	char *name;
7afa232e76ced9 drivers/crypto/qat/qat_dh895xcc/adf_isr.c Tadeusz Struk    2014-06-05  188  
ed8ccaef52fa03 drivers/crypto/qat/qat_dh895xcc/adf_isr.c Tadeusz Struk    2015-08-07  189  	/* Request msix irq for all banks unless SR-IOV enabled */
ed8ccaef52fa03 drivers/crypto/qat/qat_dh895xcc/adf_isr.c Tadeusz Struk    2015-08-07  190  	if (!accel_dev->pf.vf_info) {
7afa232e76ced9 drivers/crypto/qat/qat_dh895xcc/adf_isr.c Tadeusz Struk    2014-06-05  191  		for (i = 0; i < hw_data->num_banks; i++) {
7afa232e76ced9 drivers/crypto/qat/qat_dh895xcc/adf_isr.c Tadeusz Struk    2014-06-05  192  			struct adf_etr_bank_data *bank = &etr_data->banks[i];
7afa232e76ced9 drivers/crypto/qat/qat_dh895xcc/adf_isr.c Tadeusz Struk    2014-06-05  193  			unsigned int cpu, cpus = num_online_cpus();
7afa232e76ced9 drivers/crypto/qat/qat_dh895xcc/adf_isr.c Tadeusz Struk    2014-06-05  194  
9832fdc917de0f drivers/crypto/qat/qat_common/adf_isr.c   Maksim Lukoshkov 2021-09-01  195  			name = irqs[i].name;
7afa232e76ced9 drivers/crypto/qat/qat_dh895xcc/adf_isr.c Tadeusz Struk    2014-06-05  196  			snprintf(name, ADF_MAX_MSIX_VECTOR_NAME,
7afa232e76ced9 drivers/crypto/qat/qat_dh895xcc/adf_isr.c Tadeusz Struk    2014-06-05 @197  				 "qat%d-bundle%d", accel_dev->accel_id, i);
ba79a32acfde1f drivers/crypto/qat/qat_common/adf_isr.c   Wojciech Ziemba  2021-09-01  198  			irq = pci_irq_vector(pci_dev_info->pci_dev, i);
ba79a32acfde1f drivers/crypto/qat/qat_common/adf_isr.c   Wojciech Ziemba  2021-09-01  199  			if (unlikely(irq < 0)) {
ba79a32acfde1f drivers/crypto/qat/qat_common/adf_isr.c   Wojciech Ziemba  2021-09-01  200  				dev_err(&GET_DEV(accel_dev),
ba79a32acfde1f drivers/crypto/qat/qat_common/adf_isr.c   Wojciech Ziemba  2021-09-01  201  					"Failed to get IRQ number of device vector %d - %s\n",
ba79a32acfde1f drivers/crypto/qat/qat_common/adf_isr.c   Wojciech Ziemba  2021-09-01  202  					i, name);
70fead3adb4eea drivers/crypto/qat/qat_common/adf_isr.c   Wojciech Ziemba  2021-09-01  203  				ret = irq;
70fead3adb4eea drivers/crypto/qat/qat_common/adf_isr.c   Wojciech Ziemba  2021-09-01  204  				goto err;
ba79a32acfde1f drivers/crypto/qat/qat_common/adf_isr.c   Wojciech Ziemba  2021-09-01  205  			}
ba79a32acfde1f drivers/crypto/qat/qat_common/adf_isr.c   Wojciech Ziemba  2021-09-01  206  			ret = request_irq(irq, adf_msix_isr_bundle, 0,
ba79a32acfde1f drivers/crypto/qat/qat_common/adf_isr.c   Wojciech Ziemba  2021-09-01  207  					  &name[0], bank);
7afa232e76ced9 drivers/crypto/qat/qat_dh895xcc/adf_isr.c Tadeusz Struk    2014-06-05  208  			if (ret) {
665503049bada5 drivers/crypto/qat/qat_dh895xcc/adf_isr.c Allan, Bruce W   2015-03-19  209  				dev_err(&GET_DEV(accel_dev),
ba79a32acfde1f drivers/crypto/qat/qat_common/adf_isr.c   Wojciech Ziemba  2021-09-01  210  					"Failed to allocate IRQ %d for %s\n",
ba79a32acfde1f drivers/crypto/qat/qat_common/adf_isr.c   Wojciech Ziemba  2021-09-01  211  					irq, name);
70fead3adb4eea drivers/crypto/qat/qat_common/adf_isr.c   Wojciech Ziemba  2021-09-01  212  				goto err;
7afa232e76ced9 drivers/crypto/qat/qat_dh895xcc/adf_isr.c Tadeusz Struk    2014-06-05  213  			}
7afa232e76ced9 drivers/crypto/qat/qat_dh895xcc/adf_isr.c Tadeusz Struk    2014-06-05  214  
ed8ccaef52fa03 drivers/crypto/qat/qat_dh895xcc/adf_isr.c Tadeusz Struk    2015-08-07  215  			cpu = ((accel_dev->accel_id * hw_data->num_banks) +
ed8ccaef52fa03 drivers/crypto/qat/qat_dh895xcc/adf_isr.c Tadeusz Struk    2015-08-07  216  			       i) % cpus;
ba79a32acfde1f drivers/crypto/qat/qat_common/adf_isr.c   Wojciech Ziemba  2021-09-01  217  			irq_set_affinity_hint(irq, get_cpu_mask(cpu));
9832fdc917de0f drivers/crypto/qat/qat_common/adf_isr.c   Maksim Lukoshkov 2021-09-01  218  			irqs[i].enabled = true;
ed8ccaef52fa03 drivers/crypto/qat/qat_dh895xcc/adf_isr.c Tadeusz Struk    2015-08-07  219  		}
7afa232e76ced9 drivers/crypto/qat/qat_dh895xcc/adf_isr.c Tadeusz Struk    2014-06-05  220  	}
7afa232e76ced9 drivers/crypto/qat/qat_dh895xcc/adf_isr.c Tadeusz Struk    2014-06-05  221  
7afa232e76ced9 drivers/crypto/qat/qat_dh895xcc/adf_isr.c Tadeusz Struk    2014-06-05  222  	/* Request msix irq for AE */
9832fdc917de0f drivers/crypto/qat/qat_common/adf_isr.c   Maksim Lukoshkov 2021-09-01  223  	name = irqs[i].name;
7afa232e76ced9 drivers/crypto/qat/qat_dh895xcc/adf_isr.c Tadeusz Struk    2014-06-05  224  	snprintf(name, ADF_MAX_MSIX_VECTOR_NAME,
7afa232e76ced9 drivers/crypto/qat/qat_dh895xcc/adf_isr.c Tadeusz Struk    2014-06-05  225  		 "qat%d-ae-cluster", accel_dev->accel_id);
ba79a32acfde1f drivers/crypto/qat/qat_common/adf_isr.c   Wojciech Ziemba  2021-09-01  226  	irq = pci_irq_vector(pci_dev_info->pci_dev, clust_irq);
ba79a32acfde1f drivers/crypto/qat/qat_common/adf_isr.c   Wojciech Ziemba  2021-09-01  227  	if (unlikely(irq < 0)) {
ba79a32acfde1f drivers/crypto/qat/qat_common/adf_isr.c   Wojciech Ziemba  2021-09-01  228  		dev_err(&GET_DEV(accel_dev),
ba79a32acfde1f drivers/crypto/qat/qat_common/adf_isr.c   Wojciech Ziemba  2021-09-01  229  			"Failed to get IRQ number of device vector %d - %s\n",
ba79a32acfde1f drivers/crypto/qat/qat_common/adf_isr.c   Wojciech Ziemba  2021-09-01  230  			i, name);
70fead3adb4eea drivers/crypto/qat/qat_common/adf_isr.c   Wojciech Ziemba  2021-09-01  231  		ret = irq;
70fead3adb4eea drivers/crypto/qat/qat_common/adf_isr.c   Wojciech Ziemba  2021-09-01  232  		goto err;
ba79a32acfde1f drivers/crypto/qat/qat_common/adf_isr.c   Wojciech Ziemba  2021-09-01  233  	}
ba79a32acfde1f drivers/crypto/qat/qat_common/adf_isr.c   Wojciech Ziemba  2021-09-01  234  	ret = request_irq(irq, adf_msix_isr_ae, 0, &name[0], accel_dev);
7afa232e76ced9 drivers/crypto/qat/qat_dh895xcc/adf_isr.c Tadeusz Struk    2014-06-05  235  	if (ret) {
665503049bada5 drivers/crypto/qat/qat_dh895xcc/adf_isr.c Allan, Bruce W   2015-03-19  236  		dev_err(&GET_DEV(accel_dev),
ba79a32acfde1f drivers/crypto/qat/qat_common/adf_isr.c   Wojciech Ziemba  2021-09-01  237  			"Failed to allocate IRQ %d for %s\n", irq, name);
70fead3adb4eea drivers/crypto/qat/qat_common/adf_isr.c   Wojciech Ziemba  2021-09-01  238  		goto err;
7afa232e76ced9 drivers/crypto/qat/qat_dh895xcc/adf_isr.c Tadeusz Struk    2014-06-05  239  	}
9832fdc917de0f drivers/crypto/qat/qat_common/adf_isr.c   Maksim Lukoshkov 2021-09-01  240  	irqs[i].enabled = true;
7afa232e76ced9 drivers/crypto/qat/qat_dh895xcc/adf_isr.c Tadeusz Struk    2014-06-05  241  	return ret;
70fead3adb4eea drivers/crypto/qat/qat_common/adf_isr.c   Wojciech Ziemba  2021-09-01  242  err:
70fead3adb4eea drivers/crypto/qat/qat_common/adf_isr.c   Wojciech Ziemba  2021-09-01  243  	adf_free_irqs(accel_dev);
70fead3adb4eea drivers/crypto/qat/qat_common/adf_isr.c   Wojciech Ziemba  2021-09-01  244  	return ret;
9832fdc917de0f drivers/crypto/qat/qat_common/adf_isr.c   Maksim Lukoshkov 2021-09-01  245  }
7afa232e76ced9 drivers/crypto/qat/qat_dh895xcc/adf_isr.c Tadeusz Struk    2014-06-05  246  

:::::: The code at line 197 was first introduced by commit
:::::: 7afa232e76ced910a191a3f6669d8f48bcb46b3e crypto: qat - Intel(R) QAT DH895xcc accelerator

:::::: TO: Tadeusz Struk <tadeusz.struk@intel.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
