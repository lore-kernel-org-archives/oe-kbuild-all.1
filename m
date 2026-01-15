Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A597933E36B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 09:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768468018; cv=none; b=QnG5XatuN6zDqUnypWF3lGb+vJdtMzsCibJmw24d0jGpfrWg6TnGnVTtBF6tHWWglIhfyfZMRaXjglzX+ZxqhUmJvqSOSohuBlP1o6LmR3je8ctrvoypqsmu1ZPVnCff3vKktW8l5ajUZU/t8D/BQQ22WUB44md2jmQGcTebcl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768468018; c=relaxed/simple;
	bh=eTnpoe5skDqbCroO//3L8maPxmEA615dp4zWnsaYHqw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Px328vJSm14jjx914KfPZym8mZreZEHm5b7pJHWITevMVWJtUhypKoyjkXKH3mYj3k4hg9BpkaGA6SmmhGDiF2XDdLElCBwIslUkStzLeWop5v8kRZqWJcOHKNMrETMhY4aaHJiK7/NsXwI+a+1QCnkR0wM+zzVfUQ6DShvWNS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eir1drDU; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eir1drDU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768468017; x=1800004017;
  h=date:from:to:cc:subject:message-id;
  bh=eTnpoe5skDqbCroO//3L8maPxmEA615dp4zWnsaYHqw=;
  b=Eir1drDUdgbgwPZgEtUAVZN8iysG/kK4z8me/3t66N3CT01imS72BM3x
   6YxpRxhtP5xuFUpnNC6qKcTRRKpc3uQa3nP6Nis70ZezKbTQMhSKS70Lr
   IYQRRuT7zIPhGq9e8zjVW+yNkZ7AmjNuBR0ooDo9Fd1h6f33f4d9OAGzv
   9owH/2amslFnaKkw3fgnd2iDx/shr2FyD/Bf371KLkjqbzy3TnFLQHGCK
   OGT15auPLHgi2w/Q7yNiL/uGWOIpe0Mj6CsqW350bztaeCOIk5hwUYMbY
   Q+UXl+/LutA0NfYaomlZxGQU6PSb1YifDoTSIsXnxKkRXjfMdyUIul9Hn
   Q==;
X-CSE-ConnectionGUID: acSJ85PgTQujNr2omSR3Wg==
X-CSE-MsgGUID: UC3Ze3JUTe22g/YXUcNXmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="68782053"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="68782053"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 01:06:56 -0800
X-CSE-ConnectionGUID: vMbLUKTfQxyfW8oIEQzpsw==
X-CSE-MsgGUID: UOeX9ftjQbKFAQ9aZFwItQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="209769188"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 15 Jan 2026 01:06:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgJJc-00000000HmI-386n;
	Thu, 15 Jan 2026 09:06:52 +0000
Date: Thu, 15 Jan 2026 17:06:41 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:io_uring-bpf-restrictions 16/16] m68k-linux-ld:
 register.c:undefined reference to `io_register_bpf_filter'
Message-ID: <202601151648.7ThtKXFd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git io_uring-bpf-restrictions
head:   29ac83fe2b009e9bc007cc44ea21832a904be4fe
commit: 29ac83fe2b009e9bc007cc44ea21832a904be4fe [16/16] io_uring: allow registration of per-task restrictions
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20260115/202601151648.7ThtKXFd-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601151648.7ThtKXFd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601151648.7ThtKXFd-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: io_uring/io_uring.o: in function `io_init_req':
   io_uring.c:(.text+0x3fc): undefined reference to `__io_uring_run_bpf_filters'
   m68k-linux-ld: io_uring/register.o: in function `io_free_restrictions':
   register.c:(.text+0x10): undefined reference to `io_uring_put_bpf_filters'
   m68k-linux-ld: io_uring/register.o: in function `io_uring_register_blind':
   register.c:(.text+0x8a4): undefined reference to `io_register_bpf_filter'
>> m68k-linux-ld: register.c:(.text+0x8f2): undefined reference to `io_register_bpf_filter'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
