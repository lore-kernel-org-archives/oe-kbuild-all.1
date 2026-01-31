Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC9415B0EC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Jan 2026 23:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769901937; cv=none; b=G1J8+zOL2hlxPCqlfJ0bdQnnYE+wY+g3wTOuC5UmhfYAQiSZWzX5nvoc9i2Ds8kmgeytHW/pMPwgSP6DbyNoysO6GZF5RIXFkZfCMBbM2dFIqv32AXd3ei1UBfJKtzeUVSZjVPzQVqx5JhgYQOz3I7U+F29oPjoI4xaXDkNc3Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769901937; c=relaxed/simple;
	bh=Tc0vZioMYi+nVTEzW5ANCjZXAFA/DuWk+mH8ya7N+HI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HMZ41dEFAy8v9MbFRH2Of9+eRY37YMwO59Tb+2J51Kd4/NTdARAzBaIYId6QiJXjHji226dJMN294JiKyDvAWVa8K2h7FgiEhsYRQeOOWNvAMMGAjJq8fvDlwnN0qVGyhOzhcW10ZH2k+8p7ay7kpmqZpM+j9sCEQAWxcNWWd40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mEFsh2B9; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mEFsh2B9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769901935; x=1801437935;
  h=date:from:to:cc:subject:message-id;
  bh=Tc0vZioMYi+nVTEzW5ANCjZXAFA/DuWk+mH8ya7N+HI=;
  b=mEFsh2B9TUtc5O9vltQ5ByCGxOHaAalmD0+5dF/dxeHznLiSdckySVHe
   asRwluYBdu4HCW2Gc3WXNlbkeJkm+7zPf0oCMVE1mg9t13hAlR/ktSDx9
   7aYj6RAugozeRh+pSS7DaIzEp+jfWgIAUbsw12xczUn1d/fsMWTW5QtuO
   7l2RdXWcq4fukK4alyw4WaHUqjCTqf7do23dUMcZTN27TUMroPpu2kCL3
   uTHek1DdkWozo6SPpFLCR11koTtGguP6pyZ9rYLzTNSiDyiGqwn3Ku06J
   cIHVam+MOX0zgfr9AkFrKO5RV4Awt15nTQs53IBpjHrUUqLI8ennOMxGz
   A==;
X-CSE-ConnectionGUID: pKYcjFjPQbqoYs8bssU3Tw==
X-CSE-MsgGUID: kh7eS6pcTZSJ47DeQwrXbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11688"; a="71273313"
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="71273313"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 15:25:35 -0800
X-CSE-ConnectionGUID: BuIdf3zrSOik4DJKdJ+ssQ==
X-CSE-MsgGUID: 7y527BJDT1iy+LOh8S+eKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="209246021"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 31 Jan 2026 15:25:34 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmKLL-00000000eSy-0Tom;
	Sat, 31 Jan 2026 23:25:31 +0000
Date: Sun, 01 Feb 2026 07:25:30 +0800
From: kernel test robot <lkp@intel.com>
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, Andrii Nakryiko <andrii@kernel.org>
Subject: [linux-next:master 1671/11028] FAILED: load BTF from
 .tmp_vmlinux1.BTF.1: No such file or directory
Message-ID: <202602010713.5ju3mI5Z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Ihor,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4c87cdd0328495759f6e9f9f4e1e53ef8032a76f
commit: 522397d05e7d4a7c30b91841492360336b24f833 [1671/11028] resolve_btfids: Change in-place update with raw binary output
config: openrisc-randconfig-r131-20260130 (https://download.01.org/0day-ci/archive/20260201/202602010713.5ju3mI5Z-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260201/202602010713.5ju3mI5Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602010713.5ju3mI5Z-lkp@intel.com/

All errors (new ones prefixed by >>):

   Complex, interval and imaginary float types are not supported
   Error while encoding BTF.
>> FAILED: load BTF from .tmp_vmlinux1.BTF.1: No such file or directory

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
