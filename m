Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CDC26AFB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Sep 2024 05:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726033356; cv=none; b=V8my6s3B9rJP4b883j9aunY5sMF1/sycH9KUiEcvc30PsvcgBCBDjaimIz1c8NRgeqGkxeXh4yry1KOycu1es7uWhngIo0mcSlD9pNaXNuYtwz7tVjQ5Lj25s3o/lgOEE+qyqjkmRb4N5Xc04j5ChiqP/xkOp+q5EBaM4D7PKPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726033356; c=relaxed/simple;
	bh=1rrCEDYMErPcK2Ng40sNCL1aRNmjM6BE1cwUs/yLB/k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I+gnNeFrqiRPZig7HlLxhfYXnEUemQPe7aUp6xAAIfeKwpIh2VBqH8ebKGjvdmVWX2TB4CMn0rvHzq0fcBTjIgL+FKed5hpGMpGhdsLGTkq2FYXoWnQ+t6u8hnJeXHf3MPxW/khipFIz5UA/cJN1OUyf9SZpYv9WgxPNbH2Y9bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RXDcChG7; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RXDcChG7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726033354; x=1757569354;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1rrCEDYMErPcK2Ng40sNCL1aRNmjM6BE1cwUs/yLB/k=;
  b=RXDcChG77JjrqZPd4rp0/UzYjbAqZKULId17XgodTXp5f4psawDEyurU
   IFtl78Q3BpzDnUr2adq4gQ69nMqNN/d93PfFEPLHrmDn9SV3AqP07B35e
   pNvkuhBDCrQ+9rVCcmrhfn2yIc9gbtyiG07DeZ7HhMBzFnAeXjv2Q7ega
   8g51BDSCmy4xfsusLDvWchCtrhPpJyGp8rwLmD63py5UzcaZyxZp29z+D
   m1WnXVShbKPO0G9GwSazwU7pq2X247ddlfVUTP4DYSHIvmxfQYIO6Hjra
   RBIJK3DHn22ELqQC/qLG9vxIzF68VgyQw+XJc0XjDtIp8WRxMWGmuPDZi
   A==;
X-CSE-ConnectionGUID: c3uBfgV3SHuFA1uAHiTB/g==
X-CSE-MsgGUID: 4dulTCl9SpmfbnfVUDVBzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="27732741"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="27732741"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 22:42:33 -0700
X-CSE-ConnectionGUID: jiVdWYExS9SgaKfmklt2CQ==
X-CSE-MsgGUID: VmvPh4FBQiW42GXm9uCxIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="72234212"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Sep 2024 22:42:31 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soG7Z-00035W-2I;
	Wed, 11 Sep 2024 05:42:29 +0000
Date: Wed, 11 Sep 2024 13:41:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 5003/30000] kernel/watchdog_hld.c:502:12:
 sparse: sparse: symbol '__hardlockup_detector_perf_init' was not declared.
 Should it be static?
Message-ID: <202409111340.yXGUhELN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   a6042799048d28282f37a2a254f2757cea2c780a
commit: 364de98eacea8dbfe4f926f62085aebf8534f403 [5003/30000] watchdog: Fix sleeping function called from atomic context
config: x86_64-randconfig-121-20240910 (https://download.01.org/0day-ci/archive/20240911/202409111340.yXGUhELN-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409111340.yXGUhELN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409111340.yXGUhELN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/watchdog_hld.c:502:12: sparse: sparse: symbol '__hardlockup_detector_perf_init' was not declared. Should it be static?

vim +/__hardlockup_detector_perf_init +502 kernel/watchdog_hld.c

   501	
 > 502	int __init __hardlockup_detector_perf_init(void *not_used)
   503	{
   504		int ret = hardlockup_detector_event_create();
   505	
   506		if (ret) {
   507			pr_info("Perf NMI watchdog permanently disabled\n");
   508		} else {
   509			perf_event_release_kernel(this_cpu_read(watchdog_ev));
   510			this_cpu_write(watchdog_ev, NULL);
   511		}
   512		return ret;
   513	}
   514	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
