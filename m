Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487B32AD3D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Sep 2025 13:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758892606; cv=none; b=EncaYMWRCZThalwx6rDdk0w7dTqHBm98XMGBdUZYaf7RNwAHqXYDmZfjDyuK/BDjTb5pZkrlC09zvaAVDtNSHYillaHKhXl63cHJnzjwytBuQYtjQL1iu5XZ1G+yhu9QvQ+qB3H0KqooPm4oMhSD69c75LCitnzJoi5OoS1DkPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758892606; c=relaxed/simple;
	bh=WD5kGmpmbAGI9Yr9veAmjPmFnKEwVf2+z3l4WclmAuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rki3+MbwcGDa1imj0KHbJNgigaOJNSPRNJN107i5E9aKZYzZBGdnyWMTp+RPrtNZvgznNIKDOUEJBi8S1hgLCLHg4K0pdUwKgWnnuKlwudhV2V1sgshjdgMnZzPz1wp2wVJV6XrBF/09C+y4mjg9qNcLL4lm3lFKxskCMdfRlb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D6Gb8Lev; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D6Gb8Lev"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758892605; x=1790428605;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WD5kGmpmbAGI9Yr9veAmjPmFnKEwVf2+z3l4WclmAuE=;
  b=D6Gb8LevkflogwUhzSRF1gEdnmK5HQNSi3tFlLuFu4DgIRSHziMXPPqj
   yN1Gq/Zt1qAB55MndErCXW44ajSFp9NmwVBCrQRWxNuCa/Rhz+NCoToWS
   QpE7Inb0fNHjRYBSHmd9oG3LAukWyLQ7VGfkUnq7DZzKA5K1NF56MNmCx
   AR9WrSt3UimOO53Dkv6Pd+ttocZvTrhyxO8HoSQpcUYneukO86fhpRGYT
   5c63+AWtS0nC/X6a2xeecQ0uQLLv0x3oV5wt3PJr5nL5D3eUSbBlMloB4
   +PmRfp1EYWoy/IZ5qAbJAynVeKPiyKWKnXEpAwP8WZlGG9cCoZ/UzPCAq
   g==;
X-CSE-ConnectionGUID: P5qzsEYqQ+CRn8QfDPOt+A==
X-CSE-MsgGUID: f3LpCmO3R2OKULGoFtzKzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="72658343"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; 
   d="scan'208";a="72658343"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2025 06:16:44 -0700
X-CSE-ConnectionGUID: rpBFRPnQS2m9LvetXiZ/PA==
X-CSE-MsgGUID: gcNHxUonTs6HisNubbDAww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; 
   d="scan'208";a="177659790"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 26 Sep 2025 06:16:44 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v28JV-0006FZ-0U;
	Fri, 26 Sep 2025 13:16:41 +0000
Date: Fri, 26 Sep 2025 21:15:48 +0800
From: kernel test robot <lkp@intel.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/3] ksmbd: make ksmbd thread names distinct by client IP
Message-ID: <202509262002.LvF1IE3C-lkp@intel.com>
References: <20250925122118.11082-1-linkinjeon@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925122118.11082-1-linkinjeon@kernel.org>

Hi Namjae,

kernel test robot noticed the following build errors:

[auto build test ERROR on brauner-vfs/vfs.all]
[also build test ERROR on linus/master v6.17-rc7 next-20250925]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Namjae-Jeon/ksmbd-use-sock_create_kern-interface-to-create-kernel-socket/20250925-202722
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20250925122118.11082-1-linkinjeon%40kernel.org
patch subject: [PATCH 1/3] ksmbd: make ksmbd thread names distinct by client IP
config: sh-randconfig-001-20250926 (https://download.01.org/0day-ci/archive/20250926/202509262002.LvF1IE3C-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250926/202509262002.LvF1IE3C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509262002.LvF1IE3C-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/psi_types.h:5,
                    from include/linux/cgroup-defs.h:23,
                    from include/linux/cgroup.h:29,
                    from include/net/netprio_cgroup.h:11,
                    from include/linux/netdevice.h:42,
                    from include/net/sock.h:46,
                    from fs/smb/server/connection.h:11,
                    from fs/smb/server/transport_tcp.c:12:
   fs/smb/server/transport_tcp.c: In function 'ksmbd_tcp_new_connection':
>> fs/smb/server/transport_tcp.c:197:56: error: 'struct ksmbd_conn' has no member named 'inet6_addr'; did you mean 'inet_addr'?
     197 |                                 &KSMBD_TRANS(t)->conn->inet6_addr);
         |                                                        ^~~~~~~~~~
   include/linux/kthread.h:28:73: note: in definition of macro 'kthread_create'
      28 |         kthread_create_on_node(threadfn, data, NUMA_NO_NODE, namefmt, ##arg)
         |                                                                         ^~~
   fs/smb/server/transport_tcp.c:195:27: note: in expansion of macro 'kthread_run'
     195 |                 handler = kthread_run(ksmbd_conn_handler_loop,
         |                           ^~~~~~~~~~~


vim +197 fs/smb/server/transport_tcp.c

   172	
   173	/**
   174	 * ksmbd_tcp_new_connection() - create a new tcp session on mount
   175	 * @client_sk:	socket associated with new connection
   176	 *
   177	 * whenever a new connection is requested, create a conn thread
   178	 * (session thread) to handle new incoming smb requests from the connection
   179	 *
   180	 * Return:	0 on success, otherwise error
   181	 */
   182	static int ksmbd_tcp_new_connection(struct socket *client_sk)
   183	{
   184		int rc = 0;
   185		struct tcp_transport *t;
   186		struct task_struct *handler;
   187	
   188		t = alloc_transport(client_sk);
   189		if (!t) {
   190			sock_release(client_sk);
   191			return -ENOMEM;
   192		}
   193	
   194		if (client_sk->sk->sk_family == AF_INET6)
   195			handler = kthread_run(ksmbd_conn_handler_loop,
   196					KSMBD_TRANS(t)->conn, "ksmbd:%pI6c",
 > 197					&KSMBD_TRANS(t)->conn->inet6_addr);
   198		else
   199			handler = kthread_run(ksmbd_conn_handler_loop,
   200					KSMBD_TRANS(t)->conn, "ksmbd:%pI4",
   201					&KSMBD_TRANS(t)->conn->inet_addr);
   202		if (IS_ERR(handler)) {
   203			pr_err("cannot start conn thread\n");
   204			rc = PTR_ERR(handler);
   205			free_transport(t);
   206		}
   207		return rc;
   208	
   209		free_transport(t);
   210		return rc;
   211	}
   212	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
