Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EE9184540
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Mar 2026 00:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773362083; cv=none; b=Wbi/YkpxnK87S4VJ1gHMbl4aJP9GVoDwXmPfNsDednepO6NrWpG0+7GD2o/UA9xXhW9MqbNJw6qHNnJqrnb1ZYPYFf8Vot0QxHMtVbIJJ3nYHsT7aAFewsdUiXidTjUpIDB0UGXeBSX9q4stRmBL5O7DAJD9+s1qOXr0VU4TwuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773362083; c=relaxed/simple;
	bh=4sHGb6koP3w0ccXHG8RaHj7k2kiDwYk66SHKYZ1cb1U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fc5TZV5JDniBe/7BtPy8XX+Zihgmr/77+o2aWDvm1FAGmSHpXNzCino4aHIlQBkXoy3zNXStJl2cRiCDr6gRPJk+X7bssCf08L1CKmRklNUZqzDZ5pk8ZLe1VclR/46Z2z2tUoaCKBP247PFPsgr9ety3IflmeBTdKQeLyoMyTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LFOUmUF8; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LFOUmUF8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773362081; x=1804898081;
  h=date:from:to:cc:subject:message-id;
  bh=4sHGb6koP3w0ccXHG8RaHj7k2kiDwYk66SHKYZ1cb1U=;
  b=LFOUmUF8OZvKnGNm1GgM+bC4obOSTw/7YDMQ36a4fkyDj6vF6z2UlCyV
   D7e52Pjw7OAO/XaFI+LzTLSFopz5MdOHzPhBj7j7i7AIJfDscU+EJGiTn
   JgZ7cEC7wFMsh4WKqURCAhkvcG3umnTcSpOjkAlMNGhQIgkfbqP3Vbh7z
   rHUq/QDotwg2LBcfqy+3JQ+pmJ5o1gk3fZq2QdgQuA7MstiQqcufyDS7J
   1QR5Psava3mZvBUxRdSZ0SXhQms4g5zzB6kFG90r/zAeQlYR82/mh9Bty
   9+u9itnWM9to9IJ66fDcy+cAfj3dDB+5/s8I6oey75BhUubitvlFWI+qA
   g==;
X-CSE-ConnectionGUID: OByGqzx4RnazfZpJgrDbag==
X-CSE-MsgGUID: UisxI3zDRvywnW2b1dsSZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="78361595"
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="78361595"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 17:34:40 -0700
X-CSE-ConnectionGUID: nALWTEUoSDW3PdZeVgh7Tw==
X-CSE-MsgGUID: DAfULUxGQAq5Ko2/7k9nbA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Mar 2026 17:34:39 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0qU8-000000003Gp-31rk;
	Fri, 13 Mar 2026 00:34:36 +0000
Date: Fri, 13 Mar 2026 08:33:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1] aarch64-linux-ld:
 Unexpected GOT/PLT entries detected!
Message-ID: <202603130800.dJGCOdvw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   820971d81189347585958b3e33bfe5ed8c577f56
commit: 85f00ea4c7c957ba1529a67ba00a02fb1929b458 [1/1] ANDROID: Limit vfs-only namespace to GKI builds
config: arm64-randconfig-001-20260312 (https://download.01.org/0day-ci/archive/20260313/202603130800.dJGCOdvw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260313/202603130800.dJGCOdvw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603130800.dJGCOdvw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64-linux-ld: Unexpected GOT/PLT entries detected!
>> aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: arch/arm64/kvm/hyp/nvhe/kvm_nvhe.o: in function `__kvm_nvhe_trace_clock':
>> (.hyp.text+0x19f34): undefined reference to `__kvm_nvhe___lshrti3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
