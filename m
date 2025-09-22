Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1B4126F0A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Sep 2025 17:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758562138; cv=none; b=pbVWHLzyJJwxbJe5FNXJ8lDHqz/IY9011cZNOhM1Bio5JViKwZuBDBTbxR1Wyk8IvuGlGqbpzXDcuVnoHSgAlhd1UbRQWKbu2mM18VIVa7F63KAyoq3tnaaG0G5NvmaLV//436KQc5F94r2ndqPVqpIzo5ZmgZ+kBlWQB3X+gK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758562138; c=relaxed/simple;
	bh=xCNv41AYXYTrHQP4yHn2w+pj1C6iwlfTfglvykQyl0M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LPsDiO0Y034rX+//WB+KpYz+zKEjutg+ulBoZwmw1EGjXBh8xNhV2bUa8aJqgHc6zsrke0pDplY+0uxwbIi+WT5V39o9s3a7Gb3DAQqFJPwyMo8VD4aTL3k1/geN/w1xBMfu1i0eDMP7ZLHib7IgoU4NX7+jdeY1KMoX0hw0Coc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RN4cg20i; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RN4cg20i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758562136; x=1790098136;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xCNv41AYXYTrHQP4yHn2w+pj1C6iwlfTfglvykQyl0M=;
  b=RN4cg20i40NOpAP0q4cC3CGjllyN9PLiW0ZFjua4We2RBR/bERvvYFRh
   9QkL7vgXK3hN4qa4S2xLt/wLn6hfzXpqvZhZivd/052erIPCqc9i+cYFm
   L7flGAx0cPadkVUODg8oNpU4wciBxv+TB0+eXwZioRg0uXVi6eGzjwrRS
   E+xfLnn9HiRc/mecBDSVBeH+HYO8kS9u3zzn4n2sNRwgpPy3VrvJsaE/t
   ush4t9I9+s6cf4OvxWP9ytR47oUHJ1gj+KoAyleQ7015b1QAdOZT0Tv0h
   Tp32kuS+pqG+8zCoKCLMpekyB33V7dE2u4fGcCXAxuKbfhmu2P/TxmGgK
   g==;
X-CSE-ConnectionGUID: 2qIaF8D5RlCNPCh3HPcrQQ==
X-CSE-MsgGUID: A3ibWi0mSLiOsopKT8BPCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="83433567"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="83433567"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 10:28:56 -0700
X-CSE-ConnectionGUID: M0OwnVIKTIuxTujCxgnEoQ==
X-CSE-MsgGUID: IekEaWhzS2KZahzXqfH5TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="207269885"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 22 Sep 2025 10:28:55 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0kLL-0001uL-3B;
	Mon, 22 Sep 2025 17:28:51 +0000
Date: Tue, 23 Sep 2025 01:28:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Tong Tiangen <tongtiangen@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2908/2908] aarch64-linux-ld: Unexpected GOT/PLT
 entries detected!
Message-ID: <202509230112.Wo3aqoIO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tong,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a159deb279dfe156316d8c3957dc7f253686ff83
commit: b991780c836ceb9a479c6c6e385e914b487e353a [2908/2908] arm64: introduce copy_mc_to_kernel() implementation
config: arm64-randconfig-r112-20250922 (https://download.01.org/0day-ci/archive/20250923/202509230112.Wo3aqoIO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250923/202509230112.Wo3aqoIO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509230112.Wo3aqoIO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64-linux-ld: Unexpected GOT/PLT entries detected!
>> aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: mm/kasan/shadow.o: in function `memcpy_mc':
   shadow.c:(.text+0x56c): undefined reference to `__memcpy_mc'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
