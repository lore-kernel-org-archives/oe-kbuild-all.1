Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C28D4B1E4E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 May 2025 07:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746516948; cv=none; b=AMhjffUoGXCrxKZ5TZ9M/UOVFoIQHW+AhpCJHExXrO3YHvtl2JXAIX6UXXN0fn5DFIPzPR8OvItoLe6WTVuZp0jM14NpTnrON57YKlie348RUILK0P9MZ5FX8//53W6tN4NcOA3H5KP1BcvFuxwP7XqcZ8glCipeQNN6HbdczC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746516948; c=relaxed/simple;
	bh=uK8/9FRnLPM9GPCAJ7ILz3qDGB023t+ecIJNBzcSVGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jI8QEFdm7rQB7Ob2zgZjwIFYGSc4xbdcW82PXATHgiS+Xw+kDH4Zx+/+zf7ihbXvgtEIUQGdyOWy3MWCZDwFr0QFqtVUC5OulVhaXhSxBo2xhYYiPft5cWF4zwf6IveaVSSBMBDmz2coDPaTTD795zGWl9yhZP+qXpNuZgacWMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=INBKsjxW; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="INBKsjxW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746516947; x=1778052947;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uK8/9FRnLPM9GPCAJ7ILz3qDGB023t+ecIJNBzcSVGU=;
  b=INBKsjxWkEA5uAeVNlzFb1uUx9X/5ofE2WmlZd3dhdBDvCeSfpYGg/K4
   8nDDE3B7MCsquF9xiIQ7hMzNhXaqkV4o0xsWmQVoKtc+jV0Fm7g2U+BQ9
   8Vq2HL3z9wCyBYLeAwgUM51UtEk93GvUOygp3g+V6FliQhUy1a+H9SewM
   CIyi/Hvnn3D6c6NS8/Dm72DtWncyZIWX33geQ9v9IbQQ1GQtQ6bqokquJ
   aECvjOErIw6+AbGxIUWkBpo84c0nfjfcIUt81NzFb33RrZqZ6xliNRAqQ
   O0rOzy7Fhi0b7B8gTRyHZ1YZrMiLK+ldDPNJomGl1Xmwvy+YwE+Rz40XT
   w==;
X-CSE-ConnectionGUID: EXpnt29hTw+snR8sb0D1NA==
X-CSE-MsgGUID: v3dvml6/Skma5G4frAqsog==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="51976507"
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="51976507"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 00:35:46 -0700
X-CSE-ConnectionGUID: mHGcjyLHSTGJHl/IXzVPdg==
X-CSE-MsgGUID: WvpRjWZmR7Gh+FJ9vmqgug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="158778848"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 May 2025 00:35:45 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCCq7-0006MX-0N;
	Tue, 06 May 2025 07:35:43 +0000
Date: Tue, 6 May 2025 15:35:07 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 4/4] stackleak: Support Clang stack depth tracking
Message-ID: <202505061538.UstNlqYf-lkp@intel.com>
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
[also build test WARNING on soc/for-next linus/master v6.15-rc5]
[cannot apply to kees/for-next/hardening tip/x86/core next-20250505]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kees-Cook/stackleak-Rename-CONFIG_GCC_PLUGIN_STACKLEAK-to-CONFIG_STACKLEAK/20250503-030310
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20250502190129.246328-4-kees%40kernel.org
patch subject: [PATCH RFC 4/4] stackleak: Support Clang stack depth tracking
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250506/202505061538.UstNlqYf-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250506/202505061538.UstNlqYf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505061538.UstNlqYf-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: xbc_exit+0x28 (section: .text.unlikely) -> _xbc_exit (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: pv_init+0xd2 (section: .text.unlikely) -> swiotlb_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: pv_init+0xd8 (section: .text.unlikely) -> swiotlb_update_mem_attributes (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: hypfs_fs_init+0x24 (section: .text.unlikely) -> __hypfs_fs_init (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: hypfs_diag_fs_init+0x24 (section: .text.unlikely) -> __hypfs_diag_fs_init (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: memblock_alloc_from+0x3e (section: .text.unlikely) -> memblock_alloc_try_nid (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
