Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D88400DFE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Jun 2026 15:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781536152; cv=none; b=VSgoh5dIZJ2TfQPOpnXbbthec549QP+ZBsLaV1HNa5YOeGIT5MaVWMr71CvovbYvh+BOTAs9GXO98oIwuQlOX82l7dWpCO3ZIZHV6+lpqQ6PRtp84pGIUEaQFYrGD470GpKx4V00W4rNqaPWN6WQoqhXe6wZ26dnJZcMGHw0F+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781536152; c=relaxed/simple;
	bh=yuRyv9muj2SHJL9jQHzBL1onNtSQc6kr586Sd9uDvl0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uQSqhy6FeOQzVXcDvVJUa14ep7dB4hq379uFj8+xAmVYXSC5K9o1y+g17X+0So/ZQ4t3VnQLqe0LSX+2M3C90RlEtqt5L0pw/EmwuLd87KC907O260S6NzhKBFrBQgvSnF5aP/BamsX285CXoFFwzTJjaXUWn7o4umSeTMQ+AHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EOps2MNT; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EOps2MNT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781536151; x=1813072151;
  h=date:from:to:cc:subject:message-id;
  bh=yuRyv9muj2SHJL9jQHzBL1onNtSQc6kr586Sd9uDvl0=;
  b=EOps2MNTwqjV+H+VFXUWMaiSQ27wuofd85zGnRbqTUcDXL9pGjGhnjyi
   9sGv/FhzUCisG8BK6VgNEKAkUDjQOht+epN9KPN+t24ym8pv0/aadLEkE
   rDcXQZ9CeR10t/COQZf5GyItZJI3HM4vPaQ4ETxUuhcATzs80tKOyBjvQ
   5RJv9cTjoojfh0B48YIPsl7MfLoGLDMZsnQ9BmlnEW9TywvvSk6ORrOUv
   ANsXovkH8w+vPDys7GeS14TuKBA43+WEmuEbltj6Bi69ibodscEJ7KTp5
   WxRWhK9RV1oukkhBnTYcoUQOUL1KkgyfCcY/wUcQfsvsp19dBIwb5jOGN
   A==;
X-CSE-ConnectionGUID: L1YqO37STkmvnJAtsM/9ng==
X-CSE-MsgGUID: Tl/bOPGmQ/uwTN++PDxxXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="104949237"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="104949237"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 08:09:10 -0700
X-CSE-ConnectionGUID: 7+WhXpjYTSqnXORNesTXCA==
X-CSE-MsgGUID: 56fweaqeTIOIzabMGZNm6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="245090630"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 Jun 2026 08:09:08 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZ8vx-00000000Rz0-0onA;
	Mon, 15 Jun 2026 15:09:05 +0000
Date: Mon, 15 Jun 2026 23:08:52 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Alencar <rodrigo.alencar@analog.com>
Cc: oe-kbuild-all@lists.linux.dev, Jonathan Cameron <jic23@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [jic23-iio:testing 26/33] ERROR: modpost:
 lib/math/test_mul_u64_u64_div_u64: 'div64_s64_rem' exported twice. Previous
 export was in vmlinux
Message-ID: <202606152351.nDCF51RT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   a50909aa46dec46de3c73235fc15a7d6f763d996
commit: adebf76278116a06166d0b5f8b4112ad5dd6389a [26/33] lib: math: div64: add div64_s64_rem()
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260615/202606152351.nDCF51RT-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260615/202606152351.nDCF51RT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606152351.nDCF51RT-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: lib/math/test_mul_u64_u64_div_u64: 'div64_s64_rem' exported twice. Previous export was in vmlinux

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
