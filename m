Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82DB1FC3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Jul 2025 15:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753630369; cv=none; b=VkAvEk9zb/hVVPiwgpN1sG2T/AAvOsdR+hPlXzba64Zb6AJEksBXxBAvMfqzaV7m6PV6R2mgZwSXduGvp1cwzn/DiJax3HDcn4D5UeCygXopCcffNYaWtcns7yDj/KGzi6cXAepxzP5PX2cUs/+6BXxWRWoHi6Hn+IvTP6+F5Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753630369; c=relaxed/simple;
	bh=3MJZg0S1KBgIcxCUDBRkJw8mA0RsOv2NMGZrdW8Ct0w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qNpGqF/wtLzJkxcSJKPXgGHYWWnPFfnMaC0L9RN5vEOF8CYAR1DQtStMDTRxNyG7WpOFgiNS4z1jm6PKUW42MjzbGOWajEmD2c9wTvoaws07OhQJgZAGGtkFV/er0czdjk1lPRx1aZVh6DUBdjw9tAX0ofwMCw/aE6cY16UmGpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AwmdOdzg; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AwmdOdzg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753630368; x=1785166368;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3MJZg0S1KBgIcxCUDBRkJw8mA0RsOv2NMGZrdW8Ct0w=;
  b=AwmdOdzg/sA1DbiC0XrdOXrHerc3/b1Hjlrt0KZuuPEeogxBgDKn2gzn
   bszZlwPknrfP5wNAvAl1yR5JTKNvjeDvxnuVngz7kidbOQG2dBEhrMk/J
   SZ0KDhA4eegXZNioOoJ3JylBHJfzk7cqtuqRTAFi9mW0EcOypKThjwKGS
   vlmPzJT5SXaoFY55y7w19HjXssHlw8xOI8RKnjtzB593XYBmzjR1NNrwN
   M3BZKIUnq6fua9TJL1pOjjuJSCM16/yh5j/QkoDHp7QA2u7zuIXzc0iYy
   Xbvu0/8+yH1lJ6TiI4EvsLSge3fkkUmHxgljqdO9bXRr9QP3cOqtPFpCk
   A==;
X-CSE-ConnectionGUID: fsks4nDhRoicGlV3ea+Now==
X-CSE-MsgGUID: kkOX6brPQWyZAjZCC4OHTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="54970370"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="54970370"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2025 08:32:47 -0700
X-CSE-ConnectionGUID: tOzW5fv+QvSVgfofsiIK2g==
X-CSE-MsgGUID: 0F2iF6VfRoWHx5Q7sudnrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="162968772"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Jul 2025 08:32:46 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ug3Mi-000MgB-1j;
	Sun, 27 Jul 2025 15:32:44 +0000
Date: Sun, 27 Jul 2025 23:32:12 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-chan 5/8] io_uring/chan.c:41:6-25: WARNING:
 atomic_dec_and_test variation before object free at line 42.
Message-ID: <202507272308.X66QwCtR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-chan
head:   2a5cc11d9adcadc5858cf66560d43d160a042d84
commit: f5f2e7456b712969ef09eb7389d1bcb6d2a17aba [5/8] io_uring/register: add support for ring -> ring channels
config: riscv-randconfig-r051-20250727 (https://download.01.org/0day-ci/archive/20250727/202507272308.X66QwCtR-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507272308.X66QwCtR-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> io_uring/chan.c:41:6-25: WARNING: atomic_dec_and_test variation before object free at line 42.
   io_uring/chan.c:41:6-25: WARNING: atomic_dec_and_test variation before object free at line 44.

vim +41 io_uring/chan.c

    32	
    33	void io_unregister_queue_chans(struct io_ring_ctx *ctx)
    34	{
    35		struct io_queue_chan *c;
    36		unsigned long index;
    37	
    38		lockdep_assert_held(&ctx->uring_lock);
    39	
    40		xa_for_each(&ctx->xa_chan, index, c) {
  > 41			if (atomic_dec_and_test(&c->refs))
  > 42				kfree_rcu(c, rcu_head);
    43		}
    44		xa_destroy(&ctx->xa_chan);
    45	}
    46	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
