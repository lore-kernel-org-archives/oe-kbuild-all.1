Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822152908
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jul 2023 16:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690042191; x=1721578191;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rp2rQJ3vE4ViIYeFTBQoOSycm2pp1/aRcImUeXocgKo=;
  b=PQyhxE8efKkKQhHOcwrsm7yOeyerqtXkaG4BljO6mZtqOzCLwJ9HgxlR
   rpr9c6o7bmpYpoOVVdsAEzl+v8WGNXvWXaCFnQACYrn/FsdKPW6lVZRrM
   OhDu7RbtSXatFIX5pS0porUzlQoxE+UztChzGx8fCRxc42wo95GmDvSNA
   bcZa+oEwecZs8bfRGYprV4qLpZTlOxcEvhNxFoKpXKMXpIafTYeLIH38T
   NiCQv24EfQljnES111EMcW7HcSTnLIcbxSYj9J6oIXUiMMfqebyDzZzFE
   hhRol0D/qSMEk4D9+e79DtDftGqadlfqeQWGM1YmMxQY94X3J3m83MIfP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="431001729"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="431001729"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2023 09:09:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="790501297"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="790501297"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 22 Jul 2023 09:09:49 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNFAy-0008RD-1i;
	Sat, 22 Jul 2023 16:09:48 +0000
Date: Sun, 23 Jul 2023 00:09:29 +0800
From: kernel test robot <lkp@intel.com>
To: kuifeng@meta.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC bpf-next 1/5] bpf: enable sleepable BPF programs attached
 to cgroup/{get,set}sockopt.
Message-ID: <202307230006.fFpl0zeg-lkp@intel.com>
References: <20230722052248.1062582-2-kuifeng@meta.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230722052248.1062582-2-kuifeng@meta.com>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/kuifeng-meta-com/bpf-enable-sleepable-BPF-programs-attached-to-cgroup-get-set-sockopt/20230722-132551
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230722052248.1062582-2-kuifeng%40meta.com
patch subject: [RFC bpf-next 1/5] bpf: enable sleepable BPF programs attached to cgroup/{get,set}sockopt.
config: sparc64-randconfig-r081-20230720 (https://download.01.org/0day-ci/archive/20230723/202307230006.fFpl0zeg-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230723/202307230006.fFpl0zeg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307230006.fFpl0zeg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/bpf/cgroup.c:1848:33: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [usertype] *[assigned] user_optval @@     got char [noderef] __user *optval @@
   kernel/bpf/cgroup.c:1848:33: sparse:     expected unsigned char [usertype] *[assigned] user_optval
   kernel/bpf/cgroup.c:1848:33: sparse:     got char [noderef] __user *optval
>> kernel/bpf/cgroup.c:1849:37: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [usertype] *[assigned] user_optval_end @@     got char [noderef] __user * @@
   kernel/bpf/cgroup.c:1849:37: sparse:     expected unsigned char [usertype] *[assigned] user_optval_end
   kernel/bpf/cgroup.c:1849:37: sparse:     got char [noderef] __user *
   kernel/bpf/cgroup.c:1972:33: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [usertype] *[assigned] user_optval @@     got char [noderef] __user *optval @@
   kernel/bpf/cgroup.c:1972:33: sparse:     expected unsigned char [usertype] *[assigned] user_optval
   kernel/bpf/cgroup.c:1972:33: sparse:     got char [noderef] __user *optval
   kernel/bpf/cgroup.c:1973:37: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [usertype] *[assigned] user_optval_end @@     got char [noderef] __user * @@
   kernel/bpf/cgroup.c:1973:37: sparse:     expected unsigned char [usertype] *[assigned] user_optval_end
   kernel/bpf/cgroup.c:1973:37: sparse:     got char [noderef] __user *
   kernel/bpf/cgroup.c: note: in included file (through include/linux/rculist.h, include/linux/pid.h, include/linux/sched.h, ...):
   include/linux/rcupdate.h:780:9: sparse: sparse: context imbalance in '__cgroup_bpf_run_lsm_sock' - unexpected unlock
   include/linux/rcupdate.h:780:9: sparse: sparse: context imbalance in '__cgroup_bpf_run_lsm_socket' - unexpected unlock
   include/linux/rcupdate.h:780:9: sparse: sparse: context imbalance in '__cgroup_bpf_run_lsm_current' - unexpected unlock
   include/linux/rcupdate.h:780:9: sparse: sparse: context imbalance in '__cgroup_bpf_run_filter_skb' - unexpected unlock
   include/linux/rcupdate.h:780:9: sparse: sparse: context imbalance in '__cgroup_bpf_run_filter_sk' - unexpected unlock
   include/linux/rcupdate.h:780:9: sparse: sparse: context imbalance in '__cgroup_bpf_run_filter_sock_addr' - unexpected unlock
   include/linux/rcupdate.h:780:9: sparse: sparse: context imbalance in '__cgroup_bpf_run_filter_sock_ops' - unexpected unlock
   kernel/bpf/cgroup.c:57:24: sparse: sparse: context imbalance in '__cgroup_bpf_check_dev_permission' - different lock contexts for basic block
   kernel/bpf/cgroup.c:57:24: sparse: sparse: context imbalance in '__cgroup_bpf_run_filter_sysctl' - different lock contexts for basic block
   include/linux/rcupdate.h:780:9: sparse: sparse: context imbalance in '__cgroup_bpf_run_filter_setsockopt' - unexpected unlock
   include/linux/rcupdate.h:780:9: sparse: sparse: context imbalance in '__cgroup_bpf_run_filter_getsockopt' - unexpected unlock
   include/linux/rcupdate.h:780:9: sparse: sparse: context imbalance in '__cgroup_bpf_run_filter_getsockopt_kern' - unexpected unlock

vim +1848 kernel/bpf/cgroup.c

  1829	
  1830	int __cgroup_bpf_run_filter_setsockopt(struct sock *sk, int *level,
  1831					       int *optname, char __user *optval,
  1832					       int *optlen, char **kernel_optval)
  1833	{
  1834		struct cgroup *cgrp = sock_cgroup_ptr(&sk->sk_cgrp_data);
  1835		struct bpf_sockopt_buf buf = {};
  1836		struct bpf_sockopt_kern ctx = {
  1837			.sk = sk,
  1838			.level = *level,
  1839			.optname = *optname,
  1840		};
  1841		int ret, max_optlen;
  1842		bool alloc_mem;
  1843	
  1844		alloc_mem = !has_only_sleepable_prog_cg(&cgrp->bpf, CGROUP_SETSOCKOPT);
  1845		if (!alloc_mem) {
  1846			max_optlen = *optlen;
  1847			ctx.optlen = *optlen;
> 1848			ctx.user_optval = optval;
> 1849			ctx.user_optval_end = optval + *optlen;
  1850			ctx.flags = BPF_SOCKOPT_FLAG_OPTVAL_USER;
  1851		} else {
  1852			/* Allocate a bit more than the initial user buffer for
  1853			 * BPF program. The canonical use case is overriding
  1854			 * TCP_CONGESTION(nv) to TCP_CONGESTION(cubic).
  1855			 */
  1856			max_optlen = max_t(int, 16, *optlen);
  1857			max_optlen = sockopt_alloc_buf(&ctx, max_optlen, &buf);
  1858			if (max_optlen < 0)
  1859				return max_optlen;
  1860	
  1861			ctx.optlen = *optlen;
  1862	
  1863			if (copy_from_user(ctx.optval, optval, min(*optlen, max_optlen)) != 0) {
  1864				ret = -EFAULT;
  1865				goto out;
  1866			}
  1867		}
  1868	
  1869		lock_sock(sk);
  1870		ret = bpf_prog_run_array_cg(&cgrp->bpf, CGROUP_SETSOCKOPT,
  1871					    &ctx, bpf_prog_run, 0, NULL);
  1872		release_sock(sk);
  1873	
  1874		if (ret)
  1875			goto out;
  1876	
  1877		if (ctx.optlen == -1) {
  1878			/* optlen set to -1, bypass kernel */
  1879			ret = 1;
  1880		} else if (alloc_mem &&
  1881			   (ctx.optlen > max_optlen || ctx.optlen < -1)) {
  1882			/* optlen is out of bounds */
  1883			if (*optlen > PAGE_SIZE && ctx.optlen >= 0) {
  1884				pr_info_once("bpf setsockopt: ignoring program buffer with optlen=%d (max_optlen=%d)\n",
  1885					     ctx.optlen, max_optlen);
  1886				ret = 0;
  1887				goto out;
  1888			}
  1889			ret = -EFAULT;
  1890		} else {
  1891			/* optlen within bounds, run kernel handler */
  1892			ret = 0;
  1893	
  1894			/* export any potential modifications */
  1895			*level = ctx.level;
  1896			*optname = ctx.optname;
  1897	
  1898			/* optlen == 0 from BPF indicates that we should
  1899			 * use original userspace data.
  1900			 */
  1901			if (ctx.optlen != 0) {
  1902				*optlen = ctx.optlen;
  1903				if (ctx.flags & BPF_SOCKOPT_FLAG_OPTVAL_USER)
  1904					return 0;
  1905				/* We've used bpf_sockopt_kern->buf as an intermediary
  1906				 * storage, but the BPF program indicates that we need
  1907				 * to pass this data to the kernel setsockopt handler.
  1908				 * No way to export on-stack buf, have to allocate a
  1909				 * new buffer.
  1910				 */
  1911				if (!sockopt_buf_allocated(&ctx, &buf)) {
  1912					void *p = kmalloc(ctx.optlen, GFP_USER);
  1913	
  1914					if (!p) {
  1915						ret = -ENOMEM;
  1916						goto out;
  1917					}
  1918					memcpy(p, ctx.optval, ctx.optlen);
  1919					*kernel_optval = p;
  1920				} else {
  1921					*kernel_optval = ctx.optval;
  1922				}
  1923				/* export and don't free sockopt buf */
  1924				return 0;
  1925			}
  1926		}
  1927	
  1928	out:
  1929		sockopt_free_buf(&ctx, &buf);
  1930		return ret;
  1931	}
  1932	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
