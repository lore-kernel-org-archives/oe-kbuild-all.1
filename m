Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306E3BA36
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 May 2025 03:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747797792; cv=none; b=RK2M58POeBiDYhvatqLtYyhfyR+i2j+eHW+QRvrmSbEpHv3vrTt6BIO3jHC+N3LQ2UHCwbceZbWNWKMVGAvT6kklPBpCBcHNhoxdOE1xDzlC4tWrxzyYL935tT2opgsGMVD73U2V49wOt5GUdqaDgr3rOMOt06AucgCD9+QNbdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747797792; c=relaxed/simple;
	bh=WGVxwTu6UMyqX/0Xkhv8v690YSiISighHqBWAQGxOyw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VRDd1XSiIs5P6YTTIOD9EcURTLm7rF6hfcQ/RfA2KIha2qqBJAjIaEIWYGlruMHKKMr3SmK3FwEYZqvA1/4iTbW/+5tkNXnPMnDyQQzy5P6Uf9M312cbR35veXBaD5HXFRGzbd0eUwZByxalFg2/D61Mpe8qxT8jZVFH3tK5QWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XJS/EqxB; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XJS/EqxB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747797790; x=1779333790;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WGVxwTu6UMyqX/0Xkhv8v690YSiISighHqBWAQGxOyw=;
  b=XJS/EqxBvwdwbNencgbyaUn5f8IHQwPA7x8anjZqVuM+Nc+T6td2t+Xi
   /LtcwqWHP1WQjPdsKdTnnKEGzwa6rdVyOtQQTagCtRLuFlK+V/TNZotlC
   n/4qBDcsqbY7tyjLbNLlIn1XCeGfW4eJG/8hEzVaA4/cT5EnncS210VvZ
   aRKNxK9f1ERs7eS3bxSGdpvxCL91Bpd4cJ5BcOx7fh8h3sy/l9v+5nXw1
   pfOwVh0L+2e8MIjwQ4TIAQcNm0VbwHUUZBR5oGUjNW0D4TY6S1CqI+FAA
   oGJvEGZnuZg0Fo9BElsxM+Msp5h5SQoDJY4+lUhh9xlLX+hvuJXzQQtAT
   w==;
X-CSE-ConnectionGUID: 4x3m2VVpQmaydTstzzwdPA==
X-CSE-MsgGUID: NqWW0rj5ReigRChh/Nl3EA==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="61157290"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="61157290"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 20:23:10 -0700
X-CSE-ConnectionGUID: 9Qd6mUrSRRKA3AfoT62SaQ==
X-CSE-MsgGUID: p37npX0yRXqBx3lzBQVu+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="144623289"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 May 2025 20:23:09 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHa2s-000NpA-29;
	Wed, 21 May 2025 03:23:06 +0000
Date: Wed, 21 May 2025 11:23:03 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/35] mm/shrinker.c:698: warning: This
 comment starts with '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202505211126.mOOUTVPQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   c30fc59e8f3a43d47f689edb48164b67c6704b07
commit: b3e9f57966dfb560c0430ca84ce86076206ebf4e [0/35] drm/ttm: introduce pool_shrink_rwsem
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250521/202505211126.mOOUTVPQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505211126.mOOUTVPQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505211126.mOOUTVPQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/shrinker.c:698: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Keep synchronize_shrinkers() here only to keep KAPI compatibility,


vim +698 mm/shrinker.c

   695	
   696	
   697	/**
 > 698	 * Keep synchronize_shrinkers() here only to keep KAPI compatibility,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
