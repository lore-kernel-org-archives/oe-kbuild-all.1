Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5903119CD06
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jan 2026 16:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769359396; cv=none; b=r+IFC4Pyz5DNotSUWzsR9Kro/uphiWGFldiJQGH9w775eE3NrhiMI3tNcOr5g/0oLyptI3Me2FFxuZXzkl4wILjLBwU6jv0JdF8XMXTvNnCDzJJKOSCL7Q30qQivM2pnY0Pdc+Lda0bkFAdH9Qzkxsba9bnzaCn4MVFUFcR4qhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769359396; c=relaxed/simple;
	bh=inmb3Ui1LtUPUMYZho6JYQm8ywW4xndAMeuwnbGfZ0o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NguQ8yvVKFn1PveE1FzHVbm8bLVGRRSYgCy0qz2KCs3lcDi9AoD5jk0qnBsla5FKu+OySnoDn2AfmPAv4EZomZGpUGmXJGHqB/KVfk9p4oHz3HD4wNjYUxW107NMrp207q5sHkP9pMobNI87L9IbVi5OKb5TTv+aIJO/TPAfcSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ERXMFeHF; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ERXMFeHF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769359394; x=1800895394;
  h=date:from:to:cc:subject:message-id;
  bh=inmb3Ui1LtUPUMYZho6JYQm8ywW4xndAMeuwnbGfZ0o=;
  b=ERXMFeHFHJkpkm4g33kSQhFJBxbC+S3QmPhRFVvCOklH5uUX8q79Hq6P
   m70XLYWFWtxWMtwe9AHjea/chLB1+N/RJzrRpa31UrvH5k2LLldbXVSXg
   w23d+FozHAo9H4QN8iILd+lXMvCFbJzGbTeTnXnKQNqgrqyPIcf3riNCE
   5uDRnbRjiWG0KV7yNG8RG0A/cnCTmncEFaNvHQFHsisqEzy9yA3TPw8ir
   4NVu80RUROq5YvnNQGfH1LizyQ0rsFc+UP4vN8eBldIjZ+wF+RGxgxozN
   l2HUeEb+nnLiiu1RyZpgZM7CoMrW/UZybz64v5rJml6QcTxQ2I9dqm2DT
   Q==;
X-CSE-ConnectionGUID: wh4lV/ecQu2+96ClGBOEFA==
X-CSE-MsgGUID: ukWSVI60ToKYHT0up/GRhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="81181616"
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="81181616"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 08:43:13 -0800
X-CSE-ConnectionGUID: 4aP+AzGnSwSHFe3IP+kqFg==
X-CSE-MsgGUID: BFqKqQHYQBGE63XXegwUBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="212000266"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 25 Jan 2026 08:43:12 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vk3Ce-000000001JJ-44BU;
	Sun, 25 Jan 2026 16:43:08 +0000
Date: Sun, 25 Jan 2026 17:43:07 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/2] htmldocs:
 Documentation/core-api/symbol-namespaces.rst:101: WARNING: Inline emphasis
 start-string without end-string. [docutils]
Message-ID: <202601251752.SzH1Yn5o-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   9ca0fde2622c59c97612be0765d6d3c101122f69
commit: cdd9862252a0dd54a0f8e78ea63a9ace3c137db1 [0/2] module: Provide EXPORT_SYMBOL_GPL_FOR_MODULES() helper
reproduce: (https://download.01.org/0day-ci/archive/20260125/202601251752.SzH1Yn5o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601251752.SzH1Yn5o-lkp@intel.com/

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
