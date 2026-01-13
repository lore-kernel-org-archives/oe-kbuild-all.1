Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096E5313E05
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 15:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768319666; cv=none; b=Ew4xgzfNXwnsZav2f2CsNHRcWyg/PKCSYIp1+1jMRS7JJygzQPz04ytn5QyvE7f7H99/OfglsIsDl8LN9oihgEWZBHAiVl/yp9j0amMmK2wAK1Q7qGjMPZMMC6KohYpzHv2YEI8ehK14hyDEwGGArevPmX1FMM8I+gwgwYxpATk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768319666; c=relaxed/simple;
	bh=kYw3aT0TJ4204WbShJPTRnBRT/6DM9SfI2Pk8d4Yxs4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BKR0sdXwr3GbnejKu/V/T/8XuBbYCZhcleW7KPJ9zC50E7iwRbUlpfC5+ODrhoyO48Pzgc+LxMeITPAbWSPpuh53MMX4PcLEl9FSU9jES3IFGXuCh2jiOGyOhnhBOQ+3CAFB1eYmS9hD/LGX4ZJAAmn7aGi0CG/axIJuZ1lvrZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PmWDYErW; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PmWDYErW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768319665; x=1799855665;
  h=date:from:to:cc:subject:message-id;
  bh=kYw3aT0TJ4204WbShJPTRnBRT/6DM9SfI2Pk8d4Yxs4=;
  b=PmWDYErWMvIAYZyY5rYOGqMp1+pp933Yw1zDoHd8NH1QLpImrrLtrCMG
   MCQnJQzQHhb3gsVgX9KYDsIZEBn8m2SsJKY1goN6sfTzVaiveJsg9xBGw
   t4BaK45F0i2IoCYlFwEl0R4aO/oB7m7t08laJqd/0eaubhzxiMBm8Svaj
   VpxIxxzZ2/EtB3F5v9U4qb1Vm+RHqwknMPK9UZ0iXTlcyYTAgczZz/wc7
   6zGsiGMWymZquWaFjteWQmCDOs/rlK5efBg9yHsJu4ID5eEJm/Y76C2ja
   frY2ry9uUQzzn4k5r9NAqi5SjTHOXRb229s4U4aD5ls0E+JVFXZrbKVNb
   w==;
X-CSE-ConnectionGUID: NRsNWOqBTNGThU7VEMbtvQ==
X-CSE-MsgGUID: ksmmMcQTQGi/qxtOdUVnfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69506049"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69506049"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 07:54:24 -0800
X-CSE-ConnectionGUID: l5R2COpMQPGk/dxuvWzy8w==
X-CSE-MsgGUID: q/uEX8VESoKjfx8A8EnrWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="203561658"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 Jan 2026 07:54:23 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfgiq-00000000F24-0cNT;
	Tue, 13 Jan 2026 15:54:20 +0000
Date: Tue, 13 Jan 2026 23:53:39 +0800
From: kernel test robot <lkp@intel.com>
To: Max Kellermann <max.kellermann@ionos.com>
Cc: oe-kbuild-all@lists.linux.dev, David Howells <dhowells@redhat.com>
Subject: [dhowells-fs:netfs-next 1/17] buffered_read.c:undefined
 reference to `__cmpxchg_called_with_bad_pointer'
Message-ID: <202601132307.ZLe2LyHa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   8dc07632381d372883f12b9ca6da7438ce683a33
commit: 7b227cc6d4579599dd402543d1bd39e779164ce2 [1/17] fs/netfs: convert `netfs_io_request.error` to a `short
config: sh-randconfig-r062-20260113 (https://download.01.org/0day-ci/archive/20260113/202601132307.ZLe2LyHa-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601132307.ZLe2LyHa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601132307.ZLe2LyHa-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: fs/netfs/buffered_read.o: in function `netfs_read_to_pagecache':
>> buffered_read.c:(.text+0x4e4): undefined reference to `__cmpxchg_called_with_bad_pointer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
