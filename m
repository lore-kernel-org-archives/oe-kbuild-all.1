Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB4B1922D4
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Jun 2024 07:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717572180; cv=none; b=bYI8W9DBLDycRzr4wzNEpR/P4aulkmIqY7gJcICfOBZu+v8FNtXiS4Ju2RImj32aX7jxJTFV54CA7tx0zvt+N7zHXWJD1KOJq/S7P7NAO5lMSnZO4hTGlJX3zF/ThzE+TNsxEh7A6jtp+aEvIWOvwXb+drGqfcFS2aSrLkoI3qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717572180; c=relaxed/simple;
	bh=eyZEyN8svUwAlLnyey8+grxti0p3w2c5Ps7kgZ2BAr8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TZ3ztmK29+zuzeAgC198GZPMZFJ3PXcTZi0egHa2n6IlFWGxBkN6GzEK1QCZLASCCgGbEewfImoIWwhyBuMxjuKUCGJsIUVyKIwnx3Rx/8P1Lm7PWHQyq1PbveGmMqpTTbxJ1U3UNLa9gPOEIBwA1dkvTYrfsQllWbohBcStPAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NBTPlAjD; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NBTPlAjD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717572178; x=1749108178;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eyZEyN8svUwAlLnyey8+grxti0p3w2c5Ps7kgZ2BAr8=;
  b=NBTPlAjDX9sm04qzJOsEw6iiu69wr0ZoJ7r2T4B3J4FxLUubVMErAYjP
   Vv35qCx7P8d4tVWR2AbaFfkbJpPpqvdyWPFvvHK058FQyvvenacirD1b0
   86RjMJre3tPXgdUFrPycy+n6ukhpZ5fQZcTxcgZQ67DU0ZPXkW7FjQo5H
   8PWYY/QMeHA8aRPr55SmmZuo3hfdBArCbvdo5bjcaZlyKA6OtuE9cs38Y
   0NeGnsHnTdH+B/QwICAVVRfkC/604A3sok4YMphaqzZfnSOFRIGPRmequ
   dIg6Go6jsufWDktGxf/mc/SG9BEhM8QEmtZvlfIyz+AiP8g2W5jLj2Pzj
   A==;
X-CSE-ConnectionGUID: US5L66cWQK6mC9Y+aTFEkQ==
X-CSE-MsgGUID: 20FTSZOwTTiI+XK9tEdppw==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="31699442"
X-IronPort-AV: E=Sophos;i="6.08,215,1712646000"; 
   d="scan'208";a="31699442"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 00:22:57 -0700
X-CSE-ConnectionGUID: Td8Krel5T+m/yEZ5laJlyQ==
X-CSE-MsgGUID: zO3q0W4ARjGVspQNsGSmYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,215,1712646000"; 
   d="scan'208";a="37429000"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 05 Jun 2024 00:22:54 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEkyy-00011f-0G;
	Wed, 05 Jun 2024 07:22:52 +0000
Date: Wed, 5 Jun 2024 15:22:21 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Subject: [linux-next:master 3310/3594] kernel/trace/ftrace.c:3274:63: sparse:
 sparse: incorrect type in argument 2 (different address spaces)
Message-ID: <202406051521.mroqvR5l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   234cb065ad82915ff8d06ce01e01c3e640b674d2
commit: 5fccc7552ccbc521bad61653ee739b1196b1bc53 [3310/3594] ftrace: Add subops logic to allow one ops to manage many
config: i386-randconfig-r131-20240605 (https://download.01.org/0day-ci/archive/20240605/202406051521.mroqvR5l-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240605/202406051521.mroqvR5l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406051521.mroqvR5l-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/trace/ftrace.c:125:59: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_ops [noderef] __rcu *[addressable] [toplevel] ftrace_ops_list @@     got struct ftrace_ops * @@
   kernel/trace/ftrace.c:125:59: sparse:     expected struct ftrace_ops [noderef] __rcu *[addressable] [toplevel] ftrace_ops_list
   kernel/trace/ftrace.c:125:59: sparse:     got struct ftrace_ops *
   kernel/trace/ftrace.c:232:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_ops *ops @@     got struct ftrace_ops [noderef] __rcu *[addressable] [toplevel] ftrace_ops_list @@
   kernel/trace/ftrace.c:232:49: sparse:     expected struct ftrace_ops *ops
   kernel/trace/ftrace.c:232:49: sparse:     got struct ftrace_ops [noderef] __rcu *[addressable] [toplevel] ftrace_ops_list
   kernel/trace/ftrace.c:313:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_ops [noderef] __rcu * @@     got struct ftrace_ops * @@
   kernel/trace/ftrace.c:313:23: sparse:     expected struct ftrace_ops [noderef] __rcu *
   kernel/trace/ftrace.c:313:23: sparse:     got struct ftrace_ops *
   kernel/trace/ftrace.c:317:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_ops **p @@     got struct ftrace_ops [noderef] __rcu **list @@
   kernel/trace/ftrace.c:317:16: sparse:     expected struct ftrace_ops **p
   kernel/trace/ftrace.c:317:16: sparse:     got struct ftrace_ops [noderef] __rcu **list
   kernel/trace/ftrace.c:317:50: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_ops **p @@     got struct ftrace_ops [noderef] __rcu ** @@
   kernel/trace/ftrace.c:317:50: sparse:     expected struct ftrace_ops **p
   kernel/trace/ftrace.c:317:50: sparse:     got struct ftrace_ops [noderef] __rcu **
   kernel/trace/ftrace.c:324:12: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_ops * @@     got struct ftrace_ops [noderef] __rcu *next @@
   kernel/trace/ftrace.c:324:12: sparse:     expected struct ftrace_ops *
   kernel/trace/ftrace.c:324:12: sparse:     got struct ftrace_ops [noderef] __rcu *next
   kernel/trace/ftrace.c:1068:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *notrace_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:1068:43: sparse:     expected struct ftrace_hash [noderef] __rcu *notrace_hash
   kernel/trace/ftrace.c:1068:43: sparse:     got struct ftrace_hash *
   kernel/trace/ftrace.c:1069:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:1069:43: sparse:     expected struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:1069:43: sparse:     got struct ftrace_hash *
   kernel/trace/ftrace.c:1292:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:1292:40: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:1292:40: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:1293:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:1293:40: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:1293:40: sparse:     got struct ftrace_hash [noderef] __rcu *notrace_hash
   kernel/trace/ftrace.c:2069:54: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash *old_hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:2069:54: sparse:     expected struct ftrace_hash *old_hash
   kernel/trace/ftrace.c:2069:54: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:1474:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/trace/ftrace.c:1474:9: sparse:    struct ftrace_hash [noderef] __rcu *
   kernel/trace/ftrace.c:1474:9: sparse:    struct ftrace_hash *
   kernel/trace/ftrace.c:1490:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:1491:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:1492:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:1493:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:1666:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_ops *ops @@     got struct ftrace_ops [noderef] __rcu *[addressable] [toplevel] ftrace_ops_list @@
   kernel/trace/ftrace.c:1667:43: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_ops *ops @@     got struct ftrace_ops [noderef] __rcu *next @@
   kernel/trace/ftrace.c:1727:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:1728:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *other_hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:1733:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:1734:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *other_hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:2047:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:2058:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:2541:53: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *static [toplevel] direct_functions @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:2552:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *static [toplevel] direct_functions @@
>> kernel/trace/ftrace.c:3274:63: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *new_hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3299:88: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
>> kernel/trace/ftrace.c:3307:77: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct ftrace_hash *new_hash2 @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
>> kernel/trace/ftrace.c:3356:51: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *B @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
>> kernel/trace/ftrace.c:3357:64: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
>> kernel/trace/ftrace.c:3363:52: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *B @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3364:64: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
>> kernel/trace/ftrace.c:3403:45: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash * @@
>> kernel/trace/ftrace.c:3405:46: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *notrace_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3407:48: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3409:49: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *notrace_hash @@     got struct ftrace_hash * @@
>> kernel/trace/ftrace.c:3414:58: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *src @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
>> kernel/trace/ftrace.c:3415:59: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *src @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
>> kernel/trace/ftrace.c:3422:34: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *save_filter_hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
>> kernel/trace/ftrace.c:3423:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *save_notrace_hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
>> kernel/trace/ftrace.c:3425:45: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash *[assigned] filter_hash @@
>> kernel/trace/ftrace.c:3426:46: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *notrace_hash @@     got struct ftrace_hash *[assigned] notrace_hash @@
>> kernel/trace/ftrace.c:3431:53: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash *save_filter_hash @@
>> kernel/trace/ftrace.c:3432:54: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *notrace_hash @@     got struct ftrace_hash *save_notrace_hash @@
   kernel/trace/ftrace.c:3450:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3451:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3456:83: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3459:66: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *new_hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3466:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3467:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
>> kernel/trace/ftrace.c:3478:67: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *new_hash1 @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
>> kernel/trace/ftrace.c:3479:55: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct ftrace_hash *new_hash2 @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3537:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3538:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3539:45: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3540:46: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *notrace_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3781:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3798:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:4446:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:4449:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:4874:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:4876:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:5249:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:5393:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:5399:34: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash *[assigned] old_hash @@
   kernel/trace/ftrace.c:5674:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:5676:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:5749:50: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *static [toplevel] direct_functions @@
   kernel/trace/ftrace.c:5751:51: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *static [toplevel] direct_functions @@
   kernel/trace/ftrace.c:5800:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:5849:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *free_hash @@     got struct ftrace_hash [noderef] __rcu *static [toplevel] direct_functions @@
   kernel/trace/ftrace.c:5889:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:5941:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:5945:52: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *static [addressable] [assigned] [toplevel] direct_functions @@
   kernel/trace/ftrace.c:6240:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *extern [addressable] [toplevel] ftrace_graph_hash @@     got struct ftrace_hash *[assigned] hash @@
   kernel/trace/ftrace.c:6242:43: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *extern [addressable] [toplevel] ftrace_graph_notrace_hash @@     got struct ftrace_hash *[assigned] hash @@
   kernel/trace/ftrace.c:6303:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:6311:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:6379:47: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *[addressable] [toplevel] ftrace_graph_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:6380:55: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *[addressable] [toplevel] ftrace_graph_notrace_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:7057:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:7058:47: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:7062:44: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:7080:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_ops *ops @@     got struct ftrace_ops [noderef] __rcu *[addressable] [toplevel] ftrace_ops_list @@
   kernel/trace/ftrace.c:7080:66: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_ops *ops @@     got struct ftrace_ops [noderef] __rcu *next @@
   kernel/trace/ftrace.c:7132:59: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:7133:59: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:7516:62: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:7517:62: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:7561:36: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/trace/ftrace.c:7561:36: sparse:    struct ftrace_ops [noderef] __rcu *
   kernel/trace/ftrace.c:7561:36: sparse:    struct ftrace_ops *
   kernel/trace/ftrace.c:8337:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:8337:14: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:8337:14: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:8386:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:8386:14: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:8386:14: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:230:20: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:230:20: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:230:20: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3269:52: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3298:54: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3454:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3454:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3470:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3470:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:5818:30: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:5826:21: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:5828:17: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3577:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3577:48: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:3577:48: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:3578:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3578:49: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:3578:49: sparse:     got struct ftrace_hash [noderef] __rcu *notrace_hash

vim +3274 kernel/trace/ftrace.c

  3261	
  3262	/* Return a new hash that has a union of all @ops->filter_hash entries */
  3263	static struct ftrace_hash *append_hashes(struct ftrace_ops *ops)
  3264	{
  3265		struct ftrace_hash *new_hash;
  3266		struct ftrace_ops *subops;
  3267		int ret;
  3268	
  3269		new_hash = alloc_ftrace_hash(ops->func_hash->filter_hash->size_bits);
  3270		if (!new_hash)
  3271			return NULL;
  3272	
  3273		list_for_each_entry(subops, &ops->subop_list, list) {
> 3274			ret = append_hash(&new_hash, subops->func_hash->filter_hash);
  3275			if (ret < 0) {
  3276				free_ftrace_hash(new_hash);
  3277				return NULL;
  3278			}
  3279			/* Nothing more to do if new_hash is empty */
  3280			if (ftrace_hash_empty(new_hash))
  3281				break;
  3282		}
  3283		return new_hash;
  3284	}
  3285	
  3286	/* Make @ops trace evenything except what all its subops do not trace */
  3287	static struct ftrace_hash *intersect_hashes(struct ftrace_ops *ops)
  3288	{
  3289		struct ftrace_hash *new_hash = NULL;
  3290		struct ftrace_ops *subops;
  3291		int size_bits;
  3292		int ret;
  3293	
  3294		list_for_each_entry(subops, &ops->subop_list, list) {
  3295			struct ftrace_hash *next_hash;
  3296	
  3297			if (!new_hash) {
  3298				size_bits = subops->func_hash->notrace_hash->size_bits;
  3299				new_hash = alloc_and_copy_ftrace_hash(size_bits, ops->func_hash->notrace_hash);
  3300				if (!new_hash)
  3301					return NULL;
  3302				continue;
  3303			}
  3304			size_bits = new_hash->size_bits;
  3305			next_hash = new_hash;
  3306			new_hash = alloc_ftrace_hash(size_bits);
> 3307			ret = intersect_hash(&new_hash, next_hash, subops->func_hash->notrace_hash);
  3308			free_ftrace_hash(next_hash);
  3309			if (ret < 0) {
  3310				free_ftrace_hash(new_hash);
  3311				return NULL;
  3312			}
  3313			/* Nothing more to do if new_hash is empty */
  3314			if (ftrace_hash_empty(new_hash))
  3315				break;
  3316		}
  3317		return new_hash;
  3318	}
  3319	
  3320	static bool ops_equal(struct ftrace_hash *A, struct ftrace_hash *B)
  3321	{
  3322		struct ftrace_func_entry *entry;
  3323		int size;
  3324		int i;
  3325	
  3326		if (ftrace_hash_empty(A))
  3327			return ftrace_hash_empty(B);
  3328	
  3329		if (ftrace_hash_empty(B))
  3330			return ftrace_hash_empty(A);
  3331	
  3332		if (A->count != B->count)
  3333			return false;
  3334	
  3335		size = 1 << A->size_bits;
  3336		for (i = 0; i < size; i++) {
  3337			hlist_for_each_entry(entry, &A->buckets[i], hlist) {
  3338				if (!__ftrace_lookup_ip(B, entry->ip))
  3339					return false;
  3340			}
  3341		}
  3342	
  3343		return true;
  3344	}
  3345	
  3346	static int ftrace_hash_move_and_update_ops(struct ftrace_ops *ops,
  3347						   struct ftrace_hash **orig_hash,
  3348						   struct ftrace_hash *hash,
  3349						   int enable);
  3350	
  3351	static int ftrace_update_ops(struct ftrace_ops *ops, struct ftrace_hash *filter_hash,
  3352				     struct ftrace_hash *notrace_hash)
  3353	{
  3354		int ret;
  3355	
> 3356		if (!ops_equal(filter_hash, ops->func_hash->filter_hash)) {
> 3357			ret = ftrace_hash_move_and_update_ops(ops, &ops->func_hash->filter_hash,
  3358							      filter_hash, 1);
  3359			if (ret < 0)
  3360				return ret;
  3361		}
  3362	
> 3363		if (!ops_equal(notrace_hash, ops->func_hash->notrace_hash)) {
> 3364			ret = ftrace_hash_move_and_update_ops(ops, &ops->func_hash->notrace_hash,
  3365							      notrace_hash, 0);
  3366			if (ret < 0)
  3367				return ret;
  3368		}
  3369	
  3370		return 0;
  3371	}
  3372	
  3373	/**
  3374	 * ftrace_startup_subops - enable tracing for subops of an ops
  3375	 * @ops: Manager ops (used to pick all the functions of its subops)
  3376	 * @subops: A new ops to add to @ops
  3377	 * @command: Extra commands to use to enable tracing
  3378	 *
  3379	 * The @ops is a manager @ops that has the filter that includes all the functions
  3380	 * that its list of subops are tracing. Adding a new @subops will add the
  3381	 * functions of @subops to @ops.
  3382	 */
  3383	int ftrace_startup_subops(struct ftrace_ops *ops, struct ftrace_ops *subops, int command)
  3384	{
  3385		struct ftrace_hash *filter_hash;
  3386		struct ftrace_hash *notrace_hash;
  3387		struct ftrace_hash *save_filter_hash;
  3388		struct ftrace_hash *save_notrace_hash;
  3389		int size_bits;
  3390		int ret;
  3391	
  3392		if (unlikely(ftrace_disabled))
  3393			return -ENODEV;
  3394	
  3395		ftrace_ops_init(ops);
  3396		ftrace_ops_init(subops);
  3397	
  3398		if (WARN_ON_ONCE(subops->flags & FTRACE_OPS_FL_ENABLED))
  3399			return -EBUSY;
  3400	
  3401		/* Make everything canonical (Just in case!) */
  3402		if (!ops->func_hash->filter_hash)
> 3403			ops->func_hash->filter_hash = EMPTY_HASH;
  3404		if (!ops->func_hash->notrace_hash)
> 3405			ops->func_hash->notrace_hash = EMPTY_HASH;
  3406		if (!subops->func_hash->filter_hash)
> 3407			subops->func_hash->filter_hash = EMPTY_HASH;
  3408		if (!subops->func_hash->notrace_hash)
  3409			subops->func_hash->notrace_hash = EMPTY_HASH;
  3410	
  3411		/* For the first subops to ops just enable it normally */
  3412		if (list_empty(&ops->subop_list)) {
  3413			/* Just use the subops hashes */
> 3414			filter_hash = copy_hash(subops->func_hash->filter_hash);
> 3415			notrace_hash = copy_hash(subops->func_hash->notrace_hash);
  3416			if (!filter_hash || !notrace_hash) {
  3417				free_ftrace_hash(filter_hash);
  3418				free_ftrace_hash(notrace_hash);
  3419				return -ENOMEM;
  3420			}
  3421	
> 3422			save_filter_hash = ops->func_hash->filter_hash;
> 3423			save_notrace_hash = ops->func_hash->notrace_hash;
  3424	
> 3425			ops->func_hash->filter_hash = filter_hash;
> 3426			ops->func_hash->notrace_hash = notrace_hash;
  3427			list_add(&subops->list, &ops->subop_list);
  3428			ret = ftrace_startup(ops, command);
  3429			if (ret < 0) {
  3430				list_del(&subops->list);
> 3431				ops->func_hash->filter_hash = save_filter_hash;
> 3432				ops->func_hash->notrace_hash = save_notrace_hash;
  3433				free_ftrace_hash(filter_hash);
  3434				free_ftrace_hash(notrace_hash);
  3435			} else {
  3436				free_ftrace_hash(save_filter_hash);
  3437				free_ftrace_hash(save_notrace_hash);
  3438				subops->flags |= FTRACE_OPS_FL_ENABLED;
  3439			}
  3440			return ret;
  3441		}
  3442	
  3443		/*
  3444		 * Here there's already something attached. Here are the rules:
  3445		 *   o If either filter_hash is empty then the final stays empty
  3446		 *      o Otherwise, the final is a superset of both hashes
  3447		 *   o If either notrace_hash is empty then the final stays empty
  3448		 *      o Otherwise, the final is an intersection between the hashes
  3449		 */
  3450		if (ftrace_hash_empty(ops->func_hash->filter_hash) ||
  3451		    ftrace_hash_empty(subops->func_hash->filter_hash)) {
  3452			filter_hash = EMPTY_HASH;
  3453		} else {
  3454			size_bits = max(ops->func_hash->filter_hash->size_bits,
  3455					subops->func_hash->filter_hash->size_bits);
  3456			filter_hash = alloc_and_copy_ftrace_hash(size_bits, ops->func_hash->filter_hash);
  3457			if (!filter_hash)
  3458				return -ENOMEM;
  3459			ret = append_hash(&filter_hash, subops->func_hash->filter_hash);
  3460			if (ret < 0) {
  3461				free_ftrace_hash(filter_hash);
  3462				return ret;
  3463			}
  3464		}
  3465	
  3466		if (ftrace_hash_empty(ops->func_hash->notrace_hash) ||
  3467		    ftrace_hash_empty(subops->func_hash->notrace_hash)) {
  3468			notrace_hash = EMPTY_HASH;
  3469		} else {
  3470			size_bits = max(ops->func_hash->filter_hash->size_bits,
  3471					subops->func_hash->filter_hash->size_bits);
  3472			notrace_hash = alloc_ftrace_hash(size_bits);
  3473			if (!notrace_hash) {
  3474				free_ftrace_hash(filter_hash);
  3475				return -ENOMEM;
  3476			}
  3477	
  3478			ret = intersect_hash(&notrace_hash, ops->func_hash->filter_hash,
  3479					     subops->func_hash->filter_hash);
  3480			if (ret < 0) {
  3481				free_ftrace_hash(filter_hash);
  3482				free_ftrace_hash(notrace_hash);
  3483				return ret;
  3484			}
  3485		}
  3486	
  3487		list_add(&subops->list, &ops->subop_list);
  3488	
  3489		ret = ftrace_update_ops(ops, filter_hash, notrace_hash);
  3490		free_ftrace_hash(filter_hash);
  3491		free_ftrace_hash(notrace_hash);
  3492		if (ret < 0)
  3493			list_del(&subops->list);
  3494		else
  3495			subops->flags |= FTRACE_OPS_FL_ENABLED;
  3496	
  3497		return ret;
  3498	}
  3499	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
