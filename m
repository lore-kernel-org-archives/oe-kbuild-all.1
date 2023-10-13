Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456452903
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 05:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D1W9VoJz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697173326; x=1728709326;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WrilpWBGSO9MrWtk67+JDGb1Fr1wFEN0mhT2rL8II9s=;
  b=D1W9VoJzaN87r+6vZCq2EqnK29X0xUz0IXqYAxVANGIVQeL6KK0IvAPs
   jif/N6JLkHWc518aPMM8qiPiMVitsP5rU2Bxd5ZIWQ2WAL48pcsbg4uRJ
   hzY1dwpABClUYJrgEedVTKBJMzGfVD8XvyJjXEHfyKS54/+fDgMefxJEy
   3TqGVV0IA0JF2TMR49gBESCP+AvbDqGT+Aupn98zjMAxAFTCBwWtXJwuo
   subuv4D9FtzYZBx9ZzP6y7U20o9qOthhoAPEQkR1ew6ze+gH6lZ0NHIrp
   pUfbsGwJExWy5Pvqke4Om4K0DgFGjFM7B926ywlgBPhemY4Jf5MuG/3cU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="6662789"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="6662789"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 22:02:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="878396713"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="878396713"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 12 Oct 2023 22:02:00 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrAJB-0004Ld-1s;
	Fri, 13 Oct 2023 05:01:57 +0000
Date: Fri, 13 Oct 2023 13:01:52 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 14581/30000]
 sound/soc/codecs/pcm512x.c:1558:14: warning: unused variable 'clk_name'
Message-ID: <202310131303.mmxSoHtO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Adrian,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: a452c44357d9c68c27c39327e50b41e4b6cffe8d [14581/30000] MLK-25015: sound: soc: codecs: pcm512x: set input sclk
config: parisc-randconfig-002-20231013 (https://download.01.org/0day-ci/archive/20231013/202310131303.mmxSoHtO-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310131303.mmxSoHtO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310131303.mmxSoHtO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/parisc/include/asm/io.h:6,
                    from include/linux/io.h:13,
                    from include/linux/irq.h:20,
                    from arch/parisc/include/asm/hardirq.h:13,
                    from include/linux/hardirq.h:9,
                    from include/linux/interrupt.h:11,
                    from include/sound/soc.h:18,
                    from sound/soc/codecs/pcm512x.c:18:
   include/asm-generic/pgtable.h: In function 'pte_clear_not_present_full':
   arch/parisc/include/asm/pgtable.h:91:23: warning: variable 'old_pte' set but not used [-Wunused-but-set-variable]
      91 |                 pte_t old_pte;                                  \
         |                       ^~~~~~~
   arch/parisc/include/asm/pgtable.h:316:34: note: in expansion of macro 'set_pte_at'
     316 | #define pte_clear(mm, addr, xp)  set_pte_at(mm, addr, xp, __pte(0))
         |                                  ^~~~~~~~~~
   include/asm-generic/pgtable.h:201:9: note: in expansion of macro 'pte_clear'
     201 |         pte_clear(mm, address, ptep);
         |         ^~~~~~~~~
   include/asm-generic/pgtable.h: In function '__ptep_modify_prot_commit':
   arch/parisc/include/asm/pgtable.h:91:23: warning: variable 'old_pte' set but not used [-Wunused-but-set-variable]
      91 |                 pte_t old_pte;                                  \
         |                       ^~~~~~~
   include/asm-generic/pgtable.h:629:9: note: in expansion of macro 'set_pte_at'
     629 |         set_pte_at(vma->vm_mm, addr, ptep, pte);
         |         ^~~~~~~~~~
   sound/soc/codecs/pcm512x.c: In function 'pcm512x_probe':
>> sound/soc/codecs/pcm512x.c:1558:14: warning: unused variable 'clk_name' [-Wunused-variable]
    1558 |         char clk_name[8];
         |              ^~~~~~~~


vim +/clk_name +1558 sound/soc/codecs/pcm512x.c

  1554	
  1555	int pcm512x_probe(struct device *dev, struct regmap *regmap)
  1556	{
  1557		struct pcm512x_priv *pcm512x;
> 1558		char clk_name[8];
  1559		int i, ret;
  1560	
  1561		pcm512x = devm_kzalloc(dev, sizeof(struct pcm512x_priv), GFP_KERNEL);
  1562		if (!pcm512x)
  1563			return -ENOMEM;
  1564	
  1565		mutex_init(&pcm512x->mutex);
  1566	
  1567		dev_set_drvdata(dev, pcm512x);
  1568		pcm512x->regmap = regmap;
  1569	
  1570		for (i = 0; i < ARRAY_SIZE(pcm512x->supplies); i++)
  1571			pcm512x->supplies[i].supply = pcm512x_supply_names[i];
  1572	
  1573		ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(pcm512x->supplies),
  1574					      pcm512x->supplies);
  1575		if (ret != 0) {
  1576			dev_err(dev, "Failed to get supplies: %d\n", ret);
  1577			return ret;
  1578		}
  1579	
  1580		pcm512x->supply_nb[0].notifier_call = pcm512x_regulator_event_0;
  1581		pcm512x->supply_nb[1].notifier_call = pcm512x_regulator_event_1;
  1582		pcm512x->supply_nb[2].notifier_call = pcm512x_regulator_event_2;
  1583	
  1584		for (i = 0; i < ARRAY_SIZE(pcm512x->supplies); i++) {
  1585			ret = devm_regulator_register_notifier(
  1586							pcm512x->supplies[i].consumer,
  1587							&pcm512x->supply_nb[i]);
  1588			if (ret != 0) {
  1589				dev_err(dev,
  1590					"Failed to register regulator notifier: %d\n",
  1591					ret);
  1592			}
  1593		}
  1594	
  1595		ret = regulator_bulk_enable(ARRAY_SIZE(pcm512x->supplies),
  1596					    pcm512x->supplies);
  1597		if (ret != 0) {
  1598			dev_err(dev, "Failed to enable supplies: %d\n", ret);
  1599			return ret;
  1600		}
  1601	
  1602		/* Reset the device, verifying I/O in the process for I2C */
  1603		ret = regmap_write(regmap, PCM512x_RESET,
  1604				   PCM512x_RSTM | PCM512x_RSTR);
  1605		if (ret != 0) {
  1606			dev_err(dev, "Failed to reset device: %d\n", ret);
  1607			goto err;
  1608		}
  1609	
  1610		ret = regmap_write(regmap, PCM512x_RESET, 0);
  1611		if (ret != 0) {
  1612			dev_err(dev, "Failed to reset device: %d\n", ret);
  1613			goto err;
  1614		}
  1615	
  1616		/* default to first sclk */
  1617		pcm512x->num_clocks = 1;
  1618		pcm512x->sclk_src = PCM512x_SYSCLK_MCLK1;
  1619	
  1620		pcm512x->sclk[0] = devm_clk_get(dev, NULL);
  1621		if (PTR_ERR(pcm512x->sclk[0]) == -EPROBE_DEFER) {
  1622			ret = -EPROBE_DEFER;
  1623			goto err;
  1624		}
  1625	
  1626		if (!IS_ERR(pcm512x->sclk[0])) {
  1627			ret = clk_prepare_enable(pcm512x->sclk[0]);
  1628			if (ret != 0) {
  1629				dev_err(dev, "Failed to enable SCLK: %d\n", ret);
  1630				goto err;
  1631			}
  1632		}
  1633	
  1634		/* Default to standby mode */
  1635		ret = regmap_update_bits(pcm512x->regmap, PCM512x_POWER,
  1636					 PCM512x_RQST, PCM512x_RQST);
  1637		if (ret != 0) {
  1638			dev_err(dev, "Failed to request standby: %d\n",
  1639				ret);
  1640			goto err_clk;
  1641		}
  1642	
  1643		pm_runtime_set_active(dev);
  1644		pm_runtime_enable(dev);
  1645		pm_runtime_idle(dev);
  1646	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
