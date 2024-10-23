Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935FD1C68A6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Oct 2024 16:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729700212; cv=none; b=CfJUUOIeChdLP1hOCwi9B7+Odq83malaUf4MVZ48PL8v03cD55fTPJ0KvgCwdtyn3RQhE4qX1fwdIP5VRq4p6/cu9QFaKeIjaIxa7A9h5SYQIsTlyBHsmsKD5w/oZ7ZaXLm5YhqDPBYmFUc/pmB7MQB3PDEWYuHdT2pj+90Y17E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729700212; c=relaxed/simple;
	bh=61A+spBzvZxCGP5xpoabtHachKMcv55VkBU7e0sZqA0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hYVt/VW9+4+cgBEPYIkcnImcP/4jUX3ohk8h/ZPZYzmBLluDNYzF994pcyCmLYltNtSRim25G6NfRFAjiEGMMrARSarLq8IwDR964/QI28xtUVi5YAuzEbKvAEOZzoePgJ7Ma9xOsT4hTL2uAtEUSu9r3c63BMrDES+0zSyje38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VsCNSW57; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VsCNSW57"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729700210; x=1761236210;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=61A+spBzvZxCGP5xpoabtHachKMcv55VkBU7e0sZqA0=;
  b=VsCNSW57uVy7IJMJU+vQ5xL4+oPtapSiA5lpoPOfCP33hXCiPZMCFR3i
   ntfNE/+tC0sbTKHy7je2VaObzMAHqV52/lQOoLXgeYj1tVAxFwosVlQED
   csPE51REml+5pIBoTQbgCD6O0VHWIL5lXm7ylKhmv6DFLKoBri+SBAa72
   /rPvlw3kHD54q4F/Ny2fh09Zydr6bFyhO8oZIJ5okVI9IDpi61/ZZMeXX
   1HmqW/O7B+xh/Rq5gJcwGcgiXS90fvL6KasgtDy7x57sSlnpspbwc28st
   UtT2c51Uxwbmtrq5RarwUPSs8zirHYsfAA986raMR3ulJBowRfP9+PyYN
   g==;
X-CSE-ConnectionGUID: qxanCfFcRFSf/HDhuxCN5A==
X-CSE-MsgGUID: 4NolvPe6SF6jsvut8bltKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29459908"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29459908"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 09:16:49 -0700
X-CSE-ConnectionGUID: /3+DXF0IS9m5iFCvUT5MyA==
X-CSE-MsgGUID: I8BtB1juRE2+Ncv01sP8Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; 
   d="scan'208";a="80201756"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 Oct 2024 09:16:47 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3e2O-000V8b-1D;
	Wed, 23 Oct 2024 16:16:44 +0000
Date: Thu, 24 Oct 2024 00:16:03 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 2/3] drivers/char/lsse_sdf_cdev.c: linux/module.h
 is included more than once.
Message-ID: <202410240025.jSIx3dcS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ce9f9d823a41831d622fa11e29c3d620c044f51b
commit: fa87877229005c6022ea17cad71d913663b7c62c [2/3] Loongarch: Driver for loongson SE SDF
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410240025.jSIx3dcS-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/char/lsse_sdf_cdev.c: linux/module.h is included more than once.

vim +5 drivers/char/lsse_sdf_cdev.c

   > 5	#include <linux/module.h>
     6	#include <linux/cdev.h>
   > 7	#include <linux/module.h>
     8	#include <linux/wait.h>
     9	#include <linux/of.h>
    10	#include <linux/iopoll.h>
    11	#include <linux/platform_device.h>
    12	#include <linux/uaccess.h>
    13	#include <asm/se.h>
    14	#include <linux/list.h>
    15	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
