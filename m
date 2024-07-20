Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944EB12C53D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jul 2024 20:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721509193; cv=none; b=tz0otCGTQOURBUIewVo3IdiAiHi1ofYApcwFggvRc/1uLU5mXtG7TR1KdFBXlktKkWLwsr/ZAJJQ6SaWLRei70XTshHo7iXj9v5XVmKruwgQedr4cU1FCGQvPgeVvzh8zHktp/IYh5ftxAbZlxrPUj9QSH1bY8rtb1CNlDay49A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721509193; c=relaxed/simple;
	bh=XPgR9I/Q9VCqGCvsXI/SvjP0cbYB4ZIx4WOwCP7H9yI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MrjxAUY8vqp9dKDYGxlzSP/GA2D2Hn1K/p9QLM2vLFe90fP5M2ttics7/b1zBybhKmT7ASd8YFy8468kUxI5xNtUTZeAZecEVreHE95jdsjcVYDDLppQh8OOljIgSB9EjTvGYyND0NawZMbTZxHoZWqz5CCChMylAzRIwpiNF2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VMSXGYR/; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VMSXGYR/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721509192; x=1753045192;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XPgR9I/Q9VCqGCvsXI/SvjP0cbYB4ZIx4WOwCP7H9yI=;
  b=VMSXGYR/UMyN+hcVHcwmod/FMavrqCMdccN8f3R2t2uwSvOyx9PH0qjH
   RAYxowmPuwirakYDoz+Wn8PS4jZEgtoirmKY0VNhkauBSjZMCfbs/2AFJ
   nX1GdsnarW7I8fve6IyNNLmSaHKIX46Kz3hQlxzWoOfmXbKA53U2nEXai
   XoBrxsjYSV6CYWqFqIexdqkMkvsaD3yveE+MnjSPbwj9qBtJutGxlcV/F
   W9KZsUy4h0VjvD/7vSSU81TZgOj1vzHP/Ajj0u52Mir6/HSCOxchvZPZp
   Gj8bQMWaRsT6KpkngwJmh9KNvDhCclNfG07H6DtVQHgVEyQ+PwVWg/vkc
   g==;
X-CSE-ConnectionGUID: Oikvl/S/QPCgLcXQXuc5/A==
X-CSE-MsgGUID: 8rf4DVNnS7ehjm7e3jfGTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="36547892"
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; 
   d="scan'208";a="36547892"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2024 13:59:51 -0700
X-CSE-ConnectionGUID: QD8Ot+QcQXummPm28b1YNg==
X-CSE-MsgGUID: OcoeZINsRF6Ltvv9m6+WTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; 
   d="scan'208";a="51513178"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Jul 2024 13:59:50 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVHBD-000jde-2L;
	Sat, 20 Jul 2024 20:59:47 +0000
Date: Sun, 21 Jul 2024 04:59:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-partner_predev 11839/13790]
 drivers/misc/pkvm-smc/pkvm/pkvm-smc.c:16:30: sparse: sparse: symbol
 'pkvm_ops' was not declared. Should it be static?
Message-ID: <202407210425.WY6uxuOd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-partner_predev
head:   16fd47ba32e2ea1f779645a25ccac2ea07911bd9
commit: eea6841a3b9606ed64907c77030b1d50ebdd56fe [11839/13790] ANDROID: misc: pkvm_smc: Trace denied SMCs.
config: arm64-randconfig-r113-20240716 (https://download.01.org/0day-ci/archive/20240721/202407210425.WY6uxuOd-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce: (https://download.01.org/0day-ci/archive/20240721/202407210425.WY6uxuOd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407210425.WY6uxuOd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/misc/pkvm-smc/pkvm/pkvm-smc.c:16:30: sparse: sparse: symbol 'pkvm_ops' was not declared. Should it be static?
   drivers/misc/pkvm-smc/pkvm/pkvm-smc.c:50:30: sparse: sparse: symbol 'allow_list' was not declared. Should it be static?
   drivers/misc/pkvm-smc/pkvm/pkvm-smc.c:107:6: sparse: sparse: symbol 'filter_smc' was not declared. Should it be static?

vim +/pkvm_ops +16 drivers/misc/pkvm-smc/pkvm/pkvm-smc.c

    15	
  > 16	const struct pkvm_module_ops *pkvm_ops;
    17	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
