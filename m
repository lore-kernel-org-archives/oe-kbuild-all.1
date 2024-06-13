Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0537E2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jun 2024 00:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718237601; cv=none; b=tFk+FCFNDzf3j/j67CGzB9n36SJJmWQqZsy7na9IDs+GYuqzAvGAFjaAt6W9tUNpAOjA3ZAy5tbILvbRnqvdT0H38Wor02nN0PWrMK+z5xLSDe6e1vZ/q/2dixM0ZnrRJ0QKytEbQMBQPNHP3YUQkd4dw+nEXG2utdw0fN9N5rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718237601; c=relaxed/simple;
	bh=YONbkpfprSsoCrbzA3qW12rO780rcKyd7DNaVu1zUWw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cLrvdVGeIDqxCeBBhpjHSr8SkxJyUaK+ykW8PgWBiu11iy1Z8wpMp15ZCaOvL+F0r9EpL1lCN1n/dyipcO137hHfaV8kzcqF0wRHEgQZkQ8MWpmmmmmY4jzIcw4YKnp5vmyPTc/QK1NVxPe8U6A/iqRGwY7e34U3E3VSNpRIEes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cR5z9i9a; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cR5z9i9a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718237599; x=1749773599;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YONbkpfprSsoCrbzA3qW12rO780rcKyd7DNaVu1zUWw=;
  b=cR5z9i9aCZ32ItIlFC2gZ8BTWYRaRz0fnOvxn2fubBnDvBatyaWoxzdS
   ++C2GPWpfDksW5Wf0Q7n2CoJ+MnOgVs1J7Sj0uDfGvnPtUWb6GKNhf4o2
   GA+8L94nyCC9KJylMyEXRpSeYELYff5AMLhBfqJf8OS5JR9Msj+juTqen
   zCH0Sj3BsQCd+FDAtI52/GELaBL4E4A3UK/pI6cmMHTPMZHdCOJjG3Kqj
   0rxzo8IZtviqjHEcs7goknaL0zL1tE3dtEAPKFmq2mSe+bJBnHuXjRArX
   w/xoe4QHUmsWSe8R2incHZPaX7Npsm2eyNG4dVxeSpl04ZKzuLxx3gqfj
   g==;
X-CSE-ConnectionGUID: h/z4SuPwQVOo1sckveHf/g==
X-CSE-MsgGUID: +ZBPvHLfShihNMhRsQxuTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14909315"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="14909315"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 17:13:19 -0700
X-CSE-ConnectionGUID: WP0+kh4JSC2HzVV4RFhQnQ==
X-CSE-MsgGUID: xUT0BJ1hTV2rJyviEecrrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="44403151"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 Jun 2024 17:13:18 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHY5c-00021y-1C;
	Thu, 13 Jun 2024 00:13:16 +0000
Date: Thu, 13 Jun 2024 08:12:57 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cel:nfsd-testing 10/10] net/sunrpc/sched.c:411:29: error: 'struct
 rpc_task' has no member named 'tk_pid'
Message-ID: <202406130853.GiZbVrnq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-testing
head:   322bb43cff91c5d5f74f7249adad9dc75fffa231
commit: 322bb43cff91c5d5f74f7249adad9dc75fffa231 [10/10] SUNRPC: Emit a trace event when a timeout occurs
config: openrisc-defconfig (https://download.01.org/0day-ci/archive/20240613/202406130853.GiZbVrnq-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240613/202406130853.GiZbVrnq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406130853.GiZbVrnq-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/sunrpc/sched.c: In function '__rpc_sleep_on_priority_timeout':
>> net/sunrpc/sched.c:411:29: error: 'struct rpc_task' has no member named 'tk_pid'
     411 |                         task->tk_pid,
         |                             ^~


vim +411 net/sunrpc/sched.c

   399	
   400	static void __rpc_sleep_on_priority_timeout(struct rpc_wait_queue *q,
   401			struct rpc_task *task, unsigned long timeout,
   402			unsigned char queue_priority)
   403	{
   404		if (WARN_ON_ONCE(RPC_IS_QUEUED(task)))
   405			return;
   406		if (time_is_after_jiffies(timeout)) {
   407			__rpc_do_sleep_on_priority(q, task, queue_priority);
   408			__rpc_add_timer(q, task, timeout);
   409		} else {
   410			trace_printk("task:%08x@%08x timed out\n",
 > 411				task->tk_pid,
   412				task->tk_client ?  task->tk_client->cl_clid : -1);
   413			task->tk_status = -ETIMEDOUT;
   414		}
   415	}
   416	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
