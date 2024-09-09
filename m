Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CE51487E2
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 16:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725900217; cv=none; b=sV1WP1JKTg98GTiuiVS5Hy+SoThA/+O9mHlvENPdPhH9sEhC1WxUar3fP/fcX0vC7QjNjolL4bttOx/31tnlNa63lMaGFsDvf6l94NtApOva5rQtNgJM5/L2nGJ0dJV82zJGj3mQvgx5t3ZegblozR/A0S7G+fn0rwjZnZ4Ek3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725900217; c=relaxed/simple;
	bh=Ll6pD/1/KQow5MLK3CqyRKQ5kNpEmiKvEbnPoLr7bEY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FdVxVfYjA7Zxnizt4rBOE40cL61DwcAn0VpcK1m8ijDFaP3XjRQjPM/pawL8Fv24c/JU95RDrnXuk+2zPD1dy4SMaGtVLk4UziiXsIlvvq4HvvrOMzEYRCW97gf5pFremri5mARY+FMA86elefE2lnLKEXFeC0mx/Q7BGfTGXk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U5l4EX51; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U5l4EX51"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725900216; x=1757436216;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ll6pD/1/KQow5MLK3CqyRKQ5kNpEmiKvEbnPoLr7bEY=;
  b=U5l4EX51RqyosTfU+Kdp7ZwRG1A5qLN6GDBcuuBDIX3WogzOnX8+1e73
   ZmYYZxHup49+Uw9tSJpGMy2H/13ANMJQXbm/ik5Y5biki6v2Z8Op+1lxi
   C8iZHKJfUdFzEMejccd3BDEv3Mt/13X01rKI2YVe3SGgva5pnek1QhBJD
   4LUrh254zcCQrefHCsnMGXZUWyvul7MgJg4ty8NrOHQE1p+DfXelmdIes
   JwfAKFaZ84SkWqH0wGJND4pt63inc+ymIhj35j/jnj6r+gw3pjb1sNepB
   byhtYmmlFKAW8xk2if/hxNwGqYdMW0fVaYpIlRJ6QYUQqsvtWp7seAzuL
   w==;
X-CSE-ConnectionGUID: KRsITLDbTKecPtzn3u81/w==
X-CSE-MsgGUID: B/T9U6O/SWu9S3/WG99L1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="35989340"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="35989340"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 09:43:35 -0700
X-CSE-ConnectionGUID: a4GIP1hnR/OgMY7sKkdGqw==
X-CSE-MsgGUID: hYogd15AT0+x7xlRR7H1hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="71139326"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Sep 2024 09:43:34 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snhUB-000EzA-2x;
	Mon, 09 Sep 2024 16:43:31 +0000
Date: Tue, 10 Sep 2024 00:42:42 +0800
From: kernel test robot <lkp@intel.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 10383/10516] WARNING: modpost: vmlinux: section
 mismatch in reference: clk_register_clk_parent_data_device_test+0x1d8
 (section: .text) -> __dtbo_kunit_clk_parent_data_test_end (section:
 .init.rodata)
Message-ID: <202409100054.0DRJYoXD-lkp@intel.com>
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
config: xtensa-randconfig-r064-20231204 (https://download.01.org/0day-ci/archive/20240910/202409100054.0DRJYoXD-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409100054.0DRJYoXD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409100054.0DRJYoXD-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: clk_register_clk_parent_data_device_test+0x1d8 (section: .text) -> __dtbo_kunit_clk_parent_data_test_end (section: .init.rodata)
>> WARNING: modpost: vmlinux: section mismatch in reference: clk_register_clk_parent_data_device_test+0x1dc (section: .text) -> __dtbo_kunit_clk_parent_data_test_begin (section: .init.rodata)
>> WARNING: modpost: vmlinux: section mismatch in reference: clk_register_clk_parent_data_of_test+0x1b0 (section: .text) -> __dtbo_kunit_clk_parent_data_test_end (section: .init.rodata)
>> WARNING: modpost: vmlinux: section mismatch in reference: clk_register_clk_parent_data_of_test+0x1b4 (section: .text) -> __dtbo_kunit_clk_parent_data_test_begin (section: .init.rodata)
>> WARNING: modpost: vmlinux: section mismatch in reference: clk_fixed_rate_of_test_probe+0x20 (section: .text) -> __dtbo_kunit_clk_fixed_rate_test_end (section: .init.rodata)
>> WARNING: modpost: vmlinux: section mismatch in reference: clk_fixed_rate_of_test_probe+0x24 (section: .text) -> __dtbo_kunit_clk_fixed_rate_test_begin (section: .init.rodata)
>> WARNING: modpost: vmlinux: section mismatch in reference: of_overlay_bus_match_compatible+0x2c (section: .text) -> __dtbo_kunit_overlay_test_end (section: .init.rodata)
>> WARNING: modpost: vmlinux: section mismatch in reference: of_overlay_bus_match_compatible+0x30 (section: .text) -> __dtbo_kunit_overlay_test_begin (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: of_overlay_apply_kunit_cleanup+0x210 (section: .text) -> __dtbo_kunit_overlay_test_end (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: of_overlay_apply_kunit_cleanup+0x214 (section: .text) -> __dtbo_kunit_overlay_test_begin (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: of_overlay_apply_kunit_platform_device+0x120 (section: .text) -> __dtbo_kunit_overlay_test_end (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: of_overlay_apply_kunit_platform_device+0x124 (section: .text) -> __dtbo_kunit_overlay_test_begin (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: put_page+0x28 (section: .text.unlikely) -> initcall_level_names (section: .init.data)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
