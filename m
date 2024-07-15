Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023B213D8AC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Jul 2024 20:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721075484; cv=none; b=tFfJZY134tWYncu976mU2gTA2/juVXGJlw55TRUsx2HDz6XrmGB2NTjzdJ6AOs7KFn/b/t03BUCKrUTQL228zxyuwwRjIQBzdwmceM17hy/0slOGTbCYtFJpdb2FtForrAFA1Q4fAsUrlPU0fmX5BOloZb1kPg9gIkd0S9cEl30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721075484; c=relaxed/simple;
	bh=+lqEIApOFJOCVWv5qx2FNdnXqm2fo6wwrS8cKlQLI6I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F2qvybED+OlEC3SD7o7Bvwk4b4+8ZT8xpiIoIcRCajm5//s0Pn3G3Vxjpzn97b5BPnnoMXtNFscbh+IhglA9REt+X1JAof/e9YxZHsHnD6d8kWXGgaZauDg0aD/mtkAjfa3M5i7OPi+Nb5zkSKdDndcdib8J5V31C7aIYcLbYlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n/yaKhAv; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n/yaKhAv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721075483; x=1752611483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+lqEIApOFJOCVWv5qx2FNdnXqm2fo6wwrS8cKlQLI6I=;
  b=n/yaKhAvbAc73EZSB8S0LhNEMhEPFRw3z4m+dEB6NVPBRH1jBBYrRWMq
   VIQlCrguiJ+TMJFEptFWELwsvcCXyZGztlUQz5SD79gEa6lsd/NAhNY1Q
   KKp9nqU/AttY9BjbEN29BpgDDVITP3FAgBwA91//FaDWh7jme6c6PMJdr
   +0lShrUcvSZlwjIWkfeDBbqSb66vJjnrCrZQ8nUAkMF7pWtdwFH5mmF2N
   gzKkQXYaUUkX9az9QWsyx04u8CaXOOr9XjQBQqPS8mSk4/7qzWDEz7HZT
   EiCVDeurI+s+VxVSVBjEuTB80RggxEksNJf5Kj1uP5/5qwazXrsnr7GyK
   g==;
X-CSE-ConnectionGUID: tZPSc60+SayF/BOzCojWSA==
X-CSE-MsgGUID: qo8BPIylSc26WUjj77yBrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="18614000"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="18614000"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 13:31:22 -0700
X-CSE-ConnectionGUID: +z7w6fXSQlmQsSO0PZo80w==
X-CSE-MsgGUID: 7LPoyI/HRNm7qYWNrsXChA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="54009108"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Jul 2024 13:31:20 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTSLu-000eZ4-2f;
	Mon, 15 Jul 2024 20:31:18 +0000
Date: Tue, 16 Jul 2024 04:31:12 +0800
From: kernel test robot <lkp@intel.com>
To: Breno Leitao <leitao@debian.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jakub Kicinski <kuba@kernel.org>
Subject: [linux-next:master 10136/12989] undefined reference to `iowrite64be'
Message-ID: <202407160457.mGbLotDK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   91e3b24eb7d297d9d99030800ed96944b8652eaf
commit: beba3771d9e049dd552ce42a31f263e098392407 [10136/12989] crypto: caam: Make CRYPTO_DEV_FSL_CAAM dependent of COMPILE_TEST
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240716/202407160457.mGbLotDK-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240716/202407160457.mGbLotDK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407160457.mGbLotDK-lkp@intel.com/

All errors (new ones prefixed by >>):

   alpha-linux-ld: drivers/crypto/caam/jr.o: in function `caam_jr_init':
>> (.text+0x1938): undefined reference to `iowrite64be'
>> alpha-linux-ld: (.text+0x1944): undefined reference to `iowrite64be'
   alpha-linux-ld: (.text+0x19b4): undefined reference to `iowrite64be'
   alpha-linux-ld: (.text+0x19bc): undefined reference to `iowrite64be'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
