Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267AA2BD033
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Sep 2026 19:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790276420; cv=none; b=SpPU85tnUfQ8Usxq32SAxVQ6y7YpoBzfzybRTqvd6jI4kg3f/OPueuH+R/korgryocz6+h95M5GLEOcjLfG0wI+zw0h5X6PCn+lvzsnwUXJICyq+p2jLSU4IjVOKBfbH0goSSeZmThwEcPxqn6BoQOBqsIYxpovVGxDptuKVX/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790276420; c=relaxed/simple;
	bh=z0Yb2G48C9MzN/auQq5NyV0JIomVUd3AMtrJZ6k3ntA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NzIAkxiZZxctULu6lXqP3IHsw6Pk37yAjotIT5WxN8nV+9owa3jOanrTUZncyseYaAp5jca8W67HtqjN2SqyXacDeHeYYET3hUq0JwhljgMraCdY1Bn/rFhvbnD/SOAuhgmaPP8CSSsWGKvveIqzNF45vksYlijLV+N+JQOxnpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xk90z+2l; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xk90z+2l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790276415; x=1821812415;
  h=date:from:to:cc:subject:message-id;
  bh=z0Yb2G48C9MzN/auQq5NyV0JIomVUd3AMtrJZ6k3ntA=;
  b=Xk90z+2l/+/AjfZv98fyDc7hb1LJXkbvFByicomA5u/aWQGXN1gChf6n
   Mp42tMThrkxlIjCuQf50IUHo70c5Pq2EWve8nSz3KZ8eLBAiOxGSO67WS
   Ol9IeyIsNWUh31d0bb1cJm4v+qcRHQ6nW2/WlxLFesBFJUW/IWX7C7A3E
   ol7nOOAVZPShh5e+pzQOjVhHdSycrk8P5hFJSKAPZEosdyck8H0IpdAm+
   /YP43/mJPb6T+ZRDxvVNPz+9y207Cq67pkqWxMHR+Q5wuT+sxOYr2N8So
   uJwRUZQ40uEqtjgewkGvWcUVMYMEDCgRBBIWTmuPgPxBlOlzHhO+o0HQn
   A==;
X-CSE-ConnectionGUID: GB3CdHbBTlaqdiDqYlHVdQ==
X-CSE-MsgGUID: L/y0dqGAR722E0FvqRJJeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="100397564"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="100397564"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 11:59:53 -0700
X-CSE-ConnectionGUID: D7N2hJiMT3qxt2aZXJWY+A==
X-CSE-MsgGUID: C6Y7UcspQxu4+0h3DlDo9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="312029962"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 24 Sep 2026 11:59:52 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9ofd-00000000JRG-3LNV;
	Thu, 24 Sep 2026 18:59:49 +0000
Date: Fri, 25 Sep 2026 02:58:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2026-03 4/4] mm/gup.c:479:6:
 warning: no previous prototype for
 '_trace_android_vh_mm_customize_longterm_pinnable'
Message-ID: <202609250246.G9nh5RKr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Pengfei,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-2026-03
head:   e0d085458e7433fea7eacc7e0050375b6cce6bd9
commit: 792718bb234ac19db3efdbc3215485e874c41584 [4/4] ANDROID: vendor_hook: Added hook to tune reclaimed huge page
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260925/202609250246.G9nh5RKr-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609250246.G9nh5RKr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609250246.G9nh5RKr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/gup.c:479:6: warning: no previous prototype for '_trace_android_vh_mm_customize_longterm_pinnable' [-Wmissing-prototypes]
     479 | void _trace_android_vh_mm_customize_longterm_pinnable(struct folio *folio,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/_trace_android_vh_mm_customize_longterm_pinnable +479 mm/gup.c

   473	
   474	/*
   475	 * trace_android_vh_mm_customize_longterm_pinnable is called in include/linux/mm.h
   476	 * by including include/trace/hooks/mm.h, which will result to build-err.
   477	 * So we create func: _trace_android_vh_mm_customize_longterm_pinnable.
   478	 */
 > 479	void _trace_android_vh_mm_customize_longterm_pinnable(struct folio *folio,
   480			bool *is_longterm_pinnable)
   481	{
   482		trace_android_vh_mm_customize_longterm_pinnable(folio, is_longterm_pinnable);
   483	}
   484	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
