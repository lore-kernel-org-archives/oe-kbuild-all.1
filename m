Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EE1469D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 May 2025 01:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747530761; cv=none; b=Qk1OAMtCJVSnjLIjAdWcmvXmgj4Sxium8puh3RLCXPcUB1B8RdwbLCuggQk9DCv31fVVoILJChyxOLzMi3qVqUcJBjwJJ2zfY8bylmAXpwHOJH7OBz8bUiIrL3WlN6LOkrK3pyDfgqUjfuGTVnhqY+/08wvnA3jbN3niGRMBFXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747530761; c=relaxed/simple;
	bh=762NU7MzLVFQRPxGpiPhmOtSelCJW9KgvN/dmYQ2FhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UKiR9IMki4zdQ5jEZBv0W4Cj9ERA4Lp6FLEEyFjxeib90Q+QEeslj724UeOixg95P0LB61HyU5Hr0ZC2ifb910RhZ31NaumNQNNOuSJdCZanVF6jEX+RYoRCMZslig6ZcdsAuZ0qMzoxiqSu0DVhKdEHYBQ8frPNBQUSxKNhb4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AZe2RYn/; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AZe2RYn/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747530759; x=1779066759;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=762NU7MzLVFQRPxGpiPhmOtSelCJW9KgvN/dmYQ2FhQ=;
  b=AZe2RYn/t6pJkH/JNuCyGvThuEZXcDfnNuBRTrDlmpv/wVDwqvAoRKAW
   tZPAanaWig+2OYzgQuDVBnAg6ZWwWEH5FJLNKwgG0YnurTOwlkDwNGBGb
   ijfXDriqJtO+YYw3MTzDcRFhwUJ0FA3igvFAh/glQ+/bDfmjkTpMQK4Lj
   sCjTTbWHghAAq14Am1JZpOXDRnNNMaZceyBQNd10hJFYoGWaYfZKSv2Ub
   w4ApV7Nrxi41l8SDvf8baKR0kIwqqfdPopZL7AeZ85MYQ0xC3CzkDUDSU
   dnQg5nLj1twtgA4kQLD8c0MfOoYGHzFhGuEsHL8OT51BfIgfKDfgNrKRN
   g==;
X-CSE-ConnectionGUID: EggHhm1WTSKUQukaDvcncQ==
X-CSE-MsgGUID: o0qtyHouTCSBTEVadh95PQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="60493673"
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="60493673"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 18:12:39 -0700
X-CSE-ConnectionGUID: WdfkUNugS9Cu2HRyIwO4rg==
X-CSE-MsgGUID: Txthax6dRd6tjhp6P/aJBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="143904890"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 May 2025 18:12:38 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGSZw-000KXD-0C;
	Sun, 18 May 2025 01:12:36 +0000
Date: Sun, 18 May 2025 09:12:22 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:la57-cpucap-v4 5/6] kasan_init_64.c:undefined reference to
 `kasan_early_shadow_p4d'
Message-ID: <202505180909.WbKNhTKm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git la57-cpucap-v4
head:   51ac31cc5bf5d24277d69246d6e89e67b10d5348
commit: ebbbb0910e2fb82b773ba3b0ced0f843eed79436 [5/6] x86/boot: Drop the early variant of pgtable_l5_enabled()
config: x86_64-buildonly-randconfig-005-20250518 (https://download.01.org/0day-ci/archive/20250518/202505180909.WbKNhTKm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250518/202505180909.WbKNhTKm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505180909.WbKNhTKm-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/mm/kasan_init_64.o: in function `kasan_early_init':
>> kasan_init_64.c:(.init.text+0x75f): undefined reference to `kasan_early_shadow_p4d'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
