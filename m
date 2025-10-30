Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCB7283FC3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Oct 2025 04:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761799047; cv=none; b=Hc/Uq3Vv5seVntGWHz5/V6oyYRw6Un4T/E60lq2qISDkmjxtZB24ymA/rCRrXHnG7nCyxFM/qyTp29e0aUh/v14x1JJTkEzCpcbxJv/oYvN9zb7pZn6KrspyKEsENrJqkokYn/eakBe5qndhn8Dbj4ykWp5f5H9CJ/VlXLy03qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761799047; c=relaxed/simple;
	bh=cL2vogiGQTUqralhwYto+Lg4UiNYpI8w6lwDYv8enyM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FXLofAdY22bxeD2+dUy9Nm+RuU5MMQ7HOWPItbnOr8yc9efF/AXwF2146TtlkTgYV0EPhDMUYDnpg8VUBQ1m+7NmeUV7XCGc1oIYN3HhYA2la1EgB9eP/T8v5GR8tydROyiTTe632eM+hmLh3pJScP6A8PLgmgS70HsV++nuyCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T1hCA4cU; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T1hCA4cU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761799046; x=1793335046;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cL2vogiGQTUqralhwYto+Lg4UiNYpI8w6lwDYv8enyM=;
  b=T1hCA4cUdP65Ai+sYmZyiRztnrk5lgjQ3UvJPmMjx0crZmbzH7WE6jC0
   F28s6zXwKW651c3cmeXgVJCbRmjwRwRUwcqMAPEp1qEkHu0j0nAv/n2sF
   6aNLvZIhQWxFaZ2uNYTd2ISoqH0weM7tmCgKyGS3FAV4zDJ5tU4G0siTj
   SzA1Dmq1J2pOvO1aVGgAJev06LYiDjpGyb+U66aaKNysc/1GI497T2W95
   0hD59ScfxgqEE04/dU32jWdnMCoFJ/taISMfMK5x1KVgbs7e2CyshJJd+
   UH34s3vydaoInmUNpMbATyUiDLRgZOAYwij4ZDZQrKrZOjayr11g+XelT
   Q==;
X-CSE-ConnectionGUID: mzmZ5aFwSKaFnfbS/oU8xA==
X-CSE-MsgGUID: tfvdfyr3TImHTGMJ5ZzY7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="86558854"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="86558854"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 21:37:26 -0700
X-CSE-ConnectionGUID: wREgTjFmQYyQFq0c2ZyV6A==
X-CSE-MsgGUID: bRCXY0KhRQOpSgilVjA9iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="190183743"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 29 Oct 2025 21:37:24 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEKPa-000LTE-06;
	Thu, 30 Oct 2025 04:37:22 +0000
Date: Thu, 30 Oct 2025 12:36:58 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jianquan Lin <linjianquan2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3067/3067] drivers/ub/ubfi/irq.c:11:5: warning:
 no previous prototype for function 'ubrt_register_gsi'
Message-ID: <202510301246.3F4So5Wc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   39d344bdf1da74284209d54d7199c6c6daca9905
commit: 6533f3af69cee90712f3481841901ab0a10f8339 [3067/3067] ub:ubfi: ubfi driver create ubc device
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251030/202510301246.3F4So5Wc-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510301246.3F4So5Wc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510301246.3F4So5Wc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/ubfi/irq.c:11:5: warning: no previous prototype for function 'ubrt_register_gsi' [-Wmissing-prototypes]
      11 | int ubrt_register_gsi(u32 hwirq, int trigger, int polarity, const char *name,
         |     ^
   drivers/ub/ubfi/irq.c:11:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      11 | int ubrt_register_gsi(u32 hwirq, int trigger, int polarity, const char *name,
         | ^
         | static 
>> drivers/ub/ubfi/irq.c:37:6: warning: no previous prototype for function 'ubrt_unregister_gsi' [-Wmissing-prototypes]
      37 | void ubrt_unregister_gsi(u32 hwirq)
         |      ^
   drivers/ub/ubfi/irq.c:37:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      37 | void ubrt_unregister_gsi(u32 hwirq)
         | ^
         | static 
   2 warnings generated.


vim +/ubrt_register_gsi +11 drivers/ub/ubfi/irq.c

    10	
  > 11	int ubrt_register_gsi(u32 hwirq, int trigger, int polarity, const char *name,
    12			      struct resource *res)
    13	{
    14	#ifdef CONFIG_ACPI
    15		int irq;
    16	
    17		if (!res) {
    18			pr_err("ub register gsi, res is null\n");
    19			return -EINVAL;
    20		}
    21	
    22		irq = acpi_register_gsi(NULL, hwirq, trigger, polarity);
    23		if (irq <= 0) {
    24			pr_err("could not register ub gsi hwirq %u\n", hwirq);
    25			return -EINVAL;
    26		}
    27	
    28		res->name = name;
    29		res->start = irq;
    30		res->end = irq;
    31		res->flags = IORESOURCE_IRQ;
    32	#endif
    33		return 0;
    34	}
    35	EXPORT_SYMBOL_GPL(ubrt_register_gsi);
    36	
  > 37	void ubrt_unregister_gsi(u32 hwirq)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
