Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91041219FC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 01:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765502279; cv=none; b=bTB9MFdlwN1k5KFanIBUrQ92Vgwj2l998lyS4PaiLPD3uj5SvVlmVcb6DzvP4bhtexQS7NpSYkLHgm4swj06O1yFUgFBLu7Si6SaCoM/41G9YWN88NvH2dNENw16MUIIgg6FUCyhTiB7ru+OAQLgpcs+l8LfMy8Yrrz/bd0bug8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765502279; c=relaxed/simple;
	bh=ovs3L0ibyE/4+huTtEGCfEDJDxC0sJ6YR754XnAxILw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ihViv6bjcUIpBtvBp+LNF76k/NAe3QjGd5fK+TL7XoSrsYZ/QVhXiGsVFle7Y68OMegYyS4f6wdPhXmHoZ/UtSfWF/+56tZeQx5DOvCKSuoOhWWhJ2LM7iQvnoqA2L9d04nq6lWp0hSry0BZ251ND7tkzBmtkmQtpILLETt0ugQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e+rrOox7; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e+rrOox7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765502278; x=1797038278;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ovs3L0ibyE/4+huTtEGCfEDJDxC0sJ6YR754XnAxILw=;
  b=e+rrOox7pHGyk7rSSllKQ7wrWqW6EnTq+WHeGV+r5tHReHOXTb/TRiIw
   rf4hVcfM02/s2B40gH2lQBTEdAxp7Zxq1j7GxXh6abQmfogSYNGr+Jglk
   Qt3ysA9y+VHuz/QQ0RkLiSctN3yWmL6kN+/Ycgx6huQwLaucuLmUafMOT
   piwEVvc7x47bdD0aqncQoE+Wa4viMXvTD+uszx1+JcZMjJhEJBsRvWq1R
   clmJh7tyb1X2YX0oTdMMHPnPHVSgpu2TFsJVKbJ46Fn7Cbe+WTP7swXW+
   gvmXGrm2pBW3IBa5/YitpvYE7n4ZUXfsJbtES+uOtOHBbicdg9UIIpHX5
   Q==;
X-CSE-ConnectionGUID: FtnXd/FoQua6fgqv2zkDBg==
X-CSE-MsgGUID: q0huSgG1QOG903WIRY9YxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67424454"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67424454"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 17:17:56 -0800
X-CSE-ConnectionGUID: aoBCa/C3TfOaac9jQTmdrw==
X-CSE-MsgGUID: sQKxLDHVQFeEObxBIGrQBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="201855896"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 11 Dec 2025 17:17:55 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTrn7-000000001GC-0mfp;
	Fri, 12 Dec 2025 01:17:53 +0000
Date: Fri, 12 Dec 2025 02:17:07 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3534/3534] arch/x86/kernel/early-quirks.c:727:34:
 warning: no previous prototype for 'kh40000_get_direct_dma_ops'
Message-ID: <202512120237.qjU2ttZI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi leoliu-oc,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   5930fa3740c518a9f6ba688fd0c1873d6f3adbce
commit: 11557c1ae4529f133483879b7ee00b7d8c653be7 [3534/3534] x86/cpu/zhaoxin: Encapsulate access to kh40000_dma_direct_ops within function
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251212/202512120237.qjU2ttZI-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512120237.qjU2ttZI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512120237.qjU2ttZI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/early-quirks.c:722:6: warning: no previous prototype for 'is_zhaoxin_kh40000' [-Wmissing-prototypes]
     722 | bool is_zhaoxin_kh40000(void)
         |      ^~~~~~~~~~~~~~~~~~
>> arch/x86/kernel/early-quirks.c:727:34: warning: no previous prototype for 'kh40000_get_direct_dma_ops' [-Wmissing-prototypes]
     727 | __weak const struct dma_map_ops *kh40000_get_direct_dma_ops(void)
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/kh40000_get_direct_dma_ops +727 arch/x86/kernel/early-quirks.c

   726	
 > 727	__weak const struct dma_map_ops *kh40000_get_direct_dma_ops(void)
   728	{
   729		return dma_ops;
   730	}
   731	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
