Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEA81CEADB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Apr 2025 05:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744866900; cv=none; b=jqzM4ZDgthpYEDbcUYnkghVhTjpLdoFCmHOPn9UEAoMgJN2YapWEGDpeLl2kt7ESA/QMFnj1SCu2q3JnFbI5YEu70cONYSpOoUnAB63kRSQDquhuH7KWbxKTprGmxgmmC7usPeosZ6jkHE6iKj2GjRzeJYiRT2B0H/37FioHVGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744866900; c=relaxed/simple;
	bh=BydOTYv20MvEN9ws6PoPb69xEggJkV2IzuXLGE+PmXU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=al1KBAW+qu9bRsRPDhw0V8fr5KWfcaR6NOnbIb2OHO3lfnM0qlPu5mtsmlcwGkHHKkw1OTRM+FljgYeH5QhWYsQpp8QdMeu4fLxcsQTSESir3otUYDzok4vnpoSJYc9YR76WWgIP9Rm1uprqxCiO9HiIsUXydMwguJgF7PjdlVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f1fIUFnW; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f1fIUFnW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744866898; x=1776402898;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BydOTYv20MvEN9ws6PoPb69xEggJkV2IzuXLGE+PmXU=;
  b=f1fIUFnWJ7Xr88SkhTNWKk9yHX/vWRoPTEX88xdtFkWZzZ+k1YduDU0Z
   oCeoOoIx0FhKwXbf2W/bFX4k9h1a4PDohLh0eMigJNTTJ633ldRDH32AL
   xxGlyDRlZfuxm5CBx/fsSZtTTZEzZs4TLX/Qm1MzyEuTfb0eVEDR1x5kp
   yAF1kcxz8dZulB0JuImurTBS0eY2QQ8JMA4xIMQMp9KF7enRxkuUJwfJW
   8F9vxkEbzseXIAetM92NEAA6d27BZkei7o65+zTbCyBcQTm5AFprR3eC9
   Fn8CaTZFBD+H1ebgXs74tCdpo1qqvfhPbpeNVTii2+2MpSuKpgCDJFBQq
   g==;
X-CSE-ConnectionGUID: ysUnMdGeSKa3z+cNXNXxlw==
X-CSE-MsgGUID: oZrHVoEeTSOYanGWOXJjFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="68929798"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="68929798"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 22:14:57 -0700
X-CSE-ConnectionGUID: F2v0xJSHSCWR7nPn/ulylw==
X-CSE-MsgGUID: 5nwpRxdrRVaIZirEJl0I3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="161644431"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Apr 2025 22:14:56 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5HaQ-000LJA-0z;
	Thu, 17 Apr 2025 05:14:54 +0000
Date: Thu, 17 Apr 2025 13:14:41 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 123/123] mm/shrinker.c:698: warning:
 This comment starts with '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202504171315.QUzmsq36-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   074661a2e2a9eb4c8a10f52d986487be78c957fc
commit: e2d2402847719df06c937da1df93ecf9c35f515f [123/123] drm/ttm: introduce pool_shrink_rwsem
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250417/202504171315.QUzmsq36-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250417/202504171315.QUzmsq36-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504171315.QUzmsq36-lkp@intel.com/

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
