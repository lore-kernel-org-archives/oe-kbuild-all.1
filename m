Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792452007;
	b=aP0ZO0QP0i9z9HtjMrZa73YNYNMMHwP+mo3ndMjVWy+cwHl7LO3TDkUWNJ8ef5IURqCy
	 oESxz8VAMtYd8QYq+WZlj6cLLfqQQtivbh8q+sxTeEek6rW24Yrr2zwDhPsmRFBLF17fr
	 yvNeSvQcjPpEfwnvkfeh1UjAVHdOLwt/RGvrYidfahFrM6tetnscdNAKVGZD4Y7Dr+cOO
	 Mte5QozIZlzgQSsp61xhs54jKE+urbE9L0pIdJtYMJMafGCV4Sp6yqP5Wh6ZORaNfq4JO
	 JlGs+YI1HbpjUjA2JSKp54yOB3iHXGhHkR1bwEI9Z+W1bzzyu9cLX2nHrP8pdB0ZIzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792452007;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=7Ym7uwfgYRgLhf5njj/92QqCsXRK3CIR01XorYXZn7U=;
	b=OflWBMejS9vha2q15WDPUUFmyydoBN3R8SrvmgUbOBPWX19ZeqPHbNqtk3bEIOKyh1Sh
	 pu9dtk9Lo2s+GXGzhNrFUglyWPegHjhWzfN35qfdrzA2Ge9gIfVmrygAgusSNDst7cJ2K
	 ZMgYy+J9BN5w8MQSwZITdMrl0Qcl4byG8NbCzhZ2sZOg1q3FazAl9NgxWcI15hmACnwbb
	 wic2NatBqtXUqNaV+1LWswsPr2G/U2fl93r/cr66r3B3NoFanRRxRjDWQWqFs4v04xeyK
	 fH30Y9HFF9I2+FiXZYtc+yObutM4K5tbQwTV4eAAQOkOUIuWcmI0NZ7+fSKkHJ1mylA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=X0fhK8uf;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC10D606A319
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 23:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC10D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=X0fhK8uf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792452007; x=1823988007;
  h=date:from:to:cc:subject:message-id;
  bh=588aECdop8kF6p3GxdkCDPJZieO2JeO+csILsL1ZsNA=;
  b=X0fhK8ufv7dFql2nKMLNRQhOv2zQfBafLiZWyuvoxCMgGr0Kp2dIONhV
   dPvv4p9saWJldzkrR+XV2uJ8AITvV76izfRshbes+4x7STbsBYC4Po+Ts
   LQStrphDCs3waS1jomJuYbeTj8SXNUHM9UN4JBlFEZbgytA73bqrCNlBg
   jpgpAE8mt+xtZk4cooUbTiDiy53ISHIhDlIdGvoHK+CRCzxfjvL5YzFKt
   uqQWUZM7Rx7OjXYDqWyjJAShc/izdD+OivBMqpkoCFqwimEKxv8YWPWbX
   GhfekQGsZCnZgBIrSfMaLxWkJuzRTYNWcapl85K1gOdLXLxpFbtf2upZa
   Q==;
X-CSE-ConnectionGUID: WogToRwPSK+fhLi5Zhyh4g==
X-CSE-MsgGUID: B9CQz4VIRv2Qcs67mu7HRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1160526"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1160526"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 16:20:07 -0700
X-CSE-ConnectionGUID: adpa7j1/TLigPbU40lDxCQ==
X-CSE-MsgGUID: rZWyBx0VRFKp5hnXi6Q79g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2727212"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 19 Oct 2026 16:20:05 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIweA-000000005xn-3rxB;
	Mon, 19 Oct 2026 23:20:02 +0000
Date: Tue, 20 Oct 2026 01:19:56 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10-2026-10 1/1]
 drivers/of/base.c:1786: warning: Excess function parameter 'prob' description
 in '__of_add_property'
Message-ID: <202610200109.8eqlE587-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android13-5.10-2026-10
head:   a4c2f82969bc5fa7fcc21ede4b690ece7ff72335
commit: 58ccdcc9d7208f938a13604fec07fc7e521918ae [1/1] of: base: Fix some formatting issues and provide missing descriptions
config: arm-randconfig-r2104-20261018 (https://download.01.org/0day-ci/archive/20261020/202610200109.8eqlE587-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261020/202610200109.8eqlE587-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610200109.8eqlE587-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/of/base.c:1786: warning: Function parameter or member 'prop' not described in '__of_add_property'
>> drivers/of/base.c:1786: warning: Excess function parameter 'prob' description in '__of_add_property'
   drivers/of/base.c:1809: warning: Function parameter or member 'prop' not described in 'of_add_property'
>> drivers/of/base.c:1809: warning: Excess function parameter 'prob' description in 'of_add_property'
   drivers/of/base.c:1860: warning: Function parameter or member 'prop' not described in 'of_remove_property'
>> drivers/of/base.c:1860: warning: Excess function parameter 'prob' description in 'of_remove_property'


vim +1786 drivers/of/base.c

bd69f73f2c81ee Grant Likely         2013-02-10  1779  
62664f67775fad Xiubo Li             2014-01-22  1780  /**
62664f67775fad Xiubo Li             2014-01-22  1781   * __of_add_property - Add a property to a node without lock operations
58ccdcc9d7208f Lee Jones            2021-03-18  1782   * @np:		Caller's Device Node
58ccdcc9d7208f Lee Jones            2021-03-18  1783   * @prob:	Property to add
62664f67775fad Xiubo Li             2014-01-22  1784   */
d8c50088417ebf Pantelis Antoniou    2014-07-04  1785  int __of_add_property(struct device_node *np, struct property *prop)
62664f67775fad Xiubo Li             2014-01-22 @1786  {
62664f67775fad Xiubo Li             2014-01-22  1787  	struct property **next;
62664f67775fad Xiubo Li             2014-01-22  1788  
62664f67775fad Xiubo Li             2014-01-22  1789  	prop->next = NULL;
62664f67775fad Xiubo Li             2014-01-22  1790  	next = &np->properties;
62664f67775fad Xiubo Li             2014-01-22  1791  	while (*next) {
62664f67775fad Xiubo Li             2014-01-22  1792  		if (strcmp(prop->name, (*next)->name) == 0)
62664f67775fad Xiubo Li             2014-01-22  1793  			/* duplicate ! don't insert it */
62664f67775fad Xiubo Li             2014-01-22  1794  			return -EEXIST;
62664f67775fad Xiubo Li             2014-01-22  1795  
62664f67775fad Xiubo Li             2014-01-22  1796  		next = &(*next)->next;
62664f67775fad Xiubo Li             2014-01-22  1797  	}
62664f67775fad Xiubo Li             2014-01-22  1798  	*next = prop;
62664f67775fad Xiubo Li             2014-01-22  1799  
62664f67775fad Xiubo Li             2014-01-22  1800  	return 0;
62664f67775fad Xiubo Li             2014-01-22  1801  }
62664f67775fad Xiubo Li             2014-01-22  1802  
02af11b03fce3d Grant Likely         2009-11-23  1803  /**
79d1c712958f94 Nathan Fontenot      2012-10-02  1804   * of_add_property - Add a property to a node
58ccdcc9d7208f Lee Jones            2021-03-18  1805   * @np:		Caller's Device Node
58ccdcc9d7208f Lee Jones            2021-03-18  1806   * @prob:	Property to add
02af11b03fce3d Grant Likely         2009-11-23  1807   */
79d1c712958f94 Nathan Fontenot      2012-10-02  1808  int of_add_property(struct device_node *np, struct property *prop)
02af11b03fce3d Grant Likely         2009-11-23 @1809  {
02af11b03fce3d Grant Likely         2009-11-23  1810  	unsigned long flags;
1cf3d8b3d24cd3 Nathan Fontenot      2012-10-02  1811  	int rc;
1cf3d8b3d24cd3 Nathan Fontenot      2012-10-02  1812  
8a2b22a2595bf8 Grant Likely         2014-07-23  1813  	mutex_lock(&of_mutex);
02af11b03fce3d Grant Likely         2009-11-23  1814  
d6d3c4e656513d Thomas Gleixner      2013-02-06  1815  	raw_spin_lock_irqsave(&devtree_lock, flags);
62664f67775fad Xiubo Li             2014-01-22  1816  	rc = __of_add_property(np, prop);
d6d3c4e656513d Thomas Gleixner      2013-02-06  1817  	raw_spin_unlock_irqrestore(&devtree_lock, flags);
02af11b03fce3d Grant Likely         2009-11-23  1818  
8a2b22a2595bf8 Grant Likely         2014-07-23  1819  	if (!rc)
75b57ecf9d1d1e Grant Likely         2014-02-20  1820  		__of_add_property_sysfs(np, prop);
02af11b03fce3d Grant Likely         2009-11-23  1821  
8a2b22a2595bf8 Grant Likely         2014-07-23  1822  	mutex_unlock(&of_mutex);
8a2b22a2595bf8 Grant Likely         2014-07-23  1823  
259092a35c7e11 Grant Likely         2014-07-16  1824  	if (!rc)
259092a35c7e11 Grant Likely         2014-07-16  1825  		of_property_notify(OF_RECONFIG_ADD_PROPERTY, np, prop, NULL);
259092a35c7e11 Grant Likely         2014-07-16  1826  
62664f67775fad Xiubo Li             2014-01-22  1827  	return rc;
02af11b03fce3d Grant Likely         2009-11-23  1828  }
02af11b03fce3d Grant Likely         2009-11-23  1829  
d8c50088417ebf Pantelis Antoniou    2014-07-04  1830  int __of_remove_property(struct device_node *np, struct property *prop)
d8c50088417ebf Pantelis Antoniou    2014-07-04  1831  {
d8c50088417ebf Pantelis Antoniou    2014-07-04  1832  	struct property **next;
d8c50088417ebf Pantelis Antoniou    2014-07-04  1833  
d8c50088417ebf Pantelis Antoniou    2014-07-04  1834  	for (next = &np->properties; *next; next = &(*next)->next) {
d8c50088417ebf Pantelis Antoniou    2014-07-04  1835  		if (*next == prop)
d8c50088417ebf Pantelis Antoniou    2014-07-04  1836  			break;
d8c50088417ebf Pantelis Antoniou    2014-07-04  1837  	}
d8c50088417ebf Pantelis Antoniou    2014-07-04  1838  	if (*next == NULL)
d8c50088417ebf Pantelis Antoniou    2014-07-04  1839  		return -ENODEV;
d8c50088417ebf Pantelis Antoniou    2014-07-04  1840  
d8c50088417ebf Pantelis Antoniou    2014-07-04  1841  	/* found the node */
d8c50088417ebf Pantelis Antoniou    2014-07-04  1842  	*next = prop->next;
d8c50088417ebf Pantelis Antoniou    2014-07-04  1843  	prop->next = np->deadprops;
d8c50088417ebf Pantelis Antoniou    2014-07-04  1844  	np->deadprops = prop;
d8c50088417ebf Pantelis Antoniou    2014-07-04  1845  
d8c50088417ebf Pantelis Antoniou    2014-07-04  1846  	return 0;
d8c50088417ebf Pantelis Antoniou    2014-07-04  1847  }
d8c50088417ebf Pantelis Antoniou    2014-07-04  1848  
02af11b03fce3d Grant Likely         2009-11-23  1849  /**
79d1c712958f94 Nathan Fontenot      2012-10-02  1850   * of_remove_property - Remove a property from a node.
58ccdcc9d7208f Lee Jones            2021-03-18  1851   * @np:		Caller's Device Node
58ccdcc9d7208f Lee Jones            2021-03-18  1852   * @prob:	Property to remove
02af11b03fce3d Grant Likely         2009-11-23  1853   *
02af11b03fce3d Grant Likely         2009-11-23  1854   * Note that we don't actually remove it, since we have given out
02af11b03fce3d Grant Likely         2009-11-23  1855   * who-knows-how-many pointers to the data using get-property.
02af11b03fce3d Grant Likely         2009-11-23  1856   * Instead we just move the property to the "dead properties"
02af11b03fce3d Grant Likely         2009-11-23  1857   * list, so it won't be found any more.
02af11b03fce3d Grant Likely         2009-11-23  1858   */
79d1c712958f94 Nathan Fontenot      2012-10-02  1859  int of_remove_property(struct device_node *np, struct property *prop)
02af11b03fce3d Grant Likely         2009-11-23 @1860  {
02af11b03fce3d Grant Likely         2009-11-23  1861  	unsigned long flags;
1cf3d8b3d24cd3 Nathan Fontenot      2012-10-02  1862  	int rc;
1cf3d8b3d24cd3 Nathan Fontenot      2012-10-02  1863  
201b3fe586361c Suraj Jitindar Singh 2016-04-28  1864  	if (!prop)
201b3fe586361c Suraj Jitindar Singh 2016-04-28  1865  		return -ENODEV;
201b3fe586361c Suraj Jitindar Singh 2016-04-28  1866  
8a2b22a2595bf8 Grant Likely         2014-07-23  1867  	mutex_lock(&of_mutex);
02af11b03fce3d Grant Likely         2009-11-23  1868  
d6d3c4e656513d Thomas Gleixner      2013-02-06  1869  	raw_spin_lock_irqsave(&devtree_lock, flags);
d8c50088417ebf Pantelis Antoniou    2014-07-04  1870  	rc = __of_remove_property(np, prop);
d6d3c4e656513d Thomas Gleixner      2013-02-06  1871  	raw_spin_unlock_irqrestore(&devtree_lock, flags);
02af11b03fce3d Grant Likely         2009-11-23  1872  
8a2b22a2595bf8 Grant Likely         2014-07-23  1873  	if (!rc)
8a2b22a2595bf8 Grant Likely         2014-07-23  1874  		__of_remove_property_sysfs(np, prop);
02af11b03fce3d Grant Likely         2009-11-23  1875  
8a2b22a2595bf8 Grant Likely         2014-07-23  1876  	mutex_unlock(&of_mutex);
75b57ecf9d1d1e Grant Likely         2014-02-20  1877  
259092a35c7e11 Grant Likely         2014-07-16  1878  	if (!rc)
259092a35c7e11 Grant Likely         2014-07-16  1879  		of_property_notify(OF_RECONFIG_REMOVE_PROPERTY, np, prop, NULL);
02af11b03fce3d Grant Likely         2009-11-23  1880  
8a2b22a2595bf8 Grant Likely         2014-07-23  1881  	return rc;
02af11b03fce3d Grant Likely         2009-11-23  1882  }
0f7c5317b89058 Florian Fainelli     2020-09-04  1883  EXPORT_SYMBOL_GPL(of_remove_property);
02af11b03fce3d Grant Likely         2009-11-23  1884  

:::::: The code at line 1786 was first introduced by commit
:::::: 62664f67775fad840cf6f68d6b5f428817bef6c5 of: add __of_add_property() without lock operations

:::::: TO: Xiubo Li <Li.Xiubo@freescale.com>
:::::: CC: Grant Likely <grant.likely@linaro.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
