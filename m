Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B385625B669
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Jul 2025 17:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751562296; cv=none; b=g0uGTRKC539LiDDvSDQBWlXyw4BEBTuzoGPaZhVlJR5juPElKBxlhpu4/kofLikxEKs2jAQLtQxaK79PT3OCpRuC/qJlBMPgm5Fb9vthXl0SdVxyP1kP8NR7JHdD2azCee4otI6N4Zag9tRnTbniaFfIMNdG5x+BDvzuaRv4Pys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751562296; c=relaxed/simple;
	bh=cAIhw7KTUfMUv4LWouXkqcQkRb3ILd4HKaSWKJ6n8l8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MQ51mwULGcZ12MaFiWJvxGuAnYwpMPRiRCsa8mj9ScP3+WVWoZPMxIOuPlD/7GAxK499zwrm+LypQq6VmxjeFw3yXkQgqUsT9Pahyq7ijlHU+c8f7iiQuu1UFN6k3DPl9RwIdKVF5BHVL9KjDifisgtGghqEHbZTl3pVl4Csxps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BYhZV2Kh; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BYhZV2Kh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751562294; x=1783098294;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=cAIhw7KTUfMUv4LWouXkqcQkRb3ILd4HKaSWKJ6n8l8=;
  b=BYhZV2KhKn1zJhr4t52cV+c4+gqYdtmD0qPJ1TVIxbHHtYBZA3d+ttwV
   RsRhjQs8M044UgbVkqtk/aykgGFFFvb18M1NlEnLstvqf/LZMPhHsJOaB
   1b7aSx+BA2ZLK6LC0PYbSnP2adA7ql+MweqvsMyQXFhbfXqSF0wG8Q87P
   SJFKZJ1SnazmKshT7KYNSsxv/Rg9GQbWTnhoc4ZakIywNDIqjQfrMGPHS
   NdGbC0BvQ53BGn3hoOiGWzVUtW0H56hQcNPFCtvPF7a5E9CRGcT8cB39e
   rId5KhQ1mq6tLTTxYt8Urg7JFEbYP0WZUI5KXd8vZbmZahyio35gMA9vL
   w==;
X-CSE-ConnectionGUID: KQZ3GJa2Ssy1Xgbch454uA==
X-CSE-MsgGUID: IJVedGy9SgSbL4WwZZhS1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="76445951"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="76445951"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 10:04:53 -0700
X-CSE-ConnectionGUID: yHmlpqn6RbSp+NGGrHgjmw==
X-CSE-MsgGUID: ScFrfyXTRqan5sEWk4EiVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="153834882"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Jul 2025 10:04:52 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXNMf-0002or-2H;
	Thu, 03 Jul 2025 17:04:49 +0000
Date: Fri, 4 Jul 2025 01:04:46 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 13/13]
 drivers/vfio/pci/vfio_pci.c:14:9: warning: 'pr_fmt' macro redefined
Message-ID: <202507040026.dzG4coxP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Yi,

First bad commit (maybe != root cause):

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   e19c0b65fe0e6ed2dcda7cb2f7c66806af85a6e6
commit: 2eb10dcc633db289e94478ef25856a94154315c2 [13/13] vfio/pci: Use the new device life cycle helpers
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250704/202507040026.dzG4coxP-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507040026.dzG4coxP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507040026.dzG4coxP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/vfio/pci/vfio_pci.c:14:9: warning: 'pr_fmt' macro redefined [-Wmacro-redefined]
      14 | #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
         |         ^
   include/linux/printk.h:301:9: note: previous definition is here
     301 | #define pr_fmt(fmt) fmt
         |         ^
   1 warning generated.


vim +/pr_fmt +14 drivers/vfio/pci/vfio_pci.c

0f00f834ef9ed3c Max Gurtovoy 2021-08-26 @14  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
0f00f834ef9ed3c Max Gurtovoy 2021-08-26  15  

:::::: The code at line 14 was first introduced by commit
:::::: 0f00f834ef9ed3cec92cfb5da7176f15a8d52520 vfio/pci: Split the pci_driver code out of vfio_pci_core.c

:::::: TO: Max Gurtovoy <mgurtovoy@nvidia.com>
:::::: CC: 小龙 <wenqing.ly@alibaba-inc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
