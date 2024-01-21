Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A380374CC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jan 2024 14:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705846878; cv=none; b=KzQymnbvsM0BrSoMSoz8obQz+j/BRDYUayYkX1gSmDK1JSOM7aIYJMp09dc0QhvsxDRNh/vC5DHYp7YzEBEnpPa0V4w2XBnkVdVq0/b2UV+dVvTrF7p1iav4X1jux0jh7bRFNvp4uTu5nAmnXzd23741ToD0RpzwZJOPpuVv9pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705846878; c=relaxed/simple;
	bh=ZhmDrU8TY4wYDBfKqSK1zhudtBUu9KCEydyYWMshKGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qR884vdqwtK1W7ZdQU5B9ieKmJhjphGeiRJD2nS7hhQbIeoYKmQlsim7JGQkOK8AFyOpmZtwut97R0Vn50bVmuWUQiJX+8XuAmVgjHHcRYeU2OitNqSKYPSG8dA9GKqKKNW/FMLBxrGhUIUBUkZHT2/DXo1ZQMi3y1TtCwQS/Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Etn0qr44; arc=none smtp.client-ip=192.55.52.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Etn0qr44"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705846875; x=1737382875;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZhmDrU8TY4wYDBfKqSK1zhudtBUu9KCEydyYWMshKGU=;
  b=Etn0qr44xtcDht6ioqY1s0eeO3FSVrDAdRGAq81SkWAv3mc3Ae3sxXQf
   OSre6U8YOfIpPaYhuiO7AyVNmWUB74z1WOioGHyAsVPrSfsstv7NcdzKu
   vWE8S1wQOcB8oVPqLBYY2fA72rU6Ts+w4lWZXvrcHxh/f51VOanJK7CX4
   tmrpWjYXKA3c7kIuKey0RKFHBbAXijVOLD3G3hOf/HWkU3KlO+mZU9fpQ
   ZBF8EKtQqXvxIUKdLZygSUPIUVcZXfiyewNH8pVsCBkQS9dCHUiNCH4uJ
   +NeKxDL3QwRqxISBPemCc6oC6+rO59afKVG3/T43ydPCYv89RJvOXK4CU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="400681939"
X-IronPort-AV: E=Sophos;i="6.05,210,1701158400"; 
   d="scan'208";a="400681939"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2024 06:21:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="928788849"
X-IronPort-AV: E=Sophos;i="6.05,210,1701158400"; 
   d="scan'208";a="928788849"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 21 Jan 2024 06:21:13 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRYhD-0005z4-1I;
	Sun, 21 Jan 2024 14:21:11 +0000
Date: Sun, 21 Jan 2024 22:21:10 +0800
From: kernel test robot <lkp@intel.com>
To: Joe Damato <jdamato@fastly.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 1/1] eventpoll: support busy poll per epoll instance
Message-ID: <202401212239.LAqIJgfm-lkp@intel.com>
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
kernel test robot noticed the following build warnings:

[auto build test WARNING on perf-tools-next/perf-tools-next]
[also build test WARNING on tip/perf/core perf-tools/perf-tools linus/master horms-ipvs/master acme/perf/core v6.7 next-20240119]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joe-Damato/eventpoll-support-busy-poll-per-epoll-instance/20240120-084514
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/20240120004247.42036-2-jdamato%40fastly.com
patch subject: [RFC 1/1] eventpoll: support busy poll per epoll instance
config: i386-buildonly-randconfig-001-20240121 (https://download.01.org/0day-ci/archive/20240121/202401212239.LAqIJgfm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240121/202401212239.LAqIJgfm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401212239.LAqIJgfm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/eventpoll.c:398: warning: Function parameter or member 'start_time' not described in 'busy_loop_ep_timeout'
>> fs/eventpoll.c:398: warning: Function parameter or member 'ep' not described in 'busy_loop_ep_timeout'


vim +398 fs/eventpoll.c

   391	
   392	/**
   393	 * busy_loop_ep_timeout - check if busy poll has timed out. The timeout value
   394	 * from the epoll instance ep is preferred, but if it is not set fallback to
   395	 * the system-wide global via busy_loop_timeout.
   396	 */
   397	static inline bool busy_loop_ep_timeout(unsigned long start_time, struct eventpoll *ep)
 > 398	{
   399	#ifdef CONFIG_NET_RX_BUSY_POLL
   400		unsigned long bp_usec = READ_ONCE(ep->busy_poll_usecs);
   401	
   402		if (bp_usec) {
   403			unsigned long end_time = start_time + bp_usec;
   404			unsigned long now = busy_loop_current_time();
   405	
   406			return time_after(now, end_time);
   407		} else {
   408			return busy_loop_timeout(start_time);
   409		}
   410	#endif
   411		return true;
   412	}
   413	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
