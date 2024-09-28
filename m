Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6F827442
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 05:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727502605; cv=none; b=PfNGSFVI++cyAdARYehwpi8QZ4omWfaGaG4GvJHeJxQzJkcQsxusAGG+fDiE/Y6EX8n932rn5cEnNuPB2GZMl9wQIPLkG5ofv1O4XYjlKUMqE7amKa6tqPS6YaFpUgbVtL3oHc/WHP8VZSVVDtFZcOl41ZPq1K2Z3YWrMqmWI7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727502605; c=relaxed/simple;
	bh=UoIfqpCFSpDxfsYAUDL+7/63r0ZQMiBvbNayfrvWl2E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TkPMtXkyQzQI4D9NYSo8BvWXRWiESd746msTwDUPdssQK/CkBOggHh21/EwJgIn4re+kggiXZ9Z143q0ZioCl9JdeQO4i0jWGZ6y6yOQ8cLFjwL7IXhzZL8QBZZ+qywf9Fnqtan17wur6Zy6j3G31ielJAJIj7BRPLLmCud6GPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vjs5uPsC; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vjs5uPsC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727502603; x=1759038603;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UoIfqpCFSpDxfsYAUDL+7/63r0ZQMiBvbNayfrvWl2E=;
  b=Vjs5uPsCqCB4m7yKE2vU992zDkbJ5gPD51cViodMuSY/uzdvvzzfdEBj
   D5UHmBpAWnMZGmoEvyfkgMx+oDBBnAX7VY8YgkJvP0cJVrentxp/Ka2ZO
   /Ru7zHav6jq3jUCkFAaHsBHeKTFHTQfkwPCrKtfPJMrYYYmIzLWmYME+7
   fjodBj0KBqX5Jk9A0pz/bTOyS9gZADCLXfIY+nt72WE6MKicUS29Wtcar
   qHnw7gkEJQPG8Dvlr7wep7+awkLSC6gGDA9+HfwvR0Drb0aDv+i1mBiC4
   qeK+hsK04g9LKYUsRAYLA4+5wT8GHFBrLiuGWd7GafQuvW35UWAudq6LP
   A==;
X-CSE-ConnectionGUID: 3dSEHTRXQ8q8O9tk0zTR1A==
X-CSE-MsgGUID: kbHvMue7S4CU5UeF8Wr14Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="29532716"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="29532716"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 22:50:02 -0700
X-CSE-ConnectionGUID: UKk8q0m6T5ytmGGrP2JFWg==
X-CSE-MsgGUID: 7FY9OHb1T3anab91AwSXNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="77527463"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 27 Sep 2024 22:50:01 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suQL8-000MxL-1y;
	Sat, 28 Sep 2024 05:49:58 +0000
Date: Sat, 28 Sep 2024 13:49:44 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 14521/30000]
 drivers/gpu/drm/loongson/lsdc_i2c.c:180:23: sparse: sparse: incorrect type
 in assignment (different address spaces)
Message-ID: <202409281308.P52A5s6n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   bef6f06e039b8929481350d15d6d8c3ba81c6fd2
commit: 028c67cca3dd40a78c0f025f2b8562343dcb2741 [14521/30000] LoongArch: fix compile error when using make allmodconfig
config: arm64-randconfig-r131-20240925 (https://download.01.org/0day-ci/archive/20240928/202409281308.P52A5s6n-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240928/202409281308.P52A5s6n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409281308.P52A5s6n-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/loongson/lsdc_i2c.c:180:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *dir_reg @@     got void * @@
   drivers/gpu/drm/loongson/lsdc_i2c.c:180:23: sparse:     expected void [noderef] __iomem *dir_reg
   drivers/gpu/drm/loongson/lsdc_i2c.c:180:23: sparse:     got void *
>> drivers/gpu/drm/loongson/lsdc_i2c.c:181:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *dat_reg @@     got void * @@
   drivers/gpu/drm/loongson/lsdc_i2c.c:181:23: sparse:     expected void [noderef] __iomem *dat_reg
   drivers/gpu/drm/loongson/lsdc_i2c.c:181:23: sparse:     got void *
   drivers/gpu/drm/loongson/lsdc_i2c.c:253:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *dir_reg @@     got void * @@
   drivers/gpu/drm/loongson/lsdc_i2c.c:253:23: sparse:     expected void [noderef] __iomem *dir_reg
   drivers/gpu/drm/loongson/lsdc_i2c.c:253:23: sparse:     got void *
   drivers/gpu/drm/loongson/lsdc_i2c.c:254:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *dat_reg @@     got void * @@
   drivers/gpu/drm/loongson/lsdc_i2c.c:254:23: sparse:     expected void [noderef] __iomem *dat_reg
   drivers/gpu/drm/loongson/lsdc_i2c.c:254:23: sparse:     got void *

vim +180 drivers/gpu/drm/loongson/lsdc_i2c.c

80764bc784413e Huacai Chen 2018-05-22  130  
80764bc784413e Huacai Chen 2018-05-22  131  struct lsdc_i2c *lsdc_of_create_i2c_adapter(struct device *parent,
80764bc784413e Huacai Chen 2018-05-22  132  					    void *reg_base,
80764bc784413e Huacai Chen 2018-05-22  133  					    struct device_node *i2c_np)
80764bc784413e Huacai Chen 2018-05-22  134  {
80764bc784413e Huacai Chen 2018-05-22  135  	unsigned int udelay = 5;
80764bc784413e Huacai Chen 2018-05-22  136  	unsigned int timeout = 2200;
80764bc784413e Huacai Chen 2018-05-22  137  	int nr = -1;
80764bc784413e Huacai Chen 2018-05-22  138  	struct i2c_adapter *adapter;
80764bc784413e Huacai Chen 2018-05-22  139  	struct lsdc_i2c *li2c;
80764bc784413e Huacai Chen 2018-05-22  140  	u32 sda, scl;
80764bc784413e Huacai Chen 2018-05-22  141  	int ret;
80764bc784413e Huacai Chen 2018-05-22  142  
80764bc784413e Huacai Chen 2018-05-22  143  	li2c = kzalloc(sizeof(*li2c), GFP_KERNEL);
80764bc784413e Huacai Chen 2018-05-22  144  	if (!li2c)
80764bc784413e Huacai Chen 2018-05-22  145  		return ERR_PTR(-ENOMEM);
80764bc784413e Huacai Chen 2018-05-22  146  
80764bc784413e Huacai Chen 2018-05-22  147  	spin_lock_init(&li2c->reglock);
80764bc784413e Huacai Chen 2018-05-22  148  
80764bc784413e Huacai Chen 2018-05-22  149  	ret = of_property_read_u32(i2c_np, "loongson,sda", &sda);
80764bc784413e Huacai Chen 2018-05-22  150  	if (ret) {
80764bc784413e Huacai Chen 2018-05-22  151  		dev_err(parent, "No sda pin number provided\n");
80764bc784413e Huacai Chen 2018-05-22  152  		return ERR_PTR(ret);
80764bc784413e Huacai Chen 2018-05-22  153  	}
80764bc784413e Huacai Chen 2018-05-22  154  
80764bc784413e Huacai Chen 2018-05-22  155  	ret = of_property_read_u32(i2c_np, "loongson,scl", &scl);
80764bc784413e Huacai Chen 2018-05-22  156  	if (ret) {
80764bc784413e Huacai Chen 2018-05-22  157  		dev_err(parent, "No scl pin number provided\n");
80764bc784413e Huacai Chen 2018-05-22  158  		return ERR_PTR(ret);
80764bc784413e Huacai Chen 2018-05-22  159  	}
80764bc784413e Huacai Chen 2018-05-22  160  
80764bc784413e Huacai Chen 2018-05-22  161  	ret = of_property_read_u32(i2c_np, "loongson,nr", &nr);
80764bc784413e Huacai Chen 2018-05-22  162  	if (ret) {
80764bc784413e Huacai Chen 2018-05-22  163  		int id;
80764bc784413e Huacai Chen 2018-05-22  164  
80764bc784413e Huacai Chen 2018-05-22  165  		if (ret == -EINVAL)
80764bc784413e Huacai Chen 2018-05-22  166  			dev_dbg(parent, "no nr provided\n");
80764bc784413e Huacai Chen 2018-05-22  167  
80764bc784413e Huacai Chen 2018-05-22  168  		id = of_alias_get_id(i2c_np, "i2c");
80764bc784413e Huacai Chen 2018-05-22  169  		if (id >= 0)
80764bc784413e Huacai Chen 2018-05-22  170  			nr = id;
80764bc784413e Huacai Chen 2018-05-22  171  	}
80764bc784413e Huacai Chen 2018-05-22  172  
80764bc784413e Huacai Chen 2018-05-22  173  	li2c->sda = 1 << sda;
80764bc784413e Huacai Chen 2018-05-22  174  	li2c->scl = 1 << scl;
80764bc784413e Huacai Chen 2018-05-22  175  
80764bc784413e Huacai Chen 2018-05-22  176  	/* Optional properties which made the driver more flexible */
80764bc784413e Huacai Chen 2018-05-22  177  	of_property_read_u32(i2c_np, "loongson,udelay", &udelay);
80764bc784413e Huacai Chen 2018-05-22  178  	of_property_read_u32(i2c_np, "loongson,timeout", &timeout);
80764bc784413e Huacai Chen 2018-05-22  179  
80764bc784413e Huacai Chen 2018-05-22 @180  	li2c->dir_reg = reg_base + LS7A_DC_GPIO_DIR_REG;
80764bc784413e Huacai Chen 2018-05-22 @181  	li2c->dat_reg = reg_base + LS7A_DC_GPIO_DAT_REG;
80764bc784413e Huacai Chen 2018-05-22  182  
80764bc784413e Huacai Chen 2018-05-22  183  	li2c->bit.setsda = ls7a_i2c_set_sda;
80764bc784413e Huacai Chen 2018-05-22  184  	li2c->bit.setscl = ls7a_i2c_set_scl;
80764bc784413e Huacai Chen 2018-05-22  185  	li2c->bit.getsda = ls7a_i2c_get_sda;
80764bc784413e Huacai Chen 2018-05-22  186  	li2c->bit.getscl = ls7a_i2c_get_scl;
80764bc784413e Huacai Chen 2018-05-22  187  	li2c->bit.udelay = udelay;
80764bc784413e Huacai Chen 2018-05-22  188  	li2c->bit.timeout = usecs_to_jiffies(timeout);
80764bc784413e Huacai Chen 2018-05-22  189  	li2c->bit.data = li2c;
80764bc784413e Huacai Chen 2018-05-22  190  
80764bc784413e Huacai Chen 2018-05-22  191  	adapter = &li2c->adapter;
80764bc784413e Huacai Chen 2018-05-22  192  	adapter->algo_data = &li2c->bit;
80764bc784413e Huacai Chen 2018-05-22  193  	adapter->owner = THIS_MODULE;
80764bc784413e Huacai Chen 2018-05-22  194  	adapter->class = I2C_CLASS_DDC;
80764bc784413e Huacai Chen 2018-05-22  195  	adapter->dev.parent = parent;
80764bc784413e Huacai Chen 2018-05-22  196  	adapter->nr = nr;
80764bc784413e Huacai Chen 2018-05-22  197  	adapter->dev.of_node = i2c_np;
80764bc784413e Huacai Chen 2018-05-22  198  
80764bc784413e Huacai Chen 2018-05-22  199  	snprintf(adapter->name, sizeof(adapter->name), "gpio-i2c-%d", nr);
80764bc784413e Huacai Chen 2018-05-22  200  
80764bc784413e Huacai Chen 2018-05-22  201  	i2c_set_adapdata(adapter, li2c);
80764bc784413e Huacai Chen 2018-05-22  202  
80764bc784413e Huacai Chen 2018-05-22  203  	ret = i2c_bit_add_numbered_bus(adapter);
80764bc784413e Huacai Chen 2018-05-22  204  	if (ret) {
80764bc784413e Huacai Chen 2018-05-22  205  		if (i2c_np)
80764bc784413e Huacai Chen 2018-05-22  206  			of_node_put(i2c_np);
80764bc784413e Huacai Chen 2018-05-22  207  
80764bc784413e Huacai Chen 2018-05-22  208  		kfree(li2c);
80764bc784413e Huacai Chen 2018-05-22  209  		return ERR_PTR(ret);
80764bc784413e Huacai Chen 2018-05-22  210  	}
80764bc784413e Huacai Chen 2018-05-22  211  
80764bc784413e Huacai Chen 2018-05-22  212  	dev_info(parent, "sda=%u, scl=%u, nr=%d, udelay=%u, timeout=%u\n",
80764bc784413e Huacai Chen 2018-05-22  213  		 li2c->sda, li2c->scl, nr, udelay, timeout);
80764bc784413e Huacai Chen 2018-05-22  214  
80764bc784413e Huacai Chen 2018-05-22  215  	ret = devm_add_action_or_reset(parent, lsdc_of_release_i2c_adapter, li2c);
80764bc784413e Huacai Chen 2018-05-22  216  	if (ret)
80764bc784413e Huacai Chen 2018-05-22  217  		return NULL;
80764bc784413e Huacai Chen 2018-05-22  218  
80764bc784413e Huacai Chen 2018-05-22  219  	return li2c;
80764bc784413e Huacai Chen 2018-05-22  220  }
80764bc784413e Huacai Chen 2018-05-22  221  

:::::: The code at line 180 was first introduced by commit
:::::: 80764bc784413eb604c7d472db55b1ca72d4bbc5 drm/loongson: add kernel modesetting driver support for ls7a1000/ls7a2000

:::::: TO: Huacai Chen <chenhc@lemote.com>
:::::: CC: Hongchen Zhang <zhanghongchen@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
