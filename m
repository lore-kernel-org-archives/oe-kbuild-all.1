Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB1630F7E2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Aug 2025 09:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755510489; cv=none; b=TYskZllnUa69xbX5ltdfm/YRXqt5SvMwz2OetN1WLfX63A6rnVNx3SilnUVJGpzLgPeSr4t2l7oWCfhwiD5Hpb4b39bUEhc6u4mkhMgIPrsTfvapIx1YxQ3uGIwuQIyNvlxToXHvPOm4KHYvKvm+zfqwTvo2xgQgoVp5pTC/M2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755510489; c=relaxed/simple;
	bh=v2Z9PWijXxTUNEsvvGAUqxq2MAMC1xPnlEk0aLN0Ats=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VDZuj3YSr913LnNTJTXYM7Bf4yfUasfBV87eIf8xJ4CtCaiBcXD89staVZB3zFAQKvpHc61LJeCJIaSQ3f1Z93mwyhhTqtTylwuNe1vzAjHAMwcGvm5jY+OSOrVdeImpG7y0TFqaaSrNPUrQQm8dz+MbKjxHChAKUR2NffnXQrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kr762FKp; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kr762FKp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755510488; x=1787046488;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v2Z9PWijXxTUNEsvvGAUqxq2MAMC1xPnlEk0aLN0Ats=;
  b=kr762FKpaneEpq4Vf4L9pOuywBLjN0MfpVn2Dp2rd6i1+V60YiKXD+Zo
   i0XY9Lt4nkRQ67Ieu0+FU3PlKzyFaPEXvRXacQjuVtpB9PdqYI6NLHKIv
   3R32R5ogHoJCkYqm8/HXcf4aNxT7Fq3/eRR91LqkXZy6sEplf68Qbb48r
   JGEt4beNV7s1uEwGXypZMu+S4Azx+bHLSy+Ai2NWgYjSV7OdY2s/ofaJA
   iMYKNNSBha+4jtSA7iSqgX7SkLSFPRNBqBiYgm369mRsXBXzgEYRbrcTT
   3sDitPwhYgin3bS65CQ8h0gNcr7qLkwN6K55m+3CZsY4FCdInzNOO91XO
   w==;
X-CSE-ConnectionGUID: 5V4I66gSSG6dxI5+wok1ew==
X-CSE-MsgGUID: n91VyW//R4iq+3j75TEA3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="57802791"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="57802791"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 02:48:07 -0700
X-CSE-ConnectionGUID: XKgNpI99RmC2daGzDQuO0g==
X-CSE-MsgGUID: dDnT3cF/SNeN9DriEP/wBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="171964385"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa004.jf.intel.com with ESMTP; 18 Aug 2025 02:48:06 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unwTD-00013v-2P;
	Mon, 18 Aug 2025 09:48:03 +0000
Date: Mon, 18 Aug 2025 11:47:09 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Li Lingfeng <lilingfeng3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2687/2687] kernel/power/swap.c:1573: warning:
 Excess function parameter 'exclusive' description in 'swsusp_close'
Message-ID: <202508181142.iwn6mk8e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jan,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   57dc07b15d29507022f36882532a0fe229cf2805
commit: 35143f27ceecf215984b938d1fe192e0e66e41b2 [2687/2687] PM: hibernate: Drop unused snapshot_test argument
config: x86_64-buildonly-randconfig-2004-20250818 (https://download.01.org/0day-ci/archive/20250818/202508181142.iwn6mk8e-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250818/202508181142.iwn6mk8e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508181142.iwn6mk8e-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/power/swap.c:544: warning: Function parameter or member 'handle' not described in 'save_image'
   kernel/power/swap.c:544: warning: Function parameter or member 'snapshot' not described in 'save_image'
   kernel/power/swap.c:544: warning: Function parameter or member 'nr_to_write' not described in 'save_image'
   kernel/power/swap.c:891: warning: Function parameter or member 'nr_pages' not described in 'enough_swap'
   kernel/power/swap.c:1062: warning: Function parameter or member 'handle' not described in 'load_image'
   kernel/power/swap.c:1062: warning: Function parameter or member 'snapshot' not described in 'load_image'
   kernel/power/swap.c:1062: warning: Function parameter or member 'nr_to_read' not described in 'load_image'
>> kernel/power/swap.c:1573: warning: Excess function parameter 'exclusive' description in 'swsusp_close'


vim +1573 kernel/power/swap.c

61159a314bca640 Rafael J. Wysocki 2006-03-23  1566  
61159a314bca640 Rafael J. Wysocki 2006-03-23  1567  /**
61159a314bca640 Rafael J. Wysocki 2006-03-23  1568   * swsusp_close - close swap device.
40d84e198b0ae64 Chen Yu           2023-09-06  1569   * @exclusive: Close the resume device which is exclusively opened.
61159a314bca640 Rafael J. Wysocki 2006-03-23  1570   */
61159a314bca640 Rafael J. Wysocki 2006-03-23  1571  
35143f27ceecf21 Jan Kara          2023-11-30  1572  void swsusp_close(void)
61159a314bca640 Rafael J. Wysocki 2006-03-23 @1573  {
7f17d15e3e01aca Jan Kara          2023-11-30  1574  	if (IS_ERR(hib_resume_bdev_handle)) {
64ec72a1ece37d9 Joe Perches       2017-09-27  1575  		pr_debug("Image device not initialised\n");
61159a314bca640 Rafael J. Wysocki 2006-03-23  1576  		return;
61159a314bca640 Rafael J. Wysocki 2006-03-23  1577  	}
61159a314bca640 Rafael J. Wysocki 2006-03-23  1578  
7f17d15e3e01aca Jan Kara          2023-11-30  1579  	bdev_release(hib_resume_bdev_handle);
61159a314bca640 Rafael J. Wysocki 2006-03-23  1580  }
1b29c1643c0d825 Vivek Goyal       2007-05-02  1581  

:::::: The code at line 1573 was first introduced by commit
:::::: 61159a314bca6408320c3173c1282c64f5cdaa76 [PATCH] swsusp: separate swap-writing/reading code

:::::: TO: Rafael J. Wysocki <rjw@sisk.pl>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
