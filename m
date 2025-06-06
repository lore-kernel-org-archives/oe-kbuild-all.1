Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA0D1DF269
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Jun 2025 03:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749179705; cv=none; b=hQXILwr0W9K29tZ8+5aO+4mM27zSWV1vysRqre9vTze4qzxKO0ZAXVZ+PzyixEieddlsHDIavmpimAYq1jioFcS+2YecOFjgLhZ1qTFMMJw5Wpg6nza3jIcqEtat/XWl4jRt9YkRjpNJjHN6y8QtY3gTEbITDZPanR5w0LVo2Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749179705; c=relaxed/simple;
	bh=L1cFSUtxnWAG9M4MTxiraOjhlBRKDXKg4uJvEPwUVnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u/RI+2uwNyRnRauICFSaLOR/J4qmZIKahx9r6TEldnArzFNO3QYGDCXCHJGIAaTDK55Gyr0Sau2fl9ThMkOoGlFUieGKm0EAAcmg1lH9ty4MUVwKvCK1S76t/+wfAXRu1IIlUe7E1mOhwdMb6qThofaEgkLGLrRZYpsarEfO2PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JcUIblUv; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JcUIblUv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749179703; x=1780715703;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L1cFSUtxnWAG9M4MTxiraOjhlBRKDXKg4uJvEPwUVnw=;
  b=JcUIblUvKGyKj8niVhCiwspVpc+JR3JvaJldVkprNdOS/iEmFX3Pk+zC
   f+A7kCL3ONkg1PXA8iCbXmPEaXlAWOWzCwuL50StITNbWN5RVuiSgurEW
   OJeRIBYMm5+Hbf5Mo53HVG6INY0qKQmwEan03FLPkR1UPid1cryi0CRAX
   9f+UGTbwzOMArPIuEs0VrK3Eq6j+sApm7P0NxIKS9UKaS9En9pXiCzEzF
   kuJ3XWKKtjXw/6RNu+/GOhpOAuZtXisWEVFo7G/hncvkN4e5bOO+opObY
   ZSl32h7hQ/QaFGUOICHD04oDau+Q+lyUIXNxyjfRtxtUBh2BqypgEjqee
   Q==;
X-CSE-ConnectionGUID: nfxFrKHWT0WuHgxFaGzT7w==
X-CSE-MsgGUID: ywkTqNPQTSKZ8KTz83pFSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="73854579"
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; 
   d="scan'208";a="73854579"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 20:15:02 -0700
X-CSE-ConnectionGUID: hh0qBrUvTeiPeZjfMXGxJg==
X-CSE-MsgGUID: SajCl+kDQ4a/Be1i+Lnmeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; 
   d="scan'208";a="146664348"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 Jun 2025 20:15:03 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNNXn-0004hV-0k;
	Fri, 06 Jun 2025 03:14:59 +0000
Date: Fri, 6 Jun 2025 11:14:40 +0800
From: kernel test robot <lkp@intel.com>
To: Zaid Alali <zaidal@os.amperecomputing.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v8 5/7] ACPI: APEI: EINJ: Create debugfs files to enter
 device id and syndrome
Message-ID: <202506061143.AhpoJnGI-lkp@intel.com>
References: <20250604223804.842501-6-zaidal@os.amperecomputing.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604223804.842501-6-zaidal@os.amperecomputing.com>

Hi Zaid,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on rafael-pm/bleeding-edge linus/master next-20250605]
[cannot apply to v6.15]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zaid-Alali/ACPI-APEI-EINJ-Fix-kernel-test-sparse-warnings/20250605-064102
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20250604223804.842501-6-zaidal%40os.amperecomputing.com
patch subject: [PATCH v8 5/7] ACPI: APEI: EINJ: Create debugfs files to enter device id and syndrome
config: x86_64-randconfig-121-20250606 (https://download.01.org/0day-ci/archive/20250606/202506061143.AhpoJnGI-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250606/202506061143.AhpoJnGI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506061143.AhpoJnGI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/acpi/apei/einj-core.c:67:3: sparse: sparse: symbol 'syndrome_data' was not declared. Should it be static?

vim +/syndrome_data +67 drivers/acpi/apei/einj-core.c

    53	
    54	struct syndrome_array {
    55		union {
    56			u8	acpi_id[16];
    57			u8	device_id[16];
    58			u8	pcie_sbdf[16];
    59			u8	vendor_id[16];
    60		} comp_id;
    61		union {
    62			u8	proc_synd[16];
    63			u8	mem_synd[16];
    64			u8	pcie_synd[16];
    65			u8	vendor_synd[16];
    66		} comp_synd;
  > 67	} *syndrome_data;
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
