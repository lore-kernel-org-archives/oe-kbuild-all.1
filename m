Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3522D1C7610
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Nov 2024 16:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730479677; cv=none; b=KIw9wlWkqklYYapKyTiDuvcr+PvsGogkUTsNs4nJl7yZ/hKDFtzGZCDV4A+NlotWDI8UPL0cm6/mhwOHsYbWl702sR2VPVsSrB140Gte+LL9adavPgwARbjB1ixFyA//YA+coQaDfq5s5+1CosUQKlab5nIJu7KnROzhHguaJCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730479677; c=relaxed/simple;
	bh=c30YaQPddMCtY3eMn/oxC9HA5IhddbuJLVvAjHWP6PU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qclVmXh4YAGfosZ8G+VceIes8ZOdlw87YQFGKVA0Z3mvVkroKUJ95jS9sSFe9e8deLDBQIOucOKXkzH8sr5uEPjFy8Bhl/rieTpp6Kk1AZ/kj83HPWsUX8/OWWELBMqDISlhW1fTnQU/vD59Wo+NV4MmpZ1yBELG6H1QEr4H0hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iQPdMFiP; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iQPdMFiP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730479675; x=1762015675;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c30YaQPddMCtY3eMn/oxC9HA5IhddbuJLVvAjHWP6PU=;
  b=iQPdMFiPjSlG0WWhsp0GhFd3rFA3I4tXJ0XKbUOJ9kzmjVcv9G7qpAXD
   OZQL58malAb/PqGHb+ABnYMkqAadjxO9hPWItKZcFJOVhEURDvWzJRxXJ
   rlHKnbX6PhEkS5qmayIQ0oduQzgiW/QtUp9GIVw96OiQVA33a/yWXqqjH
   C7U8749XP6cgIK+B/eNrCI+9lA3MELW8ge0klIJYd08jhbQ2wgCdnp0xa
   6iGuW04M7/0+s+hAcZrfVkRDu1RhU7gVanuzapPgiS7NdGmPwuPNUKTgt
   0UMkv4iBp2uru5Z70uATs5N7LKM9w0JgX2avCXJH9JGVvN19MNK4OO/KG
   g==;
X-CSE-ConnectionGUID: a3jHSKUHQM+drk4zWtiNiw==
X-CSE-MsgGUID: zt3ezSi9QaCkCSqQxH6/Zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="17879853"
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; 
   d="scan'208";a="17879853"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 09:47:54 -0700
X-CSE-ConnectionGUID: Wb4b81CGR52YZm+RfTJnng==
X-CSE-MsgGUID: 9VLLpQbcQImSyWUjk/L+ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; 
   d="scan'208";a="82892635"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 Nov 2024 09:47:49 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6uoN-000hmF-0u;
	Fri, 01 Nov 2024 16:47:47 +0000
Date: Sat, 2 Nov 2024 00:47:32 +0800
From: kernel test robot <lkp@intel.com>
To: Philo Lu <lulie@linux.alibaba.com>, netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, willemdebruijn.kernel@gmail.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, dsahern@kernel.org, horms@kernel.org,
	antony.antony@secunet.com, steffen.klassert@secunet.com,
	linux-kernel@vger.kernel.org, dust.li@linux.alibaba.com,
	jakub@cloudflare.com, fred.cc@alibaba-inc.com,
	yubing.qiuyubing@alibaba-inc.com
Subject: Re: [PATCH v6 net-next 4/4] ipv6/udp: Add 4-tuple hash for connected
 socket
Message-ID: <202411020025.8DrAkT2l-lkp@intel.com>
References: <20241031124550.20227-5-lulie@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031124550.20227-5-lulie@linux.alibaba.com>

Hi Philo,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Philo-Lu/net-udp-Add-a-new-struct-for-hash2-slot/20241031-204729
base:   net-next/main
patch link:    https://lore.kernel.org/r/20241031124550.20227-5-lulie%40linux.alibaba.com
patch subject: [PATCH v6 net-next 4/4] ipv6/udp: Add 4-tuple hash for connected socket
config: i386-randconfig-141-20241101 (https://download.01.org/0day-ci/archive/20241102/202411020025.8DrAkT2l-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241102/202411020025.8DrAkT2l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411020025.8DrAkT2l-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/ipv6/udp.c: In function 'udp_v6_rehash':
>> net/ipv6/udp.c:116:29: error: implicit declaration of function 'udp_ehashfn'; did you mean 'udp6_ehashfn'? [-Werror=implicit-function-declaration]
     116 |                 new_hash4 = udp_ehashfn(sock_net(sk), sk->sk_rcv_saddr, sk->sk_num,
         |                             ^~~~~~~~~~~
         |                             udp6_ehashfn
   cc1: some warnings being treated as errors


vim +116 net/ipv6/udp.c

   107	
   108	void udp_v6_rehash(struct sock *sk)
   109	{
   110		u16 new_hash = ipv6_portaddr_hash(sock_net(sk),
   111						  &sk->sk_v6_rcv_saddr,
   112						  inet_sk(sk)->inet_num);
   113		u16 new_hash4;
   114	
   115		if (ipv6_addr_v4mapped(&sk->sk_v6_rcv_saddr)) {
 > 116			new_hash4 = udp_ehashfn(sock_net(sk), sk->sk_rcv_saddr, sk->sk_num,
   117						sk->sk_daddr, sk->sk_dport);
   118		} else {
   119			new_hash4 = udp6_ehashfn(sock_net(sk), &sk->sk_v6_rcv_saddr, sk->sk_num,
   120						 &sk->sk_v6_daddr, sk->sk_dport);
   121		}
   122	
   123		udp_lib_rehash(sk, new_hash, new_hash4);
   124	}
   125	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
