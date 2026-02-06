Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE3523C8A0
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Feb 2026 23:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770421074; cv=none; b=H6SrldutiMv43EJvLQ09Ht03G1Ez0CoafKlChsJjmI91cIbuOUYLAm1BxHA38FoyNtroCDJX+m6t3RKjC2TWcj2UCsLa39AyOE6KiC0/Ni6GqdHKlGc2fs5mpF+Z74GTGLUYUYgfClw1fUEiJ9GENeuJQb9r/o8BiYNmMErJDls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770421074; c=relaxed/simple;
	bh=isOYdIvd6zZQP17E1pyU1M2/Fw1Ax66MUjSh61ztUkY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H8PIglxNPoq53GzqZ/9GQnsS24jITPCjOoAq4xP2qVVLe30MEMFBL0Rv2ODNx1z900mMklVM0ZqILp1bX7l6fSZLdh2jt86UWETD04YmrTtDC6Pp/WZIaAs0LiwZacLmj04UuUtomaAfjbeWS+V12u0b8nCpgNhz4wxuXLpmxvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oj2G08mw; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oj2G08mw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770421074; x=1801957074;
  h=date:from:to:cc:subject:message-id;
  bh=isOYdIvd6zZQP17E1pyU1M2/Fw1Ax66MUjSh61ztUkY=;
  b=Oj2G08mw5a0tf+CIfhViZPvjAws7dYkPryr86EngCId8B5rAlLgau66Q
   2mup9C5rHzU43pauwlqxHJzyUKZybxMg/NBSnIcQAJu1GCC7ABgnpn2sW
   mkYn6mJZ3rNanM69Ag4gJkc1g3uuEROWiOZ/ujqzY527kPjqji9/nX2uV
   HUtOixcIqUYASDs8FvK/vkoLtVrwEnSlSa8Mi9B6gwRiNln61lNy355jm
   Af37n+Z85KSE8U0AXgbhxcB6oZ6ntRBg+1kw4rsrrV/V8T+y0H/2Et5cY
   DDX3Q1Y/qCL++/HBBx7Mpw2f7+IkVjGGjXhyy3WcnW2fXYdABH5MdQSwR
   Q==;
X-CSE-ConnectionGUID: W6JtBJWHQeS6zemA8NmjPw==
X-CSE-MsgGUID: yiEKruIjQq6XzjO8oB41uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="82744876"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="82744876"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 15:37:54 -0800
X-CSE-ConnectionGUID: kifW2YHlRT2eGvTjNhgZlA==
X-CSE-MsgGUID: CpExK9RgTWG8cMq6339Obg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="215978511"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 06 Feb 2026 15:37:53 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voVOY-000000004kD-2UUT;
	Fri, 06 Feb 2026 23:37:50 +0000
Date: Sat, 07 Feb 2026 00:37:14 +0100
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:exportd-netlink 2/3] fs/nfsd/nfsctl.c:2270:40:
 error: 'exportd_nl_family' undeclared; did you mean 'nfsd_nl_family'?
Message-ID: <202602070057.GG6uf0W3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git exportd-netlink
head:   aef82be579c01a1995f0e0c98313f23e7e4893a0
commit: c282986480c6eb27e2330e62a435fdba93b42f32 [2/3] nfsd: register new netlink family for exportd
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260207/202602070057.GG6uf0W3-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602070057.GG6uf0W3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602070057.GG6uf0W3-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/nfsd/nfsctl.c: In function 'init_nfsd':
>> fs/nfsd/nfsctl.c:2270:40: error: 'exportd_nl_family' undeclared (first use in this function); did you mean 'nfsd_nl_family'?
    2270 |         retval = genl_register_family(&exportd_nl_family);
         |                                        ^~~~~~~~~~~~~~~~~
         |                                        nfsd_nl_family
   fs/nfsd/nfsctl.c:2270:40: note: each undeclared identifier is reported only once for each function it appears in
   fs/nfsd/nfsctl.c: In function 'exit_nfsd':
   fs/nfsd/nfsctl.c:2306:33: error: 'exportd_nl_family' undeclared (first use in this function); did you mean 'nfsd_nl_family'?
    2306 |         genl_unregister_family(&exportd_nl_family);
         |                                 ^~~~~~~~~~~~~~~~~
         |                                 nfsd_nl_family


vim +2270 fs/nfsd/nfsctl.c

  2238	
  2239	static int __init init_nfsd(void)
  2240	{
  2241		int retval;
  2242	
  2243		nfsd_debugfs_init();
  2244	
  2245		retval = nfsd4_init_slabs();
  2246		if (retval)
  2247			return retval;
  2248		retval = nfsd4_init_pnfs();
  2249		if (retval)
  2250			goto out_free_slabs;
  2251		retval = nfsd_drc_slab_create();
  2252		if (retval)
  2253			goto out_free_pnfs;
  2254		nfsd_lockd_init();	/* lockd->nfsd callbacks */
  2255		retval = register_pernet_subsys(&nfsd_net_ops);
  2256		if (retval < 0)
  2257			goto out_free_lockd;
  2258		retval = register_cld_notifier();
  2259		if (retval)
  2260			goto out_free_subsys;
  2261		retval = nfsd4_create_laundry_wq();
  2262		if (retval)
  2263			goto out_free_cld;
  2264		retval = register_filesystem(&nfsd_fs_type);
  2265		if (retval)
  2266			goto out_free_nfsd4;
  2267		retval = genl_register_family(&nfsd_nl_family);
  2268		if (retval)
  2269			goto out_free_filesystem;
> 2270		retval = genl_register_family(&exportd_nl_family);
  2271		if (retval)
  2272			goto out_free_nfsd_nl;
  2273		retval = create_proc_exports_entry();
  2274		if (retval)
  2275			goto out_free_all;
  2276		nfsd_localio_ops_init();
  2277	
  2278		return 0;
  2279	out_free_all:
  2280		genl_unregister_family(&exportd_nl_family);
  2281	out_free_nfsd_nl:
  2282		genl_unregister_family(&nfsd_nl_family);
  2283	out_free_filesystem:
  2284		unregister_filesystem(&nfsd_fs_type);
  2285	out_free_nfsd4:
  2286		nfsd4_destroy_laundry_wq();
  2287	out_free_cld:
  2288		unregister_cld_notifier();
  2289	out_free_subsys:
  2290		unregister_pernet_subsys(&nfsd_net_ops);
  2291	out_free_lockd:
  2292		nfsd_lockd_shutdown();
  2293		nfsd_drc_slab_free();
  2294	out_free_pnfs:
  2295		nfsd4_exit_pnfs();
  2296	out_free_slabs:
  2297		nfsd4_free_slabs();
  2298		nfsd_debugfs_exit();
  2299		return retval;
  2300	}
  2301	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
