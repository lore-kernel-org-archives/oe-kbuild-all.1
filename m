Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A558E26299
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 23:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695684397; x=1727220397;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EajqfmNI8Bm/jgerIT8m0FLV1sDixuGeO6tBOUkSIYc=;
  b=U5IDFfjnt8wpJRTht4/s1JzSVa+bKEaSxO6O2vV3re5DoDNL+lvfcfcW
   /4Gy2E9QtIVIvkUrZdE/WMKdAWkVLEEO+2IFgeP4SbRxU/pRFbtAjydq/
   OQ7lAxtl6zPQiRhqxFSaOsqiWh2plSiUKi9tM7nvRARGMTaRhBqncSiIQ
   9kcqjPif5ZZj+Fztyty0DJgOXciYSDew0oM21jG8jomLOvmyHcjbCol7u
   oEKqToK7Y8MYyPewId+DY1WUU5e7beW68mjKGehzbbLF1DpYFkSLSLleF
   LaewoGizFB/SvmAqkkkTfy7xN4rtVhpAx5Asd/IR9FnXba7q1rUxmTJpH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="380303296"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; 
   d="scan'208";a="380303296"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 16:26:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="872280114"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; 
   d="scan'208";a="872280114"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 25 Sep 2023 16:26:34 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkuyG-00028F-1D;
	Mon, 25 Sep 2023 23:26:32 +0000
Date: Tue, 26 Sep 2023 07:25:33 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Borkmann <daniel@iogearbox.net>
Subject: [cilium:pr/xdp-multi 9/9] include/net/xdp.h:500:9: error: implicit
 declaration of function 'bpf_mprog_foreach_prog'; did you mean
 'bpf_prog_lock_ro'?
Message-ID: <202309260712.1yoVnb93-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cilium/linux.git pr/xdp-multi
head:   83f1483cdee8611d004ce761c31d6c3a78da1c95
commit: 123d08096aaebbfadae49a649bc3211eab76d2f0 [9/9] poc hack
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20230926/202309260712.1yoVnb93-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230926/202309260712.1yoVnb93-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309260712.1yoVnb93-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/net/busy_poll.h:19,
                    from fs/select.c:33:
>> include/net/xdp.h:494:22: warning: 'struct bpf_mprog_entry' declared inside parameter list will not be visible outside of this definition or declaration
     494 | xdp_run(const struct bpf_mprog_entry *entry, struct xdp_buff *xdp)
         |                      ^~~~~~~~~~~~~~~
   include/net/xdp.h: In function 'xdp_run':
>> include/net/xdp.h:500:9: error: implicit declaration of function 'bpf_mprog_foreach_prog'; did you mean 'bpf_prog_lock_ro'? [-Werror=implicit-function-declaration]
     500 |         bpf_mprog_foreach_prog(entry, fp, prog) {
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         bpf_prog_lock_ro
>> include/net/xdp.h:500:48: error: expected ';' before '{' token
     500 |         bpf_mprog_foreach_prog(entry, fp, prog) {
         |                                                ^~
         |                                                ;
>> include/net/xdp.h:498:13: warning: unused variable 'ret' [-Wunused-variable]
     498 |         int ret = XDP_NEXT;
         |             ^~~
   include/net/xdp.h:510:1: error: no return statement in function returning non-void [-Werror=return-type]
     510 | }
         | ^
   include/net/xdp.h: In function 'bpf_prog_run_xdp':
>> include/net/xdp.h:523:21: error: 'ret' undeclared (first use in this function); did you mean 'net'?
     523 |                 if (ret == XDP_TX && netif_is_bond_slave(xdp->rxq->dev))
         |                     ^~~
         |                     net
   include/net/xdp.h:523:21: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors


vim +500 include/net/xdp.h

   492	
   493	static __always_inline u32
 > 494	xdp_run(const struct bpf_mprog_entry *entry, struct xdp_buff *xdp)
   495	{
   496	        const struct bpf_mprog_fp *fp;
   497	        const struct bpf_prog *prog;
 > 498	        int ret = XDP_NEXT;
   499	
 > 500	        bpf_mprog_foreach_prog(entry, fp, prog) {
   501	                ret = __bpf_prog_run(prog, xdp, BPF_DISPATCHER_FUNC(xdp));
   502	                if (ret != XDP_NEXT)
   503	                        break;
   504	        }
   505		if (static_branch_unlikely(&bpf_master_redirect_enabled_key)) {
   506			if (ret == XDP_TX && netif_is_bond_slave(xdp->rxq->dev))
   507				ret = xdp_master_redirect(xdp);
   508		}
   509		return ret;
   510	}
   511	
   512	
   513	static __always_inline u32 bpf_prog_run_xdp(const struct bpf_prog *prog,
   514						    struct xdp_buff *xdp)
   515	{
   516		/* Driver XDP hooks are invoked within a single NAPI poll cycle and thus
   517		 * under local_bh_disable(), which provides the needed RCU protection
   518		 * for accessing map entries.
   519		 */
   520		u32 act = __bpf_prog_run(prog, xdp, BPF_DISPATCHER_FUNC(xdp));
   521	
   522		if (static_branch_unlikely(&bpf_master_redirect_enabled_key)) {
 > 523			if (ret == XDP_TX && netif_is_bond_slave(xdp->rxq->dev))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
