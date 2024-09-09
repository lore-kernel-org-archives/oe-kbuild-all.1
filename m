Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3068617799F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 16:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725899556; cv=none; b=ezIEMK3YoQQCHYg+6ZESV29yardXe76Ns8B0W7UrB4yZFF13LnZGw5sl71FNpLkMmYj2oYlqyPk5/VUwOob/5mVijUBlir4m+xXOCLdXYFaQBAQe9J6hy8PVFaHxa/NST3Uf51dcHbREJe3KDTNGwdC5gkxJlzvbdLxlh/oexzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725899556; c=relaxed/simple;
	bh=YfUBJH6VmFi9/WLJv7CnN1jXtBIr4lW5xx7OSlf+e6I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dO4yhAjSVwA3ObuMBaW0mWSKNS/V26yaTd5indZ2sEeOHTQev9xUtub3PZFfIc8bohXVLuXqOBWl92QXzTV2xnJL6lneMqbIRTuMAW6lYBXzDTRxeHMw+1FuUMnvaFxZLzoowKjNXXJ3FBHBWjB5XkQ2F4A9id3jBE8rGbua7/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uvxoe7q6; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uvxoe7q6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725899555; x=1757435555;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YfUBJH6VmFi9/WLJv7CnN1jXtBIr4lW5xx7OSlf+e6I=;
  b=Uvxoe7q6+3/JDKdlDcHiMBT9Uf5NYNE+hZ+WBU/w8Rzg9NVTOxlFIkBU
   IZOVs0AWh5GfnMkv+3vum/kE6SXuaYO2qoKxmN8+NlKNu4zPYQSXSPUJM
   rfNlkEKjwL3+US1GETpmRNEk86KMLIqNzb+Sh63jedRrgqCLGdj+/FPej
   vacPJuWr127ij9NnU5rRf4Ui4NBsffYVgDFg1WCvbidgFsDBWbBXAITZk
   8XCKCV6FeORLP33SlWZNBhtf7vuxvwc68Ia55e4liMO9VNc+sVUUdQ5yP
   y+nyZaOoVbw9NQ/KwAnVSPt10QWhzDDVqo+WVYBpwWhgv4FhvUsRniJRA
   g==;
X-CSE-ConnectionGUID: qk2VXznyTPitqzmWLj5s6Q==
X-CSE-MsgGUID: Rrh6XOVHQh+RCiZTceeG6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="42085613"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="42085613"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 09:32:34 -0700
X-CSE-ConnectionGUID: amNvsz9BRDa/BbZmhbz7Jg==
X-CSE-MsgGUID: 0n2GF5WcSV2TQ6667S//HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="97532569"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 Sep 2024 09:32:32 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snhJW-000EyY-1F;
	Mon, 09 Sep 2024 16:32:30 +0000
Date: Tue, 10 Sep 2024 00:32:18 +0800
From: kernel test robot <lkp@intel.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 10383/10516] WARNING: modpost:
 drivers/clk/clk-test: section mismatch in reference:
 clk_range_test_set_range_rate_minimized+0xf4 (section: .text) ->
 __dtbo_kunit_clk_parent_data_test_begin (section: .init.rodata)
Message-ID: <202409100054.fLUJBZbc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   100cc857359b5d731407d1038f7e76cd0e871d94
commit: 8f05acf0ba06763260a794fc4be21d2aa71115f8 [10383/10516] Merge branch 'clk-next' of git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
config: csky-randconfig-r111-20240628 (https://download.01.org/0day-ci/archive/20240910/202409100054.fLUJBZbc-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409100054.fLUJBZbc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409100054.fLUJBZbc-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: drivers/clk/clk-test: section mismatch in reference: clk_register_clk_parent_data_device_init+0x54 (section: .text) -> __dtbo_kunit_clk_parent_data_test_begin (section: .init.rodata)
WARNING: modpost: drivers/clk/clk-test: section mismatch in reference: clk_register_clk_parent_data_device_init+0x58 (section: .text) -> __dtbo_kunit_clk_parent_data_test_end (section: .init.rodata)
>> WARNING: modpost: drivers/clk/clk-test: section mismatch in reference: clk_range_test_set_range_rate_minimized+0xf4 (section: .text) -> __dtbo_kunit_clk_parent_data_test_begin (section: .init.rodata)
>> WARNING: modpost: drivers/clk/clk-test: section mismatch in reference: clk_range_test_set_range_rate_minimized+0xf8 (section: .text) -> __dtbo_kunit_clk_parent_data_test_end (section: .init.rodata)
WARNING: modpost: drivers/clk/clk-fixed-rate-test: section mismatch in reference: clk_fixed_rate_of_init+0x14c (section: .text) -> __dtbo_kunit_clk_fixed_rate_test_begin (section: .init.rodata)
WARNING: modpost: drivers/clk/clk-fixed-rate-test: section mismatch in reference: clk_fixed_rate_of_init+0x150 (section: .text) -> __dtbo_kunit_clk_fixed_rate_test_end (section: .init.rodata)
WARNING: modpost: drivers/of/overlay-test: section mismatch in reference: of_overlay_apply_kunit_cleanup+0x1d4 (section: .text) -> __dtbo_kunit_overlay_test_begin (section: .init.rodata)
WARNING: modpost: drivers/of/overlay-test: section mismatch in reference: of_overlay_apply_kunit_cleanup+0x1d8 (section: .text) -> __dtbo_kunit_overlay_test_end (section: .init.rodata)
WARNING: modpost: drivers/of/overlay-test: section mismatch in reference: of_overlay_apply_kunit_apply+0x90 (section: .text) -> __dtbo_kunit_overlay_test_begin (section: .init.rodata)
WARNING: modpost: drivers/of/overlay-test: section mismatch in reference: of_overlay_apply_kunit_apply+0x94 (section: .text) -> __dtbo_kunit_overlay_test_end (section: .init.rodata)
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-mgr-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-bridge-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-region-test.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
