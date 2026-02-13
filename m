Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A3433D4FB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Feb 2026 23:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771024855; cv=none; b=gp+v/DlAAtNVTbtgoj/WY5CvWg0e0tUeg8vUE+COYV9W4zIf6xJ1+3NVo7sWHiOy1FnQQLQRXtMtk2/sbvN8H0zb/kyzM7jCc8ND2RGb/dlWyEWjJOnm759hB2KvdI4wq2k+IvfFn/EnVmWQxoJx9hNp3WKjsxXwlvjSVK3eesw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771024855; c=relaxed/simple;
	bh=pEBkECU3cXv02WIJIPMfuozKFtbuPc3faMx1qdHNRm8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YdOHpTs+nef5hxSx0f80k+VG+ESelbGiiNeFNvXlqv3YsdIZedGDv694Vp5A4ah0wrk3D0SOa3J7+8LzA85SGyOvcWHEpYWq8Qmf7XefTE8OcIF92ejFZ+0El4+1rBHM4lLA9Mo5SSb/9Y4HdUoC11SUzR/4B+vJoic6xTCz2+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A8FzEGyT; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A8FzEGyT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771024854; x=1802560854;
  h=date:from:to:cc:subject:message-id;
  bh=pEBkECU3cXv02WIJIPMfuozKFtbuPc3faMx1qdHNRm8=;
  b=A8FzEGyTw3uBmGASZuxYxGL12GZKDAsVMrI3PPhLprEIRaYvCgG+z8Pt
   nkL1A2W4tItdhyuqLAT2JT4boB8ZHDVc4TyalSwJQShQTUFtyCAhWuJHN
   1/q7fc0WEIhQsMBiRyvq/15s/sQ89/sYcPYocgwusIxYalmu9wf7gmvi+
   OwAzzo5/cFeknS7VAKsPz9pkZdH0sdYBi4eedYXrKRYzLKthWj2xN3E3P
   w93pGa+HHB5YopJVsRH0yWRJz2PeB15YqpY8N2z6Vh8alP0vII8sQxBkL
   NAg1/Po1D3L02tHBq8TOxCy5wBUhjvMT2TszMcnCHzTIVFr8mmqz8BNIc
   Q==;
X-CSE-ConnectionGUID: WJuxHKKtSXewRwSvp3EDMQ==
X-CSE-MsgGUID: T2TLzPLMTq61Y9RCH1XQHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="72388597"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="72388597"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 15:20:52 -0800
X-CSE-ConnectionGUID: 0Ygf6UPZSHegsEWxTZfNTA==
X-CSE-MsgGUID: 2eOUzefnT9m5WypI0qALWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="211711521"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Feb 2026 15:20:50 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vr2Su-00000000vts-15zH;
	Fri, 13 Feb 2026 23:20:48 +0000
Date: Sat, 14 Feb 2026 07:20:33 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:master 66/590]
 drivers/mtd/spi-nor/micron-st.c:224:36: warning: 'n25q00_fixups' defined but
 not used
Message-ID: <202602140733.VfVh4Dqg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/Xilinx/linux-xlnx master
head:   865e73109750d465f06dee019396406a354eb9d2
commit: c5fb166c7893b13c37747d601d51f5458de6ac20 [66/590] mtd: spi-nor: Avoid locking/unlocking unrequested memory blocks
config: x86_64-randconfig-161-20260213 (https://download.01.org/0day-ci/archive/20260214/202602140733.VfVh4Dqg-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602140733.VfVh4Dqg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602140733.VfVh4Dqg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mtd/spi-nor/micron-st.c:232:36: warning: 'mt25q02_fixups' defined but not used [-Wunused-const-variable=]
     232 | static const struct spi_nor_fixups mt25q02_fixups = {
         |                                    ^~~~~~~~~~~~~~
   drivers/mtd/spi-nor/micron-st.c:228:36: warning: 'mt25q01_fixups' defined but not used [-Wunused-const-variable=]
     228 | static const struct spi_nor_fixups mt25q01_fixups = {
         |                                    ^~~~~~~~~~~~~~
>> drivers/mtd/spi-nor/micron-st.c:224:36: warning: 'n25q00_fixups' defined but not used [-Wunused-const-variable=]
     224 | static const struct spi_nor_fixups n25q00_fixups = {
         |                                    ^~~~~~~~~~~~~


vim +/n25q00_fixups +224 drivers/mtd/spi-nor/micron-st.c

c692ba6de1c5b4 Fabio Estevam      2023-11-25  223  
d8b73ce1c5fc60 Christophe JAILLET 2025-05-25 @224  static const struct spi_nor_fixups n25q00_fixups = {
53919a968b4364 Tudor Ambarus      2023-11-25  225  	.late_init = st_nor_four_die_late_init,
53919a968b4364 Tudor Ambarus      2023-11-25  226  };
53919a968b4364 Tudor Ambarus      2023-11-25  227  

:::::: The code at line 224 was first introduced by commit
:::::: d8b73ce1c5fc60cff8628d406caf7a5a5cecb1c7 mtd: spi-nor: Constify struct spi_nor_fixups

:::::: TO: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
:::::: CC: Pratyush Yadav <pratyush@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
