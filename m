Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4372724B259
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 09:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736586204; cv=none; b=UC+ryvDwyvTkiU8HNO2SdPuYBaU1bV0WdgcEP5oDT6BWvPyOl0nMR/Vj5rmPZIVgeOizSedxSjbqH/EAsmqHSUU3ZdqDTtnh8z7MqTnEdwgy9FMqmjYeKMi6aQeAOa7aA6MmpfogLq+vbpbiB+QwGGBv98V4cr9sGqcTE7V72Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736586204; c=relaxed/simple;
	bh=iua3EWWl+jFYZ24adIM2Pf3/4+mRGPG98eE4ix6Dil0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eJsGhwSOo98ocEKaV4ZOjX+WWCl+DM7dIEX2/iBajz+hDOOmucE0Uf2qymULSzHG2vn9ztUgy8gBGnjgqY3jUn6Rp+vjaQ6vmb+G6sUlOBgxkAciLVcMYTUcO1uHVJ0HaWg5xZE9lXrcrN3bLFcXpuCtQqZuG5yQjx8CunQPJ1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GQZGErrE; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GQZGErrE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736586203; x=1768122203;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iua3EWWl+jFYZ24adIM2Pf3/4+mRGPG98eE4ix6Dil0=;
  b=GQZGErrE6cHNtvXJXItqbZ0WANIKmhPN0iPq9FrHG1yhc69cZk9iwqxG
   lqmrD0AapkRWQJ2YmOCGO6WkM0dATQjRLtGhrbAgp5y5d4iTKnwzAEKmA
   dJsY9Hz/58A+kKl71qCAYnZOLdDk+tTHVQuyAjF6h+ngY6evgXnfWDp/f
   1Cyneg8qNnAN7JeX6istzgeCgbokPEtVRqGm79bk1HR1aO3ldQ5tYaZnd
   aR/T1VRN32dXDFOvq2T+PEj9KiEtqwSUwWCb4/KBdwVXdvyHK3JZPDTuk
   L+9ohVWlzgD1VYu5xyT8jLbWCIL0BvEBDyBaf75rL6DL7dyv/v90i4gI6
   w==;
X-CSE-ConnectionGUID: Oqddq+ltQfazq4AJ8Kov+g==
X-CSE-MsgGUID: QzEzbqx7RCm1Aqp/+n0hBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="47539394"
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; 
   d="scan'208";a="47539394"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 01:03:22 -0800
X-CSE-ConnectionGUID: f1gkRCSYSqm2C839uk9KaQ==
X-CSE-MsgGUID: Y9FDfT0ST1eD7hGQGr+1bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108582765"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Jan 2025 01:03:21 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWXOo-000KPr-38;
	Sat, 11 Jan 2025 09:03:18 +0000
Date: Sat, 11 Jan 2025 17:02:35 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivas Neeli <srinivas.neeli@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>, Suraj Gupta <suraj.gupta2@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:lkp_test 478/504]
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c: linux/circ_buf.h is
 included more than once.
Message-ID: <202501111602.FQqGMiyf-lkp@intel.com>
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
commit: 8512a3fbb60d8910d671a191f738295edc596a74 [478/504] net: axienet: added multichannel DMA support
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501111602.FQqGMiyf-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/xilinx/xilinx_axienet_main.c: linux/circ_buf.h is included more than once.

vim +26 drivers/net/ethernet/xilinx/xilinx_axienet_main.c

  > 26	#include <linux/circ_buf.h>
    27	#include <linux/delay.h>
    28	#include <linux/etherdevice.h>
    29	#include <linux/module.h>
    30	#include <linux/netdevice.h>
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
  > 46	#include <linux/circ_buf.h>
    47	#include <net/netdev_queues.h>
    48	#include <linux/iopoll.h>
    49	#include <linux/ptp_classify.h>
    50	#include <linux/net_tstamp.h>
    51	#include <linux/random.h>
    52	#include <net/sock.h>
    53	#include <linux/ptp/ptp_xilinx.h>
    54	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
