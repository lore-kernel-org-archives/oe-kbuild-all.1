Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E262AD00
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Nov 2025 15:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763481289; cv=none; b=Kb4D7T9rhAn3O233/kJME89tOUFudYSanrQx8IDUZJZiYAvNhbu08xsS8Sg4MlHxnW4jSetEnpQ9B6sd03Jib6ncqe+mpjn1rEEfeZ2uPt/Zo0oMy+Tzzu6OB10zHLq2MlDGYG7+pdH6TPAdHT75zqFq9fC+ub01Mw0m/Ccbfzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763481289; c=relaxed/simple;
	bh=c/yGj091yL8J+7FRSpkrMMZXiKbcP4PTvUIgpVKLRuA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B/av1k/Z+7tpBPS2e5JF+VtE1Tely0RcvrLBGO55XWs/dvyCDdcfA7vblUxRpkJQORt7vyL3V6dnNIwQAYJ9X8PGdMO2eOkCEZPjDm8cGS2jeyQDNGUoQDLw/tCJv/InUsbANyd8f+bxObs/RqS/FsS4CGBca7f4SYPA0CLG6zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AohTqjRs; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AohTqjRs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763481287; x=1795017287;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c/yGj091yL8J+7FRSpkrMMZXiKbcP4PTvUIgpVKLRuA=;
  b=AohTqjRsuabRXmdWAdoHwwL7xk08FoQAzMbBmEXcb8vU9cuNaCduNrnI
   p3IkELVBP3ctemNVErGE3IjYh0Z63/6EP035NpnXfgaFtvNhKR0mKt1qV
   lLP7sdcZMqYBiaTlsPY2/H2mUihwJqMs4iXlcbM5G1SsURkOayTHyJWD5
   CGHmKpC/PH9XjXXs/URRmECDiO6l7fJYjhhVFut3Sk75jk7OBqmNDS3as
   JLqaqLc3Afg9FuSbzl9JItXGwnfD0ui/mFAVhafInwrRD/CtTCgpmGi1c
   rDWmBGrnzrzoDWrAH6ub9shRxnM0a7leksaeIlTIYdCf1rpwBlEVmHW4G
   g==;
X-CSE-ConnectionGUID: ZPLYuoBFT1qLMr69Swz9bA==
X-CSE-MsgGUID: ZVDYj6jeS8efSZK6fPJxBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="53078099"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="53078099"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 07:54:46 -0800
X-CSE-ConnectionGUID: VXo//5e5R9Kk09UxycfieA==
X-CSE-MsgGUID: I3aiR5wST/CVBMwFd2ei2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="214181098"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Nov 2025 07:54:44 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLO2U-0001tr-21;
	Tue, 18 Nov 2025 15:54:42 +0000
Date: Tue, 18 Nov 2025 23:53:56 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 717/927] ld.lld: error:
 duplicate symbol: __tracepoint_io_write
Message-ID: <202511182329.IXcLyxFI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   2a5b0fcac508d53f714c6e10d81971b0ee049f75
commit: 9e5dd8dc46457efec10e10ab74f5db6fda587ac8 [717/927] bcachefs: trace_io_write
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20251118/202511182329.IXcLyxFI-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511182329.IXcLyxFI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511182329.IXcLyxFI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: __traceiter_io_write
   >>> defined at trace.c
   >>>            fs/bcachefs/debug/trace.o:(__traceiter_io_write) in archive vmlinux.a
   >>> defined at debug.c
   >>>            drivers/net/wireless/silabs/wfx/debug.o:(.text+0x200) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __tracepoint_io_write
   >>> defined at trace.c
   >>>            fs/bcachefs/debug/trace.o:(__tracepoint_io_write) in archive vmlinux.a
   >>> defined at debug.c
   >>>            drivers/net/wireless/silabs/wfx/debug.o:(__tracepoints+0x90) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __probestub_io_write
   >>> defined at trace.c
   >>>            fs/bcachefs/debug/trace.o:(__probestub_io_write) in archive vmlinux.a
   >>> defined at debug.c
   >>>            drivers/net/wireless/silabs/wfx/debug.o:(.text+0x2e0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __SCK__tp_func_io_write
   >>> defined at trace.c
   >>>            fs/bcachefs/debug/trace.o:(__SCK__tp_func_io_write) in archive vmlinux.a
   >>> defined at debug.c
   >>>            drivers/net/wireless/silabs/wfx/debug.o:(.data+0x10) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
