Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD4114D29A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Sep 2024 08:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727165111; cv=none; b=WFe6DsHvjO83Bpl69tumvLXpkF4RT9+hN4201fCuHSsWrzo7BN8JcdRq0OvL/eL00Vs5+o7GVps+XBaOkDbukGrsjKhVbrAboNbtwGnv/tPd8a/3xUIZli8T+jmZemlAXM6NjbkJTHNY3jMPaFu8v7ghEIr4ps/J6efNWX4HSq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727165111; c=relaxed/simple;
	bh=U70LLm9gCuc3iANmj5u7WQMe0wYwMNV6QPzLYyJ6k9A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MXftv/it2PEywIJyt/aVs+k53wlq2VOcgQrF2Z2BrEa6uGtWaPRGxFlHBCp0XEtMmaWPgR7C9Q7E0YAatBdh7Hp4d+hscy58yW3JtLqbFM3x+d5V5S+RII/IRZb0BOsFDRm7iBDMohxXRd4wLgYvUyFWEar1OE6swLAlIi/6SaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=evWwac3i; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="evWwac3i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727165110; x=1758701110;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U70LLm9gCuc3iANmj5u7WQMe0wYwMNV6QPzLYyJ6k9A=;
  b=evWwac3iahg7Ec79Wiq/votTYOv3TR/9jWB2MeyvRRr6HEouRsVm3Zxy
   lIUMWe21frSmUvNIasJ8uf9wFDe5OMNxXtsRd10nayVxh5H3r684C93mG
   mQnnJyd5sDky64NMvhQaNvMp7XLvsWDcNiBk5cT/ZDMQriPU3d2/Gs+fk
   mVgZokI+Agb7HTVEh3XSZGLqzwe6pHirFbHJEUA/mXr5dnoU9d9T0C4VW
   +V1AvZfEix9SEZYvTjQvw2aw43qV4tqvCWHYB4RBr86KZtpUOkXejwfTX
   W7oQlP+ZJs1tT2+iTvKxv/mjT1mvxlmCBHxk+wRB2l/TFpiHtnKlh9tBc
   w==;
X-CSE-ConnectionGUID: oSTVHpPeS7a1Tvdsgg37rQ==
X-CSE-MsgGUID: NnHUny0DTaWkF6mR0pon5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="25963970"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="25963970"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 01:05:09 -0700
X-CSE-ConnectionGUID: saVSRekCSEq5Gls+O67gDQ==
X-CSE-MsgGUID: OqEb2II4STG7SvHvW5KeXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="72166189"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 24 Sep 2024 01:05:08 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1st0Xh-000I6E-37;
	Tue, 24 Sep 2024 08:05:05 +0000
Date: Tue, 24 Sep 2024 16:04:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:mgtime 8/13] kernel/time/timekeeping_debug.c:66
 timekeeping_get_mg_floor_swaps() warn: unsigned 'sum' is never less than
 zero.
Message-ID: <202409241549.UDfBa14A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git mgtime
head:   20490d956a00f097e09ed6d3073b6231aaa0195f
commit: 6135c3c69350e84fa9c43b8c1b23a3f61bebe852 [8/13] timekeeping: add percpu counter for tracking floor swap events
config: i386-randconfig-141-20240924 (https://download.01.org/0day-ci/archive/20240924/202409241549.UDfBa14A-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409241549.UDfBa14A-lkp@intel.com/

smatch warnings:
kernel/time/timekeeping_debug.c:66 timekeeping_get_mg_floor_swaps() warn: unsigned 'sum' is never less than zero.

vim +/sum +66 kernel/time/timekeeping_debug.c

    58	
    59	unsigned long timekeeping_get_mg_floor_swaps(void)
    60	{
    61		int i;
    62		unsigned long sum = 0;
    63	
    64		for_each_possible_cpu(i)
    65			sum += per_cpu(timekeeping_mg_floor_swaps, i);
  > 66		return sum < 0 ? 0 : sum;
    67	}
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
