Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494322066ED
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Feb 2025 09:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740217017; cv=none; b=KfqpbR07Vm8rsSbwXmTCOHldr22yON4UhbWKfW6038nvvF8qvYWI4bngNHSWAy5RX5lVc8+9/wY8DVVAZtg/Sn8dltLvMkQHS0P6RIAlkdW/HWiCZxXMSJ8OUq1Umota3WuLootyGH6XfvlAZbDT3jJOs3EbbqwnDwgXgijbF/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740217017; c=relaxed/simple;
	bh=fotxYX84fphicDGCNCqY8Ok2Sj+lq7Q9M75O9lB0LUA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XwflTiyq6xFuJ1YuYTYw/DfQak7Y6zDI6E8lZtuxlaBYTf+DVmLFPbEffIZwjtlyD4pkVLN03surOLPFtE9pTio28SK67Ztz5Hz3OGwJg4ZsJ+uET70wz/usiGEm+w4HdRYMsucZyJ/EFEApggB9wZ7tDsa1WwaEpP6MrDEJb5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FS0PPvmI; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FS0PPvmI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740217015; x=1771753015;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fotxYX84fphicDGCNCqY8Ok2Sj+lq7Q9M75O9lB0LUA=;
  b=FS0PPvmIy5c+kyHAXudDhjnFCWwj7mwDleKmJLHhBz2I1XM6Q7kQucs6
   9o5xHOA/F6BMuf3Y4UP5zGJYyG6bHdjwHoTE9hX8d7i6ulDOn33h7F7QW
   ykU7wJBYkb/DhWveT3Oy79TzhZxaO8HDMelV+749Ujb34dZ0OXkj2phkw
   SrLPyzxqL7T9x0BQPx+Z30Wqjc3PfWmDuSIWZ0MoNZZyY6vDl0C6BCBfe
   IdIgkbOpH22a8rE1vIis20sRUWK6TDyOLyeZf8uVPmyuGlqVpVnaL+uRI
   aIFdZ2F92o4gzzqHYtn8DMkrGBgSZNzGZNtQoGL7Oek8iGVDFKg+7bk9H
   w==;
X-CSE-ConnectionGUID: zM+GWndJT+29EOImJ9/Www==
X-CSE-MsgGUID: QR83AqwRRCin9V5Oz29+rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="58449194"
X-IronPort-AV: E=Sophos;i="6.13,307,1732608000"; 
   d="scan'208";a="58449194"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 01:36:54 -0800
X-CSE-ConnectionGUID: EMzfQRJjStSSYk7gfEd6qQ==
X-CSE-MsgGUID: Czb/YpRjSE6q3Xx28HNW9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="146486302"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 22 Feb 2025 01:36:54 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tllwJ-0006S3-2A;
	Sat, 22 Feb 2025 09:36:51 +0000
Date: Sat, 22 Feb 2025 17:36:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/1]
 drivers/staging/android/ashmem.h:19:42: sparse: sparse: incorrect type in
 initializer (different base types)
Message-ID: <202502221704.JK3LaA3M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   f1a7d64e039461ef511f25b61668310cc675cf24
commit: c843dcd0861cb0fae53efc6d6915b96eed8abd17 [0/1] ANDROID: ashmem_rust: add memory shrinker
config: x86_64-randconfig-122-20250222 (https://download.01.org/0day-ci/archive/20250222/202502221704.JK3LaA3M-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250222/202502221704.JK3LaA3M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502221704.JK3LaA3M-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/staging/android/ashmem.c: note: in included file:
>> drivers/staging/android/ashmem.h:19:42: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted gfp_t const [addressable] [toplevel] [usertype] RUST_CONST_HELPER___GFP_FS @@     got unsigned long @@
   drivers/staging/android/ashmem.h:19:42: sparse:     expected restricted gfp_t const [addressable] [toplevel] [usertype] RUST_CONST_HELPER___GFP_FS
   drivers/staging/android/ashmem.h:19:42: sparse:     got unsigned long
   drivers/staging/android/ashmem.h:19:13: sparse: sparse: symbol 'RUST_CONST_HELPER___GFP_FS' was not declared. Should it be static?
>> drivers/staging/android/ashmem.h:20:42: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted gfp_t const [addressable] [toplevel] [usertype] RUST_CONST_HELPER___GFP_IO @@     got unsigned long @@
   drivers/staging/android/ashmem.h:20:42: sparse:     expected restricted gfp_t const [addressable] [toplevel] [usertype] RUST_CONST_HELPER___GFP_IO
   drivers/staging/android/ashmem.h:20:42: sparse:     got unsigned long
   drivers/staging/android/ashmem.h:20:13: sparse: sparse: symbol 'RUST_CONST_HELPER___GFP_IO' was not declared. Should it be static?

vim +19 drivers/staging/android/ashmem.h

    17	
    18	#include <linux/shrinker.h>
  > 19	const gfp_t RUST_CONST_HELPER___GFP_FS = ___GFP_FS;
  > 20	const gfp_t RUST_CONST_HELPER___GFP_IO = ___GFP_IO;
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
