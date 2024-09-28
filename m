Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AC7171A7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 17:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727543909; cv=none; b=bpf36j9VayBgkpeM05fxXFHfZumNl9FD4xNmaPsMWwO01iGvwCAEQKuep6i+YFKyXrrDnEDbb6E0aP8teeJvOZXzM1y9Rhnc5HyzfhJr40suP41AEbLIpp5XML5c8zMpbxkrFjpj2e/8Sn9j/uP4EkRxSUvFjG50jlKHJ/HrVDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727543909; c=relaxed/simple;
	bh=tFs2UdHBS+FgAarVbRMJUC3xLUehbAHOxkJaRQWa4JQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lwrVW8s60DpZ5A9iS/17T3+kgytG4KbpmsnvAEgfNrUHNJmUG4wkXvn3e8RFgjFMWpM+rhOSIAD+LY9XQsd6WwzdQxgNW7tkLIXeBYGrLg370zknEkHLWXCB7j55U44erZKrL2zuB939x3DvlmpuYCzmGRgAoshs55AT8Kb/kvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BwhEo/Ue; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BwhEo/Ue"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727543907; x=1759079907;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tFs2UdHBS+FgAarVbRMJUC3xLUehbAHOxkJaRQWa4JQ=;
  b=BwhEo/Uem/o9m+UmlF9E5XXzoPsexjeJfM0CkG1puVRTrR7I1UtwxQSJ
   XY+JsPKTSeZxMe5/uEsrq1J5qKFS1NZlx/9CWJw3KJTK7eLzYvk+KqsjG
   /B+D8qMEgr8mlmWxVNdrbOBqdQ06E/W0AO0roQ5qr+HITe0o7U6hqc4Fq
   ITdXf9qmHnjR+5Q2fVc7DnjWTYeDqhlEBIzNADJerlO5dP/eLqOeWGTRm
   rvNeJ645+qHwf3nw9JwnWsLpI9eWiO98/zVSFyD+5S4pHdPIT8gZo8XL2
   ZpZ92BvHOLCrSjmJF73aMvywea99Cj5zYEI9wf8P03yidevZT8XBSNxOf
   w==;
X-CSE-ConnectionGUID: etwS7w/sT8+AKfGg1FxG5Q==
X-CSE-MsgGUID: UZRS1FVSSLyz1Be1NlvdVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="30561571"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="30561571"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 10:18:26 -0700
X-CSE-ConnectionGUID: xJs1wWExTFWSnGRzXHwIAg==
X-CSE-MsgGUID: ciDa/A19R1qfE6hfCz3Kkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="72717727"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Sep 2024 10:18:25 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sub5L-000NUP-0N;
	Sat, 28 Sep 2024 17:18:23 +0000
Date: Sun, 29 Sep 2024 01:17:31 +0800
From: kernel test robot <lkp@intel.com>
To: Max Hsu <max.hsu@sifive.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v2 2/3] riscv: Add Svukte extension support
Message-ID: <202409290108.NnxajbmS-lkp@intel.com>
References: <20240927-dev-maxh-svukte-rebase-2-v2-2-9afe57c33aee@sifive.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927-dev-maxh-svukte-rebase-2-v2-2-9afe57c33aee@sifive.com>

Hi Max,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on b3f835cd7339919561866252a11831ead72e7073]

url:    https://github.com/intel-lab-lkp/linux/commits/Max-Hsu/dt-bindings-riscv-Add-Svukte-entry/20240927-214355
base:   b3f835cd7339919561866252a11831ead72e7073
patch link:    https://lore.kernel.org/r/20240927-dev-maxh-svukte-rebase-2-v2-2-9afe57c33aee%40sifive.com
patch subject: [PATCH RFC v2 2/3] riscv: Add Svukte extension support
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20240929/202409290108.NnxajbmS-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409290108.NnxajbmS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409290108.NnxajbmS-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kernel/cpufeature.c: In function 'riscv_user_isa_enable':
>> arch/riscv/kernel/cpufeature.c:927:32: error: 'struct thread_struct' has no member named 'envcfg'
     927 |                 current->thread.envcfg |= ENVCFG_UKTE;
         |                                ^


vim +927 arch/riscv/kernel/cpufeature.c

   920	
   921	void riscv_user_isa_enable(void)
   922	{
   923		if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_ZICBOZ))
   924			csr_set(CSR_ENVCFG, ENVCFG_CBZE);
   925	
   926		if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SVUKTE))
 > 927			current->thread.envcfg |= ENVCFG_UKTE;
   928	}
   929	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
