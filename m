Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA57DBA42
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jun 2024 03:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718076123; cv=none; b=iZ32WcfDCdhCxeXkQcfXypiFyNlhIYtQPPWXH/PaTAcVHc1e7sqpohW6kCEv1AJkKqQmSw9+Y8v5vu/ecvDlEbU8tS6Akd2YJbkesNWKtqMD1B9vj736qpPD9gyvFj80v2UHxQCjOBpsaZ6cDRLB2CX8V9obbOppTg1H1W8NVKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718076123; c=relaxed/simple;
	bh=bwGH7qSN/vdSXZiabrMrg19Spk+xhuq4OUS0RVT9r6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CI9tiP/YXM7OiS5VV8g31OXvbCwYfgOM+uUL7a/ffncTA3ZUXIRUUDMX05AP3K8lbi7caaeU44WURE4smfjim4NLUfYqDmX+c4eFtGGLnHwihz/1u197rgHjnzxV5j8CgczQIrLYEHOAdTbx9lefyEpE5CBhQYqLkZjdox9JBdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IKbc4Tau; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IKbc4Tau"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718076121; x=1749612121;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bwGH7qSN/vdSXZiabrMrg19Spk+xhuq4OUS0RVT9r6Y=;
  b=IKbc4Tau+HRRlmkAlsizgk+XAYuOojjapcmZFdtj3M9fpmXMzCxltogk
   fV5IKYEsCEba8melng2qX562eO7Qi+xBeBxB1LxHu45XM32+/o7s8gAlc
   Iu8aVADW2lpile0eo/FEOmVo8lCHMLPYK3YwdAsAcCm8Ya+6WMjIu4z1Q
   CLL6mOf5sCNTYBm+9dmYnLe6VhtsUcM0LoqiWUuVcnRKluucp8NEn9tBf
   kp3owaY/z8JpMX+lScE6jOTOMtsSp5eXvPGf4MGAfEPUmhnJO421y1m0d
   j08dnkpCdP9ODE861V5F2f4LNdk6LC2zV5pkmXDJNNj6HLdAzFmXrWry+
   g==;
X-CSE-ConnectionGUID: a6gnLJ7qQ7CPuIFRgL1/Zw==
X-CSE-MsgGUID: KP6iKxhuQn2lpj0CJGnGdg==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="25341644"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="25341644"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 20:22:01 -0700
X-CSE-ConnectionGUID: L0EOsYSXRY+yWilbS29EAg==
X-CSE-MsgGUID: c+ftaUO3QIeVOd6PWM168Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="39380571"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Jun 2024 20:21:59 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGs56-0002k9-39;
	Tue, 11 Jun 2024 03:21:56 +0000
Date: Tue, 11 Jun 2024 11:21:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:mgtime 7/11] fs/inode.c:2630:9: error: too few arguments to
 function 'trace_ctime_inode_update'
Message-ID: <202406111151.jO5B93pU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git mgtime
head:   be51a9b4d34b1383cf39064988562665bed1b954
commit: 748dc0feb518a69ac526fedfc5436478d68320d3 [7/11] fs: add tracepoints around multigrain timestamp changes
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20240611/202406111151.jO5B93pU-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240611/202406111151.jO5B93pU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406111151.jO5B93pU-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/inode.c: In function 'inode_set_ctime_current':
>> fs/inode.c:2618:49: warning: passing argument 2 of 'trace_ctime_floor_update' makes pointer from integer without a cast [-Wint-conversion]
    2618 |                 trace_ctime_floor_update(inode, floor, now, old);
         |                                                 ^~~~~
         |                                                 |
         |                                                 ktime_t {aka long long int}
   In file included from include/trace/events/writeback.h:8,
                    from fs/inode.c:24:
   include/trace/events/timestamp.h:13:27: note: expected 'ktime_t *' {aka 'long long int *'} but argument is of type 'ktime_t' {aka 'long long int'}
      13 |                  ktime_t *old,
         |                  ~~~~~~~~~^~~
   include/linux/tracepoint.h:357:41: note: in definition of macro '__DECLARE_TRACE'
     357 |         static inline void trace_##name(proto)                          \
         |                                         ^~~~~
   include/linux/tracepoint.h:434:31: note: in expansion of macro 'PARAMS'
     434 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                               ^~~~~~
   include/linux/tracepoint.h:568:9: note: in expansion of macro 'DECLARE_TRACE'
     568 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:568:29: note: in expansion of macro 'PARAMS'
     568 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                             ^~~~~~
   include/trace/events/timestamp.h:11:1: note: in expansion of macro 'TRACE_EVENT'
      11 | TRACE_EVENT(ctime_floor_update,
         | ^~~~~~~~~~~
   include/trace/events/timestamp.h:12:9: note: in expansion of macro 'TP_PROTO'
      12 |         TP_PROTO(struct inode *inode,
         |         ^~~~~~~~
   fs/inode.c:2618:56: warning: passing argument 3 of 'trace_ctime_floor_update' makes pointer from integer without a cast [-Wint-conversion]
    2618 |                 trace_ctime_floor_update(inode, floor, now, old);
         |                                                        ^~~
         |                                                        |
         |                                                        ktime_t {aka long long int}
   include/trace/events/timestamp.h:14:27: note: expected 'ktime_t *' {aka 'long long int *'} but argument is of type 'ktime_t' {aka 'long long int'}
      14 |                  ktime_t *new,
         |                  ~~~~~~~~~^~~
   include/linux/tracepoint.h:357:41: note: in definition of macro '__DECLARE_TRACE'
     357 |         static inline void trace_##name(proto)                          \
         |                                         ^~~~~
   include/linux/tracepoint.h:434:31: note: in expansion of macro 'PARAMS'
     434 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                               ^~~~~~
   include/linux/tracepoint.h:568:9: note: in expansion of macro 'DECLARE_TRACE'
     568 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:568:29: note: in expansion of macro 'PARAMS'
     568 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                             ^~~~~~
   include/trace/events/timestamp.h:11:1: note: in expansion of macro 'TRACE_EVENT'
      11 | TRACE_EVENT(ctime_floor_update,
         | ^~~~~~~~~~~
   include/trace/events/timestamp.h:12:9: note: in expansion of macro 'TP_PROTO'
      12 |         TP_PROTO(struct inode *inode,
         |         ^~~~~~~~
   fs/inode.c:2618:61: warning: passing argument 4 of 'trace_ctime_floor_update' makes pointer from integer without a cast [-Wint-conversion]
    2618 |                 trace_ctime_floor_update(inode, floor, now, old);
         |                                                             ^~~
         |                                                             |
         |                                                             ktime_t {aka long long int}
   include/trace/events/timestamp.h:15:27: note: expected 'ktime_t *' {aka 'long long int *'} but argument is of type 'ktime_t' {aka 'long long int'}
      15 |                  ktime_t *cur),
         |                  ~~~~~~~~~^~~
   include/linux/tracepoint.h:357:41: note: in definition of macro '__DECLARE_TRACE'
     357 |         static inline void trace_##name(proto)                          \
         |                                         ^~~~~
   include/linux/tracepoint.h:434:31: note: in expansion of macro 'PARAMS'
     434 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                               ^~~~~~
   include/linux/tracepoint.h:568:9: note: in expansion of macro 'DECLARE_TRACE'
     568 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:568:29: note: in expansion of macro 'PARAMS'
     568 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                             ^~~~~~
   include/trace/events/timestamp.h:11:1: note: in expansion of macro 'TRACE_EVENT'
      11 | TRACE_EVENT(ctime_floor_update,
         | ^~~~~~~~~~~
   include/trace/events/timestamp.h:12:9: note: in expansion of macro 'TP_PROTO'
      12 |         TP_PROTO(struct inode *inode,
         |         ^~~~~~~~
>> fs/inode.c:2630:9: error: too few arguments to function 'trace_ctime_inode_update'
    2630 |         trace_ctime_inode_update(inode, ctime, sav, now);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:357:28: note: declared here
     357 |         static inline void trace_##name(proto)                          \
         |                            ^~~~~~
   include/linux/tracepoint.h:434:9: note: in expansion of macro '__DECLARE_TRACE'
     434 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:568:9: note: in expansion of macro 'DECLARE_TRACE'
     568 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/trace/events/timestamp.h:47:1: note: in expansion of macro 'TRACE_EVENT'
      47 | TRACE_EVENT(ctime_inode_update,
         | ^~~~~~~~~~~


vim +/trace_ctime_inode_update +2630 fs/inode.c

  2573	
  2574	/**
  2575	 * inode_set_ctime_current - set the ctime to current_time
  2576	 * @inode: inode
  2577	 *
  2578	 * Set the inode->i_ctime to the current value for the inode. Returns
  2579	 * the current value that was assigned to i_ctime. If this is a not
  2580	 * multigrain inode, then we just set it to whatever the coarse time is.
  2581	 *
  2582	 * If it is multigrain, then we first see if the coarse-grained
  2583	 * timestamp is distinct from what we have. If so, then we'll just use
  2584	 * that. If we have to get a fine-grained timestamp, then do so, and
  2585	 * try to swap it into the floor. We accept the new floor value
  2586	 * regardless of the outcome of the cmpxchg. After that, we try to
  2587	 * swap the new value into __i_ctime. Again, we take the resulting
  2588	 * ctime, regardless of the outcome of the swap.
  2589	 */
  2590	struct timespec64 inode_set_ctime_current(struct inode *inode)
  2591	{
  2592		ktime_t ctime, now, sav, floor = smp_load_acquire(&ctime_floor);
  2593	
  2594		now = coarse_ctime(floor);
  2595	
  2596		/* Just return that if this is not a multigrain fs */
  2597		if (!is_mgtime(inode)) {
  2598			inode->__i_ctime = now;
  2599			goto out;
  2600		}
  2601	
  2602		/*
  2603		 * We only need a fine-grained time if someone has queried it,
  2604		 * and the current coarse grained time isn't later than what's
  2605		 * already there.
  2606		 */
  2607		ctime = smp_load_acquire(&inode->__i_ctime);
  2608		if ((ctime & I_CTIME_QUERIED) && !ktime_after(now, ctime & ~I_CTIME_QUERIED)) {
  2609			ktime_t old, now = ktime_get_real() & ~I_CTIME_QUERIED;
  2610	
  2611			/*
  2612			 * If the cmpxchg works, we take the new floor value. If
  2613			 * not, then that means that someone else changed it after we
  2614			 * fetched it but before we got here. That value is just
  2615			 * as good, so keep it.
  2616			 */
  2617			old = cmpxchg(&ctime_floor, floor, now);
> 2618			trace_ctime_floor_update(inode, floor, now, old);
  2619			if (old != floor)
  2620				now = old;
  2621		}
  2622	
  2623		/*
  2624		 * Swap the ctime into place. If it has changed in the interim,
  2625		 * then we'll just take whatever the current value is under the
  2626		 * assumption that it's new enough.
  2627		 */
  2628		sav = now;
  2629		now = cmpxchg(&inode->__i_ctime, ctime, sav);
> 2630		trace_ctime_inode_update(inode, ctime, sav, now);
  2631		if (now == ctime)
  2632			now = sav;
  2633	out:
  2634		return timestamp_truncate(ktime_to_timespec64(now), inode);
  2635	}
  2636	EXPORT_SYMBOL(inode_set_ctime_current);
  2637	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
