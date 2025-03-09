Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A5A1B395F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Mar 2025 23:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741563498; cv=none; b=jmV5hWREjIzOFSKJIHG4c4Fh/RIJlcU+HvdVL2vpJnICc2OuXxBkCZlVaCgPo+MLhVlBvK6WUAlb0cgMqsQbn6PU5TNo1baUanacZxKARjo4BbW7wQgaHHGa/l3KegOsH1DzKESfTAoNRO1zZF2S3bPC7p/TJe2179dNjzjT8yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741563498; c=relaxed/simple;
	bh=L1DqMjz4oOUkXc2FbR+KupPrCyOeMlCBsfbqYxh4deY=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HPXZwDyIeH+2x8thya+i9tOSO3MmeeT0uVEqSkgrWrQFwgHGVNZkGsMnH3ZAadrVE5cs6izkiOS/fF9oKjMpThyK/UBTwKkz1PEbAcmDR85NvNGU1w6etvr+TZRTdhJ3GVapXhU2E7Q+o3oBhHd2j/vDLMbMg1TpsdZIOvbx4rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YC4CXG9q; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YC4CXG9q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741563496; x=1773099496;
  h=date:from:cc:subject:message-id:mime-version;
  bh=L1DqMjz4oOUkXc2FbR+KupPrCyOeMlCBsfbqYxh4deY=;
  b=YC4CXG9qqG2lzHnMpL9RSNVhotzhi5f1QMKCOc5H9FuxOuq7HQOvaCGp
   B0wqmmsTnzhRtugpWB2vojOdqoRHutWwqakZDs7M9xgk3qTHngXA//XKi
   kmJk5UhoDtIymkSqH4zopTZAloDF1ZtddFJodqaRrGYwtDlHJzDl8NHpI
   pF8MojuFP6kAjeoykd0TpFqHTVR9RQ9hkdrpSGBb2vvbKyhIdo9pMqrH7
   EQwZHZRC7rUuuaEbGALzFOmqq7OEBNstN9bs1aAEH2upM0f2mf8f/tob4
   eSkDciEEE+2IRWbX4K+sPkzU0gYVEsNbVH/kAM4NJ/NR8UWE0hSKCNOhS
   g==;
X-CSE-ConnectionGUID: gN+0lrk7RLWOnj6wAwlaGw==
X-CSE-MsgGUID: YENyE72rTkGjlmyyqqYNRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="42456051"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="42456051"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 16:38:15 -0700
X-CSE-ConnectionGUID: A26WNoCbRuqmTEWEA1ZXgg==
X-CSE-MsgGUID: C/mDxAhKQNuYtxsSUhTlIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="119998477"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 09 Mar 2025 16:38:15 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trQDk-0003Ye-1w
	for oe-kbuild-all@lists.linux.dev;
	Sun, 09 Mar 2025 23:38:12 +0000
Date: Mon, 10 Mar 2025 07:37:23 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/57 1/1] arch/x86/kernel/fpu/xstate.o: warning:
 objtool: init_xstate_size()+0x433: unreachable instruction
Message-ID: <202503100718.kAqAOo6x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/57
head:   6fe7458ff80d33a5dba8b386c88d33ffd2ccb47d
commit: 653a561bb2fd34e470594eb1bdba3357630e8df7 [1/1] x86/fpu: Move init_xstate_size() to __init section
config: x86_64-buildonly-randconfig-006-20250217 (https://download.01.org/0day-ci/archive/20250310/202503100718.kAqAOo6x-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250310/202503100718.kAqAOo6x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503100718.kAqAOo6x-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/fpu/xstate.o: warning: objtool: init_xstate_size()+0x433: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
