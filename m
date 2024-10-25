Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7E41BCA0C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 09:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729850219; cv=none; b=dtFE1L/fjywdOmRMlRcq572RJScOGRdVdssTcE/3I+c1GGGl9jxMffweXTNpDzNd0A7j+AZPPet5yq1PgwlimtaPm1uKzDHG7S9faUuDM91+chn9u9Betk/PsRWe87dNaSia77NxeODdrPsYSBRwUpB76Ip3reJhrcq9dGgf264=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729850219; c=relaxed/simple;
	bh=Fbt7kmEmF43HAcsKA7kzE9khLhY8D1ESBPXKXN7xnI8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qyzYlk3YbkjsVBS051pMVPwGSJpI6gLokiET/Oq+p9HTPYq5FLXMaPlkCCQcYzT+55b5uQsWuH2v7Oqcuhm4t/7HBkurqJnk5v5SW4JAoCxQtVBrWGHmddR3fuWfU2tgCu5GcQd6YWgVzNNvaOj0G2ZOSEgKSyXe04QOpqyZ6Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iy2MJQBA; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iy2MJQBA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729850217; x=1761386217;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fbt7kmEmF43HAcsKA7kzE9khLhY8D1ESBPXKXN7xnI8=;
  b=iy2MJQBAH7OQ/T9fKUx+CML7lEo+zCXpUcWnIM5i8m6eNUF5a+bexXcw
   oaLXvqtOx6EYVPASMnEgIeGYN7VKVnr2BYg+fcuXewvVzeaTm+BoaqVtW
   BYMznz3iE86eI7sWk6Av/khObSn8jh/YU7Va4qbYSwbvNyjPKRd31X2jE
   sgKUhSwE8GC9bGeYBCRS/bZJ6LNEFvoV/skHgN4cIDBjsdVHkyFev3Q6S
   YBGisfxC9+2vGs3z3difKEysTj4RcVNRvg1byfG8m6VxSGFwNRIE3CneR
   cqcOof8VPXN4gguThJ8EJJhe1eXl+nVVu9XQmljIxzHZhjjibOWHv7sB6
   w==;
X-CSE-ConnectionGUID: aIlcMkupTqKHHOEChMjmAw==
X-CSE-MsgGUID: WxrOUkZPQweGFTOUzY100Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29374993"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29374993"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 02:56:57 -0700
X-CSE-ConnectionGUID: Uvh4hAtLTEOdMKG2Zb2beQ==
X-CSE-MsgGUID: Pt1BoKesRQ+VW7cJfbJvyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="85430954"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Oct 2024 02:56:55 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4H3t-000Y1M-27;
	Fri, 25 Oct 2024 09:56:53 +0000
Date: Fri, 25 Oct 2024 17:56:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-ring-resize 5/5] io_uring/memmap.c:340:26:
 error: invalid use of undefined type 'struct io_uring_ctx'
Message-ID: <202410251729.DfclLBp9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-ring-resize
head:   a33a9152eb06cc15d20dc9d1def2a33b3ff88d81
commit: a33a9152eb06cc15d20dc9d1def2a33b3ff88d81 [5/5] io_uring/register: add IORING_REGISTER_RESIZE_RINGS
config: m68k-randconfig-r071-20241025 (https://download.01.org/0day-ci/archive/20241025/202410251729.DfclLBp9-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410251729.DfclLBp9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410251729.DfclLBp9-lkp@intel.com/

All errors (new ones prefixed by >>):

   io_uring/memmap.c: In function 'io_uring_get_unmapped_area':
>> io_uring/memmap.c:340:26: error: invalid use of undefined type 'struct io_uring_ctx'
     340 |         guard(mutex)(&ctx->resize_lock);
         |                          ^~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +340 io_uring/memmap.c

   332	
   333	unsigned long io_uring_get_unmapped_area(struct file *file, unsigned long addr,
   334						 unsigned long len, unsigned long pgoff,
   335						 unsigned long flags)
   336	{
   337		struct io_uring_ctx *ctx = file->private_data;
   338		void *ptr;
   339	
 > 340		guard(mutex)(&ctx->resize_lock);
   341	
   342		ptr = io_uring_validate_mmap_request(file, pgoff, len);
   343		if (IS_ERR(ptr))
   344			return PTR_ERR(ptr);
   345	
   346		return (unsigned long) ptr;
   347	}
   348	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
