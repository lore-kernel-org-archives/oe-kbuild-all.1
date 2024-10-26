Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A875FF9CF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Oct 2024 21:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729979068; cv=none; b=amNVFodAc09Ax3jCjTY9QMlHOeTog8o2ypG+iC7NC1lrW1NCcty03JRY0+pdLyYUAL5baC6ANUhepKrJNZzXn7lL1tfexbfjJnbEvCT5YDvaFeF8GSLW9h/e4g/YcIZGTrtFScrXKKvNYfjLe4QEHexFqKHP/HSavOvoq/EqQCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729979068; c=relaxed/simple;
	bh=dnL8FE08SwfArDVMinvQiNcjVEJ8bQOKEGMdX4CA6j8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IPlyjRtIFOJnKtaZ7v1BQ5TbKHmmZJOdWHeK1X22lGImKEfsxsd4xlnXsIqvnrJ+ZNZmd77dRcfRU0ALbCTVBAOxHUIcZLInSk0m4XyIcCaMzP5QSzl7xMoYCxxQ3qalnqKhkY3Q82Ql3tQ8nVe33q01kQ0YMh1sx0/bkCGJb84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SDODM78/; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SDODM78/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729979065; x=1761515065;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dnL8FE08SwfArDVMinvQiNcjVEJ8bQOKEGMdX4CA6j8=;
  b=SDODM78/IbTJxnasfoyAr6C5EW6p1Lsd5znZooKtfQ/YqHQ3SoZ7pUal
   ZLeRJjebgHpSKQbCDTrScZc2OOEsBYwxxC6DC27HsCbt+ceP8fSaFlF1C
   2Be9wbZZ6drYvZ3KCWQwwABpxiVbJsN1kUPuf3KS0iZV1m3+ksXvwQieq
   jmkSZZW8+Brj66gQeCIg5UvduTvedCYXbW1/7Yttap9IaLgTng2zQoVqt
   wH5gvv0hg4JXujNZu9JAC5C3A5LqaviZt/NPm+NCkly74JEH1lpQTf5mm
   q0ct1SXym0ZynRpZR/pZ+YywHvRNWz1FO6XNOeoDQQL9hOfJoT85nJHqg
   A==;
X-CSE-ConnectionGUID: Iu88jyJyTMevPoM26vHIlQ==
X-CSE-MsgGUID: klHJLBTaQOyf+OJYwwWROg==
X-IronPort-AV: E=McAfee;i="6700,10204,11237"; a="29061878"
X-IronPort-AV: E=Sophos;i="6.11,235,1725346800"; 
   d="scan'208";a="29061878"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 14:44:25 -0700
X-CSE-ConnectionGUID: lsxHv1PgQ5KldSKpMq2N/g==
X-CSE-MsgGUID: nZZ/r1UcQmeKuTuJGx4qAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,235,1725346800"; 
   d="scan'208";a="85849812"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Oct 2024 14:44:24 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4oa6-000a4G-08;
	Sat, 26 Oct 2024 21:44:22 +0000
Date: Sun, 27 Oct 2024 05:44:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 6355/30000] arch/arm64/kernel/ipi_nmi.c:38:9:
 error: implicit declaration of function 'printk_safe_enter'; did you mean
 'printk_nmi_enter'?
Message-ID: <202410270515.tTl9lU9j-lkp@intel.com>
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

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   412556141b3c12f2f160acc3a09a40c937837ee3
commit: f86d165bfe5f6248743774bb07af0bd7cff12443 [6355/30000] arm64: Add non nmi ipi backtrace support
config: arm64-randconfig-001-20241026 (https://download.01.org/0day-ci/archive/20241027/202410270515.tTl9lU9j-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410270515.tTl9lU9j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410270515.tTl9lU9j-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/ipi_nmi.c: In function 'ipi_cpu_backtrace':
>> arch/arm64/kernel/ipi_nmi.c:38:9: error: implicit declaration of function 'printk_safe_enter'; did you mean 'printk_nmi_enter'? [-Werror=implicit-function-declaration]
      38 |         printk_safe_enter();
         |         ^~~~~~~~~~~~~~~~~
         |         printk_nmi_enter
>> arch/arm64/kernel/ipi_nmi.c:40:9: error: implicit declaration of function 'printk_safe_exit'; did you mean 'printk_nmi_exit'? [-Werror=implicit-function-declaration]
      40 |         printk_safe_exit();
         |         ^~~~~~~~~~~~~~~~
         |         printk_nmi_exit
   cc1: some warnings being treated as errors


vim +38 arch/arm64/kernel/ipi_nmi.c

    35	
    36	static void ipi_cpu_backtrace(void *info)
    37	{
  > 38		printk_safe_enter();
    39		nmi_cpu_backtrace(get_irq_regs());
  > 40		printk_safe_exit();
    41	}
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
