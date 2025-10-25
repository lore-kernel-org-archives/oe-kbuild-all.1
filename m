Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA2B72612
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Oct 2025 05:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761368952; cv=none; b=L9x80sa2G5IcUayfPSn0A2WQtQhKOh5KoZzx3HK821feFxt+6og6jrAbB8S6QQqpAfs23b4Fjldoq2Oe4m4u7wJrVtsqx52QMgT14ai0HjDcQdndg3Q8nKb8Kir6A90jArdq1pqqtFBNLRvIM8oBk3wCQRHwZuzVjn4X1b1uKVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761368952; c=relaxed/simple;
	bh=xfoBBF2hXLA2ztDeZRcZgCLpbn2ba873CfzgzCfsKeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GX1M19ud6cxTt+x7+rZ3Kz6tvhCxD16KF0YOI2ERDQss6NHV5qHIKFdLO182XP9MSgZ5hmXzQw3kb57IhZv0V2lfdl4UDQd828bGQxZVbNMGm4olFXxURqNrQ3b02NjSWRO4f7spM+1J+FJ6HWYJN2998ejmwBRTmwsq/JIE15A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MI6floSB; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MI6floSB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761368950; x=1792904950;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xfoBBF2hXLA2ztDeZRcZgCLpbn2ba873CfzgzCfsKeE=;
  b=MI6floSB4jx/0w68xCIsosXh9m8U/mcVtxcmRSsEJIlmVqvy7YlJk+11
   V05LjmqvyJOsO1lKWjun5V2ReN1M3GzWv0/pYUQp0OlGj6V7Da+AyUA3a
   Svken34umY/FXOqf2QT6pUZ/CsxxuCVq2GnPN6mYED5lvUBJrIZ/rTIjs
   7VoUAb4WbWxof6svxeZ8ncvsMoIMVSDArCsdGyKM/pUcke7NrPrKu1oiA
   6IU1sOHxH4xfHlYwmjGRDfyWRcj4BXq/nf9arDu0Yf+SG9fVxeCpBsblA
   rVYz7NejCS1ahzMQBe6AyCADan645P0S9SOU0SMVwg3C895Lkn9LMuljh
   Q==;
X-CSE-ConnectionGUID: dWDrIukzS9OJ2bKwKuYxZA==
X-CSE-MsgGUID: CsHDsj41TlK4YpqF3IPQrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63243354"
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; 
   d="scan'208";a="63243354"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 22:09:09 -0700
X-CSE-ConnectionGUID: 4PfE22H+S2qD8NdYqdPnIg==
X-CSE-MsgGUID: 4CbRZXrqSyWMhZc7Hl1Lzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; 
   d="scan'208";a="215496136"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 24 Oct 2025 22:09:08 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCWWY-000F7h-07;
	Sat, 25 Oct 2025 05:09:06 +0000
Date: Sat, 25 Oct 2025 13:08:53 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Markuze <amarkuze@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 5/5] ceph: Activate BLOG logging
Message-ID: <202510251256.eh8qnDln-lkp@intel.com>
References: <20251024084259.2359693-6-amarkuze@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024084259.2359693-6-amarkuze@redhat.com>

Hi Alex,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-nonmm-unstable]
[also build test ERROR on tip/sched/core linus/master v6.18-rc2 next-20251024]
[cannot apply to ceph-client/testing ceph-client/for-linus]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Markuze/sched-fork-Wire-BLOG-contexts-into-task-lifecycle/20251024-164832
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/20251024084259.2359693-6-amarkuze%40redhat.com
patch subject: [RFC PATCH 5/5] ceph: Activate BLOG logging
config: xtensa-randconfig-002-20251025 (https://download.01.org/0day-ci/archive/20251025/202510251256.eh8qnDln-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510251256.eh8qnDln-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510251256.eh8qnDln-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/ceph/file.c: In function 'ceph_splice_read':
>> fs/ceph/file.c:2268:9: error: implicit declaration of function 'bout'; did you mean 'dout'? [-Wimplicit-function-declaration]
    2268 |         bout("splice_read %p %llx.%llx %llu~%zu trying to get caps on %p\n",
         |         ^~~~
         |         dout
--
   fs/ceph/super.c: In function 'ceph_parse_new_source':
>> fs/ceph/super.c:280:17: error: implicit declaration of function 'bout'; did you mean 'dout'? [-Wimplicit-function-declaration]
     280 |                 bout("separator '=' missing in source");
         |                 ^~~~
         |                 dout


vim +2268 fs/ceph/file.c

  2251	
  2252	/*
  2253	 * Wrap filemap_splice_read with checks for cap bits on the inode.
  2254	 * Atomically grab references, so that those bits are not released
  2255	 * back to the MDS mid-read.
  2256	 */
  2257	static ssize_t ceph_splice_read(struct file *in, loff_t *ppos,
  2258					struct pipe_inode_info *pipe,
  2259					size_t len, unsigned int flags)
  2260	{
  2261		struct ceph_file_info *fi = in->private_data;
  2262		struct inode *inode = file_inode(in);
  2263		struct ceph_inode_info *ci = ceph_inode(inode);
  2264		ssize_t ret;
  2265		int want = 0, got = 0;
  2266		CEPH_DEFINE_RW_CONTEXT(rw_ctx, 0);
  2267	
> 2268		bout("splice_read %p %llx.%llx %llu~%zu trying to get caps on %p\n",
  2269		     inode, ceph_vinop(inode), *ppos, len, inode);
  2270	
  2271		if (ceph_inode_is_shutdown(inode))
  2272			return -ESTALE;
  2273	
  2274		if (ceph_has_inline_data(ci) ||
  2275		    (fi->flags & CEPH_F_SYNC))
  2276			return copy_splice_read(in, ppos, pipe, len, flags);
  2277	
  2278		ret = ceph_start_io_read(inode);
  2279		if (ret)
  2280			return ret;
  2281	
  2282		want = CEPH_CAP_FILE_CACHE;
  2283		if (fi->fmode & CEPH_FILE_MODE_LAZY)
  2284			want |= CEPH_CAP_FILE_LAZYIO;
  2285	
  2286		ret = ceph_get_caps(in, CEPH_CAP_FILE_RD, want, -1, &got);
  2287		if (ret < 0)
  2288			goto out_end;
  2289	
  2290		if ((got & (CEPH_CAP_FILE_CACHE | CEPH_CAP_FILE_LAZYIO)) == 0) {
  2291			bout("splice_read/sync %p %llx.%llx %llu~%zu got cap refs on %s\n",
  2292			     inode, ceph_vinop(inode), *ppos, len,
  2293			     ceph_cap_string(got));
  2294	
  2295			ceph_put_cap_refs(ci, got);
  2296			ceph_end_io_read(inode);
  2297			return copy_splice_read(in, ppos, pipe, len, flags);
  2298		}
  2299	
  2300		bout("splice_read %p %llx.%llx %llu~%zu got cap refs on %s\n",
  2301		     inode, ceph_vinop(inode), *ppos, len, ceph_cap_string(got));
  2302	
  2303		rw_ctx.caps = got;
  2304		ceph_add_rw_context(fi, &rw_ctx);
  2305		ret = filemap_splice_read(in, ppos, pipe, len, flags);
  2306		ceph_del_rw_context(fi, &rw_ctx);
  2307	
  2308		bout("splice_read %p %llx.%llx dropping cap refs on %s = %zd\n",
  2309		     inode, ceph_vinop(inode), ceph_cap_string(got), ret);
  2310	
  2311		ceph_put_cap_refs(ci, got);
  2312	out_end:
  2313		ceph_end_io_read(inode);
  2314		return ret;
  2315	}
  2316	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
