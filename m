Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450C121CA03
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Aug 2025 02:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755658091; cv=none; b=K0TgLmPNhbOyL5Nz2VRoX72VInHhvdt6ZjKYMqdl2L0qkWQeeaV5nEoysRDkO+q8aLthTRB5Ptx01yMOgqiN2f/wU6/jUQpqmCcIa/zVfH5dF7aWQzBWR+fzXS6kK14hsObbzidYmnjzgksA6EazFRMonfM0VCeWzCy5SxCoR2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755658091; c=relaxed/simple;
	bh=IA15DHUsBfHhU9OCiGncUNUkDYdG2pdwrhAuRa3PYYw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G+onml8noHky2I4XKaR685/eVCqTWqIoFKXEvRHqSnyBQGPsNzyhkdfnes4WYMPWj8v2uRsWoF++w0pXGtliJT5ikDLlDi4X2wtYdUV16G8QinckAlZSUFaDHxtPstnFbERORiKP9ZBPm22stUdEmA4I7MCKINEnv8jmjprom68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dmtygcfR; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dmtygcfR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755658089; x=1787194089;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=IA15DHUsBfHhU9OCiGncUNUkDYdG2pdwrhAuRa3PYYw=;
  b=dmtygcfRUSsxBdE5+KR98cmZ6Kr9TVluNgmgKkmIvfw11LnzzUmJvMf2
   UHlJOActSykqC7CMOaVLXGfq/v1OcKG2wQA6M8bCsUqDm4y3fER3mnwyJ
   MWilqo5apQMvh0bY0EouAATxu3WQyXWQTp8ZDvy34tHA9UUb3C5/kel7f
   bFIjzeKi7qHSfrraGJSBX9N6T9U6lv3ThEMgjDmpMX+3nf6SaYpVODsNU
   gtGXG1E7zuz11IxlcwUKk6l3tO3gZhBqdaRexBixlp4Q0baxr4D0B4L/0
   au9TxMNHZlTncX1pZ1pEMapmwUPkCskzWD/rGvQIz1CA5POIzqW8seVqj
   Q==;
X-CSE-ConnectionGUID: 8nLbA54QRXeOoi4X03cjKQ==
X-CSE-MsgGUID: AMr9HD1USA2Jf4lVjdwSdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57985151"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="57985151"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 19:48:08 -0700
X-CSE-ConnectionGUID: Bp6dkJjdRyuEfqhT8Hxb8A==
X-CSE-MsgGUID: UW99hRGJT7+QZ7tcAgZvHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="172436373"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 19 Aug 2025 19:48:08 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uoYr1-000I0F-2X;
	Wed, 20 Aug 2025 02:47:45 +0000
Date: Wed, 20 Aug 2025 10:46:33 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 5/5] mm/rmap.c:1948: warning: Function
 parameter or member 'folio' not described in 'try_to_unmap_zero_folio'
Message-ID: <202508201021.rbPp8tV0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   b43a48ace14772532b2a6adb713e13cf9168ec41
commit: b43a48ace14772532b2a6adb713e13cf9168ec41 [5/5] anolis: mm: add switch for file zero page
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20250820/202508201021.rbPp8tV0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250820/202508201021.rbPp8tV0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508201021.rbPp8tV0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/rmap.c:1948: warning: Function parameter or member 'folio' not described in 'try_to_unmap_zero_folio'
>> mm/rmap.c:1948: warning: expecting prototype for try_to_unmap_zeropage(). Prototype was for try_to_unmap_zero_folio() instead


vim +1948 mm/rmap.c

52629506420ce3 Joonsoo Kim 2014-01-21  1933  
39cafc7021f058 Kaihao Bai  2022-08-15  1934  /**
39cafc7021f058 Kaihao Bai  2022-08-15  1935   * try_to_unmap_zeropage - try to remove all page table mappings to a zero page
39cafc7021f058 Kaihao Bai  2022-08-15  1936   * with the same offset. If the flag doesn't contain TTU_ZEROPAGE, this function
39cafc7021f058 Kaihao Bai  2022-08-15  1937   * does no thing.
39cafc7021f058 Kaihao Bai  2022-08-15  1938   * @page: the page to get unmapped
39cafc7021f058 Kaihao Bai  2022-08-15  1939   * @flags: action and flags
39cafc7021f058 Kaihao Bai  2022-08-15  1940   *
39cafc7021f058 Kaihao Bai  2022-08-15  1941   * Tries to remove all the page table entries which are mapping zero
39cafc7021f058 Kaihao Bai  2022-08-15  1942   * page with the same offset, used in the pageout path.  Caller must hold the page
39cafc7021f058 Kaihao Bai  2022-08-15  1943   * lock of the newly allocated page.
39cafc7021f058 Kaihao Bai  2022-08-15  1944   *
39cafc7021f058 Kaihao Bai  2022-08-15  1945   * During rmap_walk, it holds the i_mmap_sem to avoid modify VMA which not expected.
39cafc7021f058 Kaihao Bai  2022-08-15  1946   */
b43a48ace14772 Kaihao Bai  2022-08-29  1947  void try_to_unmap_zero_folio(struct folio *folio, enum ttu_flags flags)
39cafc7021f058 Kaihao Bai  2022-08-15 @1948  {
39cafc7021f058 Kaihao Bai  2022-08-15  1949  	struct rmap_walk_control rwc = {
39cafc7021f058 Kaihao Bai  2022-08-15  1950  		.rmap_one = try_to_unmap_one,
39cafc7021f058 Kaihao Bai  2022-08-15  1951  		.arg = (void *)flags,
39cafc7021f058 Kaihao Bai  2022-08-15  1952  	};
39cafc7021f058 Kaihao Bai  2022-08-15  1953  
39cafc7021f058 Kaihao Bai  2022-08-15  1954  	if (!(flags & TTU_ZEROPAGE))
39cafc7021f058 Kaihao Bai  2022-08-15  1955  		return;
39cafc7021f058 Kaihao Bai  2022-08-15  1956  
39cafc7021f058 Kaihao Bai  2022-08-15  1957  	rmap_walk(folio, &rwc);
39cafc7021f058 Kaihao Bai  2022-08-15  1958  }
39cafc7021f058 Kaihao Bai  2022-08-15  1959  

:::::: The code at line 1948 was first introduced by commit
:::::: 39cafc7021f0581440e685018679334899bf3210 anolis: mm: support unmapping zeropage of the same file offset

:::::: TO: Kaihao Bai <carlo.bai@linux.alibaba.com>
:::::: CC: 小龙 <wenqing.ly@alibaba-inc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
