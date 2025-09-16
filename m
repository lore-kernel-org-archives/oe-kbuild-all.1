Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED2A27EFE7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Sep 2025 21:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758059045; cv=none; b=iPrUBR4LVdAVjqenF3kFXVdqU35BiLMv9EcIQ5jf+u4N0wVT/WFKb+BK2cjLrMZLZwAO09H+mQ0OcCHwKC8cwN/whkCI6NboOsms4yVBuTwOdclEyde4sq5Tlk3MOo2ri3xr6LDq6nuXeGG6efIWpgk7AoGPdKjG+Bi/dDecSMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758059045; c=relaxed/simple;
	bh=325uxIZo4xjuXMpruB+I+cih2WZKBBOdSKcEGQ9tzPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GWuDh37j1kKK838xDEcV+4kXBRuZjpf7S6ivo365Zw1YPMHX7vUc5n8NNTh1rmntJ3SaJHuu7ZJuJ5AlLabhiyZRV2Mv5s2PeYA/Q6pifkjviykTRP/Fg2IHAYPavbhlhMoo3oZlxFFDgKRpH8xCpdXsXXm4vLKCBmKFp+XTwYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nfktN9sn; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nfktN9sn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758059043; x=1789595043;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=325uxIZo4xjuXMpruB+I+cih2WZKBBOdSKcEGQ9tzPQ=;
  b=nfktN9sn1gQUY7IEJFEUmf1LhQx9kNjW031Hl3/cjsZ+HZDU2OQd0lX7
   pfi1w/jt0fsxTlY0tlKcxxhzww7sbtf0JQR9a2UJTftZ4Qwok8eYJIuhG
   v0GJNxqJ1j2WYsnt+IM8n08KCXdaHzbDHKgeHC2ZgNc9iP9Rae21dORue
   dWE8gBPnsQ9bCw2kIE7wzlYZnhs84WIxDDvd/CWAErEjt7700HyiVa3xs
   E/Zd0XyBASIFZRNF9vyh0LJpbIE6cMJDv/6XZTCXckG0hSQ+It5eKLlXp
   C+6B3aYPkJbmL8debUbeQWmmM2FIy5/qt8S6VhTyYKVlSZlwFr2Q1kn62
   w==;
X-CSE-ConnectionGUID: lC5iBkbuSMO7W+LpempISQ==
X-CSE-MsgGUID: t8P86HxCRV+h10MBV/e4xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="77963719"
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; 
   d="scan'208";a="77963719"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 14:44:00 -0700
X-CSE-ConnectionGUID: GWW2G1SrTXSI13qHxknbZw==
X-CSE-MsgGUID: g+Haj3e9Sd2eovPuy8JIzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; 
   d="scan'208";a="175492305"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 16 Sep 2025 14:43:59 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uydSv-0000lb-0t;
	Tue, 16 Sep 2025 21:43:57 +0000
Date: Wed, 17 Sep 2025 05:43:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-lts 0/1] fs/eventpoll.c:2008: warning:
 Function parameter or member 'ep' not described in
 'ep_get_upwards_depth_proc'
Message-ID: <202509170546.k8vjYXnX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1-lts
head:   8c8937bc84545d6e04812fafa04bcf969f3a5cab
commit: 1b13b033062824495554e836a1ff5f85ccf6b039 [0/1] eventpoll: Fix semi-unbounded recursion
config: i386-buildonly-randconfig-001-20250917 (https://download.01.org/0day-ci/archive/20250917/202509170546.k8vjYXnX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250917/202509170546.k8vjYXnX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509170546.k8vjYXnX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/eventpoll.c:2008: warning: Function parameter or member 'ep' not described in 'ep_get_upwards_depth_proc'
>> fs/eventpoll.c:2008: warning: Function parameter or member 'depth' not described in 'ep_get_upwards_depth_proc'


vim +2008 fs/eventpoll.c

  2003	
  2004	/**
  2005	 * ep_get_upwards_depth_proc - determine depth of @ep when traversed upwards
  2006	 */
  2007	static int ep_get_upwards_depth_proc(struct eventpoll *ep, int depth)
> 2008	{
  2009		int result = 0;
  2010		struct epitem *epi;
  2011	
  2012		if (ep->gen == loop_check_gen)
  2013			return ep->loop_check_depth;
  2014		hlist_for_each_entry_rcu(epi, &ep->refs, fllink)
  2015			result = max(result, ep_get_upwards_depth_proc(epi->ep, depth + 1) + 1);
  2016		ep->gen = loop_check_gen;
  2017		ep->loop_check_depth = result;
  2018		return result;
  2019	}
  2020	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
