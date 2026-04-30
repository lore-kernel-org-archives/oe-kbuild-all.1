Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047142F84F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 04:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777522125; cv=none; b=N++aOTnM4QEi1hSPetFxitPowDWjjmjfFR/RYyxLD7wWOJjSmS+rGooZ/4DVljLYOQSpX7p8/k1xkmSHf4GlY3jypRkro0k2wrQZMQwm5zOlOKcodTpT8iZ+opTThNtOpx+CYoFNMo5xmmdmk5QUv1fUuqWQGs8LbgBSdpQynZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777522125; c=relaxed/simple;
	bh=3vodAGxGv7v9csp3ANmz5QgI5mL6m1EjmRlVUSN3/Wc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jCjPBrmQGgSspJtLsy/BTsFinAEKpkdXTfam1qCIHHhJfIKs3zUpahZteAYXJi8S5M1dNShN8IARQzhZrRn56w8HNqgRlItO1ljQSLJSa8y58/UfSQNLFmdj0Jq3iKh/dUJnKy539CXof2O15p1KV+U6SzWveSwYJAXgc2sccuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=amORS5h5; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="amORS5h5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777522123; x=1809058123;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3vodAGxGv7v9csp3ANmz5QgI5mL6m1EjmRlVUSN3/Wc=;
  b=amORS5h5vLBlX9lQxRC3At+yFUg+LwMVAHEa0K62guayDOU9j0h5U+O4
   M1htni8jpE3In8u3VWnaYlnkITVuNTfABKWK0kyIBsCSNDHZG/igBnQTi
   493JI4NvyyAqpgBIDEkM4KlbaAw3r1+5Gm9Y/lqhjFXqbv0c6fGS+rkWW
   GHsxE3O+47+MOOHddw/o0V6sgxuuKRe76iG/kOkOoncdIoCPjISrjFeEV
   yyDRzrBxkMqXs7X8ftk91fspEuthPuGUcglolLnh45ablBahTnpbB7LGl
   QAZ4PUTsVPqjbbjXefjqvBDIiVZXIaDbF9Q7B6rjJubKDEOWCR1onCXzp
   g==;
X-CSE-ConnectionGUID: XDDOJcYGQ1qknqf4U+ewgw==
X-CSE-MsgGUID: /yvE06QFTrWD32zJGqaNbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78568228"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="78568228"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 21:08:43 -0700
X-CSE-ConnectionGUID: lkl76AHER5WlSDDVYqQ4Wg==
X-CSE-MsgGUID: JPYFO7GLS6GM9zJf+FZG5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="238438414"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 29 Apr 2026 21:08:40 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIIhZ-00000000BvE-1V0B;
	Thu, 30 Apr 2026 04:08:37 +0000
Date: Thu, 30 Apr 2026 12:07:53 +0800
From: kernel test robot <lkp@intel.com>
To: SnailSploit | Kai Aizen <kai.aizen.dev@gmail.com>,
	netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, tipc-discussion@lists.sourceforge.net,
	jmaloy@redhat.com, ying.xue@windriver.com, kuba@kernel.org,
	pabeni@redhat.com, stable@vger.kernel.org,
	Kai Aizen <kai.aizen.dev@gmail.com>
Subject: Re: [PATCH] [PATCH net] tipc: fix UAF race in
 tipc_mon_peer_up/down/remove_peer vs bearer teardown
Message-ID: <202604301148.jfXKC9HF-lkp@intel.com>
References: <20260415061211.45530-1-95986478+SnailSploit@users.noreply.github.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415061211.45530-1-95986478+SnailSploit@users.noreply.github.com>

Hi SnailSploit,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/SnailSploit-Kai-Aizen/tipc-fix-UAF-race-in-tipc_mon_peer_up-down-remove_peer-vs-bearer-teardown/20260425-075205
base:   net/main
patch link:    https://lore.kernel.org/r/20260415061211.45530-1-95986478%2BSnailSploit%40users.noreply.github.com
patch subject: [PATCH] [PATCH net] tipc: fix UAF race in tipc_mon_peer_up/down/remove_peer vs bearer teardown
config: arc-randconfig-002-20260430 (https://download.01.org/0day-ci/archive/20260430/202604301148.jfXKC9HF-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301148.jfXKC9HF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604301148.jfXKC9HF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/tipc/monitor.c:112:29: warning: 'tipc_monitor_rtnl' defined but not used [-Wunused-function]
    static struct tipc_monitor *tipc_monitor_rtnl(struct net *net, int bearer_id)
                                ^~~~~~~~~~~~~~~~~


vim +/tipc_monitor_rtnl +112 net/tipc/monitor.c

   110	
   111	/* tipc_monitor_rtnl - dereference monitors[] from RTNL-held control path. */
 > 112	static struct tipc_monitor *tipc_monitor_rtnl(struct net *net, int bearer_id)
   113	{
   114		return rtnl_dereference(tipc_net(net)->monitors[bearer_id]);
   115	}
   116	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
