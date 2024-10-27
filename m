Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C37B640
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Oct 2024 20:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730061458; cv=none; b=eduEHbndZvVGX7x+IYSDolmjjcbvpp/SdOP8i9Ufjze+/hPSM3iusfHI2jvw4x/zidOOdugibLKp4Wh+oVZv8SWa7igy26XExvWogWYFCMhQluyJXiVoiybDanY7Ux6s47IGd1Hs3d7ovRCUcBFs3BsthT9UohrzNDFWX2KgYig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730061458; c=relaxed/simple;
	bh=t4dO+v14RIi6DPKHuTdNO6o/WnmT+QJdArEMdH1dugE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PFLNLNU2vhim/8sDY2XR/hLQ4GZspDopJdMEkNl1u1KPjK82TWZI1uGfq2hvOLQ72jiD5n9KTL3+kdEHaJDXoUfulVN7qQpi/rVnQCEAEBFoVWeZW64nBwUEk5XNspMagn82ZC7R5AtfaDbcdEVATDALcUJNiZduDeDNeAwdNlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SJKtFDWA; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SJKtFDWA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730061456; x=1761597456;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t4dO+v14RIi6DPKHuTdNO6o/WnmT+QJdArEMdH1dugE=;
  b=SJKtFDWAWawjAAhbWTGB4t/5qYpTFbOjBH7CQsI03LTHvPLx5/e1V6Au
   2+rhEgshJSowJi80dhn+TVG569crRpt1QTyCg81Ehy+QrXGYItk5afIcI
   nj0vix0w3DaqsYm2vaEWZPVKiTnBYzi0hON3Gcl18ynJAp72WrlgvISxv
   vsaHeRaMXyXP+8fdia2+qSPXad6qEy4pmFsb0K2LRLNFXlXDvDvAv5QcL
   16gjpqmsO/J6RbaOwLVc4fu1na5ZSYJ3RrNRkWqAO5DRHltCxQ3zBHFXi
   n50DqbxMyeCy22ltcfca13PP7A2PwmiNqkOMs+Au1+jaA0VrM6w6oma8i
   Q==;
X-CSE-ConnectionGUID: msa14IUzSce8uwumWEoNFQ==
X-CSE-MsgGUID: sCJXhIy+QZez5aocZYZAlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29519863"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29519863"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 13:37:35 -0700
X-CSE-ConnectionGUID: v5YrGsXbSe6z45yVFznHiA==
X-CSE-MsgGUID: WlmymRYrRu+drfTIZy+JqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,237,1725346800"; 
   d="scan'208";a="112250248"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Oct 2024 13:37:34 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5A0x-000aya-2i;
	Sun, 27 Oct 2024 20:37:31 +0000
Date: Mon, 28 Oct 2024 04:37:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Liao Chen <liaochen4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2392/15331] arch/arm64/kernel/ipi_nmi.c:39:9:
 error: implicit declaration of function '__printk_safe_enter'
Message-ID: <202410280402.j2eHLE32-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Li,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   9d0af12b79bee784902822ddeec2e1a8cfc18524
commit: 5e3e94b1477ca3f6cb47ae8137a4a99fe0ef6147 [2392/15331] arm64: Add non nmi ipi backtrace support
config: arm64-randconfig-003-20241027 (https://download.01.org/0day-ci/archive/20241028/202410280402.j2eHLE32-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241028/202410280402.j2eHLE32-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410280402.j2eHLE32-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/ipi_nmi.c: In function 'ipi_cpu_backtrace':
>> arch/arm64/kernel/ipi_nmi.c:39:9: error: implicit declaration of function '__printk_safe_enter' [-Wimplicit-function-declaration]
      39 |         __printk_safe_enter();
         |         ^~~~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/ipi_nmi.c:41:9: error: implicit declaration of function '__printk_safe_exit' [-Wimplicit-function-declaration]
      41 |         __printk_safe_exit();
         |         ^~~~~~~~~~~~~~~~~~


vim +/__printk_safe_enter +39 arch/arm64/kernel/ipi_nmi.c

    35	
    36	#ifdef CONFIG_NON_NMI_IPI_BACKTRACE
    37	static void ipi_cpu_backtrace(void *info)
    38	{
  > 39		__printk_safe_enter();
    40		nmi_cpu_backtrace(get_irq_regs());
  > 41		__printk_safe_exit();
    42	}
    43	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
