Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D653E557F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Jun 2026 14:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781532784; cv=none; b=P+62yVCCA7JHTbbcA8Ag3Hw0o0T6gygKqgK51HZpxQCwh0EOHGqZJ0F+/xG62QQ4+TDN+ZPVHs1qXbO0nqFpOaadeHNfLZp6vEBVqypyYt+3QWqM3fvyRpgleRGjL007y2xEmt67Z9mbDHgm2kmalW/V9t6YnpYQvKrN/o0Jnvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781532784; c=relaxed/simple;
	bh=kqBD2tWgbXeDS9hKxPUnrTUrcSOYX+nYrtU4sRBDbCk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MxKJwrqnRLBL6OaPL6dSy6B+nYI3Tyw0UbSfmuCCv4iel7xDGikfypYdCswuQ7SQJxiMgRJsZg69h/gkqZd8B/tIRT8jQcEulz6RubsvoBzNX0rteYTNVhmjn8S9R+QJ2vr8RrffmKUkt111LqUHhSAOkj3v/bk0kAqKaSwQADA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RuSHPcjB; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RuSHPcjB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781532783; x=1813068783;
  h=date:from:to:cc:subject:message-id;
  bh=kqBD2tWgbXeDS9hKxPUnrTUrcSOYX+nYrtU4sRBDbCk=;
  b=RuSHPcjBCJgLoog2Yi0Y8FJDQyGjmPY9uyxs+SmZiNL68t+XbBYHLKwM
   CyXsvnsN4xpZblKiGwguSeWzG6VXuOPyfoxJoSXDg/15nlhWfKZh/Fo8y
   5pg8/WKU2VtNlWV/Jgl8pR2cGbD4Jkm9q13daNJmyut28ToZoIqWmuNP3
   SZocrCbY5FpFULfE0Zy/PXQ+cQjqQpNeUMHipXvZmJVpS9+GQZvWpSBil
   /gAcPZlwemrwGcK1BNcba4+Ibed28H3MG+iTd0yRgID2Z+p5qI3yXIpxc
   3qfYsL8Xb3WgAZmoFlM8LlVpQOgbQH/Ql9zfP3qB12BaL/jHfE6tqBNk6
   A==;
X-CSE-ConnectionGUID: u4Zgnnw+RE++cuY97pWK7g==
X-CSE-MsgGUID: pf6f/M2IT+ywQS1FXCAt3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82120392"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="82120392"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 07:13:02 -0700
X-CSE-ConnectionGUID: OSG+MymVQ8eB9X3fiuFzUA==
X-CSE-MsgGUID: xjC6DlfJSvCKsARVSqNzYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="247348498"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Jun 2026 07:13:01 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZ83d-00000000Rvc-3PFL;
	Mon, 15 Jun 2026 14:12:57 +0000
Date: Mon, 15 Jun 2026 22:12:49 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Alencar <rodrigo.alencar@analog.com>
Cc: oe-kbuild-all@lists.linux.dev, Jonathan Cameron <jic23@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [jic23-iio:testing 26/33] lib/math/div64.c:163: multiple
 definition of `div64_s64_rem'; lib/math/div64.o:lib/math/div64.c:163: first
 defined here
Message-ID: <202606152154.P6pwbjhp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   a50909aa46dec46de3c73235fc15a7d6f763d996
commit: adebf76278116a06166d0b5f8b4112ad5dd6389a [26/33] lib: math: div64: add div64_s64_rem()
config: arm-randconfig-003-20260615 (https://download.01.org/0day-ci/archive/20260615/202606152154.P6pwbjhp-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260615/202606152154.P6pwbjhp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606152154.P6pwbjhp-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: lib/math/test_mul_u64_u64_div_u64.o: in function `div64_s64_rem':
>> lib/math/div64.c:163: multiple definition of `div64_s64_rem'; lib/math/div64.o:lib/math/div64.c:163: first defined here


vim +163 lib/math/div64.c

   160	
   161	#ifndef div64_s64_rem
   162	s64 div64_s64_rem(s64 dividend, s64 divisor, s64 *remainder)
 > 163	{
   164		s64 quot, t, rem;
   165	
   166		quot = div64_u64_rem(abs(dividend), abs(divisor), (u64 *)&rem);
   167		t = dividend >> 63;
   168		*remainder = (rem ^ t) - t;
   169		t = (dividend ^ divisor) >> 63;
   170	
   171		return (quot ^ t) - t;
   172	}
   173	EXPORT_SYMBOL(div64_s64_rem);
   174	#endif
   175	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
