Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C9D38FB9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jun 2024 22:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719007650; cv=none; b=awOG+T7yl4jxWyeUy9HtOVqpKuAwTMQ2nLCEZfV/CohleJ3L7f7SZaKVBd+B9WJ8GKvbHGNqQfDLfOhZO8v+Wu+pec42LUZ1++XYua/rNFc4ZyS/m97bH2fDiLT/tj/zUeJG/AKc8tgjdbjyiwh7ombdCk5BlfQGEU7sBm9SgJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719007650; c=relaxed/simple;
	bh=C3fSvoX+jhtahIwrZ7NZj992y8vLSfgpOWmalve8e2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DD22Ey/smuHFRwGQnLXL43xBpTjW0COLbn/toyvfKH8BQrQJ6LEvusDCQjnKfW0JPqp/NvA8WbrgU55ZazSHz4vrrwoCoZjw/Czhh9q5AzqADIYsP6eOYp+CPYmyMeLT6ZidStyE7MQfc1iLdGm1uRRwGvPkT5gOCKI+Tkhjd0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GTcU1ilz; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GTcU1ilz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719007649; x=1750543649;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C3fSvoX+jhtahIwrZ7NZj992y8vLSfgpOWmalve8e2Q=;
  b=GTcU1ilzsmF9E6XIGciWfSYIHnbdogMH1bqa/ROYX0Mc3u8PgSzDcJRn
   0MhNRjoO03e8ZabH5CSPUUeYO3il96fO7qY8qg19vwokCZBikbDAycMRp
   M50X88h8RxfP9oybW/jsz4Vi8klzavAD/1tG7Zw9oLy4Q18zo5POtRPo5
   O0xXUw0IpE9eAhPXP8d5BKNJGM6TVPutF3fd1xgV0sMAtGZbzvuY3xy96
   Fxe3rYzHU69Tg1HmSuP/51kCu6mF9uOZnynzV9RBOGxaKLJCam2RkFPYS
   O2hOtV2tvr2YhrQvKU8l9BL2oB7OyZMZtWJPTO2q8ZzDmjBp8G6Azvseh
   Q==;
X-CSE-ConnectionGUID: MmUQllddSYqlLy3D3cej9g==
X-CSE-MsgGUID: kNVYijoUTSqhgaoVet5WMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="15937328"
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; 
   d="scan'208";a="15937328"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 15:07:27 -0700
X-CSE-ConnectionGUID: 5kzmS9LJQ22yW4DHDYLRIw==
X-CSE-MsgGUID: NtrJ3GGlRESjoNq4p9O1Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; 
   d="scan'208";a="65961404"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 Jun 2024 15:07:24 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKmPh-00092c-1K;
	Fri, 21 Jun 2024 22:07:21 +0000
Date: Sat, 22 Jun 2024 06:06:58 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:rust/cpufreq-dt 21/26] warning: unused import: `ops::Deref`
Message-ID: <202406220550.UvZ2ZPhH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git rust/cpufreq-dt
head:   628de6b80d860108301bd4b60aab350d3e0e9e5e
commit: 6717fa5e8dd07117695beeb2cef072ea5b559e94 [21/26] rust: Extend OPP bindings with CPU frequency table
config: arm64-randconfig-002-20240622 (https://download.01.org/0day-ci/archive/20240622/202406220550.UvZ2ZPhH-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240622/202406220550.UvZ2ZPhH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406220550.UvZ2ZPhH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unused import: `ops::Deref`
   --> rust/kernel/opp.rs:21:46
   |
   21 | use core::{ffi::c_char, marker::PhantomData, ops::Deref, ptr};
   |                                              ^^^^^^^^^^
   |
   = note: `#[warn(unused_imports)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
