Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B4C28F5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 04:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765428282; cv=none; b=UeJErXU1jAtDQmZhx/JPtoAb4p6MqPlEGzNmwSs8gJI+lD8pWq1fy//gronwyen9UwHaih8RHBshaU61m6RqBSET4j/eNpH8GGAqlXyZU9m70hpVCAWCSd8h0s2qeGhxttzWq7ctpdNBG096hh/rEQGgKuyu1o7wf0vIYauynDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765428282; c=relaxed/simple;
	bh=Z/81l8TfT4/3O4Oxsu71S/4wevrkjE42p1YIbVmQxSo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fd1QAdtkC/dEbL8pQ8q+vICgCXMpGWt/y2uni4AbSd3mpjVhvSsRM4Xpu+W2OjGbRzRtTZsTRpyfKCCO3B/7fRxUzLzgX2pFriuH04rsDQiSDIFGtzktLC4FOL2AaYcID0ZmlOBcpy4sh0xSHQcDKlHuTJTuuWvTVSCklPi9AGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jyLl4a25; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jyLl4a25"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765428281; x=1796964281;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z/81l8TfT4/3O4Oxsu71S/4wevrkjE42p1YIbVmQxSo=;
  b=jyLl4a25szBllFvP7MAFZfPoMjco/r0LIyuhNnB65NSBX7iwgvUZKzS4
   QIyFgN+CxhmB3UdgXhIK5UQ+0BCA3eR7sHZZSEUZCC7nxkCj8MlUKP0++
   ggMkhui9MOA8cJIfhqTR2goh8uWtHhm33imtfEbFejSRnlE9rNhEpt1TD
   MZe5lC/97rRuAJR7Xx7yLabRq4r2KVa1QZY3o3Yg6ZJkTn3errl9pt8ss
   0y/+A7PXfwyyGt3F+1wYunB7xSISautueUAVqH/omJ5vcoVYqGQ1VdFJb
   U8/sWPWBMb+fBSVaQnye8R9B6x7JRS+3S1M2s2ox3fld3ZOYoHQohx0us
   Q==;
X-CSE-ConnectionGUID: 7bW/N2iURq6Vyk/igz6fEw==
X-CSE-MsgGUID: qbXL4maASUCojf0CPlftmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67292316"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="67292316"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 20:44:40 -0800
X-CSE-ConnectionGUID: 9HOawqqJTnaoz90yoRqHVA==
X-CSE-MsgGUID: l1D8AA8DQPSwEMmvRXxpxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="196300470"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 10 Dec 2025 20:44:38 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTYXc-000000000ue-2hXC;
	Thu, 11 Dec 2025 04:44:36 +0000
Date: Thu, 11 Dec 2025 05:43:54 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-CWF-RDT-ANBZ24559 0/25] htmldocs:
 Documentation/core-api/symbol-namespaces.rst:101: WARNING: Inline emphasis
 start-string without end-string. [docutils]
Message-ID: <202512110538.8nmCwmkq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-CWF-RDT-ANBZ24559
head:   443d7ee63a13180e69479cd694f03a167a87da2e
commit: adb29b437fe58d41bd5d4a5c3d63bf1bb02f0877 [0/25] module: Provide EXPORT_SYMBOL_GPL_FOR_MODULES() helper
reproduce: (https://download.01.org/0day-ci/archive/20251211/202512110538.8nmCwmkq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110538.8nmCwmkq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/mm.h' failed with return code 2
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 ./include/linux/page_ref.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 ./include/linux/mmzone.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 ./include/linux/padata.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -function printk -function pr_emerg -function pr_alert -function pr_crit -function pr_err -function pr_warn -function pr_notice -function pr_info -function pr_fmt -function pr_debug -function pr_devel -function pr_cont ./include/linux/printk.h' failed with return code 1
>> Documentation/core-api/symbol-namespaces.rst:101: WARNING: Inline emphasis start-string without end-string. [docutils]
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 ./include/linux/workqueue.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 ./include/linux/xarray.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -function Block Cipher Algorithm Definitions ./include/linux/crypto.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -function crypto_alg -function cipher_alg -function compress_alg ./include/linux/crypto.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -function ASSERT_EXCLUSIVE_WRITER -function ASSERT_EXCLUSIVE_WRITER_SCOPED -function ASSERT_EXCLUSIVE_ACCESS -function ASSERT_EXCLUSIVE_ACCESS_SCOPED -function ASSERT_EXCLUSIVE_BITS ./include/linux/kcsan-checks.h' failed with return code 1


vim +101 Documentation/core-api/symbol-namespaces.rst

   100	
 > 101	  EXPORT_SYMBOL_GPL_FOR_MODULES(preempt_notifier_inc, "kvm,kvm-*")
   102	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
