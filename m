Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECB631D38F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 12:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765541515; cv=none; b=MEJP4VMwW50pqvj+TCyrSGhZXcH3nBhrz8zl0gVaQtsRvyp/hxPn84NlASQcgaq4ueamKskhsfWCiCVmJOlmc3Xyvx6nd3Tx4yjWa2ORgymy6hWRD0eYEP2tA3Oa5Z2rSK2pAyUAtAfrA1QIR9YhDpGEN0TGh9nV34wa4JUCLuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765541515; c=relaxed/simple;
	bh=UtvAThWyKo8/FTp1i1iGdLAm+MsNs3Dq3+GTQlXpXos=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WGufFE7ArimjV/1La3Jtevm1D8B2pAlJfBdFpV65Rxl7sWBVO08raW0/6LKr3K8W9xjVGkiG/k8GhRIEDhxg+pqIazz8MA2217aJl+fCniI0SbiD4NSe3J4ALxSgnwgZGfsVY+kQifftbAtnSqLE14PRHnvaf+l+2H1+toGd0QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AJkjzL6l; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AJkjzL6l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765541513; x=1797077513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UtvAThWyKo8/FTp1i1iGdLAm+MsNs3Dq3+GTQlXpXos=;
  b=AJkjzL6lBLrwoCMZ8fdoayYxJBM4CUCE9ayFLA6srq0+rAaHGbagMfSq
   VOpOKUhigm9899WpGteqDEhjlVw6MfvTKp7H8yoM7v8ko5hD1N3lwg6Z9
   LDMHGtsQIM0Alf0Er+BAPirxhlMGyNWSnd458ZwFQKLsBPy6xa51eyhLs
   Jiu9iXC1w39fXCigLWiGxut+n83nfpGWdCNGCu2jJdCfNOLVakzHjUKQU
   lABFKYJJAswppqGadOLzbXiQwmUY5RL0jJlbPm/H2t4eKKJBqSQv7TLxb
   SNUDeyydzSu2jH1t9cRDKxvzv5VTSASTrpN02wr5TZbMROw9A464x8zmJ
   g==;
X-CSE-ConnectionGUID: YDBMmrrkQdy3cPrw24fIuQ==
X-CSE-MsgGUID: U97Mn0aQTBuzKVG9zEy3cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67420681"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="67420681"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 04:11:52 -0800
X-CSE-ConnectionGUID: THhlTdySQSavNaboSNdfaQ==
X-CSE-MsgGUID: 9hOstCzMSFSyP0IRkCKNpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="196156072"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Dec 2025 04:11:52 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU1zx-0000000060t-0WUI;
	Fri, 12 Dec 2025 12:11:49 +0000
Date: Fri, 12 Dec 2025 20:11:47 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-CWF-PLR-ANBZ26486 11/11]
 drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_ethtool.c:3: warning: This
 comment starts with '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202512122020.aapC7bQ2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-CWF-PLR-ANBZ26486
head:   691fd54204b78715418b027529c23d3a9eca9456
commit: b6906872ffefea77d8b63f8c6da6b37c7013c2f1 [11/11] anolis: net: bugfix for linkdata driver compilation errors
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20251212/202512122020.aapC7bQ2-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512122020.aapC7bQ2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512122020.aapC7bQ2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_ethtool.c:3: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Copyright (C), 2020, Linkdata Technologies Co., Ltd.


vim +3 drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_ethtool.c

6d3faafa89dee5 liujie_answer 2025-05-13  @3   * Copyright (C), 2020, Linkdata Technologies Co., Ltd.
6d3faafa89dee5 liujie_answer 2025-05-13   4   *
6d3faafa89dee5 liujie_answer 2025-05-13   5   * @file: sxevf_ethtool.c
6d3faafa89dee5 liujie_answer 2025-05-13   6   * @author: Linkdata
6d3faafa89dee5 liujie_answer 2025-05-13   7   * @date: 2025.02.16
6d3faafa89dee5 liujie_answer 2025-05-13   8   * @brief:
6d3faafa89dee5 liujie_answer 2025-05-13   9   * @note:
6d3faafa89dee5 liujie_answer 2025-05-13  10   */
6d3faafa89dee5 liujie_answer 2025-05-13  11  #include "sxe_version.h"
6d3faafa89dee5 liujie_answer 2025-05-13  12  #include "sxevf_ethtool.h"
6d3faafa89dee5 liujie_answer 2025-05-13  13  #include "sxevf_hw.h"
6d3faafa89dee5 liujie_answer 2025-05-13  14  #include "sxe_log.h"
6d3faafa89dee5 liujie_answer 2025-05-13  15  #include "sxevf_tx_proc.h"
6d3faafa89dee5 liujie_answer 2025-05-13  16  #include "sxevf_rx_proc.h"
6d3faafa89dee5 liujie_answer 2025-05-13  17  #include "sxevf_netdev.h"
6d3faafa89dee5 liujie_answer 2025-05-13  18  #include "sxevf_msg.h"
6d3faafa89dee5 liujie_answer 2025-05-13  19  #include "sxevf_irq.h"
6d3faafa89dee5 liujie_answer 2025-05-13  20  #include "sxevf_ring.h"
6d3faafa89dee5 liujie_answer 2025-05-13  21  

:::::: The code at line 3 was first introduced by commit
:::::: 6d3faafa89dee569bd8376840a2f60114538f2a8 anolis: net: supports linkdata ethernet controllers

:::::: TO: liujie_answer <liujie5@linkdatatechnology.com>
:::::: CC: winterddd <tianruidong@linux.alibaba.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
