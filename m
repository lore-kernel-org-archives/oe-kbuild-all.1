Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285D43939B0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jun 2026 19:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782244578; cv=none; b=Bb1tRJjWe68W9W6BbFsGlFfTe5dETwSyyyW56IzHrqOT3vWXm3VHBBrUu2aYFacc8ZsWswediQGTUJlDpxXX2BFb0nSHTxI/8GEtSVd89I+t93GO2JJogvKZzf01zylj1RPJlq3+QALjCvB/SxTQzj/EG9JAQcPJCyugFw/HLEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782244578; c=relaxed/simple;
	bh=n3Ivttw0haaFwGJ116jziBfEe3Yr4PYDkjnMRe+TaIU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GHBnNzScz1w5VY5M5B7h0S2n6s3AbypdHzwzGS9HxGzquzcgrn5CRg+X5PwpFIHpfc9MU6spru/b6oFDDg99ET3a7NYaRo1ATuAQX4K8pH+or6bJyQHzJImGz+qRJVLfwfaAGKj2scGsEJNyjNcxbtASoRARyveHbnwjjdCZ+jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YP6C8Ej6; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YP6C8Ej6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782244577; x=1813780577;
  h=date:from:to:cc:subject:message-id;
  bh=n3Ivttw0haaFwGJ116jziBfEe3Yr4PYDkjnMRe+TaIU=;
  b=YP6C8Ej6UPJsoJKchvo+NICFSXXhYroPSM9L0kJUpFXJbZTYQBWrrz/8
   bNPjn6+KcpbIudE83IZVxtvEBlQMUWzDLyHcBag3YkVuiks55eLYCY3WC
   sFXepXlPM8CTIO8pRlpGVEMnsK7za7VdqyFOf6hDTUvaD8mu3tO3fKvlB
   G+IZIz/D9bFw/Bo3rzl0liqG24YAVPEhNJxqt8vkGJW7c66RNDWkXixZJ
   Zf0+BcE/bZHTVWxhRFXBvLBIvc1vRebQFzhvax6GtVUbuupcaEGpthgfX
   5xor+IezGj7QQJPM0Hxnce7+FAAwpf6p6D9N1Wx+4aYnXrNoF9LZnLYnt
   A==;
X-CSE-ConnectionGUID: mr5MRwuhSTCHs4ud2eFCdQ==
X-CSE-MsgGUID: 0tQRfqDtQJ2JQgdsyytMtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="70513807"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="70513807"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 12:56:16 -0700
X-CSE-ConnectionGUID: 0a3wzs2WTeKMjv9GWG3tmg==
X-CSE-MsgGUID: 10dFT/seQfK2NyK++/GT0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="273676593"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 23 Jun 2026 12:56:15 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wc7EC-000000002ra-2Swi;
	Tue, 23 Jun 2026 19:56:12 +0000
Date: Wed, 24 Jun 2026 03:55:16 +0800
From: kernel test robot <lkp@intel.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wsa:renesas/mfis/hwspinlock 3/8]
 drivers/i2c/busses/i2c-rcar.c:1230 rcar_i2c_probe() warn: inconsistent
 indenting
Message-ID: <202606240307.5lIyLPkw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/mfis/hwspinlock
head:   84d0247695fc44cfcfaa34335cda86673804e8b0
commit: da42ae7d094d7acf425dbd3faccb5053b723518e [3/8] sparrowhawk/ironhide: hwspinlock testing
config: um-randconfig-r072-20260623 (https://download.01.org/0day-ci/archive/20260624/202606240307.5lIyLPkw-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606240307.5lIyLPkw-lkp@intel.com/

smatch warnings:
drivers/i2c/busses/i2c-rcar.c:1230 rcar_i2c_probe() warn: inconsistent indenting

vim +1230 drivers/i2c/busses/i2c-rcar.c

  1118	
  1119	static int rcar_i2c_probe(struct platform_device *pdev)
  1120	{
  1121		struct rcar_i2c_priv *priv;
  1122		struct i2c_adapter *adap;
  1123		struct device *dev = &pdev->dev;
  1124		unsigned long irqflags = 0;
  1125		irqreturn_t (*irqhandler)(int irq, void *ptr) = rcar_i2c_gen3_irq;
  1126		int ret;
  1127	
  1128		/* Otherwise logic will break because some bytes must always use PIO */
  1129		BUILD_BUG_ON_MSG(RCAR_MIN_DMA_LEN < 3, "Invalid min DMA length");
  1130	
  1131		priv = devm_kzalloc(dev, sizeof(struct rcar_i2c_priv), GFP_KERNEL);
  1132		if (!priv)
  1133			return -ENOMEM;
  1134	
  1135		priv->clk = devm_clk_get(dev, NULL);
  1136		if (IS_ERR(priv->clk)) {
  1137			dev_err(dev, "cannot get clock\n");
  1138			return PTR_ERR(priv->clk);
  1139		}
  1140	
  1141		priv->io = devm_platform_get_and_ioremap_resource(pdev, 0, &priv->res);
  1142		if (IS_ERR(priv->io))
  1143			return PTR_ERR(priv->io);
  1144	
  1145		priv->devtype = (kernel_ulong_t)of_device_get_match_data(dev);
  1146		init_waitqueue_head(&priv->wait);
  1147	
  1148		adap = &priv->adap;
  1149		adap->nr = pdev->id;
  1150		adap->algo = &rcar_i2c_algo;
  1151		adap->class = I2C_CLASS_DEPRECATED;
  1152		adap->retries = 3;
  1153		adap->dev.parent = dev;
  1154		adap->dev.of_node = dev->of_node;
  1155		adap->bus_recovery_info = &rcar_i2c_bri;
  1156		adap->quirks = &rcar_i2c_quirks;
  1157		i2c_set_adapdata(adap, priv);
  1158		strscpy(adap->name, pdev->name, sizeof(adap->name));
  1159	
  1160		/* Init DMA */
  1161		sg_init_table(&priv->sg, 1);
  1162		priv->dma_direction = DMA_NONE;
  1163		priv->dma_rx = priv->dma_tx = ERR_PTR(-EPROBE_DEFER);
  1164	
  1165		/* Activate device for clock calculation */
  1166		pm_runtime_enable(dev);
  1167		pm_runtime_get_sync(dev);
  1168		ret = rcar_i2c_clock_calculate(priv);
  1169		if (ret < 0) {
  1170			pm_runtime_put(dev);
  1171			goto out_pm_disable;
  1172		}
  1173	
  1174		/* Bring hardware to known state */
  1175		rcar_i2c_init(priv);
  1176		rcar_i2c_reset_slave(priv);
  1177	
  1178		/* Stay always active when multi-master to keep arbitration working */
  1179		if (of_property_read_bool(dev->of_node, "multi-master"))
  1180			priv->flags |= ID_P_PM_BLOCKED;
  1181		else
  1182			pm_runtime_put(dev);
  1183	
  1184		if (of_property_read_bool(dev->of_node, "smbus"))
  1185			priv->flags |= ID_P_HOST_NOTIFY;
  1186	
  1187		if (priv->devtype < I2C_RCAR_GEN3) {
  1188			irqflags |= IRQF_NO_THREAD;
  1189			irqhandler = rcar_i2c_gen2_irq;
  1190		} else {
  1191			/* R-Car Gen3+ needs a reset before every transfer */
  1192			priv->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
  1193			if (IS_ERR(priv->rstc)) {
  1194				ret = PTR_ERR(priv->rstc);
  1195				goto out_pm_put;
  1196			}
  1197	
  1198			ret = reset_control_status(priv->rstc);
  1199			if (ret < 0)
  1200				goto out_pm_put;
  1201	
  1202			/* hard reset disturbs HostNotify local target, so disable it */
  1203			priv->flags &= ~ID_P_HOST_NOTIFY;
  1204		}
  1205	
  1206		ret = platform_get_irq(pdev, 0);
  1207		if (ret < 0)
  1208			goto out_pm_put;
  1209		priv->irq = ret;
  1210		ret = devm_request_irq(dev, priv->irq, irqhandler, irqflags, dev_name(dev), priv);
  1211		if (ret < 0) {
  1212			dev_err(dev, "cannot get irq %d\n", priv->irq);
  1213			goto out_pm_put;
  1214		}
  1215	
  1216		platform_set_drvdata(pdev, priv);
  1217	
  1218		ret = i2c_add_numbered_adapter(adap);
  1219		if (ret < 0)
  1220			goto out_pm_put;
  1221	
  1222		if (priv->flags & ID_P_HOST_NOTIFY) {
  1223			priv->host_notify_client = i2c_new_slave_host_notify_device(adap);
  1224			if (IS_ERR(priv->host_notify_client)) {
  1225				ret = PTR_ERR(priv->host_notify_client);
  1226				goto out_del_device;
  1227			}
  1228		}
  1229	
> 1230	int lock_id;
  1231	struct hwspinlock *lock;
  1232	for (int j = 0; j < 2; j++) {
  1233	lock_id = of_hwspin_lock_get_id(dev->of_node, j);
  1234	if (lock_id == -EPROBE_DEFER) return lock_id;
  1235	if (lock_id < 0) continue;
  1236	lock = hwspin_lock_request_specific(lock_id);
  1237	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
