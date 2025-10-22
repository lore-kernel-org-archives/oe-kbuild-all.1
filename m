Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570F9296BAA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Oct 2025 11:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761130899; cv=none; b=VR6voi+6eG0QT3ypTEXGg6G2FgJeuzM90y7p/+COWLhksqfABg1U9LXBALdnceOyZAiQ8Yl9OlDK5TyskhFgMJ33excIfU80WOcetL4OERTdbmEuXQotN2gHg/3v1qngMUud2oC2bNmrQEO9uIi5xT0EQMX560FJnQGvm8rWUMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761130899; c=relaxed/simple;
	bh=uvucSDq1YjA1yUQnZDUiUavuZUbDMM9M7nqzD8WAbEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tTxJMP+utrIK4r0F03JfGD4A3IxlMTA6WkCbz1DyKJvAxuZz8W6TcuSfn4n9YZLTer2tZMP7OVZofTFQzkEKlHkyQZoMgS9P+bDAg74fqzNvl/TMemcjY4clhMqcJzYCyvwQwplheG2krLYTUp8/F+I/OZpGTtyotItcBlUt5hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fKcddpyo; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fKcddpyo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761130897; x=1792666897;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uvucSDq1YjA1yUQnZDUiUavuZUbDMM9M7nqzD8WAbEA=;
  b=fKcddpyoGn2lun69t1vlJ5g5oEfpeQM2CfSmiU9sSHzfgRe0We8n6aos
   mNGnbAzoFZZ3nyAA92QXvxrgqjrpohYXOrYo8MikNl2ctEyg2tPR0qwn6
   iAgmjVuv5iHmgsqfTXrSdQictZqsevUme3L5c1h7plnrsxdmJYO9lrcKo
   QT9R18MtRWSKU0yuZCDH1RsloX1187L/w9yZGogCOHp7/k5DYF23LptTu
   TAUtnyEFgG+HSerRPvjNRj8Lgy7Oa53Y8Ao0a6f9g341zZXCB3Evx5jRd
   b84Uw6Nd29PPHJz/vOVNX/6gUrqG9XbKTUfjarEpRd9kuUBiS46Pc+hi1
   g==;
X-CSE-ConnectionGUID: /37ktXSxRfGOFLOKjPMZXA==
X-CSE-MsgGUID: 5ZG1h+7uSPKdiDSveE3gtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63196228"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63196228"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 04:01:37 -0700
X-CSE-ConnectionGUID: 4xou6X6VTJqERfUkjjw/uA==
X-CSE-MsgGUID: JBlHJvGpRSyBoRdEVvxOSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="214486012"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 22 Oct 2025 04:01:36 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBWaz-000CHN-2N;
	Wed, 22 Oct 2025 11:01:33 +0000
Date: Wed, 22 Oct 2025 19:01:26 +0800
From: kernel test robot <lkp@intel.com>
To: Bernd Schubert <bschubert@ddn.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC] fuse: check if system-wide io_uring is enabled
Message-ID: <202510221850.5NVG4IAB-lkp@intel.com>
References: <20251021-io-uring-fix-check-systemwide-io-uring-enable-v1-1-01d4b4a8ef4f@ddn.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021-io-uring-fix-check-systemwide-io-uring-enable-v1-1-01d4b4a8ef4f@ddn.com>

Hi Bernd,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 6548d364a3e850326831799d7e3ea2d7bb97ba08]

url:    https://github.com/intel-lab-lkp/linux/commits/Bernd-Schubert/fuse-check-if-system-wide-io_uring-is-enabled/20251022-043238
base:   6548d364a3e850326831799d7e3ea2d7bb97ba08
patch link:    https://lore.kernel.org/r/20251021-io-uring-fix-check-systemwide-io-uring-enable-v1-1-01d4b4a8ef4f%40ddn.com
patch subject: [PATCH RFC] fuse: check if system-wide io_uring is enabled
config: x86_64-buildonly-randconfig-006-20251022 (https://download.01.org/0day-ci/archive/20251022/202510221850.5NVG4IAB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510221850.5NVG4IAB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510221850.5NVG4IAB-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `check_system_io_uring':
>> fs/fuse/inode.c:1970:(.text+0x3e161d): undefined reference to `io_uring_allowed'
>> ld: fs/fuse/inode.c:1971:(.text+0x3e1622): undefined reference to `io_uring_allowed'
   ld: fs/fuse/inode.c:1970:(.text+0x3e16af): undefined reference to `io_uring_allowed'
   ld: fs/fuse/inode.c:1971:(.text+0x3e16b4): undefined reference to `io_uring_allowed'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_GPIO
   Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
   Selected by [y]:
   - GPIO_TB10X [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && (ARC_PLAT_TB10X || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for GPIO_SYSCON
   Depends on [n]: GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF [=n]
   Selected by [y]:
   - GPIO_SAMA5D2_PIOBU [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF_GPIO [=y] && (ARCH_AT91 || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [y]:
   - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]


vim +1970 fs/fuse/inode.c

  1938	
  1939	/* Check if system wide io-uring is enabled */
  1940	static void check_system_io_uring(struct fuse_conn *fc, struct fuse_fs_context *ctx)
  1941	{
  1942		struct cred *new_cred = NULL;
  1943		const struct cred *old_cred = NULL;
  1944		int allowed;
  1945	
  1946		/*
  1947		 * Mount might be from an unprivileged user using s-bit
  1948		 * fusermount, the check if system wide io-uring is enabled
  1949		 * needs to drop privileges
  1950		 * then.
  1951		 */
  1952		if (ctx->user_id.val != 0 && ctx->group_id.val != 0) {
  1953			new_cred = prepare_creds();
  1954			if (!new_cred)
  1955				return;
  1956	
  1957			cap_clear(new_cred->cap_effective);
  1958			cap_clear(new_cred->cap_permitted);
  1959			cap_clear(new_cred->cap_inheritable);
  1960	
  1961			if (ctx->user_id_present)
  1962				new_cred->uid = new_cred->euid = ctx->user_id;
  1963	
  1964			if (ctx->group_id_present)
  1965				new_cred->gid = new_cred->egid = new_cred->fsgid = ctx->group_id;
  1966	
  1967			old_cred = override_creds(new_cred);
  1968		}
  1969	
> 1970		allowed = io_uring_allowed();
> 1971		fc->system_io_uring = io_uring_allowed() == 0;
  1972	
  1973		if (old_cred)
  1974			revert_creds(old_cred);
  1975		if (new_cred)
  1976			put_cred(new_cred);
  1977	}
  1978	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
