Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B6517A314
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 May 2025 08:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746434223; cv=none; b=NlmZnr2YoaDVePJ45fJoPimVXiMy9e0uKFXZf4cjrUYICi51CIxBsbqALxJian/5iZYZ4WAC693xsOtrntb8VEK9srOFoTyU/4UFiJ1IjGKDSPvWG9EY9EL2ErpD4GX4X3K0WUlqssIfHfDGR5HR27fTo+Eu9/4eoX2uv988NNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746434223; c=relaxed/simple;
	bh=On67f+Oe4EWbXHf6wa7DuuERKOqE3xyv9ffQwtiJ4Mo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GJLVNoVT5iM0rMFQXxACNj6UxzRwDTpJP/1EjuapkQo8ZrZNR6OPJfo7qyqQjHIUdcOZQkbXG2FdK9jhGaYjchl4O9reHPb9GLB6dGgRoceOdiF2hx3V104OyAijSPbZlnFo6T1n3A9Np1nXK88vfuKRHxq1q04HxUjM4gDVJIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gYrlgBLV; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gYrlgBLV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746434221; x=1777970221;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=On67f+Oe4EWbXHf6wa7DuuERKOqE3xyv9ffQwtiJ4Mo=;
  b=gYrlgBLVouJKIXk48I3ikjcBsZ2iXnR5OKDxFjS9GHXbOgJkmlyKzH+r
   T4p5I5r5D3O9od8T9y9vuPkdJ6E1MaGt79ieQSkG1tsvhNQTGfUlOUOrx
   CaN1FN7fqRlkxcouAWNl8SWbSGLmtLb1oMrWQp+I+mbYtE4s40q7TwjcZ
   1ttbEaJWJUUtxGn9X8bWP7+HpNbgB8DAzdc5wF4NRbG/RCG/ZHe50+0bs
   jrc5RyFVWRNLAj3+KICsFA8dtvTGNnNc7R7hRcE/67nG2PpSQxShv9PDH
   pb2yx+wYTE82rZUgYUmrrPVKbXPb2sDZJydluTM0YKlUloHUN3UUiZ38z
   w==;
X-CSE-ConnectionGUID: TrUF+S8iQqqm3andknQNvQ==
X-CSE-MsgGUID: ORMukXTORxGVav3iwykdbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="47928435"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="47928435"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 01:36:58 -0700
X-CSE-ConnectionGUID: ld/WxysKStGKgYPJhlWrAA==
X-CSE-MsgGUID: burjrElkSMudkxU0HAOl9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="135141919"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 May 2025 01:36:57 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uBrJn-0005e1-21;
	Mon, 05 May 2025 08:36:55 +0000
Date: Mon, 5 May 2025 16:36:16 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 4/4] stackleak: Support Clang stack depth tracking
Message-ID: <202505051411.vxkvCvJF-lkp@intel.com>
References: <20250502190129.246328-4-kees@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502190129.246328-4-kees@kernel.org>

Hi Kees,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on soc/for-next linus/master v6.15-rc4]
[cannot apply to kees/for-next/hardening tip/x86/core next-20250502]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kees-Cook/stackleak-Rename-CONFIG_GCC_PLUGIN_STACKLEAK-to-CONFIG_STACKLEAK/20250503-030310
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20250502190129.246328-4-kees%40kernel.org
patch subject: [PATCH RFC 4/4] stackleak: Support Clang stack depth tracking
config: loongarch-randconfig-002-20250503 (https://download.01.org/0day-ci/archive/20250505/202505051411.vxkvCvJF-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250505/202505051411.vxkvCvJF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505051411.vxkvCvJF-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: constant_clockevent_init+0x3a8 (section: .text) -> get_loops_per_jiffy (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: xbc_exit+0x18 (section: .text.unlikely) -> _xbc_exit (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: plat_smp_setup+0x14 (section: .text.unlikely) -> loongson_smp_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: early_memremap_ro+0x3c (section: .text.unlikely) -> early_ioremap (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: early_memremap_prot+0x3c (section: .text.unlikely) -> early_ioremap (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
