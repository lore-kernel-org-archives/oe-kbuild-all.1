Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099DE746E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 May 2025 00:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748048033; cv=none; b=h5AXRrV5aFw6NleoItD/16JWL2c7xDHHzHrDcik1/ekKZPp3O1/WV1Eou+BCnhFau8A6DCm0z+5SGR6HHgZwYLZTNw4JinT2T62UrkPKwabzKBXmOzDlO3/k6PlYeTAgewYgULCftpqv9HH/natpJ4fQqPqRwwVPve8B6QZlJ0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748048033; c=relaxed/simple;
	bh=PW+5GxHNloWVCyoMLVKNXlLxZykPhKR6hu+Po5TiOuI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lljCLjEIRWeoF5o76DH0564u7zdfESEyudZM5ZEJWUajD3L9U+aupF6MbJcJrbruSZhY6XP4JFOySHxu6dGrYzZujCe37Zt1ByQai1gN7tfIvXTvkica5UfqU2yX9wZ1rgBcGazhkWLNuRKpanHM41QigyUFgJj96SAwrCE3Cdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gr0kzJNd; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gr0kzJNd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748048031; x=1779584031;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PW+5GxHNloWVCyoMLVKNXlLxZykPhKR6hu+Po5TiOuI=;
  b=Gr0kzJNdvkUupXPAHHtuF3iZKa00ES3xrwkk8qxaLRJiESHOn8b2Mxz5
   auYGgX1OqZaYz2RubbkMIzpDbeim+cQ3f7XnqjJeopmiBkM4ryMQvWuCk
   hscog6H29ffKFuIj8Gut2SZQWtkxxsOP8WxD/HYmacpEB1ULTnpQHRCB5
   rqtX52sJO4kWUQY9br/CcnL1O0kim5Cw0L/t4nAS2cBJDZFwA1SIjq+pb
   4EVewJOLaeVXcxOOXXVAfaEAr56aOhAigxWfVfUoyMjdG7oMu0NgVA46h
   +IZeDznSeULjL/ScKjJ5ulmyDo8HxXSUWuazMhiurC07DZIGiqRz2M+8K
   A==;
X-CSE-ConnectionGUID: +T09+BU5T22tazLlYLPlSA==
X-CSE-MsgGUID: 2P8MBo31SDKQG6V4amcD3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="67669951"
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="67669951"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 17:53:50 -0700
X-CSE-ConnectionGUID: n/WqW5x8T9u31LVne6Qjqw==
X-CSE-MsgGUID: Vi2oj/LQTouAeBSwh/2yig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="142318427"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 23 May 2025 17:53:49 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uId91-000QqK-0x;
	Sat, 24 May 2025 00:53:47 +0000
Date: Sat, 24 May 2025 08:52:59 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 10346/13331] FATAL ERROR: Unable to parse input
 tree
Message-ID: <202505240805.Kz8lyX6D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   176e917e010cb7dcc605f11d2bc33f304292482b
commit: 9e010737dd434e3eee1fa75938abea0dc2fab8e2 [10346/13331] ARM: dts: rockchip: add rk3036 usb2phy nodes and enable them on kylin
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250524/202505240805.Kz8lyX6D-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505240805.Kz8lyX6D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505240805.Kz8lyX6D-lkp@intel.com/

Note: the linux-next/master HEAD 176e917e010cb7dcc605f11d2bc33f304292482b builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   Error: arch/arm/boot/dts/rockchip/rk3036.dtsi:358.28-29 syntax error
>> FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
