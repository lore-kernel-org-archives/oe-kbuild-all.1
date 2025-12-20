Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE44274652
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 19:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766260245; cv=none; b=jhIeWg6Lp5JpPwvow70sQ7VRP/FwA2MiF8HiWrDVgnJd+EfkCaGWwe0KpVmQWJTRyyO1cWArTGWnZkJ8uw+H2nGZXKliALKCgBrIC/aW/LbgDlBv6ML3j3VL8+bnPUkATt36QKuVjlBhGUkZ32x6x+XCL6BDDUYTqmqjAfom/dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766260245; c=relaxed/simple;
	bh=CM4hOzPDbaxJePaZJW57q8G1PqxDWuo7dzFYRRgvxPE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IE91eXnnVCc5wpqr6zqmExjN7FAd/Tf3o8gHTAoS9VGwiQVP7DCtG3zxP0Hsguc5k+l9a3HcHXlKEz1khF6KexdviDZC+engcaCXJ03lP2Dq9AQSIxAVqg1QpOh09octqwHm7tOR1W36xBx01Nh3/uXNieIBP7XvOoAyAP4rzY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TbLF6zKE; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TbLF6zKE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766260244; x=1797796244;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CM4hOzPDbaxJePaZJW57q8G1PqxDWuo7dzFYRRgvxPE=;
  b=TbLF6zKE33nOKjRRkmNnAh1D3BfENCGa2iZ6eo1OQgPRVsXFmJD7e5gF
   YHvTfkzn8v/7JRKVdgRkNFy9hrBxbgBWo2QYEqv4QnSlD4Mcjqv0SoXWc
   B3YrjrCe1ZyKMX5EaYDUlZwSoKxT23BZJ2c3R1HKt6XDDMwhOYF/TXh+A
   rsGDIR9ZX/qChX5E18ZFLh8V0aRMPkmLNMa/VBlcH/fviK7yeTe1APA/L
   Y5xnUPSZd/cU6vnICRIwjEBTwDtzePBsmNsTqGe3aBm7KzSv3oWDmDReX
   sbSSvykY5PiClVErgRcMIbHowUSSqsoMvNxJpv65FxyhlYJDyMdV7GXNn
   A==;
X-CSE-ConnectionGUID: gb4FDOO/RTib60XV2fZKPA==
X-CSE-MsgGUID: flVAvI2bRzixt64An1MZiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="72029980"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="72029980"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 11:50:43 -0800
X-CSE-ConnectionGUID: zgFFL8DbSt+wlommzwvZgw==
X-CSE-MsgGUID: 0XJ6eQcTRXiw3tw36jDU8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199139041"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 Dec 2025 11:50:42 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX2yN-0000000055F-3OgU;
	Sat, 20 Dec 2025 19:50:39 +0000
Date: Sun, 21 Dec 2025 03:50:14 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.19-rc 41/106] Warning:
 drivers/net/dsa/mxl862xx/mxl862xx-host.c:37 This comment starts with '/**',
 but isn't a kernel-doc comment. Refer to
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202512210324.jaIgihj3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.19-rc
head:   5ee5189ef893fbbb9311f0cdb9f2f382c4a17eb1
commit: 148a77ae7d34d6424afd46fe997b0fbbd35b604d [41/106] net: dsa: mxl862xx: Support cl22-extended and force-isolate option for special purpose.
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20251221/202512210324.jaIgihj3-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210324.jaIgihj3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210324.jaIgihj3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/net/dsa/mxl862xx/mxl862xx-host.c:37 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    *  write access to MMD register of PHYs via Clause 22 extended access

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
