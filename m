Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8677B2DECC6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Dec 2025 01:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767145562; cv=none; b=GFjX8czWlAcMPIhP6QOT7nK0SMJwPn2rRC6IGPr4nLvXEfw2mkZtEl91vf9IMLgXL9rIEIhPjOqYiBA+GoDPgDD7FJPtoqQCxmD0DCcKP713rPePPw07aGh7h0ELX8uH+15fBzM1rQ+s2iM8jEQVkPb6EPatAzAz2uYl+dV6K50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767145562; c=relaxed/simple;
	bh=2N5dAwCHrJP253KdQJfzfeRpU40D0mUZsq2L8AwGkfk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RHf6C6ugwrXytaDvt79CI1YTRonggcdsdtPX8QZb1+pmw/liLThyLuCfBqoh9x9/JTz9lxWZgu2bTHik2NElJHlOYRVe5OQBxf5WaSiy9LYiNRyK2kWF2Y1PG2sJQLdWmP8y0VL1+xo5rmp9u+cJgf4ObDt3zxKfRxRqlLut26k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QMigfG2N; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QMigfG2N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767145561; x=1798681561;
  h=date:from:to:cc:subject:message-id;
  bh=2N5dAwCHrJP253KdQJfzfeRpU40D0mUZsq2L8AwGkfk=;
  b=QMigfG2NQgZdaBy+KHHO1Cm8+vmAwhcYwiRT/Tz33J6IbWQukAa8SFMp
   wEpQd9J0ruTIZGz5ObIOaLFHaQqZG/rYt3T2rrgImIpFRx115qGBld+f4
   eqeg0AG2xe64PWyl3crPzxOYqIjAz5hRxnYbEaMaNkv3vxJ9nnrCoUch6
   6FjKtbksQGrzX/zbRBq0pxSLS8+X9bG9WanBi6LH9gU0Ox+vzP5tcHyRI
   vvDt03tQuUMoh0UvRni8uS5ELtOj55wVmdiHumClK1Lmke4ii1hjVotQ9
   Lvn+0jXtTc6Vbdw+vJrGVbo3qT++h5/jJfxq1476YzAE9zxJqO7hFp2hX
   w==;
X-CSE-ConnectionGUID: w7ZLx6URQZKyCcQFNMa/4Q==
X-CSE-MsgGUID: afJy6FvBR7K0hAqCa9MNnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="79033081"
X-IronPort-AV: E=Sophos;i="6.21,190,1763452800"; 
   d="scan'208";a="79033081"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 17:46:00 -0800
X-CSE-ConnectionGUID: hrOTWPeeQPi++E/GRrCoow==
X-CSE-MsgGUID: u9Dei5nrRdOT0HusR3novQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,190,1763452800"; 
   d="scan'208";a="232423316"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 Dec 2025 17:45:59 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1valHg-000000000qH-2dzM;
	Wed, 31 Dec 2025 01:45:56 +0000
Date: Wed, 31 Dec 2025 09:45:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-2025-12 1/1]
 fs/eventpoll.c:2001: warning: Function parameter or member 'ep' not described
 in 'ep_get_upwards_depth_proc'
Message-ID: <202512310940.6DrnttMs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android13-5.15-2025-12
head:   66f18dc2099dba416cd26ec9bb386ce3a2748bad
commit: 71379495ab70eaba19224bd71b5b9b399eb85e04 [1/1] eventpoll: Fix semi-unbounded recursion
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20251231/202512310940.6DrnttMs-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251231/202512310940.6DrnttMs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512310940.6DrnttMs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/eventpoll.c:2001: warning: Function parameter or member 'ep' not described in 'ep_get_upwards_depth_proc'
>> fs/eventpoll.c:2001: warning: Function parameter or member 'depth' not described in 'ep_get_upwards_depth_proc'


vim +2001 fs/eventpoll.c

  1996	
  1997	/**
  1998	 * ep_get_upwards_depth_proc - determine depth of @ep when traversed upwards
  1999	 */
  2000	static int ep_get_upwards_depth_proc(struct eventpoll *ep, int depth)
> 2001	{
  2002		int result = 0;
  2003		struct epitem *epi;
  2004	
  2005		if (ep->gen == loop_check_gen)
  2006			return ep->loop_check_depth;
  2007		hlist_for_each_entry_rcu(epi, &ep->refs, fllink)
  2008			result = max(result, ep_get_upwards_depth_proc(epi->ep, depth + 1) + 1);
  2009		ep->gen = loop_check_gen;
  2010		ep->loop_check_depth = result;
  2011		return result;
  2012	}
  2013	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
