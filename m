Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794601494;
	b=fbRawbD6wJTzDqFYm28GZqzzL37ka25xK8XAbPgPC4cB3IPcXi/4pCx6A4BksHOFynaa
	 MsRLmhPOCKjz3QdlaOubMiGV6Luh2UrfoYKJNokufTrlpg3ZLMN5Ax9232FM24VoQSvNU
	 SqtAnfOyCC/aFtLS51tACnfYH8jJrI8RWbVqP0SiqlAl4CG+GOQYRMDEgYwg+FTRP2KfZ
	 MX4E+OqP/9pQLbHz9F6enk20orGN5y/ZNGZIR0Tlk9sm9xTv9MAJMsi+bcLVL9vk6aJjt
	 6cJBgTeUUjtMGvam9GlS6z+V//HWWS7HxXkC1x10ZZ00xnCoyFf6c2CSd/ELkZqftdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601494;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=eKBRNtzbb7Z69zLTZ4UlKhDUfAO2sOzb9PsYXpGZTK0=;
	b=vEDyTNbe+HEZBXM5TP8I1R3Z4Xj0ojUJzZpt+ypt7Gca66e8G2WewV/VROooOCXLh8GJ
	 35XNZvGb6Lxdvx9GTOEjSUI/jd6X0WsTa0Ld3H6/F/ro5EV8vIZ64K8Qu2Ze1wcENcpG7
	 ZtX3roGQ/G+Ra0Mssk6uQuOBfXhs26FOxQYuIUkfg0cL/3Mt3YJIx7/cRRR4pkEoJea6j
	 wsAXBp+EJjGmdfv/XJrVbEModjLaq3sLgVYRPgSal3/BI8L2jnni/k53OCXc3Q7Qur9J/
	 Lbv6bUVTPeR9JETmPr2nzNXoKH3qZ2uWixs9ATN3TOBsPRcA/uLML3aowASYScKapxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MZpO7blI;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73213606A8A4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Nov 2026 20:24:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73213606A8A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MZpO7blI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794601492; x=1826137492;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JMz5IkWJYpkq1EyuruRoTH344Yn5jqb9N0DnmSyezfU=;
  b=MZpO7blIoMmBiQwh6lrfZoz4AWkanpaoEgVP9mcfAqbUET6f6EAGB5KR
   bPG4xgHvOMCj5H97q0QdPyTfbGPk7vogcV/P3v7OPfPCDSGq8/U1S4uSe
   /9sYqWQH6E7fWwl8q1D++EG8JskqjAe9+cpnsRJXdqyGZSCb+dj3LporY
   i/0/LBqy//9EPFkN9oqde2QxFyQZn0a1T0h1rx3msB1trv/AELsO2rJad
   xhnENWSY+BkPnKQqp78fY/PZ9oIBimwuw97FlNXNytZDl9anPpXcxNlpT
   9koy/zHgWQ13vAlFAbQagP0Py+dqJPrGd2hljdfVLAqCHsUwjbeTyQumc
   w==;
X-CSE-ConnectionGUID: KvWERza7ReChgM5ewpiwNw==
X-CSE-MsgGUID: 8/Y+xg0GRlat0iYVCCOEWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3433664"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3433664"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 12:24:52 -0800
X-CSE-ConnectionGUID: GHXQsf7tQeKilxX0mVi8OA==
X-CSE-MsgGUID: K5Rn8w8TTxymaULWs0Jlmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="10790688"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 13 Nov 2026 12:24:51 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRxpI-000000013uV-2Ago;
	Fri, 13 Nov 2026 20:24:48 +0000
Date: Sat, 14 Nov 2026 04:24:07 +0800
From: kernel test robot <lkp@intel.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	netfilter-devel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH nf,v7 4/6] netfilter: nfnetlink_queue: restrict NFQA_EXP
 to userspace helpers
Message-ID: <202611140435.f3WLpg95-lkp@intel.com>
References: <20261112221106.2278789-4-pablo@netfilter.org>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112221106.2278789-4-pablo@netfilter.org>

Hi Pablo,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on next-20261112]
[cannot apply to netfilter-nf/main nf-next/main v7.4-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pablo-Neira-Ayuso/netfilter-nfnetlink_queue-consolidate-access-to-hook-entries-on-reinjection/20261112-231102
base:   linus/master
patch link:    https://lore.kernel.org/r/20261112221106.2278789-4-pablo%40netfilter.org
patch subject: [PATCH nf,v7 4/6] netfilter: nfnetlink_queue: restrict NFQA_EXP to userspace helpers
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20261114/202611140435.f3WLpg95-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261114/202611140435.f3WLpg95-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611140435.f3WLpg95-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   net/netfilter/nfnetlink_queue.c: In function 'nfqnl_hook_exp_support':
>> net/netfilter/nfnetlink_queue.c:387:39: error: 'NF_HOOK_OP_CONNTRACK' undeclared (first use in this function)
     387 |         return (ops->hook_ops_type == NF_HOOK_OP_CONNTRACK &&
         |                                       ^~~~~~~~~~~~~~~~~~~~
   net/netfilter/nfnetlink_queue.c:387:39: note: each undeclared identifier is reported only once for each function it appears in
>> net/netfilter/nfnetlink_queue.c:394:1: warning: control reaches end of non-void function [-Wreturn-type]
     394 | }
         | ^


vim +/NF_HOOK_OP_CONNTRACK +387 net/netfilter/nfnetlink_queue.c

   383	
   384	#if IS_ENABLED(CONFIG_NF_CONNTRACK)
   385	static bool nfqnl_hook_exp_support(struct nf_hook_ops *ops)
   386	{
 > 387		return (ops->hook_ops_type == NF_HOOK_OP_CONNTRACK &&
   388			(((ops->pf == NFPROTO_IPV4 ||
   389			   ops->pf == NFPROTO_IPV6) &&
   390			  (ops->hooknum == NF_INET_LOCAL_IN ||
   391			   ops->hooknum == NF_INET_POST_ROUTING)) ||
   392			 (ops->pf == NFPROTO_BRIDGE &&
   393			  ops->hooknum == NF_BR_POST_ROUTING)));
 > 394	}
   395	#endif
   396	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
