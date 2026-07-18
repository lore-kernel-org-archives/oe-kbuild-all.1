Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819D7282F21
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 06:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784356728; cv=none; b=lC0V6+AMu81QyPZ5WWkIXkri1ah6T5gQKwgHO1t5EwyDb61ZMq1IWvacUYZ4rIVcd5NWEfaG+wq69iC0MhHaYuDU53cf+NwBA1aLTDHtLcZcZWTp+suFNM8K4P5Sa5RdUQ5sb6QvQyJNScF0zBseDN/xGBo+nuNUUfLz7OcZvgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784356728; c=relaxed/simple;
	bh=ZHB0FoMvSoDkTRs1ASZXpKFE0k4T6gPUxXFVaUboo1Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tFI+bTdl2vB5uaQyKKbNpJlbA7yfo231+dQQHnv1WzsjgPh5qDeTBWsHye6xZWl2dxBboKvj0p4JuEr4c5451UtnzqRZqzbxo1P7rwRyM2UeN5GthFgKcxGq0pEC5rn5tZMWV2BIjwfpq4OeWJOIotI3XCVf2cmXBVGvLiPD6CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xwr5uFXJ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xwr5uFXJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784356727; x=1815892727;
  h=date:from:to:cc:subject:message-id;
  bh=ZHB0FoMvSoDkTRs1ASZXpKFE0k4T6gPUxXFVaUboo1Y=;
  b=Xwr5uFXJVMwqpWgEkw3h1UiYUEF8wlSARR+tEwfacPq9EfEpW3i0l3O5
   8uzcVobxSpynEoTZF31SnJgADZ/NrebYkJAcuSNn88zI8MgoZD7uyy0+O
   koJVgnziPYgK4v/jhbSQsyHu3o4P728L3rYh7SVO4qooB7XOyBlQCtyfX
   5iKDAK1U3Gb91zlM9VLxIfbez25vIeqzi3aR5wajcfSGQQbYePY23Mxv7
   q1vC91mT+iKsXZ2rNhTeb0bPhCsJ7apaoW7Zpgn6bjNbndahmduc1DFV9
   m216mQo8Jx8yvhI9bJDZnz+ZFLq91b44TOdf2nlnNiVE5j/0a1MBbt38C
   g==;
X-CSE-ConnectionGUID: aapcu84EQjuosJ7OueJXTw==
X-CSE-MsgGUID: T22I3O87SLu15Q28WXtvAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="95374058"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="95374058"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 23:38:46 -0700
X-CSE-ConnectionGUID: DCVZlgUkTaOcG6zd3oOM/g==
X-CSE-MsgGUID: 7udXq3jMTriSAPRwZO/2pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="261239905"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 17 Jul 2026 23:38:45 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkyh8-00000000TWh-0VOQ;
	Sat, 18 Jul 2026 06:38:42 +0000
Date: Sat, 18 Jul 2026 14:38:37 +0800
From: kernel test robot <lkp@intel.com>
To: sofus <sofus.c@icloud.com>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/240-isp 58/60] (.text+0x1440): multiple
 definition of `get_ref_buf';
 drivers/media/platform/apple/avd/avd-drv.o:(.text+0x16c0): first defined here
Message-ID: <202607181446.whf3xuAc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/240-isp
head:   95738fb3e5cd5df1e394067152d23097c1eb0b02
commit: 113f70cfac45961a46c1b4ca068520e3652dc964 [58/60] media: apple: avd: make get_ref_buf shared
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260718/202607181446.whf3xuAc-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607181446.whf3xuAc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607181446.whf3xuAc-lkp@intel.com/

All errors (new ones prefixed by >>):

   alpha-linux-ld: drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.o: in function `get_ref_buf':
>> (.text+0x1440): multiple definition of `get_ref_buf'; drivers/media/platform/apple/avd/avd-drv.o:(.text+0x16c0): first defined here

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
