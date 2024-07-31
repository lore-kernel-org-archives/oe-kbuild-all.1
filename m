Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401203AC36
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jul 2024 17:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722448739; cv=none; b=D5n4eg6E8lUVErqo3MEbVnCpVXtMzitMDT76p8JAjksxdaATJXTB/5AJ5AmB5gGShjb0ewozfY4s2+9QyJldTJg9SDdSAa8phaKY4P+xaFDXK5r4QAUHp3PmrmJ3+hhjg0zGWAZmfmsoCw6U4pgSETWRw2xUN0jMN0RiitEeAMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722448739; c=relaxed/simple;
	bh=dB7F/4syqFoBtfnHnfAcCoqz1SCvMHO7LE6eT6nWs8k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kD5Z+6sSJhBFPNwDGCCf1Nknj3hATaQCUOPywGUUZSDFqx+cYX+X+/nu3jQk59AK43Wrvd9fiDn6z73ZnJcU0mF6pWnXh/PL30EZ4xHNZzxq0XqlLRN1z7XHFsPZUo7Q7VkJKvc6GP40SRAdZIPfHOcp6yehNFPNKgbDXF1JGcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CU+kmXz2; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CU+kmXz2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722448737; x=1753984737;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dB7F/4syqFoBtfnHnfAcCoqz1SCvMHO7LE6eT6nWs8k=;
  b=CU+kmXz2rHpo7j6li3Sy6zd/IWR31xFTQxypM84eIiYs2C3y89474DKU
   x+f7VFFiAgNIR3C/ZfqLJ790LyQNqiGBVFyJXKHmvoF27D45+AEqzsJN2
   uIt5RQF7pmkr5lflCQquLvfkWQnfnc0YoC+jDVaUDDoBdyhh+KNQ2hWtr
   CpmJP+K2UZOi7zNgC5FG/bmXooGRop2uOfBCE0lIcb5Z1xqaTWvIymlxO
   ocbko7KMJyeqklYRUlBJHidureKH6aMWisIVGENoELZ8Wa/lVpniJWRnv
   gaskZ8U7OyHP1DifhBC0I0YRSZoiNLfbZO7SPk2Al0jqhFq76gMfpCund
   g==;
X-CSE-ConnectionGUID: FwTsU6X+RZqVhqwVHozOCA==
X-CSE-MsgGUID: NqKwTXaFSVWvhfsQTJ4dPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="31740427"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="31740427"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 10:58:57 -0700
X-CSE-ConnectionGUID: FRgKMhlLTLmy2XlLt6TbCQ==
X-CSE-MsgGUID: Pp9NSZCPQ5Gi81tiM8ndgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="59597255"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 31 Jul 2024 10:58:55 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZDbA-000ugm-25;
	Wed, 31 Jul 2024 17:58:52 +0000
Date: Thu, 1 Aug 2024 01:58:32 +0800
From: kernel test robot <lkp@intel.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-acpi@vger.kernel.org,
	devel@acpica.org, linux-pm@vger.kernel.org
Subject: [rafael-pm:thermal-core-testing 2/28]
 drivers/thermal/hisi_thermal.c:484:29: warning: unused variable 'trip'
Message-ID: <202408010134.hozVfGEo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git thermal-core-testing
head:   c213ec5d265075e670b175f577fc30f12c2bf093
commit: 09a7303648169c6d8c5f2608b0764a7095a15c21 [2/28] thermal: hisi: Use thermal_zone_for_each_trip() in hisi_thermal_register_sensor()
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20240801/202408010134.hozVfGEo-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240801/202408010134.hozVfGEo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408010134.hozVfGEo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/thermal/hisi_thermal.c: In function 'hisi_thermal_register_sensor':
>> drivers/thermal/hisi_thermal.c:484:29: warning: unused variable 'trip' [-Wunused-variable]
     484 |         struct thermal_trip trip;
         |                             ^~~~
>> drivers/thermal/hisi_thermal.c:483:18: warning: unused variable 'i' [-Wunused-variable]
     483 |         int ret, i;
         |                  ^


vim +/trip +484 drivers/thermal/hisi_thermal.c

09a7303648169c Rafael J. Wysocki 2024-07-29  479  
9a5238a9c6c33d kongxinwei        2015-05-20  480  static int hisi_thermal_register_sensor(struct platform_device *pdev,
a160a465297362 Kevin Wangtao     2017-10-22  481  					struct hisi_thermal_sensor *sensor)
9a5238a9c6c33d kongxinwei        2015-05-20  482  {
9a5238a9c6c33d kongxinwei        2015-05-20 @483  	int ret, i;
68a306cc839718 Daniel Lezcano    2022-10-03 @484  	struct thermal_trip trip;
9a5238a9c6c33d kongxinwei        2015-05-20  485  
5ee7811e9afa4f Daniel Lezcano    2022-08-05  486  	sensor->tzd = devm_thermal_of_zone_register(&pdev->dev,
49e778d1c750d5 Daniel Lezcano    2018-09-25  487  						    sensor->id, sensor,
81d7cb7946f03d Daniel Lezcano    2017-10-19  488  						    &hisi_of_thermal_ops);
9a5238a9c6c33d kongxinwei        2015-05-20  489  	if (IS_ERR(sensor->tzd)) {
9a5238a9c6c33d kongxinwei        2015-05-20  490  		ret = PTR_ERR(sensor->tzd);
439dc96811739a Leo Yan           2016-03-29  491  		sensor->tzd = NULL;
9a5238a9c6c33d kongxinwei        2015-05-20  492  		dev_err(&pdev->dev, "failed to register sensor id %d: %d\n",
9a5238a9c6c33d kongxinwei        2015-05-20  493  			sensor->id, ret);
9a5238a9c6c33d kongxinwei        2015-05-20  494  		return ret;
9a5238a9c6c33d kongxinwei        2015-05-20  495  	}
9a5238a9c6c33d kongxinwei        2015-05-20  496  
09a7303648169c Rafael J. Wysocki 2024-07-29  497  	thermal_zone_for_each_trip(sensor->tzd, hisi_trip_walk_cb, sensor);
9a5238a9c6c33d kongxinwei        2015-05-20  498  
9a5238a9c6c33d kongxinwei        2015-05-20  499  	return 0;
9a5238a9c6c33d kongxinwei        2015-05-20  500  }
9a5238a9c6c33d kongxinwei        2015-05-20  501  

:::::: The code at line 484 was first introduced by commit
:::::: 68a306cc839718d1875b46ebf73c25c8fa7f704a thermal/drivers/hisi: Use generic thermal_zone_get_trip() function

:::::: TO: Daniel Lezcano <daniel.lezcano@linaro.org>
:::::: CC: Daniel Lezcano <daniel.lezcano@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
