Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFE728F3
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Nov 2024 03:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731123153; cv=none; b=aABQuFQc3pGeIotqOjd+1JnE1UfifYkvEa4dJF3u83eMPncwb6t0yTqv+D8gz/s2fsfh94wYOj04cSDu1YGVFPnB1f/fpublCGUJov/EF7I9FNS7ql0lU0Y9Anywt+C5PkL7DNBllxZvwoYWX+iXxO382Ma6QIjW704Uo3gWWS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731123153; c=relaxed/simple;
	bh=DoCC2pG14WxSNf2Xz5Bfz/kWr9GQ4KhbWyh5Z8Q/EEE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BckNm0uuzqCeel4hUv9OxgFKf2wXtiU0Cr+3iw09B2AhVK2UvYKmlVsdm44VHnQ/MpSRJPafdVbTDBqYxdyI3/a81GnWgRmbF7tNKs6aiIA4ZUcTIek8GGgVF0fLhdhzQuY4h3nF2Oc+X2whs1gORmTsEAvRGLEgn1/Wy5oVPGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QCoXL4KJ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QCoXL4KJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731123152; x=1762659152;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DoCC2pG14WxSNf2Xz5Bfz/kWr9GQ4KhbWyh5Z8Q/EEE=;
  b=QCoXL4KJArR80pBJE80W6JNa4pg0h93ulnFPoil/Hc+HwjhfvQT+j3QR
   jsGEJo6ecgwn/qxMrHFwKN8ABTeOJgPUDdIjBI+51Xfcx4LlC9sWwWPDF
   NANcBRBBcuB7Xc4p9DMjOf+nT+b1bmczDlokrZD6kdISpAHCnmt3s0kyT
   mst3/gCm89JLHCSaE9dkotBQVuVQarVOsccBrV3gjeQA7nnstPJhRY2E9
   C8jtpEglMzh7s1ut0G5/70u+g6He8LZHFtcxYmoDe8GNfdErX2LO4WU6M
   QXuo1ONWUYnTg7RNfBWWOB3vbxP964jL6zkD3V6H42iD/Iivce8IOith0
   g==;
X-CSE-ConnectionGUID: xmAZEPpbS7Gr/2pkH0KJ6w==
X-CSE-MsgGUID: j1pFZ198RGag0TB8NFj0Lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="42417867"
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; 
   d="scan'208";a="42417867"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 19:32:31 -0800
X-CSE-ConnectionGUID: bqxIQHtHRDu8ZFKGrF+3yg==
X-CSE-MsgGUID: PmkuS6kUSu6UcJeIANCSLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; 
   d="scan'208";a="116672665"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Nov 2024 19:32:30 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9cD6-000s2K-06;
	Sat, 09 Nov 2024 03:32:28 +0000
Date: Sat, 9 Nov 2024 11:31:53 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bigeasy-staging:futex_local_v3 8/8] core.c:undefined reference to
 `xxh64'
Message-ID: <202411091151.V6vE4jrt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bigeasy/staging.git futex_local_v3
head:   ca715b99641d5113ad75a0c2f647d8cc0a87e38d
commit: ca715b99641d5113ad75a0c2f647d8cc0a87e38d [8/8] futex: Wire up all hash functions for testing.
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20241109/202411091151.V6vE4jrt-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241109/202411091151.V6vE4jrt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411091151.V6vE4jrt-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: kernel/futex/core.o: in function `futex_hash':
>> core.c:(.text+0x60a): undefined reference to `xxh64'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
