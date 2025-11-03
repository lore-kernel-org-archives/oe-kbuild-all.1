Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422C424C669
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Nov 2025 16:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762187771; cv=none; b=gxCOZCVsi5drG5fdXgPZXdEI4ITWZp5unq4YF/RFrFPLEoeRE5WMYGaUUvm3hxVRTNqX1LR60Q6M+cGmvClfU7nOiwAGqtXFJmuMkDK4x82QF9wl228928oYQegiPzmlFZFo0msmV2XgSKa6b93QcnRGKilnTEsr5SV34J8UE2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762187771; c=relaxed/simple;
	bh=QTsXGxAl9nAYzzEbhpI78ONZlcSg49Wi6PpQZ8nBSgc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gs10KBfE/rcIMarijtVRqPQ+R8B3DhEzFStDCgwzAU6bofWCxvfCuGY56LAsg3G0EAHuGiq7ptiTG6rmYBnCzg2X9iIYja8sYiwIRTR4EbGOxBnf4yxK50Qsc3s8uELXHujTC0oEgw9UX/Wyzc647jIOrA8YkDs1Q2fU577TJSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ddj3llrb; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ddj3llrb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762187770; x=1793723770;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QTsXGxAl9nAYzzEbhpI78ONZlcSg49Wi6PpQZ8nBSgc=;
  b=Ddj3llrb21vAeqJVna4S08gIfSDo7oaC1enXzWB3/nHrFJIa0OK6HXRN
   TeYrgWRX6CsVQpGrciyG1ILDxP+hPnvnqItS01jDJBQSsgdOc420HFyqS
   V3rJqxHbo4DY6qXVK277h90R9QkrXznfv0dVCA3rJnUSF/ZFnXJkNbP+O
   rfg0BoJsDDDw4C4pwv3nw7HDPl034oEC8tkHqijhFMIZ7NZjXCgajZppx
   Ln6I4YLkWLtR4obalbVLwUyF7xD2tXf9WoXDQwDlKsmyFaUkwozTQvQOk
   S5NFUBFao0Ytd+SULw1gKWJ3Z6oXrR51Rc47+wVt+XPozE58LKeis+8hM
   w==;
X-CSE-ConnectionGUID: gny88FF/Rj+Ba7adQ26LXQ==
X-CSE-MsgGUID: UkC9iUfCRuqwmtNNKtuFJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="51837655"
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; 
   d="scan'208";a="51837655"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 08:36:10 -0800
X-CSE-ConnectionGUID: smp9IWmoSkeVy58lydbbUw==
X-CSE-MsgGUID: x4g6OsGZTa20UQQ1FT3ykw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; 
   d="scan'208";a="186147868"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 03 Nov 2025 08:36:09 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFxXA-000QLM-0m;
	Mon, 03 Nov 2025 16:35:58 +0000
Date: Tue, 4 Nov 2025 00:35:22 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:aio-direct-completions 1/3] io_uring/rw.c:569:23: warning:
 unused variable 'kiocb'
Message-ID: <202511040038.zellxIWP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git aio-direct-completions
head:   44b98eb00ca89d13a590dfeb28506550f5444b0d
commit: b6c0bb3ab045ced77932190f6bf86ef904340dbe [1/3] fs: remove IOCB_DIO_CALLER_COMP
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20251104/202511040038.zellxIWP-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511040038.zellxIWP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511040038.zellxIWP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   io_uring/rw.c: In function 'io_req_rw_complete':
>> io_uring/rw.c:569:23: warning: unused variable 'kiocb' [-Wunused-variable]
     569 |         struct kiocb *kiocb = &rw->kiocb;
         |                       ^~~~~


vim +/kiocb +569 io_uring/rw.c

4d9cb92ca41dd8 Pavel Begunkov      2022-09-09  565  
bcf8a0293a019b Caleb Sander Mateos 2025-02-16  566  void io_req_rw_complete(struct io_kiocb *req, io_tw_token_t tw)
b000145e990780 Jens Axboe          2022-09-29  567  {
099ada2c87260e Jens Axboe          2023-07-08  568  	struct io_rw *rw = io_kiocb_to_cmd(req, struct io_rw);
099ada2c87260e Jens Axboe          2023-07-08 @569  	struct kiocb *kiocb = &rw->kiocb;
099ada2c87260e Jens Axboe          2023-07-08  570  
2ec33a6c3cca9f Jens Axboe          2022-10-11  571  	io_req_io_end(req);
3671163beb633f Pavel Begunkov      2022-11-04  572  
8e5b3b89ecaf6d Pavel Begunkov      2024-03-18  573  	if (req->flags & (REQ_F_BUFFER_SELECTED|REQ_F_BUFFER_RING))
5fda51255439ad Jens Axboe          2025-08-20  574  		req->cqe.flags |= io_put_kbuf(req, req->cqe.res, NULL);
3671163beb633f Pavel Begunkov      2022-11-04  575  
a9165b83c1937e Jens Axboe          2024-03-18  576  	io_req_rw_cleanup(req, 0);
bcf8a0293a019b Caleb Sander Mateos 2025-02-16  577  	io_req_task_complete(req, tw);
b000145e990780 Jens Axboe          2022-09-29  578  }
b000145e990780 Jens Axboe          2022-09-29  579  

:::::: The code at line 569 was first introduced by commit
:::::: 099ada2c87260e5c52fbdad4ca40c165fc194a2e io_uring/rw: add write support for IOCB_DIO_CALLER_COMP

:::::: TO: Jens Axboe <axboe@kernel.dk>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
