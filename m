Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25645A937
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 04:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771303277; cv=none; b=iHJ8Z3q8033NnUH7DHy/zXqCrO0IS03gOVDOYJFqEKJMR2PKZT96R4bVU0eLlsM92yNvXPaEtsxiGOAtOdq3641G0FqUUdI5T8i8P1LRseJtReKY27MIY4Sl40/8Mnd/ptrH1PX0iILWsceoYqxOVXk9toO6N//YRB0sBMnjaOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771303277; c=relaxed/simple;
	bh=KqliwUQqRBsKXNoUlJA0mAF5bXS/vR8ZTD4BJYb25rQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YwZa2xsOh2+PblYzuV++8ANUxC7CLorlW7PQ3qejG/NL76KlbxQnkLbRJsg40P2ZgCxtsxH0QkDlEgREbyTWzNgccdUip0OlfTopOdn/zRJOGEfjmPG30aCxyVgTzH05NCMSoELUjDUWIVBLcl6ynmwRDi5QymbDKL3oJjA1Xvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lpC8YRON; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lpC8YRON"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771303275; x=1802839275;
  h=date:from:to:cc:subject:message-id;
  bh=KqliwUQqRBsKXNoUlJA0mAF5bXS/vR8ZTD4BJYb25rQ=;
  b=lpC8YRONu4Vlvu8IYcLz2tZB1y725lq/Z6GIBP+fsiI3iy7BnoX5vQkb
   Phym+10L48WqDTTNVQyKdkeAuEECH0UQ/X+u+NpTpPto2QkNL2obajYY4
   mpvQN1BIIByMR+MHFd9OxWt2m1/pKgk9adl6urR9XaIJERA909n5cuHLQ
   a4jEC3IHZNBj+KV2R26gtz3gg0MKWOPwBcnJ85pQFbKF72dzLKr5uKp8q
   AjG3BCjVjY5gWZPevkVA1oakc/NMdI8BPRUNAgxGsFsjp5BogqVEUqYa0
   vwMju1khwkKD+/20a1QJypeLF+L8n/Wqsxjin0Falw6mPE6VWBH2BJy5D
   w==;
X-CSE-ConnectionGUID: h/AcQTZjRHm6cFYMg4yKJQ==
X-CSE-MsgGUID: 1AgPtPbmRS+/TorkCa3oCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="76211194"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="76211194"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 20:41:15 -0800
X-CSE-ConnectionGUID: 6KUEzNAkScil32AI19n0Kw==
X-CSE-MsgGUID: eW3/L5WjQuSRCwd9gSRrGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="212277122"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Feb 2026 20:41:13 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsCtb-000000010cK-1D7w;
	Tue, 17 Feb 2026 04:41:11 +0000
Date: Tue, 17 Feb 2026 12:40:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/2]
 drivers/firmware/stratix10-svc.c:180: warning: This comment starts with
 '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202602171206.v1SubsrK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Mahesh,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   f2758f0da7bc5628c5fc4d3822976b07b3649b24
commit: e914da9be0619770d713f8d9c53d6745332df453 [2/2] firmware: stratix10-svc: Add mutex in stratix10 memory management
config: arm64-randconfig-001-20260217 (https://download.01.org/0day-ci/archive/20260217/202602171206.v1SubsrK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602171206.v1SubsrK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602171206.v1SubsrK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/stratix10-svc.c:180: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * svc_mem_lock protects access to the svc_data_mem list for


vim +180 drivers/firmware/stratix10-svc.c

   178	
   179	/**
 > 180	 * svc_mem_lock protects access to the svc_data_mem list for
   181	 * concurrent multi-client operations
   182	 */
   183	static DEFINE_MUTEX(svc_mem_lock);
   184	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
