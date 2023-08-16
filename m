Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BED392
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Aug 2023 00:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692146600; x=1723682600;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=huoYyzX5PpNizVw19VsYXDrCUjDbGBcRC8loAaH4qJs=;
  b=kgtYMWEgLdkFq1LHXlUnWjq11BBUtVS8Q6Tw7Gvy2grp50tidFIGOr6o
   GvAyRhOfQuFtDUngWPEp6aRUXq0PzbaZg7URHHGgglmlX/P3wRshssLdZ
   jnm1Hrhd2gLFUwV46KxPlaG3Pc74TyakL6pzb0phuHTwOoVb4Q3rijfRi
   9cTSfV7fqYTY5fcnGMkdGs7VEyQivvnKiEYOwlGCC5qYxnbc2Gk4LqxMu
   eAMShVfrwAcZfN/5kZBA+IVLURDnqmuWL6cr9lflAVTAiswa4rzgWsEQi
   X26mZSd9crW5Bs1ssB/3GJFqM/8rTwCrs5yYKTQDO5j908dL74Y4kl191
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="352738999"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="352738999"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 17:43:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="763459816"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="763459816"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 15 Aug 2023 17:43:18 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qW4d3-0001M5-0G;
	Wed, 16 Aug 2023 00:43:17 +0000
Date: Wed, 16 Aug 2023 08:42:20 +0800
From: kernel test robot <lkp@intel.com>
To: thinker.li@gmail.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC bpf-next v3 1/5] bpf: enable sleepable BPF programs
 attached to cgroup/{get,set}sockopt.
Message-ID: <202308160854.eioAO9dg-lkp@intel.com>
References: <20230815174712.660956-2-thinker.li@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230815174712.660956-2-thinker.li@gmail.com>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/thinker-li-gmail-com/bpf-enable-sleepable-BPF-programs-attached-to-cgroup-get-set-sockopt/20230816-014936
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230815174712.660956-2-thinker.li%40gmail.com
patch subject: [RFC bpf-next v3 1/5] bpf: enable sleepable BPF programs attached to cgroup/{get,set}sockopt.
config: i386-randconfig-i061-20230816 (https://download.01.org/0day-ci/archive/20230816/202308160854.eioAO9dg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230816/202308160854.eioAO9dg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308160854.eioAO9dg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/bpf/cgroup.c:1868:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char *optval @@
   kernel/bpf/cgroup.c:1868:41: sparse:     expected void const [noderef] __user *from
   kernel/bpf/cgroup.c:1868:41: sparse:     got char *optval
>> kernel/bpf/cgroup.c:1894:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [usertype] *[addressable] [assigned] optval @@     got char [noderef] __user *optval @@
   kernel/bpf/cgroup.c:1894:20: sparse:     expected unsigned char [usertype] *[addressable] [assigned] optval
   kernel/bpf/cgroup.c:1894:20: sparse:     got char [noderef] __user *optval
>> kernel/bpf/cgroup.c:1895:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [usertype] *[addressable] [assigned] optval_end @@     got char [noderef] __user * @@
   kernel/bpf/cgroup.c:1895:24: sparse:     expected unsigned char [usertype] *[addressable] [assigned] optval_end
   kernel/bpf/cgroup.c:1895:24: sparse:     got char [noderef] __user *
>> kernel/bpf/cgroup.c:1980:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char *[assigned] optval @@
   kernel/bpf/cgroup.c:1980:41: sparse:     expected void const [noderef] __user *from
   kernel/bpf/cgroup.c:1980:41: sparse:     got char *[assigned] optval
   kernel/bpf/cgroup.c:2033:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [usertype] *[addressable] [assigned] optval @@     got char [noderef] __user *optval @@
   kernel/bpf/cgroup.c:2033:20: sparse:     expected unsigned char [usertype] *[addressable] [assigned] optval
   kernel/bpf/cgroup.c:2033:20: sparse:     got char [noderef] __user *optval
   kernel/bpf/cgroup.c:2034:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [usertype] *[addressable] [assigned] optval_end @@     got char [noderef] __user * @@
   kernel/bpf/cgroup.c:2034:24: sparse:     expected unsigned char [usertype] *[addressable] [assigned] optval_end
   kernel/bpf/cgroup.c:2034:24: sparse:     got char [noderef] __user *
   kernel/bpf/cgroup.c: note: in included file (through include/linux/rculist.h, include/linux/pid.h, include/linux/sched.h, ...):
   include/linux/rcupdate.h:780:9: sparse: sparse: context imbalance in '__cgroup_bpf_run_lsm_sock' - unexpected unlock
   include/linux/rcupdate.h:780:9: sparse: sparse: context imbalance in '__cgroup_bpf_run_lsm_socket' - unexpected unlock
   include/linux/rcupdate.h:780:9: sparse: sparse: context imbalance in '__cgroup_bpf_run_lsm_current' - unexpected unlock
   include/linux/rcupdate.h:780:9: sparse: sparse: context imbalance in '__cgroup_bpf_run_filter_skb' - unexpected unlock
   include/linux/rcupdate.h:780:9: sparse: sparse: context imbalance in '__cgroup_bpf_run_filter_sk' - unexpected unlock
   include/linux/rcupdate.h:780:9: sparse: sparse: context imbalance in '__cgroup_bpf_run_filter_sock_addr' - unexpected unlock
   include/linux/rcupdate.h:780:9: sparse: sparse: context imbalance in '__cgroup_bpf_run_filter_sock_ops' - unexpected unlock
   kernel/bpf/cgroup.c:67:24: sparse: sparse: context imbalance in '__cgroup_bpf_check_dev_permission' - different lock contexts for basic block
   kernel/bpf/cgroup.c:67:24: sparse: sparse: context imbalance in '__cgroup_bpf_run_filter_sysctl' - different lock contexts for basic block
   include/linux/rcupdate.h:780:9: sparse: sparse: context imbalance in '__cgroup_bpf_run_filter_setsockopt' - unexpected unlock
   include/linux/rcupdate.h:780:9: sparse: sparse: context imbalance in '__cgroup_bpf_run_filter_getsockopt' - unexpected unlock
   include/linux/rcupdate.h:780:9: sparse: sparse: context imbalance in '__cgroup_bpf_run_filter_getsockopt_kern' - unexpected unlock

vim +1868 kernel/bpf/cgroup.c

  1841	
  1842	static int filter_setsockopt_progs_cb(void *arg,
  1843					      const struct bpf_prog_array *progs)
  1844	{
  1845		struct filter_sockopt_cb_args *cb_args = arg;
  1846		struct bpf_sockopt_kern *ctx = cb_args->ctx;
  1847		char *optval = ctx->optval;
  1848		int max_optlen;
  1849	
  1850		if (!(progs->flags & BPF_PROG_ARRAY_F_NON_SLEEPABLE))
  1851			return 0;
  1852	
  1853		/* Allocate a bit more than the initial user buffer for
  1854		 * BPF program. The canonical use case is overriding
  1855		 * TCP_CONGESTION(nv) to TCP_CONGESTION(cubic).
  1856		 */
  1857		max_optlen = max_t(int, 16, ctx->optlen);
  1858		/* We need to force allocating from heap if there are sleepable
  1859		 * programs since they may created dynptrs from ctx->optval. In
  1860		 * this case, dynptrs will try to free the buffer that is actually
  1861		 * on the stack without this flag.
  1862		 */
  1863		max_optlen = sockopt_alloc_buf(ctx, max_optlen, cb_args->buf,
  1864					       progs->flags & BPF_PROG_ARRAY_F_SLEEPABLE);
  1865		if (max_optlen < 0)
  1866			return max_optlen;
  1867	
> 1868		if (copy_from_user(ctx->optval, optval,
  1869				   min(ctx->optlen, max_optlen)) != 0)
  1870			return -EFAULT;
  1871	
  1872		return 0;
  1873	}
  1874	
  1875	int __cgroup_bpf_run_filter_setsockopt(struct sock *sk, int *level,
  1876					       int *optname, char __user *optval,
  1877					       int *optlen, char **kernel_optval)
  1878	{
  1879		struct cgroup *cgrp = sock_cgroup_ptr(&sk->sk_cgrp_data);
  1880		struct bpf_sockopt_buf buf = {};
  1881		struct bpf_sockopt_kern ctx = {
  1882			.sk = sk,
  1883			.level = *level,
  1884			.optname = *optname,
  1885		};
  1886		struct filter_sockopt_cb_args cb_args = {
  1887			.ctx = &ctx,
  1888			.buf = &buf,
  1889		};
  1890		int ret, max_optlen;
  1891	
  1892		max_optlen = *optlen;
  1893		ctx.optlen = *optlen;
> 1894		ctx.optval = optval;
> 1895		ctx.optval_end = optval + *optlen;
  1896		ctx.flags = BPF_SOCKOPT_FLAG_OPTVAL_USER;
  1897	
  1898		lock_sock(sk);
  1899		ret = bpf_prog_run_array_cg_cb(&cgrp->bpf, CGROUP_SETSOCKOPT,
  1900					       &ctx, bpf_prog_run, 0, NULL,
  1901					       filter_setsockopt_progs_cb, &cb_args);
  1902		release_sock(sk);
  1903	
  1904		if (ret)
  1905			goto out;
  1906	
  1907		if (ctx.optlen == -1) {
  1908			/* optlen set to -1, bypass kernel */
  1909			ret = 1;
  1910		} else if (ctx.optlen > (ctx.optval_end - ctx.optval) ||
  1911			   ctx.optlen < -1) {
  1912			/* optlen is out of bounds */
  1913			if (*optlen > PAGE_SIZE && ctx.optlen >= 0) {
  1914				pr_info_once("bpf setsockopt: ignoring program buffer with optlen=%d (max_optlen=%d)\n",
  1915					     ctx.optlen, max_optlen);
  1916				ret = 0;
  1917				goto out;
  1918			}
  1919			ret = -EFAULT;
  1920		} else {
  1921			/* optlen within bounds, run kernel handler */
  1922			ret = 0;
  1923	
  1924			/* export any potential modifications */
  1925			*level = ctx.level;
  1926			*optname = ctx.optname;
  1927	
  1928			/* optlen == 0 from BPF indicates that we should
  1929			 * use original userspace data.
  1930			 */
  1931			if (ctx.optlen != 0) {
  1932				*optlen = ctx.optlen;
  1933				if (ctx.flags & BPF_SOCKOPT_FLAG_OPTVAL_USER)
  1934					return 0;
  1935				/* We've used bpf_sockopt_kern->buf as an intermediary
  1936				 * storage, but the BPF program indicates that we need
  1937				 * to pass this data to the kernel setsockopt handler.
  1938				 * No way to export on-stack buf, have to allocate a
  1939				 * new buffer.
  1940				 */
  1941				if (!sockopt_buf_allocated(&ctx, &buf)) {
  1942					void *p = kmalloc(ctx.optlen, GFP_USER);
  1943	
  1944					if (!p) {
  1945						ret = -ENOMEM;
  1946						goto out;
  1947					}
  1948					memcpy(p, ctx.optval, ctx.optlen);
  1949					*kernel_optval = p;
  1950				} else {
  1951					*kernel_optval = ctx.optval;
  1952				}
  1953				/* export and don't free sockopt buf */
  1954				return 0;
  1955			}
  1956		}
  1957	
  1958	out:
  1959		sockopt_free_buf(&ctx, &buf);
  1960		return ret;
  1961	}
  1962	
  1963	static int filter_getsockopt_progs_cb(void *arg,
  1964					      const struct bpf_prog_array *progs)
  1965	{
  1966		struct filter_sockopt_cb_args *cb_args = arg;
  1967		struct bpf_sockopt_kern *ctx = cb_args->ctx;
  1968		int max_optlen;
  1969		char *optval;
  1970	
  1971		if (!(progs->flags & BPF_PROG_ARRAY_F_NON_SLEEPABLE))
  1972			return 0;
  1973	
  1974		optval = ctx->optval;
  1975		max_optlen = sockopt_alloc_buf(ctx, cb_args->max_optlen,
  1976					       cb_args->buf, false);
  1977		if (max_optlen < 0)
  1978			return max_optlen;
  1979	
> 1980		if (copy_from_user(ctx->optval, optval,
  1981				   min(ctx->optlen, max_optlen)) != 0)
  1982			return -EFAULT;
  1983	
  1984		ctx->flags = 0;
  1985		cb_args->max_optlen = max_optlen;
  1986	
  1987		return 0;
  1988	}
  1989	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
