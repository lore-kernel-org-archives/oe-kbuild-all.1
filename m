Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BA53CEB84
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Aug 2026 08:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787818436; cv=none; b=Xu3t4zF1Qr7/bEBHDcH06aSMoZefMI7iWvWTOdExmwitAfF/2L3i7TTSo+eQO8tm+qylFLaumcMFK1tSNSCxt6sYXIqJUy75QBgygi6n2Hi8m5JTBF557YagdQkekHAaRxxiVjhaL32k6RIVSGMF37pWdm4GT7wYYuRA7eITcBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787818436; c=relaxed/simple;
	bh=cV9cx0MBO/JEtv6zOXgIrZG1pIzZhV7wMUh+pHxFXcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GGvCtNDDlaZiYM2y5rF43P1ukFCnb/zeA+tRQWqA8+LQ+wPyJh/r2klBiQWKesRHFEX2D4fiE2JTVe9odlDYolwL+dJZ/OZlmv5VSK5awTlLXh5zdXZwmEatLwmrsydmqSgpCUQ96byJrOaA/DQ+ZqCxjST6bkBh46TUTwaOctk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RNzgc0Ku; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RNzgc0Ku"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787818429; x=1819354429;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cV9cx0MBO/JEtv6zOXgIrZG1pIzZhV7wMUh+pHxFXcs=;
  b=RNzgc0KuYykoLfE3EiuOKMktnXdjrBLwDhqa90XahMmzzVZsOl6/yBvV
   5o5x2f83cXWsu3CmGdBaBlnA32CS9fBIPu+vQ4lWqkZJ/GSssnJnfrATt
   ujcOXhT7k/AXtXJrbuHKh6nI/9gwMa30DgxiqAAqm95vL5Bjp7g5yqCWc
   YNudlO1qAcFtRRE+c5dKE2BG4eZSTu37s9dO6b4ibZYoPorVKEpKWdn3q
   1fmQ0jQPRmDV66cGWg2Ap3ur697i7sVT3PDWgLWdAGoYy6tXJDNG0y9sZ
   hw7rsPRfhrB28v5xaWHlA+btrSc7B2ZEV1mQrTsszDrOskNhoH9forjZB
   w==;
X-CSE-ConnectionGUID: tymUqNCLTke0RolOhWZ+PQ==
X-CSE-MsgGUID: ge4ynkecTbKaX6ZfSv+GVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88191048"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88191048"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 01:13:40 -0700
X-CSE-ConnectionGUID: zFKQKmfSSAOV1iZKqq7VGA==
X-CSE-MsgGUID: bdFyUYYgS1KN5tFO+38JMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="269753352"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Aug 2026 01:13:38 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzVEt-0000000099J-06Ny;
	Thu, 27 Aug 2026 08:13:35 +0000
Date: Thu, 27 Aug 2026 16:13:25 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org, eric.dumazet@gmail.com,
	Eric Dumazet <edumazet@google.com>,
	syzbot+a5a07d2f6a71972dc5ed@syzkaller.appspotmail.com
Subject: Re: [PATCH net] igmp: convert struct ip_sf_list to RCU
Message-ID: <202608271655.mXCyurGJ-lkp@intel.com>
References: <20260826115913.3381537-1-edumazet@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826115913.3381537-1-edumazet@google.com>

Hi Eric,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Dumazet/igmp-convert-struct-ip_sf_list-to-RCU/20260826-115913
base:   net/main
patch link:    https://lore.kernel.org/r/20260826115913.3381537-1-edumazet%40google.com
patch subject: [PATCH net] igmp: convert struct ip_sf_list to RCU
config: i386-randconfig-062-20260827 (https://download.01.org/0day-ci/archive/20260827/202608271655.mXCyurGJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260827/202608271655.mXCyurGJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608271655.mXCyurGJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/ipv4/igmp.c: note: in included file (through include/linux/igmp.h):
   include/uapi/linux/igmp.h:60:32: sparse: sparse: array of flexible structures
>> net/ipv4/igmp.c:3114:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ip_sf_list *psf @@     got struct ip_sf_list [noderef] __rcu *sf_next @@
   net/ipv4/igmp.c:3114:13: sparse:     expected struct ip_sf_list *psf
   net/ipv4/igmp.c:3114:13: sparse:     got struct ip_sf_list [noderef] __rcu *sf_next
>> net/ipv4/igmp.c:3130:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ip_sf_list *psf @@     got struct ip_sf_list [noderef] __rcu *sources @@
   net/ipv4/igmp.c:3130:21: sparse:     expected struct ip_sf_list *psf
   net/ipv4/igmp.c:3130:21: sparse:     got struct ip_sf_list [noderef] __rcu *sources
   net/ipv4/igmp.c:3098:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ip_sf_list *psf @@     got struct ip_sf_list [noderef] __rcu *sources @@
   net/ipv4/igmp.c:3098:29: sparse:     expected struct ip_sf_list *psf
   net/ipv4/igmp.c:3098:29: sparse:     got struct ip_sf_list [noderef] __rcu *sources
   net/ipv4/igmp.c:3098:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ip_sf_list *psf @@     got struct ip_sf_list [noderef] __rcu *sources @@
   net/ipv4/igmp.c:3098:29: sparse:     expected struct ip_sf_list *psf
   net/ipv4/igmp.c:3098:29: sparse:     got struct ip_sf_list [noderef] __rcu *sources

vim +3114 net/ipv4/igmp.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  3109  
^1da177e4c3f41 Linus Torvalds 2005-04-16  3110  static struct ip_sf_list *igmp_mcf_get_next(struct seq_file *seq, struct ip_sf_list *psf)
^1da177e4c3f41 Linus Torvalds 2005-04-16  3111  {
^1da177e4c3f41 Linus Torvalds 2005-04-16  3112  	struct igmp_mcf_iter_state *state = igmp_mcf_seq_private(seq);
^1da177e4c3f41 Linus Torvalds 2005-04-16  3113  
^1da177e4c3f41 Linus Torvalds 2005-04-16 @3114  	psf = psf->sf_next;
^1da177e4c3f41 Linus Torvalds 2005-04-16  3115  	while (!psf) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  3116  		spin_unlock_bh(&state->im->lock);
^1da177e4c3f41 Linus Torvalds 2005-04-16  3117  		state->im = state->im->next;
^1da177e4c3f41 Linus Torvalds 2005-04-16  3118  		while (!state->im) {
6baff15037693c Eric Dumazet   2009-11-11  3119  			state->dev = next_net_device_rcu(state->dev);
^1da177e4c3f41 Linus Torvalds 2005-04-16  3120  			if (!state->dev) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  3121  				state->idev = NULL;
^1da177e4c3f41 Linus Torvalds 2005-04-16  3122  				goto out;
^1da177e4c3f41 Linus Torvalds 2005-04-16  3123  			}
6baff15037693c Eric Dumazet   2009-11-11  3124  			state->idev = __in_dev_get_rcu(state->dev);
^1da177e4c3f41 Linus Torvalds 2005-04-16  3125  			if (!state->idev)
^1da177e4c3f41 Linus Torvalds 2005-04-16  3126  				continue;
1d7138de878d1d Eric Dumazet   2010-11-12  3127  			state->im = rcu_dereference(state->idev->mc_list);
^1da177e4c3f41 Linus Torvalds 2005-04-16  3128  		}
^1da177e4c3f41 Linus Torvalds 2005-04-16  3129  		spin_lock_bh(&state->im->lock);
^1da177e4c3f41 Linus Torvalds 2005-04-16 @3130  		psf = state->im->sources;
^1da177e4c3f41 Linus Torvalds 2005-04-16  3131  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  3132  out:
^1da177e4c3f41 Linus Torvalds 2005-04-16  3133  	return psf;
^1da177e4c3f41 Linus Torvalds 2005-04-16  3134  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  3135  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
