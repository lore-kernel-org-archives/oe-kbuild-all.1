Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCFE1DE8B3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 05:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739338505; cv=none; b=ZUrI3mQSaxmykxaGwFs4Awz1R9CrCmD47RF1cTuNZMO7EwsmWUui+1cAMblQpakFJOnoSbITaD1vuUARWPXUTBaNnVjGpmhyQwvC4SYMihhhZoCzDnxBkL4eP7ItWd3e7Z1n1sN5yG3OMdJqi6mnpptdbldeOMUzh62N3Ir321c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739338505; c=relaxed/simple;
	bh=WBEf8tU0eCx2Hh7Jxl0zJmivphS0XekLs2d30+hD9lw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WmkZ1V/E+2qw93dLoh5iEC9uPX1LvosuQqoFwyx7/1WRd9siPSaZvMlZDrufJt8QYgU9ziWi6pYb2gk+RRAM+hPjc+bpsTwf21gIkQ2q0Xfxv98msZB3XC3kCJ/FogDrICkF+zy/ragz2ebBhPNiqjRKo/3NneKGt9EI4QURpYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gln4ylrw; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gln4ylrw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739338504; x=1770874504;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WBEf8tU0eCx2Hh7Jxl0zJmivphS0XekLs2d30+hD9lw=;
  b=Gln4ylrwXp4TQWUVk6yRCuylazSan06m1MTbcU5xdGfVWzgW6cuMKPyu
   JoMe8FtR/6AmPc0mWgpSkXKWF43vJFstpShpndUKuXYzFVG6W2zg48a1X
   SOodbbJ0Y29VyKiwGfJMCbs+8/O8ueScZx/Z6Pq8PkFmqCv4e8N+JpD7o
   M5k9ublWPmfcClL7bfm8tHQgj/WmM8FgZMZ0Ifp8g6QEg8CSr/8J8mEfI
   TVmFMVGO8TDNowh6iBmRLCVaLGjqFSpBE7ZXGI4Z5vdQ26DnxyCEKrgf8
   Yu4SnuyHnwhkf7OMlBXxyEP++GJoMO2dTEX1ry11K6+Mrpht36vq+40xU
   A==;
X-CSE-ConnectionGUID: 0EjPj/30R9a2ps2HWz4BeQ==
X-CSE-MsgGUID: jdBWP4OJTYqo9qmtExpWbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="50964568"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="50964568"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 21:35:03 -0800
X-CSE-ConnectionGUID: cWXFbrOeTaupJK5pQOBENA==
X-CSE-MsgGUID: 7XAkIgiNQDiwtjETont7jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113205703"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Feb 2025 21:35:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ti5Ok-0015AT-2Z;
	Wed, 12 Feb 2025 05:34:58 +0000
Date: Wed, 12 Feb 2025 13:34:40 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1423/1423] kernel/bpf/verifier.o:
 warning: objtool: do_check()+0x2bd2: can't find switch jump table
Message-ID: <202502121329.j5PZcydK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   6a6cc2b6b95dc80ae01221670e21a8059229a023
commit: b2fdc6d8c190bbe579cbc19c520f3d7c25e9fb44 [1423/1423] bpf: Do not mark insn as seen under speculative path verification
config: x86_64-randconfig-103-20250211 (https://download.01.org/0day-ci/archive/20250212/202502121329.j5PZcydK-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502121329.j5PZcydK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502121329.j5PZcydK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/verifier.c:6228:16: warning: cast from 'unsigned int (*)(const void *, const struct bpf_insn *)' to 'u64 (*)(u64, u64, u64, u64, u64)' (aka 'unsigned long long (*)(unsigned long long, unsigned long long, unsigned long long, unsigned long long, unsigned long long)') converts to incompatible function type [-Wcast-function-type-strict]
    6228 |                         insn->imm = (u64 (*)(u64, u64, u64, u64, u64))
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    6229 |                                 func[subprog]->bpf_func -
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:6569:17: warning: cast from 'void *(*)(struct bpf_map *, void *)' to 'u64 (*)(u64, u64, u64, u64, u64)' (aka 'unsigned long long (*)(unsigned long long, unsigned long long, unsigned long long, unsigned long long, unsigned long long)') converts to incompatible function type [-Wcast-function-type-strict]
    6569 |                                 insn->imm = BPF_CAST_CALL(ops->map_lookup_elem) -
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/filter.h:323:4: note: expanded from macro 'BPF_CAST_CALL'
     323 |                 ((u64 (*)(u64, u64, u64, u64, u64))(x))
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:6573:17: warning: cast from 'int (*)(struct bpf_map *, void *, void *, u64)' (aka 'int (*)(struct bpf_map *, void *, void *, unsigned long long)') to 'u64 (*)(u64, u64, u64, u64, u64)' (aka 'unsigned long long (*)(unsigned long long, unsigned long long, unsigned long long, unsigned long long, unsigned long long)') converts to incompatible function type [-Wcast-function-type-strict]
    6573 |                                 insn->imm = BPF_CAST_CALL(ops->map_update_elem) -
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/filter.h:323:4: note: expanded from macro 'BPF_CAST_CALL'
     323 |                 ((u64 (*)(u64, u64, u64, u64, u64))(x))
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:6577:17: warning: cast from 'int (*)(struct bpf_map *, void *)' to 'u64 (*)(u64, u64, u64, u64, u64)' (aka 'unsigned long long (*)(unsigned long long, unsigned long long, unsigned long long, unsigned long long, unsigned long long)') converts to incompatible function type [-Wcast-function-type-strict]
    6577 |                                 insn->imm = BPF_CAST_CALL(ops->map_delete_elem) -
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/filter.h:323:4: note: expanded from macro 'BPF_CAST_CALL'
     323 |                 ((u64 (*)(u64, u64, u64, u64, u64))(x))
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 warnings generated.
>> kernel/bpf/verifier.o: warning: objtool: do_check()+0x2bd2: can't find switch jump table

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
