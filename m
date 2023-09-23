Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D427801
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Sep 2023 05:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695446390; x=1726982390;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mYy+SthwtxJSXyVNM51wNoCF29SrZk0RGXMAoftIFuI=;
  b=H77dnyYxzbzmnkmpliI/cTbhsHb1Y3SFkc3dtNxxn7cagAKZ83XlLfh6
   POQ4v+X403HWDJllHZrHqq6r1WIod5fRG2/qMVu68vl0t2Ap2u0YMyoxz
   pjSauKPjqwN7oK0UiigbvpsPNiiMOIHXRO1PiEVgEenUyGLeOXJdVUiJP
   Od6oT9IQ36VnIdZaLqNry7Y+VfpVddzR/by0A5WGlqaFlHfCYJg2Bz1ZE
   nt2+HXK34JiopCY+BZ5V8idN8US430XlGimxAkal4Rlb1SPrBVzSAwERj
   7bxcFwpa6t/SuoEj8KXD7xUUZXvvsuJTR0B4kFePoc5wYH4d7Fd4xFvYz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="447476174"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; 
   d="scan'208";a="447476174"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 22:19:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="724414448"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; 
   d="scan'208";a="724414448"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 22 Sep 2023 22:19:47 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjv3Q-0001oJ-2n;
	Sat, 23 Sep 2023 05:19:44 +0000
Date: Sat, 23 Sep 2023 13:19:40 +0800
From: kernel test robot <lkp@intel.com>
To: Aditi Ghag <aditi.ghag@isovalent.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Martin KaFai Lau <martin.lau@kernel.org>
Subject: net/core/filter.c:11748:17: error: no previous declaration for
 'bpf_sock_destroy'
Message-ID: <202309231356.dtDXiriR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Aditi,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d90b0276af8f25a0b8ae081a30d1b2a61263393b
commit: 4ddbcb886268af8d12a23e6640b39d1d9c652b1b bpf: Add bpf_sock_destroy kfunc
date:   4 months ago
config: x86_64-sof-customedconfig-avs-defconfig (https://download.01.org/0day-ci/archive/20230923/202309231356.dtDXiriR-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230923/202309231356.dtDXiriR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309231356.dtDXiriR-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/core/filter.c:11650:17: error: no previous declaration for 'bpf_dynptr_from_skb' [-Werror=missing-declarations]
    __bpf_kfunc int bpf_dynptr_from_skb(struct sk_buff *skb, u64 flags,
                    ^~~~~~~~~~~~~~~~~~~
   net/core/filter.c:11663:17: error: no previous declaration for 'bpf_dynptr_from_xdp' [-Werror=missing-declarations]
    __bpf_kfunc int bpf_dynptr_from_xdp(struct xdp_buff *xdp, u64 flags,
                    ^~~~~~~~~~~~~~~~~~~
>> net/core/filter.c:11748:17: error: no previous declaration for 'bpf_sock_destroy' [-Werror=missing-declarations]
    __bpf_kfunc int bpf_sock_destroy(struct sock_common *sock)
                    ^~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/bpf_sock_destroy +11748 net/core/filter.c

 11726	
 11727	/* Disables missing prototype warnings */
 11728	__diag_push();
 11729	__diag_ignore_all("-Wmissing-prototypes",
 11730			  "Global functions as their definitions will be in vmlinux BTF");
 11731	
 11732	/* bpf_sock_destroy: Destroy the given socket with ECONNABORTED error code.
 11733	 *
 11734	 * The function expects a non-NULL pointer to a socket, and invokes the
 11735	 * protocol specific socket destroy handlers.
 11736	 *
 11737	 * The helper can only be called from BPF contexts that have acquired the socket
 11738	 * locks.
 11739	 *
 11740	 * Parameters:
 11741	 * @sock: Pointer to socket to be destroyed
 11742	 *
 11743	 * Return:
 11744	 * On error, may return EPROTONOSUPPORT, EINVAL.
 11745	 * EPROTONOSUPPORT if protocol specific destroy handler is not supported.
 11746	 * 0 otherwise
 11747	 */
 11748	__bpf_kfunc int bpf_sock_destroy(struct sock_common *sock)
 11749	{
 11750		struct sock *sk = (struct sock *)sock;
 11751	
 11752		/* The locking semantics that allow for synchronous execution of the
 11753		 * destroy handlers are only supported for TCP and UDP.
 11754		 * Supporting protocols will need to acquire sock lock in the BPF context
 11755		 * prior to invoking this kfunc.
 11756		 */
 11757		if (!sk->sk_prot->diag_destroy || (sk->sk_protocol != IPPROTO_TCP &&
 11758						   sk->sk_protocol != IPPROTO_UDP))
 11759			return -EOPNOTSUPP;
 11760	
 11761		return sk->sk_prot->diag_destroy(sk, ECONNABORTED);
 11762	}
 11763	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
