Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D76B2511D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 21:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NZM8TxPR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697317881; x=1728853881;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5QBnLSVsH34xbXF01hkTiLz4AXS8skXzAlKv+fVWXMQ=;
  b=NZM8TxPRCUJ3g40TgmVw53P+fmtffvEs7zv36CYiiYG8RVxIhQEo9/G4
   mM/5zkv9Q1tDmSFcxuM1qPKztsM6XZpgtybgWMF3Ggw39w15EcTdWlYFV
   wpoFUcFhEL5lyn3XuaOljuFWcXNo7Uvkn3TtbU97jkDEYQZXHtWcfBkxf
   jtjoThohltPEdZic5bUUVEkmI7N1YVGxRb3fZDPWfgD3M3eLa6bpsjGza
   YsAZTYT4QiRQACbbstm4AIYwgTiPkBIrvdpHF/u1jP92RbPBhW1ENxLuP
   xbXdBH5T3PhzCi4HXVjqDY5GkUj4MmnX8W4qf2DjvpSS0X7PRoPWATjas
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="382577749"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="382577749"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 14:11:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="731764588"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="731764588"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 14 Oct 2023 14:11:15 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrluj-0006fD-0q;
	Sat, 14 Oct 2023 21:11:13 +0000
Date: Sun, 15 Oct 2023 05:10:18 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_nesting-10132023-yi 34/85]
 checkpatch: ERROR: code indent should use tabs where possible
Message-ID: <202310150545.23JaTygx-lkp@intel.com>
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
commit: 259bd9c87361a218abdeb7eb1fa87c892e1ce7f5 [34/85] iommu/vt-d: Add iotlb flush for nested domain
reproduce: (https://download.01.org/0day-ci/archive/20231015/202310150545.23JaTygx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310150545.23JaTygx-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:CODE_INDENT: code indent should use tabs where possible
#51: FILE: drivers/iommu/intel/nested.c:104:
+^I^I^I^I^I^I        __reserved);$

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
