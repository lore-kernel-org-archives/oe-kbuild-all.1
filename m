Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137341847
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jun 2024 00:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718497867; cv=none; b=TcGskB/lAjNb0T5xzDKgwJ++NpXv1IWQ3eAwQ4JtOnXVtEn0LMsMZdS5t/cQdoCEemS59o0nehpKfaETNEae2ZFAX+lFzuYMX7qhvd8WgCLUaoE5zliS8ZA0VwPtVcmBKFh5LVyyPAO3hR25BzlQxTeUfj0cdBwi+b7uQArePnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718497867; c=relaxed/simple;
	bh=61U4i+Kcvdb02RQR71uZoLqvxxTIBLvqeWCHg/mLG+0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u1h9bTTfUPzPup3q97oNik4WFItjJVcTf0HxyD5E8u7LJXO55n+68rZtkYALQBev07La76mfWjvLz2wff765OJ+T5pBVgPw9tZqWjtl3vbhgEhvt1mBZ7ScsjolzGkZP1yhxzC9p/MKLoL7tMb0rsdB9BrtyUz0pxz7BQk50vac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y8GKPww1; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y8GKPww1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718497866; x=1750033866;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=61U4i+Kcvdb02RQR71uZoLqvxxTIBLvqeWCHg/mLG+0=;
  b=Y8GKPww1hGJ8kchxXOlpZbUAdGW22OJ4jKxVNzGmqH+O+c7LrK5jhU/P
   uOLuwVZ02Sc+kmB9M5rdAUM4gE8v1XkRRf5vmDazjqf++vQocwsophusb
   3rWSm+N4P+yuvRcXbvGMosz9eOId8j0DCyNj7DpZHkIoiEtnC7g8Z6W6i
   N6sG/YV8+eafC5/DgOkXilxiLzFcMRAykfAmWXqETBwKqGNaZ1YT4UynU
   enHmgo2xMiFumP3l9RgZRwtYB5DvKSs7kCCvw+qIpNIaxYVXOj8RX3iUC
   wfuSuIlBGbqy9XC2TmAfmVx1yIrAzXkNX3WDf43Bizla/cGNkdI2WwBfS
   A==;
X-CSE-ConnectionGUID: kaNw95r5T5uBDaP14YF0Rg==
X-CSE-MsgGUID: 550TZ3dETESJo1QcpuZgJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="15510331"
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="15510331"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 17:31:05 -0700
X-CSE-ConnectionGUID: 4IXpp7juQDifAE0kp6Ud8g==
X-CSE-MsgGUID: YCoENG85QAOZ3FMVVSvn5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="45967982"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 15 Jun 2024 17:31:05 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIdnS-0000eh-1d;
	Sun, 16 Jun 2024 00:31:02 +0000
Date: Sun, 16 Jun 2024 08:30:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:for-6.11/block 5/6] error[E0425]: cannot find function
 `blk_queue_logical_block_size` in crate `bindings`
Message-ID: <202406160833.Ci7STDjD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.11/block
head:   5e3b7009f116f684ac6b93d8924506154f3b1f6d
commit: e3e72fe4cb1d1b7399fab0e98166b8bfcddb9ec7 [5/6] Merge branch 'for-6.11/block-limits' into for-6.11/block
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240616/202406160833.Ci7STDjD-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240616/202406160833.Ci7STDjD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406160833.Ci7STDjD-lkp@intel.com/

Note: the axboe-block/for-6.11/block HEAD 5e3b7009f116f684ac6b93d8924506154f3b1f6d builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `blk_queue_logical_block_size` in crate `bindings`
   --> rust/kernel/block/mq/gen_disk.rs:147:23
   |
   147 |             bindings::blk_queue_logical_block_size((*gendisk).queue, self.logical_block_size)
   |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `blk_queue_physical_block_size` in crate `bindings`
   --> rust/kernel/block/mq/gen_disk.rs:153:23
   |
   153 |             bindings::blk_queue_physical_block_size((*gendisk).queue, self.physical_block_size)
   |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ not found in `bindings`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
