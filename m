Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF1415E5D4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Dec 2024 19:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734463937; cv=none; b=FaIi7OqFfFF+3qDn7J8HDg2sczG2OTgG1KwintoGfKK2sKAO5TfSyKWUluGXPsnOtHcIa+z9YIsxA22R34YEtHV/xowoNesRG5wzFyNuqHEg0MvYFcxyyxoS8CRpym1xIjYu0146qCaktPRBtxIhgjZuIqcH6pxnYtkcmEJrWps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734463937; c=relaxed/simple;
	bh=7EMrEjVOPdOx3ziGOvLnu0OdVV4pF6dahFPST0ZdZCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pVQL4RQLYpuofX8WpFTdAAzelIncRxIq/kcq4GB/UL+ChLo4L+Xj0EntZofkpYAu7+jUggRWwK0rgljtGu9x7kvuoQ/rgP7Maa2i0HybDXPKkJZYeW7GXyuAozk8BkP9I8rxjze20QDRW0nDQdoTblT/NbODikZ0ois1kH1HDto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IgCmskMt; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IgCmskMt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734463935; x=1765999935;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7EMrEjVOPdOx3ziGOvLnu0OdVV4pF6dahFPST0ZdZCQ=;
  b=IgCmskMteliHnmVSlBbxNimsNsNY4QQlhKFdcZbvMYVc5vHhPsH6pZdJ
   cO1+fEab1eQc0+v5BZaUeQLc5UY/TjGLZGTTyuDBLqpSKB+Xsm+YYEF9s
   vaujV+nnhfneB6/8+46m3/H9FtASTvYpIG1LIevK3dYpn3O+uWLcdE0aE
   EBWdxpBl78vuy94r4VmTPqqAaZS/hMBJOJZUqxOxn8tkGfGukFAa1iYIY
   CksyJQS2FDvkbg5BRXfVgzGAYrADKYCgD6qycmAeyT+OnCWcl+8kdbXx/
   1+Z9ABZzSVB+Y16AttEonkjcBszzqYteiYN92oHkUI3JGkQZihtY109iT
   Q==;
X-CSE-ConnectionGUID: ggM67N72RXq5GFjmak3XEA==
X-CSE-MsgGUID: 3q63QGyrRHyI3lyKrTw3dQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="46317486"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="46317486"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 11:32:14 -0800
X-CSE-ConnectionGUID: 7r5dWyXgQdGn1LQ8MNvBSw==
X-CSE-MsgGUID: mDL4A7GdTUOWAQDUEof3dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; 
   d="scan'208";a="98206097"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Dec 2024 11:32:13 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNdIg-000FkM-2c;
	Tue, 17 Dec 2024 19:32:10 +0000
Date: Wed, 18 Dec 2024 03:31:28 +0800
From: kernel test robot <lkp@intel.com>
To: Elizabeth Figura <zfigura@codeweavers.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6 18/28] selftests: ntsync: Add some tests for wakeup
 signaling with WINESYNC_IOC_WAIT_ANY.
Message-ID: <202412180334.zbe09AGk-lkp@intel.com>
References: <20241209185904.507350-19-zfigura@codeweavers.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209185904.507350-19-zfigura@codeweavers.com>

Hi Elizabeth,

kernel test robot noticed the following build warnings:

[auto build test WARNING on cdd30ebb1b9f36159d66f088b61aee264e649d7a]

url:    https://github.com/intel-lab-lkp/linux/commits/Elizabeth-Figura/ntsync-Introduce-NTSYNC_IOC_WAIT_ANY/20241210-031155
base:   cdd30ebb1b9f36159d66f088b61aee264e649d7a
patch link:    https://lore.kernel.org/r/20241209185904.507350-19-zfigura%40codeweavers.com
patch subject: [PATCH v6 18/28] selftests: ntsync: Add some tests for wakeup signaling with WINESYNC_IOC_WAIT_ANY.
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241218/202412180334.zbe09AGk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412180334.zbe09AGk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ntsync.c:659:24: warning: passing '__u32 *' (aka 'unsigned int *') to parameter of type 'const int *' converts between pointers to integer types with different sign [-Wpointer-sign]
     659 |         ret = wait_any(fd, 1, &mutex_args.mutex, 123, &index);
         |                               ^~~~~~~~~~~~~~~~~
   ntsync.c:95:53: note: passing argument to parameter 'objs' here
      95 | static int wait_any(int fd, __u32 count, const int *objs, __u32 owner, __u32 *index)
         |                                                     ^
   1 warning generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
