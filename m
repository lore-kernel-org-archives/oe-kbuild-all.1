Received: from mg.ssi.bg (mg.ssi.bg [193.238.174.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3332F53A5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Dec 2022 18:57:33 +0000 (UTC)
Received: from mg.ssi.bg (localhost [127.0.0.1])
	by mg.ssi.bg (Proxmox) with ESMTP id AFA5A440DC;
	Mon, 12 Dec 2022 20:50:42 +0200 (EET)
Received: from ink.ssi.bg (unknown [193.238.174.40])
	by mg.ssi.bg (Proxmox) with ESMTP id 6B36443FFD;
	Mon, 12 Dec 2022 20:50:40 +0200 (EET)
Received: from ja.ssi.bg (unknown [178.16.129.10])
	by ink.ssi.bg (Postfix) with ESMTPS id DF57C3C07CA;
	Mon, 12 Dec 2022 20:50:39 +0200 (EET)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by ja.ssi.bg (8.17.1/8.16.1) with ESMTP id 2BCIoacJ089358;
	Mon, 12 Dec 2022 20:50:37 +0200
Date: Mon, 12 Dec 2022 20:50:36 +0200 (EET)
From: Julian Anastasov <ja@ssi.bg>
To: kernel test robot <lkp@intel.com>
cc: oe-kbuild-all@lists.linux.dev, Pablo Neira Ayuso <pablo@netfilter.org>,
        Jiri Wiesner <jwiesner@suse.de>
Subject: Re: [netfilter-nf-next:master 10/12] include/asm-generic/div64.h:222:35:
 warning: comparison of distinct pointer types lacks a cast
In-Reply-To: <202212122351.pm375fNX-lkp@intel.com>
Message-ID: <58fd994f-99bb-796b-bfca-f26bcb621aef@ssi.bg>
References: <202212122351.pm375fNX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


	Hello,

On Tue, 13 Dec 2022, kernel test robot wrote:

> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf-next.git master
> head:   144361c1949f227df9244302da02c258a363b674
> commit: 705dd34440812735ece298eb5bc153fde9544d42 [10/12] ipvs: use kthreads for stats estimation
> config: arc-randconfig-r024-20221211
> compiler: arceb-elf-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf-next.git/commit/?id=705dd34440812735ece298eb5bc153fde9544d42
>         git remote add netfilter-nf-next git://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf-next.git
>         git fetch --no-tags netfilter-nf-next master
>         git checkout 705dd34440812735ece298eb5bc153fde9544d42
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash net/netfilter/ipvs/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from ./arch/arc/include/generated/asm/div64.h:1,
>                     from include/linux/math.h:6,
>                     from include/linux/kernel.h:25,
>                     from net/netfilter/ipvs/ip_vs_est.c:18:
>    net/netfilter/ipvs/ip_vs_est.c: In function 'ip_vs_est_calc_limits':
> >> include/asm-generic/div64.h:222:35: warning: comparison of distinct pointer types lacks a cast
>      222 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
>          |                                   ^~
>    net/netfilter/ipvs/ip_vs_est.c:688:17: note: in expansion of macro 'do_div'
>      688 |                 do_div(val, loops);
>          |                 ^~~~~~
> >> include/asm-generic/div64.h:222:35: warning: comparison of distinct pointer types lacks a cast
>      222 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
>          |                                   ^~
>    net/netfilter/ipvs/ip_vs_est.c:694:33: note: in expansion of macro 'do_div'
>      694 |                                 do_div(val, min_est);
>          |                                 ^~~~~~
> 
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for DEBUG_MAPLE_TREE
>    Depends on [n]: DEBUG_KERNEL [=n]
>    Selected by [y]:
>    - TEST_MAPLE_TREE [=y] && RUNTIME_TESTING_MENU [=y]
> 
> 
> vim +222 include/asm-generic/div64.h
> 
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  215  
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  216  /* The unnecessary pointer compare is there
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  217   * to check for type safety (n must be 64bit)
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  218   */
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  219  # define do_div(n,base) ({				\
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  220  	uint32_t __base = (base);			\
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  221  	uint32_t __rem;					\
> ^1da177e4c3f41 Linus Torvalds     2005-04-16 @222  	(void)(((typeof((n)) *)0) == ((uint64_t *)0));	\
> 911918aa7ef6f8 Nicolas Pitre      2015-11-02  223  	if (__builtin_constant_p(__base) &&		\
> 911918aa7ef6f8 Nicolas Pitre      2015-11-02  224  	    is_power_of_2(__base)) {			\
> 911918aa7ef6f8 Nicolas Pitre      2015-11-02  225  		__rem = (n) & (__base - 1);		\
> 911918aa7ef6f8 Nicolas Pitre      2015-11-02  226  		(n) >>= ilog2(__base);			\
> c747ce4706190e Geert Uytterhoeven 2021-08-11  227  	} else if (__builtin_constant_p(__base) &&	\
> 461a5e51060c93 Nicolas Pitre      2015-10-30  228  		   __base != 0) {			\
> 461a5e51060c93 Nicolas Pitre      2015-10-30  229  		uint32_t __res_lo, __n_lo = (n);	\
> 461a5e51060c93 Nicolas Pitre      2015-10-30  230  		(n) = __div64_const32(n, __base);	\
> 461a5e51060c93 Nicolas Pitre      2015-10-30  231  		/* the remainder can be computed with 32-bit regs */ \
> 461a5e51060c93 Nicolas Pitre      2015-10-30  232  		__res_lo = (n);				\
> 461a5e51060c93 Nicolas Pitre      2015-10-30  233  		__rem = __n_lo - __res_lo * __base;	\
> 911918aa7ef6f8 Nicolas Pitre      2015-11-02  234  	} else if (likely(((n) >> 32) == 0)) {		\
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  235  		__rem = (uint32_t)(n) % __base;		\
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  236  		(n) = (uint32_t)(n) / __base;		\
> c747ce4706190e Geert Uytterhoeven 2021-08-11  237  	} else {					\
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  238  		__rem = __div64_32(&(n), __base);	\
> c747ce4706190e Geert Uytterhoeven 2021-08-11  239  	}						\
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  240  	__rem;						\
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  241   })
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  242  
> 
> :::::: The code at line 222 was first introduced by commit
> :::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2
> 
> :::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
> :::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://01.org/lkp
> 

	Pablo, hope this helps to silence the warnings:

From: Julian Anastasov <ja@ssi.bg>
Date: Mon, 12 Dec 2022 20:44:47 +0200
Subject: [PATCH] ipvs: use u64 to silence do_div warnings

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Julian Anastasov <ja@ssi.bg>
---
 net/netfilter/ipvs/ip_vs_est.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/net/netfilter/ipvs/ip_vs_est.c b/net/netfilter/ipvs/ip_vs_est.c
index df56073bb282..5473328f367f 100644
--- a/net/netfilter/ipvs/ip_vs_est.c
+++ b/net/netfilter/ipvs/ip_vs_est.c
@@ -638,11 +638,12 @@ static int ip_vs_est_calc_limits(struct netns_ipvs *ipvs, int *chain_max)
 	struct ip_vs_stats *s;
 	int cache_factor = 4;
 	int i, loops, ntest;
-	s32 min_est = 0;
+	u32 min_est = 0;
 	ktime_t t1, t2;
-	s64 diff, val;
 	int max = 8;
 	int ret = 1;
+	s64 diff;
+	u64 val;
 
 	INIT_HLIST_HEAD(&chain);
 	mutex_lock(&__ip_vs_mutex);
-- 
2.38.1


