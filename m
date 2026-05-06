Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AFA44CF5B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 May 2026 12:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778071281; cv=none; b=YuPWFf6O1Nxq7FbQLHysnKKHt5F4rXCrM7Eqp3cJiLGG9XjNxReHjPmgVmjBMw8hH1d0+RH2RlLPRGoiz8dyRLoyZe7aKmScVPvYaZWx1sjFolFri8w8Iebq1WPIUlGYjSrRQaLzCUjHs5Snd3nS7VxgHZlZjT89vj/0CPxqnps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778071281; c=relaxed/simple;
	bh=xqNL7Yz+c6CtEBPB7Gb8+W57OWUUd4rlvz0gf3H/SQ4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e8try7OTX4yxVN2NQJQVG31UytgVYK2DQeNP1Oj7+wGa9+kBVsPjvZ32JS+Ki+7z0v+kTYRQ7F7WiUxIb2brHgLgeqRc8CHjAdi76UNbHiF5Lh7i72hMTBz9o2tLmJ4dMwvsTgyPp4bIinOxcWnVMWsrRPnoqUYScnV9XoPn84U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HfRNGhGg; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HfRNGhGg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778071280; x=1809607280;
  h=date:from:to:cc:subject:message-id;
  bh=xqNL7Yz+c6CtEBPB7Gb8+W57OWUUd4rlvz0gf3H/SQ4=;
  b=HfRNGhGgSw8xmGY7GrPl5kghKT7tPQOQJeIf9B9lfF9XoQ67dwWBwYl+
   mTT+mEiIoMsPk8phrK/wASs9nXzJDFJAgwngMAJ4NA27um/Ku8h1dYzqj
   cUMveZ/H9f8XkPZ+xg8igGM7Val/ifl+JQ1bMCxeo1g2dzS2KyH768s6/
   FRwMwbH6K50VFyhA5jWt/5NK0pmiuyIs+Js8wf/WhH9BYBFlZTla6r1Ea
   pH+m3E1cDvpcwh3QROqc2mjfgcy4uu2A3gu+aO0NY1G5zm7jf9UemQS40
   XUlhNdm3wDo8xZnlMbZ8H3xSjAbyGyIrziIip7fMw9i2gOyev0aEUvgX3
   g==;
X-CSE-ConnectionGUID: XzUOBNldQya7ooAqayY5xA==
X-CSE-MsgGUID: YadgAEAsQs25mv/zxKJs6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="66529487"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="66529487"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 05:41:19 -0700
X-CSE-ConnectionGUID: kXWneAhERdmmwZRVy5n1Pw==
X-CSE-MsgGUID: IqQfAVz3Q+esiptBKsY0Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="233477656"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 06 May 2026 05:41:18 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKbYy-000000006Yb-0K0t;
	Wed, 06 May 2026 12:41:16 +0000
Date: Wed, 06 May 2026 14:40:57 +0200
From: kernel test robot <lkp@intel.com>
To: Anuj Gupta <anuj20.g@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>,
 Kanchan Joshi <joshi.k@samsung.com>
Subject: [axboe:nvme-raw-queues 8/16] error[E0063]: missing fields
 `poll_uring_cmd`, `queue_uring_cmd`, `register_queue` and 1 other field in
 initializer of `bindings::blk_mq_ops`
Message-ID: <202605061431.U03wNzgJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git nvme-raw-queues
head:   38cfa7887dc8d403af2baa576d06c438408a192c
commit: baa3150843ddf26bb83bff0a7e87b22d60a4bb70 [8/16] block: add mq_ops to submit and complete commands from raw-queue
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260506/202605061431.U03wNzgJ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260506/202605061431.U03wNzgJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605061431.U03wNzgJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0063]: missing fields `poll_uring_cmd`, `queue_uring_cmd`, `register_queue` and 1 other field in initializer of `bindings::blk_mq_ops`
   --> rust/kernel/block/mq/operations.rs:257:42
   |
   257 |     const VTABLE: bindings::blk_mq_ops = bindings::blk_mq_ops {
   |                                          ^^^^^^^^^^^^^^^^^^^^ missing `poll_uring_cmd`, `queue_uring_cmd`, `register_queue` and 1 other field

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
