Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B39EA48
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 00:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735863098; cv=none; b=k+dMkl3vFejKobuP9p9jD44XPdp2pCE2cFl5ESGWSSlkkmtzMM3+pm0bqXd4P2quROQ1FqFD4A4uWhncCUe03n0qkN+JoBfXGlKHovW0F/VcXx0H6T+b/A9Pcq+Fd0/bQM05hUeHFykWjM2HzzB9RRHIuwRRhmH6RZRClcDAVHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735863098; c=relaxed/simple;
	bh=TyEtaaK5VY3R1cHIA1tDEagJZ856t3zeMItPEzRf7js=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KDhTbk4XqWcn96ZkyRv/WPg1xX36JNxS5x30KyzwyfZCbikMFqP+TuTuyHNDS1eNMFwfWf33oRIDVOp8ijeQy91/fiL66hsQttciErA/y227J/WycADE/9ghnWOweumuIvu9aYt5Vzqe6Oj8unLkOHQmOflzSaHp3VPQyhPaEXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hQz0z/S4; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hQz0z/S4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735863096; x=1767399096;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TyEtaaK5VY3R1cHIA1tDEagJZ856t3zeMItPEzRf7js=;
  b=hQz0z/S4BvLq84C6IwXjDpaU/b2dzcmuMSd8HMmZoSpm0X3rwPfvlh8z
   WwnJpVrqzrdr+EEmegIvvd75ulc+dCCMbHqZ1ISTAal0y4bl9vAtU5EEV
   MgNoU7eg+B2FDLW1PtKXXwhfBovC+6BOEGT85fawA6Vmfd8jBO/XklY3v
   +q4jIuRn3uTKSg1sBiQ2VjD7BhO005ZtLPgu63MCPiCbtfp3AQNBA4NXO
   /txe1Fv/1t/W3oOaFFBN73UvjpnXFeqBHyeXW8sBSNKt62Weuzg4q8RP+
   Ip5nfyRSD4XtXMELh5QQ1RernxSJXfPMuYB8gfsiFkvF5PumhA8iVbge9
   w==;
X-CSE-ConnectionGUID: g6lG6i+xT0iLiq8qIngkSg==
X-CSE-MsgGUID: Ol/1qZb7QIKr60rbnym0cQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="23704241"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="23704241"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 16:11:36 -0800
X-CSE-ConnectionGUID: w5pmUlDiRSybevKmvdaXtw==
X-CSE-MsgGUID: PG4Ikd2AR3ygcmnpOfDDPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="106503070"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 02 Jan 2025 16:11:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTVHo-0008z3-35;
	Fri, 03 Jan 2025 00:11:32 +0000
Date: Fri, 3 Jan 2025 08:10:45 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/v10-wip 24/26] ERROR: modpost: "io_iov_get_page"
 [drivers/net/veth.ko] undefined!
Message-ID: <202501030816.nnFBjbb9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/v10-wip
head:   1e1214d152c4b21b5bc3e9b37e26cd60ed14632b
commit: 26d3d6fd0fa6f3e197318e94775a218dbbc91047 [24/26] [NOT-FOR-UPSTREAM] veth: add support for io_uring zc rx
config: i386-buildonly-randconfig-001-20250103 (https://download.01.org/0day-ci/archive/20250103/202501030816.nnFBjbb9-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501030816.nnFBjbb9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501030816.nnFBjbb9-lkp@intel.com/

All error/warnings (new ones prefixed by >>, old ones prefixed by <<):

In file included from io_uring/uring_cmd.c:5:
In file included from include/linux/io_uring/cmd.h:6:
In file included from include/linux/io_uring_types.h:4:
In file included from include/linux/blkdev.h:9:
In file included from include/linux/blk_types.h:10:
In file included from include/linux/bvec.h:10:
In file included from include/linux/highmem.h:8:
In file included from include/linux/cacheflush.h:5:
In file included from arch/x86/include/asm/cacheflush.h:5:
In file included from include/linux/mm.h:2223:
include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
|                               ~~~~~~~~~~~ ^ ~~~
In file included from io_uring/uring_cmd.c:6:
In file included from include/linux/io_uring/net.h:5:
>> include/net/page_pool/types.h:162:56: warning: declaration of 'struct sk_buff' will not be visible outside of this function [-Wvisibility]
162 |         int (*nl_report)(const struct page_pool *pool, struct sk_buff *rsp);
|                                                               ^
2 warnings generated.
--
ERROR: modpost: "netdev_rx_queue_restart" [drivers/net/ethernet/broadcom/bnxt/bnxt_en.ko] undefined!
>> ERROR: modpost: "io_iov_get_page" [drivers/net/veth.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
