Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F18414DDD
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jul 2026 15:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783353559; cv=none; b=oQAMzLwA59Vyw9FUMDlce+OaMGFJQDaeyF9Jh8Htqnh6/ILAbUK12s7mJmiry/pjnKkiayItAbCAjRFd9+X6deeZmNEmyuAx15PhEQkFRyeJUpZGVkI7gJfSdVt5nd0svYU9ST+iVWn/g1t9AXOgie654nK0DBh4hLoQm0p4n54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783353559; c=relaxed/simple;
	bh=QVrIZHXSY/o76gqLU3O0aLesQXlYJV6ZFJAYcdkvw3A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XZxM0HE8p93ICHgzxdDalXXRtY3du1ze21zKgmgaPifZ+24KBN04lcUyC9i3slRmDgqGKevZcAdyXZUlS79nQbhVxIXUvgjaJ9ZiKMkeOKEEcodb8PfI/SltMVN4knIP7IZy7jek7tLWB/D/stUnyHrDGjgs/h0OAFQIm3eIC1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KOCPMQAH; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KOCPMQAH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783353557; x=1814889557;
  h=date:from:to:cc:subject:message-id;
  bh=QVrIZHXSY/o76gqLU3O0aLesQXlYJV6ZFJAYcdkvw3A=;
  b=KOCPMQAHF8cq5rBKx2kG9vtnX9ZwNzknrTUrQmEMTZpCNis9ph5+RJMs
   zkJOBgjB+2imrXOvZFWdFpPpxUb50wNO94CFs82dr7YjLMwPb2iJlvQrE
   aBqYUViiaYKH2Csd2ZJOWO7ovTWy4oRgQkYA/q3hAVXBmd4tPdaLrJ/7Y
   T4JKCsl5ROxV4htUSrWDLq9njSvTR2fMFwDnfjbPxDeTEbHfiufKFvGwE
   epYlqCYse9qf3lvXhyhDP9DoUsPdIc71EEGkqCl5NXXLZ1x/V42Xk4YE0
   qiPW23Vne3HX6vBvKchuQGl2ncCHerKkZbWxiHN12eeKcv48qYZZsZJpr
   w==;
X-CSE-ConnectionGUID: GGXpJG13TY2jsAfX1/zFvw==
X-CSE-MsgGUID: gtq0JEvqRuGIcgFbGRQHIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="83860923"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="83860923"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 08:59:16 -0700
X-CSE-ConnectionGUID: sLRsK4GaQj2RGgb93VFmlg==
X-CSE-MsgGUID: Z//VC1dASjqKkN+AJtP2Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="278098689"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 06 Jul 2026 08:59:15 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgliz-00000000EVT-0RtU;
	Mon, 06 Jul 2026 15:59:13 +0000
Date: Mon, 06 Jul 2026 23:58:29 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:xfs-codex-fixes 113/122]
 fs/xfs/scrub/xfarray.c:195:26: warning: implicit truncation from 'int' to a
 one-bit wide bit-field changes value from 1 to -1
Message-ID: <202607062338.HrGCp0pf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfs-codex-fixes
head:   8cb8707b5e700fabc3c6bcd612aa914b4bc54fa4
commit: 198c9235f448f22c5fa53aebf3241bc8df9c9227 [113/122] xfs: don't allow sorting sparse arrays
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260706/202607062338.HrGCp0pf-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2fb2a2269da0e2a3e230beb6cad39ca314db33)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260706/202607062338.HrGCp0pf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607062338.HrGCp0pf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/xfs/scrub/xfarray.c:195:26: warning: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
     195 |                 array->possibly_sparse = 1;
         |                                        ^ ~
   1 warning generated.


vim +/int +195 fs/xfs/scrub/xfarray.c

   171	
   172	/*
   173	 * Store an element in the array.  The element must not be completely zeroed,
   174	 * because those are considered unset sparse elements.
   175	 */
   176	int
   177	xfarray_store(
   178		struct xfarray	*array,
   179		xfarray_idx_t	idx,
   180		const void	*ptr)
   181	{
   182		int		ret;
   183	
   184		if (idx >= array->max_nr)
   185			return -EFBIG;
   186	
   187		ASSERT(!xfarray_element_is_null(array, ptr));
   188	
   189		ret = xfile_store(array->xfile, ptr, array->obj_size,
   190				xfarray_pos(array, idx));
   191		if (ret)
   192			return ret;
   193	
   194		if (idx > array->nr)
 > 195			array->possibly_sparse = 1;
   196		array->nr = max(array->nr, idx + 1);
   197		return 0;
   198	}
   199	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
