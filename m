Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BED148832
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jan 2025 05:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736660819; cv=none; b=WPS2CvVslOaDIEHr+dvWBQuZFNAIdEWJ4DT64FK9M9a1IHA8BcrOnycR58gkxQtU9REkekdvjWLH1kkfDv+cgPYwq7gCKhLuyd0hzx5B/UXGXt/JWe0Hm868XMpBuNVWmiGePjeSSFowv8ubD9VL3Ao4j5hKfiKyKkr57KfCDfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736660819; c=relaxed/simple;
	bh=szs3SleKFOwYJWxTcwPtegKfnJkBqi2usuqYhptVuXU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OyMbTM9znstel0UiE7lPQHOAhv02JVl8BzlWIBfCNu0JfpJNF0sC7STHLK9davR4pvJS86WHWX1EyRKs3uZ6YTfUbDQOfEQVVVLx1yGbKkqyUs3BUvLo70BumLqL13Ohzafn5X4/Gf9F6uTc5ngOLCUvo4D/7xRGxAGryJMGJ/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LUupTwiy; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LUupTwiy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736660817; x=1768196817;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=szs3SleKFOwYJWxTcwPtegKfnJkBqi2usuqYhptVuXU=;
  b=LUupTwiyWXtdRxoy85rqSenT7wmw+WaB9L6irDnIfhH5d5lytMc/s64g
   Hnr+msIn/OkZLzeAx5TqgnAJyoqEKQNdxOggqAJw/V5Fikzq6aJMsyR6j
   JgVvLK+vc+ZPzQBXDygFz0ktJF3Y7bOObcr4QAU6yApSsd3hW/YdadNlY
   pUVynxzsz82eyjAGfwi1uN8Q5VACHHwSBPArgfcRq+iaXJJ/X/KN6AL0u
   xNgKa8PUgiSHc8Gj7YB79WXN5tjgrRCiLIXRla+Pl2pqne1D4QxcEs/UP
   6A7zvBad3wrsyf37iLq6Hab6vUbRnKsRqPNYcTBwltMGgjo+33ktRZHi9
   A==;
X-CSE-ConnectionGUID: u0t4GrpURWe4zmWs4reC+w==
X-CSE-MsgGUID: zzkFhNBlRtGlvmgph2weMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="47484316"
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="47484316"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 21:46:55 -0800
X-CSE-ConnectionGUID: /QU+cQtnRc2goNnbe1QNTA==
X-CSE-MsgGUID: Ecn6q/7ITTOtX+CwUnxuJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="109153363"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Jan 2025 21:46:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWqoE-000LcO-07;
	Sun, 12 Jan 2025 05:46:50 +0000
Date: Sun, 12 Jan 2025 13:46:17 +0800
From: kernel test robot <lkp@intel.com>
To: Ravikanth Tuniki <ravikanth.tuniki@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>, Suraj Gupta <suraj.gupta2@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:lkp_test 492/504]
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c: linux/netdevice.h is
 included more than once.
Message-ID: <202501121352.XYgy6yH8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: 2092f3c03044d5b7bb881897d9b674eca02ece75 [492/504] net: axienet: Add GRO Multiple Port Support
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501121352.XYgy6yH8-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/xilinx/xilinx_axienet_main.c: linux/netdevice.h is included more than once.
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c: linux/circ_buf.h is included more than once.

vim +30 drivers/net/ethernet/xilinx/xilinx_axienet_main.c

  > 30	#include <linux/netdevice.h>
    31	#include <linux/of.h>
    32	#include <linux/of_platform.h>
    33	#include <linux/of_mdio.h>
    34	#include <linux/of_net.h>
    35	#include <linux/of_irq.h>
    36	#include <linux/of_address.h>
    37	#include <linux/platform_device.h>
    38	#include <linux/skbuff.h>
    39	#include <linux/math64.h>
    40	#include <linux/phy.h>
    41	#include <linux/mii.h>
    42	#include <linux/ethtool.h>
    43	#include <linux/dmaengine.h>
    44	#include <linux/dma-mapping.h>
    45	#include <linux/dma/xilinx_dma.h>
    46	#include <linux/circ_buf.h>
    47	#include <net/netdev_queues.h>
    48	#include <linux/iopoll.h>
    49	#include <linux/ptp_classify.h>
    50	#include <linux/net_tstamp.h>
    51	#include <linux/random.h>
    52	#include <net/sock.h>
    53	#include <linux/ptp/ptp_xilinx.h>
    54	#include <linux/workqueue.h>
    55	#include <linux/gpio/consumer.h>
    56	#include <linux/inetdevice.h>
  > 57	#include <linux/netdevice.h>
    58	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
