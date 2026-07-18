Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A209931326F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 13:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784380094; cv=none; b=lXLfwVbjboTJIvskLg5CRg8VvStbPWrgbm95rxYmwltegXDls+fesRIlwu2rDjAUDfuRS6RkAySIm7jsecfcpjSyBlRANILfncQNUiw65KlQJir/r7CHdf+DCWHgGr5Paa2WJ3r1i7PtWvRmFTdYcnzW3lPBnycJCCCWqMht5aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784380094; c=relaxed/simple;
	bh=jUTKU99LNu127R51lNjcZssxeyCa9XXEjXs0geCmBXM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QKwqQ8ExU69VwRm2DvV1mRY0/a7Uq6EM8277VIDfaTFWcXIhx/FTBS6kBk86mIekPFzOO9BNzHCw1b5w6zyJ9IzRbo+k+AInce79nRoVyltg1aL00DGtAawm8ZrR3Gb3dbmwVMal8eo30iJViIYaz+lE1pAqQbVtDnLuIbLE35w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eps5QAE6; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eps5QAE6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784380093; x=1815916093;
  h=date:from:to:cc:subject:message-id;
  bh=jUTKU99LNu127R51lNjcZssxeyCa9XXEjXs0geCmBXM=;
  b=Eps5QAE6fB19+Lh60ilolSEUULIFZAcOf09O/H05yGHKH4es/aEKaCRm
   A3MerFkvMkxEnSE4z70addhXqsEVOnjeuB0cugXd+Y9X/zLc1PudV0xIk
   ceuYZqUrNKtbinbW9mIafV2diP5bJvyny4A3l5xMTUSB2fi6WbsuseCdS
   /mP1CyUBuKzgvFB9OhiWe5CjNO0xz6FlOTQ393r8LKAIjiQBRduUjPr++
   oD485/MfBpxqgSrCDJHb1wRQyvJkq8x6/oC487FKwBzdEMRLIw4C8uOSX
   qK2tiyX5EsV9XF4jaB2WPfMrCbhMA+V2EmYMdXsIax3MtrgOBU6NYSYgA
   Q==;
X-CSE-ConnectionGUID: zAxiYDwzTM2cViwthH76oA==
X-CSE-MsgGUID: jcvxSJEwQ+itixAGKTJK1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="96538648"
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="96538648"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 06:08:10 -0700
X-CSE-ConnectionGUID: r/sGYJzmTqKKXG5XXAwBEQ==
X-CSE-MsgGUID: 1vnA964ITKW4kA+uD8fdSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="261992433"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 18 Jul 2026 06:08:08 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wl4ly-00000000Umn-219p;
	Sat, 18 Jul 2026 13:08:06 +0000
Date: Sat, 18 Jul 2026 21:07:17 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-07-17-2 301/301]
 sound/soc/codecs/max98088.c:1434 max98088_setup_eq1() warn: inconsistent
 indenting
Message-ID: <202607182013.DwiU3hSD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-07-17-2
head:   0031be0dff2c86cbb204c3d1bb5ee9797cb9cb53
commit: 0c857e9649f4f24d4bded34db298d59905f59971 [301/301] dai
config: i386-randconfig-141 (https://download.01.org/0day-ci/archive/20260718/202607182013.DwiU3hSD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607182013.DwiU3hSD-lkp@intel.com/

New smatch warnings:
sound/soc/codecs/max98088.c:1434 max98088_setup_eq1() warn: inconsistent indenting
sound/soc/codecs/max98088.c:1482 max98088_setup_eq2() warn: inconsistent indenting
sound/soc/codecs/max98088.c:1581 max98088_handle_eq_pdata() warn: inconsistent indenting
sound/soc/codecs/max98088.c:1642 max98088_handle_pdata() warn: inconsistent indenting
sound/soc/codecs/max98088.c:1675 max98088_probe() warn: inconsistent indenting
sound/soc/codecs/max98088.c:1736 max98088_remove() warn: inconsistent indenting

Old smatch warnings:
sound/soc/codecs/max98088.c:657 max98088_line_pga() warn: inconsistent indenting
sound/soc/codecs/max98088.c:1026 max98088_dai2_hw_params() warn: inconsistent indenting
sound/soc/codecs/max98088.c:1096 max98088_dai_set_sysclk() warn: inconsistent indenting
sound/soc/codecs/max98088.c:1100 max98088_dai_set_sysclk() warn: inconsistent indenting
sound/soc/codecs/max98088.c:1112 max98088_dai_set_sysclk() warn: inconsistent indenting
sound/soc/codecs/max98088.c:1141 max98088_dai1_set_fmt() warn: inconsistent indenting
sound/soc/codecs/max98088.c:1212 max98088_dai2_set_fmt() warn: inconsistent indenting
sound/soc/codecs/max98088.c:1279 max98088_dai1_mute() warn: inconsistent indenting
sound/soc/codecs/max98088.c:1295 max98088_dai2_mute() warn: inconsistent indenting
sound/soc/codecs/max98088.c:1537 max98088_put_eq_enum() warn: inconsistent indenting

vim +1434 sound/soc/codecs/max98088.c

  1430	
  1431	static void max98088_setup_eq1(struct snd_soc_component *component)
  1432	{
  1433		struct device *dev = snd_soc_component_to_dev(component);
> 1434	       struct max98088_priv *max98088 = dev_get_drvdata(dev);
  1435	       struct max98088_pdata *pdata = max98088->pdata;
  1436	       struct max98088_eq_cfg *coef_set;
  1437	       int best, best_val, save, i, sel, fs;
  1438	       struct max98088_cdata *cdata;
  1439	
  1440	       cdata = &max98088->dai[0];
  1441	
  1442	       if (!pdata || !max98088->eq_textcnt)
  1443	               return;
  1444	
  1445	       /* Find the selected configuration with nearest sample rate */
  1446	       fs = cdata->rate;
  1447	       sel = cdata->eq_sel;
  1448	
  1449	       best = 0;
  1450	       best_val = INT_MAX;
  1451	       for (i = 0; i < pdata->eq_cfgcnt; i++) {
  1452	               if (strcmp(pdata->eq_cfg[i].name, max98088->eq_texts[sel]) == 0 &&
  1453	                   abs(pdata->eq_cfg[i].rate - fs) < best_val) {
  1454	                       best = i;
  1455	                       best_val = abs(pdata->eq_cfg[i].rate - fs);
  1456	               }
  1457	       }
  1458	
  1459	       dev_dbg(dev, "Selected %s/%dHz for %dHz sample rate\n",
  1460	               pdata->eq_cfg[best].name,
  1461	               pdata->eq_cfg[best].rate, fs);
  1462	
  1463	       /* Disable EQ while configuring, and save current on/off state */
  1464	       save = snd_soc_component_read(component, M98088_REG_49_CFG_LEVEL);
  1465	       snd_soc_component_update_bits(component, M98088_REG_49_CFG_LEVEL, M98088_EQ1EN, 0);
  1466	
  1467	       coef_set = &pdata->eq_cfg[sel];
  1468	
  1469	       m98088_eq_band(component, 0, 0, coef_set->band1);
  1470	       m98088_eq_band(component, 0, 1, coef_set->band2);
  1471	       m98088_eq_band(component, 0, 2, coef_set->band3);
  1472	       m98088_eq_band(component, 0, 3, coef_set->band4);
  1473	       m98088_eq_band(component, 0, 4, coef_set->band5);
  1474	
  1475	       /* Restore the original on/off state */
  1476	       snd_soc_component_update_bits(component, M98088_REG_49_CFG_LEVEL, M98088_EQ1EN, save);
  1477	}
  1478	
  1479	static void max98088_setup_eq2(struct snd_soc_component *component)
  1480	{
  1481		struct device *dev = snd_soc_component_to_dev(component);
> 1482	       struct max98088_priv *max98088 = dev_get_drvdata(dev);
  1483	       struct max98088_pdata *pdata = max98088->pdata;
  1484	       struct max98088_eq_cfg *coef_set;
  1485	       int best, best_val, save, i, sel, fs;
  1486	       struct max98088_cdata *cdata;
  1487	
  1488	       cdata = &max98088->dai[1];
  1489	
  1490	       if (!pdata || !max98088->eq_textcnt)
  1491	               return;
  1492	
  1493	       /* Find the selected configuration with nearest sample rate */
  1494	       fs = cdata->rate;
  1495	
  1496	       sel = cdata->eq_sel;
  1497	       best = 0;
  1498	       best_val = INT_MAX;
  1499	       for (i = 0; i < pdata->eq_cfgcnt; i++) {
  1500	               if (strcmp(pdata->eq_cfg[i].name, max98088->eq_texts[sel]) == 0 &&
  1501	                   abs(pdata->eq_cfg[i].rate - fs) < best_val) {
  1502	                       best = i;
  1503	                       best_val = abs(pdata->eq_cfg[i].rate - fs);
  1504	               }
  1505	       }
  1506	
  1507	       dev_dbg(dev, "Selected %s/%dHz for %dHz sample rate\n",
  1508	               pdata->eq_cfg[best].name,
  1509	               pdata->eq_cfg[best].rate, fs);
  1510	
  1511	       /* Disable EQ while configuring, and save current on/off state */
  1512	       save = snd_soc_component_read(component, M98088_REG_49_CFG_LEVEL);
  1513	       snd_soc_component_update_bits(component, M98088_REG_49_CFG_LEVEL, M98088_EQ2EN, 0);
  1514	
  1515	       coef_set = &pdata->eq_cfg[sel];
  1516	
  1517	       m98088_eq_band(component, 1, 0, coef_set->band1);
  1518	       m98088_eq_band(component, 1, 1, coef_set->band2);
  1519	       m98088_eq_band(component, 1, 2, coef_set->band3);
  1520	       m98088_eq_band(component, 1, 3, coef_set->band4);
  1521	       m98088_eq_band(component, 1, 4, coef_set->band5);
  1522	
  1523	       /* Restore the original on/off state */
  1524	       snd_soc_component_update_bits(component, M98088_REG_49_CFG_LEVEL, M98088_EQ2EN,
  1525	               save);
  1526	}
  1527	
  1528	static int max98088_put_eq_enum(struct snd_kcontrol *kcontrol,
  1529	                                struct snd_ctl_elem_value *ucontrol)
  1530	{
  1531	       struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
  1532	       struct device *dev = snd_soc_component_to_dev(component);
  1533	       struct max98088_priv *max98088 = dev_get_drvdata(dev);
  1534	       struct max98088_pdata *pdata = max98088->pdata;
  1535	       int channel = max98088_get_channel(component, kcontrol->id.name);
  1536	       struct max98088_cdata *cdata;
  1537		int sel = ucontrol->value.enumerated.item[0];
  1538	
  1539	       if (channel < 0)
  1540		       return channel;
  1541	
  1542	       cdata = &max98088->dai[channel];
  1543	
  1544	       if (sel >= pdata->eq_cfgcnt)
  1545	               return -EINVAL;
  1546	
  1547	       cdata->eq_sel = sel;
  1548	
  1549	       switch (channel) {
  1550	       case 0:
  1551	               max98088_setup_eq1(component);
  1552	               break;
  1553	       case 1:
  1554	               max98088_setup_eq2(component);
  1555	               break;
  1556	       }
  1557	
  1558	       return 0;
  1559	}
  1560	
  1561	static int max98088_get_eq_enum(struct snd_kcontrol *kcontrol,
  1562	                                struct snd_ctl_elem_value *ucontrol)
  1563	{
  1564	       struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
  1565	       struct device *dev = snd_soc_component_to_dev(component);
  1566	       struct max98088_priv *max98088 = dev_get_drvdata(dev);
  1567	       int channel = max98088_get_channel(component, kcontrol->id.name);
  1568	       struct max98088_cdata *cdata;
  1569	
  1570	       if (channel < 0)
  1571		       return channel;
  1572	
  1573	       cdata = &max98088->dai[channel];
  1574	       ucontrol->value.enumerated.item[0] = cdata->eq_sel;
  1575	       return 0;
  1576	}
  1577	
  1578	static void max98088_handle_eq_pdata(struct snd_soc_component *component)
  1579	{
  1580		struct device *dev = snd_soc_component_to_dev(component);
> 1581	       struct max98088_priv *max98088 = dev_get_drvdata(dev);
  1582	       struct max98088_pdata *pdata = max98088->pdata;
  1583	       struct max98088_eq_cfg *cfg;
  1584	       unsigned int cfgcnt;
  1585	       int i, j;
  1586	       const char **t;
  1587	       int ret;
  1588	       struct snd_kcontrol_new controls[] = {
  1589	               SOC_ENUM_EXT((char *)eq_mode_name[0],
  1590	                       max98088->eq_enum,
  1591	                       max98088_get_eq_enum,
  1592	                       max98088_put_eq_enum),
  1593	               SOC_ENUM_EXT((char *)eq_mode_name[1],
  1594	                       max98088->eq_enum,
  1595	                       max98088_get_eq_enum,
  1596	                       max98088_put_eq_enum),
  1597	       };
  1598	       BUILD_BUG_ON(ARRAY_SIZE(controls) != ARRAY_SIZE(eq_mode_name));
  1599	
  1600	       cfg = pdata->eq_cfg;
  1601	       cfgcnt = pdata->eq_cfgcnt;
  1602	
  1603	       /* Setup an array of texts for the equalizer enum.
  1604	        * This is based on Mark Brown's equalizer driver code.
  1605	        */
  1606	       max98088->eq_textcnt = 0;
  1607	       max98088->eq_texts = NULL;
  1608	       for (i = 0; i < cfgcnt; i++) {
  1609	               for (j = 0; j < max98088->eq_textcnt; j++) {
  1610	                       if (strcmp(cfg[i].name, max98088->eq_texts[j]) == 0)
  1611	                               break;
  1612	               }
  1613	
  1614	               if (j != max98088->eq_textcnt)
  1615	                       continue;
  1616	
  1617	               /* Expand the array */
  1618	               t = krealloc(max98088->eq_texts,
  1619	                            sizeof(char *) * (max98088->eq_textcnt + 1),
  1620	                            GFP_KERNEL);
  1621	               if (t == NULL)
  1622	                       continue;
  1623	
  1624	               /* Store the new entry */
  1625	               t[max98088->eq_textcnt] = cfg[i].name;
  1626	               max98088->eq_textcnt++;
  1627	               max98088->eq_texts = t;
  1628	       }
  1629	
  1630	       /* Now point the soc_enum to .texts array items */
  1631	       max98088->eq_enum.texts = max98088->eq_texts;
  1632	       max98088->eq_enum.items = max98088->eq_textcnt;
  1633	
  1634	       ret = snd_soc_component_add_controls(component, controls, ARRAY_SIZE(controls));
  1635	       if (ret != 0)
  1636	               dev_err(dev, "Failed to add EQ control: %d\n", ret);
  1637	}
  1638	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
