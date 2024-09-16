Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4A6DDA6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Sep 2024 02:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726453728; cv=none; b=sOJ68av9UjBI/ujlFwjpbhim/P4n6LPK2SEcUm6/cS0NOoedP0iC+5dFze4GSiu4/ShKvw3bzkrtzrl0LOSgk5BPqGLEzeKbueozH98x4RgxnXwrvAqmsP3FdPDbmk0OtW7HCMYftEI4B538JPWSA+nE2pKVi3FVo2gDT6nJC2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726453728; c=relaxed/simple;
	bh=I/r+2dO4vZd/4j+6zXmQNIqrAa4kZVKmp35l702+mqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YMn33s/jl2fz4f011xxDUGpAOJYnE+bvYPO/Pyf9yuvo5ihLybf420pbpoj+hXdG+CT94zVWIkAihqdjX6Q/9QElcMOTd02SOHfUzlkRJyJGhOqbcbwLHwIOoCsyQqmHfs2Bl31uHfIojE2IOvfW5V2rTHvsB8kCImEkoJDEXmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HxN/d8yr; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HxN/d8yr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726453727; x=1757989727;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I/r+2dO4vZd/4j+6zXmQNIqrAa4kZVKmp35l702+mqI=;
  b=HxN/d8yrz23uOoERuhnuT395dxjiClilZomKN3BajbMqMY+S8lSDwCQ9
   pbwhpBg/SIbFVUuO+7wK8dcLGJWSSZbRXqr7ZOx6PRYfhEA1AWkjTux7o
   Y4WOooWDjv57NpljuGmPpqvjwBi3R9wbw1SuP9jhFbhAYwWQdNLjU4O8G
   xpmhq60w5pe6g/Kgf87Hi2hiuKReXiEtEucAabbHJpRQJ/5IGDVKSH57G
   VXVznGPiI1+ZCYtrv0zXl3CaajCUFp8QtRTBFB/0o94QcWSzpAKPZ22zT
   Ar9nbZqBGBJtj8DWwvkjbKMt+aEpmQdezHo5W+aTEpjx4EeFEolZdEFJp
   A==;
X-CSE-ConnectionGUID: 6DMfFD1QQyWuZlQ4vteUeA==
X-CSE-MsgGUID: LBo9aJULScWLzC/CtQQF2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="36626671"
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="36626671"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 19:28:47 -0700
X-CSE-ConnectionGUID: WKrg9QONQJOVs7YtybOoEA==
X-CSE-MsgGUID: yBSokj3nStONIOilEvDjfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="73573296"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Sep 2024 19:28:45 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sq1Tm-0009FK-0u;
	Mon, 16 Sep 2024 02:28:42 +0000
Date: Mon, 16 Sep 2024 10:27:53 +0800
From: kernel test robot <lkp@intel.com>
To: NeilBrown <neilb@suse.de>, Chuck Lever III <chuck.lever@oracle.com>,
	Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH nfsd-next] SQUASH sunrpc: allow svc threads to fail
 initialisation cleanly
Message-ID: <202409161033.eurajfZc-lkp@intel.com>
References: <172644394073.17050.16376953609629336068@noble.neil.brown.name>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <172644394073.17050.16376953609629336068@noble.neil.brown.name>

Hi NeilBrown,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20240913]
[cannot apply to trondmy-nfs/linux-next v6.11 v6.11-rc7 v6.11-rc6 linus/master v6.11]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/NeilBrown/SQUASH-sunrpc-allow-svc-threads-to-fail-initialisation-cleanly/20240916-074739
base:   next-20240913
patch link:    https://lore.kernel.org/r/172644394073.17050.16376953609629336068%40noble.neil.brown.name
patch subject: [PATCH nfsd-next] SQUASH sunrpc: allow svc threads to fail initialisation cleanly
config: x86_64-rhel-8.3-bpf (https://download.01.org/0day-ci/archive/20240916/202409161033.eurajfZc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240916/202409161033.eurajfZc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409161033.eurajfZc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/sunrpc/svcsock.h:13,
                    from include/linux/sunrpc/bc_xprt.h:16,
                    from net/sunrpc/clnt.c:40:
   include/linux/sunrpc/svc.h: In function 'svc_thread_init_status':
>> include/linux/sunrpc/svc.h:333:9: error: implicit declaration of function 'smb_mb'; did you mean 'smp_mb'? [-Werror=implicit-function-declaration]
     333 |         smb_mb();
         |         ^~~~~~
         |         smp_mb
   cc1: some warnings being treated as errors


vim +333 include/linux/sunrpc/svc.h

   313	
   314	/**
   315	 * svc_thread_init_status - report whether thread has initialised successfully
   316	 * @rqstp: the thread in question
   317	 * @err: errno code
   318	 *
   319	 * After performing any initialisation that could fail, and before starting
   320	 * normal work, each sunrpc svc_thread must call svc_thread_init_status()
   321	 * with an appropriate error, or zero.
   322	 *
   323	 * If zero is passed, the thread is ready and must continue until
   324	 * svc_thread_should_stop() returns true.  If a non-zero error is passed
   325	 * the call will not return - the thread will exit.
   326	 */
   327	static inline void svc_thread_init_status(struct svc_rqst *rqstp, int err)
   328	{
   329		rqstp->rq_err = err;
   330		/* memory barrier ensures assignment to error above is visible before
   331		 * waitqueue_active() test below completes.
   332		 */
 > 333		smb_mb();
   334		wake_up_var(&rqstp->rq_err);
   335		if (err)
   336			kthread_exit(1);
   337	}
   338	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
