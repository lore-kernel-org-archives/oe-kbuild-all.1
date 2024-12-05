Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CC72770C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Dec 2024 07:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733383603; cv=none; b=bXi91gAwjdHaBZ/f5SfngSCsQ0MsX0du5iQyZo+Ll3zfOSpo8JPyNltI/AWmZjDLo0/3gcZ4YT/ohY2ZszvuYTrUaqfHv2yjAS0pSBFfIEJ2G5hOfUqLFEokiBuFg3c/Mmp73CuImuMiiI6QNH1rtG/W7ozI/6RANOXCm8VAkpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733383603; c=relaxed/simple;
	bh=lbkxOqZmOe9VfiNggXWLV3RXafMPc1B+PHyBwpCmEPc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vv/OE6NZGl8xBhUkQGdOfEx8Q1SyNsHLcUCNNQIlNxy8xtGX9m2pot1AQC3QoUYi1b+gzAisT8X+oVBr3KJ1hCsnWiGXvWWJzdouCKId//5OONZsrc0GSR6RMkOhO+F6rBexThCkyqRw/iYsPKose3rDv+kdpeSQFqN5QWo9cf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RVww3YjT; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RVww3YjT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733383601; x=1764919601;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lbkxOqZmOe9VfiNggXWLV3RXafMPc1B+PHyBwpCmEPc=;
  b=RVww3YjT6Q4GWxoDx5MxCGmwiGAgVe1EkfUf2dc0KrP+TiJrU1bCk/me
   GlswnlBnpY4dPyNEWuQegXQxA4Z6t24AOcruwtyB1m9VgPMwIksSxPKmK
   MvttuCbBabMLhmYRR23dXJ2vA6WCSRpY7HBP0BHZswKq61kgYF6JVnm2+
   6rBlEhzHTThl5mAP67h/AkxQNq9Xm6kHOZ4PCxaeEO46ub/yMmmrD6wgI
   ruZHgMzWTxx1EdDVrKD1H4TridA0sy9prFfiUgzRVqaKc4G27SbC8PS2I
   vjzb9wJP84iqKzLXB+LqpKyUWSj4lWk+RNcZb87z0R05b+Ec+9Y8deXZ2
   w==;
X-CSE-ConnectionGUID: 7oBupi/wTQKwjdRzER6IMg==
X-CSE-MsgGUID: rUvP9sjPRmmow8e1bZsE1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33561986"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="33561986"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 23:26:40 -0800
X-CSE-ConnectionGUID: c2bp2gfDTGa8THfW33SHCA==
X-CSE-MsgGUID: 5G6YgRXuQlOG1Z2284O2sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="98078225"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 04 Dec 2024 23:26:40 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJ6Fx-0003w9-21;
	Thu, 05 Dec 2024 07:26:37 +0000
Date: Thu, 5 Dec 2024 15:26:32 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:b4/sm8750-dispcc 24/31]
 drivers/clk/qcom/dispcc-sm4450.c: linux/mod_devicetable.h is included more
 than once.
Message-ID: <202412051533.Lq9EAW8z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux b4/sm8750-dispcc
head:   9f7318eca3c4c9e83857dd90f3fda88f0893f2bf
commit: 4ab44213ea73f46e2ca7ec27d76e90f7740178b5 [24/31] clk: qcom: Include missing header includes
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412051533.Lq9EAW8z-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/clk/qcom/dispcc-sm4450.c: linux/mod_devicetable.h is included more than once.

vim +7 drivers/clk/qcom/dispcc-sm4450.c

   > 7	#include <linux/mod_devicetable.h>
     8	#include <linux/module.h>
   > 9	#include <linux/mod_devicetable.h>
    10	#include <linux/platform_device.h>
    11	#include <linux/regmap.h>
    12	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
