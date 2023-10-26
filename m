Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC812D784
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Oct 2023 10:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S+M4IO6x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698316758; x=1729852758;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TArEQvl4e3Ik3wgHcj9UHVDX3UUdo9e8MzoujcQ6Fec=;
  b=S+M4IO6x45MK71/mS3S87zcWFbiT5abO+oohreBWgvGv+M1ufyd6Jhl9
   Mx0z8PPj4+J4VwWGHdcwQTvXPmuHuRl59pEAW6FT5xmz7x+oVCz2xVdsv
   HRJdLM8ccEjbWI4lmaumbf2e+9iUUpHI3IWxLElBLKDF58Y2RQxtcgM9w
   qcy/9MfxGSMjAHzhcQ6ICZogmMcRm0Sth3pXJjuAkTSfWVOpZW9UGHurf
   u1NSSVZ1RXNUDhe5yAK6KXTlrLhqIBfzVcCdZWNOdHiCtCO1FqyKEhlm6
   eVj8krxp9pm5VpMRhC5r6YW/QiaHwD/toYZrRFPP7qt/1zy5Mm7Oo4k/r
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="367731935"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="367731935"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 03:39:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="788442452"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="788442452"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 26 Oct 2023 03:39:15 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvxlh-0009i2-15;
	Thu, 26 Oct 2023 10:39:13 +0000
Date: Thu, 26 Oct 2023 18:38:37 +0800
From: kernel test robot <lkp@intel.com>
To: David Wei <davidhwei@meta.com>
Cc: oe-kbuild-all@lists.linux.dev, Pavel Begunkov <asml.silence@gmail.com>
Subject: [isilence:zc/rx-latest 19/21] include/net/data_pool.h:68:10: error:
 implicit declaration of function 'io_zc_rx_buf_dma'; did you mean
 'io_zc_rx_put_buf'?
Message-ID: <202310261837.AMxjakLK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zc/rx-latest
head:   c56f6485dd778cce084741e5ac38ab9352287773
commit: 06833196dd231729be1f20f88717e5d0f48bf1c0 [19/21] io_uring/zcrx: store ifq + uarg in netdev_rx_queue
config: i386-buildonly-randconfig-002-20231026 (https://download.01.org/0day-ci/archive/20231026/202310261837.AMxjakLK-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231026/202310261837.AMxjakLK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310261837.AMxjakLK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/net/netdev_rx_queue.h:9:0,
                    from net/bpf/test_run.c:23:
   include/net/data_pool.h: In function 'data_pool_get_dma_addr':
>> include/net/data_pool.h:68:10: error: implicit declaration of function 'io_zc_rx_buf_dma'; did you mean 'io_zc_rx_put_buf'? [-Werror=implicit-function-declaration]
      return io_zc_rx_buf_dma(buf);
             ^~~~~~~~~~~~~~~~
             io_zc_rx_put_buf
   net/bpf/test_run.c: At top level:
   net/bpf/test_run.c:509:17: warning: no previous declaration for 'bpf_fentry_test1' [-Wmissing-declarations]
    __bpf_kfunc int bpf_fentry_test1(int a)
                    ^~~~~~~~~~~~~~~~
   net/bpf/test_run.c:515:14: warning: no previous declaration for 'bpf_fentry_test2' [-Wmissing-declarations]
    int noinline bpf_fentry_test2(int a, u64 b)
                 ^~~~~~~~~~~~~~~~
   net/bpf/test_run.c:520:14: warning: no previous declaration for 'bpf_fentry_test3' [-Wmissing-declarations]
    int noinline bpf_fentry_test3(char a, int b, u64 c)
                 ^~~~~~~~~~~~~~~~
   net/bpf/test_run.c:525:14: warning: no previous declaration for 'bpf_fentry_test4' [-Wmissing-declarations]
    int noinline bpf_fentry_test4(void *a, char b, int c, u64 d)
                 ^~~~~~~~~~~~~~~~
   net/bpf/test_run.c:530:14: warning: no previous declaration for 'bpf_fentry_test5' [-Wmissing-declarations]
    int noinline bpf_fentry_test5(u64 a, void *b, short c, int d, u64 e)
                 ^~~~~~~~~~~~~~~~
   net/bpf/test_run.c:535:14: warning: no previous declaration for 'bpf_fentry_test6' [-Wmissing-declarations]
    int noinline bpf_fentry_test6(u64 a, void *b, short c, int d, void *e, u64 f)
                 ^~~~~~~~~~~~~~~~
   net/bpf/test_run.c:544:14: warning: no previous declaration for 'bpf_fentry_test7' [-Wmissing-declarations]
    int noinline bpf_fentry_test7(struct bpf_fentry_test_t *arg)
                 ^~~~~~~~~~~~~~~~
   net/bpf/test_run.c:550:14: warning: no previous declaration for 'bpf_fentry_test8' [-Wmissing-declarations]
    int noinline bpf_fentry_test8(struct bpf_fentry_test_t *arg)
                 ^~~~~~~~~~~~~~~~
   net/bpf/test_run.c:555:17: warning: no previous declaration for 'bpf_fentry_test9' [-Wmissing-declarations]
    __bpf_kfunc u32 bpf_fentry_test9(u32 *a)
                    ^~~~~~~~~~~~~~~~
   net/bpf/test_run.c:560:15: warning: no previous declaration for 'bpf_fentry_test_sinfo' [-Wmissing-declarations]
    void noinline bpf_fentry_test_sinfo(struct skb_shared_info *sinfo)
                  ^~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:564:17: warning: no previous declaration for 'bpf_modify_return_test' [-Wmissing-declarations]
    __bpf_kfunc int bpf_modify_return_test(int a, int *b)
                    ^~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:570:17: warning: no previous declaration for 'bpf_modify_return_test2' [-Wmissing-declarations]
    __bpf_kfunc int bpf_modify_return_test2(int a, int *b, short c, int d,
                    ^~~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:577:14: warning: no previous declaration for 'bpf_fentry_shadow_test' [-Wmissing-declarations]
    int noinline bpf_fentry_shadow_test(int a)
                 ^~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:599:18: warning: no previous declaration for 'bpf_kfunc_call_test_release' [-Wmissing-declarations]
    __bpf_kfunc void bpf_kfunc_call_test_release(struct prog_test_ref_kfunc *p)
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:604:18: warning: no previous declaration for 'bpf_kfunc_call_memb_release' [-Wmissing-declarations]
    __bpf_kfunc void bpf_kfunc_call_memb_release(struct prog_test_member *p)
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/net/netdev_rx_queue.h:9:0,
                    from net/core/dev.c:155:
   include/net/data_pool.h: In function 'data_pool_get_dma_addr':
>> include/net/data_pool.h:68:10: error: implicit declaration of function 'io_zc_rx_buf_dma'; did you mean 'io_zc_rx_put_buf'? [-Werror=implicit-function-declaration]
      return io_zc_rx_buf_dma(buf);
             ^~~~~~~~~~~~~~~~
             io_zc_rx_put_buf
   cc1: some warnings being treated as errors


vim +68 include/net/data_pool.h

12dc8fb31eef5b David Wei 2023-08-14  60  
12dc8fb31eef5b David Wei 2023-08-14  61  static inline dma_addr_t data_pool_get_dma_addr(struct data_pool *dp,
12dc8fb31eef5b David Wei 2023-08-14  62  						struct page *page)
12dc8fb31eef5b David Wei 2023-08-14  63  {
12dc8fb31eef5b David Wei 2023-08-14  64  	if (dp->zc_ifq) {
12dc8fb31eef5b David Wei 2023-08-14  65  		struct io_zc_rx_buf *buf;
12dc8fb31eef5b David Wei 2023-08-14  66  
12dc8fb31eef5b David Wei 2023-08-14  67  		buf = io_zc_rx_buf_from_page(dp->zc_ifq, page);
12dc8fb31eef5b David Wei 2023-08-14 @68  		return io_zc_rx_buf_dma(buf);
12dc8fb31eef5b David Wei 2023-08-14  69  	} else {
12dc8fb31eef5b David Wei 2023-08-14  70  		return page_pool_get_dma_addr(page);
12dc8fb31eef5b David Wei 2023-08-14  71  	}
12dc8fb31eef5b David Wei 2023-08-14  72  }
12dc8fb31eef5b David Wei 2023-08-14  73  

:::::: The code at line 68 was first introduced by commit
:::::: 12dc8fb31eef5b38ff1a0e78b23a701aecbf2f29 netdev/bnxt: add data pool and use it in BNXT driver

:::::: TO: David Wei <davidhwei@meta.com>
:::::: CC: Pavel Begunkov <asml.silence@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
