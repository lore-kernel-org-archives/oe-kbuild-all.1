Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7687E25DCE9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Apr 2025 12:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744202518; cv=none; b=GgGlYXYCzjD/mqF8Ztp2zegyj/yOzzKvUjgO/oA1m7WOsJF591YG6SNFABnii3cwHD5iayr5kp5HUj1POpYNEf4LEW/dddbwecy1jXWjcZPoZPX4C6kvDxlZ6LUnJez3mLJ7u/4ujeBDBTSgN8VLR48hQcNoDGoa9QOzRR0e6uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744202518; c=relaxed/simple;
	bh=AX12W7qntpDyCc89ae/cDcPAp9QTcfP3sL6IhU+YhEo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n3Gg/kcEJ/7PWbRTxY0/As5N9hRjwPrPzeaOowIZ81epxTsOZa7kDHs5L46HD1q3ukk+THnV0CDVEr7JjYYX0UQezdgFjxfH6Q2DfTmfFRV6+UVRzC8g4Z53GImOLywMnq3B2wBB7Ubzg3Jxm3G2+xAMVwcU/FwBEAPBZJBTXvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I+/Q7d8C; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I+/Q7d8C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744202517; x=1775738517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AX12W7qntpDyCc89ae/cDcPAp9QTcfP3sL6IhU+YhEo=;
  b=I+/Q7d8Cd0Y08oTOwfMCsiLZbSVoQwSQhR4diHD83WgrlJsfQIAKUlCD
   QCoYANZlPmRqxNL3BcQc9gtECqzgvlyuiIjdjK1oUgvyoKcXJkwV3kNvc
   YHJE2/9AQdCfm9ledNUAJe1p1PSK0YZNG7kTDONdhMFpOfX+hnAdt5pTd
   iJeRfw+OYPECHvyiqNMCtLW8zgWa2aTLLMAx5nWjR7ttc+mIA3VfopdDi
   LuN60cXXYZbrv536iO96YTkN2gHmfCVzrySqSdpoCYoXYWn7fpIQ9vnIf
   0wIr8uZJCY0Y1Jjkwhhuc7uhRbdPZWjT7leZZljKBwq3aFl8uS9ofpIPx
   g==;
X-CSE-ConnectionGUID: gn4McNYkRqeunVwyUCkfwQ==
X-CSE-MsgGUID: W6EOnZjOTeuJHKBAxAuBXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45805795"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="45805795"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 05:41:57 -0700
X-CSE-ConnectionGUID: 55GY7gfUT6S3ThiVi0w1Yg==
X-CSE-MsgGUID: 0QlUDtTKQje5LpVc09TK+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="159551404"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 Apr 2025 05:41:54 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2Uka-0008qg-1P;
	Wed, 09 Apr 2025 12:41:52 +0000
Date: Wed, 9 Apr 2025 20:41:18 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [joel-granados:jag/s390_sysctl 1/1] arch/s390/mm/cmm.c:262:1:
 warning: 'static' is not at beginning of declaration
Message-ID: <202504092024.2dXoEnEC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joel.granados/linux.git jag/s390_sysctl
head:   5503b9cfa4bda9b2e79c545295dfd03eda1eb010
commit: 5503b9cfa4bda9b2e79c545295dfd03eda1eb010 [1/1] s390/sysctl: Remove ctl_table entry from cmm_pages_handler
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250409/202504092024.2dXoEnEC-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250409/202504092024.2dXoEnEC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504092024.2dXoEnEC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/s390/mm/cmm.c:262:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
     262 | const static struct ctl_table cmm_pages_ctls[] = {
         | ^~~~~
   arch/s390/mm/cmm.c:349:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
     349 | const static struct ctl_table cmm_table[] = {
         | ^~~~~
>> arch/s390/mm/cmm.c:229:13: warning: 'cmm_get_pages' defined but not used [-Wunused-function]
     229 | static long cmm_get_pages(void)
         |             ^~~~~~~~~~~~~


vim +/static +262 arch/s390/mm/cmm.c

   228	
 > 229	static long cmm_get_pages(void)
   230	{
   231		return cmm_pages;
   232	}
   233	
   234	static void cmm_add_timed_pages(long nr)
   235	{
   236		cmm_timed_pages_target += nr;
   237		cmm_kick_thread();
   238	}
   239	
   240	static long cmm_get_timed_pages(void)
   241	{
   242		return cmm_timed_pages;
   243	}
   244	
   245	static void cmm_set_timeout(long nr, long seconds)
   246	{
   247		cmm_timeout_pages = nr;
   248		cmm_timeout_seconds = seconds;
   249		cmm_set_timer();
   250	}
   251	
   252	static int cmm_skip_blanks(char *cp, char **endp)
   253	{
   254		char *str;
   255	
   256		for (str = cp; *str == ' ' || *str == '\t'; str++)
   257			;
   258		*endp = str;
   259		return str != cp;
   260	}
   261	
 > 262	const static struct ctl_table cmm_pages_ctls[] = {
   263		{
   264			.data		= &cmm_pages,
   265			.maxlen		= sizeof(long),
   266			.procname	= "cmm_pages",
   267		},
   268		{
   269			.data		= &cmm_pages_target,
   270			.maxlen		= sizeof(long),
   271			.procname	= "cmm_pages",
   272		},
   273	};
   274	#define cmm_pages_ctl cmm_pages_ctls[0]
   275	#define cmm_pages_target_ctl cmm_pages_ctls[1]
   276	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
