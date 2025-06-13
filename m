Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F62B2DA74D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Jun 2025 07:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749801418; cv=none; b=aSn5hfKEgbbdMw2VArjeQp+Q0X7xnmH1CEWfkkk+8eWSts3NUikYOOkotSqy2VoU7mLDUfLTGV1RjbXW8TsArQEEQRN8ErsAFs47My9hOBruQIEGjGiyDwYlpCBDXZ7F+T4gM3+6NKZuLd7VjzIvrT6Ok5XntRGvddj4K6iLbRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749801418; c=relaxed/simple;
	bh=x8mKYrd6bgIczMWpu83FB6e01qEMuzab8Y5MZeN+3u0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D17YCsqd2ri/4eyFveWOKhRQvPv0VC7DuX/ib+CxBJP0IQ7Ib87pOSMTT+dGV/gslks4fRrLw08Mem8Jneg5tP4OY26rLuV2fxYpfgs3QN0I2d4GQd/rX3jxYozd4wAYjqgdDFxt+BMLZsV8554BFvuXkF2I3eWDNtwZwjw1wPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oFUBCvxM; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oFUBCvxM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749801416; x=1781337416;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x8mKYrd6bgIczMWpu83FB6e01qEMuzab8Y5MZeN+3u0=;
  b=oFUBCvxMZr3MFwHQe9l6Odl08CfnuCcV8zIBp9BtBK5OziQqkAjPtkjX
   rUbDFkf0Id4LptLRUNuCWCoFOEyv/zvaE+CF2s88B/XcsWSPkjoRHYQRo
   3vu/PzKfGlrTpvRGmfIhceBxWvyE26vH1CkZoFeEpXeYz4Vv12lHSbRJ3
   PgjSZEef4vuQumKq0OQJtSC46G/GySEfvFYlFM9iEzR9Na6T/lZWUHz3P
   y53H1cwc1RmnKShUmsABCgBwvpKsHEvg8TAzsR1D8DKjRAiSF+2jMOK+T
   d5rH2kaYJutruTd3D7EsQ9vnXovIBJAAeo+cjcI5YtIOuuIZHW6YEHIcT
   Q==;
X-CSE-ConnectionGUID: JbesKuuHTDGWU0bvak4oAA==
X-CSE-MsgGUID: pPIMO5DbS6u2LLOhiCjTbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="52156921"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="52156921"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 00:56:55 -0700
X-CSE-ConnectionGUID: kboDv3/aSW6wtwI5naMtgg==
X-CSE-MsgGUID: ARmvqZ9cSLKLhd9hKCamBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="147609955"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 Jun 2025 00:56:55 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPzHQ-000CLS-1L;
	Fri, 13 Jun 2025 07:56:52 +0000
Date: Fri, 13 Jun 2025 15:56:21 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH, RFC] block: always use a list_head for requests
Message-ID: <202506131506.hpiMurtj-lkp@intel.com>
References: <20250612074245.2718371-1-hch@lst.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612074245.2718371-1-hch@lst.de>

Hi Christoph,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.16-rc1]
[cannot apply to axboe-block/for-next linux-nvme/for-next next-20250612]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christoph-Hellwig/block-always-use-a-list_head-for-requests/20250612-154415
base:   linus/master
patch link:    https://lore.kernel.org/r/20250612074245.2718371-1-hch%40lst.de
patch subject: [PATCH, RFC] block: always use a list_head for requests
config: i386-buildonly-randconfig-002-20250613 (https://download.01.org/0day-ci/archive/20250613/202506131506.hpiMurtj-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250613/202506131506.hpiMurtj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506131506.hpiMurtj-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/block/ublk_drv.c: In function 'ublk_queue_rqs':
>> drivers/block/ublk_drv.c:1433:37: error: passing argument 1 of 'ublk_queue_cmd_list' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1433 |                 ublk_queue_cmd_list(io, rqlist);
         |                                     ^~
         |                                     |
         |                                     struct ublk_io *
   drivers/block/ublk_drv.c:1334:49: note: expected 'struct request *' but argument is of type 'struct ublk_io *'
    1334 | static void ublk_queue_cmd_list(struct request *req, struct ublk_io *io,
         |                                 ~~~~~~~~~~~~~~~~^~~
   drivers/block/ublk_drv.c:1433:41: error: passing argument 2 of 'ublk_queue_cmd_list' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1433 |                 ublk_queue_cmd_list(io, rqlist);
         |                                         ^~~~~~
         |                                         |
         |                                         struct list_head *
   drivers/block/ublk_drv.c:1334:70: note: expected 'struct ublk_io *' but argument is of type 'struct list_head *'
    1334 | static void ublk_queue_cmd_list(struct request *req, struct ublk_io *io,
         |                                                      ~~~~~~~~~~~~~~~~^~
>> drivers/block/ublk_drv.c:1433:17: error: too few arguments to function 'ublk_queue_cmd_list'
    1433 |                 ublk_queue_cmd_list(io, rqlist);
         |                 ^~~~~~~~~~~~~~~~~~~
   drivers/block/ublk_drv.c:1334:13: note: declared here
    1334 | static void ublk_queue_cmd_list(struct request *req, struct ublk_io *io,
         |             ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/ublk_queue_cmd_list +1433 drivers/block/ublk_drv.c

  1413	
  1414	static void ublk_queue_rqs(struct list_head *rqlist)
  1415	{
  1416		struct ublk_io *io = NULL;
  1417		struct request *req, *n;
  1418		LIST_HEAD(requeue_list);
  1419	
  1420		list_for_each_entry_safe(req, n, rqlist, queuelist) {
  1421			struct ublk_queue *this_q = req->mq_hctx->driver_data;
  1422			struct ublk_io *this_io = &this_q->ios[req->tag];
  1423	
  1424			if (io && io->task != this_io->task)
  1425				ublk_queue_cmd_list(req, io, rqlist);
  1426			io = this_io;
  1427	
  1428			if (ublk_prep_req(this_q, req, true) != BLK_STS_OK)
  1429				list_move_tail(&req->queuelist, &requeue_list);
  1430		}
  1431	
  1432		if (!list_empty(rqlist))
> 1433			ublk_queue_cmd_list(io, rqlist);
  1434		list_splice(&requeue_list, rqlist);
  1435	}
  1436	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
