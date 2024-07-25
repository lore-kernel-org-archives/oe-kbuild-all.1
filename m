Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21B9210F8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jul 2024 21:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721944108; cv=none; b=BJi/NpCzXCOfleWJJoeJ7QfIm4MELYCyyknL4olFAoQTsp6JIMnLYWpu8ka9CuOUeQh3m0afgZe4gfff6VN4LeHss+sQesRItEicy5Mwe2t+zhqrE8xi+4tYAczKA0vGGhBc5v4JRSQg2MsF0vNCKISFCaCYjR3wLfgg4zdqkBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721944108; c=relaxed/simple;
	bh=g+3nfFSSB2p11MuWxwmOwXHhUYb39Z0/hYpsjLrp7Kk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IAiksPxB90ElyLOHOL9Bqy14XcPkYlQAajlN26iD5hSL1Ak36Q3EIHxNfgDnlVDc12hVYuCRknPFkiwrjTYkA8ZR08wNq7heBaBMMARjRKmQ2BI6q0+Ped/0JmCH22E0IgcouO4gi35RKAi1fQUukDXCt7UPWLQ50mXYKg7qq4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FuI88K93; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FuI88K93"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721944106; x=1753480106;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g+3nfFSSB2p11MuWxwmOwXHhUYb39Z0/hYpsjLrp7Kk=;
  b=FuI88K93FD8+5AP8xV18jS3x2CExg08Dxo7VLIKfEBKHdT0EeySSA9+5
   gNB16swd/wH5OpIX4eYu6L68UuK9KgGWko4gsSRsr1YQCP+xj0Gnjjjja
   i4s5yUtGhBgK7UrcgeIAnZCYNuriPg7XU9VhU7gyk6RLtcSZmO3DLs2Wu
   YBR2Gu3y508DWipKqwmP4lhMQuhbTI2Ncj+gY2JHfq56r8sfVf8Ktk8Vi
   JuaWdqN3nwgO39u9J0bphjWIiWZXQADRcV/JYFlvxRV/FFQcTJIJ4qoOG
   lV5POrBfXhWlFAOhjDcAJzERUy40B7MS+7My0jIjABjVL+EN9N3ANNV7x
   g==;
X-CSE-ConnectionGUID: Pgo99XZ+QS+jfHom7DZzmA==
X-CSE-MsgGUID: MrlRIYxVQm6jNFY//aahEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="31130336"
X-IronPort-AV: E=Sophos;i="6.09,237,1716274800"; 
   d="scan'208";a="31130336"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2024 14:48:24 -0700
X-CSE-ConnectionGUID: RGjHPs5QRKq/XpONNJAymw==
X-CSE-MsgGUID: wp0wQkYqSTK8UmDehhmnDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,237,1716274800"; 
   d="scan'208";a="90538708"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 25 Jul 2024 14:48:23 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sX6Jx-000oUm-0q;
	Thu, 25 Jul 2024 21:48:21 +0000
Date: Fri, 26 Jul 2024 05:48:04 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:kthread/affinity 18/20] kernel/kthread.c:1024:
 warning: Function parameter or struct member 'node' not described in
 'kthread_create_worker_on_node'
Message-ID: <202407260546.xndGVApq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git kthread/affinity
head:   b6dba5dc36864037925f32fc2dbf82d4a88ab3bb
commit: 9e34b60ab704e6a6898c57f7cebe426dfee26cde [18/20] kthread: Unify kthread_create_on_cpu() and kthread_create_worker_on_cpu() automatic format
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240726/202407260546.xndGVApq-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240726/202407260546.xndGVApq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407260546.xndGVApq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/kthread.c:1024: warning: Function parameter or struct member 'node' not described in 'kthread_create_worker_on_node'
>> kernel/kthread.c:1024: warning: expecting prototype for kthread_create_worker(). Prototype was for kthread_create_worker_on_node() instead


vim +1024 kernel/kthread.c

  1012	
  1013	/**
  1014	 * kthread_create_worker - create a kthread worker
  1015	 * @flags: flags modifying the default behavior of the worker
  1016	 * @namefmt: printf-style name for the kthread worker (task).
  1017	 *
  1018	 * Returns a pointer to the allocated worker on success, ERR_PTR(-ENOMEM)
  1019	 * when the needed structures could not get allocated, and ERR_PTR(-EINTR)
  1020	 * when the caller was killed by a fatal signal.
  1021	 */
  1022	struct kthread_worker *
  1023	kthread_create_worker_on_node(unsigned int flags, int node, const char namefmt[], ...)
> 1024	{
  1025		struct kthread_worker *worker;
  1026		va_list args;
  1027	
  1028		va_start(args, namefmt);
  1029		worker = __kthread_create_worker_on_node(flags, node, namefmt, args);
  1030		va_end(args);
  1031	
  1032		if (worker)
  1033			wake_up_process(worker->task);
  1034	
  1035		return worker;
  1036	}
  1037	EXPORT_SYMBOL(kthread_create_worker_on_node);
  1038	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
