Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C9A1B87D0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jan 2025 13:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738329133; cv=none; b=NDVeI+ISDw82GqYyqQwPAXAztgCQRcx4VzM0KBXmx/MTd2VR/JISqNhqp8ob21PpcAz3AjroQWSXVFfw1YgLMYAXAVdU/hZGgvkhWAXfBBG0DG59JM2wcA+ztFdaARnzcg2V1hB2+W89+Py0UFXuXBnrnVuRoiPlKX3h4+6tdBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738329133; c=relaxed/simple;
	bh=XueUIljuswEaK3Qo6pPmZmP/MAOdV1GRV9v2BYRB/Is=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kuIqEeqCTIQXl4on18ae23kkDPnbRbDUUPH2uRG0wGDGl3PpIyeJfDz+miJ1i+GUREc7jnm/z0suYVSdlQ+jzWwlC0BIVi3zVGjRzz/E8vEwndFmPsMaP4rZStWnC1GtSjnV9xk7fJwinKsruGuVt8dJduH9j56VIOvFO8psrCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a/UipS3v; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a/UipS3v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738329131; x=1769865131;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XueUIljuswEaK3Qo6pPmZmP/MAOdV1GRV9v2BYRB/Is=;
  b=a/UipS3v+A/eyPNW+Kv9TfYsE9RH14AuZgnp3qp1ptVKHXgn6858/jZA
   AG6jbarog5u90CMOQb+eRCwX4GqLvl/wXn+qu3fs5INPW5y32jm3In+9/
   5FxO4XCJMiBIJUh6bX1/jfGwx6AiwvIcCmNw3lEHhE8E77QUOpEZw1V3a
   Ut3kofYeaMXO0oK3QHQJrnhCvZeGLmY24SpzvYkEP/e61EDQpq8Ra91oD
   /xpCd523rOCtwZDqVqrd2zvxdCTePkl7aZ+aJlPZBg3+ll3BMYZZF0qQo
   EE8MsoH2vxVC4TldFDJfsfKOjMYqpDcrSIQmuuSEnjcyULt25d2UCnsJx
   w==;
X-CSE-ConnectionGUID: rjRl+S8ARhWRowkXPTxzOQ==
X-CSE-MsgGUID: Nq9AgT0RRjGqmZ7EsMMzzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="38799895"
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; 
   d="scan'208";a="38799895"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 05:12:10 -0800
X-CSE-ConnectionGUID: NOL8q/UfSASdzriccgJhIw==
X-CSE-MsgGUID: xdM29OXMRDiRtpAVfGMPtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="114618843"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 31 Jan 2025 05:12:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdqoY-000mOp-32;
	Fri, 31 Jan 2025 13:12:06 +0000
Date: Fri, 31 Jan 2025 21:12:02 +0800
From: kernel test robot <lkp@intel.com>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-nonmm-unstable 52/52] lib/bch.c:317:undefined reference
 to `__paritydi2'
Message-ID: <202501312159.l6jNRaYy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   1b9f78ccbffefb107cd92e20cfccd03ff2fa9d0e
commit: 1b9f78ccbffefb107cd92e20cfccd03ff2fa9d0e [52/52] lib/bch.c: use __builtin_parity() when available
config: arm64-randconfig-002-20250131 (https://download.01.org/0day-ci/archive/20250131/202501312159.l6jNRaYy-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250131/202501312159.l6jNRaYy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501312159.l6jNRaYy-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: lib/bch.o: in function `parity':
>> lib/bch.c:317:(.text+0x10e8): undefined reference to `__paritydi2'
>> lib/bch.c:317:(.text+0x10e8): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `__paritydi2'


vim +317 lib/bch.c

   313	
   314	static inline int parity(unsigned int x)
   315	{
   316	#if __has_builtin(__builtin_parity)
 > 317		return __builtin_parity(x);
   318	#else
   319		/*
   320		 * public domain code snippet, lifted from
   321		 * http://www-graphics.stanford.edu/~seander/bithacks.html
   322		 */
   323		x ^= x >> 1;
   324		x ^= x >> 2;
   325		x = (x & 0x11111111U) * 0x11111111U;
   326		return (x >> 28) & 1;
   327	#endif
   328	}
   329	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
