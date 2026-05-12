Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FDC299959
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 May 2026 03:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778555242; cv=none; b=SE+cPTQKFQge5SdIgGu/jw7HkoAkEXSWrPrtr9T8ucA3oGqd22YnOl3sxaLA4zGQbzSoCEUK3wbDLf4CFbMqKpqQ3bnpHAdgwlxiJucLB55qjRF34PO4GYTYNVtT7E7/Pcb/Ly9sRP+8OSfZdlDtGu6GWtKx+HmQokFjRYcH2BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778555242; c=relaxed/simple;
	bh=HR+xCqsJ6R0GvE8lQP8BKIWTgyDgFxgautJAdXZncOI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fsegISO0h6sfT0yAf2v1kG2y510GxCbW5P8tz5fIydBRDE0F1tMuZA37/UpeZpc+kHx8pMi+5l4luxJRedBGTT6IDP8JrFZdbe0jbC9Nrj2kOO07DlyJdLfBWIAAvFHIbyeXgjuDs3m/YKv6UOFhPHDkzeozkWQITgh+xP+JRfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RJ2OZUHZ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RJ2OZUHZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778555241; x=1810091241;
  h=date:from:to:cc:subject:message-id;
  bh=HR+xCqsJ6R0GvE8lQP8BKIWTgyDgFxgautJAdXZncOI=;
  b=RJ2OZUHZp74vWiBXXWnHT7MrbwJmFeah1uHRsJmpWlB9orPR9/qxa9BR
   +lS4jqIX3tinmMiz38q42hKFtI/MCqqcexFcaZ6iZzVJYLuHPvQFBXcNP
   MCapYCUmuVQocmeq+kvT4BWKQkFe0rkILQXoau4OGTUxxbrtKzRoQCtll
   UwhcwfewNgX7J5Q0JtwgJUuapnHyCelyGWgYDLxPHPuXqMAMt8HIhRCGV
   8mWdjtNfAO22KIVaL6wYMmX2uzLh8nY24+nIPuRELumxwO9085MpZXOCc
   vixp9nw3YeoIyg1KXqEAnxLU7jG6W8CHTPL1+RYH8sdicAy8brrB4ppT9
   Q==;
X-CSE-ConnectionGUID: CR+JvIz8SBa3922hVkIW6g==
X-CSE-MsgGUID: tJKInyOuSWa4N4zgp+uH3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="66982193"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="66982193"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 20:07:20 -0700
X-CSE-ConnectionGUID: e8ViotVXTOC51p2yjTfdlg==
X-CSE-MsgGUID: PkEeU85OTteD4f6O+/CaCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="241987790"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 11 May 2026 20:07:19 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMdSn-0000000088n-0K1m;
	Tue, 12 May 2026 03:07:17 +0000
Date: Tue, 12 May 2026 05:06:31 +0200
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [glemco:staging_rv_tests 11/14] Warning:
 kernel/trace/rv/rv_monitors_test.c:61 function parameter 'suite' not
 described in 'rv_set_testing'
Message-ID: <202605120517.h9PDqTYN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Gabriele,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gmonaco/linux.git staging_rv_tests
head:   2c56034debf1af6ff1539eaf2f3eb6eaf7316944
commit: b900de5c4f82af8039a5a292c0d2a0a70bb97938 [11/14] rv: Add KUnit tests for some DA/HA monitors
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20260512/202605120517.h9PDqTYN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605120517.h9PDqTYN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605120517.h9PDqTYN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/trace/rv/rv_monitors_test.c:61 function parameter 'suite' not described in 'rv_set_testing'
>> Warning: kernel/trace/rv/rv_monitors_test.c:80 function parameter 'suite' not described in 'rv_clear_testing'
>> Warning: kernel/trace/rv/rv_monitors_test.c:61 function parameter 'suite' not described in 'rv_set_testing'
>> Warning: kernel/trace/rv/rv_monitors_test.c:80 function parameter 'suite' not described in 'rv_clear_testing'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
