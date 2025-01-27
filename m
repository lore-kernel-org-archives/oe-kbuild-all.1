Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2DE1FC7D0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Jan 2025 10:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737972167; cv=none; b=gJ196IeNeRUllacxYFwg8+zTh9SGl+SozvMCdWZrJPQuTvVv3zpIm7ag/69D6dCkX2V3y+QM4vtUppkgYm9mDE+OI8u5xn75yDxBfJVG6bHcH0yWZaNAeM7OQLUz1eXgnKrINeJ6PqFn8k7KvmVqvlTlDVgonlcZ9sny+c91p8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737972167; c=relaxed/simple;
	bh=ojzciehKJgxLDaCkmMZZd5M6Smo+H9obbUzIC4aI/JI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lttFQ5Ffp3ZysnT2tO7jMgoDHr9pWxwMIKrNEpSBXXhsywApe2pHJmC26FtJRRjcmhANu18oqlmxi69wbRxrWksvzxeQ1QfGRlmOOK7EA8JxwLqsWBAspckDOsSrH0ccwIXk7ZcbiAwRDlW+Z0B7xdDMPraNTLofZIQUTpshkAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c7kTgA4u; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c7kTgA4u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737972166; x=1769508166;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ojzciehKJgxLDaCkmMZZd5M6Smo+H9obbUzIC4aI/JI=;
  b=c7kTgA4uMce/k7RF5HESM/0os/CslQXmI9dJ0yO1vp8FmQO+s5dbUZGn
   H4ZPGKKwzy6vIFCRIbxY2lWqZAY/ZMr0D7AO68Wk/Yo7A5CDub6nQeaRy
   j2Ox2fOKT8VgbHCmtJCs8Eru1pj0VjmbKUjhgJQXblR7JUScOsVqVbii2
   dS6qaiOFI4kGk5UrvK8ZNZSakSpIp1lfQ/ZM8SGYVoOO7riH2o1+xNkd5
   wDWLbFBYQ55o3su7/qlZAF17BUS/HIOydpeNdwHUiW4gPYWHRxBrwvOs7
   3KpXwHSR09vwgz5D7z2Q6k9d7GeO30hYkQN23DAxZQd+0RA9GdCSUQzCl
   g==;
X-CSE-ConnectionGUID: jzlcKqVMROGKlzUD6SsQcg==
X-CSE-MsgGUID: 9eSQbSgfRWKrtZmO9BLZOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="38315824"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; 
   d="scan'208";a="38315824"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 02:02:46 -0800
X-CSE-ConnectionGUID: XXLnOF3UTjaa7Mkb2gH5og==
X-CSE-MsgGUID: +cg4wt0ZS8+/CcKGkgwmoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="145612378"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 27 Jan 2025 02:02:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcLx3-000gdc-2w;
	Mon, 27 Jan 2025 10:02:41 +0000
Date: Mon, 27 Jan 2025 18:02:32 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20250124 17/17]
 kernel/bpf/core.c:2510:29: warning: comparison of distinct pointer types
 lacks a cast
Message-ID: <202501271741.8GtpDMsG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20250124
head:   9fcf89847632bd963953b2f945fb3ce2277f1f97
commit: 54447c8c7cc239e559f3b58a7a70d9b776ed9b03 [17/17] treewide_some: fix multiple -Wfamnae warnings that must be audited separately
config: arm-randconfig-001-20250127 (https://download.01.org/0day-ci/archive/20250127/202501271741.8GtpDMsG-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250127/202501271741.8GtpDMsG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501271741.8GtpDMsG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/net/scm.h:13,
                    from include/linux/netlink.h:9,
                    from include/uapi/linux/neighbour.h:6,
                    from include/linux/netdevice.h:44,
                    from include/linux/if_vlan.h:10,
                    from include/linux/filter.h:21,
                    from kernel/bpf/core.c:21:
   include/net/compat.h:33:33: error: field 'rt_dst' has incomplete type
      33 |         struct sockaddr_legacy  rt_dst;         /* target address               */
         |                                 ^~~~~~
   include/net/compat.h:34:33: error: field 'rt_gateway' has incomplete type
      34 |         struct sockaddr_legacy  rt_gateway;     /* gateway addr (RTF_GATEWAY)   */
         |                                 ^~~~~~~~~~
   include/net/compat.h:35:33: error: field 'rt_genmask' has incomplete type
      35 |         struct sockaddr_legacy  rt_genmask;     /* target network mask (IP)     */
         |                                 ^~~~~~~~~~
   kernel/bpf/core.c: In function 'bpf_prog_array_free_sleepable':
>> kernel/bpf/core.c:2510:29: warning: comparison of distinct pointer types lacks a cast [-Wcompare-distinct-pointer-types]
    2510 |         if (!progs || progs == &bpf_empty_prog_array.hdr)
         |                             ^~


vim +2510 kernel/bpf/core.c

8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2507  
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2508  void bpf_prog_array_free_sleepable(struct bpf_prog_array *progs)
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2509  {
8c7dcb84e3b744 Delyan Kratunov 2022-06-14 @2510  	if (!progs || progs == &bpf_empty_prog_array.hdr)
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2511  		return;
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2512  	call_rcu_tasks_trace(&progs->rcu, __bpf_prog_array_free_sleepable_cb);
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2513  }
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2514  

:::::: The code at line 2510 was first introduced by commit
:::::: 8c7dcb84e3b744b2b70baa7a44a9b1881c33a9c9 bpf: implement sleepable uprobes by chaining gps

:::::: TO: Delyan Kratunov <delyank@fb.com>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
