Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01FF1E9B2A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Aug 2025 04:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756010169; cv=none; b=u9mxfMXa3ogHfnveZTq2e9eMCGYgkmppCYyIXLtuNN8pER962kHzK5zcdJHRWzFDrJKGYKQpBrwBLCVKVxIokQw5/whSta1mJnXGViZ1qpwDZYJsqaBz+Tv2Sgtg72rhSkpg5QXdWgsCTXcxigZv4YRom5BndL7DpUbzohDumMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756010169; c=relaxed/simple;
	bh=U1xYwSz3zJw/XOGrtDiE8ftcAHjutiUUdjzDYw1C0DE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lCQOiXa4GWmWeCU0M+uZ+ZHIvmvLTNBtIlTy9SJ590GTC3ziNZLOeRNZ/JAOa48F3JtJwcS/sS/qX7OPN8UHDQ2u1YBCaOiUx5M3lTS8ZhbRQWgz5Bn9XEpE62vR/Hi+QOA//fPwIe+6smwbXRk1FQxxY4g7pj5hFAXDjhDEzM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d8kA5QWb; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d8kA5QWb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756010166; x=1787546166;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U1xYwSz3zJw/XOGrtDiE8ftcAHjutiUUdjzDYw1C0DE=;
  b=d8kA5QWbvlgPgyRIxQELaDQGB/MOGXT3cYl5GuzNEPj45dne+UVuz2Vt
   DY5kZ65tDQZY1ar57toCCSUwdEzdlrVBTNZdLcQW1GUTiEH4l4T0UZLLs
   vH5kiqPS4QVYEcLeDJ+20Md3OMAZ9hTYSX6ez5CSTBitYPxqZ4Zqnd21e
   ZGjgzXRT8GWV1lUMojsX/uTx0kKtKJclaepwKgipuNgihm0pA+TUWfS7Y
   jeFhU6Zlv4dY6gLpEXXTTQKkzKT9YEcNNpyevnB4JS0EOBYo9gLk20ZUm
   0SJn3GhB9jY43q9Xz81qXI7ERK1ZUnY52qBy7q5Sh8apsOBDGnTU3I5IP
   w==;
X-CSE-ConnectionGUID: /SU71jXPTnm3UukFzYmwvg==
X-CSE-MsgGUID: jrR8WeUXSxGagx0vBj9jtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="69631184"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="69631184"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 21:36:05 -0700
X-CSE-ConnectionGUID: ALTIqIdXSmuvHAE2eAUFMw==
X-CSE-MsgGUID: uB+0x4fxQfyDUTqcZ2hIbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="169198636"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 23 Aug 2025 21:36:04 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uq2SY-000MlP-12;
	Sun, 24 Aug 2025 04:36:02 +0000
Date: Sun, 24 Aug 2025 12:35:28 +0800
From: kernel test robot <lkp@intel.com>
To: vishnu singh <v-singh1@ti.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] time: introduce BOOT_TIME_TRACKER and minimal boot
 timestamp
Message-ID: <202508241207.pLPFn1Tw-lkp@intel.com>
References: <20250823044034.189939-1-v-singh1@ti.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250823044034.189939-1-v-singh1@ti.com>

Hi vishnu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on next-20250822]
[also build test ERROR on v6.17-rc2]
[cannot apply to arm64/for-next/core akpm-mm/mm-everything linus/master v6.17-rc2 v6.17-rc1 v6.16]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/vishnu-singh/time-introduce-BOOT_TIME_TRACKER-and-minimal-boot-timestamp/20250823-124230
base:   next-20250822
patch link:    https://lore.kernel.org/r/20250823044034.189939-1-v-singh1%40ti.com
patch subject: [RFC PATCH] time: introduce BOOT_TIME_TRACKER and minimal boot timestamp
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20250824/202508241207.pLPFn1Tw-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508241207.pLPFn1Tw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508241207.pLPFn1Tw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/time/boot_time_now.c:4:10: fatal error: asm/boot_time_primitives.h: No such file or directory
       4 | #include <asm/boot_time_primitives.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +4 kernel/time/boot_time_now.c

     2	
     3	#include <linux/boot_time_now.h>
   > 4	#include <asm/boot_time_primitives.h>
     5	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
