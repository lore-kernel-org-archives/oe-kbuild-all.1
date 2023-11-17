Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79D13717C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Nov 2023 16:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TYbUlvoW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700237601; x=1731773601;
  h=date:from:cc:subject:message-id:mime-version;
  bh=vy2s8mYSFL5dJxaQns/JKEAR02Q+yzAmdd+0GYo9N88=;
  b=TYbUlvoWHIxgUSO35AQAUrdv8nBlWOvwWy435es4lCidwRR4MNWAzdJO
   I3M0tzvEk7x9Ei710TNPVGErcXrq4lKvR4t6QYC0y3XB+Z/6lSj/tEz9I
   5syrPa/mDgW+YD5Zkr9kwf+0dhDJuieHuanJ+wFdXHwj8iaSgkB/CqwG1
   x9Ju2NKePjTUfBhPw495fGZtGa5ZtupcjZZn1ua0zQBY7dFkYGx/iB1PC
   smGqq2EnydPhVOxKWWdU/vy8bYPYH8pDQsmOzCzz/0zmcXwcgdhDSpn3T
   1eaN6ouxmwNmv1lTb9LrxwoQaada6ZMfttBGoR180V2HeNzuO9wkuU6wR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="394172716"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="394172716"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 08:13:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="889282546"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="889282546"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 17 Nov 2023 08:13:19 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r41T2-0002v6-2f;
	Fri, 17 Nov 2023 16:13:16 +0000
Date: Sat, 18 Nov 2023 00:13:16 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 18/21]
 drivers/tty/serial/8250/8250_omap.c:1251:15: error: implicit declaration of
 function 'pinctrl_select_state'
Message-ID: <202311172355.BvDAMXgJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   3d320fa61172b4a33d1c11e57374cc6880562ae0
commit: 9a2c8fd78ca6eb30b1ea6aa3400d74871a51dca0 [18/21] serial: 8250: omap: Support wakeup pinctrl state
config: sh-randconfig-002-20231117 (https://download.01.org/0day-ci/archive/20231117/202311172355.BvDAMXgJ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231117/202311172355.BvDAMXgJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311172355.BvDAMXgJ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/tty/serial/8250/8250_omap.c: In function 'omap8250_sysoff_handler':
>> drivers/tty/serial/8250/8250_omap.c:1251:15: error: implicit declaration of function 'pinctrl_select_state' [-Werror=implicit-function-declaration]
    1251 |         ret = pinctrl_select_state(priv->pinctrl, priv->pinctrl_wakeup);
         |               ^~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_omap.c: In function 'omap8250_probe':
>> drivers/tty/serial/8250/8250_omap.c:1482:25: error: implicit declaration of function 'devm_pinctrl_get'; did you mean 'of_pinctrl_get'? [-Werror=implicit-function-declaration]
    1482 |         priv->pinctrl = devm_pinctrl_get(&pdev->dev);
         |                         ^~~~~~~~~~~~~~~~
         |                         of_pinctrl_get
>> drivers/tty/serial/8250/8250_omap.c:1482:23: warning: assignment to 'struct pinctrl *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1482 |         priv->pinctrl = devm_pinctrl_get(&pdev->dev);
         |                       ^
>> drivers/tty/serial/8250/8250_omap.c:1484:41: error: implicit declaration of function 'pinctrl_lookup_state' [-Werror=implicit-function-declaration]
    1484 |                 priv->pinctrl_default = pinctrl_lookup_state(priv->pinctrl, "default");
         |                                         ^~~~~~~~~~~~~~~~~~~~
>> drivers/tty/serial/8250/8250_omap.c:1484:39: warning: assignment to 'struct pinctrl_state *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1484 |                 priv->pinctrl_default = pinctrl_lookup_state(priv->pinctrl, "default");
         |                                       ^
   drivers/tty/serial/8250/8250_omap.c:1485:38: warning: assignment to 'struct pinctrl_state *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1485 |                 priv->pinctrl_wakeup = pinctrl_lookup_state(priv->pinctrl, "wakeup");
         |                                      ^
   cc1: some warnings being treated as errors


vim +/pinctrl_select_state +1251 drivers/tty/serial/8250/8250_omap.c

  1237	
  1238	static int omap8250_sysoff_handler(struct sys_off_data *data)
  1239	{
  1240		struct omap8250_priv *priv = dev_get_drvdata(data->dev);
  1241		int ret;
  1242	
  1243		dev_dbg(data->dev, "sysoff handler\n");
  1244	
  1245		if (IS_ERR_OR_NULL(priv->pinctrl_wakeup))
  1246			return NOTIFY_DONE;
  1247	
  1248		if (!device_may_wakeup(data->dev))
  1249			return NOTIFY_DONE;
  1250	
> 1251		ret = pinctrl_select_state(priv->pinctrl, priv->pinctrl_wakeup);
  1252		if (ret)
  1253			dev_err(data->dev, "Failed to select pinctrl state 'wakeup', continuing poweroff\n");
  1254	
  1255		dev_dbg(data->dev, "Setup wakeup pinctrl\n");
  1256	
  1257		return NOTIFY_DONE;
  1258	}
  1259	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
