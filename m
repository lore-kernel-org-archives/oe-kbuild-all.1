Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0457F44BC87
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 09:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790157510; cv=none; b=ZriC4lXrJaXimy6OJhKy7mSLZ86dLj+G/mF7EC/T1Jn1wukqxkYZpCYz3HmG1pZoP8GbpwV0lcow6VU/YWAf0WrLp3tWQDI6yyGvRDz6buVgb6LjcKGN9yIfJSyI0t1Y4qXDAap0pGkgIhZWTyJ68g7ynRU6cf3Yn159+6qe/Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790157510; c=relaxed/simple;
	bh=G0jzMIReF3ViRvJ0FyC7xbRjxBbxQiaa7co/y9o6o0I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nL0jtAFThB3IAf3E0bCHuAnD7ymZfaBvZRzX8JuHjE8aaBtmY98raw7aPjYQH4fePcQvdKKmUpT6riR4RwKV+EWIu2OxhFcKJmfuSC2nGQmoRWVV+GtNxo7NSJc/MP/A8NS5s3qEmDZH/xeE5IYDFbqn2yy30Yqk55q9oSi1TiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XieR9i2r; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XieR9i2r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790157508; x=1821693508;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G0jzMIReF3ViRvJ0FyC7xbRjxBbxQiaa7co/y9o6o0I=;
  b=XieR9i2rlf1hHWra8QjpFJRUjqLlYWtZkF6JF/DFDQ50o+ywn0MbC7lT
   oE9FGfDDBowRV0sbsZOJOXL2fSWaZ0ekLAadApiIaeTSPBRUkApZb0Bny
   /nzi11QYyz/5y0D48RYNqOIKcUUxMDwXOsh1Mi4JKYlfhyc7B6ImZ15QQ
   LlCWZi5qT/QsSW2phOlDJOWZ7cHx/MPJ9vlrFepqH2p0u26J7Ys97MgMi
   s5fhVJpHKxHPKjY8TC1li1KCvHV7fhe5ZzO0K1QacsQ0oDzu1v3hw4iyI
   AkeZCCmO0s1k6r/A92jIUbfvwo3kou/p4k1Adz9XGAH3fsquTuoaIJ1VB
   g==;
X-CSE-ConnectionGUID: cuSJfeJoRWCHRYdKGO3bnQ==
X-CSE-MsgGUID: F8+plYWIRyiSfJ43oxl0Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="93335839"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="93335839"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 02:58:26 -0700
X-CSE-ConnectionGUID: O5HUOddrQcKgKapQfdzvyQ==
X-CSE-MsgGUID: JMT12nEBQpS1BpLbEKDWwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="4627411"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 23 Sep 2026 02:58:25 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9Jk6-000000000c7-1fX4;
	Wed, 23 Sep 2026 09:58:22 +0000
Date: Wed, 23 Sep 2026 11:58:01 +0200
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dyndbg-bonsai-clean 63/67] kernel/tracepoint.c:770:28:
 warning: left shift count >= width of type
Message-ID: <202609231127.Q6jJhWpY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dyndbg-bonsai-clean
head:   1b386f2c853c6e84025fa93d485e69ba8c1d76f4
commit: 2d32fc9005222d1458283246043d8f704eb28f74 [63/67] kernel/tracepoint: Accelerate kernel tracepoint lookups with Bonsai Tree
config: microblaze-randconfig-r2202-20260923 (https://download.01.org/0day-ci/archive/20260923/202609231127.Q6jJhWpY-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 9.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609231127.Q6jJhWpY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609231127.Q6jJhWpY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/tracepoint.c: In function 'tracepoint_hash':
>> kernel/tracepoint.c:770:28: warning: left shift count >= width of type [-Wshift-count-overflow]
     770 |  return ((unsigned long)h1 << 32) | h2;
         |                            ^~


vim +770 kernel/tracepoint.c

   763	
   764	static unsigned long tracepoint_hash(const char *name)
   765	{
   766		size_t len = strlen(name);
   767		u32 h1 = jhash(name, len, 0xdeadbeef);
   768		u32 h2 = jhash(name, len, 0x9e3779b9);
   769	
 > 770		return ((unsigned long)h1 << 32) | h2;
   771	}
   772	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
