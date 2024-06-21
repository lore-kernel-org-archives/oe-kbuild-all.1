Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F11B155310
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jun 2024 21:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719006389; cv=none; b=gInpx6tiEwN9PdDpRuLi09LKHY7eWK3AWuyy1lGV5ReS1IFKJiNb31/Ykj0jl0UPzYfHdncnK8RZ5g7ugsm20DZSJgA41Hjq4LE1NjxOgl/YfkyNFV5pu5L2oMobu/X34GAJwK6duoTNhFtqmOo7s+aodlK7xBife0Gf1O7wxVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719006389; c=relaxed/simple;
	bh=jp2QeIhvDriSoFdGP1REYHf9+WpfEDcC9cLmzPEggdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kiHcGYNupuVHCrqS/GKmjNQpYevju6VeSvY5auzZ12ERv5n45aqT/YtoaK/QMUZSqHlqXmNoNRv6OGrKY5GutVnhZicCOzNO/A+yD2d3rl0txFwCVxNpEIN82TZices42LFjd9OHLUzw+ATMvnNG2QygIxl1jRHStAAIFdDJ1ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FvUs9vd+; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FvUs9vd+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719006387; x=1750542387;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jp2QeIhvDriSoFdGP1REYHf9+WpfEDcC9cLmzPEggdQ=;
  b=FvUs9vd+FNFx+tOm6dae0aYALf8KlgC7PiurjL4kUm/MAYbD6YWer4RN
   OSBCBWoXdLukym+QVte+uz5YhiaEVc6/khbVEVdwe5DraQRPF/55K9o3h
   HOAfEkEJ+BaCG2EW6rCwG9pXzsnBBklJ8D31q790WaQYE0iUuhVqsoS1c
   7KrpsZZGoLlfNX+Mk/cNhEifKKJVXqQw+orxrw5kmGxffH22gtF63BhEu
   5Civ/SoX2vXNjPUvClbwV7hKV1dmqIkM99zxeTHcszUE+kMnkCptHwzgQ
   0aL0WXVNx9cuRyq4/xgjxOA9uFe69r5BNmoa9JITlMu9yCM7tUDwYuG9C
   A==;
X-CSE-ConnectionGUID: 7qE3TvBkRwiIx7d9AHuUjw==
X-CSE-MsgGUID: ObY5h7N2TCSUyYwDrstaVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="15887360"
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; 
   d="scan'208";a="15887360"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 14:46:24 -0700
X-CSE-ConnectionGUID: jm+eqIcZTAWDlj0oeRHBOA==
X-CSE-MsgGUID: R++XkHfFTEmCAo0XJN5O8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; 
   d="scan'208";a="42810936"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 Jun 2024 14:46:23 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKm5M-00091i-2x;
	Fri, 21 Jun 2024 21:46:20 +0000
Date: Sat, 22 Jun 2024 05:45:28 +0800
From: kernel test robot <lkp@intel.com>
To: Simon Trimmer <simont@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] ALSA: hda: cs35l56: Select SERIAL_MULTI_INSTANTIATE
Message-ID: <202406220558.BdaR6fk3-lkp@intel.com>
References: <20240619161602.117452-1-simont@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619161602.117452-1-simont@opensource.cirrus.com>

Hi Simon,

kernel test robot noticed the following build errors:

[auto build test ERROR on tiwai-sound/for-next]
[also build test ERROR on v6.10-rc4]
[cannot apply to tiwai-sound/for-linus linus/master next-20240621]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Simon-Trimmer/ALSA-hda-cs35l56-Select-SERIAL_MULTI_INSTANTIATE/20240620-001810
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20240619161602.117452-1-simont%40opensource.cirrus.com
patch subject: [PATCH] ALSA: hda: cs35l56: Select SERIAL_MULTI_INSTANTIATE
config: x86_64-randconfig-016-20240622 (https://download.01.org/0day-ci/archive/20240622/202406220558.BdaR6fk3-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240622/202406220558.BdaR6fk3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406220558.BdaR6fk3-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/platform/x86/serial-multi-instantiate.c: In function 'smi_devs_unregister':
>> drivers/platform/x86/serial-multi-instantiate.c:87:17: error: implicit declaration of function 'i2c_unregister_device'; did you mean 'spi_unregister_device'? [-Werror=implicit-function-declaration]
      87 |                 i2c_unregister_device(smi->i2c_devs[smi->i2c_num]);
         |                 ^~~~~~~~~~~~~~~~~~~~~
         |                 spi_unregister_device
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SERIAL_MULTI_INSTANTIATE
   Depends on [n]: X86_PLATFORM_DEVICES [=n] && I2C [=n] && SPI [=y] && ACPI [=y]
   Selected by [m]:
   - SND_HDA_SCODEC_CS35L56_SPI [=m] && SOUND [=y] && SND [=m] && SND_HDA [=m] && SPI_MASTER [=y] && (ACPI [=y] || COMPILE_TEST [=n]) && SND_SOC [=m]


vim +87 drivers/platform/x86/serial-multi-instantiate.c

35a36cbb7b1ce75 Lucas Tanure    2022-01-21  83  
35a36cbb7b1ce75 Lucas Tanure    2022-01-21  84  static void smi_devs_unregister(struct smi *smi)
35a36cbb7b1ce75 Lucas Tanure    2022-01-21  85  {
ed7adc2b69c6492 Andy Shevchenko 2022-07-10  86  	while (smi->i2c_num--)
ed7adc2b69c6492 Andy Shevchenko 2022-07-10 @87  		i2c_unregister_device(smi->i2c_devs[smi->i2c_num]);
68f201f9061c000 Stefan Binding  2022-01-21  88  
ed7adc2b69c6492 Andy Shevchenko 2022-07-10  89  	while (smi->spi_num--)
ed7adc2b69c6492 Andy Shevchenko 2022-07-10  90  		spi_unregister_device(smi->spi_devs[smi->spi_num]);
68f201f9061c000 Stefan Binding  2022-01-21  91  }
68f201f9061c000 Stefan Binding  2022-01-21  92  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
