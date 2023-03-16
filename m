Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3BB20EE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Mar 2023 07:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678951893; x=1710487893;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TRUWw9GjndfVtLpRWNHhDsStt05rfj/TslWomoKVpuE=;
  b=AS3SVcWnod7f4lbv1v4dzAZWyeOm+/HtGcLKRsZdeeCzdxPX2Qub8p1C
   IRe2DAASLx3Lj2ze8MMeQhuQ7KsoXUO4szelmkdZkadraJrZEEmQp76hW
   nvwq7i7LY7pPW363Do6JWFjSjmoTGDQzyow477rGi/kbDe0PMK5J8UOjx
   fxcXB1+NQ3YDCRBdubvfxiJPw3pQnYtWQ2+uPRDQWHHUR38Ao/r+gNJRY
   XE6/05wW0K9Qx/YbKy2vDg5lMnU8HJ4f2GXv53cQBQeY8V+LbLbDsyw6J
   ZNA0o0D+FJRhfzC3IgqzNY5VH5FCvgiU+NFyRVzJWgLNExlF2ssecXoW3
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="424185879"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="424185879"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 00:31:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="712233412"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="712233412"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 16 Mar 2023 00:31:30 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pci56-0008PS-2y;
	Thu, 16 Mar 2023 07:31:24 +0000
Date: Thu, 16 Mar 2023 15:30:30 +0800
From: kernel test robot <lkp@intel.com>
To: Yang Li <yang.lee@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: [linux-next:master 2408/3406] drivers/crypto/ccree/cc_driver.c:354:
 undefined reference to `devm_platform_get_and_ioremap_resource'
Message-ID: <202303161507.ZUkKisp2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6f72958a49f68553f2b6ff713e8c8e51a34c1e1e
commit: 0c70bc9dedd441b7dc0efc7426d2f5adbdd1b8e4 [2408/3406] crypto: ccree - Use devm_platform_get_and_ioremap_resource()
config: s390-randconfig-r016-20230312 (https://download.01.org/0day-ci/archive/20230316/202303161507.ZUkKisp2-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=0c70bc9dedd441b7dc0efc7426d2f5adbdd1b8e4
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 0c70bc9dedd441b7dc0efc7426d2f5adbdd1b8e4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303161507.ZUkKisp2-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: kernel/dma/coherent.o: in function `dma_init_coherent_memory':
   kernel/dma/coherent.c:48: undefined reference to `memremap'
   s390-linux-ld: kernel/dma/coherent.c:71: undefined reference to `memunmap'
   s390-linux-ld: kernel/dma/coherent.o: in function `_dma_release_coherent_memory':
   kernel/dma/coherent.c:82: undefined reference to `memunmap'
   s390-linux-ld: kernel/dma/coherent.c:82: undefined reference to `memunmap'
   s390-linux-ld: drivers/irqchip/irq-al-fic.o: in function `al_fic_init_dt':
   drivers/irqchip/irq-al-fic.c:252: undefined reference to `of_iomap'
   s390-linux-ld: drivers/irqchip/irq-al-fic.c:282: undefined reference to `iounmap'
   s390-linux-ld: drivers/char/xillybus/xillybus_of.o: in function `xilly_drv_probe':
   drivers/char/xillybus/xillybus_of.c:50: undefined reference to `devm_platform_ioremap_resource'
   s390-linux-ld: drivers/misc/open-dice.o: in function `open_dice_wipe':
   drivers/misc/open-dice.c:48: undefined reference to `devm_memremap'
   s390-linux-ld: drivers/misc/open-dice.c:56: undefined reference to `devm_memunmap'
   s390-linux-ld: drivers/crypto/ccree/cc_driver.o: in function `init_cc_resources':
>> drivers/crypto/ccree/cc_driver.c:354: undefined reference to `devm_platform_get_and_ioremap_resource'
   s390-linux-ld: drivers/crypto/ccree/cc_debugfs.o: in function `cc_debugfs_init':
   drivers/crypto/ccree/cc_debugfs.c:80: undefined reference to `debugfs_create_regset32'
   s390-linux-ld: drivers/crypto/ccree/cc_debugfs.c:100: undefined reference to `debugfs_create_regset32'


vim +354 drivers/crypto/ccree/cc_driver.c

   306	
   307	static int init_cc_resources(struct platform_device *plat_dev)
   308	{
   309		struct resource *req_mem_cc_regs = NULL;
   310		struct cc_drvdata *new_drvdata;
   311		struct device *dev = &plat_dev->dev;
   312		struct device_node *np = dev->of_node;
   313		u32 val, hw_rev_pidr, sig_cidr;
   314		u64 dma_mask;
   315		const struct cc_hw_data *hw_rev;
   316		struct clk *clk;
   317		int irq;
   318		int rc = 0;
   319	
   320		new_drvdata = devm_kzalloc(dev, sizeof(*new_drvdata), GFP_KERNEL);
   321		if (!new_drvdata)
   322			return -ENOMEM;
   323	
   324		hw_rev = of_device_get_match_data(dev);
   325		new_drvdata->hw_rev_name = hw_rev->name;
   326		new_drvdata->hw_rev = hw_rev->rev;
   327		new_drvdata->std_bodies = hw_rev->std_bodies;
   328	
   329		if (hw_rev->rev >= CC_HW_REV_712) {
   330			new_drvdata->axim_mon_offset = CC_REG(AXIM_MON_COMP);
   331			new_drvdata->sig_offset = CC_REG(HOST_SIGNATURE_712);
   332			new_drvdata->ver_offset = CC_REG(HOST_VERSION_712);
   333		} else {
   334			new_drvdata->axim_mon_offset = CC_REG(AXIM_MON_COMP8);
   335			new_drvdata->sig_offset = CC_REG(HOST_SIGNATURE_630);
   336			new_drvdata->ver_offset = CC_REG(HOST_VERSION_630);
   337		}
   338	
   339		new_drvdata->comp_mask = CC_COMP_IRQ_MASK;
   340	
   341		platform_set_drvdata(plat_dev, new_drvdata);
   342		new_drvdata->plat_dev = plat_dev;
   343	
   344		clk = devm_clk_get_optional(dev, NULL);
   345		if (IS_ERR(clk))
   346			return dev_err_probe(dev, PTR_ERR(clk), "Error getting clock\n");
   347		new_drvdata->clk = clk;
   348	
   349		new_drvdata->coherent = of_dma_is_coherent(np);
   350	
   351		/* Get device resources */
   352		/* First CC registers space */
   353		/* Map registers space */
 > 354		new_drvdata->cc_base = devm_platform_get_and_ioremap_resource(plat_dev,
   355									      0, &req_mem_cc_regs);
   356		if (IS_ERR(new_drvdata->cc_base))
   357			return PTR_ERR(new_drvdata->cc_base);
   358	
   359		dev_dbg(dev, "Got MEM resource (%s): %pR\n", req_mem_cc_regs->name,
   360			req_mem_cc_regs);
   361		dev_dbg(dev, "CC registers mapped from %pa to 0x%p\n",
   362			&req_mem_cc_regs->start, new_drvdata->cc_base);
   363	
   364		/* Then IRQ */
   365		irq = platform_get_irq(plat_dev, 0);
   366		if (irq < 0)
   367			return irq;
   368	
   369		init_completion(&new_drvdata->hw_queue_avail);
   370	
   371		if (!dev->dma_mask)
   372			dev->dma_mask = &dev->coherent_dma_mask;
   373	
   374		dma_mask = DMA_BIT_MASK(DMA_BIT_MASK_LEN);
   375		rc = dma_set_coherent_mask(dev, dma_mask);
   376		if (rc) {
   377			dev_err(dev, "Failed in dma_set_coherent_mask, mask=%llx\n",
   378				dma_mask);
   379			return rc;
   380		}
   381	
   382		rc = clk_prepare_enable(new_drvdata->clk);
   383		if (rc) {
   384			dev_err(dev, "Failed to enable clock");
   385			return rc;
   386		}
   387	
   388		new_drvdata->sec_disabled = cc_sec_disable;
   389	
   390		pm_runtime_set_autosuspend_delay(dev, CC_SUSPEND_TIMEOUT);
   391		pm_runtime_use_autosuspend(dev);
   392		pm_runtime_set_active(dev);
   393		pm_runtime_enable(dev);
   394		rc = pm_runtime_get_sync(dev);
   395		if (rc < 0) {
   396			dev_err(dev, "pm_runtime_get_sync() failed: %d\n", rc);
   397			goto post_pm_err;
   398		}
   399	
   400		/* Wait for Cryptocell reset completion */
   401		if (!cc_wait_for_reset_completion(new_drvdata)) {
   402			dev_err(dev, "Cryptocell reset not completed");
   403		}
   404	
   405		if (hw_rev->rev <= CC_HW_REV_712) {
   406			/* Verify correct mapping */
   407			val = cc_ioread(new_drvdata, new_drvdata->sig_offset);
   408			if (val != hw_rev->sig) {
   409				dev_err(dev, "Invalid CC signature: SIGNATURE=0x%08X != expected=0x%08X\n",
   410					val, hw_rev->sig);
   411				rc = -EINVAL;
   412				goto post_pm_err;
   413			}
   414			sig_cidr = val;
   415			hw_rev_pidr = cc_ioread(new_drvdata, new_drvdata->ver_offset);
   416		} else {
   417			/* Verify correct mapping */
   418			val = cc_read_idr(new_drvdata, pidr_0124_offsets);
   419			if (val != hw_rev->pidr_0124) {
   420				dev_err(dev, "Invalid CC PIDR: PIDR0124=0x%08X != expected=0x%08X\n",
   421					val,  hw_rev->pidr_0124);
   422				rc = -EINVAL;
   423				goto post_pm_err;
   424			}
   425			hw_rev_pidr = val;
   426	
   427			val = cc_read_idr(new_drvdata, cidr_0123_offsets);
   428			if (val != hw_rev->cidr_0123) {
   429				dev_err(dev, "Invalid CC CIDR: CIDR0123=0x%08X != expected=0x%08X\n",
   430				val,  hw_rev->cidr_0123);
   431				rc = -EINVAL;
   432				goto post_pm_err;
   433			}
   434			sig_cidr = val;
   435	
   436			/* Check HW engine configuration */
   437			val = cc_ioread(new_drvdata, CC_REG(HOST_REMOVE_INPUT_PINS));
   438			switch (val) {
   439			case CC_PINS_FULL:
   440				/* This is fine */
   441				break;
   442			case CC_PINS_SLIM:
   443				if (new_drvdata->std_bodies & CC_STD_NIST) {
   444					dev_warn(dev, "703 mode forced due to HW configuration.\n");
   445					new_drvdata->std_bodies = CC_STD_OSCCA;
   446				}
   447				break;
   448			default:
   449				dev_err(dev, "Unsupported engines configuration.\n");
   450				rc = -EINVAL;
   451				goto post_pm_err;
   452			}
   453	
   454			/* Check security disable state */
   455			val = cc_ioread(new_drvdata, CC_REG(SECURITY_DISABLED));
   456			val &= CC_SECURITY_DISABLED_MASK;
   457			new_drvdata->sec_disabled |= !!val;
   458	
   459			if (!new_drvdata->sec_disabled) {
   460				new_drvdata->comp_mask |= CC_CPP_SM4_ABORT_MASK;
   461				if (new_drvdata->std_bodies & CC_STD_NIST)
   462					new_drvdata->comp_mask |= CC_CPP_AES_ABORT_MASK;
   463			}
   464		}
   465	
   466		if (new_drvdata->sec_disabled)
   467			dev_info(dev, "Security Disabled mode is in effect. Security functions disabled.\n");
   468	
   469		/* Display HW versions */
   470		dev_info(dev, "ARM CryptoCell %s Driver: HW version 0x%08X/0x%8X, Driver version %s\n",
   471			 hw_rev->name, hw_rev_pidr, sig_cidr, DRV_MODULE_VERSION);
   472		/* register the driver isr function */
   473		rc = devm_request_irq(dev, irq, cc_isr, IRQF_SHARED, "ccree",
   474				      new_drvdata);
   475		if (rc) {
   476			dev_err(dev, "Could not register to interrupt %d\n", irq);
   477			goto post_pm_err;
   478		}
   479		dev_dbg(dev, "Registered to IRQ: %d\n", irq);
   480	
   481		init_cc_cache_params(new_drvdata);
   482	
   483		rc = init_cc_regs(new_drvdata);
   484		if (rc) {
   485			dev_err(dev, "init_cc_regs failed\n");
   486			goto post_pm_err;
   487		}
   488	
   489		rc = cc_debugfs_init(new_drvdata);
   490		if (rc) {
   491			dev_err(dev, "Failed registering debugfs interface\n");
   492			goto post_regs_err;
   493		}
   494	
   495		rc = cc_fips_init(new_drvdata);
   496		if (rc) {
   497			dev_err(dev, "cc_fips_init failed 0x%x\n", rc);
   498			goto post_debugfs_err;
   499		}
   500		rc = cc_sram_mgr_init(new_drvdata);
   501		if (rc) {
   502			dev_err(dev, "cc_sram_mgr_init failed\n");
   503			goto post_fips_init_err;
   504		}
   505	
   506		new_drvdata->mlli_sram_addr =
   507			cc_sram_alloc(new_drvdata, MAX_MLLI_BUFF_SIZE);
   508		if (new_drvdata->mlli_sram_addr == NULL_SRAM_ADDR) {
   509			rc = -ENOMEM;
   510			goto post_fips_init_err;
   511		}
   512	
   513		rc = cc_req_mgr_init(new_drvdata);
   514		if (rc) {
   515			dev_err(dev, "cc_req_mgr_init failed\n");
   516			goto post_fips_init_err;
   517		}
   518	
   519		rc = cc_buffer_mgr_init(new_drvdata);
   520		if (rc) {
   521			dev_err(dev, "cc_buffer_mgr_init failed\n");
   522			goto post_req_mgr_err;
   523		}
   524	
   525		/* hash must be allocated first due to use of send_request_init()
   526		 * and dependency of AEAD on it
   527		 */
   528		rc = cc_hash_alloc(new_drvdata);
   529		if (rc) {
   530			dev_err(dev, "cc_hash_alloc failed\n");
   531			goto post_buf_mgr_err;
   532		}
   533	
   534		/* Allocate crypto algs */
   535		rc = cc_cipher_alloc(new_drvdata);
   536		if (rc) {
   537			dev_err(dev, "cc_cipher_alloc failed\n");
   538			goto post_hash_err;
   539		}
   540	
   541		rc = cc_aead_alloc(new_drvdata);
   542		if (rc) {
   543			dev_err(dev, "cc_aead_alloc failed\n");
   544			goto post_cipher_err;
   545		}
   546	
   547		/* If we got here and FIPS mode is enabled
   548		 * it means all FIPS test passed, so let TEE
   549		 * know we're good.
   550		 */
   551		cc_set_ree_fips_status(new_drvdata, true);
   552	
   553		pm_runtime_put(dev);
   554		return 0;
   555	
   556	post_cipher_err:
   557		cc_cipher_free(new_drvdata);
   558	post_hash_err:
   559		cc_hash_free(new_drvdata);
   560	post_buf_mgr_err:
   561		 cc_buffer_mgr_fini(new_drvdata);
   562	post_req_mgr_err:
   563		cc_req_mgr_fini(new_drvdata);
   564	post_fips_init_err:
   565		cc_fips_fini(new_drvdata);
   566	post_debugfs_err:
   567		cc_debugfs_fini(new_drvdata);
   568	post_regs_err:
   569		fini_cc_regs(new_drvdata);
   570	post_pm_err:
   571		pm_runtime_put_noidle(dev);
   572		pm_runtime_disable(dev);
   573		pm_runtime_set_suspended(dev);
   574		clk_disable_unprepare(new_drvdata->clk);
   575		return rc;
   576	}
   577	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
