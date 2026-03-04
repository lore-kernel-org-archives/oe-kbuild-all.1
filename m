Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE197312837
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Mar 2026 13:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772632236; cv=none; b=fPpAmz9FcFI6Z1pFiDj+tSXnF91uJZla55Z7+f8p6Nv1u5L778k8MTQ5bph/oFDBd/RifvXATr1wiAu6PvdXF/bYd4RfrxRqJfsguc49uvoactgDaWlIG4fox38VuWXuSSMAkACoNYbcYbiXZBr/Sxf2APDP/EytrWZ4fhYadE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772632236; c=relaxed/simple;
	bh=VPIbwl7qvJoAZJvI2vTr8h/by7c54vjlTr/7L55yv/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GIo/PkKvHfvfiSUHDOK2+Urb673xWd/g60mdXFQ1g84aUV+jxmp7w0i3ghAOWe7yTqp9Kmm+9yMGeWErTmrbgyGFRxkpMQjBhelLHJmBT5gnCPSd6CIQej7fIWXKhn12MaODXRXQqlqjpOpJj4T3CT35uHM0DwAaihd21+kKtCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UXJe5DzS; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UXJe5DzS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772632235; x=1804168235;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VPIbwl7qvJoAZJvI2vTr8h/by7c54vjlTr/7L55yv/k=;
  b=UXJe5DzSxa6sE6lYGGk82kAXh8PA2932N4E/lAdgz399Jw/ln0NuO8Ku
   VcKa/7LR1exDHLbkR/faBSDXF22EdzbqI8nUD2QeAULqEemMtBirpYgV2
   EO05f0PCR17hVmz6UsOZCl2o1qta25utYkJtUrpOW495M9EmlGwVtc04M
   J0N7YYh0KvaoitysLWpsKtu5OVlhNIp0ewzymAtvMLDecd40KTnUt04Yk
   S6/TnP2gS9cOL3Tq/mWIE5I3W8g4hIuVrX1/2EmsYz0V+rBAtSWXH7Nal
   Yp0FVTisIflLMpJeLP4JirPUXrHiGAVria2X/Ih1pm3/oX709mDlOK22/
   Q==;
X-CSE-ConnectionGUID: GToZQtEfSume5/qNcDg8+g==
X-CSE-MsgGUID: a72//yqqTOynPyQI7yAjAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="72716446"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="72716446"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 05:50:33 -0800
X-CSE-ConnectionGUID: IQyLqEp1QnC3Gzcds3GumQ==
X-CSE-MsgGUID: 6O0J0BxeQHqLkHzS6cSrEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="217502196"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 04 Mar 2026 05:50:31 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxmcN-000000001iP-2nrn;
	Wed, 04 Mar 2026 13:50:27 +0000
Date: Wed, 4 Mar 2026 14:50:08 +0100
From: kernel test robot <lkp@intel.com>
To: Chengwen Feng <fengchengwen@huawei.com>, linux-pci@vger.kernel.org,
	bhelgaas@google.com
Cc: oe-kbuild-all@lists.linux.dev, linux-acpi@vger.kernel.org,
	rafael@kernel.org, lenb@kernel.org, wei.huang2@amd.com,
	Eric.VanTassell@amd.com, jonathan.cameron@huawei.com,
	wangzhou1@hisilicon.com, wanghuiqiang@huawei.com,
	liuyonglong@huawei.com, Chengwen Feng <fengchengwen@huawei.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] PCI/TPH: Fix get cpu steer-tag fail on ARM64 platform
Message-ID: <202603041459.Mw33vD7S-lkp@intel.com>
References: <20260303003625.39035-1-fengchengwen@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303003625.39035-1-fengchengwen@huawei.com>

Hi Chengwen,

kernel test robot noticed the following build errors:

[auto build test ERROR on pci/next]
[also build test ERROR on pci/for-linus rafael-pm/linux-next rafael-pm/bleeding-edge linus/master v7.0-rc2 next-20260303]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chengwen-Feng/PCI-TPH-Fix-get-cpu-steer-tag-fail-on-ARM64-platform/20260303-084305
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20260303003625.39035-1-fengchengwen%40huawei.com
patch subject: [PATCH] PCI/TPH: Fix get cpu steer-tag fail on ARM64 platform
config: i386-randconfig-2006-20250804 (https://download.01.org/0day-ci/archive/20260304/202603041459.Mw33vD7S-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260304/202603041459.Mw33vD7S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603041459.Mw33vD7S-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/acpi/processor_core.c: In function 'acpi_get_cpu_acpi_id':
>> drivers/acpi/processor_core.c:344:16: error: implicit declaration of function 'cpu_acpi_id' [-Wimplicit-function-declaration]
     344 |         return cpu_acpi_id(cpu);
         |                ^~~~~~~~~~~


vim +/cpu_acpi_id +344 drivers/acpi/processor_core.c

   337	
   338	#ifdef CONFIG_ARCH_HAS_GET_CPU_ACPI_ID_API
   339	unsigned int acpi_get_cpu_acpi_id(unsigned int cpu)
   340	{
   341		if (cpu >= nr_cpu_ids)
   342			return 0;
   343	#ifdef CONFIG_X86
 > 344		return cpu_acpi_id(cpu);
   345	#elif CONFIG_ARM64
   346		return get_acpi_id_for_cpu(cpu);
   347	#endif
   348	}
   349	#endif /* CONFIG_ARCH_HAS_GET_CPU_ACPI_ID_API */
   350	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
