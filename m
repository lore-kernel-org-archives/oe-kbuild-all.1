Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D233618EFC4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jul 2024 22:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722290948; cv=none; b=oXUS3QeAMt4BK0DA45f3JCo8PTXgRRMTlVuuIOU1pH1qhfvROmbiYrfU+KPOtzy9c6JsR/BqniPsktkP78gTb5AgsSAC/imcCAqmgRzZ/m0mc3Spprq9Z78tpe3qjApDRvxb7P0Wi0MjfNSbHyJp4RKGdX+f1OqiR8A94SmPdiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722290948; c=relaxed/simple;
	bh=5EsNrrwKY+GPlDlyqRxWHNHxgmXidoOjeIgSh1hwPxg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jvwCxI2GN0M4e/EB7lvT+ZytKF0h+gcEMGyvKPglwJpYvKPQajyXfOLz8cYAzfKbLU6S1/9u+AYM9YbHCmkNp9zXFw/zutRKKaSSB8xOz5/bxafbfM0of4tyLxjPQcvKSDnNVgWYvubmU2Jb6qmhkWUcaO4R+M7qOTjXxlqwtEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gKfaT1im; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gKfaT1im"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722290947; x=1753826947;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5EsNrrwKY+GPlDlyqRxWHNHxgmXidoOjeIgSh1hwPxg=;
  b=gKfaT1im3tB9TPyV2Nq9XeaENLN5VvwYWBaA0sHWgCWfM5+vHgGcKCuY
   SsfnBPIg4XJSQ8LnzWNs7bsLYrIROZXO4+pcc0LOqR08n/H+hvuiQTvQk
   sJ9Fvn0B5BXwfY9DsBVlq25t0XYxQdu65DwSL2nQAByuCRXyQZ7UVYis5
   LdNq6yul02P6kI56IBvHFzkeIJhB3WlzB6Ttu/QOQn3OjYIFh5I2ITFX7
   QR5BckTAvlraRIQ0USKIbk+ysnHVepDgmsiiQUwS/ZuYNgkEhEcyGDu72
   /oonf3VxP+g1WC/Bq/DQXaK7wWVYQPa2nqNVfZE+Q+pJjp6BJdAtjzefV
   Q==;
X-CSE-ConnectionGUID: d8du2mejQriGCkwlwfo9FA==
X-CSE-MsgGUID: B/6sK4hPQ0Sc1n0OuXtS1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="23831003"
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="23831003"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 15:09:06 -0700
X-CSE-ConnectionGUID: vIdpWbYzRrO2FON++ogkZA==
X-CSE-MsgGUID: MxpkOvnlT+GQbn4TeijOWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="54084654"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 Jul 2024 15:09:05 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYYYA-000s7V-1O;
	Mon, 29 Jul 2024 22:09:02 +0000
Date: Tue, 30 Jul 2024 06:08:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kamlesh Gurudasani <kamlesh@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>
Subject: [ti:ti-linux-6.6.y-wip 107/137] kismet: WARNING: unmet direct
 dependencies detected for CRYPTO_CRC64_ISO3309 when selected by
 CRYPTO_DEV_TI_MCRC64
Message-ID: <202407300541.Yw9winHT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.6.y-wip
head:   6de6e418c80edfbe08f4a5f851c721bd60c0123b
commit: 2af1725d4bd6b8b24a1a2b47e1de27949d1cee9b [107/137] crypto: ti - add driver for MCRC64 engine
config: x86_64-kismet-CONFIG_CRYPTO_CRC64_ISO3309-CONFIG_CRYPTO_DEV_TI_MCRC64-0-0 (https://download.01.org/0day-ci/archive/20240730/202407300541.Yw9winHT-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240730/202407300541.Yw9winHT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407300541.Yw9winHT-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CRYPTO_CRC64_ISO3309 when selected by CRYPTO_DEV_TI_MCRC64
   WARNING: unmet direct dependencies detected for CRYPTO_CRC64_ISO3309
     Depends on [n]: CRYPTO [=y] && CRC64 [=n]
     Selected by [y]:
     - CRYPTO_DEV_TI_MCRC64 [=y] && CRYPTO [=y] && CRYPTO_HW [=y] && (ARCH_K3 || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
