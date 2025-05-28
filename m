Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBBF267B7F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 May 2025 00:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748476809; cv=none; b=SRhn1Wht8eSg7hcr6MeAWmKaf0kWAWDsKpKM4EzvwWuZi/PTAJg114J2SyJILqwox8YI+n8r3837IfHlwGFgOgHjoHbq6O2prSTSCstOURhmMNBs1n8md6YUKQrO2sv2Mk4KeMdUyrbjHwoFT67Zxx1DM1hy2i5fxVL5hhUhwSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748476809; c=relaxed/simple;
	bh=OLbTANma5UBUqXpEHxqhgSZEIUPoSlb/9w0gpkqkNKM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f9Gv0zzBOZY6X/IeNKz1+VcDzzj0+ShALbOT3o9W0ZJsRR53lBmReZHkaGmY1wh/Pa1faqZ+Rpzw/qW24/V794LiFJSPZ9SkYcMrmEI8A1xLmHGVG7KoSI2kTBuMA3wPBhDgFBfmGxH5jMAOKQsvCznXGfgpu9/EjnWUwlOpscE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mvv2eZ6m; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mvv2eZ6m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748476808; x=1780012808;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OLbTANma5UBUqXpEHxqhgSZEIUPoSlb/9w0gpkqkNKM=;
  b=mvv2eZ6mfVHdtys0dJU2jjv+fPnYYvq/iDcsMxFrpYOHfPpzWWiVGl08
   JMjRtyT/C+N7aYkTmDft5qXGeCmTip3ejwCgiY64ZTtXl6UICjDx5+TR6
   SdVhQdovezbxoOc8Uv3MC1jO3/3P5nibgmQBYJXsmdMuPf3eSNcXYqX+7
   jtMCey+DIVOdb29MCNshycHRK7N+MX+Hyt4xlywL7e+ttjEbsKPYOW1EU
   /oR60/NqWdPx3vKOYoJ3aSJEZNgK1XwAz1oL5UtQHThIxofmfMNR6qrcq
   BAjljrTE4WW8cy+fWODfLa5Ze7g5F2m4onRAa2rdxH7ifAQvoemnXxN5R
   A==;
X-CSE-ConnectionGUID: z8yzvAJESlm5+N+rKSdrBA==
X-CSE-MsgGUID: IEEd84CaSbmSaj7tBgfYKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="61577729"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="61577729"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 17:00:07 -0700
X-CSE-ConnectionGUID: OjgYRfGkSwq0ci7T66prGQ==
X-CSE-MsgGUID: CNuKltauSR+CTJJR6/SkDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="143372262"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 May 2025 17:00:05 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKQgl-000WAk-0J;
	Thu, 29 May 2025 00:00:03 +0000
Date: Thu, 29 May 2025 07:59:24 +0800
From: kernel test robot <lkp@intel.com>
To: Martin KaFai Lau <martin.lau@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Martin KaFai Lau <martin.lau@linux.dev>
Subject: [martin-lau-bpf-next:sk_storage.inline.v1 1/1]
 net/core/sock.c:2163:39: error: 'struct_sock' undeclared; did you mean
 'struct_size'?
Message-ID: <202505290713.mU15qzZf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/martin.lau/bpf-next.git sk_storage.inline.v1
head:   5b7437eee884fb452d5e1eaeefc648cccb39e0ef
commit: 5b7437eee884fb452d5e1eaeefc648cccb39e0ef [1/1] [DONT PUSH]: WIP bpf local storage reserve
config: sh-randconfig-002-20250529 (https://download.01.org/0day-ci/archive/20250529/202505290713.mU15qzZf-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250529/202505290713.mU15qzZf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505290713.mU15qzZf-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/core/sock.c: In function 'sk_prot_alloc':
>> net/core/sock.c:2163:39: error: 'struct_sock' undeclared (first use in this function); did you mean 'struct_size'?
    2163 | #define sk_from_reserve(sk_reserve) ((struct_sock *)(sk_reserve))
         |                                       ^~~~~~~~~~~
   net/core/sock.c:2214:45: note: in expansion of macro 'sk_from_reserve'
    2214 |                         sk_prot_clear_nulls(sk_from_reserve(sk_reserve), prot->obj_size);
         |                                             ^~~~~~~~~~~~~~~
   net/core/sock.c:2163:39: note: each undeclared identifier is reported only once for each function it appears in
    2163 | #define sk_from_reserve(sk_reserve) ((struct_sock *)(sk_reserve))
         |                                       ^~~~~~~~~~~
   net/core/sock.c:2214:45: note: in expansion of macro 'sk_from_reserve'
    2214 |                         sk_prot_clear_nulls(sk_from_reserve(sk_reserve), prot->obj_size);
         |                                             ^~~~~~~~~~~~~~~
>> net/core/sock.c:2163:52: error: expected expression before ')' token
    2163 | #define sk_from_reserve(sk_reserve) ((struct_sock *)(sk_reserve))
         |                                                    ^
   net/core/sock.c:2214:45: note: in expansion of macro 'sk_from_reserve'
    2214 |                         sk_prot_clear_nulls(sk_from_reserve(sk_reserve), prot->obj_size);
         |                                             ^~~~~~~~~~~~~~~
>> net/core/sock.c:2163:52: error: expected expression before ')' token
    2163 | #define sk_from_reserve(sk_reserve) ((struct_sock *)(sk_reserve))
         |                                                    ^
   net/core/sock.c:2221:14: note: in expansion of macro 'sk_from_reserve'
    2221 |         sk = sk_from_reserve(sk_reserve);
         |              ^~~~~~~~~~~~~~~


vim +2163 net/core/sock.c

  2151	
  2152	#ifdef CONFIG_BPF_SYSCALL
  2153	#define sk_reserved_size(obj_size) ((obj_size) + bpf_sk_reserve)
  2154	#define sk_from_reserve(sk_reserve) ((struct sock *)((void*)(sk_reserve) + bpf_sk_reserve))
  2155	#define sk_reserve(sk) ((void *)(sk) - bpf_sk_reserve)
  2156	#define sk_reserve_init(sk)						\
  2157		({								\
  2158			if (unlikely(bpf_sk_reserve))				\
  2159				memset(sk_reserve(sk), 0, bpf_sk_reserve);	\
  2160		})
  2161	#else
  2162	#define sk_reserved_size(obj_size) (obj_size)
> 2163	#define sk_from_reserve(sk_reserve) ((struct_sock *)(sk_reserve))
  2164	#define sk_reserve(sk) ((void *)(sk))
  2165	#define sk_reserve_init(sk)
  2166	#endif
  2167	
  2168	/*
  2169	 * Copy all fields from osk to nsk but nsk->sk_refcnt must not change yet,
  2170	 * even temporarily, because of RCU lookups. sk_node should also be left as is.
  2171	 * We must not copy fields between sk_dontcopy_begin and sk_dontcopy_end
  2172	 */
  2173	static void sock_copy(struct sock *nsk, const struct sock *osk)
  2174	{
  2175		const struct proto *prot = READ_ONCE(osk->sk_prot);
  2176	#ifdef CONFIG_SECURITY_NETWORK
  2177		void *sptr = nsk->sk_security;
  2178	#endif
  2179	
  2180		/* If we move sk_tx_queue_mapping out of the private section,
  2181		 * we must check if sk_tx_queue_clear() is called after
  2182		 * sock_copy() in sk_clone_lock().
  2183		 */
  2184		BUILD_BUG_ON(offsetof(struct sock, sk_tx_queue_mapping) <
  2185			     offsetof(struct sock, sk_dontcopy_begin) ||
  2186			     offsetof(struct sock, sk_tx_queue_mapping) >=
  2187			     offsetof(struct sock, sk_dontcopy_end));
  2188	
  2189		memcpy(nsk, osk, offsetof(struct sock, sk_dontcopy_begin));
  2190	
  2191		unsafe_memcpy(&nsk->sk_dontcopy_end, &osk->sk_dontcopy_end,
  2192			      prot->obj_size - offsetof(struct sock, sk_dontcopy_end),
  2193			      /* alloc is larger than struct, see sk_prot_alloc() */);
  2194	
  2195	#ifdef CONFIG_SECURITY_NETWORK
  2196		nsk->sk_security = sptr;
  2197		security_sk_clone(osk, nsk);
  2198	#endif
  2199	}
  2200	
  2201	static struct sock *sk_prot_alloc(struct proto *prot, gfp_t priority,
  2202			int family)
  2203	{
  2204		struct sock *sk;
  2205		struct kmem_cache *slab;
  2206		void *sk_reserve;
  2207	
  2208		slab = prot->slab;
  2209		if (slab != NULL) {
  2210			sk_reserve = kmem_cache_alloc(slab, priority & ~__GFP_ZERO);
  2211			if (!sk_reserve)
  2212				return NULL;
  2213			if (want_init_on_alloc(priority))
> 2214				sk_prot_clear_nulls(sk_from_reserve(sk_reserve), prot->obj_size);
  2215		} else
  2216			sk_reserve = kmalloc(prot->obj_size, priority);
  2217	
  2218		if (!sk_reserve)
  2219			return NULL;
  2220	
  2221		sk = sk_from_reserve(sk_reserve);
  2222		if (security_sk_alloc(sk, family, priority))
  2223			goto out_free;
  2224	
  2225		if (!try_module_get(prot->owner))
  2226			goto out_free_sec;
  2227	
  2228		sk_reserve_init(sk);
  2229	
  2230		return sk;
  2231	
  2232	out_free_sec:
  2233		security_sk_free(sk);
  2234	out_free:
  2235		if (slab != NULL)
  2236			kmem_cache_free(slab, sk_reserve);
  2237		else
  2238			kfree(sk_reserve);
  2239		return NULL;
  2240	}
  2241	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
