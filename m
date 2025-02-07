Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F5F154439
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Feb 2025 04:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738903087; cv=none; b=QD79WDQ9ghjen/9sIv/lg8z5lyiC/Ob3Z40LbVtYOO1t+THg6PAZgHV2bkf3ouYm3Lu/x8DyGtyhNJH2rUUKEet5Mu/Yk7g+ZX4/e4B7+iVrPPxhBNaiVd3/9gldnF8lRfOZrqFcnCabrEyXSGoF/FSYOfYJALNj90qtpsqok/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738903087; c=relaxed/simple;
	bh=U6xiucWzqctsBu454Y4Z1PpJ+3DukDxePYkSJbHp5Y0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gW/MspHchbuufZZ7oX73swM+zJW8gKm/vnn70Nf+w1FlKvzFHsnYXZA1pvSliK4xFgAfNdrfhpW3jXDY+Ok3UHtQSvUOCOvch3356y1UahiW2SRpHp2Gp7iYn/YEBgpbhTX9P9Ub5S2H5jHqvPhONLLs6XnYvXez+c8s4iqoT9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rym3CefF; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rym3CefF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738903086; x=1770439086;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U6xiucWzqctsBu454Y4Z1PpJ+3DukDxePYkSJbHp5Y0=;
  b=Rym3CefFqH9wXCAzrm6uDyBs3avpMhUpOMf9ac9zgRsG5NKV0za57OsE
   PbhVUteYIXLBk+ka2tCKHylbVeeiBc04aHFLNhrLKM+iFZ7LjIiIzATbo
   TUHPWnUO6XY8eZe0SmzzzdGJyKtTVWBF35bhVi9KiemXGR12W1UJVemSJ
   NhlqrOjIvQJEqG208NfM1VTt4w8T1jH/Fk47QmDy5fPar0jeFWmx1iliT
   +5aVOzIvwM8Dd9Q2GhuHTxDC0G3mhw0gHOc2whGYC/FkWSigYH8Wv2Wnk
   G5q4nlqMq30PTC0lpDVY23T7D7h12DTk8eUqPNO5u76R1XX2M6Ttfmvh/
   A==;
X-CSE-ConnectionGUID: jNxwNSfMTLSwhBE2T8/vFg==
X-CSE-MsgGUID: G+Gq0XOQTP6nAew0m9dbjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39688166"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; 
   d="scan'208";a="39688166"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 20:38:05 -0800
X-CSE-ConnectionGUID: 1YAWksXlSESLmOp5qcpC3Q==
X-CSE-MsgGUID: n48eLB+EQzaaG94CJ8jd8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="116353744"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Feb 2025 20:38:03 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgG7t-000xlY-0G;
	Fri, 07 Feb 2025 04:38:01 +0000
Date: Fri, 7 Feb 2025 12:37:26 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Graf <graf@amazon.com>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:kho/v4 12/13] kernel/kexec_handover.c:261:22: sparse: sparse:
 symbol 'bin_attr_dt_kern' was not declared. Should it be static?
Message-ID: <202502071211.QXBJTXHa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git kho/v4
head:   c46ab1adade1c0ece83ff5ad4c3aa57ea0126275
commit: bebf0e306ff813f1b55728339a32291d64ca1b69 [12/13] x86: Add KHO support
config: x86_64-randconfig-122-20250207 (https://download.01.org/0day-ci/archive/20250207/202502071211.QXBJTXHa-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250207/202502071211.QXBJTXHa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502071211.QXBJTXHa-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/kexec_handover.c:261:22: sparse: sparse: symbol 'bin_attr_dt_kern' was not declared. Should it be static?

vim +/bin_attr_dt_kern +261 kernel/kexec_handover.c

e990233a3a6935 Alexander Graf 2024-01-17  260  
e990233a3a6935 Alexander Graf 2024-01-17 @261  struct bin_attribute bin_attr_dt_kern = __BIN_ATTR(dt, 0400, dt_read, NULL, 0);
e990233a3a6935 Alexander Graf 2024-01-17  262  

:::::: The code at line 261 was first introduced by commit
:::::: e990233a3a6935ac84e61a664404855b89def697 kexec: Add Kexec HandOver (KHO) generation helpers

:::::: TO: Alexander Graf <graf@amazon.com>
:::::: CC: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
