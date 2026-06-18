Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74C2282F00
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jun 2026 06:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781762906; cv=none; b=b6WJXJQlBlmFSeDOOVpI+e8Pb0OZTi22tT3SuSP4oUSXzF1YuaB5k2eApqZxyJ9e0GBuwZf9GBxEGUI/GdisxidxkLOyzo6X4CrSyTeKzKIJ7KS6/4QIVXRsNzF+jynt3aYMxJ/1W2WqiELXyWDBNmEa7YW5bkgD/fhv/sA4O9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781762906; c=relaxed/simple;
	bh=XYxjmbl5UUOlpBCI52Edv2vuPRO8rUrKISnX0apjAgo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=guBlY25wVyr9ztBfdRKIiewOiF7aKc/s1fUS5ooNj8o7e68jcpscxKluhE9aa/zKq7coDAxFm2VIa2ZmfsebZkd2GJmLcF+g2tmtCOKsuwPZCyfO55Sm1TQvKKWBVqkeTFn7Pt0wNfkPr8/N1KkJSh72Q4rUam5lArZKqEnAHIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bOGswjGa; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bOGswjGa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781762905; x=1813298905;
  h=date:from:to:cc:subject:message-id;
  bh=XYxjmbl5UUOlpBCI52Edv2vuPRO8rUrKISnX0apjAgo=;
  b=bOGswjGaUdUAYe73OIqsK31q+j3ful+6P9tAvL97qXOFPACZ6xHlY+1W
   jvpt0ULxbvXHqk3HPfbTsPoVtItG/ECCf8YAsJg2bg0T3C4zZrpGXuOQH
   t/braoaMWnlf8zc0jyji2RkmnV9cGzTgWIQpY3NfSUAVKbvXStFD5AXj0
   E7vY86Sb839L+FdOv0IQ3rJ94isrApjSA1X7t3p9J/U93d55IlHc+u3Rl
   xxlmALwbUiRN/KXaw1x2fadgM4/GstiymcI87YZU7FACnqlK1s/pQJ2Xl
   va+mSKQ3EFiuQ3u2IEgkd2Gg7/pEvO328F67lyZi68ySLntesbr5HJBSZ
   A==;
X-CSE-ConnectionGUID: It4R2vlXR3mIxictOJlWxA==
X-CSE-MsgGUID: +zputlHXRO+Aq84zie7tzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="82681348"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="82681348"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 23:08:25 -0700
X-CSE-ConnectionGUID: OJFtNuY9Q0yXLu3iqr0VZQ==
X-CSE-MsgGUID: /B8UO14cTq6PTIt9zagW0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="252172599"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Jun 2026 23:08:23 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wa5vI-00000000VHu-3Isz;
	Thu, 18 Jun 2026 06:08:20 +0000
Date: Thu, 18 Jun 2026 14:07:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-06 4/4]
 drivers/block/loop.c:1967:6: warning: no previous prototype for function
 'loop_process_cmd_list'
Message-ID: <202606181318.cQoumhWn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-06
head:   85490001cfe93283299435daf1c5d8552e2602fd
commit: e43346421ebd0b52ea04356fbc7ddeae108a4415 [4/4] ANDROID: loop: export loop_process_cmd_list
config: i386-defconfig (https://download.01.org/0day-ci/archive/20260618/202606181318.cQoumhWn-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260618/202606181318.cQoumhWn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606181318.cQoumhWn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/block/loop.c:1967:6: warning: no previous prototype for function 'loop_process_cmd_list' [-Wmissing-prototypes]
    1967 | void loop_process_cmd_list(struct list_head *cmd_list, struct gendisk *disk)
         |      ^
   drivers/block/loop.c:1967:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1967 | void loop_process_cmd_list(struct list_head *cmd_list, struct gendisk *disk)
         | ^
         | static 
   1 warning generated.


vim +/loop_process_cmd_list +1967 drivers/block/loop.c

  1966	
> 1967	void loop_process_cmd_list(struct list_head *cmd_list, struct gendisk *disk)
  1968	{
  1969		struct loop_device *lo = disk->private_data;
  1970		loop_process_work(NULL, cmd_list, lo);
  1971	}
  1972	EXPORT_SYMBOL_GPL(loop_process_cmd_list);
  1973	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
