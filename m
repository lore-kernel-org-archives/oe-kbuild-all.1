Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C228C382F25
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 May 2026 20:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779136746; cv=none; b=tdNxp3ur+Nv2trlP29zr00Uy9HaQArATiDpjkscm4sWLvfXc7UB1pHXB35qggR6a9bzo0W6j6tNb/TiN0pi1LnIm/5YV4xsxyxrbP98BUBvYPkWdkT34lOGqRmO9+TQa5pW2sHlmkyHt0r8AYlyYwpGHNbXxvLtfU3w0pVjWMyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779136746; c=relaxed/simple;
	bh=ei06zPKAuUtua+1Gih2zj3IZ+HSJVpFXXTskHGXAaPQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L4BRvUAtOn/mD1NxtE1tmHlZlSHy9vtthQv7JpLgNl0pPgTA2ET+FL3VDrW2bexRO/OoVo38XGKz93GV6/v4HX6Pk5tMzYYrVX7GUh/PumEOaSLmqAAVQnGWH7DRtOnHLukaCk895sH+ZhqxjZ5xTz3LHm3BdC8EeF9aXFjDDW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h40uYcYp; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h40uYcYp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779136745; x=1810672745;
  h=date:from:to:cc:subject:message-id;
  bh=ei06zPKAuUtua+1Gih2zj3IZ+HSJVpFXXTskHGXAaPQ=;
  b=h40uYcYpYucU54Uw17RrGla5h6NSuS1KYlz05cMF8XvaalVm3rX1ZGDv
   froMQnQ+pHk8Tfm4O9FrrmFSe0dc5LY2/1TxI70OrNbBQ5VNELAWgltES
   GOL7NBWEU2fny9H4H6552rvZOnN+yp5xyHiNmnvXJqkz2YAHAP3+jIzMj
   45SR9Vlr4qNGM/GKxn6XJFW+mt6SKu1hl35nN74o4ITXpfCZGt0Mp9cDk
   26TejDeM7L7qXd6TID3Lq/BjtUmYfwcO1lYyh7hy7QnC/H1evCF3xvvnR
   8D74B7twhrHKomOtMLV0Ojw5CeY8xTto01aguhZE8cCEdRY1MVwzWH7+n
   Q==;
X-CSE-ConnectionGUID: dYQXczSSSwyEKAbr6AQ56Q==
X-CSE-MsgGUID: H9SYOnXGQbWMZNRUE/7rKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="79981706"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="79981706"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 13:39:05 -0700
X-CSE-ConnectionGUID: /hv0SXOXTxO9MqKu3pX+KA==
X-CSE-MsgGUID: L0zO/Q9nQvC+R4oN3xF5Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="235092209"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 18 May 2026 13:39:03 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wP4jt-000000009vp-0IJx;
	Mon, 18 May 2026 20:39:01 +0000
Date: Mon, 18 May 2026 22:38:25 +0200
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rppt:gfp-to-kmalloc/v0.1 22/238]
 drivers/cpufreq/amd-pstate-ut.c:566:23: error: unterminated argument list
 invoking macro "DEFINE_FREE"
Message-ID: <202605182251.nFXXctPt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git gfp-to-kmalloc/v0.1
head:   cf8f69ff9142effba4d8d9a70a1a4f275044376c
commit: 378df8f85b52efc8ab80beabeb3d4a7d8290840c [22/238] cpufreq/amd-pstate-ut: replace __get_free_page() with kmalloc()
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260518/202605182251.nFXXctPt-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260518/202605182251.nFXXctPt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605182251.nFXXctPt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/cpufreq/amd-pstate-ut.c:566:23: error: unterminated argument list invoking macro "DEFINE_FREE"
     566 | MODULE_LICENSE("GPL");
         |                       ^
>> drivers/cpufreq/amd-pstate-ut.c:46:1: error: expected '=', ',', ';', 'asm' or '__attribute__' at end of input
      46 | DEFINE_FREE(cleanup_page, void *, if (_T) kfree((void *)(unsigned long)_T)
         | ^~~~~~~~~~~


vim +/DEFINE_FREE +566 drivers/cpufreq/amd-pstate-ut.c

14eb1c96e3a3fd Meng Li 2022-08-17  563  
14eb1c96e3a3fd Meng Li 2022-08-17  564  MODULE_AUTHOR("Meng Li <li.meng@amd.com>");
14eb1c96e3a3fd Meng Li 2022-08-17  565  MODULE_DESCRIPTION("AMD P-state driver Test module");
14eb1c96e3a3fd Meng Li 2022-08-17 @566  MODULE_LICENSE("GPL");

:::::: The code at line 566 was first introduced by commit
:::::: 14eb1c96e3a3fd9cd377ac9af3c7a410f8bf1015 cpufreq: amd-pstate: Add test module for amd-pstate driver

:::::: TO: Meng Li <li.meng@amd.com>
:::::: CC: Shuah Khan <skhan@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
