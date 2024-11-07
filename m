Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB15DD53F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Nov 2024 05:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730959020; cv=none; b=WjLwbO4+siq2RYqHs1/O3a+ZSCURx+WG7OqjnfAQO/WEmCBHRl9DyAdpN6CeJZmWtrecm5BBvkHMvsFY82i5wVPgwTzzleYLMjypVOWEV8mhRKJwVnwadPsITCFfvWmJCggAtrQUSZktXq+QAXmakOF3sLtGXRXQd9Ozz5zCu1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730959020; c=relaxed/simple;
	bh=J7dnyV13W4OwApHyL3j5jQnhzMQa//RLp8UVvG0lInM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dHK1h6ehv16fYnIFXwYCEMxrH/QECstfPddI21nQ2YaKkFO+AbJotynoVnc0Mkc3IeIOWUGKkhngLwJINoC+X+D/SsSnsDTmI1vMELaBC2aNwSy6Jzto8WnL838yi2G+gB8Y+n8LovAfV+yfTL2yZLAWYbGZQMUkE1sU7B/bpzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PP/hS+bO; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PP/hS+bO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730959019; x=1762495019;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J7dnyV13W4OwApHyL3j5jQnhzMQa//RLp8UVvG0lInM=;
  b=PP/hS+bO7i+/gz53btdwGxCYEmfXPW8QH/CvbaB1TEZfCvhvGZBdu13P
   M03aMCLAIcEaJU75MuK5Iu/ULO2H/pFJxH74Wz8u/giSSQLqjlkbyRjYR
   fy08iP+W98NTkiw21LRIncyJNXBHYzABoriEVlhgDNqH/Z5kOUwZ24tx3
   T5M6YzwsLLMCSNiPu7BsQwWDEosw9IbIGx+F+hGeDYilEHQmvHMY3Rk6N
   92xhzPz8A2MfQAiZaIOb8igl5yGvHe9tDJb0X2JRDxgQRUjk6a+DThTQQ
   Y7Yv2Qa1EY8rVXCqs8O/AEg9SGIKpCyDIsniNd8rEpqCY2+RJOLTLdq05
   w==;
X-CSE-ConnectionGUID: d7z+d1qORUKqsZJSXjycPA==
X-CSE-MsgGUID: z7p4X5zxRXiyNvvLVYtMfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30745592"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30745592"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 21:56:58 -0800
X-CSE-ConnectionGUID: m4nDevoQTaCwEPk2g/yARQ==
X-CSE-MsgGUID: FmqZaSqnQMie7lfC6Mi9UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="85271669"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 Nov 2024 21:56:57 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8vVn-000psA-0C;
	Thu, 07 Nov 2024 05:56:55 +0000
Date: Thu, 7 Nov 2024 13:56:13 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 5/5] net: Convert proto_ops::getname to
 sockaddr_storage
Message-ID: <202411071302.wR3Tacpo-lkp@intel.com>
References: <20241104222513.3469025-5-kees@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104222513.3469025-5-kees@kernel.org>

Hi Kees,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bluetooth-next/master]
[cannot apply to brauner-vfs/vfs.all trondmy-nfs/linux-next bluetooth/master linus/master v6.12-rc6 next-20241106]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kees-Cook/Revert-net-dev-Convert-sa_data-to-flexible-array-in-struct-sockaddr/20241105-062801
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
patch link:    https://lore.kernel.org/r/20241104222513.3469025-5-kees%40kernel.org
patch subject: [PATCH RFC 5/5] net: Convert proto_ops::getname to sockaddr_storage
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20241107/202411071302.wR3Tacpo-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411071302.wR3Tacpo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411071302.wR3Tacpo-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/iucv/af_iucv.c: In function 'iucv_sock_getname':
>> net/iucv/af_iucv.c:858:16: error: 'struct sockaddr_iucv' has no member named 'sa_family'; did you mean 'siucv_family'?
     858 |         siucv->sa_family = AF_IUCV;
         |                ^~~~~~~~~
         |                siucv_family


vim +858 net/iucv/af_iucv.c

   850	
   851	static int iucv_sock_getname(struct socket *sock,
   852				     struct sockaddr_storage *addr, int peer)
   853	{
   854		DECLARE_SOCKADDR(struct sockaddr_iucv *, siucv, addr);
   855		struct sock *sk = sock->sk;
   856		struct iucv_sock *iucv = iucv_sk(sk);
   857	
 > 858		siucv->sa_family = AF_IUCV;
   859	
   860		if (peer) {
   861			memcpy(siucv->siucv_user_id, iucv->dst_user_id, 8);
   862			memcpy(siucv->siucv_name, iucv->dst_name, 8);
   863		} else {
   864			memcpy(siucv->siucv_user_id, iucv->src_user_id, 8);
   865			memcpy(siucv->siucv_name, iucv->src_name, 8);
   866		}
   867		memset(&siucv->siucv_port, 0, sizeof(siucv->siucv_port));
   868		memset(&siucv->siucv_addr, 0, sizeof(siucv->siucv_addr));
   869		memset(&siucv->siucv_nodeid, 0, sizeof(siucv->siucv_nodeid));
   870	
   871		return sizeof(struct sockaddr_iucv);
   872	}
   873	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
