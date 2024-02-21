Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544C22574F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Feb 2024 21:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708550573; cv=none; b=oMHzp8NdsbWMPAkc/JXpO5e7uXUl96W15cdQY94E/wp3hwFAJIWU+weJR/nZNBw/vgbrV4ERDOK3pL2QWgNt0CRELAOz/bUiLRfBL7L/qyqNXabwWjxROYYohOiyFvI7O4a11NvORgb83e1km6Jm5Zib2mYgm2MekgLyCNbCsEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708550573; c=relaxed/simple;
	bh=Kr6a5GT67kuomMjMoanGPJltWI2AXQjBbhy4W7m7GDY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sCiRscB6umQ3sPQlAdhDziYNC8vde/TXSsy7GOCx8h2QZdeoLp4NmXliQrciO/uBNyBCq9nOM/jYbM2NyvRr4ivC2oS/n1x5gOWQA76oLzjzsPgFLQUCuYHnGBKqTYqrebFPdZKYSgym1T1vzW9YHGU91sij+5BESTZA1okq5MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NdR48Pk5; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NdR48Pk5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708550571; x=1740086571;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kr6a5GT67kuomMjMoanGPJltWI2AXQjBbhy4W7m7GDY=;
  b=NdR48Pk5p13OGfX+rL6DfsLLh+lR25AQzajCrMFSbATiFQv8Q9aVRAFK
   4H8suCEFbGa/T6xlzYOiS3bmYZi6XYoXBh2CbEVtCXsOQ0b6dsEVRed8P
   eiDGaRsUAw7Su8cLzOCdV73fTAEjdGrw8IYMFklYED7pAcjKs97gHdRBo
   tPid3qQkZjYEBuruvNakvH3Is91EFRs+GMC9WHMP2xRI+7JXy6gjnYlZE
   iPYF+hQb6M682qgnakTy3pN4yMxA72voMclpP50+MnQNaJxWbeAAKFGO0
   Gfcq3HTKNdOXQ1sHRH/vI2uQi5/gQGgZzIpR/JnsfP9x9IH3fkRCUKnw6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="5689798"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="5689798"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 13:22:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="5207035"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 21 Feb 2024 13:22:46 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcu33-0005j2-1g;
	Wed, 21 Feb 2024 21:22:39 +0000
Date: Thu, 22 Feb 2024 05:21:55 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: kernel/bpf/syscall.c:2009:20: warning: 'bpf_link_type_strs' defined
 but not used
Message-ID: <202402220553.hyKMKXXM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: 82bb8d06f77cf632d23ecf93a338f9ff9d6b287f bpf: Add support for BPF_OBJ_GET_INFO_BY_FD for bpf_link
date:   1 year, 6 months ago
config: x86_64-buildonly-randconfig-006-20240221 (https://download.01.org/0day-ci/archive/20240222/202402220553.hyKMKXXM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240222/202402220553.hyKMKXXM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402220553.hyKMKXXM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:6,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:12,
                    from arch/x86/include/asm/preempt.h:7,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:51,
                    from include/linux/seqlock.h:36,
                    from include/linux/time.h:6,
                    from include/linux/ktime.h:24,
                    from include/linux/timer.h:6,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:9,
                    from kernel/bpf/syscall.c:4:
   include/linux/instrumentation.h:8: warning: "instrumentation_begin" redefined
       8 | #define instrumentation_begin() ({                                      \
         | 
   In file included from include/linux/export.h:42,
                    from include/linux/linkage.h:7,
                    from include/linux/kernel.h:8,
                    from include/linux/list.h:9,
                    from include/linux/timer.h:5:
   include/linux/compiler.h:139: note: this is the location of the previous definition
     139 | #define instrumentation_begin() ({                                      \
         | 
   kernel/bpf/syscall.c: In function 'find_prog_type':
   kernel/bpf/syscall.c:1329:18: warning: comparison is always true due to limited range of data type [-Wtype-limits]
    1329 |         if (type >= ARRAY_SIZE(bpf_prog_types))
         |                  ^~
   kernel/bpf/syscall.c: In function 'bpf_tracing_prog_attach':
   kernel/bpf/syscall.c:2194:51: error: 'BPF_TRACE_FENTRY' undeclared (first use in this function); did you mean 'BPF_TRAMP_FENTRY'?
    2194 |                 if (prog->expected_attach_type != BPF_TRACE_FENTRY &&
         |                                                   ^~~~~~~~~~~~~~~~
         |                                                   BPF_TRAMP_FENTRY
   kernel/bpf/syscall.c:2194:51: note: each undeclared identifier is reported only once for each function it appears in
   kernel/bpf/syscall.c:2195:51: error: 'BPF_TRACE_FEXIT' undeclared (first use in this function); did you mean 'BPF_TRAMP_FEXIT'?
    2195 |                     prog->expected_attach_type != BPF_TRACE_FEXIT &&
         |                                                   ^~~~~~~~~~~~~~~
         |                                                   BPF_TRAMP_FEXIT
   kernel/bpf/syscall.c:2196:51: error: 'BPF_MODIFY_RETURN' undeclared (first use in this function); did you mean 'BPF_TRAMP_MODIFY_RETURN'?
    2196 |                     prog->expected_attach_type != BPF_MODIFY_RETURN) {
         |                                                   ^~~~~~~~~~~~~~~~~
         |                                                   BPF_TRAMP_MODIFY_RETURN
   kernel/bpf/syscall.c:2208:51: error: 'BPF_LSM_MAC' undeclared (first use in this function); did you mean 'BPF_FS_MAGIC'?
    2208 |                 if (prog->expected_attach_type != BPF_LSM_MAC) {
         |                                                   ^~~~~~~~~~~
         |                                                   BPF_FS_MAGIC
   kernel/bpf/syscall.c: In function 'bpf_raw_tracepoint_open':
   kernel/bpf/syscall.c:2350:51: error: 'BPF_TRACE_RAW_TP' undeclared (first use in this function)
    2350 |                     prog->expected_attach_type == BPF_TRACE_RAW_TP) {
         |                                                   ^~~~~~~~~~~~~~~~
   kernel/bpf/syscall.c: At top level:
>> kernel/bpf/syscall.c:2009:20: warning: 'bpf_link_type_strs' defined but not used [-Wunused-variable]
    2009 | static const char *bpf_link_type_strs[] = {
         |                    ^~~~~~~~~~~~~~~~~~


vim +/bpf_link_type_strs +2009 kernel/bpf/syscall.c

  2005	
  2006	#define BPF_PROG_TYPE(_id, _name, prog_ctx_type, kern_ctx_type)
  2007	#define BPF_MAP_TYPE(_id, _ops)
  2008	#define BPF_LINK_TYPE(_id, _name) [_id] = #_name,
> 2009	static const char *bpf_link_type_strs[] = {
  2010		[BPF_LINK_TYPE_UNSPEC] = "<invalid>",
  2011	#include <linux/bpf_types.h>
  2012	};
  2013	#undef BPF_PROG_TYPE
  2014	#undef BPF_MAP_TYPE
  2015	#undef BPF_LINK_TYPE
  2016	 
  2017	#ifdef CONFIG_PROC_FS
  2018	static void bpf_link_show_fdinfo(struct seq_file *m, struct file *filp)
  2019	{
  2020		const struct bpf_link *link = filp->private_data;
  2021		const struct bpf_prog *prog = link->prog;
  2022		char prog_tag[sizeof(prog->tag) * 2 + 1] = { };
  2023	
  2024		bin2hex(prog_tag, prog->tag, sizeof(prog->tag));
  2025		seq_printf(m,
  2026			   "link_type:\t%s\n"
  2027			   "link_id:\t%u\n"
  2028			   "prog_tag:\t%s\n"
  2029			   "prog_id:\t%u\n",
  2030			   bpf_link_type_strs[link->type],
  2031			   link->id,
  2032			   prog_tag,
  2033			   prog->aux->id);
  2034		if (link->ops->show_fdinfo)
  2035			link->ops->show_fdinfo(link, m);
  2036	}
  2037	#endif
  2038	
  2039	const struct file_operations bpf_link_fops = {
  2040	#ifdef CONFIG_PROC_FS
  2041		.show_fdinfo	= bpf_link_show_fdinfo,
  2042	#endif
  2043		.release	= bpf_link_release,
  2044		.read		= bpf_dummy_read,
  2045		.write		= bpf_dummy_write,
  2046	};
  2047	
  2048	static int bpf_link_alloc_id(struct bpf_link *link)
  2049	{
  2050		int id;
  2051	
  2052		idr_preload(GFP_KERNEL);
  2053		spin_lock_bh(&link_idr_lock);
  2054		id = idr_alloc_cyclic(&link_idr, link, 1, INT_MAX, GFP_ATOMIC);
  2055		spin_unlock_bh(&link_idr_lock);
  2056		idr_preload_end();
  2057	
  2058		return id;
  2059	}
  2060	
  2061	/* Prepare bpf_link to be exposed to user-space by allocating anon_inode file,
  2062	 * reserving unused FD and allocating ID from link_idr. This is to be paired
  2063	 * with bpf_link_settle() to install FD and ID and expose bpf_link to
  2064	 * user-space, if bpf_link is successfully attached. If not, bpf_link and
  2065	 * pre-allocated resources are to be freed with bpf_cleanup() call. All the
  2066	 * transient state is passed around in struct bpf_link_primer.
  2067	 * This is preferred way to create and initialize bpf_link, especially when
  2068	 * there are complicated and expensive operations inbetween creating bpf_link
  2069	 * itself and attaching it to BPF hook. By using bpf_link_prime() and
  2070	 * bpf_link_settle() kernel code using bpf_link doesn't have to perform
  2071	 * expensive (and potentially failing) roll back operations in a rare case
  2072	 * that file, FD, or ID can't be allocated.
  2073	 */
  2074	int bpf_link_prime(struct bpf_link *link, struct bpf_link_primer *primer)
  2075	{
  2076		struct file *file;
  2077		int fd, id;
  2078	
  2079		fd = get_unused_fd_flags(O_CLOEXEC);
  2080		if (fd < 0)
  2081			return fd;
  2082	
  2083		file = anon_inode_getfile("bpf_link", &bpf_link_fops, link, O_CLOEXEC);
  2084		if (IS_ERR(file)) {
  2085			put_unused_fd(fd);
  2086			return PTR_ERR(file);
  2087		}
  2088	
  2089		id = bpf_link_alloc_id(link);
  2090		if (id < 0) {
  2091			put_unused_fd(fd);
  2092			fput(file);
  2093			return id;
  2094		}
  2095	
  2096		primer->link = link;
  2097		primer->file = file;
  2098		primer->fd = fd;
  2099		primer->id = id;
  2100		return 0;
  2101	}
  2102	
  2103	int bpf_link_settle(struct bpf_link_primer *primer)
  2104	{
  2105		/* make bpf_link fetchable by ID */
  2106		spin_lock_bh(&link_idr_lock);
  2107		primer->link->id = primer->id;
  2108		spin_unlock_bh(&link_idr_lock);
  2109		/* make bpf_link fetchable by FD */
  2110		fd_install(primer->fd, primer->file);
  2111		/* pass through installed FD */
  2112		return primer->fd;
  2113	}
  2114	
  2115	int bpf_link_new_fd(struct bpf_link *link)
  2116	{
  2117		return anon_inode_getfd("bpf-link", &bpf_link_fops, link, O_CLOEXEC);
  2118	}
  2119	
  2120	struct bpf_link *bpf_link_get_from_fd(u32 ufd)
  2121	{
  2122		struct fd f = fdget(ufd);
  2123		struct bpf_link *link;
  2124	
  2125		if (!f.file)
  2126			return ERR_PTR(-EBADF);
  2127		if (f.file->f_op != &bpf_link_fops) {
  2128			fdput(f);
  2129			return ERR_PTR(-EINVAL);
  2130		}
  2131	
  2132		link = f.file->private_data;
  2133		bpf_link_inc(link);
  2134		fdput(f);
  2135	
  2136		return link;
  2137	}
  2138	
  2139	struct bpf_tracing_link {
  2140		struct bpf_link link;
  2141		enum bpf_attach_type attach_type;
  2142	};
  2143	
  2144	static void bpf_tracing_link_release(struct bpf_link *link)
  2145	{
  2146		WARN_ON_ONCE(bpf_trampoline_unlink_prog(link->prog));
  2147	}
  2148	
  2149	static void bpf_tracing_link_dealloc(struct bpf_link *link)
  2150	{
  2151		struct bpf_tracing_link *tr_link =
  2152			container_of(link, struct bpf_tracing_link, link);
  2153	
  2154		kfree(tr_link);
  2155	}
  2156	
  2157	static void bpf_tracing_link_show_fdinfo(const struct bpf_link *link,
  2158						 struct seq_file *seq)
  2159	{
  2160		struct bpf_tracing_link *tr_link =
  2161			container_of(link, struct bpf_tracing_link, link);
  2162	
  2163		seq_printf(seq,
  2164			   "attach_type:\t%d\n",
  2165			   tr_link->attach_type);
  2166	}
  2167	
  2168	static int bpf_tracing_link_fill_link_info(const struct bpf_link *link,
  2169						   struct bpf_link_info *info)
  2170	{
  2171		struct bpf_tracing_link *tr_link =
  2172			container_of(link, struct bpf_tracing_link, link);
  2173	
  2174		info->tracing.attach_type = tr_link->attach_type;
  2175	
  2176		return 0;
  2177	}
  2178	
  2179	static const struct bpf_link_ops bpf_tracing_link_lops = {
  2180		.release = bpf_tracing_link_release,
  2181		.dealloc = bpf_tracing_link_dealloc,
  2182		.show_fdinfo = bpf_tracing_link_show_fdinfo,
  2183		.fill_link_info = bpf_tracing_link_fill_link_info,
  2184	};
  2185	
  2186	static int bpf_tracing_prog_attach(struct bpf_prog *prog)
  2187	{
  2188		struct bpf_link_primer link_primer;
  2189		struct bpf_tracing_link *link;
  2190		int err;
  2191	
  2192		switch (prog->type) {
  2193		case BPF_PROG_TYPE_TRACING:
  2194			if (prog->expected_attach_type != BPF_TRACE_FENTRY &&
  2195			    prog->expected_attach_type != BPF_TRACE_FEXIT &&
  2196			    prog->expected_attach_type != BPF_MODIFY_RETURN) {
  2197				err = -EINVAL;
  2198				goto out_put_prog;
  2199			}
  2200			break;
  2201		case BPF_PROG_TYPE_EXT:
  2202			if (prog->expected_attach_type != 0) {
  2203				err = -EINVAL;
  2204				goto out_put_prog;
  2205			}
  2206			break;
  2207		case BPF_PROG_TYPE_LSM:
> 2208			if (prog->expected_attach_type != BPF_LSM_MAC) {
  2209				err = -EINVAL;
  2210				goto out_put_prog;
  2211			}
  2212			break;
  2213		default:
  2214			err = -EINVAL;
  2215			goto out_put_prog;
  2216		}
  2217	
  2218		link = kzalloc(sizeof(*link), GFP_USER);
  2219		if (!link) {
  2220			err = -ENOMEM;
  2221			goto out_put_prog;
  2222		}
  2223		bpf_link_init(&link->link, BPF_LINK_TYPE_TRACING,
  2224			      &bpf_tracing_link_lops, prog);
  2225		link->attach_type = prog->expected_attach_type;
  2226	
  2227		err = bpf_link_prime(&link->link, &link_primer);
  2228		if (err) {
  2229			kfree(link);
  2230			goto out_put_prog;
  2231		}
  2232	
  2233		err = bpf_trampoline_link_prog(prog);
  2234		if (err) {
  2235			bpf_link_cleanup(&link_primer);
  2236			goto out_put_prog;
  2237		}
  2238	
  2239		return bpf_link_settle(&link_primer);
  2240	out_put_prog:
  2241		bpf_prog_put(prog);
  2242		return err;
  2243	}
  2244	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
