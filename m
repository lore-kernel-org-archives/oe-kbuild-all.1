Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAFF29CE7
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 13:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727877161; cv=none; b=YlLu7nxPr00lnQY8+Y4QAgr3OGdiPo3yywgVPqDjt41GKPxkLsh4iPQhVDP/jvx8NKLJ/W4qTn1/fe3r0kCErC6EkZbtrs4BImt8wH63JFofPwP0ylYU5V6OSo4bpnzsxrMrzs4zkckaAqPagNvwZ0W0faRINbuiQ8uIc6IJjGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727877161; c=relaxed/simple;
	bh=2mAPNHEf3uCjOhipIttkFNMoBJZKgNDwCYhgVB9LLk4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K4jHUzNXIOJ3wM+adj/BKxymI85uIld08koaQcTHfn6gUDsBJFJHEPkrqcvl8KKus6cgV5jUAwrBRS3APhlwc7uvR+y7+oZ5I4Mo6nNYqjtaH1DFfSZWqRMlZmKpmEFIaXlkcxYdsP8jCUBanVekANoXk8EZZFQzu5NpObTrJ14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gMyH/oQ+; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gMyH/oQ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727877158; x=1759413158;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2mAPNHEf3uCjOhipIttkFNMoBJZKgNDwCYhgVB9LLk4=;
  b=gMyH/oQ+JnQzin9vw7+DimIDcOdI0n+p9R1rZ+NSuQrU6/HAygU6cnjZ
   kLeCSePHAeR6ZMUAVnYg87tu13GHI2k72vAtCxy5MqJW/TLIaTrGrDDE5
   nSJQOuKgK53EPaBhjbtxX7DnRA4iMlkGQXKfLheOvFXZ8IRD8hfq4mmHG
   xmPTMpBCVV+eL2GPrvow3ONwm1KvTZKDlXM8tucU8+oqQbW8SD4Y2Q6YN
   phAkV/M6e135Y/jL8zsc6G3O13nVZCX83iafKIwOBptq9WMcTR8Bjj5L+
   qQ2Z6dRvgPnSDnwYrMtwkhtbk3O+MBU3/AHkc4YrPDj+M+Bwkzr28ewJH
   Q==;
X-CSE-ConnectionGUID: pfieq2l7RNqzO/QIX71YbQ==
X-CSE-MsgGUID: 4CkvO2FqQsm+9YCfHfL/SA==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="37596550"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="37596550"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 06:52:38 -0700
X-CSE-ConnectionGUID: chLtL1YwTs2Br/vgte8RYQ==
X-CSE-MsgGUID: 0AM8P1aPRmufmh/OYWiE7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="74314091"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 02 Oct 2024 06:52:37 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svzmM-000Sku-38;
	Wed, 02 Oct 2024 13:52:34 +0000
Date: Wed, 2 Oct 2024 21:52:10 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [linux-next:master 789/2025] kismet: WARNING: unmet direct
 dependencies detected for DRM_BRIDGE_CONNECTOR when selected by DRM_IMX_LDB
Message-ID: <202410022137.VvHkv4N6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fe21733536749bb1b31c9c84e0b8d2ab8d82ce13
commit: f673055a46784ccea04465b9213e999f7bc5187e [789/2025] drm/imx: Add missing DRM_BRIDGE_CONNECTOR dependency
config: x86_64-kismet-CONFIG_DRM_BRIDGE_CONNECTOR-CONFIG_DRM_IMX_LDB-0-0 (https://download.01.org/0day-ci/archive/20241002/202410022137.VvHkv4N6-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241002/202410022137.VvHkv4N6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410022137.VvHkv4N6-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_BRIDGE_CONNECTOR when selected by DRM_IMX_LDB
   WARNING: unmet direct dependencies detected for DRM_BRIDGE_CONNECTOR
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_DISPLAY_HELPER [=n]
     Selected by [y]:
     - DRM_IMX_LDB [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_IMX [=y] && COMMON_CLK [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
