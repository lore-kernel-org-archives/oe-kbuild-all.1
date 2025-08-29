Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22242A1AA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Aug 2025 19:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756495920; cv=none; b=r+pEzWuMZt/602q6dSAEChVyhjcdfDZfBv9DQ0DBmKgpm50oqO7rHiQp6szdEDJiXCopsKOaIcxsH8Rnntxc/kfkdcwhjGbrHyMTuKGYJQZyg43OtNRUL+HBOhnfzzJ9ETcRJOSwB7ipOjZU0373E0j8m8yoheFxrGi/6+CoCBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756495920; c=relaxed/simple;
	bh=PZlGjZMZflP3rf4kSVe4V44Eq9w3AzlZRIGdtFwszC4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HWsQtLjWojCi4bsa2qKohOZGYKzsPe3K028Et8qzzP4VUtJS+YzvIFxxgT/GJsLmEgW4FlerYwTMJnCYcMehdZ7OUj8r2JcGBdvhnXTFUbkV5NjSLPQA6BNqFJ1bZw18UQJBJN5N3HgadmuLlEKrwCmnuCZOYkHNCh3IX9thcF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P1UTsaBQ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P1UTsaBQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756495918; x=1788031918;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PZlGjZMZflP3rf4kSVe4V44Eq9w3AzlZRIGdtFwszC4=;
  b=P1UTsaBQ/6pIKvTqUa7twooREV6T3hn/fCrbZjLNxgh+f0gGyMihsdiN
   xjUYu+Kka2SfKVb6kEXL4lcnG/X8tiXg37NvODo9Yp4MEFdK7Cx6oNSet
   P/NeEXpWgEVbaQU6B40oAdmExhvESBbzD9C9l3NPpDEbnuKF32wXKZexA
   fEfsw3BNCdTV68ntXZ6Xr4rXHOUBcwFeTwbIa+orMgcNZ/7V1bv+8HXWD
   huNFxG0cDBd5Mm5ZPzcVP++a+Err3uuQyiVjgFLTIhfyCNbL0CjKp3E+A
   jVjEncNyjITSZ3U80yxi1hjHnBL0Pz6eAGofmKDz9K5msoVit6UtqbzY0
   A==;
X-CSE-ConnectionGUID: syRwhMxGRRCWtjWxCEpSHA==
X-CSE-MsgGUID: ZlghaPIaT6iLm0Ma2jPMWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62625045"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62625045"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 12:31:58 -0700
X-CSE-ConnectionGUID: bRETpLOiSU2ygZOLQLvnuw==
X-CSE-MsgGUID: e0XFXcifTryDEueacBs1SQ==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 29 Aug 2025 12:31:57 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1us4p7-000UuV-1K;
	Fri, 29 Aug 2025 19:31:47 +0000
Date: Sat, 30 Aug 2025 03:31:28 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-CWF-perf-core-ANBZ23411 0/26]
 mm/shrinker.c:698: warning: This comment starts with '/**', but isn't a
 kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
Message-ID: <202508300345.gGhx2rwg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-CWF-perf-core-ANBZ23411
head:   ca90878d49ef2c923d72947e387bfafc2c6d1b89
commit: 1e63c23f99e1610c8c483368df6922ec9076d95a [0/26] drm/ttm: introduce pool_shrink_rwsem
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250830/202508300345.gGhx2rwg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250830/202508300345.gGhx2rwg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508300345.gGhx2rwg-lkp@intel.com/

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
