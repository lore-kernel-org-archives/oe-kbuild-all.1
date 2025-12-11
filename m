Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD69288502
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 05:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765431646; cv=none; b=E6T1DONMj2sPGEkyy/djM5DRcUxdXOlvwWRq3zY+i4xqz9dhkOQ96Zr6niu3eZQborh3ElQdhv94a9DyIXUtsLdViIOvW1xd62BsmL2jhIElSleRjIWbgfMqeLil2lSp+FcVyVEIbd7EyKz8s3+TWGFFw1+eNPUcKzMNxTIXUOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765431646; c=relaxed/simple;
	bh=imXH5iX5o8xpXICcJqRJePvtqjz7F8eAexJMSmtx92w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O5hwKvev9tVZtsLxD80f+6rDcC50Y4UNbeZ4499eLBpmMlOiQabwi/sAa3203ES1fJPYRyUkwTkll0NmwMnYX+jCKpbfpgM8QTLfyUtNjKf/cPGTSLE4kHcckiO/Mjx+HNsMwZv5OojYerxOzXLXktuHWUHuHux88by1Ka3zlgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IWZ/BByt; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IWZ/BByt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765431644; x=1796967644;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=imXH5iX5o8xpXICcJqRJePvtqjz7F8eAexJMSmtx92w=;
  b=IWZ/BBytmtbSuBwAILfCswPBbBIxr6NtMOyT7uMbzD4aHmBNw0MPIUQC
   sSpLW/Ah1ieFbAaKqqvZg7RfxWmfxenys0NSGuLsg0YfQrZ1Rx/ZBUNN/
   EgHtpgquC1Hqs8wDTtqUZl+HWNkKlGYYt93H2GZ8bdIeHqxyUN9X3osMm
   P2pwBqvfQKEkohINiH/d/GwUpka+1NNh02NJT8Gp8llGD6MuxfOUTNLyy
   /iyCWvGtftCq6uWYkDwdvy3zBQKWpD0+TjNq0VtXhgnIKlYPq/5h8ElYW
   JQhf+T1/phWkxFRssl7qPmYNF2WH0nlHiOiCtdEsF4Go7PPhvdbwcjh+G
   A==;
X-CSE-ConnectionGUID: T9MDIwKOSVufwsZwlN2d/w==
X-CSE-MsgGUID: +3S1p/XsSP+cNZbdyynHzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="78111665"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="78111665"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 21:40:42 -0800
X-CSE-ConnectionGUID: o8Yl6tE9SveNem45aL35Kw==
X-CSE-MsgGUID: M2SaP/iFSEiHRSlH4ve0eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="196715504"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Dec 2025 21:40:40 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTZPp-000000004FB-3FtR;
	Thu, 11 Dec 2025 05:40:37 +0000
Date: Thu, 11 Dec 2025 13:39:46 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: kernel/trace/ftrace.c:3402:52: sparse: sparse: incorrect type in
 argument 2 (different address spaces)
Message-ID: <202512111316.Y5IR0Scl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: 0ae6b8ce200da00a78f33c055fdc4fe3225d22ec ftrace: Fix accounting of subop hashes
date:   8 months ago
config: x86_64-randconfig-121-20251211 (https://download.01.org/0day-ci/archive/20251211/202512111316.Y5IR0Scl-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111316.Y5IR0Scl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111316.Y5IR0Scl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/trace/ftrace.c:233:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_ops *ops @@     got struct ftrace_ops [noderef] __rcu *[addressable] [toplevel] ftrace_ops_list @@
   kernel/trace/ftrace.c:233:49: sparse:     expected struct ftrace_ops *ops
   kernel/trace/ftrace.c:233:49: sparse:     got struct ftrace_ops [noderef] __rcu *[addressable] [toplevel] ftrace_ops_list
   kernel/trace/ftrace.c:318:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_ops **p @@     got struct ftrace_ops [noderef] __rcu **list @@
   kernel/trace/ftrace.c:318:16: sparse:     expected struct ftrace_ops **p
   kernel/trace/ftrace.c:318:16: sparse:     got struct ftrace_ops [noderef] __rcu **list
   kernel/trace/ftrace.c:318:50: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_ops **p @@     got struct ftrace_ops [noderef] __rcu ** @@
   kernel/trace/ftrace.c:318:50: sparse:     expected struct ftrace_ops **p
   kernel/trace/ftrace.c:318:50: sparse:     got struct ftrace_ops [noderef] __rcu **
   kernel/trace/ftrace.c:325:12: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_ops * @@     got struct ftrace_ops [noderef] __rcu *next @@
   kernel/trace/ftrace.c:325:12: sparse:     expected struct ftrace_ops *
   kernel/trace/ftrace.c:325:12: sparse:     got struct ftrace_ops [noderef] __rcu *next
   kernel/trace/ftrace.c:1072:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *notrace_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:1072:43: sparse:     expected struct ftrace_hash [noderef] __rcu *notrace_hash
   kernel/trace/ftrace.c:1072:43: sparse:     got struct ftrace_hash *
   kernel/trace/ftrace.c:1073:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:1073:43: sparse:     expected struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:1073:43: sparse:     got struct ftrace_hash *
   kernel/trace/ftrace.c:1298:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:1298:40: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:1298:40: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:1299:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:1299:40: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:1299:40: sparse:     got struct ftrace_hash [noderef] __rcu *notrace_hash
   kernel/trace/ftrace.c:2098:54: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash *old_hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:2098:54: sparse:     expected struct ftrace_hash *old_hash
   kernel/trace/ftrace.c:2098:54: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:1503:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/trace/ftrace.c:1503:9: sparse:    struct ftrace_hash [noderef] __rcu *
   kernel/trace/ftrace.c:1503:9: sparse:    struct ftrace_hash *
   kernel/trace/ftrace.c:1519:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:1520:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:1521:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:1522:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:1693:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_ops *ops @@     got struct ftrace_ops [noderef] __rcu *[addressable] [toplevel] ftrace_ops_list @@
   kernel/trace/ftrace.c:1694:43: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_ops *ops @@     got struct ftrace_ops [noderef] __rcu *next @@
   kernel/trace/ftrace.c:1755:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:1756:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *notrace_hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:2076:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:2087:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:2570:53: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *static [toplevel] direct_functions @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:2581:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *static [toplevel] direct_functions @@
   kernel/trace/ftrace.c:3377:51: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *B @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3378:66: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:3384:52: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *B @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3385:66: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:3398:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3399:51: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *src @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
>> kernel/trace/ftrace.c:3402:52: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *notrace_hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3406:52: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *src @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3421:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3422:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3430:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3436:81: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3440:54: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *notrace_hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3442:56: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *new_hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3471:60: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *new_hash1 @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3472:49: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct ftrace_hash *new_hash2 @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3510:45: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3512:46: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *notrace_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3514:48: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3516:49: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *notrace_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3522:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3523:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3529:34: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *save_filter_hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3530:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *save_notrace_hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
>> kernel/trace/ftrace.c:3532:45: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash *[addressable] filter_hash @@
>> kernel/trace/ftrace.c:3533:46: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *notrace_hash @@     got struct ftrace_hash *[addressable] notrace_hash @@
   kernel/trace/ftrace.c:3538:53: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash *save_filter_hash @@
   kernel/trace/ftrace.c:3539:54: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *notrace_hash @@     got struct ftrace_hash *save_notrace_hash @@
   kernel/trace/ftrace.c:3586:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3587:32: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *notrace_hash @@     got struct ftrace_hash * @@
>> kernel/trace/ftrace.c:3602:59: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *[addressable] filter_hash @@
>> kernel/trace/ftrace.c:3603:59: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *[addressable] notrace_hash @@
>> kernel/trace/ftrace.c:3608:39: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *[addressable] filter_hash @@     got struct ftrace_hash * @@
>> kernel/trace/ftrace.c:3609:40: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *[addressable] notrace_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3651:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3652:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3653:45: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3654:46: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *notrace_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3937:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3954:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:4602:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:4605:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:5012:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:5014:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:5389:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:5533:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:5539:34: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash *[assigned] old_hash @@
   kernel/trace/ftrace.c:5804:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:5806:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:5887:50: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *static [toplevel] direct_functions @@
   kernel/trace/ftrace.c:5889:51: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *static [toplevel] direct_functions @@
   kernel/trace/ftrace.c:5938:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:5987:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *free_hash @@     got struct ftrace_hash [noderef] __rcu *static [toplevel] direct_functions @@
   kernel/trace/ftrace.c:6029:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:6081:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:6085:52: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *static [addressable] [assigned] [toplevel] direct_functions @@
   kernel/trace/ftrace.c:6411:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *extern [addressable] [toplevel] ftrace_graph_hash @@     got struct ftrace_hash *[assigned] hash @@
   kernel/trace/ftrace.c:6413:43: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *extern [addressable] [toplevel] ftrace_graph_notrace_hash @@     got struct ftrace_hash *[assigned] hash @@
   kernel/trace/ftrace.c:6482:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:6490:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:6558:47: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *[addressable] [toplevel] ftrace_graph_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:6559:55: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *[addressable] [toplevel] ftrace_graph_notrace_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:7278:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:7279:47: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:7283:44: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:7301:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_ops *ops @@     got struct ftrace_ops [noderef] __rcu *[addressable] [toplevel] ftrace_ops_list @@
   kernel/trace/ftrace.c:7301:66: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_ops *ops @@     got struct ftrace_ops [noderef] __rcu *next @@
   kernel/trace/ftrace.c:7353:59: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:7354:59: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:7734:62: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:7735:62: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:7779:36: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/trace/ftrace.c:7779:36: sparse:    struct ftrace_ops [noderef] __rcu *
   kernel/trace/ftrace.c:7779:36: sparse:    struct ftrace_ops *
   kernel/trace/ftrace.c:8555:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:8555:14: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:8555:14: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:8604:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:8604:14: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:8604:14: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:231:20: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:231:20: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:231:20: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3432:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3432:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3432:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3432:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3432:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3432:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3465:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3465:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3465:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3465:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3465:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3465:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:5956:30: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:5964:21: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:5966:17: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3729:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3729:48: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:3729:48: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:3730:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3730:49: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:3730:49: sparse:     got struct ftrace_hash [noderef] __rcu *notrace_hash

vim +3402 kernel/trace/ftrace.c

  3393	
  3394	static int add_first_hash(struct ftrace_hash **filter_hash, struct ftrace_hash **notrace_hash,
  3395				  struct ftrace_ops_hash *func_hash)
  3396	{
  3397		/* If the filter hash is not empty, simply remove the nohash from it */
  3398		if (!ftrace_hash_empty(func_hash->filter_hash)) {
  3399			*filter_hash = copy_hash(func_hash->filter_hash);
  3400			if (!*filter_hash)
  3401				return -ENOMEM;
> 3402			remove_hash(*filter_hash, func_hash->notrace_hash);
  3403			*notrace_hash = EMPTY_HASH;
  3404	
  3405		} else {
  3406			*notrace_hash = copy_hash(func_hash->notrace_hash);
  3407			if (!*notrace_hash)
  3408				return -ENOMEM;
  3409			*filter_hash = EMPTY_HASH;
  3410		}
  3411		return 0;
  3412	}
  3413	
  3414	static int add_next_hash(struct ftrace_hash **filter_hash, struct ftrace_hash **notrace_hash,
  3415				 struct ftrace_ops_hash *ops_hash, struct ftrace_ops_hash *subops_hash)
  3416	{
  3417		int size_bits;
  3418		int ret;
  3419	
  3420		/* If the subops trace all functions so must the main ops */
  3421		if (ftrace_hash_empty(ops_hash->filter_hash) ||
  3422		    ftrace_hash_empty(subops_hash->filter_hash)) {
  3423			*filter_hash = EMPTY_HASH;
  3424		} else {
  3425			/*
  3426			 * The main ops filter hash is not empty, so its
  3427			 * notrace_hash had better be, as the notrace hash
  3428			 * is only used for empty main filter hashes.
  3429			 */
  3430			WARN_ON_ONCE(!ftrace_hash_empty(ops_hash->notrace_hash));
  3431	
  3432			size_bits = max(ops_hash->filter_hash->size_bits,
  3433					subops_hash->filter_hash->size_bits);
  3434	
  3435			/* Copy the subops hash */
  3436			*filter_hash = alloc_and_copy_ftrace_hash(size_bits, subops_hash->filter_hash);
  3437			if (!filter_hash)
  3438				return -ENOMEM;
  3439			/* Remove any notrace functions from the copy */
  3440			remove_hash(*filter_hash, subops_hash->notrace_hash);
  3441	
  3442			ret = append_hash(filter_hash, ops_hash->filter_hash,
  3443					  size_bits);
  3444			if (ret < 0) {
  3445				free_ftrace_hash(*filter_hash);
  3446				return ret;
  3447			}
  3448		}
  3449	
  3450		/*
  3451		 * Only process notrace hashes if the main filter hash is empty
  3452		 * (tracing all functions), otherwise the filter hash will just
  3453		 * remove the notrace hash functions, and the notrace hash is
  3454		 * not needed.
  3455		 */
  3456		if (ftrace_hash_empty(*filter_hash)) {
  3457			/*
  3458			 * Intersect the notrace functions. That is, if two
  3459			 * subops are not tracing a set of functions, the
  3460			 * main ops will only not trace the functions that are
  3461			 * in both subops, but has to trace the functions that
  3462			 * are only notrace in one of the subops, for the other
  3463			 * subops to be able to trace them.
  3464			 */
  3465			size_bits = max(ops_hash->notrace_hash->size_bits,
  3466					subops_hash->notrace_hash->size_bits);
  3467			*notrace_hash = alloc_ftrace_hash(size_bits);
  3468			if (!*notrace_hash)
  3469				return -ENOMEM;
  3470	
  3471			ret = intersect_hash(notrace_hash, ops_hash->notrace_hash,
  3472					     subops_hash->notrace_hash);
  3473			if (ret < 0) {
  3474				free_ftrace_hash(*notrace_hash);
  3475				return ret;
  3476			}
  3477		}
  3478		return 0;
  3479	}
  3480	
  3481	/**
  3482	 * ftrace_startup_subops - enable tracing for subops of an ops
  3483	 * @ops: Manager ops (used to pick all the functions of its subops)
  3484	 * @subops: A new ops to add to @ops
  3485	 * @command: Extra commands to use to enable tracing
  3486	 *
  3487	 * The @ops is a manager @ops that has the filter that includes all the functions
  3488	 * that its list of subops are tracing. Adding a new @subops will add the
  3489	 * functions of @subops to @ops.
  3490	 */
  3491	int ftrace_startup_subops(struct ftrace_ops *ops, struct ftrace_ops *subops, int command)
  3492	{
  3493		struct ftrace_hash *filter_hash;
  3494		struct ftrace_hash *notrace_hash;
  3495		struct ftrace_hash *save_filter_hash;
  3496		struct ftrace_hash *save_notrace_hash;
  3497		int ret;
  3498	
  3499		if (unlikely(ftrace_disabled))
  3500			return -ENODEV;
  3501	
  3502		ftrace_ops_init(ops);
  3503		ftrace_ops_init(subops);
  3504	
  3505		if (WARN_ON_ONCE(subops->flags & FTRACE_OPS_FL_ENABLED))
  3506			return -EBUSY;
  3507	
  3508		/* Make everything canonical (Just in case!) */
  3509		if (!ops->func_hash->filter_hash)
  3510			ops->func_hash->filter_hash = EMPTY_HASH;
  3511		if (!ops->func_hash->notrace_hash)
  3512			ops->func_hash->notrace_hash = EMPTY_HASH;
  3513		if (!subops->func_hash->filter_hash)
  3514			subops->func_hash->filter_hash = EMPTY_HASH;
  3515		if (!subops->func_hash->notrace_hash)
  3516			subops->func_hash->notrace_hash = EMPTY_HASH;
  3517	
  3518		/* For the first subops to ops just enable it normally */
  3519		if (list_empty(&ops->subop_list)) {
  3520	
  3521			/* The ops was empty, should have empty hashes */
  3522			WARN_ON_ONCE(!ftrace_hash_empty(ops->func_hash->filter_hash));
  3523			WARN_ON_ONCE(!ftrace_hash_empty(ops->func_hash->notrace_hash));
  3524	
  3525			ret = add_first_hash(&filter_hash, &notrace_hash, subops->func_hash);
  3526			if (ret < 0)
  3527				return ret;
  3528	
  3529			save_filter_hash = ops->func_hash->filter_hash;
  3530			save_notrace_hash = ops->func_hash->notrace_hash;
  3531	
> 3532			ops->func_hash->filter_hash = filter_hash;
> 3533			ops->func_hash->notrace_hash = notrace_hash;
  3534			list_add(&subops->list, &ops->subop_list);
  3535			ret = ftrace_startup(ops, command);
  3536			if (ret < 0) {
  3537				list_del(&subops->list);
  3538				ops->func_hash->filter_hash = save_filter_hash;
  3539				ops->func_hash->notrace_hash = save_notrace_hash;
  3540				free_ftrace_hash(filter_hash);
  3541				free_ftrace_hash(notrace_hash);
  3542			} else {
  3543				free_ftrace_hash(save_filter_hash);
  3544				free_ftrace_hash(save_notrace_hash);
  3545				subops->flags |= FTRACE_OPS_FL_ENABLED | FTRACE_OPS_FL_SUBOP;
  3546				subops->managed = ops;
  3547			}
  3548			return ret;
  3549		}
  3550	
  3551		/*
  3552		 * Here there's already something attached. Here are the rules:
  3553		 *   If the new subops and main ops filter hashes are not empty:
  3554		 *     o Make a copy of the subops filter hash
  3555		 *     o Remove all functions in the nohash from it.
  3556		 *     o Add in the main hash filter functions
  3557		 *     o Remove any of these functions from the main notrace hash
  3558		 */
  3559	
  3560		ret = add_next_hash(&filter_hash, &notrace_hash, ops->func_hash, subops->func_hash);
  3561		if (ret < 0)
  3562			return ret;
  3563	
  3564		list_add(&subops->list, &ops->subop_list);
  3565	
  3566		ret = ftrace_update_ops(ops, filter_hash, notrace_hash);
  3567		free_ftrace_hash(filter_hash);
  3568		free_ftrace_hash(notrace_hash);
  3569		if (ret < 0) {
  3570			list_del(&subops->list);
  3571		} else {
  3572			subops->flags |= FTRACE_OPS_FL_ENABLED | FTRACE_OPS_FL_SUBOP;
  3573			subops->managed = ops;
  3574		}
  3575		return ret;
  3576	}
  3577	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
