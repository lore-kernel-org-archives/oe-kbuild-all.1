Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7D77F9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Oct 2023 00:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KqT3eWrW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696985585; x=1728521585;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SD9Zk18ZUdmr+HEumEawRvvBkq1QuaSz54bqEbK/MOI=;
  b=KqT3eWrWPRPdjt3I41KdLGQmU637lG35kSskGZy4xpguU3xZ/VOFOYfG
   ZqXc3qP+zIcHaUMVJLfkcQf0i7sTbzth5qMiGo6Bn2GuR5U6DkfmpwFqg
   tMtZ2KNlpAKMlgGmak8aLK39bJkI64U1GZ/iS0BVjeU+e7gc2m9xqtmI3
   a9QzLiYdFqGLtIvUA2y5/mdNFHaoTRiEBGDaDxyKZRSAoskY5ThuFwSEE
   qyeyzaVJcIBFDOgmy0hsSYQlgrbKdgXkSmOf3VKIIiIuYkLZm0XKqbcfq
   VDkWG8TKOzFsSHMwLdVqWzO6RgRIrK1YX44XGfo4rsKRpzjdm0Wzv86F2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="451041420"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="451041420"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 17:53:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="877463500"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="877463500"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 10 Oct 2023 17:53:01 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqNT9-0001SG-0b;
	Wed, 11 Oct 2023 00:52:59 +0000
Date: Wed, 11 Oct 2023 08:52:46 +0800
From: kernel test robot <lkp@intel.com>
To: Min-Hua Chen <minhuadotchen@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lwn:docs-mw 18/27] checkpatch: WARNING: Missing or malformed
 SPDX-License-Identifier tag in line 1
Message-ID: <202310110859.tumJoXFl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.lwn.net/linux.git docs-mw
head:   1fae02e7eb99fa8feba18ce444d8ce3546e6010e
commit: c9ad95adc096f25004d4192258863806a68a9bc8 [18/27] docs: sparse: add sparse.rst to toctree
reproduce: (https://download.01.org/0day-ci/archive/20231011/202310110859.tumJoXFl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310110859.tumJoXFl-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#26: FILE: Documentation/translations/zh_TW/dev-tools/index.rst:1:
+.. include:: ../disclaimer-zh_TW.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
