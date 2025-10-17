Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FFC7081E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Oct 2025 02:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760669948; cv=none; b=F+2BMy55bX/C9e9eEvI5X5+ru2XQ9Z/Xd7Ronhp6DlVylcKas77rAVolBp97+Pb+ffZa7VnS2koDfkSzqHYVFpxF2a77D+KRvUz6H7dBgkOwaoxY5iqh/kQWZ5V0KZrgTvzjJLZcO6D2OCGP8EYgWYKPziBSFn5fIEQPYF6EvuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760669948; c=relaxed/simple;
	bh=jAtU/tYqzGgZAiEvj5YjnspMiVRb/pOzXZUnnSQFJjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sqcemWeGu7oDmJuYtJaDhcAJLP8eUILEHiGc5sfoKzNa1SPj50oFPUAvO2txUqzsf3btmgxDWaArd50SF9DkKI3NOjYcQGtAoSZdbETEyrKRA914VXMKGbyhV/GxanV1RzCSIk8+Oj67SemZCaZVxzcnhbKovHVzQvP0ogieVio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VyBrx7tg; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VyBrx7tg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760669947; x=1792205947;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jAtU/tYqzGgZAiEvj5YjnspMiVRb/pOzXZUnnSQFJjQ=;
  b=VyBrx7tgO6G886UIE8n6Ev1BvzDymtQlr3JHGs74l+KlALw2Hy8+lNU6
   A9oOl9BjWQ6faRi5VGm38huB3rqNSs+/FyrC3EbfacK2zO4pYL936TMEs
   nJb9A/by6L+yp8M10x9ipN1NuYdxFGv3VmHHuiCxYf3Gj6Yi95KP8Q46I
   15OZqxWF5HkrYHI1V0qxcaEb5fYp36647spgz07aLF5zaX644xiDb8twV
   egK6Z4Mm+juO1sbpWJu+YvH4ljF4lvpWmUH0pNlRpJMAZgUZ28cECD6iP
   7B1OR93syR6/TeNXxEQIYO2JlYIGTFR50dKlKeaQOYv+h09SgHSCkEcSG
   g==;
X-CSE-ConnectionGUID: Jw5RyHltToSl4q3QHf9Fkw==
X-CSE-MsgGUID: m+4Lois5R6GA+faBcbLdmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="62910874"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="62910874"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 19:59:04 -0700
X-CSE-ConnectionGUID: IC1c1ye3RUevb5K/h/1Yjw==
X-CSE-MsgGUID: Wl1z9l1lRSWptfz6fCTRzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="187017436"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 16 Oct 2025 19:59:03 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9agH-0005TT-05;
	Fri, 17 Oct 2025 02:59:01 +0000
Date: Fri, 17 Oct 2025 10:58:53 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2976/2976] fs/nfs/enfs/pm_ping.c:196:6: warning:
 no previous prototype for function 'enfs_test_reconnect_time'
Message-ID: <202510171010.KAuyBISF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   65461ffb14372269f333f0e18867775c14741e76
commit: 1c9eb515727c21c6c7b8212f40c006d656473bb6 [2976/2976] nfs/enfs: introduce reconnect time KUnit tests
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251017/202510171010.KAuyBISF-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510171010.KAuyBISF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510171010.KAuyBISF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/nfs/enfs/pm_ping.c:196:6: warning: no previous prototype for function 'enfs_test_reconnect_time' [-Wmissing-prototypes]
     196 | bool enfs_test_reconnect_time(void)
         |      ^
   fs/nfs/enfs/pm_ping.c:196:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     196 | bool enfs_test_reconnect_time(void)
         | ^
         | static 
   1 warning generated.


vim +/enfs_test_reconnect_time +196 fs/nfs/enfs/pm_ping.c

   194	
   195	#if IS_ENABLED(CONFIG_ENFS_KUNIT_TEST)
 > 196	bool enfs_test_reconnect_time(void)
   197	{
   198		bool ret = true;
   199		bool match;
   200		s64 begin_ms = ktime_to_ms(ktime_get());
   201		s64 ms;
   202		unsigned int cookie = 1;
   203		struct enfs_reconnect_time time = {
   204			.head = 0,
   205			.tail = 0,
   206			.xprt_cookie = 0,
   207		};
   208	
   209		enfs_log_info("begin time: %lld ms\n", begin_ms);
   210	
   211		ms = begin_ms;
   212		enfs_log_info("%lld ms, cookie:%d\n", ms, cookie);
   213		enfs_update_reconnect_time(&time, ms, cookie);
   214		match = enfs_is_time_buf_empty(&time);
   215		if (!match)
   216			return false;
   217	
   218		ms = begin_ms + 1000;
   219		cookie += 1;
   220		enfs_log_info("%lld ms, cookie:%d\n", ms, cookie);
   221		enfs_update_reconnect_time(&time, ms, cookie);
   222		match = time.head == 1 && time.tail == 0;
   223		if (!match)
   224			return false;
   225	
   226		ms = begin_ms + 2000;
   227		cookie += 1;
   228		enfs_log_info("%lld ms, cookie:%d\n", ms, cookie);
   229		enfs_update_reconnect_time(&time, ms, cookie);
   230		match = time.head == 2 && time.tail == 0;
   231		if (!match)
   232			return false;
   233	
   234		ms = begin_ms + 3000;
   235		cookie += 1;
   236		enfs_log_info("%lld ms, cookie:%d\n", ms, cookie);
   237		enfs_update_reconnect_time(&time, ms, cookie);
   238		match = time.head == 3 && time.tail == 0;
   239		if (!match)
   240			return false;
   241	
   242		ms = begin_ms + 4000;
   243		cookie += 1;
   244		enfs_log_info("%lld ms, cookie:%d\n", ms, cookie);
   245		enfs_update_reconnect_time(&time, ms, cookie);
   246		match = time.head == 0 && time.tail == 1;
   247		if (!match)
   248			return false;
   249		match = enfs_is_time_buf_full(&time);
   250		if (!match)
   251			return false;
   252	
   253		ms = begin_ms + 5000;
   254		/* cookie remains unchanged */
   255		enfs_log_info("%lld ms, cookie:%d\n", ms, cookie);
   256		enfs_update_reconnect_time(&time, ms, cookie);
   257		match = time.head == 0 && time.tail == 1;
   258		if (!match)
   259			return false;
   260	
   261		ms = begin_ms + 5000 + ENFS_UNSTABLE_STATE_TIMEOUT * 1000 + 1;
   262		cookie += 1;
   263		enfs_log_info("%lld ms, cookie:%d\n", ms, cookie);
   264		enfs_update_reconnect_time(&time, ms, cookie);
   265		match = time.head == 1 && time.tail == 0;
   266		if (!match)
   267			return false;
   268	
   269		return ret;
   270	}
   271	#endif
   272	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
