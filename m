Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F78315E97
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Oct 2024 18:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727806837; cv=none; b=T0GI2VKTLgoPl//CYbDBeulpRrRLv/cxDXxBP+K1Nj2jbgX5cfomNVl+TQv0QQNDbJ1HsIj6pP+yujCZqR2r7s49jcRtZtvhGv+A5p6c+LkjJgfAgAwULCazQAi6E9VMIMIbmx/nkUlHfvqJVxwwxiutBA+Mc6kP9lfdHvwF+M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727806837; c=relaxed/simple;
	bh=90eZVy/jjwwbx0GhohDbzpc7fPQibB2sKhBhTCBwSRY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dvCe78muVr7Y8rsqMeF+8Cq/8wEMODEyGe7DVckhY9lsOHdnjHVDI/zCZFkiQrCWjhWxZ/t2J0GbdzbLmNYGXmz7lluH0m7qkOC9VWpQfBY2qOUqkzKsGTjRkInnW6PADln8ByVs5Pj0V+PYQp1WF0jkjsyUqN68O5B8B0XJHRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iLvKmRZp; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iLvKmRZp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727806836; x=1759342836;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=90eZVy/jjwwbx0GhohDbzpc7fPQibB2sKhBhTCBwSRY=;
  b=iLvKmRZpkeTcZ5eLkuZETYbI+w/86Y6kPN+D9QsBZctBUfQATdEaQLNg
   blx84lOceLN6tVMTfq5udDrUVXaAq5Jsvvnxg9TB2fapTW84ToE4r6LTc
   8+5lQ/8r94zqt+2P7mECgm9RaopWXD/MPvRb8PSN9Yhzyv+Ki6CmSXaOy
   fqOeBwNVI15myT9rXkCU3HZrA3eq1kFAi8bPB37gO81Q7gerXrO0+L6F6
   r6hg4eVAVDXiUrArTVhxO7SQROk+vUm+XKkMxjimQOg2k+hP/GnvBfzRA
   wC9jLzPVky+1jCWetWMSWnx7Sh2X468UWf3sjNzK0pmnazBXxqqaJlIJ3
   Q==;
X-CSE-ConnectionGUID: HEZ/JRDcT+WKnyPnI5bZug==
X-CSE-MsgGUID: XyYAjB0gTmWk4r4EU7oT1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="26462346"
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="26462346"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 11:20:35 -0700
X-CSE-ConnectionGUID: 9iB1exYcQjKxJRZ17qVh5g==
X-CSE-MsgGUID: zVrRWQlcS9qc2yoOigQwoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="78503077"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 01 Oct 2024 11:20:34 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svhU7-000R2e-1d;
	Tue, 01 Oct 2024 18:20:31 +0000
Date: Wed, 2 Oct 2024 02:19:41 +0800
From: kernel test robot <lkp@intel.com>
To: ObiKeahloa <63236194+ObiKeahloa@users.noreply.github.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:pr/329 2/2] drivers/gpio/gpio-macsmc.c:360:70: warning:
 right-hand operand of comma expression has no effect
Message-ID: <202410020259.nJ8CgFde-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux pr/329
head:   6abdb8e437d3e97f886f07131659d40379c912bd
commit: 6abdb8e437d3e97f886f07131659d40379c912bd [2/2] Update gpio-macsmc.c
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20241002/202410020259.nJ8CgFde-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410020259.nJ8CgFde-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410020259.nJ8CgFde-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpio/gpio-macsmc.c: In function 'macsmc_gpio_probe':
>> drivers/gpio/gpio-macsmc.c:360:70: warning: right-hand operand of comma expression has no effect [-Wunused-value]
     360 |         smcgp->ic.flags = IRQCHIP_IMMUTABLE | IRQCHIP_SET_TYPE_MASKED, IRQCHIP_MASK_ON_SUSPEND;
         |                                                                      ^


vim +360 drivers/gpio/gpio-macsmc.c

   312	
   313	static int macsmc_gpio_probe(struct platform_device *pdev)
   314	{
   315		struct macsmc_gpio *smcgp;
   316		struct apple_smc *smc = dev_get_drvdata(pdev->dev.parent);
   317		smc_key key;
   318		int ret;
   319	
   320		smcgp = devm_kzalloc(&pdev->dev, sizeof(*smcgp), GFP_KERNEL);
   321		if (!smcgp)
   322			return -ENOMEM;
   323	
   324		pdev->dev.of_node = of_get_child_by_name(pdev->dev.parent->of_node, "gpio");
   325	
   326		smcgp->dev = &pdev->dev;
   327		smcgp->smc = smc;
   328		smcgp->first_index = apple_smc_find_first_key_index(smc, SMC_KEY(gP00));
   329	
   330		if (smcgp->first_index >= apple_smc_get_key_count(smc))
   331			return -ENODEV;
   332	
   333		ret = apple_smc_get_key_by_index(smc, smcgp->first_index, &key);
   334		if (ret < 0)
   335			return ret;
   336	
   337		if (key > macsmc_gpio_key(MAX_GPIO - 1))
   338			return -ENODEV;
   339	
   340		dev_info(smcgp->dev, "First GPIO key: %p4ch\n", &key);
   341	
   342		smcgp->gc.label = "macsmc-pmu-gpio";
   343		smcgp->gc.owner = THIS_MODULE;
   344		smcgp->gc.get = macsmc_gpio_get;
   345		smcgp->gc.set = macsmc_gpio_set;
   346		smcgp->gc.get_direction = macsmc_gpio_get_direction;
   347		smcgp->gc.init_valid_mask = macsmc_gpio_init_valid_mask;
   348		smcgp->gc.can_sleep = true;
   349		smcgp->gc.ngpio = MAX_GPIO;
   350		smcgp->gc.base = -1;
   351		smcgp->gc.parent = &pdev->dev;
   352	
   353		smcgp->ic.name = "macsmc-pmu-gpio";
   354		smcgp->ic.irq_mask = macsmc_gpio_irq_disable;
   355		smcgp->ic.irq_unmask = macsmc_gpio_irq_enable;
   356		smcgp->ic.irq_set_type = macsmc_gpio_irq_set_type;
   357		smcgp->ic.irq_bus_lock = macsmc_gpio_irq_bus_lock;
   358		smcgp->ic.irq_bus_sync_unlock = macsmc_gpio_irq_bus_sync_unlock;
   359		smcgp->ic.irq_set_type = macsmc_gpio_irq_set_type;
 > 360		smcgp->ic.flags = IRQCHIP_IMMUTABLE | IRQCHIP_SET_TYPE_MASKED, IRQCHIP_MASK_ON_SUSPEND;
   361	
   362		smcgp->gc.irq.chip = &smcgp->ic;
   363		smcgp->gc.irq.parent_handler = NULL;
   364		smcgp->gc.irq.num_parents = 0;
   365		smcgp->gc.irq.parents = NULL;
   366		smcgp->gc.irq.default_type = IRQ_TYPE_NONE;
   367		smcgp->gc.irq.handler = handle_simple_irq;
   368	
   369		mutex_init(&smcgp->irq_mutex);
   370	
   371		smcgp->nb.notifier_call = macsmc_gpio_event;
   372		apple_smc_register_notifier(smc, &smcgp->nb);
   373	
   374		return devm_gpiochip_add_data(&pdev->dev, &smcgp->gc, smcgp);
   375	}
   376	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
