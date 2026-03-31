Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AF03E5EE0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 17:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774979800; cv=none; b=QQhp6E/r286Ez4yC8WGG8GTUAXSSkxN10EH3O+cEw440lV7sh5NxeOnW6woL+03eZR+QDWUxroJFwYtQatDO3xxkxXCMpLiUUKiMeiNCy0y4UVNJlnIrUbP/iFajESvVAu7MZkg7zpqjZ/1ISNX8VHOzhLkaMJylKgAKNL3cPuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774979800; c=relaxed/simple;
	bh=DwkTCA5YmgJHm81msbMX/aBjsel/Wf5D82F5TzSEOqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NgB3A0Cyo792XovL/Gii/4A3AhP71KeOzgkyDxL7sQ6TAp0EjC/Czd/LRR7uKooHuFRRbOk/MjIlWWmD4wg180Xrd0gbMRJIG3J1X/n8w1SGzhw4wnbcFLMELHofm8kN6fWiG30sDPZqr1NHj+D/D+ndxAizMQ8z6V+uTiXrpZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mB30sL9j; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mB30sL9j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774979798; x=1806515798;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DwkTCA5YmgJHm81msbMX/aBjsel/Wf5D82F5TzSEOqY=;
  b=mB30sL9jHbg4MbQzikcryY3J9Rw76xEgWVzN2U2ywALa4Xx9yMWZbsf7
   M4as3lnpjhi8Qz7KD7Gx/Uy/4WMEVvEGEaZiS0RIAuWrUBL1DuNH2aAsx
   nqHe6vP2DP0Hbo9X1KHgU8GXfiziIltZuIE4/VegecOcF9WmupjGAxH6j
   w5f2KKcrqL16Dx1+MIEnSXinh5max2LBkJ2Dkzm5rypeMil+2ullvD2W5
   juq+zXpaP/BGCkJkbSUn0JmC2sOYrbfBDg2ZtUt84FdW3oilqcpsMM104
   +/DIG7jPfjJ/PkTD/oN9aRy4TCVfm1KrGhVgzov6Uqsd5IAAmksvLEble
   w==;
X-CSE-ConnectionGUID: zvs8U+VpRDGFnROzfjB+sA==
X-CSE-MsgGUID: EGzsgpDsSc+S8YPm5TX4EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="87078479"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="87078479"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 10:56:37 -0700
X-CSE-ConnectionGUID: TKI0kEJZTii6/2w99M5+yg==
X-CSE-MsgGUID: 7PbP8QNgS1SXzDQYsDBchw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="230501582"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 31 Mar 2026 10:56:33 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7dKI-00000000461-3IPB;
	Tue, 31 Mar 2026 17:56:30 +0000
Date: Wed, 1 Apr 2026 01:55:44 +0800
From: kernel test robot <lkp@intel.com>
To: Jordan Rife <jrife@google.com>, netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Jordan Rife <jrife@google.com>,
	bpf@vger.kernel.org,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Andrii Nakryiko <andrii@kernel.org>,
	Yusuke Suzuki <yusuke.suzuki@isovalent.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>
Subject: Re: [PATCH net-next v3 2/4] udp: Remove disconnected sockets from
 the 4-tuple hash
Message-ID: <202604010154.iewJbUya-lkp@intel.com>
References: <20260330215707.2374657-3-jrife@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330215707.2374657-3-jrife@google.com>

Hi Jordan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jordan-Rife/udp-Only-compare-daddr-dport-when-sk_state-TCP_ESTABLISHED/20260331-082300
base:   net-next/main
patch link:    https://lore.kernel.org/r/20260330215707.2374657-3-jrife%40google.com
patch subject: [PATCH net-next v3 2/4] udp: Remove disconnected sockets from the 4-tuple hash
config: sparc64-randconfig-r071-20260331 (https://download.01.org/0day-ci/archive/20260401/202604010154.iewJbUya-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604010154.iewJbUya-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604010154.iewJbUya-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/ipv4/udp.c: In function 'udp_disconnect_unhash4':
   net/ipv4/udp.c:2182:31: error: implicit declaration of function 'udp_get_table_prot'; did you mean 'vm_get_page_prot'? [-Werror=implicit-function-declaration]
     struct udp_table *udptable = udp_get_table_prot(sk);
                                  ^~~~~~~~~~~~~~~~~~
                                  vm_get_page_prot
>> net/ipv4/udp.c:2182:31: warning: initialization of 'struct udp_table *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   cc1: some warnings being treated as errors


vim +2182 net/ipv4/udp.c

  2179	
  2180	static int udp_disconnect_unhash4(struct sock *sk, int flags)
  2181	{
> 2182		struct udp_table *udptable = udp_get_table_prot(sk);
  2183	
  2184		udp_unhash4(udptable, sk);
  2185		__udp_disconnect(sk, flags);
  2186	
  2187		return 0;
  2188	}
  2189	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
