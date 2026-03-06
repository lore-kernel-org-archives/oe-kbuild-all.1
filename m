Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843AB3264E1
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Mar 2026 09:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772787925; cv=none; b=U4z3T58TYOsjPtkWJPTpc54/LDJfMVVIRq0t96k5973P+TvB4/8NzR99gQkJHdS4iYmKdhMoFN/xRbRZ57Wyz3zPIf1FuYJhbqZtBgHKWYCiC281kxG/YCTb0zberqw6PdJl0jo1wHrhyE9CnXvfW3hS016niCeryV51MTQs+Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772787925; c=relaxed/simple;
	bh=+MVNDScja2NjTaUpS3g72F2KcN8FDp5DYRdazStMIEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cEnAExKJms9OgCOTuH78GtrwXNK9QdsNbGkhoXqSOJQpLNMcNaR0ivNc3x9xMV9yjrd1F+Htl6iKtsvPGcniVa2jL0ipvN+PW08ySjb0j8ar4iXYsTQOFPW0m/Z8oz44HbfVTtoipJHAXXlLIq1jb77UC+1cj7/0II7q0yO1P1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MqXgGnAh; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MqXgGnAh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772787923; x=1804323923;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+MVNDScja2NjTaUpS3g72F2KcN8FDp5DYRdazStMIEM=;
  b=MqXgGnAhd+vhJZy9E93oor4y3lWU7EiPhlrFhUwY6L6BBseNyzgrot02
   TqVmFVS7+JTnDSwqpUJ5SPL4vcc4QD9sRqiuiO3WQg14cvYuhwYfkdIzr
   rSzkIitYVCmRCNZi2shmhqvWpRhlMxg+6cBbWubJzYmKEU3LFnGQOENw8
   W5kH+z2feroqPWlYqDFumITTa1UJlgIwh3IgfJxDgNQhkJocPFUYNufwv
   QdR+nsunhDNuFXRtqsVj5n2N9y8tHY9bX0ysiC/vCAs/QfPkU9LUmsiZa
   6i9bmTpObpavdBOhKHRHmpOKNtVC42pEhpkJ1RGDYlsqB3CrfC3ZdC/nO
   w==;
X-CSE-ConnectionGUID: AZoUkVvKS2eLrakmaQ7KVg==
X-CSE-MsgGUID: yOX2S/BgSnepzNdG7Xgv5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="61465868"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="61465868"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 01:05:22 -0800
X-CSE-ConnectionGUID: GcVEm6NdSYa8B4rzR+Z3FQ==
X-CSE-MsgGUID: GdO2O8iSSEySjynzQGOdjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="218904774"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Mar 2026 01:05:20 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyR7U-000000000cD-3d8q;
	Fri, 06 Mar 2026 09:05:16 +0000
Date: Fri, 6 Mar 2026 17:05:06 +0800
From: kernel test robot <lkp@intel.com>
To: Frieder Schrempf <frieder@fris.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 5/7] spi: Add RX sampling point adjustment
Message-ID: <202603061603.IJQi8bQr-lkp@intel.com>
References: <20260303-fsl-qspi-rx-sampling-delay-v1-5-9326bbc492d6@kontron.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303-fsl-qspi-rx-sampling-delay-v1-5-9326bbc492d6@kontron.de>

Hi Frieder,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 11439c4635edd669ae435eec308f4ab8a0804808]

url:    https://github.com/intel-lab-lkp/linux/commits/Frieder-Schrempf/spi-Add-rx_sampling_delay_ns-parameter-for-clock-to-RX-delay/20260304-004536
base:   11439c4635edd669ae435eec308f4ab8a0804808
patch link:    https://lore.kernel.org/r/20260303-fsl-qspi-rx-sampling-delay-v1-5-9326bbc492d6%40kontron.de
patch subject: [PATCH RFC 5/7] spi: Add RX sampling point adjustment
config: sparc-randconfig-001-20260306 (https://download.01.org/0day-ci/archive/20260306/202603061603.IJQi8bQr-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603061603.IJQi8bQr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603061603.IJQi8bQr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:620,
                    from include/asm-generic/bug.h:31,
                    from arch/sparc/include/asm/bug.h:25,
                    from include/linux/bug.h:5,
                    from include/linux/slab.h:15,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:14,
                    from drivers/spi/spi.c:7:
   drivers/spi/spi.c: In function 'spi_calc_rx_sampling_point':
>> drivers/spi/spi.c:4034:40: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat=]
    4034 |         dev_dbg(&spi->controller->dev, "calculated RX sampling point delay: %u cycle(s) at %lu KHz", delay_cycles, *freq / 1000);
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:231:29: note: in definition of macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:9: note: in expansion of macro '_dynamic_func_call_cls'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:284:9: note: in expansion of macro '_dynamic_func_call'
     284 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:30: note: in expansion of macro 'dev_fmt'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/spi/spi.c:4034:9: note: in expansion of macro 'dev_dbg'
    4034 |         dev_dbg(&spi->controller->dev, "calculated RX sampling point delay: %u cycle(s) at %lu KHz", delay_cycles, *freq / 1000);
         |         ^~~~~~~
   drivers/spi/spi.c:4034:94: note: format string is defined here
    4034 |         dev_dbg(&spi->controller->dev, "calculated RX sampling point delay: %u cycle(s) at %lu KHz", delay_cycles, *freq / 1000);
         |                                                                                            ~~^
         |                                                                                              |
         |                                                                                              long unsigned int
         |                                                                                            %u


vim +4034 drivers/spi/spi.c

  3990	
  3991	/**
  3992	 * spi_calc_rx_sampling_point - calculate RX sampling delay cycles
  3993	 * @spi: the device that requires specific a RX sampling delay
  3994	 * @freq: pointer to the clock frequency setpoint for the calculation. This gets
  3995	 *        altered to a reduced value if required.
  3996	 * @max_delay_cycles: the upper limit of supported delay cycles
  3997	 * @delay_cycles_per_clock_cycle: the ratio between delay cycles and
  3998	 *				  master clock cycles
  3999	 *
  4000	 * This function takes in the rx_sampling_delay_ns value from the SPI device
  4001	 * and the given clock frequency setpoint and calculates the required sampling
  4002	 * delay cycles to meet the device's spec. It uses the given controller
  4003	 * constraints and if those are exceeded, it adjusts the clock frequency
  4004	 * setpoint to a lower value that is safe to be used.
  4005	 *
  4006	 * Return: calculated number of delay cycles
  4007	 */
  4008	unsigned int spi_calc_rx_sampling_point(struct spi_device *spi, unsigned int *freq,
  4009						u16 max_delay_cycles,
  4010						u16 delay_cycles_per_clock_cycle)
  4011	{
  4012		unsigned long long temp;
  4013		u16 delay_cycles;
  4014	
  4015		/* if sampling delay is zero, we assume the default sampling point can be used */
  4016		if (!spi->rx_sampling_delay_ns)
  4017			return 0;
  4018	
  4019		temp = *freq * delay_cycles_per_clock_cycle * spi->rx_sampling_delay_ns;
  4020		do_div(temp, 1000000000UL);
  4021		delay_cycles = temp;
  4022	
  4023		if (delay_cycles > max_delay_cycles) {
  4024			/*
  4025			 * Reduce the clock to the point where the sampling delay requirement
  4026			 * can be met.
  4027			 */
  4028			delay_cycles = max_delay_cycles;
  4029			temp = (1000000000UL * delay_cycles);
  4030			do_div(temp, spi->rx_sampling_delay_ns * delay_cycles_per_clock_cycle);
  4031			*freq = temp;
  4032		}
  4033	
> 4034		dev_dbg(&spi->controller->dev, "calculated RX sampling point delay: %u cycle(s) at %lu KHz", delay_cycles, *freq / 1000);
  4035	
  4036		return delay_cycles;
  4037	}
  4038	EXPORT_SYMBOL_GPL(spi_calc_rx_sampling_point);
  4039	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
