Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BC720D4E9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 00:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786580349; cv=none; b=CmXNZlBBr09lIBUUscS3iJRg9jD4lehFSaGBPXRERnd5PCDQP/v4GOWSJ7epfeP83LSH10DhcYtXMpS/GWvbQURJ21XtpkYcWMiTF5EH2jAGwMzXO1Hqr8o7SLrCc42h0rbb4vpcOYno9PZ8uier3JLcQql2oMwW3/q8lJ3HNgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786580349; c=relaxed/simple;
	bh=JWFyTIL9sIBkHvCE6FLKHiV1FvIoIXC8CWcDu0JpTJw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LrzvCHkeTIUUjSBZRMzmaGu9PEp/WLk9UseOFVkFx2arPZMihEAtkHMDcjToQouPyvM5WgsdGbBRLbyOtbIKMtz6WhmYmeUKNAriC/BIxOZcCPJ6EkIZprf5KT+LysVW35qMb1mc9ZLKJSK9j0EJSvynl876rceBXVTaerU6FEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lpTslytF; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lpTslytF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786580347; x=1818116347;
  h=date:from:to:cc:subject:message-id;
  bh=JWFyTIL9sIBkHvCE6FLKHiV1FvIoIXC8CWcDu0JpTJw=;
  b=lpTslytF8MGdXdoGhvJMQ+vm1egezMvjx/7gV4exIm/8TMLNIy9XLv22
   5nKblSxcT2goZUeENgbwpSfOLOzAgKhu1Ge3LiToDujtwvKLXUPlnJcnh
   Yen/1NczkKRXW5HwjG4mLZFjpUSA5JgxrzqI0i+ZuyWhWmTeNndbHQZdc
   M/CdN+UebOYn/kJUG0dDjsyWqM/1V9GSlRShNs8SFppahBHkwlhMr0Lvq
   GJUQJ+u5OZHEtqtwOtgtkezaOFwk1pKbJsfLQqstTVdd2CSF8A0YfrMZs
   SC/pEYbiKhsma2e/T+UPiLMQPiTMnv8D2i+Bfazb+dKbaciJPaageIZFF
   g==;
X-CSE-ConnectionGUID: XogKZ8A9Re2KMVULd+RBQw==
X-CSE-MsgGUID: GzFdzmDsQiOQaLVAKBFYng==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="97497649"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="97497649"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 17:19:06 -0700
X-CSE-ConnectionGUID: 4EsmnPu4SSOh/yG/OjRc6A==
X-CSE-MsgGUID: zdEXL5Y0RRqyR/6Xsdg+lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="267644679"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Aug 2026 17:19:06 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuJ9z-00000000SFq-0d6z;
	Thu, 13 Aug 2026 00:19:03 +0000
Date: Thu, 13 Aug 2026 08:18:04 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:arena-kptr 6/11] syscall.c:undefined reference to
 `bpf_prog_arena'
Message-ID: <202608130817.LRWzQb4u-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux arena-kptr
head:   637d14126b38da5a1a081d12522c8dd5bd465eee
commit: b9c38e0bd60f01bffa8cc5656fdd1e721b7bb4ec [6/11] bpf: Allocate map-owned typed arena cages
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260813/202608130817.LRWzQb4u-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608130817.LRWzQb4u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608130817.LRWzQb4u-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/bpf/syscall.o: in function `__bpf_prog_put_noref':
>> syscall.c:(.text+0x3469): undefined reference to `bpf_prog_arena'
>> ld: syscall.c:(.text+0x3473): undefined reference to `bpf_arena_types_put'
   ld: kernel/bpf/verifier.o: in function `release_maps':
   verifier.c:(.text+0x41dd): undefined reference to `bpf_prog_arena'
>> ld: verifier.c:(.text+0x41e6): undefined reference to `bpf_arena_types_put'
   ld: kernel/bpf/verifier.o: in function `build_arena_type_desc':
   verifier.c:(.text+0xd25c): undefined reference to `bpf_prog_arena'
>> ld: verifier.c:(.text+0xd32b): undefined reference to `bpf_arena_type_get'
   ld: kernel/bpf/verifier.o: in function `collect_arena_types':
   verifier.c:(.text+0xd53a): undefined reference to `bpf_prog_arena'
>> ld: verifier.c:(.text+0xd6b1): undefined reference to `bpf_prog_arena'
   ld: verifier.c:(.text+0xd6bb): undefined reference to `bpf_arena_types_put'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
