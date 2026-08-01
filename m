Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF983BB677
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Aug 2026 21:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785621020; cv=none; b=NudlLr/F1uFy03SIky8KLbaIExMYW7dpQkW9+Q5Tcs34V2HEqENipqK0mMw7hE37m/MFNAVuklrUwKntYr5AByV8Y4e7BXE9vrP7F5gQoTH7WtqfqsWurZ61PtM/8OmcU0kP3q+VQsVTUH1uyYRW/Npu4XNteMaOaGT78ymAxCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785621020; c=relaxed/simple;
	bh=drN0ElWUVBNgAIZwhmXpe1srouERmqDVeKiCZLzHuuY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=d6xwpA4rRZ66xsVsRBtgzekiVhnWy6/Qy9oMoidofP1B+5fHpjmBpd8sLrl2qUXWXJ3pC/tbM9/7N9ZepqssUQxm18XtKMBBSzvjEBid4xsojwPeB+wrxOwe9Axoe7/CpNv+51xAqEw2Fl4fODfJ/5bz+l3VjO61xi1r+N/XJ7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MyMSHR1M; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MyMSHR1M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785621018; x=1817157018;
  h=date:from:to:cc:subject:message-id;
  bh=drN0ElWUVBNgAIZwhmXpe1srouERmqDVeKiCZLzHuuY=;
  b=MyMSHR1MV8V7FCTNtg82QnrSWhVvG/rbv10voFswhCj8EEfwakCMxmV6
   0UdnjBRx5MsH13B1Nvhw1JjKs/Ehkj0jcaEKH6PyGOsYFoRkTN6v0a8xl
   4/NrLAkKKzvOrFt8JPqxNetaCKTSk3WwWISr357NXw6KvmWebtCrnfLq5
   h7LukHbGXR12g1qk2hQnmjtYxUYrAdM4TDREWv0D33K9Ql528KE20Rood
   nLQXwgqz4RF3MbgL59+7Y7J8Ms93nIfKFcvyFzIUVdVyLwgIQXq6l+r2m
   Ikj4OFeQ549qVTDQxvzkxQEy9bp0hjhO8omobhzexEJi1iv90CNp808BS
   w==;
X-CSE-ConnectionGUID: 1gkGeI/dQyy6jg7h3xNs2Q==
X-CSE-MsgGUID: 8uj2vnLxTce1aWGBLxZWkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11862"; a="73749450"
X-IronPort-AV: E=Sophos;i="6.25,199,1779174000"; 
   d="scan'208";a="73749450"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 14:50:16 -0700
X-CSE-ConnectionGUID: W6C1BWrqQxOWMbUCWYl63A==
X-CSE-MsgGUID: tECzQVw8TUulcE45U1XleQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,199,1779174000"; 
   d="scan'208";a="260931050"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 01 Aug 2026 14:50:15 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqHau-000000003w9-4A5l;
	Sat, 01 Aug 2026 21:50:13 +0000
Date: Sun, 02 Aug 2026 05:49:58 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:rw-dmabuf-v5 8/16] error[E0063]: missing field
 `init_dma_buf_io_ctx` in initializer of `block_device_operations`
Message-ID: <202608020548.hOgfjkCG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/isilence/linux rw-dmabuf-v5
head:   830cd62ae8958351a9fcd6d663dea3430921f95b
commit: b32dd786296e1683378c9e037e2b9f26ec24fee8 [8/16] block: add dma-buf support for raw bdev
config: arm64-randconfig-001-20260802 (https://download.01.org/0day-ci/archive/20260802/202608020548.hOgfjkCG-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260802/202608020548.hOgfjkCG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608020548.hOgfjkCG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0063]: missing field `init_dma_buf_io_ctx` in initializer of `block_device_operations`
   --> rust/kernel/block/mq/gen_disk.rs:128:58
   |
   128 |         const TABLE: bindings::block_device_operations = bindings::block_device_operations {
   |                                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ missing `init_dma_buf_io_ctx`

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
