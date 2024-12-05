Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F101B4123
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Dec 2024 20:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733431800; cv=none; b=PqTblJXbFnXjgvG/l11JpdGB5H96TI/+reUpEaF3caMYBQMGCZUg2Asj77HX9XzT96ikHrnljBc465/4BdnrjUW+FGqevjwSemMMQajkcy2F0Z6jpPNYNSqZPMoco6UVMlzhyAVwhgZS/KPWEFWLCfG98uqF4DVfAlR/Dgofbe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733431800; c=relaxed/simple;
	bh=Why5Nm8GLF/nDkjnQKhBre+oX5JL9LsNfqUoWF7Q2Z8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G0CtQ7e5uzAma+hJskMTjRh37ZdxnuLCfaMwUiG824wFxowR1sVLi571lwZwS8TZwvBSRqVzEK0rey9O4VMk4hbDQ+JACkDYcmszJBupKT3YBfM5YtkOCAgD3JgwqSwE/Se5zLQxmJXntvio4hu7JPr4qoAJF8eXLErkqNVV90A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hBtVJSdA; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hBtVJSdA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733431798; x=1764967798;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Why5Nm8GLF/nDkjnQKhBre+oX5JL9LsNfqUoWF7Q2Z8=;
  b=hBtVJSdAKLEI+GMD/Roauxk7atqK2Wa91m4XGeHCaDgR4vPQN6jtVFx9
   kK0hSpdOsvuQ2GaszYy4lSCPxeq1waDsLnzlBA/MPwamMw/gF/p4iUhFE
   rnw3nWIiK9bqyUJnLJTkTz3Y55kP1C6V1w/h9qbVMmSTg9ZULO+s2DC09
   F6u+8IUilBAFFODqRXLUEMCEp95ApsUVe/S3kOOXZUFR2jloSPSVCl6rW
   bMZ1lfe/gAy6YnioGVrh8pjTSQhes+tQGr7x7GWNZwLM9XHEXLrTTqyPa
   sKyMQ3cMlcPv62AeITQFdysCPkcHGMNOKgsEI0THhg66UWAteqCin5Lpp
   g==;
X-CSE-ConnectionGUID: 5B37PxCuTyiV2qurDTbhrg==
X-CSE-MsgGUID: lhpWSEOPSs+QoFJGYsBKtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="44795419"
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; 
   d="scan'208";a="44795419"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 12:49:58 -0800
X-CSE-ConnectionGUID: EayVTB4pR3WNhvV5DPQoVg==
X-CSE-MsgGUID: 0NwuezABTnG8r9XdC4eRww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; 
   d="scan'208";a="94652654"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 05 Dec 2024 12:49:55 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJInJ-0000Np-0S;
	Thu, 05 Dec 2024 20:49:53 +0000
Date: Fri, 6 Dec 2024 04:49:24 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Ingo Molnar <mingo@kernel.org>
Subject: [tip:x86/boot 4/7] head64.c:undefined reference to
 `level4_kernel_pgt'
Message-ID: <202412060403.efD8Kgb7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/boot
head:   faf0ed487415f76fe4acf7980ce360901f5e1698
commit: 3b6f99a94b04b389292590840d96342b7dd08941 [4/7] x86/boot: Disable UBSAN in early boot code
config: x86_64-buildonly-randconfig-001-20241206 (https://download.01.org/0day-ci/archive/20241206/202412060403.efD8Kgb7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241206/202412060403.efD8Kgb7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412060403.efD8Kgb7-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/kernel/head64.o: in function `__startup_64':
>> head64.c:(.head.text+0xbd): undefined reference to `level4_kernel_pgt'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
