Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527A3284B25
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Feb 2026 09:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771235317; cv=none; b=u5MEtj771qtAXV2sGmIkc189VsfQ9wiBKH+k4Ks/1LE3NM5+JaLI0aU4abxbsV6bsylHu5m6e67pKCOJFBU6EwpbDMVUIeYoiPL8mNWHGUjsJBN5B28zAIkse7Pg5R8Ek7z7sKVzdRoEX+bAf7jkOgEOFT+7rr8+74tFidcWcL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771235317; c=relaxed/simple;
	bh=umeA9D+yfQsjoWfS9RZXtonwYOhRFq2mYqybZO1a9Cg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fgLtbwzpPT9NoMtvrcdgEKAalLcwUPvLQ6AWcYv1oXmwsR1Vo4IOHZZkMxaThrnmQ4OrFlNnX/rx8/Sq+NPE+TmNhJ+z1rqOLoRbD/chY8pxDzKpSaxngiV/d4q6LhRMxv1YPSZQfAimwobFZFeqUikSy46AGcfDY5N2HYVFbzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XXR2dVtG; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XXR2dVtG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771235315; x=1802771315;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=umeA9D+yfQsjoWfS9RZXtonwYOhRFq2mYqybZO1a9Cg=;
  b=XXR2dVtGtiVo9zfODIvZmDhOXFg0pv+Uk0DSw1LxTXkQ8hLlgWg4DMKL
   W9Jarq8z5QF91iq3x4FzsA/nanzxpPEFPs5rCXcV5C4KHdVkuUw1k5pEi
   KdB36TzOsfBHrVI44vSncjI5yRqMSLFqjLPONBVftA749UEfFZtInZIcy
   aFRK+2NAV6ZKB4c1dF0hdf4N9/KnFajS1dg/No10vbW7nqA14LtdKlv8Q
   U1ZRlVlxvXCPSbnxGf2M7P3TZhGVgUqMd+4FKy508d7Z186TmCptMk7OT
   e1rlTMMQdQnZ/k4mcqe6HqULKY9mZ7+u0jjQsMA/ad2Ub6TqsImmJHvgo
   Q==;
X-CSE-ConnectionGUID: 1RG76mv2QBOua7XPSZL1QQ==
X-CSE-MsgGUID: DS6+YF7vTWy8j1OdJStQgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="72205268"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="72205268"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 01:48:34 -0800
X-CSE-ConnectionGUID: VzRJtXybTViApNsPqFw9pQ==
X-CSE-MsgGUID: GmxyLCdtSlKM1H8Cxuunhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="244133004"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Feb 2026 01:48:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrvDS-00000000zYq-0XAZ;
	Mon, 16 Feb 2026 09:48:30 +0000
Date: Mon, 16 Feb 2026 17:47:50 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Hellstr=C3=B6m"?= <thomas.hellstrom@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Matthew Auld <matthew.auld@intel.com>
Subject: Warning: drivers/gpu/drm/drm_gpusvm.c:1229 expecting
 prototype for drm_gpusvm_range_pages_valid_unlocked(). Prototype was for
 drm_gpusvm_pages_valid_unlocked() instead
Message-ID: <202602161719.1cVBVN8c-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hi Thomas,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0f2acd3148e0ef42bdacbd477f90e8533f96b2ac
commit: bdcdf968be314b6fc8835b99fb4519e7619671e6 drm, drm/xe: Fix xe userptr in the absence of CONFIG_DEVICE_PRIVATE
date:   4 weeks ago
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260216/202602161719.1cVBVN8c-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260216/202602161719.1cVBVN8c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602161719.1cVBVN8c-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/gpu/drm/drm_gpusvm.c:1229 function parameter 'svm_pages' not described in 'drm_gpusvm_pages_valid_unlocked'
>> Warning: drivers/gpu/drm/drm_gpusvm.c:1229 expecting prototype for drm_gpusvm_range_pages_valid_unlocked(). Prototype was for drm_gpusvm_pages_valid_unlocked() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
