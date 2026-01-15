Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FBB34DB68
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 14:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768489033; cv=none; b=kB70VEr+HJLtWJjLX1ykq+vektAH5Uzb3rkbw/meVEQqtG/bvl3/0E6kd3Tb3FQSDiOV8MSjpnQGd5JXheIi8lOcdMMKZoUa/o1hn7e3U5CIlO+oLwGPKpdOQQ5yliztfLZXWrs3iboMCUlwVwuxp9YjpAtr18cX6sFJZ0b5ygg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768489033; c=relaxed/simple;
	bh=r5kLXeXtn6WFP8PppwY0ploPGmu/dKmRHfEfBi4eDnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VQQwyR3Vj5/IyqNanzV1L37VX+tzkq5s54onP0TxxGOTS5UDBda2vM7WkbUtlb6frhMn3J/C5DVRF0XHovroqbEDivxc4JsDWgsh2YFDOtaljRX+iccw9XOsIl0f7I/zlg7prpaSSbR1qD5ROW2nJS/s5dNy9aNkzcYUwrAKbSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Td++3PhA; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Td++3PhA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768489033; x=1800025033;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=r5kLXeXtn6WFP8PppwY0ploPGmu/dKmRHfEfBi4eDnQ=;
  b=Td++3PhAUNIXkKhv61npEbCFjr68ir93iehD5blZTK39ZAYhH5job+3b
   I/oJS9/7Keu0M+23c4QwLa7gs+BXw2FZqYGLL2/s0aEuIGcnlfZTYoQL5
   P3ueuorXK9/nGX3bGrb6nYBS9gZbjXsUvi15aOs43dVqwX7Pskb+QCwMb
   x+5XeVuJYuX3I5/13IJlNdIM0VYN3rY4SfUYSoNY9LEjs0/J97lOKhT/Q
   sJrFyTQ2ZkKEPmThxB+C+qdUpEQqPsZ7YaNQGL2fcHPSfp0X5xnPCFMCn
   fn+eYOExYzhtXzZ26y68klTZTe/uuPOTbG781RcvFiJc5NH2Iz5XX+2Uj
   g==;
X-CSE-ConnectionGUID: I13W+BsuSB+fQnF0iVlFOA==
X-CSE-MsgGUID: KH9i2FJRQaSJnu7ZqHp13g==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="80906813"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="80906813"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 06:57:12 -0800
X-CSE-ConnectionGUID: U2Pf7r5TSmGicEZLH79KEg==
X-CSE-MsgGUID: LKdUpjVtQAKZX5Iq1fW5aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="228047090"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 15 Jan 2026 06:57:10 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgOmZ-00000000I6O-3OP2;
	Thu, 15 Jan 2026 14:57:07 +0000
Date: Thu, 15 Jan 2026 22:56:08 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH] of: guard pointers to key OF nodes with an #ifdef
Message-ID: <202601152233.og6LdeUo-lkp@intel.com>
References: <20260115091839.8206-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260115091839.8206-1-bartosz.golaszewski@oss.qualcomm.com>

Hi Bartosz,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.19-rc5 next-20260115]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/of-guard-pointers-to-key-OF-nodes-with-an-ifdef/20260115-171949
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260115091839.8206-1-bartosz.golaszewski%40oss.qualcomm.com
patch subject: [PATCH] of: guard pointers to key OF nodes with an #ifdef
config: sh-randconfig-r072-20260115 (https://download.01.org/0day-ci/archive/20260115/202601152233.og6LdeUo-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.3.0
smatch version: v0.5.0-8985-g2614ff1a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601152233.og6LdeUo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601152233.og6LdeUo-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/clocksource/timer-integrator-ap.c: In function 'integrator_ap_timer_init_of':
>> drivers/clocksource/timer-integrator-ap.c:181:39: error: 'of_aliases' undeclared (first use in this function)
     181 |         err = of_property_read_string(of_aliases,
         |                                       ^~~~~~~~~~
   drivers/clocksource/timer-integrator-ap.c:181:39: note: each undeclared identifier is reported only once for each function it appears in
--
   drivers/soc/imx/soc-imx8m.c: In function 'imx8m_soc_probe':
>> drivers/soc/imx/soc-imx8m.c:243:39: error: 'of_root' undeclared (first use in this function); did you mean 'ma_root'?
     243 |         ret = of_property_read_string(of_root, "model", &soc_dev_attr->machine);
         |                                       ^~~~~~~
         |                                       ma_root
   drivers/soc/imx/soc-imx8m.c:243:39: note: each undeclared identifier is reported only once for each function it appears in
--
   drivers/soc/imx/soc-imx9.c: In function 'imx9_soc_probe':
>> drivers/soc/imx/soc-imx9.c:32:39: error: 'of_root' undeclared (first use in this function); did you mean 'ma_root'?
      32 |         err = of_property_read_string(of_root, "model", &attr->machine);
         |                                       ^~~~~~~
         |                                       ma_root
   drivers/soc/imx/soc-imx9.c:32:39: note: each undeclared identifier is reported only once for each function it appears in


vim +/of_aliases +181 drivers/clocksource/timer-integrator-ap.c

beb5818bd01295 Linus Walleij  2014-10-15  157  
76804d052316d3 Daniel Lezcano 2016-06-06  158  static int __init integrator_ap_timer_init_of(struct device_node *node)
beb5818bd01295 Linus Walleij  2014-10-15  159  {
beb5818bd01295 Linus Walleij  2014-10-15  160  	const char *path;
beb5818bd01295 Linus Walleij  2014-10-15  161  	void __iomem *base;
beb5818bd01295 Linus Walleij  2014-10-15  162  	int err;
beb5818bd01295 Linus Walleij  2014-10-15  163  	int irq;
beb5818bd01295 Linus Walleij  2014-10-15  164  	struct clk *clk;
beb5818bd01295 Linus Walleij  2014-10-15  165  	unsigned long rate;
5eb73c83117111 Yangtao Li     2018-11-25  166  	struct device_node *alias_node;
beb5818bd01295 Linus Walleij  2014-10-15  167  
beb5818bd01295 Linus Walleij  2014-10-15  168  	base = of_io_request_and_map(node, 0, "integrator-timer");
bd580e7ed4add8 Maxime Ripard  2015-05-02  169  	if (IS_ERR(base))
76804d052316d3 Daniel Lezcano 2016-06-06  170  		return PTR_ERR(base);
beb5818bd01295 Linus Walleij  2014-10-15  171  
beb5818bd01295 Linus Walleij  2014-10-15  172  	clk = of_clk_get(node, 0);
beb5818bd01295 Linus Walleij  2014-10-15  173  	if (IS_ERR(clk)) {
2a4849d2674b96 Rob Herring    2018-08-27  174  		pr_err("No clock for %pOFn\n", node);
76804d052316d3 Daniel Lezcano 2016-06-06  175  		return PTR_ERR(clk);
beb5818bd01295 Linus Walleij  2014-10-15  176  	}
beb5818bd01295 Linus Walleij  2014-10-15  177  	clk_prepare_enable(clk);
beb5818bd01295 Linus Walleij  2014-10-15  178  	rate = clk_get_rate(clk);
beb5818bd01295 Linus Walleij  2014-10-15  179  	writel(0, base + TIMER_CTRL);
beb5818bd01295 Linus Walleij  2014-10-15  180  
beb5818bd01295 Linus Walleij  2014-10-15 @181  	err = of_property_read_string(of_aliases,
beb5818bd01295 Linus Walleij  2014-10-15  182  				"arm,timer-primary", &path);
76804d052316d3 Daniel Lezcano 2016-06-06  183  	if (err) {
ac9ce6d1a0cc29 Rafał Miłecki  2017-03-09  184  		pr_warn("Failed to read property\n");
76804d052316d3 Daniel Lezcano 2016-06-06  185  		return err;
76804d052316d3 Daniel Lezcano 2016-06-06  186  	}
76804d052316d3 Daniel Lezcano 2016-06-06  187  
5eb73c83117111 Yangtao Li     2018-11-25  188  	alias_node = of_find_node_by_path(path);
5eb73c83117111 Yangtao Li     2018-11-25  189  
5eb73c83117111 Yangtao Li     2018-11-25  190  	/*
5eb73c83117111 Yangtao Li     2018-11-25  191  	 * The pointer is used as an identifier not as a pointer, we
5eb73c83117111 Yangtao Li     2018-11-25  192  	 * can drop the refcount on the of__node immediately after
5eb73c83117111 Yangtao Li     2018-11-25  193  	 * getting it.
5eb73c83117111 Yangtao Li     2018-11-25  194  	 */
5eb73c83117111 Yangtao Li     2018-11-25  195  	of_node_put(alias_node);
5eb73c83117111 Yangtao Li     2018-11-25  196  
5eb73c83117111 Yangtao Li     2018-11-25  197  	if (node == alias_node)
5eb73c83117111 Yangtao Li     2018-11-25  198  		/* The primary timer lacks IRQ, use as clocksource */
5eb73c83117111 Yangtao Li     2018-11-25  199  		return integrator_clocksource_init(rate, base);
76804d052316d3 Daniel Lezcano 2016-06-06  200  
beb5818bd01295 Linus Walleij  2014-10-15  201  	err = of_property_read_string(of_aliases,
beb5818bd01295 Linus Walleij  2014-10-15  202  				"arm,timer-secondary", &path);
76804d052316d3 Daniel Lezcano 2016-06-06  203  	if (err) {
ac9ce6d1a0cc29 Rafał Miłecki  2017-03-09  204  		pr_warn("Failed to read property\n");
76804d052316d3 Daniel Lezcano 2016-06-06  205  		return err;
76804d052316d3 Daniel Lezcano 2016-06-06  206  	}
76804d052316d3 Daniel Lezcano 2016-06-06  207  
5eb73c83117111 Yangtao Li     2018-11-25  208  	alias_node = of_find_node_by_path(path);
76804d052316d3 Daniel Lezcano 2016-06-06  209  
5eb73c83117111 Yangtao Li     2018-11-25  210  	of_node_put(alias_node);
beb5818bd01295 Linus Walleij  2014-10-15  211  
5eb73c83117111 Yangtao Li     2018-11-25  212  	if (node == alias_node) {
beb5818bd01295 Linus Walleij  2014-10-15  213  		/* The secondary timer will drive the clock event */
beb5818bd01295 Linus Walleij  2014-10-15  214  		irq = irq_of_parse_and_map(node, 0);
76804d052316d3 Daniel Lezcano 2016-06-06  215  		return integrator_clockevent_init(rate, base, irq);
beb5818bd01295 Linus Walleij  2014-10-15  216  	}
beb5818bd01295 Linus Walleij  2014-10-15  217  
beb5818bd01295 Linus Walleij  2014-10-15  218  	pr_info("Timer @%p unused\n", base);
beb5818bd01295 Linus Walleij  2014-10-15  219  	clk_disable_unprepare(clk);
76804d052316d3 Daniel Lezcano 2016-06-06  220  
76804d052316d3 Daniel Lezcano 2016-06-06  221  	return 0;
beb5818bd01295 Linus Walleij  2014-10-15  222  }
beb5818bd01295 Linus Walleij  2014-10-15  223  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
