Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E9E28A72F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Aug 2025 23:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754956425; cv=none; b=CZ3qgeE/K8SUL7hZTOJUMaZrl0oE/KtjJaXP/TIHZuAZ0hHLZC5FjVixkgGVOQQpYJzj03rLbSVZgfwXFAXbfyWy9Zh9ffhMlKTS0SaLSmd7HyKVMrNGQd7NS1hEG5h+Yv8PtqHjisBCgAuGrIYk+vilmPiVdj4LgnscD43N8JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754956425; c=relaxed/simple;
	bh=Ox3S28YRGEhmZkp4F7M7KwEAq0WZgUB7Kf8NXIS5+Zw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=owAilOs3kt4KP+Q0k96nUEMOYbj/b6qCEFwBCkUccZpilknx2zqWbdPxbZ7lWquehxZz4I4AjqjDha/4rNGpIoDBvjdVXir+z/8K6FxctRRc5//JCvwf8pm4RnC3BfkIMG6ah0IAbxX5zP82XBNDCjPxpw6cs32T9cXswhpu6OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KsuV9W9Z; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KsuV9W9Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754956423; x=1786492423;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ox3S28YRGEhmZkp4F7M7KwEAq0WZgUB7Kf8NXIS5+Zw=;
  b=KsuV9W9Zv8CTkgv1PrwJwAD5qMAf/ItYrp9Vp/z68npxRKnNvRpk6R2v
   DTzVlHzG4tO2fbYNuWOktRm+24IL2iIjGyDWlmWUds7GIb9Lvv0zNUeub
   2U5g0Lfw2fkfPqHQhPiSGy7s4Wc7WbR5kgFFOWjOCce5Z5wsZZwGrChYS
   SemcVqqTsuPEZMVavlJoCnURCelIUFEYh0sNHMPzvAtvD53HLl4yctp5C
   6dR3/2UCXNeny/1MKso+3BSXdaguA3NySO74P6Wy7qx4wFA/FHbEZAiNa
   6D/orscwRItV7/IFEWd1WShMTpzRxfFhbCFglIPQWJx9Zb67NWu0C3PD7
   g==;
X-CSE-ConnectionGUID: r3VjpWXAQBWmqZ1i4F7C0A==
X-CSE-MsgGUID: LwvbJn+rS8uQEeRRPDPw/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57301217"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="57301217"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 16:53:43 -0700
X-CSE-ConnectionGUID: quWFlGxmQHe/5so0QgppXA==
X-CSE-MsgGUID: M1tAGpeJQT6rLRFp5nBp2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="165671143"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa009.jf.intel.com with ESMTP; 11 Aug 2025 16:53:42 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulcKh-0003AJ-1s;
	Mon, 11 Aug 2025 23:53:39 +0000
Date: Tue, 12 Aug 2025 01:52:52 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1750/1750]
 drivers/pci/controller/hisi-pcie-customer/.tmp_hisi_pcie_cae.o: warning:
 objtool: missing symbol for section .init.text
Message-ID: <202508120135.Ifnnu0GS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   a7892155ca524e224cb2da85c85cc1bd4303179d
commit: 2208b0283616863f166ef470fb9286223ba8f9ba [1750/1750] pcie: hisi pcie dfx driver
config: x86_64-buildonly-randconfig-2004-20250805 (https://download.01.org/0day-ci/archive/20250812/202508120135.Ifnnu0GS-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250812/202508120135.Ifnnu0GS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508120135.Ifnnu0GS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/controller/hisi-pcie-customer/.tmp_hisi_pcie_cae.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
