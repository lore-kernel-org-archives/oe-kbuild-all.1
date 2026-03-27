Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C2D32694E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Mar 2026 18:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774636685; cv=none; b=jlyzl3fN3WYrTRJH1HRNl9D5c9yg1999nR7151Hvp+kfJLoksJ8tv4XO4Dj1omfsZgo2HiZU2S83PCZt+gZaGwH1urofL6MQilT4jANyH9Et4dR7yG0KZy9FDTseQTb+fHRCFND5fztuwjbP6xJjr+dMrJKT5/hjUgpLErnJIcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774636685; c=relaxed/simple;
	bh=+Sf8BrIrmA7OzXVWax667BnF8tNmepZpNB+fUl4ffdw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BoABFIaEvc2OIwW0avXGTfBrxEICrvpCsaIAfqz30DlD44Th8FtFMtNiQ4ZnXE9k8EQDY4gbRY45GudlnKoauvd3t8xkDbMKTFSZFO772/z2NnoHnbqtzElmG3EHz9NTfy/quxhGpxOBk98qQeeJR4O28iBsXltrzp9kDbrR0oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c4W2vCTb; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c4W2vCTb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774636684; x=1806172684;
  h=date:from:to:cc:subject:message-id;
  bh=+Sf8BrIrmA7OzXVWax667BnF8tNmepZpNB+fUl4ffdw=;
  b=c4W2vCTbh0r2nsF3zYYYmmneyWj+XhK431GjypB11nQCIgBVv0Qv6O6y
   tu6Pe1qb4RjlT36M7MVmpQjcfuFsuEowVRqQH5xZVY9Bx1eglcXYUuHv3
   vontkjlzeHRLQWGihgetRiZYjmTJPmoKUD8AoMkfSEO7doZOwa8n7m47Z
   lgmvarx6DdA57ZATIcU0xStB2sgeaJOA2UYuLXEjsa00PV/KdWBglchpg
   69hVZJO71EN0Ifbx4DrwG4miFLrWY0Pj6SztOeXBqmcBtoXfnAcTiLjrY
   iQau+hlgm2aymC9vBQQjBkmpy/oxLFYI7XvUKzcnwlbu4NVpzEwIydjYo
   g==;
X-CSE-ConnectionGUID: mQckPzKtQsuDgDcKpwlEng==
X-CSE-MsgGUID: YDZ2j/9XQTmbA9nMmSSuXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="74747346"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="74747346"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 11:38:03 -0700
X-CSE-ConnectionGUID: oIwMui5fRweNdvI93fi0WA==
X-CSE-MsgGUID: AMk26QLKSV6UYTkLG6AkuA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 27 Mar 2026 11:38:02 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6C4F-00000000AbV-2Ssd;
	Fri, 27 Mar 2026 18:37:59 +0000
Date: Sat, 28 Mar 2026 02:37:49 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-03-27 99/106]
 sound/soc/codecs/max98088.c:1433 max98088_setup_eq1() warn: inconsistent
 indenting
Message-ID: <202603280226.FbbINgDV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-03-27
head:   b547ff73a13ed8ce92e8e208ccd27884077b160b
commit: 879b75696a5873f14bab3b278b787629fdb3f010 [99/106] don't use snd_soc_component_get_drvdata()
config: hexagon-randconfig-r073-20260327 (https://download.01.org/0day-ci/archive/20260328/202603280226.FbbINgDV-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603280226.FbbINgDV-lkp@intel.com/

New smatch warnings:
sound/soc/codecs/max98088.c:1433 max98088_setup_eq1() warn: inconsistent indenting
sound/soc/codecs/max98088.c:1481 max98088_setup_eq2() warn: inconsistent indenting
sound/soc/codecs/max98088.c:1580 max98088_handle_eq_pdata() warn: inconsistent indenting
sound/soc/codecs/max98088.c:1641 max98088_handle_pdata() warn: inconsistent indenting
sound/soc/codecs/max98088.c:1674 max98088_probe() warn: inconsistent indenting
sound/soc/codecs/max98088.c:1735 max98088_remove() warn: inconsistent indenting

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
sound/soc/codecs/max98088.c:1536 max98088_put_eq_enum() warn: inconsistent indenting

vim +1433 sound/soc/codecs/max98088.c

  1429	
  1430	static void max98088_setup_eq1(struct snd_soc_component *component)
  1431	{
  1432		struct device *dev = snd_soc_component_to_dev(component);
> 1433	       struct max98088_priv *max98088 = dev_get_drvdata(dev);
  1434	       struct max98088_pdata *pdata = max98088->pdata;
  1435	       struct max98088_eq_cfg *coef_set;
  1436	       int best, best_val, save, i, sel, fs;
  1437	       struct max98088_cdata *cdata;
  1438	
  1439	       cdata = &max98088->dai[0];
  1440	
  1441	       if (!pdata || !max98088->eq_textcnt)
  1442	               return;
  1443	
  1444	       /* Find the selected configuration with nearest sample rate */
  1445	       fs = cdata->rate;
  1446	       sel = cdata->eq_sel;
  1447	
  1448	       best = 0;
  1449	       best_val = INT_MAX;
  1450	       for (i = 0; i < pdata->eq_cfgcnt; i++) {
  1451	               if (strcmp(pdata->eq_cfg[i].name, max98088->eq_texts[sel]) == 0 &&
  1452	                   abs(pdata->eq_cfg[i].rate - fs) < best_val) {
  1453	                       best = i;
  1454	                       best_val = abs(pdata->eq_cfg[i].rate - fs);
  1455	               }
  1456	       }
  1457	
  1458	       dev_dbg(dev, "Selected %s/%dHz for %dHz sample rate\n",
  1459	               pdata->eq_cfg[best].name,
  1460	               pdata->eq_cfg[best].rate, fs);
  1461	
  1462	       /* Disable EQ while configuring, and save current on/off state */
  1463	       save = snd_soc_component_read(component, M98088_REG_49_CFG_LEVEL);
  1464	       snd_soc_component_update_bits(component, M98088_REG_49_CFG_LEVEL, M98088_EQ1EN, 0);
  1465	
  1466	       coef_set = &pdata->eq_cfg[sel];
  1467	
  1468	       m98088_eq_band(component, 0, 0, coef_set->band1);
  1469	       m98088_eq_band(component, 0, 1, coef_set->band2);
  1470	       m98088_eq_band(component, 0, 2, coef_set->band3);
  1471	       m98088_eq_band(component, 0, 3, coef_set->band4);
  1472	       m98088_eq_band(component, 0, 4, coef_set->band5);
  1473	
  1474	       /* Restore the original on/off state */
  1475	       snd_soc_component_update_bits(component, M98088_REG_49_CFG_LEVEL, M98088_EQ1EN, save);
  1476	}
  1477	
  1478	static void max98088_setup_eq2(struct snd_soc_component *component)
  1479	{
  1480		struct device *dev = snd_soc_component_to_dev(component);
> 1481	       struct max98088_priv *max98088 = dev_get_drvdata(dev);
  1482	       struct max98088_pdata *pdata = max98088->pdata;
  1483	       struct max98088_eq_cfg *coef_set;
  1484	       int best, best_val, save, i, sel, fs;
  1485	       struct max98088_cdata *cdata;
  1486	
  1487	       cdata = &max98088->dai[1];
  1488	
  1489	       if (!pdata || !max98088->eq_textcnt)
  1490	               return;
  1491	
  1492	       /* Find the selected configuration with nearest sample rate */
  1493	       fs = cdata->rate;
  1494	
  1495	       sel = cdata->eq_sel;
  1496	       best = 0;
  1497	       best_val = INT_MAX;
  1498	       for (i = 0; i < pdata->eq_cfgcnt; i++) {
  1499	               if (strcmp(pdata->eq_cfg[i].name, max98088->eq_texts[sel]) == 0 &&
  1500	                   abs(pdata->eq_cfg[i].rate - fs) < best_val) {
  1501	                       best = i;
  1502	                       best_val = abs(pdata->eq_cfg[i].rate - fs);
  1503	               }
  1504	       }
  1505	
  1506	       dev_dbg(dev, "Selected %s/%dHz for %dHz sample rate\n",
  1507	               pdata->eq_cfg[best].name,
  1508	               pdata->eq_cfg[best].rate, fs);
  1509	
  1510	       /* Disable EQ while configuring, and save current on/off state */
  1511	       save = snd_soc_component_read(component, M98088_REG_49_CFG_LEVEL);
  1512	       snd_soc_component_update_bits(component, M98088_REG_49_CFG_LEVEL, M98088_EQ2EN, 0);
  1513	
  1514	       coef_set = &pdata->eq_cfg[sel];
  1515	
  1516	       m98088_eq_band(component, 1, 0, coef_set->band1);
  1517	       m98088_eq_band(component, 1, 1, coef_set->band2);
  1518	       m98088_eq_band(component, 1, 2, coef_set->band3);
  1519	       m98088_eq_band(component, 1, 3, coef_set->band4);
  1520	       m98088_eq_band(component, 1, 4, coef_set->band5);
  1521	
  1522	       /* Restore the original on/off state */
  1523	       snd_soc_component_update_bits(component, M98088_REG_49_CFG_LEVEL, M98088_EQ2EN,
  1524	               save);
  1525	}
  1526	
  1527	static int max98088_put_eq_enum(struct snd_kcontrol *kcontrol,
  1528	                                struct snd_ctl_elem_value *ucontrol)
  1529	{
  1530	       struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
  1531	       struct device *dev = snd_soc_component_to_dev(component);
  1532	       struct max98088_priv *max98088 = dev_get_drvdata(dev);
  1533	       struct max98088_pdata *pdata = max98088->pdata;
  1534	       int channel = max98088_get_channel(component, kcontrol->id.name);
  1535	       struct max98088_cdata *cdata;
  1536		int sel = ucontrol->value.enumerated.item[0];
  1537	
  1538	       if (channel < 0)
  1539		       return channel;
  1540	
  1541	       cdata = &max98088->dai[channel];
  1542	
  1543	       if (sel >= pdata->eq_cfgcnt)
  1544	               return -EINVAL;
  1545	
  1546	       cdata->eq_sel = sel;
  1547	
  1548	       switch (channel) {
  1549	       case 0:
  1550	               max98088_setup_eq1(component);
  1551	               break;
  1552	       case 1:
  1553	               max98088_setup_eq2(component);
  1554	               break;
  1555	       }
  1556	
  1557	       return 0;
  1558	}
  1559	
  1560	static int max98088_get_eq_enum(struct snd_kcontrol *kcontrol,
  1561	                                struct snd_ctl_elem_value *ucontrol)
  1562	{
  1563	       struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
  1564	       struct device *dev = snd_soc_component_to_dev(component);
  1565	       struct max98088_priv *max98088 = dev_get_drvdata(dev);
  1566	       int channel = max98088_get_channel(component, kcontrol->id.name);
  1567	       struct max98088_cdata *cdata;
  1568	
  1569	       if (channel < 0)
  1570		       return channel;
  1571	
  1572	       cdata = &max98088->dai[channel];
  1573	       ucontrol->value.enumerated.item[0] = cdata->eq_sel;
  1574	       return 0;
  1575	}
  1576	
  1577	static void max98088_handle_eq_pdata(struct snd_soc_component *component)
  1578	{
  1579		struct device *dev = snd_soc_component_to_dev(component);
> 1580	       struct max98088_priv *max98088 = dev_get_drvdata(dev);
  1581	       struct max98088_pdata *pdata = max98088->pdata;
  1582	       struct max98088_eq_cfg *cfg;
  1583	       unsigned int cfgcnt;
  1584	       int i, j;
  1585	       const char **t;
  1586	       int ret;
  1587	       struct snd_kcontrol_new controls[] = {
  1588	               SOC_ENUM_EXT((char *)eq_mode_name[0],
  1589	                       max98088->eq_enum,
  1590	                       max98088_get_eq_enum,
  1591	                       max98088_put_eq_enum),
  1592	               SOC_ENUM_EXT((char *)eq_mode_name[1],
  1593	                       max98088->eq_enum,
  1594	                       max98088_get_eq_enum,
  1595	                       max98088_put_eq_enum),
  1596	       };
  1597	       BUILD_BUG_ON(ARRAY_SIZE(controls) != ARRAY_SIZE(eq_mode_name));
  1598	
  1599	       cfg = pdata->eq_cfg;
  1600	       cfgcnt = pdata->eq_cfgcnt;
  1601	
  1602	       /* Setup an array of texts for the equalizer enum.
  1603	        * This is based on Mark Brown's equalizer driver code.
  1604	        */
  1605	       max98088->eq_textcnt = 0;
  1606	       max98088->eq_texts = NULL;
  1607	       for (i = 0; i < cfgcnt; i++) {
  1608	               for (j = 0; j < max98088->eq_textcnt; j++) {
  1609	                       if (strcmp(cfg[i].name, max98088->eq_texts[j]) == 0)
  1610	                               break;
  1611	               }
  1612	
  1613	               if (j != max98088->eq_textcnt)
  1614	                       continue;
  1615	
  1616	               /* Expand the array */
  1617	               t = krealloc(max98088->eq_texts,
  1618	                            sizeof(char *) * (max98088->eq_textcnt + 1),
  1619	                            GFP_KERNEL);
  1620	               if (t == NULL)
  1621	                       continue;
  1622	
  1623	               /* Store the new entry */
  1624	               t[max98088->eq_textcnt] = cfg[i].name;
  1625	               max98088->eq_textcnt++;
  1626	               max98088->eq_texts = t;
  1627	       }
  1628	
  1629	       /* Now point the soc_enum to .texts array items */
  1630	       max98088->eq_enum.texts = max98088->eq_texts;
  1631	       max98088->eq_enum.items = max98088->eq_textcnt;
  1632	
  1633	       ret = snd_soc_component_add_controls(component, controls, ARRAY_SIZE(controls));
  1634	       if (ret != 0)
  1635	               dev_err(component->dev, "Failed to add EQ control: %d\n", ret);
  1636	}
  1637	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
