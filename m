Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792995394;
	b=3s7L6kIh7IxJDeLvR4n29d9PJuSF1WMH8/dyh0L+I/prjOqibF6J/Q79OGyatOVz+PUI
	 ugTEIkYrOemow6JNP/3TW4s09XIth6/FROM/mLi52tSUox+ICs6b/8lPQw1OwStIX8Rv0
	 GF9gymKYwhhoisUN38pBV6ZKLzrKbfC3vl1X0nqi2gZoDqMFr+IJb8EFIwwblQa1OSvXg
	 3WMi1P+Ar/MUSsK3HXBOsnX786MQ8VsaZ/NPJNSOiW2P3ZhlB9xhRFNAC8EJ8kMSrovkS
	 Bw+q//j4AgJTDUP4PM+KAx6cl8LQkLxB8UZ1EsBGRrNVcVEvKH04PhLfFc4sZyUMZnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792995394;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=52b05q2XQCXKh5EE1jk/831AuWcVlpdLHGccw0Xg7eI=;
	b=wtLApawehZhjdQLVUhsh4Z6xGJDWxrC1tyVcpFfNWj9bE/VJjYwWa4IAt47h3ORLpeY4
	 FCdIyU42kInB/qR4MifCX5NXDseI+hPKl6ROwkvruF02hM5RkPpyfpOIi171JlTKWbLL0
	 ZXy03M6SxYtBmbR7g/5sG94m+EyQ9/SXN55llIDb2AtfA7kYjA7HhEFRB4Y1NOKXPRcMb
	 hpsBf+Z/UaaImmiBiJH37xTvKeWV88FeSJtjohuf2ij7Obkz6i5zs9E4w1I5W9TwJ09FN
	 jIcqYw3k7SW4HLBEAw/t9RyW02CTNQ/p0MhlCAsLfTgvfKf+2kk0rLBDdhAbtpIGVsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I0jHoHdo;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DE8606A31A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Oct 2026 06:16:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06DE8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I0jHoHdo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792995393; x=1824531393;
  h=date:from:to:cc:subject:message-id;
  bh=pCwQfF1zy/IO/RG4nEt7V3SA+wN16foGE9uoRntT7sw=;
  b=I0jHoHdoGL3qyHms/QnRE3tuu7Emn3imNUg7ZCL4w1vMFVrka6ekUHHP
   EGaRA5QZey8/MfSKDdkLtHgm8Q2D945eFvATIdYYQo0y9p4PoxixoqjQl
   vjguNFFOkbwWLap7bshizwB0+xUuMl4SC7QK9pEFZBojGgIB5r+d00zBD
   vz1mE/7+pmd/TMXAQotZ8A3Dws73K6kGW0/QCTWgqJ2WGtC3mspBHz2sy
   7rtfF0mC/bhwdZvK80ylbZNwkOq+jjRhE8ABP/B3EII3edS3VQQIAF2LV
   pW3vEgbBPIbXV7dFHJEG6huCZZeNpEpEUEiSjfXfEoqgbiMQUfCVP6NUL
   A==;
X-CSE-ConnectionGUID: TqfulsYiTh2Cq5vlEi34hg==
X-CSE-MsgGUID: Y1PUSpH8TQKGn01RIOvZCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1678498"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1678498"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 23:16:32 -0700
X-CSE-ConnectionGUID: l428A98wTiq7anmrwc76AQ==
X-CSE-MsgGUID: CoOUH274RyCp428aJMJOVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4253922"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 25 Oct 2026 23:16:31 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLE0S-000000003zf-3rX5;
	Mon, 26 Oct 2026 06:16:28 +0000
Date: Mon, 26 Oct 2026 07:15:37 +0100
From: kernel test robot <lkp@intel.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Sasha Levin <sashal@kernel.org>
Subject: [sashal-next:fs-next 10/25] dev.c:undefined reference to
 `fuse_backing_open'
Message-ID: <202610260719.sj08mXBr-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-next.git fs-next
head:   e845dc5e82d969577e6195c334976676e050e885
commit: 610d8ae50c1bf37330a1dc506a9667bd53c77fe3 [10/25] Merge 'fuse' from https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git (for-next)
config: nios2-randconfig-2001-20261025 (https://download.01.org/0day-ci/archive/20261026/202610260719.sj08mXBr-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261026/202610260719.sj08mXBr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610260719.sj08mXBr-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: fs/fuse/dev.o: in function `fuse_dev_ioctl':
>> dev.c:(.text+0x355c): undefined reference to `fuse_backing_open'
   dev.c:(.text+0x355c): relocation truncated to fit: R_NIOS2_CALL26 against `fuse_backing_open'
   nios2-linux-ld: dev.c:(.text+0x3594): undefined reference to `fuse_backing_open_64'
   dev.c:(.text+0x3594): relocation truncated to fit: R_NIOS2_CALL26 against `fuse_backing_open_64'
   nios2-linux-ld: dev.c:(.text+0x35d0): undefined reference to `fuse_backing_close'
   dev.c:(.text+0x35d0): relocation truncated to fit: R_NIOS2_CALL26 against `fuse_backing_close'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
