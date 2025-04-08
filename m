Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA92210E5
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Apr 2025 09:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744103169; cv=none; b=sqFIk7rp6/m+vd115O0oy8gjw72jcQtOgzCJj/yrFnJgybiOFjK2F6V0HlQABPj13Bvokg8ahcu2Bg7lPpUrQvSL2CbXu+Gm495moGeOo1K6YoABe6BdrDVX1jKudLg/uEoPrTeD/9ZWX/npJ/25bUom3LNLopwwjWjF7vHbzos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744103169; c=relaxed/simple;
	bh=8ADOVNzUZQcFF7UcByqQVW8h3j5VmR+VFdtUo+lsa64=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Scni+M864cKFAPrtU+IgTnH05GM21A4VraLWIacLX4++F+64S94+fmQFL8PsOpq1BQYeDeZ35KY8zuvsoJ4/PdLOQt0qIThYiwvFi1uNGXgYGdCxKjH8MdcTu6cB6JD0vola3EvybBNp0hpIVrBItQ4PcI/G3lp0qPk9GR0xI40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AyUD1eUW; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AyUD1eUW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744103164; x=1775639164;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8ADOVNzUZQcFF7UcByqQVW8h3j5VmR+VFdtUo+lsa64=;
  b=AyUD1eUWB5ALMiW5V6lBhCcygLitev7lBg6xTknGrPZoL8lBF0vrU+Gc
   kB0RVYS9+DOiAz/nxpxcEESeUlKHGnonEW7ppRvDK+hHUaTP7Wwa4kGk7
   wLZHmYPhrqN799yQriDCJg1KCvtu1OOZOf0oIOWm+2GHEJbsdRwOvwsSp
   u48/0/hNoy2aPzODL+IJLhqFKLUKlE1GyEFDizsdwi5fTpm06ckW26jNl
   Y+/O/2EWj0NrLA8RkLYvK5AWQjp/8oqmcmCLIP8M9Y6YxVgEBQ/3QRKVK
   nhLLsSKFZ/6iWJSrfaYT1XV+FUq72HB5V92xzvJbw+RQYFdVVpRJiZTqD
   g==;
X-CSE-ConnectionGUID: WsnOhoYhSf6A4LCutWv7FQ==
X-CSE-MsgGUID: h/w3BlTzTBK5jqm52EKB9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56503406"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="56503406"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 02:06:03 -0700
X-CSE-ConnectionGUID: an49ba4DQsmF0+XwTo5UOQ==
X-CSE-MsgGUID: N5r9Mmc8QKm1wcYuo+5sgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="132931192"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Apr 2025 02:06:03 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u24u8-0004MM-39;
	Tue, 08 Apr 2025 09:06:00 +0000
Date: Tue, 8 Apr 2025 17:05:02 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:move-drivers 6/6] ERROR: modpost: "mlx5_query_module_num"
 [drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.ko] undefined!
Message-ID: <202504081739.oO5yJrIH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git move-drivers
head:   1874ed319b2149826f13f3f49b5dd82905bc1c5a
commit: 1874ed319b2149826f13f3f49b5dd82905bc1c5a [6/6] drivers/lib: Move mlx5_core to dedicated place
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250408/202504081739.oO5yJrIH-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504081739.oO5yJrIH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504081739.oO5yJrIH-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/tests/slub_kunit.o
ERROR: modpost: missing MODULE_LICENSE() in drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.o
>> ERROR: modpost: "mlx5_query_module_num" [drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.ko] undefined!
>> ERROR: modpost: "mlx5_query_mtpps" [drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.ko] undefined!
>> ERROR: modpost: "mlx5_set_mtppse" [drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.ko] undefined!
>> ERROR: modpost: "mlx5_devcom_register_component" [drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.ko] undefined!
>> ERROR: modpost: "mlx5_cmd_exec" [drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.ko] undefined!
>> ERROR: modpost: "mlx5_eq_notifier_register" [drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.ko] undefined!
>> ERROR: modpost: "mlx5_devcom_get_next_peer_data" [drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.ko] undefined!
>> ERROR: modpost: "mlx5_set_mtpps" [drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.ko] undefined!
>> ERROR: modpost: "mlx5_eq_notifier_unregister" [drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.ko] undefined!
>> ERROR: modpost: "mlx5_devcom_comp_unlock" [drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.ko] undefined!
WARNING: modpost: suppressed 190 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
