Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792914046;
	b=1llSv5/hkvfiTzgVB6m36HS1irFDENiogHYuU0jwljZWOdAi6r+4M3SYlktpcfQVERgg
	 DgRCclTmjr9IgQunwfLRHgCQ2HbP4wKv1b+SW4jeyULqqSM56b7PGz0wvRbrAOjuAZBRu
	 fIz0GfTOmqR1b1Vetd6PPMN9fzyr7eB9lhnyKMPkPA6QfR0NQy1f2P77SIc7sWBYJpLMu
	 1nhYmL4yR7fvgG58drlFgceok7ME0D4pR2n/P4R5LREoKJWzYNfUZO0a1s2S+VJhxc2F0
	 sE2+MJhGlQUn7OPtabVKHdF73gfPwf25d2x3rLTn38LfY1CQsAtJCs9YtUzfn/Bq4sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792914046;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=IflpQTmdAZmbml9W3ZGzcO5NsPdAwMfFBzbICqzrjMQ=;
	b=un/zSJBrkIc4SNKQFz6XE5bi0mKsZvUN71lrGIXqgxA2/ufeXV+BXmI5xjvAH2u+H+cU
	 1xx/LEsnl+urwCkTWCpp6N6xecaQ453wQBB1uaqCfBQDLG3O4pUXbM0rwTfBuix5Xg062
	 A6D2A0TuY+DtOpJNnHXLSkzRLGeu/llSVyqzi9FrnHuYlxsYE6nzWr5Z4QuF1mBTnrwmS
	 SsY7RcVv1AKF7FrOWW93hBSUGt4eem66futYinEnc9CwhcYnTF8xe/43HY4fCVv01nKK1
	 7Javh2HngD3fbObvNrpvzM2//gmXH1c2wNttqR8MvLV371nnYZzuT2XT0PQq86SJouQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eo5Ue71W;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21AE606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Oct 2026 07:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F21AE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eo5Ue71W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792914044; x=1824450044;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DyD4dWpqrhtkDxyrU3wPsyd2zqz3JxxNTSlznm/Pnfo=;
  b=eo5Ue71WW2AzVqvxFjem2e1sqNkSHy0Ajpub5LQCtCuJ7KvkX/51EumE
   qCXkia3DwjdKX2CRl9DqjSfAv3YjCvRtXqONY5kPU0/Mvrod3/cSJcrxm
   CbMmdxWcPTasvD9+F2jWWPhkny0YQvQVtCjKUx42gc56YoVv2wIQNykJ5
   5NZk7Vmw5E4nMs4HbCNUseKld068LS6sNtMeD7h+iqBRQ2zktfKilEoiv
   NIbo25u9YJ59adB6hrl1PPGdhFZzGrzv1T7SMKtVIBO40Egkb/JtZ2O3Z
   YaSxRfWJRSKvG6W5xNE20TMKdsnb6WBshZRiR3Op+CirPcG6R9OseRyuc
   A==;
X-CSE-ConnectionGUID: LbvA+BEbRJq4+1MVSDSWZQ==
X-CSE-MsgGUID: t2OXsJyfT6eoZIp9B3r+og==
X-IronPort-AV: E=McAfee;i="6800,10657,11945"; a="1492175"
X-IronPort-AV: E=Sophos;i="6.27,177,1787036400"; 
   d="scan'208";a="1492175"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 00:40:43 -0700
X-CSE-ConnectionGUID: fgilpMDRS46GiFG5rm1a3A==
X-CSE-MsgGUID: G44uLAXTQL6cMAiMXx2OIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,177,1787036400"; 
   d="scan'208";a="3946762"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 25 Oct 2026 00:40:42 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKsqM-00000000UeM-49tM;
	Sun, 25 Oct 2026 07:40:38 +0000
Date: Sun, 25 Oct 2026 15:40:33 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Subject: [linux-next:master 19256/19841]
 drivers/gpio/gpio-sim.c:1394:10: error: 'const struct config_item_type' has
 no member named 'ct_attrs_const'
Message-ID: <202610251501.Tof6gV1S-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   20a33c6b6cbe7e4805dfb6cd68816937443aa148
commit: b57f502a681296be357e5c9dc72b53b083b26472 [19256/19841] gpio: sim: constify struct configfs_attribute
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20261025/202610251501.Tof6gV1S-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261025/202610251501.Tof6gV1S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610251501.Tof6gV1S-lkp@intel.com/

Note: the linux-next/master HEAD 20a33c6b6cbe7e4805dfb6cd68816937443aa148 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> drivers/gpio/gpio-sim.c:1394:10: error: 'const struct config_item_type' has no member named 'ct_attrs_const'
    1394 |         .ct_attrs_const = gpio_sim_hog_config_attrs,
         |          ^~~~~~~~~~~~~~
>> drivers/gpio/gpio-sim.c:1394:27: error: initialization of 'const struct configfs_group_operations *' from incompatible pointer type 'const struct configfs_attribute * const*' [-Wincompatible-pointer-types]
    1394 |         .ct_attrs_const = gpio_sim_hog_config_attrs,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-sim.c:1394:27: note: (near initialization for 'gpio_sim_hog_config_type.ct_group_ops')
   drivers/gpio/gpio-sim.c:1448:10: error: 'const struct config_item_type' has no member named 'ct_attrs_const'
    1448 |         .ct_attrs_const = gpio_sim_line_config_attrs,
         |          ^~~~~~~~~~~~~~
>> drivers/gpio/gpio-sim.c:1448:27: error: initialization of 'struct configfs_attribute **' from incompatible pointer type 'const struct configfs_attribute * const*' [-Wincompatible-pointer-types]
    1448 |         .ct_attrs_const = gpio_sim_line_config_attrs,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-sim.c:1448:27: note: (near initialization for 'gpio_sim_line_config_type.ct_attrs')
   drivers/gpio/gpio-sim.c:1509:10: error: 'const struct config_item_type' has no member named 'ct_attrs_const'
    1509 |         .ct_attrs_const = gpio_sim_bank_config_attrs,
         |          ^~~~~~~~~~~~~~
   drivers/gpio/gpio-sim.c:1509:27: error: initialization of 'struct configfs_attribute **' from incompatible pointer type 'const struct configfs_attribute * const*' [-Wincompatible-pointer-types]
    1509 |         .ct_attrs_const = gpio_sim_bank_config_attrs,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-sim.c:1509:27: note: (near initialization for 'gpio_sim_bank_config_group_type.ct_attrs')
   drivers/gpio/gpio-sim.c:1564:10: error: 'const struct config_item_type' has no member named 'ct_attrs_const'
    1564 |         .ct_attrs_const = gpio_sim_device_config_attrs,
         |          ^~~~~~~~~~~~~~
   drivers/gpio/gpio-sim.c:1564:27: error: initialization of 'struct configfs_attribute **' from incompatible pointer type 'const struct configfs_attribute * const*' [-Wincompatible-pointer-types]
    1564 |         .ct_attrs_const = gpio_sim_device_config_attrs,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-sim.c:1564:27: note: (near initialization for 'gpio_sim_device_config_group_type.ct_attrs')


vim +1394 drivers/gpio/gpio-sim.c

  1391	
  1392	static const struct config_item_type gpio_sim_hog_config_type = {
  1393		.ct_item_ops	= &gpio_sim_hog_config_item_ops,
> 1394		.ct_attrs_const	= gpio_sim_hog_config_attrs,
  1395		.ct_owner	= THIS_MODULE,
  1396	};
  1397	
  1398	static struct config_item *
  1399	gpio_sim_line_config_make_hog_item(struct config_group *group, const char *name)
  1400	{
  1401		struct gpio_sim_line *line = to_gpio_sim_line(&group->cg_item);
  1402		struct gpio_sim_device *dev = gpio_sim_line_get_device(line);
  1403		struct gpio_sim_hog *hog;
  1404	
  1405		if (strcmp(name, "hog") != 0)
  1406			return ERR_PTR(-EINVAL);
  1407	
  1408		guard(mutex)(&dev->lock);
  1409	
  1410		hog = kzalloc_obj(*hog);
  1411		if (!hog)
  1412			return ERR_PTR(-ENOMEM);
  1413	
  1414		config_item_init_type_name(&hog->item, name,
  1415					   &gpio_sim_hog_config_type);
  1416	
  1417		hog->dir = GPIOD_IN;
  1418		hog->name = NULL;
  1419		hog->parent = line;
  1420		line->hog = hog;
  1421	
  1422		return &hog->item;
  1423	}
  1424	
  1425	static void gpio_sim_line_config_group_release(struct config_item *item)
  1426	{
  1427		struct gpio_sim_line *line = to_gpio_sim_line(item);
  1428		struct gpio_sim_device *dev = gpio_sim_line_get_device(line);
  1429	
  1430		scoped_guard(mutex, &dev->lock)
  1431			list_del(&line->siblings);
  1432	
  1433		kfree(line->name);
  1434		kfree(line);
  1435	}
  1436	
  1437	static const struct configfs_item_operations gpio_sim_line_config_item_ops = {
  1438		.release	= gpio_sim_line_config_group_release,
  1439	};
  1440	
  1441	static const struct configfs_group_operations gpio_sim_line_config_group_ops = {
  1442		.make_item	= gpio_sim_line_config_make_hog_item,
  1443	};
  1444	
  1445	static const struct config_item_type gpio_sim_line_config_type = {
  1446		.ct_item_ops	= &gpio_sim_line_config_item_ops,
  1447		.ct_group_ops	= &gpio_sim_line_config_group_ops,
> 1448		.ct_attrs_const	= gpio_sim_line_config_attrs,
  1449		.ct_owner       = THIS_MODULE,
  1450	};
  1451	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
