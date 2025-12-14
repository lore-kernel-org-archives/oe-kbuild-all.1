Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8101D54FA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 06:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765694570; cv=none; b=mTO1GPSalHl7V/vdLF7bQT4L0RgAFI8raWSqLodP14FKjpBj4fiWfuzvmV77uCbGQkYTYcw9al77YmX0baGTFaETRskLjATaZH7sBtyuoNN03NLs/q4aQYK5BYTrudYmN8fqWN4moUAF1dBDJ+B5IaZfZJS8+RDKtSO1g5P7Ilg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765694570; c=relaxed/simple;
	bh=MyaSof1bA5C+gG9WXn3mZOpS4B3t+t1PBC7FpnPjoAE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tLLfink8L7SMP1117EszysZ3N+g0+mAzVd7F1zzzRcjyt4E2TbXJrCUrBlpZyKJekQZrvXRxNnIVRnKtaIFtGFLrPXyk9lYdZnmaAmTR7qk0lbvqREiP+muYkePru+7oUeEUKrTjY0BRPvczQAxej40Caov+gagQrdftxJUSSFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GpmdxagT; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GpmdxagT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765694568; x=1797230568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MyaSof1bA5C+gG9WXn3mZOpS4B3t+t1PBC7FpnPjoAE=;
  b=GpmdxagTJ9G+HYz5/1ovR1PDpkc0fBJD1zrUG2LTmxvdXjjRiYXnPSoe
   eeVz7oQWpbEm9OBxjRUCahD0v8pAzQ0A5ZO389YDMe+23ullK2YUUc3fj
   T5uAMz415hK0+i6L1Bd8UsptqyqdwD72wocIqrtgaVh0NqJDml5CGdqzE
   Clqeoip8P9PylAh0eyKtr/DH5RFKHdmwthH+v5eOncKXKodzqHm1EH7TW
   AUx+0GQFtEh1neNglV7UE7HrM+Ba7zIDeOwvZH2us21mJ3x+MwJg8jAwj
   l+5RFDKur7UBUmCuwSTEzYWkhFKpIR6rief6vUwkNtM+WpHJ7q5q8iehM
   g==;
X-CSE-ConnectionGUID: Bm3EUVwcQYyGBEnK3steDA==
X-CSE-MsgGUID: LulFZpDtR2y5FWyhKa3l1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="79090647"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="79090647"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 22:42:47 -0800
X-CSE-ConnectionGUID: vItFKLZwRzerCd8VwfYhzg==
X-CSE-MsgGUID: 3XKORKydRi+cLCy2c9IS7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="197214114"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Dec 2025 22:42:47 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUfoa-000000008h1-3GW1;
	Sun, 14 Dec 2025 06:42:44 +0000
Date: Sun, 14 Dec 2025 14:42:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 1/1]
 drivers/staging/android/ashmem.h:19:42: sparse: sparse: incorrect type in
 initializer (different base types)
Message-ID: <202512141404.YuzS6WRM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   fbfd6aedcdb51da80c81b27b298b8691212febac
commit: f0233386601b19245f0203d870286d0e39dfc8d5 [1/1] ANDROID: ashmem_rust: Port rust ashmem driver from android16-6.12
config: i386-randconfig-r131-20251213 (https://download.01.org/0day-ci/archive/20251214/202512141404.YuzS6WRM-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512141404.YuzS6WRM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512141404.YuzS6WRM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/staging/android/ashmem.c: note: in included file:
>> drivers/staging/android/ashmem.h:19:42: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted gfp_t const [addressable] [toplevel] [usertype] RUST_CONST_HELPER___GFP_FS @@     got unsigned long @@
   drivers/staging/android/ashmem.h:19:42: sparse:     expected restricted gfp_t const [addressable] [toplevel] [usertype] RUST_CONST_HELPER___GFP_FS
   drivers/staging/android/ashmem.h:19:42: sparse:     got unsigned long
   drivers/staging/android/ashmem.h:19:13: sparse: sparse: symbol 'RUST_CONST_HELPER___GFP_FS' was not declared. Should it be static?
   drivers/staging/android/ashmem.h:20:42: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted gfp_t const [addressable] [toplevel] [usertype] RUST_CONST_HELPER___GFP_IO @@     got unsigned long @@
   drivers/staging/android/ashmem.h:20:42: sparse:     expected restricted gfp_t const [addressable] [toplevel] [usertype] RUST_CONST_HELPER___GFP_IO
   drivers/staging/android/ashmem.h:20:42: sparse:     got unsigned long
   drivers/staging/android/ashmem.h:20:13: sparse: sparse: symbol 'RUST_CONST_HELPER___GFP_IO' was not declared. Should it be static?

vim +19 drivers/staging/android/ashmem.h

    17	
    18	#include <linux/shrinker.h>
  > 19	const gfp_t RUST_CONST_HELPER___GFP_FS = ___GFP_FS;
    20	const gfp_t RUST_CONST_HELPER___GFP_IO = ___GFP_IO;
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
