Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38B12D94B6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Oct 2025 21:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760994224; cv=none; b=YtCpYyBvefcu6jN/e+zcbWg/Cr2kzPWNObnU19ieVWxzYkTkQXNl/Qj1lrXiCwdMZlVDNKkGAp/jKAn4csNXo9dofwo9njlzpGP4aF5unrvd2fg/jqAUFJjFsmIR94ifQtmJVlXjlIBpx9Pp8XQOJ5A+hj93Gh/Sr9D5SW3Ba0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760994224; c=relaxed/simple;
	bh=WiRQKKMw8YU8wQ3qr3d0qrsjgx9N7xfTkkwy58HMCHc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fzwLIHY/GfLMzJnHCKkVpTK0esHKPjOUVNU7TR0ToMT3X8exMUsY5Xa36X/bynApcMr2WVnWGpKEHzCZSV2B2aMNNRach+ZSTDwNwdUkPKkkj3t7NiZXoNusOQnOcGcMrNWlKeQoga0nV/IJc2lZdJunncKRrkzKE5uvvoRkIt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bK1uE1A/; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bK1uE1A/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760994223; x=1792530223;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WiRQKKMw8YU8wQ3qr3d0qrsjgx9N7xfTkkwy58HMCHc=;
  b=bK1uE1A/NJ/bmzZSXTyr8ifYhNoLPqQ8OClk+HPWN9iC02tIAHbqA4IY
   p4XBcahIusaXyap3pOb/51+vG3MF9gZLAT5NJAQyRs1ztamcDdCNnO0a9
   D/H1oX8giBSuQtlEFZLujmyva6N0A7c4eX1w8b/B6BogEqxRnwkyZb70O
   em9acAOZOPR2uOPTT5exotkArT6BSgJn5zyzi6kdj165b2DTIpdt5HlEM
   uu6WOPSjegpvswy4gdgT4LCwc7PkS/InMUXNi03mz6JiRfYfBH5n9J4zx
   h9pvcX7u6EHCAIH58rjmaWgHPdmThtzulEim9QIhvDznIm1xKu8vdym/O
   Q==;
X-CSE-ConnectionGUID: g6p3Lbr4QLybf12D7ERySA==
X-CSE-MsgGUID: n60/GcLaTe+di2ne6wHqNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="65733114"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="65733114"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 14:03:42 -0700
X-CSE-ConnectionGUID: LQ13yIpUQ76NOifvpqBzew==
X-CSE-MsgGUID: OjlJDaarSeuyqgARPl3thg==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 20 Oct 2025 14:03:41 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAx2Z-000AA1-2E;
	Mon, 20 Oct 2025 21:03:39 +0000
Date: Tue, 21 Oct 2025 05:03:15 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lpieralisi:dev/gic-v5-acpi 6/7] scan.c:(.text+0x17b0): multiple
 definition of `iort_its_translate_pa';
 drivers/acpi/glue.o:glue.c:(.text+0x740): first defined here
Message-ID: <202510210425.LsmSa3wZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/linux.git dev/gic-v5-acpi
head:   2507aff522df8a03ac3b31cfd2f5cf564bf77be1
commit: c7e5798c025e652428c0b5164fedfc23d26bea33 [6/7] irqchip/gic-v5: Add ACPI ITS probing
config: i386-buildonly-randconfig-005-20251021 (https://download.01.org/0day-ci/archive/20251021/202510210425.LsmSa3wZ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510210425.LsmSa3wZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510210425.LsmSa3wZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/acpi/scan.o: in function `iort_its_translate_pa':
>> scan.c:(.text+0x17b0): multiple definition of `iort_its_translate_pa'; drivers/acpi/glue.o:glue.c:(.text+0x740): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
