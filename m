Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5125553368
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 06:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728110642; cv=none; b=arT54r7knHN2TWR+x2hdmhKbx0egOBECNE/2dbPnjR5dJzXXqLw2CKDAUFHBtnsxNGEk5s+5/JrAUDl8CYpWCjVuHqpSA8HhyiFLdkRZ65gtQy9kldjQVgbzq28LcKCTEZ3EaLH3899WgCWPY1ZLUidIt/FSBwnvpVSJgxt2apc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728110642; c=relaxed/simple;
	bh=3qPuy/LyvpMv4rpuJEng0d2PkZjean3RNp5TYBPvR4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sOW91mvxNxD/VCajeUiGXU1q5x9t9c4RlmWjufI3QoA/8sYX6vLArudwDzOUQYthBRWTQIsH+4BSXf7vcpThtF4OcgXVa6WbssXmyo20twOtxa1h5ak02QwXQfanmoivJwIxlOjvItZMEUJjzivSVL8ySBStFppSHUBPWYWqsBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BDrv3Qz8; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BDrv3Qz8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728110640; x=1759646640;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3qPuy/LyvpMv4rpuJEng0d2PkZjean3RNp5TYBPvR4Q=;
  b=BDrv3Qz8dm/ny7B/6rZ77UToNIRm4tDgwWlxA2mM2CKw9z3YjxNPdPhn
   wy4eQHz4F7cU35kNY+Y99Ey/BCOBT2xoPduj2bB34HZnC+gDhHeWR2xeE
   UmQjr3V0Erv2wYJ5KhFshDoDBNyRI3Oh2TQMReUcsWKxHvVob9opF5I5E
   yYW+Wtps1Nuvz1UfDq+pFzwIvHOmF/+h+E+6Pirspzkcx/in0HuJYt2q6
   LY/GQPcKRnJNOEX9oufnjsIRNZYtQajroJ1HNJWWQn2C/bQJt2sl1ZfRk
   5JhCFIuT2DXmO7WkxFfpaQiGmfKqBr2suG70r9sRRHq6d6ZZLHoodziQe
   Q==;
X-CSE-ConnectionGUID: ViSFZdRjTZ6e+D5akr6/4g==
X-CSE-MsgGUID: Q+C91lRNQIC7QccWmNU/QA==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="26835666"
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="26835666"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 23:43:59 -0700
X-CSE-ConnectionGUID: JxHvJdz1TAy3iIEjFhJ2KQ==
X-CSE-MsgGUID: l9b6TU0qS1mZio4scHExrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="74503607"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 04 Oct 2024 23:43:59 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swyWC-0002fz-2N;
	Sat, 05 Oct 2024 06:43:56 +0000
Date: Sat, 5 Oct 2024 14:43:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dyndbg_trace_v4_5d 73/104] drivers/dma/ioat/dma.h:224:9:
 sparse: sparse: Initializer entry defined twice
Message-ID: <202410051429.T4OMWahy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dyndbg_trace_v4_5d
head:   f80f5812bfbeed250f7095621935b1eaaa5d71d2
commit: 80f306c8021b48aee131939f2ed2b8ddd8642f10 [73/104] dyndbg: move flags field to a new structure
config: x86_64-randconfig-122-20241005 (https://download.01.org/0day-ci/archive/20241005/202410051429.T4OMWahy-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410051429.T4OMWahy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410051429.T4OMWahy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/dma/ioat/dma.c:463:5: sparse: sparse: context imbalance in 'ioat_check_space_lock' - different lock contexts for basic block
   drivers/dma/ioat/dma.c: note: in included file:
>> drivers/dma/ioat/dma.h:224:9: sparse: sparse: Initializer entry defined twice
   drivers/dma/ioat/dma.h:224:9: sparse:   also defined here
>> drivers/dma/ioat/dma.h:224:9: sparse: sparse: Initializer entry defined twice
   drivers/dma/ioat/dma.h:224:9: sparse:   also defined here
--
   drivers/dma/ioat/prep.c: note: in included file:
>> drivers/dma/ioat/dma.h:224:9: sparse: sparse: Initializer entry defined twice
   drivers/dma/ioat/dma.h:224:9: sparse:   also defined here
>> drivers/dma/ioat/dma.h:224:9: sparse: sparse: Initializer entry defined twice
   drivers/dma/ioat/dma.h:224:9: sparse:   also defined here
>> drivers/dma/ioat/dma.h:224:9: sparse: sparse: Initializer entry defined twice
   drivers/dma/ioat/dma.h:224:9: sparse:   also defined here
>> drivers/dma/ioat/dma.h:224:9: sparse: sparse: Initializer entry defined twice
   drivers/dma/ioat/dma.h:224:9: sparse:   also defined here
>> drivers/dma/ioat/dma.h:224:9: sparse: sparse: Initializer entry defined twice
   drivers/dma/ioat/dma.h:224:9: sparse:   also defined here

vim +224 drivers/dma/ioat/dma.h

6df9183a153291 Dan Williams 2009-09-08  217  
6df9183a153291 Dan Williams 2009-09-08  218  static inline void
5a976888c953a5 Dave Jiang   2015-08-11  219  __dump_desc_dbg(struct ioatdma_chan *ioat_chan, struct ioat_dma_descriptor *hw,
6df9183a153291 Dan Williams 2009-09-08  220  		struct dma_async_tx_descriptor *tx, int id)
6df9183a153291 Dan Williams 2009-09-08  221  {
5a976888c953a5 Dave Jiang   2015-08-11  222  	struct device *dev = to_dev(ioat_chan);
6df9183a153291 Dan Williams 2009-09-08  223  
6df9183a153291 Dan Williams 2009-09-08 @224  	dev_dbg(dev, "desc[%d]: (%#llx->%#llx) cookie: %d flags: %#x"
50f9f97e70fa46 Dave Jiang   2013-03-04  225  		" ctl: %#10.8x (op: %#x int_en: %d compl: %d)\n", id,
6df9183a153291 Dan Williams 2009-09-08  226  		(unsigned long long) tx->phys,
6df9183a153291 Dan Williams 2009-09-08  227  		(unsigned long long) hw->next, tx->cookie, tx->flags,
6df9183a153291 Dan Williams 2009-09-08  228  		hw->ctl, hw->ctl_f.op, hw->ctl_f.int_en, hw->ctl_f.compl_write);
6df9183a153291 Dan Williams 2009-09-08  229  }
6df9183a153291 Dan Williams 2009-09-08  230  

:::::: The code at line 224 was first introduced by commit
:::::: 6df9183a153291a2585a8dfe67597fc18c201147 ioat: add some dev_dbg() calls

:::::: TO: Dan Williams <dan.j.williams@intel.com>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
