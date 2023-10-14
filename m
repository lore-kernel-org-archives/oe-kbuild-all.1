Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCF51106
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 03:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oha9MBPb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697253706; x=1728789706;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7+vmUD/i6QaLX3PAz+b/gN8AWhCdrdfs8lo2a2DW4Uw=;
  b=Oha9MBPb1KxleJpK1i1Yq2vnf58WiNbEKW+4xV+BhvUN+zmrw0sTBRko
   Zt7GFw8E4JEqnuoR1jTc7xu0Sec4NZ6MFvmGgGvZ1zVY/Uq6mOAkExln2
   s/ELvP4Ca8iYX+x4dQy2TxY4OsyZKmAG2WqGYFgoIv0Powdu0VV7QOPVX
   nbF/fCH/vB9uDMtZMTCfVc0nuntOXmyHDtKRU6ANTJkjFbsWUZQmnyXel
   AUnEozDXKrN49wt58yNqhgShDZMIkbTJceRty+qW3WTlVkkcSRrLYAABO
   qYTulKBwKr/nTry9XSvh6wf7aUuXEJFV0eCBzZ0Hk5RgeAVUtqYf7OYeY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="449487934"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="449487934"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 20:21:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="754931674"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="754931674"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 13 Oct 2023 20:21:44 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrVDi-0005ep-0q;
	Sat, 14 Oct 2023 03:21:42 +0000
Date: Sat, 14 Oct 2023 11:21:35 +0800
From: kernel test robot <lkp@intel.com>
To: Lang Yu <Lang.Yu@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [agd5f:drm-next-6.7 40/644] checkpatch: WARNING: Missing or
 malformed SPDX-License-Identifier tag in line 1
Message-ID: <202310141129.VhDdQZeX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next-6.7
head:   cd90511557fdfb394bb4ac4c3b539b007383914c
commit: bfb1ee945140d04ca96db505d2ffcedbc7f49eed [40/644] drm/amdgpu: add gc headers for gc 11.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231014/202310141129.VhDdQZeX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310141129.VhDdQZeX-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#25: FILE: drivers/gpu/drm/amd/include/asic_reg/gc/gc_11_5_0_offset.h:1:
+/*

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#10031: FILE: drivers/gpu/drm/amd/include/asic_reg/gc/gc_11_5_0_sh_mask.h:1:
+/*

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
