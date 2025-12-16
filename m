Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E4A27F00A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 13:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765890556; cv=none; b=dUNz0DMKOu28gshy6ApJd1mcI/gItKPuFqT6E/rXQYZCQ3rb0c6jbZsGyMj8kb0vf1U7FgqKrX3enPIoHCclJ+zdfLnAzfISSiClA4lHZbVbGk/QwwWd8135HB8yv0v/06Emn4QD1Z6m1iqu5n0RIegQiWqXkLIEKhp2zXFHJMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765890556; c=relaxed/simple;
	bh=p6jxjPgp9DuKMyXYI+djF/zbsCa6VzkFuNT5Af2WwGA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EalipZHOzcUpOQPO7n/qxg0KTDsBiAFaSbpszCJ0bBd9pzbXnz67JjjbhvaZlkD9rbIaCtiN1e3cJmaJ2dAoPrUrqzGOcSiOszqGDQKTZu3ip8E5qrR4zwVIBDfztR8Uw47//PJeKvsFJkO9E7CMylxeho0JSqshwUS3x3Y9Ocw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YkUXN0Tf; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YkUXN0Tf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765890555; x=1797426555;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p6jxjPgp9DuKMyXYI+djF/zbsCa6VzkFuNT5Af2WwGA=;
  b=YkUXN0Tfl18K0ehKrUIx9Gix3Lf+TEpjPFTfb3yeXeaoggbCifV0JIIV
   hGOLudNPqxIzaeg1rUHNtxvBouSJ1RY8oFo+UmVBK35jFif1U+MGg12hq
   qkowwW4YDWVALmAtIEclyTQOoivB4Lz6xi5RrZRIDeLr2xO9eFMqfnBnN
   wmreGe9g69PMeO6e1II32qe1v+BsC8sb1pnS5gM+++t0E5bjYF8GbT92j
   8KxVsHpDUg6oGNq6deRbAb4iU3Eg4S6g+4BMgCKmU98llfEEUpM7mQqlk
   qVYfnDlu32K+5E9I1gsZuiJP/VaXDV2c287P23rUQAJobBhsBo30iCClx
   Q==;
X-CSE-ConnectionGUID: rXzTO1whTayZF/cMkQRLSA==
X-CSE-MsgGUID: OJlvtiVKSYmn7hl/KLQaOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="70385490"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="70385490"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 05:09:14 -0800
X-CSE-ConnectionGUID: v2EtymhHRg6KsznsORk98w==
X-CSE-MsgGUID: 91hHinuIR4KOCjg7KnXm5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="197108924"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 16 Dec 2025 05:09:12 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVUnD-000000003CA-3mxo;
	Tue, 16 Dec 2025 13:08:50 +0000
Date: Tue, 16 Dec 2025 21:07:32 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-CWF-RDT-ANBZ24559 25/25]
 drivers/net/ethernet/yunsilicon/xsc/pci/sriov_sysfs.c:911:31: warning:
 'vf_type_ib' defined but not used
Message-ID: <202512162111.3YrVtMLz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-CWF-RDT-ANBZ24559
head:   48fa9d861c1eb99e9f682fb2623142fb456aa0eb
commit: a1abb643c0827740db9ea0cfa72b902c41f80ac7 [25/25] anolis: drivers: update Yunsilicon drivers to version 2412GA
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20251216/202512162111.3YrVtMLz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512162111.3YrVtMLz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512162111.3YrVtMLz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/yunsilicon/xsc/pci/sriov_sysfs.c:911:31: warning: 'vf_type_ib' defined but not used [-Wunused-const-variable=]
     911 | static const struct kobj_type vf_type_ib = {
         |                               ^~~~~~~~~~


vim +/vf_type_ib +911 drivers/net/ethernet/yunsilicon/xsc/pci/sriov_sysfs.c

010d87517fe5ef Liqiang 2025-01-21  910  
010d87517fe5ef Liqiang 2025-01-21 @911  static const struct kobj_type vf_type_ib = {
010d87517fe5ef Liqiang 2025-01-21  912  	.sysfs_ops     = &vf_sysfs_ops,
010d87517fe5ef Liqiang 2025-01-21  913  	.default_groups = vf_ib_groups,
010d87517fe5ef Liqiang 2025-01-21  914  };
010d87517fe5ef Liqiang 2025-01-21  915  

:::::: The code at line 911 was first introduced by commit
:::::: 010d87517fe5ef837b847f17db54328aee3b6e07 anolis: drivers: support for xsc drivers from Yunsilicon Technology

:::::: TO: Liqiang <liq@yunsilicon.com>
:::::: CC: winterddd <tianruidong@linux.alibaba.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
