Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33742246774
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 May 2025 13:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748440396; cv=none; b=J1AAFANmc7q++VDbeiY4RIDgcjDtkV8wQYxpEVL3FqhU/ACTeTbd2geyt+eYAPLeS9T7tEbCL8DFkDaOEbcumWOm9DR0/AYRyHiZn1lmB8sr3OsiEnE5RbiqFpasEJrDIvdzFArFTxPmqY9RjFJ+Vk0aWCebZWXyJpkUUmomTgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748440396; c=relaxed/simple;
	bh=pvOPX9I9flAmnxNNq32dRsaec8lgfPPU5Xbw6WxC1yM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RXRHCRsC8lJwX2zjXCjHMi6Zfu/4bTcWCcdRLn2QG1OJ1+RcgJW2k93jikjnL4F0A38482WSmjQtOnFjEs82DOGerFt1vXBSqYOXArIXLWy/WYcvkLTq6S7pq+uLhx1b6b4+UraT9e40TYuCbsHOydp1yZ5ieDWE0cY+dDjMaiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fCb1Uxib; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fCb1Uxib"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748440394; x=1779976394;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=pvOPX9I9flAmnxNNq32dRsaec8lgfPPU5Xbw6WxC1yM=;
  b=fCb1UxibZsxiTOusVHOwVb0nT4ddmJ2/qUOyabELQRuB2FrkL2cofCqq
   Meri7aMA+w5onjUFZ+8gkX5Jdxn1QpOMDvjSNVPQzCGF7FYdO3TVcOE0T
   3ErH7k7jMXP4+NQD8+YcGImCefMGnlQ95fNNJ4yNBLRMjg9Bifk/wEjA5
   ONfGpbKXphwJKOfTZG145iniGS3IrKMG7voHFSYGTN/O58bNaaikopWdh
   bR4heAyTJLcMGi9q3+LnSWnwJhrU8YlcrVVTNrS+xnkjn4oe1GCDRxsIp
   YKQPo6FspzV3YBMVPGOl/6QKQQ90XuPDnZQTmJ7YurZNbRfSy7MJawsoI
   Q==;
X-CSE-ConnectionGUID: doffcDyxQmimQU2MhcpgpA==
X-CSE-MsgGUID: /ZQV8LV1Sgi+sFXmfG66Gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="50623579"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="50623579"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 06:53:13 -0700
X-CSE-ConnectionGUID: qA4648TTTuSenpxS1YqRFg==
X-CSE-MsgGUID: gBiq4zUHQyatRbWthib7+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="148536318"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 28 May 2025 06:53:11 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKHDQ-000VjG-2L;
	Wed, 28 May 2025 13:53:08 +0000
Date: Wed, 28 May 2025 21:53:00 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/kunit-kselftests 12/15]
 include/linux/blob.h:29:42: sparse: sparse: subtraction of different types
 can't work (different modifiers)
Message-ID: <202505282146.5xTI03W8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/kunit-kselftests
head:   4ab0ba980793138ca8d22ec673026def7b1e0178
commit: ab80b0ab3e68f28ef758feb9607b6277bc0c29b4 [12/15] kunit: Introduce UAPI testing framework
config: i386-randconfig-r132-20250528 (https://download.01.org/0day-ci/archive/20250528/202505282146.5xTI03W8-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505282146.5xTI03W8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505282146.5xTI03W8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/kunit/uapi.c: note: in included file:
>> include/linux/blob.h:29:42: sparse: sparse: subtraction of different types can't work (different modifiers)

vim +29 include/linux/blob.h

e0c2722369b032 Thomas Weiﬂschuh 2024-10-16  26  
e0c2722369b032 Thomas Weiﬂschuh 2024-10-16  27  static inline size_t blob_size(const struct blob *blob)
e0c2722369b032 Thomas Weiﬂschuh 2024-10-16  28  {
e0c2722369b032 Thomas Weiﬂschuh 2024-10-16 @29  	return ACCESS_PRIVATE(blob, end) - blob->data;
e0c2722369b032 Thomas Weiﬂschuh 2024-10-16  30  }
e0c2722369b032 Thomas Weiﬂschuh 2024-10-16  31  

:::::: The code at line 29 was first introduced by commit
:::::: e0c2722369b032ed30146ca00f99e8c1ec95e636 kbuild: introduce blob framework

:::::: TO: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
:::::: CC: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
