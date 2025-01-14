Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564981ACE12
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Jan 2025 16:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736871920; cv=none; b=OArIqdR95cf4BXK0hHyCLC1ahyQ01N8q0rMLgE0aIUixgWcV3Nn1h7RpQtb/bCTHc3RBuF0K2QGeE8YjdP8tThsw7cXkGP18D0vFIQQK5yPi6fba83opVQmeSI8BDESrKqcJY43cmYS3kKu4+FNuHzwGQ988qxYI2I5HgB2HQP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736871920; c=relaxed/simple;
	bh=ENaTye1Us0K+SKIh7ouZI5Mj+hrcxNdyS4GOYYvtQ4w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UEYHov2dfz4+GutkN4ddCh9/D/6gkJiosBkMuZDjrYXnFNWNwVaIb60bIITC9jgyq4Cb1QtAGfXoUy/uvmZwxCDwpVUpRU5jO9FB6860DACQky1YP+0xhw2kExBjLCRM8EU24eRf6me5ofE+uHGgsHQmWqEI4zK7w6M3cV+7ha4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ozp4ygv2; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ozp4ygv2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736871919; x=1768407919;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ENaTye1Us0K+SKIh7ouZI5Mj+hrcxNdyS4GOYYvtQ4w=;
  b=Ozp4ygv2TvMy89tuA0O2+GBQtY8JIQB0rmtkbNr1qoa1LVZg6bossBxI
   dhzfMvvad8lJxnm31qVKV7hcC10tlmUCkSCduwi6ozAFcUBVEnE9P7mDs
   Q69Lg1BQfMObUqX1vmUcd3x3g8ius0rnwvKUTWwhclJ3q23WGMFd83uDK
   5NTOWi+r4ZrG2Mxromak6dAWZ61TGygNN1FVCz/bvNMI4RxD799A5bM9g
   T2T/JOojHYDExgaQcVMLgXtogfvbp0lnX/nb2GxiHBxRlWMl3356/faua
   awz1oTm8rpOFKu5gyIQvb6yzp3sQp6JLC+ZtFezqTyN5id7tnuRm+U6Z/
   g==;
X-CSE-ConnectionGUID: Aw+YfOEKRaCqLoUZDXKHVA==
X-CSE-MsgGUID: 1hp2YLYrREudlZnQCUFZDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="40855026"
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; 
   d="scan'208";a="40855026"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 08:25:19 -0800
X-CSE-ConnectionGUID: 4c9SnNH9SKiglSE47yehjw==
X-CSE-MsgGUID: rQiH1xeARFaoI2/ShRyN6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; 
   d="scan'208";a="105433913"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Jan 2025 08:25:17 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXjj7-000Okd-2u;
	Tue, 14 Jan 2025 16:25:13 +0000
Date: Wed, 15 Jan 2025 00:24:45 +0800
From: kernel test robot <lkp@intel.com>
To: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
	linux-doc@vger.kernel.org
Subject: [xilinx-xlnx:lkp_test 62/504] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/iio/adc/ti,ina260.yaml
Message-ID: <202501150010.ns6hQ1Mk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   283bb161d159afe488329f6d2d8dc2c08e91fa9c
commit: 4622f09ec0ade3749e2465c6a31b2bc7b2c31fad [62/504] drivers: iio: Add support for TI INA260 power monitors
reproduce: (https://download.01.org/0day-ci/archive/20250115/202501150010.ns6hQ1Mk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501150010.ns6hQ1Mk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/iio/adc/ti,ina260.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
