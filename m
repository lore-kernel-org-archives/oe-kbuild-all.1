Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D48614A0A4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Aug 2024 05:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724911130; cv=none; b=iRqFSw1WYWK18IbwZq1d3lLeXEXvocKHUzfaRnABDxD9z8g+QOfwtJwySIC9b8BObc/ovRwBvb2sqdjJjjPbbzOn4aM/8lvqZukqO2QeEjUNUmN0nSTDxono8VlquVOMYP1emgarRvYh+GurTI4gpE4j+ZUzee+sMpqTiqfvFb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724911130; c=relaxed/simple;
	bh=uEA5hvHqxR1KMBA35q6UnHV0Nk6dnBXEZWmOFJsxTcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jcT6Uo5BLLshe19iXk0JeVxOazdlAT/K0zH1qkei2ShB3XzP+WnRaAA2nEJK7OPivInLg8Y5XlyNqiLjmYnuXSt99wq0XPkjM2JDVnEjKJaV55nvqMY4uW2+EHliAiOYJonDdoep8LQ43ltmfMydXkV8jukG52QxL6Ot4f+EDAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EfI8M/HV; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EfI8M/HV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724911128; x=1756447128;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uEA5hvHqxR1KMBA35q6UnHV0Nk6dnBXEZWmOFJsxTcc=;
  b=EfI8M/HVjZrETxFSiQgguWPPKXw6g9jsYPUSLJKaIY/Ivz6gDlgWGedw
   Yedjpj5Avsk6CReTl3aDmhAutnQpdORHlqzXaECPQ/gIfhdbUkT0F9O2O
   jf8tJksKyLH2WXqVO9eGCyYLR4JgVktd9rLXXt228MxZbA0kqpfKf9T3A
   SnzlCPOy3ZMsKsnOm5dHSDzW1DQqu7vpB7gPIJSGBOiUBOOQuG2AkOme+
   qZhivgswvIJDutxDrHbwpyLb3vaExp5UYmYI4Z8QgI2PpQJL7cgQ7h/O1
   hlHc8oGJrLO9EzngMw1bdBH0wCSOsnpkDVMKA8IBNM2vWP3Ce3VogYNsM
   Q==;
X-CSE-ConnectionGUID: cZnlfZedSAuO84FhxVSS/w==
X-CSE-MsgGUID: l4rEcSKRQGmGG/ta2CiObQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="34051020"
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="34051020"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 22:58:48 -0700
X-CSE-ConnectionGUID: 8wWKYWYrTFWvXIWtrWPhOQ==
X-CSE-MsgGUID: l9mjFe56QPWSsb1LAz2m3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="86677178"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Aug 2024 22:58:46 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjYBA-000Ll0-1j;
	Thu, 29 Aug 2024 05:58:44 +0000
Date: Thu, 29 Aug 2024 13:58:38 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] thermal/of: Use thermal_zone_device_param
Message-ID: <202408291304.WuuHeKea-lkp@intel.com>
References: <20240823154245.1553458-2-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823154245.1553458-2-daniel.lezcano@linaro.org>

Hi Daniel,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/thermal]
[also build test ERROR on linus/master v6.11-rc5 next-20240828]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Lezcano/thermal-of-Use-thermal_zone_device_param/20240826-151207
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git thermal
patch link:    https://lore.kernel.org/r/20240823154245.1553458-2-daniel.lezcano%40linaro.org
patch subject: [RFC PATCH 2/2] thermal/of: Use thermal_zone_device_param
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240829/202408291304.WuuHeKea-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240829/202408291304.WuuHeKea-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408291304.WuuHeKea-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/thermal/thermal_of.c: In function 'thermal_of_zone_register':
>> drivers/thermal/thermal_of.c:492:31: error: 'trips' undeclared (first use in this function)
     492 |                 ret = PTR_ERR(trips);
         |                               ^~~~~
   drivers/thermal/thermal_of.c:492:31: note: each undeclared identifier is reported only once for each function it appears in


vim +/trips +492 drivers/thermal/thermal_of.c

3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  451  
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  452  /**
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  453   * thermal_of_zone_register - Register a thermal zone with device node
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  454   * sensor
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  455   *
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  456   * The thermal_of_zone_register() parses a device tree given a device
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  457   * node sensor and identifier. It searches for the thermal zone
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  458   * associated to the couple sensor/id and retrieves all the thermal
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  459   * zone properties and registers new thermal zone with those
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  460   * properties.
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  461   *
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  462   * @sensor: A device node pointer corresponding to the sensor in the device tree
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  463   * @id: An integer as sensor identifier
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  464   * @data: A private data to be stored in the thermal zone dedicated private area
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  465   * @ops: A set of thermal sensor ops
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  466   *
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  467   * Return: a valid thermal zone structure pointer on success.
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  468   *	- EINVAL: if the device tree thermal description is malformed
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  469   *	- ENOMEM: if one structure can not be allocated
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  470   *	- Other negative errors are returned by the underlying called functions
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  471   */
ac614a9b4c35bf Daniel Lezcano      2023-04-04  472  static struct thermal_zone_device *thermal_of_zone_register(struct device_node *sensor, int id, void *data,
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  473  							    const struct thermal_zone_device_ops *ops)
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  474  {
698a1eb1f75eb6 Rafael J. Wysocki   2024-02-22  475  	struct thermal_zone_device_ops of_ops = *ops;
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  476  	struct thermal_zone_device *tz;
5313e239ab6b58 Daniel Lezcano      2024-08-23  477  	struct thermal_zone_params tzp = { .devdata = data, .ops = &of_ops };
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  478  	struct device_node *np;
62e79e38b257a5 Fabio Estevam       2023-11-29  479  	const char *action;
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  480  	int ret;
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  481  
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  482  	np = of_thermal_zone_find(sensor, id);
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  483  	if (IS_ERR(np)) {
9d6792df07367a Daniel Lezcano      2022-08-09  484  		if (PTR_ERR(np) != -ENODEV)
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  485  			pr_err("Failed to find thermal zone for %pOFn id=%d\n", sensor, id);
698a1eb1f75eb6 Rafael J. Wysocki   2024-02-22  486  		return ERR_CAST(np);
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  487  	}
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  488  
5313e239ab6b58 Daniel Lezcano      2024-08-23  489  	tzp.trips = thermal_of_trips_init(np, &tzp.num_trips);
5313e239ab6b58 Daniel Lezcano      2024-08-23  490  	if (IS_ERR(tzp.trips)) {
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  491  		pr_err("Failed to find trip points for %pOFn id=%d\n", sensor, id);
662b52b761bfe0 Krzysztof Kozlowski 2024-08-14 @492  		ret = PTR_ERR(trips);
662b52b761bfe0 Krzysztof Kozlowski 2024-08-14  493  		goto out_of_node_put;
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  494  	}
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  495  
5313e239ab6b58 Daniel Lezcano      2024-08-23  496  	ret = thermal_of_monitor_init(np, &tzp.polling_delay, &tzp.passive_delay);
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  497  	if (ret) {
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  498  		pr_err("Failed to initialize monitoring delays from %pOFn\n", np);
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  499  		goto out_kfree_trips;
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  500  	}
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  501  
ac4436a5b20e0e Ahmad Fatoum        2023-07-08  502  	thermal_of_parameters_init(np, &tzp);
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  503  
698a1eb1f75eb6 Rafael J. Wysocki   2024-02-22  504  	of_ops.bind = thermal_of_bind;
698a1eb1f75eb6 Rafael J. Wysocki   2024-02-22  505  	of_ops.unbind = thermal_of_unbind;
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  506  
62e79e38b257a5 Fabio Estevam       2023-11-29  507  	ret = of_property_read_string(np, "critical-action", &action);
62e79e38b257a5 Fabio Estevam       2023-11-29  508  	if (!ret)
698a1eb1f75eb6 Rafael J. Wysocki   2024-02-22  509  		if (!of_ops.critical && !strcasecmp(action, "reboot"))
698a1eb1f75eb6 Rafael J. Wysocki   2024-02-22  510  			of_ops.critical = thermal_zone_device_critical_reboot;
62e79e38b257a5 Fabio Estevam       2023-11-29  511  
5313e239ab6b58 Daniel Lezcano      2024-08-23  512  	tz = thermal_zone_device_register(np->name, &tzp);
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  513  	if (IS_ERR(tz)) {
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  514  		ret = PTR_ERR(tz);
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  515  		pr_err("Failed to register thermal zone %pOFn: %d\n", np, ret);
ac4436a5b20e0e Ahmad Fatoum        2023-07-08  516  		goto out_kfree_trips;
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  517  	}
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  518  
662b52b761bfe0 Krzysztof Kozlowski 2024-08-14  519  	of_node_put(np);
5313e239ab6b58 Daniel Lezcano      2024-08-23  520  	kfree(tzp.trips);
9b0a62758665e4 Rafael J. Wysocki   2024-02-22  521  
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  522  	ret = thermal_zone_device_enable(tz);
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  523  	if (ret) {
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  524  		pr_err("Failed to enabled thermal zone '%s', id=%d: %d\n",
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  525  		       tz->type, tz->id, ret);
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  526  		thermal_of_zone_unregister(tz);
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  527  		return ERR_PTR(ret);
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  528  	}
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  529  
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  530  	return tz;
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  531  
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  532  out_kfree_trips:
5313e239ab6b58 Daniel Lezcano      2024-08-23  533  	kfree(tzp.trips);
662b52b761bfe0 Krzysztof Kozlowski 2024-08-14  534  out_of_node_put:
662b52b761bfe0 Krzysztof Kozlowski 2024-08-14  535  	of_node_put(np);
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  536  
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  537  	return ERR_PTR(ret);
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  538  }
3fd6d6e2b4e80f Daniel Lezcano      2022-08-05  539  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
