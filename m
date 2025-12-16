Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA32E349B17
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 18:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765908535; cv=none; b=Z2nJhXVO1NEGfWhKUbvUuXT7+lLLNGqPTKRQ61PXL+0sONAEDxQt6EFnCFAm7fOiS714iAVnI0O86tvaJiTH//XeskmY46UoRSwWEuOxohWE7AUZyoyznfBrPts7UPOcNHQbxJGofjxRadO3nNev1OXdl+AQ3grgf1tju6xsVI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765908535; c=relaxed/simple;
	bh=+7n90qB/ZXp+CQvcxMOD3F+AfLI62eso3jSdk7/eh/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lmufwlOzPbgUw8/HXdaqLu+zsck5BURDwHJHdCkIvUB489S9JYbzYTiZvk9XL8iL6jKPVSbHTJxmgO7lml93RtCN6IDySCjcfDQPi3HCmjQTjf2KkWL58DQd0bN4sw4fvJbrcBy1TkGgqJyZQnC5P85FrMCB3Gq09A4ZXNqnBzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lvUNOpAI; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lvUNOpAI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765908533; x=1797444533;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+7n90qB/ZXp+CQvcxMOD3F+AfLI62eso3jSdk7/eh/Q=;
  b=lvUNOpAIWGaz975OvdATW1I4vUQhhLAaLh0WE4HcdGflAFEW2fT7sX6N
   SiySSG5T+i4QKdwQ9h1bLV0s9TNdHwo+JmewT/RYqu/fLA8fpSHUxwPVk
   izrgo6XTQ58g+sIDnRaKf82zVpQEOAtEE8QqB9NqH/nzzKW6YKF8t/OIg
   XsPN6WA1B+5zhQXt97eCistog4ik7o11XWIjOZupgAlgM6q+O0S6BmwJI
   KcDy0QoHOa9phZdkYq0GUjwt9793BDlLwmlgUnIQ36+onT9uf6zHYPTnD
   rhxIeFEBXT+lYzoby/v+SE2TmKGuOBCbYjydtSs4dtU4jPLr7pH/ntKMs
   g==;
X-CSE-ConnectionGUID: M06vYfraR8ifoN3ZvvAxXQ==
X-CSE-MsgGUID: YWSaGz78Rd2EvAb99pCcgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="71693297"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="71693297"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 10:08:53 -0800
X-CSE-ConnectionGUID: hxXQCASZSliPwcEGLNMQLg==
X-CSE-MsgGUID: RgOAO6RWSGGOYieq1tlswA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="198140408"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 16 Dec 2025 10:08:52 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVZTd-000000003gS-2u61;
	Tue, 16 Dec 2025 18:08:49 +0000
Date: Wed, 17 Dec 2025 02:08:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 9/9]
 drivers/staging/android/ashmem.h:20:42: sparse: sparse: incorrect type in
 initializer (different base types)
Message-ID: <202512170105.Ny7oW2lu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   84781c9aae0b28354d6f3d870d42b30f0443151d
commit: 751d06ec7120b66307b05409e2b446876bf41629 [9/9] ANDROID: ashmem_rust: Port rust ashmem driver from android16-6.12
config: i386-randconfig-r131-20251216 (https://download.01.org/0day-ci/archive/20251217/202512170105.Ny7oW2lu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512170105.Ny7oW2lu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512170105.Ny7oW2lu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/staging/android/ashmem.c: note: in included file:
   drivers/staging/android/ashmem.h:19:42: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted gfp_t const [addressable] [toplevel] [usertype] RUST_CONST_HELPER___GFP_FS @@     got unsigned long @@
   drivers/staging/android/ashmem.h:19:42: sparse:     expected restricted gfp_t const [addressable] [toplevel] [usertype] RUST_CONST_HELPER___GFP_FS
   drivers/staging/android/ashmem.h:19:42: sparse:     got unsigned long
   drivers/staging/android/ashmem.h:19:13: sparse: sparse: symbol 'RUST_CONST_HELPER___GFP_FS' was not declared. Should it be static?
>> drivers/staging/android/ashmem.h:20:42: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted gfp_t const [addressable] [toplevel] [usertype] RUST_CONST_HELPER___GFP_IO @@     got unsigned long @@
   drivers/staging/android/ashmem.h:20:42: sparse:     expected restricted gfp_t const [addressable] [toplevel] [usertype] RUST_CONST_HELPER___GFP_IO
   drivers/staging/android/ashmem.h:20:42: sparse:     got unsigned long
   drivers/staging/android/ashmem.h:20:13: sparse: sparse: symbol 'RUST_CONST_HELPER___GFP_IO' was not declared. Should it be static?

vim +20 drivers/staging/android/ashmem.h

    17	
    18	#include <linux/shrinker.h>
  > 19	const gfp_t RUST_CONST_HELPER___GFP_FS = ___GFP_FS;
  > 20	const gfp_t RUST_CONST_HELPER___GFP_IO = ___GFP_IO;
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
