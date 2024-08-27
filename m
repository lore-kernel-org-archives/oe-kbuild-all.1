Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F381D318A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Aug 2024 21:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724795541; cv=none; b=hr8RCs7J8V7IBNa/TZUIj/6MBAzscIVXTwvpqIjG9lVE/B/h3tcchIK5qgjramlfrD1fIjCZpCE/4S1pFbpDdhKxyno9vl3TnrplTwkVbLKwwzZ1D/vbsUFvs56t+h4BYykOIUmSPZW20WXmhz/LmScDQRanLDmALRLjXmnxp1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724795541; c=relaxed/simple;
	bh=twmyeCxmcKgRG2NAR7ErOJBp73r4lwo7gEoqxBrtLEI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BwsUNo7jpORIJaRewsdYFtGjMPxgZcuO0F8BEAdypE15bScr5/sArEpQgulXLZCdjbSpAqu/6vHZ6RJRjzNT5B3HjNnEVvGSl/RFutOpPnQlM47N3YOMGiF25QFd4gZ7YZVlbouthS+6j8JmJF5g4zrqPYXO5QUvrpF5l1YkD+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JhJAzCw/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JhJAzCw/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724795540; x=1756331540;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=twmyeCxmcKgRG2NAR7ErOJBp73r4lwo7gEoqxBrtLEI=;
  b=JhJAzCw/lm3OBmO8ZoITI9wGP9ThKSW1t9hJZm7BNT+OSAZ7twNPDMoq
   buAPT5c729ZFdhkTDuaye2MCBym1+HlQFYi2Mxwy2GrPyBZVdLV+ThjYt
   pXJp8Kf5Mug9lOoRi5puWAummTms1X0Q9RQLZ38nhT/LPm+fZ72v15BBE
   RObvZql+MOQYeeU3HMIYm0L6kpmbNU1lXYfB1ykyPKkP/FgE6jlR0CkKT
   ZNbsaGrURE+ft9g4EgW8eJHDOXrNBRnao0FYz0seFTVksnqL96BlwsScr
   Y77MJkHLDp2kOPu35GyBLoKw8pJEOjNQKFz85Y2P9/q1/JfR97NEJuF4s
   w==;
X-CSE-ConnectionGUID: y0IXKHgVTNCSyPDExE7TAQ==
X-CSE-MsgGUID: R6lkM46STAmIw0foo5tDcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="27094267"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="27094267"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 14:52:20 -0700
X-CSE-ConnectionGUID: DHj8AUp+TmaqkZbL1iPrYw==
X-CSE-MsgGUID: vv7hcaVJRdehoDDaQFWorw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="63002572"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 27 Aug 2024 14:52:18 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sj46q-000K7I-0G;
	Tue, 27 Aug 2024 21:52:16 +0000
Date: Wed, 28 Aug 2024 05:51:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, liwei <liwei728@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 26549/30000] kernel/static_call_inline.c:468:5:
 warning: no previous prototype for function 'klp_static_call_register'
Message-ID: <202408280504.viXVjhyZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   b32a887db4e5c4c061e61977efabbc1d5e867aa7
commit: 581f41f797bd88092689c43c47ee06a8ab2eec7f [26549/30000] static_call: Don't make __static_call_return0 static
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240828/202408280504.viXVjhyZ-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240828/202408280504.viXVjhyZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408280504.viXVjhyZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/static_call_inline.c:468:5: warning: no previous prototype for function 'klp_static_call_register' [-Wmissing-prototypes]
     468 | int klp_static_call_register(struct module *mod)
         |     ^
   kernel/static_call_inline.c:468:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     468 | int klp_static_call_register(struct module *mod)
         | ^
         | static 
   1 warning generated.


vim +/klp_static_call_register +468 kernel/static_call_inline.c

   467	
 > 468	int klp_static_call_register(struct module *mod)
   469	{
   470		return 0;
   471	}
   472	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
