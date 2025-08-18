Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEACD342CB5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Aug 2025 16:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755535473; cv=none; b=tpRNaHOyW/2hGO3GEgZxxCty/+Mh5/Gj23aZ9KDObXETvoUH70qO385Wh9exWP8+gIv1faZn7i8BNPXZ490PKC3BZmNK/EBYDq+/Nnv+Y3rFMsemk+NhDX7/pkwhulAdTDoXUMtrIgCo+RV0Xvk+Ghe0/vb4IJRXVBUxxyXa/wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755535473; c=relaxed/simple;
	bh=W+yWOa78ur7kDA7cAC6tnGCPDi7CF0UB82ia9uRgOAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EGA1gDJhgJokgkILP0cJXdmPTnQ/SLobp1wrlAPNy67j7UTD9F04S2jLbE34jrAF+rqvFbTgoeHyUyhs6ItElgs7Chq6S0NeRtVddMSr836FwQuiL3tKzekY5fsb0SuLlwOdpam/OPgmn0R/rREYq+0Ig7kt7m2jGqVv7p2BGus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lpzp9iqG; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lpzp9iqG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755535472; x=1787071472;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W+yWOa78ur7kDA7cAC6tnGCPDi7CF0UB82ia9uRgOAQ=;
  b=lpzp9iqGWFtSLJXUBB7xRNJzPhMVgjWPOJsJuiXtQf3ywrOQVLPzXJup
   4C3XKd1v5T5OGcqMcljicF42wmr09j7IY0h9B5J6TOQ+C8PEvJntvlLn3
   1PdXPSgZLUmCrc6GPeqzcbbYcfL1R6we7CCfeO/ssk/a6HgVg8skheF2y
   iCJV7aZNaKGzKMLj2w9YYIm/ZBQsVCoH9Ep/i6Z/1WlKvNN03mAI6UJFn
   sbUiI/VgrHzgd1BmqlachVJezuXIdwmvPzOEBZXSsgu7ldYS7J0XgcDc2
   OotKSD1IWy2526rmXad8EeyX5ZVO3Wk1wEnX5v63zhc7cQCpe0JA9Cuju
   A==;
X-CSE-ConnectionGUID: CV+YmThIRpatBPI70KYcNw==
X-CSE-MsgGUID: tb9BRoN/QTSe09ox0O4LdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="68368060"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="68368060"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 09:44:31 -0700
X-CSE-ConnectionGUID: 5PTAXDPHRoiD+tzbtS9ZQQ==
X-CSE-MsgGUID: 4BO8effSS/icw+s9RhRrhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="172825040"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa004.fm.intel.com with ESMTP; 18 Aug 2025 09:44:30 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uo2yC-00017D-05;
	Mon, 18 Aug 2025 16:44:28 +0000
Date: Mon, 18 Aug 2025 18:43:55 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2687/2687]
 drivers/net/ethernet/linkdata/sxe/base/trace/sxe_trace.c:3: warning: This
 comment starts with '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202508181837.76nFHKea-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi liujie_answer,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   dc90c923fed4944f134644261022885c12631518
commit: dd013ad487534c1838afc2f55efdb5daec15aace [2687/2687] Ethernet: Linkdata: Supports Linkdata ethernet Controllers
config: x86_64-buildonly-randconfig-2002-20250818 (https://download.01.org/0day-ci/archive/20250818/202508181837.76nFHKea-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250818/202508181837.76nFHKea-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508181837.76nFHKea-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/linkdata/sxe/base/trace/sxe_trace.c:3: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Copyright (C), 2020, Linkdata Technologies Co., Ltd.
--
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_ipsec.c:3: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Copyright (C), 2020, Linkdata Technologies Co., Ltd.
--
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_debug.c:3: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Copyright (C), 2020, Linkdata Technologies Co., Ltd.
--
>> drivers/net/ethernet/linkdata/sxe/base/log/sxe_log.c:3: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Copyright (C), 2020, Linkdata Technologies Co., Ltd.
--
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_pci.c:3: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Copyright (C), 2020, Linkdata Technologies Co., Ltd.
--
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_host_cli.c:3: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Copyright (C), 2020, Linkdata Technologies Co., Ltd.
--
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_host_hdc.c:3: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Copyright (C), 2020, Linkdata Technologies Co., Ltd.
--
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_dcb.c:3: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Copyright (C), 2020, Linkdata Technologies Co., Ltd.
--
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_ptp.c:3: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Copyright (C), 2020, Linkdata Technologies Co., Ltd.
--
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_monitor.c:3: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Copyright (C), 2020, Linkdata Technologies Co., Ltd.
--
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_dcb_nl.c:3: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Copyright (C), 2020, Linkdata Technologies Co., Ltd.
..


vim +3 drivers/net/ethernet/linkdata/sxe/base/trace/sxe_trace.c

   > 3	 * Copyright (C), 2020, Linkdata Technologies Co., Ltd.
     4	 *
     5	 * @file: sxe_trace.c
     6	 * @author: Linkdata
     7	 * @date: 2025.02.16
     8	 * @brief:
     9	 * @note:
    10	 */
    11	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
