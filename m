Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E40134405
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Apr 2024 18:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713290797; cv=none; b=eTpyFVlY5VtZ+bZ+WOePLTHLJR0TsuYvHYJgfkelb4Qx2LYa1X5Xi7JMJ4Rh85eWvkfNE/atQ8qgcMLncu8inWPGLi79FGUDX3+O/tsLzCv1KytKXeJUyKvX9lTXq9DqADORm/6mF+95ypj1f42PK0iR25X1Ohe++VBf6pTo4Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713290797; c=relaxed/simple;
	bh=pbf+ai+TSwkKZpz8azE9GVVx74Rjc2DZgMBBIO8MbYs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s/LzSQ5PEZcgELg1Ywk9t/OB3HEc8ifxhbvsyZAgIVs4m52pvbuVMM+EKfkwKOG6h/XZ5iAtKbRhid+G6FBFBTCaAbEMpnKOvH74YipHeUeRLY8TXAOUBtZuMgnLBiLZNceoKVF2+Nm3s93Q+apFqGkbcLiyfaBdGtBu6khz1uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UFSh5HL1; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UFSh5HL1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713290796; x=1744826796;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pbf+ai+TSwkKZpz8azE9GVVx74Rjc2DZgMBBIO8MbYs=;
  b=UFSh5HL1Dj/V3Ddn5Xn4XCQLfYoMcIiHZzf1afgELwfrotKvc0LovZz9
   JcVcqt8gJqxwlf6L4F9n6cLm11h3AkiViAGzAlDs7Rw89anmpPqHTY2Wb
   zwiRuOKy3A3JSDmvwNptCB/qrgPA7+eQLtEjHIoLMBNSKTsUD5N+98aVY
   yyJvf2yu8TaePqgz8iOmlAaf/6MHmpSRbUv7bebl0uPWOVCf9CQbgwsx8
   fEBadT8mCIKvanxCb2zU0n1fagpTfh6j20SWDelLH5azb8l1mXlQi7GJE
   AIhGgNy/ivGJ8bFxUz3ncHSwCned1S6QOuOO48ywdidLVlSOL4N41JP5b
   Q==;
X-CSE-ConnectionGUID: y5+kI1jBQKGhqXeI/nF52w==
X-CSE-MsgGUID: Fjd9QD5USp+2uDQC0zClDQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="19307960"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="19307960"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 11:06:26 -0700
X-CSE-ConnectionGUID: j66UwBhdQo2asRWJkDh/OQ==
X-CSE-MsgGUID: NFvZDtVtTO6Bg786bMvA0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="53321654"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 16 Apr 2024 11:06:25 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwnCI-0005d6-0q;
	Tue, 16 Apr 2024 18:06:22 +0000
Date: Wed, 17 Apr 2024 02:05:33 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:rxrpc-iothread 16/16] net/rxrpc/input.c:814:47:
 warning: suggest parentheses around '-' inside '<<'
Message-ID: <202404170101.x6IbB82t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git rxrpc-iothread
head:   0a6ac49e304f1644db056801640e1976a83a484f
commit: 0a6ac49e304f1644db056801640e1976a83a484f [16/16] rxrpc: Use the new rxrpc_tx_queue struct to more efficiently process ACKs
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240417/202404170101.x6IbB82t-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240417/202404170101.x6IbB82t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404170101.x6IbB82t-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/rxrpc/input.c: In function 'rxrpc_input_soft_acks':
>> net/rxrpc/input.c:814:47: warning: suggest parentheses around '-' inside '<<' [-Wparentheses]
     814 |                         rotate_into |= __bit0 << sizeof(rotate_into) * 8 - 1; \
         |                                               ^~
   net/rxrpc/input.c:915:17: note: in expansion of macro 'shiftr_adv_rotr'
     915 |                 shiftr_adv_rotr(acks, extracted);
         |                 ^~~~~~~~~~~~~~~


vim +814 net/rxrpc/input.c

   799	
   800	#ifdef CONFIG_X86
   801	#define shiftr_adv_rotr(shift_from, rotate_into) ({			\
   802				asm(" shr%z1 %1\n"				\
   803				    " inc %0\n"					\
   804				    " rcr%z2 %2\n"				\
   805				    : "+d"(shift_from), "+m"(*shift_from), "+rm"(rotate_into) \
   806				    );						\
   807			})
   808	#else
   809	#define shiftr_adv_rotr(shift_from, rotate_into) ({	\
   810				typeof(rotate_into) __bit0 = *shift_from & 1;	\
   811				*shift_from >>= 1;				\
   812				shift_from++;					\
   813				rotate_into >>= 1;				\
 > 814				rotate_into |= __bit0 << sizeof(rotate_into) * 8 - 1; \
   815			})
   816	#endif
   817	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
