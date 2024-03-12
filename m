Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B35382
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Mar 2024 20:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710276023; cv=none; b=uvbm7Q85Ojdkji+MI+Jwloj17exlJ2JXJc5jRT/sc71MWbFTAc20ikf4x9XCeWDYOxcnenLeKazwlYDkhqCUMzxqqLD5F2pe3zhOu8/eC4Hv7L/+AZgeCPNhI6n43AsJI/qMYSKu2DuHWBXmGTV0zTCchgaQks/l0OAjV8mhezI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710276023; c=relaxed/simple;
	bh=KFCJtRKAi0zk1gzXgwIIxSo4kIyugqbpcDt1rzk7MBI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fp6X5UvJMBZPuI2yfZG9FPw6JOzKqjK4Ep+oUjGXeR9k3JlAlhRw2C3Lus4bfNd0pQAXaSuTY91qVprHJFcpiPFM0dcnTJ0uDKx4JPtsayfhE/O/h16OppwijjSl97MhnYDxsyvbEXqLmFaApJcYqGDNnp8OadVPZJg59mssSOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VH3YwNcm; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VH3YwNcm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710276021; x=1741812021;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KFCJtRKAi0zk1gzXgwIIxSo4kIyugqbpcDt1rzk7MBI=;
  b=VH3YwNcmDz7ljxhcw62q5KyhiRtIMHuVZEBxOwFQ68NgcQ9RXXrKsPel
   eCwNsj8KhnJihWsgTKhtiaAcWdM1+Izk5TShNBpzPyAt9jwPTsQXPR7vr
   dQXHGNojeG2YxhXO0VXMfmHFVonFpcj7FQC/Z32mDuwa86PAXZQCgFSd2
   4hV4QsyTN1qiDB+S7AXIT+rMBF95KzCh5CtCVMCLCwKq8bOCAngCL20/3
   u/1huXePwDmfGBbsG9jce8rZtOkw9wp+Iyk544xYs5wlxmaxiA2SonG82
   /dsKu6wGTFK5UA1Jcc8dIhJgZ6fvR6cZOvOaR1On+gYADjaqvCtcW8R3M
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="27486585"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="27486585"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 13:40:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16397901"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Mar 2024 13:40:20 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rk8v3-000BeR-1h;
	Tue, 12 Mar 2024 20:40:17 +0000
Date: Wed, 13 Mar 2024 04:39:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 7750/29228] kismet: WARNING: unmet
 direct dependencies detected for GPIOLIB_IRQCHIP when selected by
 PINCTRL_MSM
Message-ID: <202403130433.8cyVQOzC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   d24801ee88749d3bff9f942f228c42a76d4edc48
commit: 5edcc7517c2a97a1bf87fbe00aab8321c760f11a [7750/29228] ANDROID: pinctrl: qcom: Allow pinctrl-msm code to be loadable as a module
config: i386-kismet-CONFIG_GPIOLIB_IRQCHIP-CONFIG_PINCTRL_MSM-0-0 (https://download.01.org/0day-ci/archive/20240313/202403130433.8cyVQOzC-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240313/202403130433.8cyVQOzC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403130433.8cyVQOzC-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP when selected by PINCTRL_MSM
   
   WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP
     Depends on [n]: GPIOLIB [=n]
     Selected by [y]:
     - PINCTRL_MSM [=y] && PINCTRL [=y] && (ARCH_QCOM || COMPILE_TEST [=y])
   
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
