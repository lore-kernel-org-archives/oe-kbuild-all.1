Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C027E564
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Mar 2024 10:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710845854; cv=none; b=dgxbEfJ9HUqtYkUq/SMNSgSytZ8KAR4i7PEtT1+711QQHhgmnznUyblLRchjfurFwsecJz8seuReTxb5ATrsOEmfv1EBj92InXUUhvgltP9Kkg7s62ONrz2+z0kCZDWCTW3+bQDNB7F8OYBAp/XOeMh+UauHivsuxN7GnHl1xaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710845854; c=relaxed/simple;
	bh=7WjBFbfaPTqthjHaQtiYiuDy05031AFBpmZxPXnxcNU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MtCNtpuuJlsXJUNBjWYqG73Csu6BbKJ6g/h+02wBx3xwZ2oAgz0nbJAqcVLPNnrDYCGVeOiL8V36RyBV6Cgk4HeMkNqK2FvlQR8vOGc/454/UtmBswTfDhycIG6iKLjTcpEd4ReVzpaRbeqFYkU+wc62Q7QvlBHlXDo0Y4XfMeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lPNBAij3; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lPNBAij3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710845853; x=1742381853;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7WjBFbfaPTqthjHaQtiYiuDy05031AFBpmZxPXnxcNU=;
  b=lPNBAij3B30Xz/tm2sOdGUc9OwqPXAGjcJGv806iPcaERtun8LKWPJ3h
   YVWh49FWYoVCBgSmCKKFv27pP224JodzQEDXZKX8m7R/sPYVvFSrJC6xG
   EUyjVCzaZl++nyHqJCr8afYbPpwYItKQ62LrfvGJJptpFAP0RahXeCdLb
   qRAh7Fk1mKmm5gq04+Z4MG244c/kJlC0XF7b/HlqnFZBEpZeRuLHGBy/u
   3R2RmlAbJaHvr1jGoa035RdnByviNqixiXc/OUBCEiSCb2U+rLekayCUK
   DhHHmE4KeUVV8i+tNyhxUks0jbw/uEemSPkCkMRXgufApyNUU515J02wK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5580617"
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; 
   d="scan'208";a="5580617"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 03:57:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; 
   d="scan'208";a="44847322"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Mar 2024 03:57:31 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmX9t-000HhL-0F;
	Tue, 19 Mar 2024 10:57:29 +0000
Date: Tue, 19 Mar 2024 18:56:30 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Michal Kubiak <michal.kubiak@intel.com>
Subject: [alobakin:idpf-libie-new 55/62] include/net/libeth/xdp.h:897:31:
 error: expected ')' before string constant
Message-ID: <202403191802.xenA39x2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie-new
head:   bd6cbf909a63bdb84a1721ec8a07e893a64c9af8
commit: 1d1701054144cadc91c2de7c2be8a6b761ca3f24 [55/62] idpf: add support for XDP on Rx
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240319/202403191802.xenA39x2-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240319/202403191802.xenA39x2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403191802.xenA39x2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/compiler_types.h:151,
                    from <command-line>:
>> include/net/libeth/xdp.h:897:31: error: expected ')' before string constant
     897 |         __diag_ignore(GCC, 5, "-Wold-style-declaration",                     \
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler-gcc.h:141:56: note: in definition of macro '__diag_GCC'
     141 |         __diag_GCC_ ## version(__diag_GCC_ ## severity s)
         |                                                        ^
   include/net/libeth/xdp.h:897:9: note: in expansion of macro '__diag_ignore'
     897 |         __diag_ignore(GCC, 5, "-Wold-style-declaration",                     \
         |         ^~~~~~~~~~~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.c:3247:1: note: in expansion of macro 'LIBETH_XDP_DEFINE_START'
    3247 | LIBETH_XDP_DEFINE_START();
         | ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.c:3248:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
    3248 | LIBETH_XDP_DEFINE_RUN(static idpf_xdp_run_pass, idpf_xdp_run_prog,
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/intel/idpf/idpf_xdp.h:7,
                    from drivers/net/ethernet/intel/idpf/idpf_txrx.c:6:
   include/net/libeth/xdp.h:921:42: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
     921 | name(struct libeth_xdp_buff *xdp, struct libeth_xdp_tx_bulk *bq)             \
         |                                          ^~~~~~~~~~~~~~~~~~
   include/net/libeth/xdp.h:926:14: note: in expansion of macro '__LIBETH_XDP_DEFINE_RUN_PROG'
     926 |         bool __LIBETH_XDP_DEFINE_RUN_PROG(name, flush, xdp)
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/xdp.h:940:9: note: in expansion of macro 'LIBETH_XDP_DEFINE_RUN_PROG'
     940 |         LIBETH_##pfx##_DEFINE_RUN_PROG(static run, flush);                   \
         |         ^~~~~~~
   include/net/libeth/xdp.h:943:9: note: in expansion of macro '__LIBETH_XDP_DEFINE_RUN'
     943 |         __LIBETH_XDP_DEFINE_RUN(name, run, flush, populate, XDP)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.c:3248:1: note: in expansion of macro 'LIBETH_XDP_DEFINE_RUN'
    3248 | LIBETH_XDP_DEFINE_RUN(static idpf_xdp_run_pass, idpf_xdp_run_prog,
         | ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.c:3250:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
    3250 | LIBETH_XDP_DEFINE_FINALIZE(static idpf_xdp_finalize_rx, idpf_xdp_tx_flush_bulk,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/compiler_types.h:151,
                    from <command-line>:
>> include/net/libeth/xdp.h:897:31: error: expected ')' before string constant
     897 |         __diag_ignore(GCC, 5, "-Wold-style-declaration",                     \
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler-gcc.h:141:56: note: in definition of macro '__diag_GCC'
     141 |         __diag_GCC_ ## version(__diag_GCC_ ## severity s)
         |                                                        ^
   include/net/libeth/xdp.h:897:9: note: in expansion of macro '__diag_ignore'
     897 |         __diag_ignore(GCC, 5, "-Wold-style-declaration",                     \
         |         ^~~~~~~~~~~~~
   drivers/net/ethernet/intel/idpf/idpf_xdp.c:355:1: note: in expansion of macro 'LIBETH_XDP_DEFINE_START'
     355 | LIBETH_XDP_DEFINE_START();
         | ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/idpf/idpf_xdp.c:356:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
     356 | LIBETH_XDP_DEFINE_TIMER(static idpf_xdp_tx_timer, idpf_clean_xdp_irq);
         | ^~~~~~~~~~~~~~~~~~~~~~~


vim +897 include/net/libeth/xdp.h

a641926e351f95b Alexander Lobakin 2023-12-11  894  
a641926e351f95b Alexander Lobakin 2023-12-11  895  #define LIBETH_XDP_DEFINE_START()					     \
a641926e351f95b Alexander Lobakin 2023-12-11  896  	__diag_push();							     \
a641926e351f95b Alexander Lobakin 2023-12-11 @897  	__diag_ignore(GCC, 5, "-Wold-style-declaration",		     \
a641926e351f95b Alexander Lobakin 2023-12-11  898  		      "Allow specifying 'static' after the return type")
a641926e351f95b Alexander Lobakin 2023-12-11  899  

:::::: The code at line 897 was first introduced by commit
:::::: a641926e351f95b0e2fad7733bcc634256adcc21 libie: add a couple of XDP helpers

:::::: TO: Alexander Lobakin <aleksander.lobakin@intel.com>
:::::: CC: Alexander Lobakin <aleksander.lobakin@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
