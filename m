Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D031C5D77
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 22:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765925918; cv=none; b=HASTuk+1qcjNupHL3T70MxDBbUGjR80aVu22f5A/Z5apR1mSAeIMhCQB/NsvRwmeHxC9DFHE+lKgnGFLdnFAsbjLg7PQ0miDFcvZsggoBGwfQTaCxYnmKZ6YBFvArEpXz4n0iev5h2bGLazkBUZIbDDyO0Xng+suKT3y9NUOMrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765925918; c=relaxed/simple;
	bh=wIAdnyEfnR55sovVtFK+6daFuIarEZcnk66vrvmZzt8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yb8ad7klgVOjdYA7DnEkzHW5DO8KaJetSNSVqb3DdvzJLZWqATXjqFIU/VnaWozRY5uKef7KzYrAYBUeUEX8KMODashpfRCP8CGspz04VIA25CZBQrSOZCO13XvBfZhgOQktchpnx1d4l+5OF7q2FWG7ZQfldFXt8yzLj1YXA9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X8MIyxMZ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X8MIyxMZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765925917; x=1797461917;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wIAdnyEfnR55sovVtFK+6daFuIarEZcnk66vrvmZzt8=;
  b=X8MIyxMZOeAI02rz5foUcFpvZEUcr4F2ON4TTTuFZyLnUfv0C40gUQRs
   bSN+8tDzAs+SMhbPbsmpQ50WxTFqghmrT2SJf6yUcr6Ilo15aaoKN4GAo
   ihyBLybWs/Cy/Ons4/u4k4ennFE/u1HooWE8jFPzJBCRa4spCl4WiTI+R
   UQSmxHEz5n4n/tvqRbZJyF+g3yHQSVwVE0wQxneU3OyIsoF61/lEZetd9
   +2HR71IPq3fYdyAfUENDtP/mkvMXJgnQ8j8YAfcgLsZ7nlG2xZ5KgUl8U
   81KE25Bf2ejTP3uhHNosL0UhBlywqyjZFI7bs4MrfK5nu4YqRsRhswvdB
   A==;
X-CSE-ConnectionGUID: H5tigkFKQ9eCHBiBw8Qisg==
X-CSE-MsgGUID: Xs2nH84kR8u9YUKNDK33xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="85444993"
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; 
   d="scan'208";a="85444993"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 14:58:36 -0800
X-CSE-ConnectionGUID: w1OdNRziRWibhzKNVFcXcQ==
X-CSE-MsgGUID: HK0ap8h4S6emYUiX7OfqUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; 
   d="scan'208";a="235542203"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 16 Dec 2025 14:58:35 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVe00-000000003uy-3eWL;
	Tue, 16 Dec 2025 22:58:32 +0000
Date: Wed, 17 Dec 2025 06:57:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 9/9]
 drivers/staging/android/ashmem.h:20:42: sparse: sparse: incorrect type in
 initializer (different base types)
Message-ID: <202512170620.BR2bkF5e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   66b6be383cac26e4972bca7f1cfc10c2bd9f368b
commit: 751d06ec7120b66307b05409e2b446876bf41629 [9/9] ANDROID: ashmem_rust: Port rust ashmem driver from android16-6.12
config: i386-randconfig-r131-20251216 (https://download.01.org/0day-ci/archive/20251217/202512170620.BR2bkF5e-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512170620.BR2bkF5e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512170620.BR2bkF5e-lkp@intel.com/

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
