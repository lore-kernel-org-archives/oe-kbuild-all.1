Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1672628C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jan 2024 14:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705848197; cv=none; b=sT7ZVAcW4F712uqWqf7Qty1xxkWOKcbRMy0ZvvPPs1SNlajjtCXmq9lxb6tPeQYA7VM9vHnV+cKnsprHo6dzTYbQ8+6wJr/qFsAKsyMW0rNLwc/kLT9ozDEMBx/Az+e8FBlYPzF9WH4Kdfh60n3/brNY6IvOGTilNggiAMfHhdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705848197; c=relaxed/simple;
	bh=7VDHsEZpK+MmM6tLrFTO4IHiKR1DZwtgCc/ti55vJd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CjOBrPPSMhV9rnBVL03C8vvgPX5S2HfOS6LGtzqoBRjvy5lIG2IRHUb7LiCWfc+ymQJUR4o7gOr70VM1yaLC8++MPehcxzLC8AaaoVrodo/GQoJJWO4OQqfq4OFaydF1q4aWfYplHdMb9oBZm28mermpRuHgaJIEKgLTf0jmDNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JPEFcg8w; arc=none smtp.client-ip=134.134.136.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JPEFcg8w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705848195; x=1737384195;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7VDHsEZpK+MmM6tLrFTO4IHiKR1DZwtgCc/ti55vJd8=;
  b=JPEFcg8wkw2t+GnYVZ/F07a6jKReFQIRTsdepw3NZdYxJygE6DVopiGE
   LL5FyAK99jpM1xc+kGEwNYR/CW/hO6G+gbCiDxMx1yA8oHm6BB9cwDFIE
   VJQj/+2BfEBktr7pJdJ/Q4EryssLIIOouYMVl7wH6hB6Ru7Kyol755aY/
   UT8AOhcyoBdXVbem5Vr/nurjgqAe7/iP3OUjXRsq1AOmq17GTpoANMHNE
   OHaw/t00EUTki6NdQkPRI/MOagi0WdbZVwZ9axjYk+T9ITJkg0aFTRLQQ
   8Ikt5TSP9PV9GlDvOqTCxeUn+DNkkp8KxeTIql5QTUes0cjlDnsKQUxgV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="465299170"
X-IronPort-AV: E=Sophos;i="6.05,210,1701158400"; 
   d="scan'208";a="465299170"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2024 06:43:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="855734986"
X-IronPort-AV: E=Sophos;i="6.05,210,1701158400"; 
   d="scan'208";a="855734986"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 21 Jan 2024 06:43:13 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRZ2V-0005zS-1o;
	Sun, 21 Jan 2024 14:43:11 +0000
Date: Sun, 21 Jan 2024 22:42:20 +0800
From: kernel test robot <lkp@intel.com>
To: Joe Damato <jdamato@fastly.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 1/1] eventpoll: support busy poll per epoll instance
Message-ID: <202401212215.zDl6deZY-lkp@intel.com>
References: <20240120004247.42036-2-jdamato@fastly.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240120004247.42036-2-jdamato@fastly.com>

Hi Joe,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on perf-tools-next/perf-tools-next]
[also build test ERROR on tip/perf/core perf-tools/perf-tools linus/master horms-ipvs/master acme/perf/core v6.7 next-20240119]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joe-Damato/eventpoll-support-busy-poll-per-epoll-instance/20240120-084514
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/20240120004247.42036-2-jdamato%40fastly.com
patch subject: [RFC 1/1] eventpoll: support busy poll per epoll instance
config: i386-buildonly-randconfig-003-20240121 (https://download.01.org/0day-ci/archive/20240121/202401212215.zDl6deZY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240121/202401212215.zDl6deZY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401212215.zDl6deZY-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/eventpoll.c: In function 'eventpoll_fcntl':
>> fs/eventpoll.c:973:27: warning: variable 'ep' set but not used [-Wunused-but-set-variable]
     973 |         struct eventpoll *ep;
         |                           ^~
   fs/eventpoll.c: In function 'do_epoll_create':
>> fs/eventpoll.c:2123:11: error: 'struct eventpoll' has no member named 'busy_poll_usecs'
    2123 |         ep->busy_poll_usecs = 0;
         |           ^~


vim +2123 fs/eventpoll.c

  2086	
  2087	/*
  2088	 * Open an eventpoll file descriptor.
  2089	 */
  2090	static int do_epoll_create(int flags)
  2091	{
  2092		int error, fd;
  2093		struct eventpoll *ep = NULL;
  2094		struct file *file;
  2095	
  2096		/* Check the EPOLL_* constant for consistency.  */
  2097		BUILD_BUG_ON(EPOLL_CLOEXEC != O_CLOEXEC);
  2098	
  2099		if (flags & ~EPOLL_CLOEXEC)
  2100			return -EINVAL;
  2101		/*
  2102		 * Create the internal data structure ("struct eventpoll").
  2103		 */
  2104		error = ep_alloc(&ep);
  2105		if (error < 0)
  2106			return error;
  2107		/*
  2108		 * Creates all the items needed to setup an eventpoll file. That is,
  2109		 * a file structure and a free file descriptor.
  2110		 */
  2111		fd = get_unused_fd_flags(O_RDWR | (flags & O_CLOEXEC));
  2112		if (fd < 0) {
  2113			error = fd;
  2114			goto out_free_ep;
  2115		}
  2116		file = anon_inode_getfile("[eventpoll]", &eventpoll_fops, ep,
  2117					 O_RDWR | (flags & O_CLOEXEC));
  2118		if (IS_ERR(file)) {
  2119			error = PTR_ERR(file);
  2120			goto out_free_fd;
  2121		}
  2122	#ifndef CONFIG_NET_RX_BUSY_POLL
> 2123		ep->busy_poll_usecs = 0;
  2124	#endif
  2125		ep->file = file;
  2126		fd_install(fd, file);
  2127		return fd;
  2128	
  2129	out_free_fd:
  2130		put_unused_fd(fd);
  2131	out_free_ep:
  2132		ep_clear_and_put(ep);
  2133		return error;
  2134	}
  2135	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
