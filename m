Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983E4194C69
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jun 2024 13:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717768157; cv=none; b=d+rG+wlBJqYW7MKZ7g3aw2l6ACZI1Tsz/jdbcxjlVmUcRXI2K+4Fqcv9JMACtiwOn+iLGg9fa7NqYbREyhIqE6Z7Uyd3+WedG5VLfGz4Dcq1gGvWMyKIIkAXR5JGvMlkR/g/bjY8iJMKYuqU+tEs1L4mOeHJ4Lk6cxL+aDaRlck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717768157; c=relaxed/simple;
	bh=DnmYnAUjn9TdPy66dPFD9QhRUpukLm2eqgXqt2ETVAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lAvjOSKL2cNT4i8cOeZFiOo8NgYljRjZygLtYaX288fKcaHpjfyYDUMa4YOvMdeNDQpaGIOT1oPLYAyeW7RPZSV3+/9VR75yWyVEJp2RsnQWJAUXJG2gIzZgT5jkzsyMM3ian8LMHYXxbka0SlAWjnxlTrPoJIQ1pWznKXME3Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UD95qrDY; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UD95qrDY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717768154; x=1749304154;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DnmYnAUjn9TdPy66dPFD9QhRUpukLm2eqgXqt2ETVAQ=;
  b=UD95qrDY9OfHuHA434ShB4dxJZMultQz6AjlS8uURYhWqO4MMNf2p3gs
   hc7uIbwl7CuM6a9jxIyFhOLzkwI/Ml4W/QaC0udb9XmgmvCTpNeNv/Qyv
   UWGkNIMspxS/4SzJh/6pRYOLJI08yhc0WjgZKL2FRjJqafGruMZ+SC0Ei
   TlRwLgR0vREimXq8Rk31Y0DMTivMb2nsR4KH2Cw6wVzcOqCUE82SeUyeu
   gyuj6Zg8D00C3K+SdAlpZi8qHkhzTP1Me+kBFh7OS4tmSc/cEXH5qxFu3
   IFiY2eZ5bvlvKyWshh653Iw8U2DKVASUMqdMQ5LybgmUMTrBONkjW3q/5
   Q==;
X-CSE-ConnectionGUID: k4Gw9yhFQBGFhX193plVuA==
X-CSE-MsgGUID: lg9RvacrS6uy7vXah53hDQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="31983859"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="31983859"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 06:49:12 -0700
X-CSE-ConnectionGUID: azmttSKiTMeaPuY6KKckjw==
X-CSE-MsgGUID: QprjcskyRbu/1zKLnPzENw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="75814894"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 07 Jun 2024 06:49:11 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFZxs-0004sa-0k;
	Fri, 07 Jun 2024 13:49:08 +0000
Date: Fri, 7 Jun 2024 21:48:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [linux-next:master 4350/4582] kernel/trace/ftrace.c:1733:22: sparse:
 sparse: incorrect type in assignment (different address spaces)
Message-ID: <202406072132.gK2rPSm1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d35b2284e966c0bef3e2182a5c5ea02177dd32e4
commit: 07bbe0833ed62f48785dffa8e429f35c1d906415 [4350/4582] ftrace: Remove "filter_hash" parameter from __ftrace_hash_rec_update()
config: s390-randconfig-r113-20240607 (https://download.01.org/0day-ci/archive/20240607/202406072132.gK2rPSm1-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240607/202406072132.gK2rPSm1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406072132.gK2rPSm1-lkp@intel.com/

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
   kernel/trace/ftrace.c:1070:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *notrace_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:1070:43: sparse:     expected struct ftrace_hash [noderef] __rcu *notrace_hash
   kernel/trace/ftrace.c:1070:43: sparse:     got struct ftrace_hash *
   kernel/trace/ftrace.c:1071:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:1071:43: sparse:     expected struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:1071:43: sparse:     got struct ftrace_hash *
   kernel/trace/ftrace.c:1294:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:1294:40: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:1294:40: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:1295:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:1295:40: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:1295:40: sparse:     got struct ftrace_hash [noderef] __rcu *notrace_hash
   kernel/trace/ftrace.c:2049:54: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash *old_hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:2049:54: sparse:     expected struct ftrace_hash *old_hash
   kernel/trace/ftrace.c:2049:54: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:1478:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/trace/ftrace.c:1478:9: sparse:    struct ftrace_hash [noderef] __rcu *
   kernel/trace/ftrace.c:1478:9: sparse:    struct ftrace_hash *
   kernel/trace/ftrace.c:1494:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:1495:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:1496:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:1497:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:1670:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_ops *ops @@     got struct ftrace_ops [noderef] __rcu *[addressable] [toplevel] ftrace_ops_list @@
   kernel/trace/ftrace.c:1671:43: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_ops *ops @@     got struct ftrace_ops [noderef] __rcu *next @@
   kernel/trace/ftrace.c:1732:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
>> kernel/trace/ftrace.c:1733:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *notrace_hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:2027:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:2038:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:2521:53: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *static [toplevel] direct_functions @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:2532:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *static [toplevel] direct_functions @@
   kernel/trace/ftrace.c:3254:63: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *new_hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3279:88: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3287:77: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct ftrace_hash *new_hash2 @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3354:51: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *B @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3355:66: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:3361:52: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *B @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3362:66: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:3401:45: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3403:46: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *notrace_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3405:48: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3407:49: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *notrace_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3412:58: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *src @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3413:59: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *src @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3420:34: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *save_filter_hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3421:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *save_notrace_hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3423:45: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash *[assigned] filter_hash @@
   kernel/trace/ftrace.c:3424:46: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *notrace_hash @@     got struct ftrace_hash *[assigned] notrace_hash @@
   kernel/trace/ftrace.c:3429:53: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash *save_filter_hash @@
   kernel/trace/ftrace.c:3430:54: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *notrace_hash @@     got struct ftrace_hash *save_notrace_hash @@
   kernel/trace/ftrace.c:3449:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3450:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3455:83: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3458:66: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *new_hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3465:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3466:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3477:67: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *new_hash1 @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3478:55: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct ftrace_hash *new_hash2 @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3537:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3538:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3539:45: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3540:46: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *notrace_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3594:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:3597:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:3832:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3849:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:4497:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:4500:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:5314:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:5458:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:5464:34: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash *[assigned] old_hash @@
   kernel/trace/ftrace.c:5739:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:5741:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:5814:50: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *static [toplevel] direct_functions @@
   kernel/trace/ftrace.c:5816:51: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *static [toplevel] direct_functions @@
   kernel/trace/ftrace.c:5865:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:5914:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *free_hash @@     got struct ftrace_hash [noderef] __rcu *static [toplevel] direct_functions @@
   kernel/trace/ftrace.c:5954:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:6006:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:6010:52: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *static [addressable] [assigned] [toplevel] direct_functions @@
   kernel/trace/ftrace.c:6305:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *extern [addressable] [toplevel] ftrace_graph_hash @@     got struct ftrace_hash *[assigned] hash @@
   kernel/trace/ftrace.c:6307:43: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *extern [addressable] [toplevel] ftrace_graph_notrace_hash @@     got struct ftrace_hash *[assigned] hash @@
   kernel/trace/ftrace.c:6368:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:6376:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:6444:47: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *[addressable] [toplevel] ftrace_graph_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:6445:55: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *[addressable] [toplevel] ftrace_graph_notrace_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:7122:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:7123:47: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:7127:44: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:7581:62: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:7582:62: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:7626:36: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/trace/ftrace.c:7626:36: sparse:    struct ftrace_ops [noderef] __rcu *
   kernel/trace/ftrace.c:7626:36: sparse:    struct ftrace_ops *
   kernel/trace/ftrace.c:8402:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:8402:14: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:8402:14: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:8451:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:8451:14: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:8451:14: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:230:20: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:230:20: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:230:20: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3249:52: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3278:54: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3453:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3453:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3469:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3469:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:5883:30: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:5891:21: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:5893:17: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3628:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3628:48: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:3628:48: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:3629:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3629:49: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:3629:49: sparse:     got struct ftrace_hash [noderef] __rcu *notrace_hash

vim +1733 kernel/trace/ftrace.c

  1702	
  1703	/*
  1704	 * This is the main engine to the ftrace updates to the dyn_ftrace records.
  1705	 *
  1706	 * It will iterate through all the available ftrace functions
  1707	 * (the ones that ftrace can have callbacks to) and set the flags
  1708	 * in the associated dyn_ftrace records.
  1709	 *
  1710	 * @inc: If true, the functions associated to @ops are added to
  1711	 *       the dyn_ftrace records, otherwise they are removed.
  1712	 */
  1713	static bool __ftrace_hash_rec_update(struct ftrace_ops *ops,
  1714					     bool inc)
  1715	{
  1716		struct ftrace_hash *hash;
  1717		struct ftrace_hash *notrace_hash;
  1718		struct ftrace_page *pg;
  1719		struct dyn_ftrace *rec;
  1720		bool update = false;
  1721		int count = 0;
  1722		int all = false;
  1723	
  1724		/* Only update if the ops has been registered */
  1725		if (!(ops->flags & FTRACE_OPS_FL_ENABLED))
  1726			return false;
  1727	
  1728		/*
  1729		 *   If the count is zero, we update all records.
  1730		 *   Otherwise we just update the items in the hash.
  1731		 */
  1732		hash = ops->func_hash->filter_hash;
> 1733		notrace_hash = ops->func_hash->notrace_hash;
  1734		if (ftrace_hash_empty(hash))
  1735			all = true;
  1736	
  1737		do_for_each_ftrace_rec(pg, rec) {
  1738			int in_notrace_hash = 0;
  1739			int in_hash = 0;
  1740			int match = 0;
  1741	
  1742			if (skip_record(rec))
  1743				continue;
  1744	
  1745			if (all) {
  1746				/*
  1747				 * Only the filter_hash affects all records.
  1748				 * Update if the record is not in the notrace hash.
  1749				 */
  1750				if (!notrace_hash || !ftrace_lookup_ip(notrace_hash, rec->ip))
  1751					match = 1;
  1752			} else {
  1753				in_hash = !!ftrace_lookup_ip(hash, rec->ip);
  1754				in_notrace_hash = !!ftrace_lookup_ip(notrace_hash, rec->ip);
  1755	
  1756				/*
  1757				 * We want to match all functions that are in the hash but
  1758				 * not in the other hash.
  1759				 */
  1760				if (in_hash && !in_notrace_hash)
  1761					match = 1;
  1762			}
  1763			if (!match)
  1764				continue;
  1765	
  1766			if (inc) {
  1767				rec->flags++;
  1768				if (FTRACE_WARN_ON(ftrace_rec_count(rec) == FTRACE_REF_MAX))
  1769					return false;
  1770	
  1771				if (ops->flags & FTRACE_OPS_FL_DIRECT)
  1772					rec->flags |= FTRACE_FL_DIRECT;
  1773	
  1774				/*
  1775				 * If there's only a single callback registered to a
  1776				 * function, and the ops has a trampoline registered
  1777				 * for it, then we can call it directly.
  1778				 */
  1779				if (ftrace_rec_count(rec) == 1 && ops->trampoline)
  1780					rec->flags |= FTRACE_FL_TRAMP;
  1781				else
  1782					/*
  1783					 * If we are adding another function callback
  1784					 * to this function, and the previous had a
  1785					 * custom trampoline in use, then we need to go
  1786					 * back to the default trampoline.
  1787					 */
  1788					rec->flags &= ~FTRACE_FL_TRAMP;
  1789	
  1790				/*
  1791				 * If any ops wants regs saved for this function
  1792				 * then all ops will get saved regs.
  1793				 */
  1794				if (ops->flags & FTRACE_OPS_FL_SAVE_REGS)
  1795					rec->flags |= FTRACE_FL_REGS;
  1796			} else {
  1797				if (FTRACE_WARN_ON(ftrace_rec_count(rec) == 0))
  1798					return false;
  1799				rec->flags--;
  1800	
  1801				/*
  1802				 * Only the internal direct_ops should have the
  1803				 * DIRECT flag set. Thus, if it is removing a
  1804				 * function, then that function should no longer
  1805				 * be direct.
  1806				 */
  1807				if (ops->flags & FTRACE_OPS_FL_DIRECT)
  1808					rec->flags &= ~FTRACE_FL_DIRECT;
  1809	
  1810				/*
  1811				 * If the rec had REGS enabled and the ops that is
  1812				 * being removed had REGS set, then see if there is
  1813				 * still any ops for this record that wants regs.
  1814				 * If not, we can stop recording them.
  1815				 */
  1816				if (ftrace_rec_count(rec) > 0 &&
  1817				    rec->flags & FTRACE_FL_REGS &&
  1818				    ops->flags & FTRACE_OPS_FL_SAVE_REGS) {
  1819					if (!test_rec_ops_needs_regs(rec))
  1820						rec->flags &= ~FTRACE_FL_REGS;
  1821				}
  1822	
  1823				/*
  1824				 * The TRAMP needs to be set only if rec count
  1825				 * is decremented to one, and the ops that is
  1826				 * left has a trampoline. As TRAMP can only be
  1827				 * enabled if there is only a single ops attached
  1828				 * to it.
  1829				 */
  1830				if (ftrace_rec_count(rec) == 1 &&
  1831				    ftrace_find_tramp_ops_any_other(rec, ops))
  1832					rec->flags |= FTRACE_FL_TRAMP;
  1833				else
  1834					rec->flags &= ~FTRACE_FL_TRAMP;
  1835	
  1836				/*
  1837				 * flags will be cleared in ftrace_check_record()
  1838				 * if rec count is zero.
  1839				 */
  1840			}
  1841	
  1842			/*
  1843			 * If the rec has a single associated ops, and ops->func can be
  1844			 * called directly, allow the call site to call via the ops.
  1845			 */
  1846			if (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS) &&
  1847			    ftrace_rec_count(rec) == 1 &&
  1848			    ftrace_ops_get_func(ops) == ops->func)
  1849				rec->flags |= FTRACE_FL_CALL_OPS;
  1850			else
  1851				rec->flags &= ~FTRACE_FL_CALL_OPS;
  1852	
  1853			count++;
  1854	
  1855			/* Must match FTRACE_UPDATE_CALLS in ftrace_modify_all_code() */
  1856			update |= ftrace_test_record(rec, true) != FTRACE_UPDATE_IGNORE;
  1857	
  1858			/* Shortcut, if we handled all records, we are done. */
  1859			if (!all && count == hash->count)
  1860				return update;
  1861		} while_for_each_ftrace_rec();
  1862	
  1863		return update;
  1864	}
  1865	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
