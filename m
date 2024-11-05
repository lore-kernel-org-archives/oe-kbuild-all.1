Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA9C762D2
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Nov 2024 08:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730794939; cv=none; b=ZC+ofvegCQQTphCNelFmKTZLWcdpMgYB0JVv9ORidMaWZoCGXnODm5ylPExep2wV2hGlPelmIyd5uQK5q6HwlairFjEsitUKE1hQ3FNBJmnHbMcgw47Wps9qM2io1YweA+meFZ+jMIopSeMW6YBgmvb+bT5cKnacpCFu3ZrScSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730794939; c=relaxed/simple;
	bh=zTFyFt70v7yjiXNXP5qK+yoVwvUOKzEBvc1D7j488dA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s0YnTejoBwvRbWIUxMF53K+dirEhw9AHkoYkKZBqWjJQUC/EPUv+Sqn9yNw3A8lTrZ3+ef3YN0Dzy/QAYXibdYA7qcglwPpULf34n/+Z3+YKXI/+NWpy6pDDfv0ZTRavVQBCiSLWBtxn9KZYgZQZimecC5lJEWBZCjCyorcBGXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mAezAvvL; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mAezAvvL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730794938; x=1762330938;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zTFyFt70v7yjiXNXP5qK+yoVwvUOKzEBvc1D7j488dA=;
  b=mAezAvvLdpthLBHCPByK2eet/zOYrFT0IEufkQFTMUVj+AGlD6foshUy
   eS/gkoLGC0GwFsF+wGWoKDDkdBvTMPMHiLVwRiToWkfws/7QGRXQG7QIG
   njv13YCcBpVZMZVTbJMDuN90meHjMvvDAcoKPtyW1N95WPabb7IDd1h3n
   FXFurri04Pn5M34pBrbieQdATA1jH7AUyiS4c+H2Vad+sCj2sP5uwSFBx
   nN8+6flw2JakT31lB589aZVJScxgl+AL+ORjp6ivheSg4Gc0oYB9bFZ8o
   B4kR1/eqCt0RHa96gu2F4jcsssbvfc4pRFs+enszyFMMlxtDHGzN7a2aW
   w==;
X-CSE-ConnectionGUID: ZVjx3s+tR+GJpQnn4/BLVw==
X-CSE-MsgGUID: 2LDKVm5JRCGlGussMDIj/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="18146547"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="18146547"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 00:22:16 -0800
X-CSE-ConnectionGUID: C+8ouhQXSYu3Xqo1er8ECA==
X-CSE-MsgGUID: FLpSwgK6S5O8aAFLhkuHaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="83813876"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 05 Nov 2024 00:22:15 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8EpI-000loP-2r;
	Tue, 05 Nov 2024 08:22:12 +0000
Date: Tue, 5 Nov 2024 16:21:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1257/1257] net/9p/.tmp_client.o:
 warning: objtool: missing symbol for section .init.text
Message-ID: <202411051635.WyTNB2ku-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   0c1156b86933300fc91692f839a7f6e0676f55d7
commit: a6fb923f7803f40a567445dfe1ff3a539c8adc1f [1257/1257] 9p: Use a slab for allocating requests
config: x86_64-buildonly-randconfig-002-20241102 (https://download.01.org/0day-ci/archive/20241105/202411051635.WyTNB2ku-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411051635.WyTNB2ku-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411051635.WyTNB2ku-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/9p/client.c:376: warning: Function parameter or member 'c' not described in 'p9_client_cb'
   net/9p/client.c:376: warning: Function parameter or member 'req' not described in 'p9_client_cb'
   net/9p/client.c:376: warning: Function parameter or member 'status' not described in 'p9_client_cb'
   net/9p/client.c:523: warning: Function parameter or member 'uidata' not described in 'p9_check_zc_errors'
   net/9p/client.c:774: warning: Function parameter or member 'in_hdrlen' not described in 'p9_client_zc_rpc'
   net/9p/client.c:774: warning: Excess function parameter 'hdrlen' description in 'p9_client_zc_rpc'
   net/9p/.tmp_client.o: warning: objtool: parse_opts()+0x2c3: sibling call from callable instruction with modified stack frame
   net/9p/.tmp_client.o: warning: objtool: p9_client_destroy()+0x6f: sibling call from callable instruction with modified stack frame
   net/9p/.tmp_client.o: warning: objtool: p9_client_readdir()+0x179: sibling call from callable instruction with modified stack frame
   net/9p/.tmp_client.o: warning: objtool: p9_client_write()+0x10d: sibling call from callable instruction with modified stack frame
   net/9p/.tmp_client.o: warning: objtool: p9_client_read()+0x1f8: sibling call from callable instruction with modified stack frame
   net/9p/.tmp_client.o: warning: objtool: p9_client_clunk()+0x13: sibling call from callable instruction with modified stack frame
>> net/9p/.tmp_client.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
