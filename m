Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C2C1C3F14
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Sep 2024 15:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726413171; cv=none; b=BiBeLxlLh5JyKz426BKJIGXIJ5CpvBVM+r8/WJkkpqeJQQIrBCfpVki77bUOvjMhgGTw8uRjWl6cB/vSTVXiZVs36cG0NZ0id5taIgXqAqkg8YTfS8gFi3EAteXFkSwmYdlGoPjlxJIjjKBPYj/v1ADK/xZpy4DnZ5RcLTXDtHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726413171; c=relaxed/simple;
	bh=ylNvNvRlcYKjJFmvCuOARWHFuYbIvLppGjnAg8N+cRE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b0Mx9r24R+E5ab9Gwfrwp9mOzxYy6P5wv23cvohCu9n9XzsiVxY3TJKuOs4vbumz384HnKOZuEplI8faO6yqdmq1PDUVJpgQzO2MVsEzefPB7k76f9nUfIsIrcnOWqM9pEiy43op7TXzPjEH7btHh91bTk+arlMa38aDgL6Njfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lbEvV1UN; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lbEvV1UN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726413169; x=1757949169;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ylNvNvRlcYKjJFmvCuOARWHFuYbIvLppGjnAg8N+cRE=;
  b=lbEvV1UNj6Pq1mOPMkWylflWoUexNT4AzhloMCexgeKQI5zslF7JCJN+
   6Zd0EqLV7WUoMrYgskGtYCt1lH87VA0eXf4RRTfVjJ36Y3YSQ3fykkO1U
   DJcfZcfaByx9tgTCSL6YdsTqBguzXPW9diYfqw4yMpGTTeFTTXSVe9Rpk
   WGesoMRBNmgHGWMi1NxhKk/ZlzB9jhkG6mTQqtdE8K+Y8cA84RlLWPLWM
   wCU1D2ahulgdQ80zzhkZHGIig86S26cZNJo/C4C1cp4+5sZ/DyC6cFspb
   NPGh67LoiDr9NKtAUbBSqcR2UfWAF0PVKc5c1TCZcvVOsktl84l3Cabtf
   g==;
X-CSE-ConnectionGUID: 2GzGlzroSZSx7ATDijnK8Q==
X-CSE-MsgGUID: dD3ecqTdRVqttLAIA6Gskw==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="36393811"
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="36393811"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 08:12:49 -0700
X-CSE-ConnectionGUID: AiP7OEdXQiaS8PjFYxxGXQ==
X-CSE-MsgGUID: Q3ol2xpBSOOzcYkv7SGbxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="68514160"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 15 Sep 2024 08:12:49 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spqvd-0008le-2m;
	Sun, 15 Sep 2024 15:12:45 +0000
Date: Sun, 15 Sep 2024 23:11:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 1/1] ld.lld: error: undefined symbol:
 acc_ctrlrequest_composite
Message-ID: <202409152304.93SLSv4q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   7b9f6a0ecd235bca2b4329476f817a6182ea8d8a
commit: e12e360999d84e5e56952c6c027803f662567d76 [1/1] ANDROID: usb: f_accessory: Check buffer size when initialised via composite
config: x86_64-randconfig-r131-20240914 (https://download.01.org/0day-ci/archive/20240915/202409152304.93SLSv4q-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240915/202409152304.93SLSv4q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409152304.93SLSv4q-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: acc_ctrlrequest_composite
   >>> referenced by configfs.c:1575 (drivers/usb/gadget/configfs.c:1575)
   >>>               usb/gadget/configfs.o:(android_setup) in archive drivers/built-in.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
