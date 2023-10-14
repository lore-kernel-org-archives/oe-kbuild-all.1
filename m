Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A041803B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 19:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W8mXBcjC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697312803; x=1728848803;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i04Iqybrsn7UNOb8RyTbyBhqqH/cfq5Ag1xJdukXDHw=;
  b=W8mXBcjCk201t+1E8/6qCEbezKVJ2IhqnscczlJKe+wczEsQHpBITCoL
   6hc8ehOdYZ8rjEWoPgjrK/wo4Xb7BUEMmDCKASPFOHiwysNl1Ag4yIfOy
   PbYHtLkk5BCTIdY73wLTF3SVFbUxCeFjB1wINLM8ufo2EdOMM3Usx3r9t
   6knpVh6lE7biFWhURdrHlX/oXTH2+6hnqs6hZezSrkVrLUArXP3DFqjF/
   KBME1/RkpwqlWFmseL2GPwsi8MXkLYttZoqN75dgcKJgZZadeVgJGTZqX
   HgQiQWLU5FEffgSs1WMRFHY1WCLGeCLAiVycvWO6LVwxzUniPdp4wceKO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="365608775"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="365608775"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 12:46:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="1002374096"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="1002374096"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 14 Oct 2023 12:46:38 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrkan-0006aF-0k;
	Sat, 14 Oct 2023 19:46:33 +0000
Date: Sun, 15 Oct 2023 03:45:40 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_nesting-10132023-yi 9/85] checkpatch:
 WARNING: Block comments use * on subsequent lines
Message-ID: <202310150300.bK2CJC3W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting-10132023-yi
head:   3f226b487e64cd6f04258236e83eb403526d3d0a
commit: 02f74dacb323f0a6a403ae7b899a04616ee4b245 [9/85] iommu: Add nested domain support
reproduce: (https://download.01.org/0day-ci/archive/20231015/202310150300.bK2CJC3W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310150300.bK2CJC3W-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#44: FILE: include/linux/iommu.h:70:
+#define __IOMMU_DOMAIN_NESTED	(1U << 5)  /* User-managed address space nested
+					      on a stage-2 translation        */

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#44: FILE: include/linux/iommu.h:70:
+					      on a stage-2 translation        */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
