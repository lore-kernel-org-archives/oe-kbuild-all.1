Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A928F5B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Jul 2025 07:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752304572; cv=none; b=Q0ymCCXWjgiW2sFCKOZbG4qhM4Ary47nUUpjF1tiwpDuIrM2N1nWG4GVKpNeEj9CFChUiR53xw3GRzEeVp4eMWc6yma/Azx7kLZmaYQC1yPgl7fGnfmmvmlImlCsqeyFJkVuN6bEz4AV25fVToT5UOEs7EFnyUZU98IJsTEX7OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752304572; c=relaxed/simple;
	bh=ccUGgpTtBWfx37KY/Uzcs3cK27ss52L0tc5huxtF148=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lMlQ/ctGuJnCyw+0UO1tujonJik2onzpBhKkTuIzwOzR8VjVOfEJpJhucn3JHj99sX6P2WmmokT6yiplPwogw0EQVvP9V5bDUqh7bC4rK/mn0401hFRlB+1iYP2v2698HEIIGXwqwQem6ybevdkX7w2EEhnZsLpaYiWr+UmiDkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dcKcrLCt; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dcKcrLCt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752304570; x=1783840570;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ccUGgpTtBWfx37KY/Uzcs3cK27ss52L0tc5huxtF148=;
  b=dcKcrLCtoV0/z8kTuzS+L6qzqBdIGsykoc+ihdAFt5BLye/Lr+aWJ7pA
   h/RNuJGrqRMpmR/NUyaoaUhiegf/ePJZ9PhEteDKt+BTLbL244V0BQBRa
   imwv2UmFP+n5ekNFdl1bzbr8rNy4c80Sr49vLGkwlaId0uxdG1rjZt5cT
   gdlknOkIfKCZ/62zwGWdjxh/3rcp4gTXoYnFHEwdIkCP53p4sNYQDZG9W
   XpRzLUPRY0hZSW9S3+V94P/NVzcidV7mz/xN6VbJz/VnIR/HfWRq3VGYp
   Dnuo6XL7SyElTITiVZQsx4X2pqr+HGQP0E79ECvvuw2yHQXg+dnX6QJu0
   A==;
X-CSE-ConnectionGUID: mFyHYvbmRGWf9+HbTZUhXA==
X-CSE-MsgGUID: 7wXj87MXQveDU9uAjiubQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65939817"
X-IronPort-AV: E=Sophos;i="6.16,306,1744095600"; 
   d="scan'208";a="65939817"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2025 00:16:09 -0700
X-CSE-ConnectionGUID: duN+jBTASt+t5WOj8eGv0A==
X-CSE-MsgGUID: HtwRbzoGR0uOqn9NWLOJ9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,306,1744095600"; 
   d="scan'208";a="157255921"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Jul 2025 00:16:09 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uaUSt-00078F-0N;
	Sat, 12 Jul 2025 07:16:07 +0000
Date: Sat, 12 Jul 2025 15:16:00 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v3 2/4] kernel/api: enable kerneldoc-based API
 specifications
Message-ID: <202507121502.xau4FnHY-lkp@intel.com>
References: <20250711114248.2288591-3-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711114248.2288591-3-sashal@kernel.org>

Hi Sasha,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on uml/next]
[also build test WARNING on uml/fixes tip/x86/core masahiroy-kbuild/for-next masahiroy-kbuild/fixes akpm-mm/mm-everything tip/sched/core linus/master v6.16-rc5 next-20250711]
[cannot apply to arnd-asm-generic/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sasha-Levin/kernel-api-introduce-kernel-API-specification-framework/20250711-194622
base:   https://git.kernel.org/pub/scm/linux/kernel/git/uml/linux next
patch link:    https://lore.kernel.org/r/20250711114248.2288591-3-sashal%40kernel.org
patch subject: [RFC v3 2/4] kernel/api: enable kerneldoc-based API specifications
config: i386-buildonly-randconfig-002-20250712 (https://download.01.org/0day-ci/archive/20250712/202507121502.xau4FnHY-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250712/202507121502.xau4FnHY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507121502.xau4FnHY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: sound/soc/samsung/pcm.c:131 struct member 'lock' not described in 's3c_pcm_info'
--
>> Warning: sound/soc/fsl/fsl_esai.c:83 struct member 'lock' not described in 'fsl_esai'
--
>> Warning: sound/soc/stm/stm32_spdifrx.c:248 struct member 'lock' not described in 'stm32_spdifrx_data'
--
>> Warning: drivers/iio/temperature/mlx90632.c:162 struct member 'lock' not described in 'mlx90632_data'
--
>> Warning: drivers/iio/temperature/mlx90635.c:133 struct member 'lock' not described in 'mlx90635_data'
--
>> Warning: drivers/virtio/virtio_rtc_driver.c:37 struct member 'lock' not described in 'viortc_vq'
>> Warning: drivers/virtio/virtio_rtc_driver.c:1137 function parameter 'lock' not described in 'viortc_populate_vq'
--
>> Warning: drivers/iio/magnetometer/ak8974.c:201 struct member 'lock' not described in 'ak8974'
--
>> Warning: kernel/locking/qrwlock.c:21 function parameter 'lock' not described in 'queued_read_lock_slowpath'
>> Warning: kernel/locking/qrwlock.c:66 function parameter 'lock' not described in 'queued_write_lock_slowpath'
--
>> Warning: kernel/locking/qspinlock.c:130 function parameter 'lock' not described in 'queued_spin_lock_slowpath'
--
>> Warning: drivers/gpio/gpio-graniterapids.c:66 struct member 'lock' not described in 'gnr_gpio'
--
>> Warning: drivers/iio/dac/ad5758.c:121 struct member 'lock' not described in 'ad5758_state'
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
