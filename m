Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C6932936B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Nov 2025 15:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763133232; cv=none; b=JaZGa9kg9fS7YLPpycH47AY7b1s3xUu6Qz+kq7ZWeFc5S0qg61Bm2FsYZR/oVNbqNcbshSJ2NZgdy6G5a/PRyiVfIFzyYuutbXfCRQiaYsVMZ5Fpz5+90/l65rKGONLQBYZ6ESjRW7utoDPeyDqC2Yg2JcBOKJ/Qz/0N1WwFhbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763133232; c=relaxed/simple;
	bh=q/w61X4eSLpMyqYLaKrsJYuIFFFw8567522OBzTLV7M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G+XH7wJ7HxL4jXDyqoDii+zrIzYUXkAG2FOguTAjKLcSZMc8KDDmNNkfYbcIe5tPvw0KOx167UJ0AOOfWVGjA6WUNUq5B0IDqG1/zKuVNEsQZ7srPKgnnmCBPvxntTc5QLrR5kCZB72cIrf5zMUa8EwCNESDYQCjcv+dkwULiFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nVQk4/sN; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nVQk4/sN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763133230; x=1794669230;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q/w61X4eSLpMyqYLaKrsJYuIFFFw8567522OBzTLV7M=;
  b=nVQk4/sNOwQRFxB9n77LjLf3+azZBrdHz3wXbwzJ63D/lStJja523CTS
   emDSPwyim0qXShIwReLLqk2A/nF4IPB5dPa/Z5X18QWZU1HBQ11jf1EZI
   FdncJREed1NJJGGEtssDj+y73JSxK+ywreXIHogGL3if+AL9vUzxPy2c3
   RSyQEPwk9WKD0wkhqa4R9pDUJxnN+Z+D+Qf/32/NlGkwwjbgGCsloexh4
   zCjH6tF9vQkTtGqOGpEodJQwE/wayGQIH6FddizbJSkt8fSLqQsoE937+
   iq3bckGBXD1f7rVVO+GyQTOsopWWfIfCLpgJlrilKt2SyS4mI/qJPrBtz
   Q==;
X-CSE-ConnectionGUID: vtnHCZoaRlK34QLFcpNjyQ==
X-CSE-MsgGUID: ZcOxOKQhRdSSb4LmR4Lofw==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="76330710"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="76330710"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 07:13:49 -0800
X-CSE-ConnectionGUID: aR0RZDfoQQCPkU43iDgsIg==
X-CSE-MsgGUID: +12Kw9gqQJOyQV5FAyBeMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="189447510"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Nov 2025 07:13:48 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJvUg-0006hT-1L;
	Fri, 14 Nov 2025 15:13:46 +0000
Date: Fri, 14 Nov 2025 23:13:18 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 838/875]
 fs/bcachefs/data/reconcile.c:41:5-8: Unneeded variable: "ret". Return "0" on
 line 52
Message-ID: <202511142318.qAXE8Mzx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   ab3c04679170b0e63c55680f725ceb4218b2b04c
commit: c1fc23d36252bcd92fa62bd40ae4282025050278 [838/875] bcachefs: bch2_extent_reconcile_validate()
config: um-randconfig-r061-20251114 (https://download.01.org/0day-ci/archive/20251114/202511142318.qAXE8Mzx-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511142318.qAXE8Mzx-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/data/reconcile.c:41:5-8: Unneeded variable: "ret". Return "0" on line 52

vim +41 fs/bcachefs/data/reconcile.c

    35	
    36	int bch2_extent_reconcile_validate(struct bch_fs *c,
    37					   struct bkey_s_c k,
    38					   struct bkey_validate_context from,
    39					   const struct bch_extent_reconcile *r)
    40	{
  > 41		int ret = 0;
    42	
    43		bkey_fsck_err_on(r->pending && !(r->need_rb & BIT(BCH_REBALANCE_background_target)),
    44				 c, extent_reconcile_bad_pending,
    45				 "pending incorrectly set");
    46	
    47		bkey_fsck_err_on(r->hipri && !(r->need_rb & BIT(BCH_REBALANCE_data_replicas)),
    48				 c, extent_reconcile_bad_pending,
    49				 "hipri incorrectly set");
    50	
    51	fsck_err:
  > 52		return ret;
    53	}
    54	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
