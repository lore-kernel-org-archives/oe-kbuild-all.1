Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477183264CC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jun 2026 22:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781477940; cv=none; b=T4W+gV37JO2YdpyVGS6WwBpzfTRBw1ZDDq4N2/4sGRmpdIcKtvBEe1o4EhcdmLQ4NCvxsrHimZX5P+VFk0O3lhb1NGcyVKx4abMWgadlI6yJ+7zUlWmEHk1J9JZmyedq/4VsqncpiMdT1qnCSk6XdUeah9CX5A9zhpuel3sYmDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781477940; c=relaxed/simple;
	bh=+Vpy3x/w+K6aN667cbgRFnnDy7xdKjjoRN3GDL6Z/00=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RbW9DBOTLE8NYHgd7O+Nl/sg3B1MsyexZIQ46bCk6E854np/qt/F55DDRhmUUbSC04gLb26JCyfaih3Cz2VWy6uDkviBbj5ibNghukobNMjVuQo/vgQYvaygTj8arCuYJUYSLo9lNdrotjC9/PLuKOkF3z9UE4xX0sKzXbXeYVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WpWHSl/t; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WpWHSl/t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781477937; x=1813013937;
  h=date:from:to:cc:subject:message-id;
  bh=+Vpy3x/w+K6aN667cbgRFnnDy7xdKjjoRN3GDL6Z/00=;
  b=WpWHSl/tMwdOJNEp5su/99pH8qOB49w54fuVsP6yjxb6gDRO1uGBLrJ8
   avFLEYFijHjFoKwwj/JhDam86Epu7A2zl0I80zkkf7eMWPHieCn1evMdD
   YqWaXA3trSrRyZyVwmGjV/ofrEstnWYcUinCeKsltHG50+yk0Xa51xQWI
   DVR8v+d04rX5QzgQmPDQfH+RnaVB8aZ/lEwb93x4kcJTnkaWyaLD29o8L
   5xmY2SCIGiYxO1j1+bn5M+KSCV5WL77vPczXhbCIZkcJ9Ak8JkajSz+cu
   LuDQhN5Y+5uiMwQ+SCMmvW7NNpIEiWVlqI2ltfRoUMOsOxCgqsq+jno0G
   A==;
X-CSE-ConnectionGUID: UOrPB0hfRva22nE4LlRhhA==
X-CSE-MsgGUID: spPG1geiQcSXB7U1O4KRsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="93606158"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="93606158"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 15:58:56 -0700
X-CSE-ConnectionGUID: JAEHwqKmSNmer1GoyFpMwA==
X-CSE-MsgGUID: Yb5BEWlyRH6XJOflEFdQcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="247342009"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Jun 2026 15:58:54 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYtn1-00000000RGe-3E6m;
	Sun, 14 Jun 2026 22:58:51 +0000
Date: Mon, 15 Jun 2026 06:58:18 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrii Nakryiko <andrii@kernel.org>,
 "Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: kernel/trace/ftrace.c:6357:25: sparse: sparse: incorrect
 type in assignment (different address spaces)
Message-ID: <202606150616.lbd51JvK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8cd9520d35a6c38db6567e97dd93b1f11f185dc6
commit: 05dc5e9c1fe156fd9dddc4c2f81e8fc6c7e50eb5 ftrace: Add update_ftrace_direct_add function
date:   5 months ago
config: arm64-randconfig-r123-20260614 (https://download.01.org/0day-ci/archive/20260615/202606150616.lbd51JvK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260615/202606150616.lbd51JvK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 05dc5e9c1fe1 ("ftrace: Add update_ftrace_direct_add function")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606150616.lbd51JvK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/trace/ftrace.c:3578:46: sparse:     got struct ftrace_hash *[addressable] notrace_hash
   kernel/trace/ftrace.c:3583:53: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash *save_filter_hash @@
   kernel/trace/ftrace.c:3583:53: sparse:     expected struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:3583:53: sparse:     got struct ftrace_hash *save_filter_hash
   kernel/trace/ftrace.c:3584:54: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *notrace_hash @@     got struct ftrace_hash *save_notrace_hash @@
   kernel/trace/ftrace.c:3584:54: sparse:     expected struct ftrace_hash [noderef] __rcu *notrace_hash
   kernel/trace/ftrace.c:3584:54: sparse:     got struct ftrace_hash *save_notrace_hash
   kernel/trace/ftrace.c:3631:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3631:31: sparse:     expected struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:3631:31: sparse:     got struct ftrace_hash *
   kernel/trace/ftrace.c:3632:32: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *notrace_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3632:32: sparse:     expected struct ftrace_hash [noderef] __rcu *notrace_hash
   kernel/trace/ftrace.c:3632:32: sparse:     got struct ftrace_hash *
   kernel/trace/ftrace.c:3647:59: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *[addressable] filter_hash @@
   kernel/trace/ftrace.c:3647:59: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:3647:59: sparse:     got struct ftrace_hash [noderef] __rcu *[addressable] filter_hash
   kernel/trace/ftrace.c:3648:59: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *[addressable] notrace_hash @@
   kernel/trace/ftrace.c:3648:59: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:3648:59: sparse:     got struct ftrace_hash [noderef] __rcu *[addressable] notrace_hash
   kernel/trace/ftrace.c:3653:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *[addressable] filter_hash @@
   kernel/trace/ftrace.c:3653:43: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:3653:43: sparse:     got struct ftrace_hash [noderef] __rcu *[addressable] filter_hash
   kernel/trace/ftrace.c:3654:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *[addressable] notrace_hash @@
   kernel/trace/ftrace.c:3654:43: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:3654:43: sparse:     got struct ftrace_hash [noderef] __rcu *[addressable] notrace_hash
   kernel/trace/ftrace.c:3656:39: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *[addressable] filter_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3656:39: sparse:     expected struct ftrace_hash [noderef] __rcu *[addressable] filter_hash
   kernel/trace/ftrace.c:3656:39: sparse:     got struct ftrace_hash *
   kernel/trace/ftrace.c:3657:40: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *[addressable] notrace_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3657:40: sparse:     expected struct ftrace_hash [noderef] __rcu *[addressable] notrace_hash
   kernel/trace/ftrace.c:3657:40: sparse:     got struct ftrace_hash *
   kernel/trace/ftrace.c:3699:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3699:48: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:3699:48: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:3700:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3700:48: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:3700:48: sparse:     got struct ftrace_hash [noderef] __rcu *notrace_hash
   kernel/trace/ftrace.c:3701:45: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3701:45: sparse:     expected struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:3701:45: sparse:     got struct ftrace_hash *
   kernel/trace/ftrace.c:3702:46: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *notrace_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3702:46: sparse:     expected struct ftrace_hash [noderef] __rcu *notrace_hash
   kernel/trace/ftrace.c:3702:46: sparse:     got struct ftrace_hash *
   kernel/trace/ftrace.c:3988:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3988:14: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:3988:14: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:4005:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:4005:22: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:4005:22: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:4694:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:4694:22: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:4694:22: sparse:     got struct ftrace_hash [noderef] __rcu *notrace_hash
   kernel/trace/ftrace.c:4697:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:4697:22: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:4697:22: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:5108:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:5108:27: sparse:     expected struct ftrace_hash **orig_hash
   kernel/trace/ftrace.c:5108:27: sparse:     got struct ftrace_hash [noderef] __rcu **
   kernel/trace/ftrace.c:5110:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:5110:27: sparse:     expected struct ftrace_hash **orig_hash
   kernel/trace/ftrace.c:5110:27: sparse:     got struct ftrace_hash [noderef] __rcu **
   kernel/trace/ftrace.c:5490:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:5490:19: sparse:     expected struct ftrace_hash **orig_hash
   kernel/trace/ftrace.c:5490:19: sparse:     got struct ftrace_hash [noderef] __rcu **
   kernel/trace/ftrace.c:5634:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:5634:19: sparse:     expected struct ftrace_hash **orig_hash
   kernel/trace/ftrace.c:5634:19: sparse:     got struct ftrace_hash [noderef] __rcu **
   kernel/trace/ftrace.c:5640:34: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash *[assigned] old_hash @@
   kernel/trace/ftrace.c:5640:34: sparse:     expected struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:5640:34: sparse:     got struct ftrace_hash *[assigned] old_hash
   kernel/trace/ftrace.c:5905:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:5905:27: sparse:     expected struct ftrace_hash **orig_hash
   kernel/trace/ftrace.c:5905:27: sparse:     got struct ftrace_hash [noderef] __rcu **
   kernel/trace/ftrace.c:5907:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:5907:27: sparse:     expected struct ftrace_hash **orig_hash
   kernel/trace/ftrace.c:5907:27: sparse:     got struct ftrace_hash [noderef] __rcu **
   kernel/trace/ftrace.c:5988:50: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *static [toplevel] direct_functions @@
   kernel/trace/ftrace.c:5988:50: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:5988:50: sparse:     got struct ftrace_hash [noderef] __rcu *static [toplevel] direct_functions
   kernel/trace/ftrace.c:5991:51: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *static [toplevel] direct_functions @@
   kernel/trace/ftrace.c:5991:51: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:5991:51: sparse:     got struct ftrace_hash [noderef] __rcu *static [toplevel] direct_functions
   kernel/trace/ftrace.c:6007:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:6007:50: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:6007:50: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:6051:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:6051:14: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:6051:14: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:6101:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *free_hash @@     got struct ftrace_hash [noderef] __rcu *static [toplevel] direct_functions @@
   kernel/trace/ftrace.c:6101:19: sparse:     expected struct ftrace_hash *free_hash
   kernel/trace/ftrace.c:6101:19: sparse:     got struct ftrace_hash [noderef] __rcu *static [toplevel] direct_functions
   kernel/trace/ftrace.c:6166:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:6166:50: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:6166:50: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:6204:52: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *static [addressable] [assigned] [toplevel] direct_functions @@
   kernel/trace/ftrace.c:6204:52: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:6204:52: sparse:     got struct ftrace_hash [noderef] __rcu *static [addressable] [assigned] [toplevel] direct_functions
   kernel/trace/ftrace.c:6352:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *static [addressable] [assigned] [toplevel] direct_functions @@
   kernel/trace/ftrace.c:6352:48: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:6352:48: sparse:     got struct ftrace_hash [noderef] __rcu *static [addressable] [assigned] [toplevel] direct_functions
>> kernel/trace/ftrace.c:6357:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *old_filter_hash @@     got struct ftrace_hash [noderef] __rcu * @@
   kernel/trace/ftrace.c:6357:25: sparse:     expected struct ftrace_hash *old_filter_hash
   kernel/trace/ftrace.c:6357:25: sparse:     got struct ftrace_hash [noderef] __rcu *
   kernel/trace/ftrace.c:6373:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *a @@     got struct ftrace_hash [noderef] __rcu *static [addressable] [assigned] [toplevel] direct_functions @@
   kernel/trace/ftrace.c:6373:41: sparse:     expected struct ftrace_hash *a
   kernel/trace/ftrace.c:6373:41: sparse:     got struct ftrace_hash [noderef] __rcu *static [addressable] [assigned] [toplevel] direct_functions
   kernel/trace/ftrace.c:6377:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *old_direct_functions @@     got struct ftrace_hash [noderef] __rcu *static [addressable] [assigned] [toplevel] direct_functions @@
   kernel/trace/ftrace.c:6377:30: sparse:     expected struct ftrace_hash *old_direct_functions
   kernel/trace/ftrace.c:6377:30: sparse:     got struct ftrace_hash [noderef] __rcu *static [addressable] [assigned] [toplevel] direct_functions
   kernel/trace/ftrace.c:6384:45: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash *[assigned] new_filter_hash @@
   kernel/trace/ftrace.c:6384:45: sparse:     expected struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:6384:45: sparse:     got struct ftrace_hash *[assigned] new_filter_hash
   kernel/trace/ftrace.c:6389:53: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash *old_filter_hash @@
   kernel/trace/ftrace.c:6389:53: sparse:     expected struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:6389:53: sparse:     got struct ftrace_hash *old_filter_hash
   kernel/trace/ftrace.c:6742:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:6742:35: sparse:     expected struct ftrace_hash **orig_hash
   kernel/trace/ftrace.c:6742:35: sparse:     got struct ftrace_hash [noderef] __rcu **
   kernel/trace/ftrace.c:6750:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:6750:35: sparse:     expected struct ftrace_hash **orig_hash
   kernel/trace/ftrace.c:6750:35: sparse:     got struct ftrace_hash [noderef] __rcu **
   kernel/trace/ftrace.c:7535:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:7535:46: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:7535:46: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:7536:47: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:7536:47: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:7536:47: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:7540:44: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:7540:44: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:7540:44: sparse:     got struct ftrace_hash [noderef] __rcu *notrace_hash
   kernel/trace/ftrace.c:7558:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_ops *ops @@     got struct ftrace_ops [noderef] __rcu *[addressable] [toplevel] ftrace_ops_list @@
   kernel/trace/ftrace.c:7558:18: sparse:     expected struct ftrace_ops *ops
   kernel/trace/ftrace.c:7558:18: sparse:     got struct ftrace_ops [noderef] __rcu *[addressable] [toplevel] ftrace_ops_list
   kernel/trace/ftrace.c:7558:66: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_ops *ops @@     got struct ftrace_ops [noderef] __rcu *next @@
   kernel/trace/ftrace.c:7558:66: sparse:     expected struct ftrace_ops *ops
   kernel/trace/ftrace.c:7558:66: sparse:     got struct ftrace_ops [noderef] __rcu *next
   kernel/trace/ftrace.c:7610:59: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:7610:59: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:7610:59: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:7611:59: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:7611:59: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:7611:59: sparse:     got struct ftrace_hash [noderef] __rcu *notrace_hash
   kernel/trace/ftrace.c:8000:62: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:8000:62: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:8000:62: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:8001:62: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:8001:62: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:8001:62: sparse:     got struct ftrace_hash [noderef] __rcu *notrace_hash
   kernel/trace/ftrace.c:8045:36: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/trace/ftrace.c:8045:36: sparse:    struct ftrace_ops [noderef] __rcu *
   kernel/trace/ftrace.c:8045:36: sparse:    struct ftrace_ops *
   kernel/trace/ftrace.c:8821:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:8821:14: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:8821:14: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:8870:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:8870:14: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:8870:14: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:230:20: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:230:20: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:230:20: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3475:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3475:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3475:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3475:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3475:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3475:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3509:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3509:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3509:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3509:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3509:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3509:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:6069:30: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:6078:21: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:6080:17: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3780:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3780:48: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:3780:48: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:3781:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3781:49: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:3781:49: sparse:     got struct ftrace_hash [noderef] __rcu *notrace_hash

vim +6357 kernel/trace/ftrace.c

  6162	
  6163	static int
  6164	__modify_ftrace_direct(struct ftrace_ops *ops, unsigned long addr)
  6165	{
> 6166		struct ftrace_hash *hash = ops->func_hash->filter_hash;
  6167		struct ftrace_func_entry *entry, *iter;
  6168		static struct ftrace_ops tmp_ops = {
  6169			.func		= ftrace_stub,
  6170			.flags		= FTRACE_OPS_FL_STUB,
  6171		};
  6172		int i, size;
  6173		int err;
  6174	
  6175		lockdep_assert_held_once(&direct_mutex);
  6176	
  6177		/* Enable the tmp_ops to have the same functions as the direct ops */
  6178		ftrace_ops_init(&tmp_ops);
  6179		tmp_ops.func_hash = ops->func_hash;
  6180		tmp_ops.direct_call = addr;
  6181	
  6182		err = register_ftrace_function_nolock(&tmp_ops);
  6183		if (err)
  6184			return err;
  6185	
  6186		/*
  6187		 * Call __ftrace_hash_update_ipmodify() here, so that we can call
  6188		 * ops->ops_func for the ops. This is needed because the above
  6189		 * register_ftrace_function_nolock() worked on tmp_ops.
  6190		 */
  6191		err = __ftrace_hash_update_ipmodify(ops, hash, hash, true);
  6192		if (err)
  6193			goto out;
  6194	
  6195		/*
  6196		 * Now the ftrace_ops_list_func() is called to do the direct callers.
  6197		 * We can safely change the direct functions attached to each entry.
  6198		 */
  6199		mutex_lock(&ftrace_lock);
  6200	
  6201		size = 1 << hash->size_bits;
  6202		for (i = 0; i < size; i++) {
  6203			hlist_for_each_entry(iter, &hash->buckets[i], hlist) {
  6204				entry = __ftrace_lookup_ip(direct_functions, iter->ip);
  6205				if (!entry)
  6206					continue;
  6207				entry->direct = addr;
  6208			}
  6209		}
  6210		/* Prevent store tearing if a trampoline concurrently accesses the value */
  6211		WRITE_ONCE(ops->direct_call, addr);
  6212	
  6213		mutex_unlock(&ftrace_lock);
  6214	
  6215	out:
  6216		/* Removing the tmp_ops will add the updated direct callers to the functions */
  6217		unregister_ftrace_function(&tmp_ops);
  6218	
  6219		return err;
  6220	}
  6221	
  6222	/**
  6223	 * modify_ftrace_direct_nolock - Modify an existing direct 'multi' call
  6224	 * to call something else
  6225	 * @ops: The address of the struct ftrace_ops object
  6226	 * @addr: The address of the new trampoline to call at @ops functions
  6227	 *
  6228	 * This is used to unregister currently registered direct caller and
  6229	 * register new one @addr on functions registered in @ops object.
  6230	 *
  6231	 * Note there's window between ftrace_shutdown and ftrace_startup calls
  6232	 * where there will be no callbacks called.
  6233	 *
  6234	 * Caller should already have direct_mutex locked, so we don't lock
  6235	 * direct_mutex here.
  6236	 *
  6237	 * Returns: zero on success. Non zero on error, which includes:
  6238	 *  -EINVAL - The @ops object was not properly registered.
  6239	 */
  6240	int modify_ftrace_direct_nolock(struct ftrace_ops *ops, unsigned long addr)
  6241	{
  6242		if (check_direct_multi(ops))
  6243			return -EINVAL;
  6244		if (!(ops->flags & FTRACE_OPS_FL_ENABLED))
  6245			return -EINVAL;
  6246	
  6247		return __modify_ftrace_direct(ops, addr);
  6248	}
  6249	EXPORT_SYMBOL_GPL(modify_ftrace_direct_nolock);
  6250	
  6251	/**
  6252	 * modify_ftrace_direct - Modify an existing direct 'multi' call
  6253	 * to call something else
  6254	 * @ops: The address of the struct ftrace_ops object
  6255	 * @addr: The address of the new trampoline to call at @ops functions
  6256	 *
  6257	 * This is used to unregister currently registered direct caller and
  6258	 * register new one @addr on functions registered in @ops object.
  6259	 *
  6260	 * Note there's window between ftrace_shutdown and ftrace_startup calls
  6261	 * where there will be no callbacks called.
  6262	 *
  6263	 * Returns: zero on success. Non zero on error, which includes:
  6264	 *  -EINVAL - The @ops object was not properly registered.
  6265	 */
  6266	int modify_ftrace_direct(struct ftrace_ops *ops, unsigned long addr)
  6267	{
  6268		int err;
  6269	
  6270		if (check_direct_multi(ops))
  6271			return -EINVAL;
  6272		if (!(ops->flags & FTRACE_OPS_FL_ENABLED))
  6273			return -EINVAL;
  6274	
  6275		mutex_lock(&direct_mutex);
  6276		err = __modify_ftrace_direct(ops, addr);
  6277		mutex_unlock(&direct_mutex);
  6278		return err;
  6279	}
  6280	EXPORT_SYMBOL_GPL(modify_ftrace_direct);
  6281	
  6282	static unsigned long hash_count(struct ftrace_hash *hash)
  6283	{
  6284		return hash ? hash->count : 0;
  6285	}
  6286	
  6287	/**
  6288	 * hash_add - adds two struct ftrace_hash and returns the result
  6289	 * @a: struct ftrace_hash object
  6290	 * @b: struct ftrace_hash object
  6291	 *
  6292	 * Returns struct ftrace_hash object on success, NULL on error.
  6293	 */
  6294	static struct ftrace_hash *hash_add(struct ftrace_hash *a, struct ftrace_hash *b)
  6295	{
  6296		struct ftrace_func_entry *entry;
  6297		struct ftrace_hash *add;
  6298		int size;
  6299	
  6300		size = hash_count(a) + hash_count(b);
  6301		if (size > 32)
  6302			size = 32;
  6303	
  6304		add = alloc_and_copy_ftrace_hash(fls(size), a);
  6305		if (!add)
  6306			return NULL;
  6307	
  6308		size = 1 << b->size_bits;
  6309		for (int i = 0; i < size; i++) {
  6310			hlist_for_each_entry(entry, &b->buckets[i], hlist) {
  6311				if (add_ftrace_hash_entry_direct(add, entry->ip, entry->direct) == NULL) {
  6312					free_ftrace_hash(add);
  6313					return NULL;
  6314				}
  6315			}
  6316		}
  6317		return add;
  6318	}
  6319	
  6320	/**
  6321	 * update_ftrace_direct_add - Updates @ops by adding direct
  6322	 * callers provided in @hash
  6323	 * @ops: The address of the struct ftrace_ops object
  6324	 * @hash: The address of the struct ftrace_hash object
  6325	 *
  6326	 * This is used to add custom direct callers (ip -> addr) to @ops,
  6327	 * specified in @hash. The @ops will be either registered or updated.
  6328	 *
  6329	 * Returns: zero on success. Non zero on error, which includes:
  6330	 *  -EINVAL - The @hash is empty
  6331	 */
  6332	int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
  6333	{
  6334		struct ftrace_hash *old_direct_functions = NULL;
  6335		struct ftrace_hash *new_direct_functions;
  6336		struct ftrace_hash *old_filter_hash;
  6337		struct ftrace_hash *new_filter_hash = NULL;
  6338		struct ftrace_func_entry *entry;
  6339		int err = -EINVAL;
  6340		int size;
  6341		bool reg;
  6342	
  6343		if (!hash_count(hash))
  6344			return -EINVAL;
  6345	
  6346		mutex_lock(&direct_mutex);
  6347	
  6348		/* Make sure requested entries are not already registered. */
  6349		size = 1 << hash->size_bits;
  6350		for (int i = 0; i < size; i++) {
  6351			hlist_for_each_entry(entry, &hash->buckets[i], hlist) {
  6352				if (__ftrace_lookup_ip(direct_functions, entry->ip))
  6353					goto out_unlock;
  6354			}
  6355		}
  6356	
> 6357		old_filter_hash = ops->func_hash ? ops->func_hash->filter_hash : NULL;
  6358	
  6359		/* If there's nothing in filter_hash we need to register the ops. */
  6360		reg = hash_count(old_filter_hash) == 0;
  6361		if (reg) {
  6362			if (ops->func || ops->trampoline)
  6363				goto out_unlock;
  6364			if (ops->flags & FTRACE_OPS_FL_ENABLED)
  6365				goto out_unlock;
  6366		}
  6367	
  6368		err = -ENOMEM;
  6369		new_filter_hash = hash_add(old_filter_hash, hash);
  6370		if (!new_filter_hash)
  6371			goto out_unlock;
  6372	
  6373		new_direct_functions = hash_add(direct_functions, hash);
  6374		if (!new_direct_functions)
  6375			goto out_unlock;
  6376	
  6377		old_direct_functions = direct_functions;
  6378		rcu_assign_pointer(direct_functions, new_direct_functions);
  6379	
  6380		if (reg) {
  6381			ops->func = call_direct_funcs;
  6382			ops->flags |= MULTI_FLAGS;
  6383			ops->trampoline = FTRACE_REGS_ADDR;
  6384			ops->local_hash.filter_hash = new_filter_hash;
  6385	
  6386			err = register_ftrace_function_nolock(ops);
  6387			if (err) {
  6388				/* restore old filter on error */
  6389				ops->local_hash.filter_hash = old_filter_hash;
  6390	
  6391				/* cleanup for possible another register call */
  6392				ops->func = NULL;
  6393				ops->trampoline = 0;
  6394			} else {
  6395				new_filter_hash = old_filter_hash;
  6396			}
  6397		} else {
  6398			err = ftrace_update_ops(ops, new_filter_hash, EMPTY_HASH);
  6399			/*
  6400			 * new_filter_hash is dup-ed, so we need to release it anyway,
  6401			 * old_filter_hash either stays on error or is already released
  6402			 */
  6403		}
  6404	
  6405		if (err) {
  6406			/* reset direct_functions and free the new one */
  6407			rcu_assign_pointer(direct_functions, old_direct_functions);
  6408			old_direct_functions = new_direct_functions;
  6409		}
  6410	
  6411	 out_unlock:
  6412		mutex_unlock(&direct_mutex);
  6413	
  6414		if (old_direct_functions && old_direct_functions != EMPTY_HASH)
  6415			call_rcu_tasks(&old_direct_functions->rcu, register_ftrace_direct_cb);
  6416		free_ftrace_hash(new_filter_hash);
  6417	
  6418		return err;
  6419	}
  6420	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
