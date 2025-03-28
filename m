Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9421D41C7F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Mar 2025 16:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743177802; cv=none; b=u5M9WwdKwF3f2N99hlp5b9cmg1eyZ7GIClMt4kOLUOFbByGv67N9IOtutd4gw9HRcI0wW5SLoLcReVGYwvHiUF61JK2hIE+Y4vygwYuXyYk7g1+D4y+tn+gKbo0JdF9K4lpDj1jt8TsyuvK/grQD9yXQ6Uk23+iBn1KAu+7Ml64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743177802; c=relaxed/simple;
	bh=wU+/++w8WtnNX+OSE/vtxBn0JHfKuRPEU6iejSnmV5g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LsO1eSBOq+ln31K8nkGFbCCUhsEMqdNRDOnh4mobafXU/P9/rU7j5li9HtO7T/a07gQ4N6iCmmZr5B9Y36N6Xpi/gYwZOyZGbQMFiKh0gRKdGgXBQNCCN7YxdV7srYK1GBQXENAI5g+CegORTn9QB/gLwbcnRW1f2ppTP2YFE0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bg+GCgKW; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bg+GCgKW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743177799; x=1774713799;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wU+/++w8WtnNX+OSE/vtxBn0JHfKuRPEU6iejSnmV5g=;
  b=bg+GCgKWRpxfm7EjHKqF0yCI5IRMy6v6NVfLeOdhdPoUsMSjxjaPC0MU
   aLgHzJWb7TLJDqFBnxbR2w2Degjjv1qkhoY3pxy98gc70NwIfRnuDGn7l
   Dn7JlgPO/RrW5ud/LRIbLA4x4aVQBAOZQg/5C4AV/4PDEjxxsf7HMaXbB
   QOTw85Pd3IG9QldXXbPU74144VdGyuMfab+E4scvu+I/aGdZB+jGOCrMl
   odS7Pzhnb6gg97Dn7sJDKQsxohnuHEOOJlxdgCxKRIaUsOdGjvRyFAMv+
   o64xH1e9iMBynD8dlT4FCqUJezjhuv+CYPe1eCINuaNghb6SU57sxJSGj
   A==;
X-CSE-ConnectionGUID: gA2l3DgcR+Sht97iBykhaA==
X-CSE-MsgGUID: 6v6IoYuCTdGIxaoqgFDNZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="44725158"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="44725158"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 09:03:18 -0700
X-CSE-ConnectionGUID: L3ah0ERnQ4agT27o6pEUAw==
X-CSE-MsgGUID: 43JblK2fQoieCrU/RYpQxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="125377445"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 28 Mar 2025 09:03:18 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyCAt-0007Ys-28;
	Fri, 28 Mar 2025 16:03:15 +0000
Date: Sat, 29 Mar 2025 00:02:37 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1528/1528]
 drivers/crypto/.tmp_qcom-rng.o: warning: objtool: missing symbol for section
 .init.text
Message-ID: <202503282324.X867QbB6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   4d1e247486ffeef035a5a55a97f2659f68177357
commit: c5f5aeef9b55b362ad5a0e04e4b41cd63b208842 [1528/1528] Merge git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux
config: x86_64-buildonly-randconfig-002-20250328 (https://download.01.org/0day-ci/archive/20250328/202503282324.X867QbB6-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250328/202503282324.X867QbB6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503282324.X867QbB6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/.tmp_qcom-rng.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
