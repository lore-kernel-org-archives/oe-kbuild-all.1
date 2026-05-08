Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C31371046
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 May 2026 06:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778221284; cv=none; b=hNO4pS68DZflr4vC3CM47zfeZYQrrvmyXO/VhHAXXdySjywDh3dINuHRmLqf3tXF60vUNq14i4VaqsI8hZZnFAVInd3U57irYz/+aD+lU9HV2SJ15Ltzp05iqqr1291SN8G0kkGLdn14uKni8pT2WmFZEnP/8Z4E9VqRrDHwiP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778221284; c=relaxed/simple;
	bh=6QKzZOOM8dcOrTwHXh9lTqAeklauwyzg+6fCVc87+v0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JDUOIl0qRlJ4imMb42t9zgpnQCPOYjma0hmbV8O8lYE1BE7PopkuzYutO6m6RIEmdBaPNJGhYOZ2mN0eC4CQCPUHX3DOehmYJL9h2UK/x7ujO5NjHWIUxK90dBLm8/WNOrvO0vsNrw93dXsfLRBTP9O3qGu4cu1n+P03u4Yl0Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JVdnmomJ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JVdnmomJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778221276; x=1809757276;
  h=date:from:to:cc:subject:message-id;
  bh=6QKzZOOM8dcOrTwHXh9lTqAeklauwyzg+6fCVc87+v0=;
  b=JVdnmomJ57ufr98ahwYM0uITAmUT5p6aw6lecwOUzqFbCOSzxcU3UDC9
   SqaaqZmrLMzB5m5IxJEe6tMwvvpy3kna0KrzPcmeOSI/ogrUDpIU2dlvJ
   XGjSp2rVqbr4zW6u8DU37Cx7l/r4hlSosYrD3bNMKg3CGu0qLFGXiyeo4
   AjXJlMda2Dg0b2KoBNt4jR/CqEHBquQTHe5f++n6G5+L6IjcF2QeIhktD
   8F9OU+E4mpmtnb7SSpaCG6D6rQ0hndwysg5/lyZP/D1s8psTxGSq6ubIw
   XjuvlT3BllymTbMW9Bvm3UVjNJWqnu2Ek2yYznKKy5W4a3+LOMaPJPCV4
   Q==;
X-CSE-ConnectionGUID: BVCachnwTzetG5q9mLn8Lw==
X-CSE-MsgGUID: KvmgJ06GRpeQrdbHliPWUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="90563629"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="90563629"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 23:21:12 -0700
X-CSE-ConnectionGUID: CliTYDx8T3WJp4n52I5InA==
X-CSE-MsgGUID: Yw7n9xyWRNqaYY9YLvL/fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="230284780"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 May 2026 23:21:11 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLEaC-000000000np-1lsy;
	Fri, 08 May 2026 06:21:08 +0000
Date: Fri, 08 May 2026 14:20:13 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:io_uring-io-slots 7/13] slot.c:undefined reference to
 `submit_bio_noacct_fast'
Message-ID: <202605081421.yBNfDTYM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git io_uring-io-slots
head:   8cda41fe2d37340341d2ae4bf15368f88b4bd5a2
commit: 61d56c943173f9e6820ff6162d25e8fce26059dc [7/13] io_uring: add IORING_OP_SLOT_RW and wire up slot completion
config: openrisc-defconfig (https://download.01.org/0day-ci/archive/20260508/202605081421.yBNfDTYM-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605081421.yBNfDTYM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605081421.yBNfDTYM-lkp@intel.com/

All errors (new ones prefixed by >>):

   or1k-linux-ld: io_uring/slot.o: in function `io_slot_submit':
>> slot.c:(.text+0x174): undefined reference to `submit_bio_noacct_fast'
>> slot.c:(.text+0x174): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `submit_bio_noacct_fast'
   or1k-linux-ld: io_uring/slot.o: in function `io_free_io_slots':
>> slot.c:(.text+0x3cc): undefined reference to `bio_uninit'
>> slot.c:(.text+0x3cc): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `bio_uninit'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
