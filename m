Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D66726B742
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Nov 2025 16:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762187809; cv=none; b=KggsUyDYfW8plp2nmQjJ7CKuQ55CE7jxtZzOuioX9QVA3n0R3gbWW1ZVOkppPYoRyIrzBcO4qBAY5SxqPTjtqmmyDDSwn64lvrtxrEvROcLckTJJSgKr/TNVGOByA0tBW+kIQ9mfy7hZaw0F3z3Q0ATr6WDEkw5VJ4I+c9/jrsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762187809; c=relaxed/simple;
	bh=TascAvwwfn/JDW2B33n5fOwyZfx9ZJGB89sPfrN4sh8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c0RGyXP/H7Ikz216+MZC+fjoVxIweyH3e5ugSXAVWx4hdXioI8PU7C/svm72anarQ+86rizgOPRdiYtelMjhgJVvn/zmg5Fgc7YzlekY4a7c2DuhLgRV4KJAH1rVhifvqmtC5x7YCE/17+GIvNDeAzkFJWEl4Xt/zr78sk1Crog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VLTdwFR6; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VLTdwFR6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762187808; x=1793723808;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TascAvwwfn/JDW2B33n5fOwyZfx9ZJGB89sPfrN4sh8=;
  b=VLTdwFR6oxDOh0a8WsZahLPNjAjVYgFvpgdqWTxe5jiuIIhUOaJp1m7q
   nYV/t+tMfA1jqGYyf2i8n2INdogI9kYfkorpa8n1p+nKwzoJorxc0lmr3
   bY4MySlNYDP4Apx3EJHYaDUEcJnENuURTjbHQBvZf0LNNeeEdOH8MENBE
   PVrvsoSqxKjbEbAZcr1oHsItrJa/W7fyWYQdc6dJ9ZVHVUXUdzJMm/x0O
   tVQcDDOH+G0ICUbrb19b20zbla+XZKYPaK0ldvxXVNkcDGZNZMse3AAOX
   NRjRgUPfV6kmDrbd6MB/3QzaWKg8rGbrvfig+xQ2NbpW5GypA10xOYf1v
   A==;
X-CSE-ConnectionGUID: b8bOtj11TvilgdkYGZkRow==
X-CSE-MsgGUID: MnHHgFgKRMaz2o85oPeKug==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="63280802"
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; 
   d="scan'208";a="63280802"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 08:36:47 -0800
X-CSE-ConnectionGUID: voyKn9ZUSiOnZPEAyMj1Fw==
X-CSE-MsgGUID: ttITdyY6TjqS3HlXcPadNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; 
   d="scan'208";a="191253887"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 03 Nov 2025 08:36:46 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFxXj-000QLX-14;
	Mon, 03 Nov 2025 16:36:34 +0000
Date: Tue, 4 Nov 2025 00:35:28 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:dmabuf-rw/v2-test-unfinished 10/12] sparc-linux-ld:
 rsrc.c:undefined reference to `dma_buf_put'
Message-ID: <202511040005.9rGUtGpV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux dmabuf-rw/v2-test-unfinished
head:   e693ed6721c39c7abddc6cfa222e7a443a2da12d
commit: 854fac37757903a2dfdaf4ef22ff4172ec2b65a0 [10/12] io_uring/rsrc: add dmabuf-backed buffer registeration
config: sparc-allnoconfig (https://download.01.org/0day-ci/archive/20251104/202511040005.9rGUtGpV-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511040005.9rGUtGpV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511040005.9rGUtGpV-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc-linux-ld: block/blk-mq.o: in function `blk_mq_submit_bio':
   blk-mq.c:(.text+0x6b58): undefined reference to `blk_rq_assign_dma_map'
   sparc-linux-ld: io_uring/rsrc.o: in function `io_release_reg_dmabuf':
   rsrc.c:(.text+0x158): undefined reference to `dma_buf_put'
   sparc-linux-ld: io_uring/rsrc.o: in function `io_register_dmabuf':
   rsrc.c:(.text+0x70c): undefined reference to `dma_buf_get'
>> sparc-linux-ld: rsrc.c:(.text+0x85c): undefined reference to `dma_buf_put'
   sparc-linux-ld: block/bdev.o: in function `blkdev_dma_map':
   bdev.c:(.text+0x12c0): undefined reference to `blk_mq_dma_map'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
