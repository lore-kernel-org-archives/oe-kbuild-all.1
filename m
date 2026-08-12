Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2307F397699
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Aug 2026 20:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786566750; cv=none; b=JwZKLzVHel/AmoWEM11tZn5JhEIXCvtjiCxvPWVo64ZzinjJLsTT9CJ0Y7ngT/PhVIXG94sOrol4tcM/wkR1hBIvxFutZcOpt/BQzz6l3LG8jkWTkyYd/cJrzBWMFYqQ76p/HddE7ID3nlQdUiOwxCLjssOzdJx3E8DrIBBYoWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786566750; c=relaxed/simple;
	bh=nfY5zPKwM2gLml0qre7b0AOg1Gx81zzxo8QIakDvoIU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cpDfnzwd2eK+OzkhJUnuQXqEFCTOz5/+mP0U5Rrp9rOlsg8qxkyJPnVnmf9Ufd0zUo2wcn9djjZyttFcZ2CpYpiOE6VlppZ6u4Rxfip23nQHgzXMKAnZ96/Eqxk69q8YiOABaL+fmGhmJrAxaohV9Rw0cXGRrCDyz4/mWvLQVU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JtfPZZIq; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JtfPZZIq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786566749; x=1818102749;
  h=date:from:to:cc:subject:message-id;
  bh=nfY5zPKwM2gLml0qre7b0AOg1Gx81zzxo8QIakDvoIU=;
  b=JtfPZZIqB/Hl8IcDX6YMjcfxIQGZQcai4DGImEEwja0rPjBPV6NGXCBY
   H57Bg+6iKCc6nq8/vbefgmAaiUlyb/4U4Z4n4BVkNwvdMIlHtG+n/gBpu
   fGUNtQ3f/VYqA+sik19uaWEDLTC1oeUJEb6jmfqZ7N4N5WbnpEo7c7wJp
   KFCGhbA/xtMyd4OxtsUsCCTxAHqHzzGKPM5PQC0Xck6OyRORWkxU3kMUG
   HOMIY2hG8e51ub4xXRoL/e8PvmMxe9leffA2QVQrM32VY1Ee1l89D2AXS
   LgA6gbR0XkVGdSXM63LZEKM5bAVUjVLNQ79VEh7l8grX3ZT1YTa0Z+XRi
   g==;
X-CSE-ConnectionGUID: 7VfFPGuKQ5is7AUq3+bmSg==
X-CSE-MsgGUID: UNR3BTJDSPKCxWL+0o/GDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="90814661"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="90814661"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 13:32:27 -0700
X-CSE-ConnectionGUID: 3RRVosEzRemgM8LZrrMfzQ==
X-CSE-MsgGUID: MZeEJhY5Qri7yRyK2N6/MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="268011491"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Aug 2026 13:32:26 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuFcd-00000000RcE-2QJv;
	Wed, 12 Aug 2026 20:32:23 +0000
Date: Thu, 13 Aug 2026 04:32:22 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:arena-kptr 4/11] verifier.c:undefined reference
 to `bpf_prog_arena'
Message-ID: <202608130429.eBgINrZ3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux arena-kptr
head:   637d14126b38da5a1a081d12522c8dd5bd465eee
commit: 9d11071a7f64de877aa38e4caaee708ac3ab67b7 [4/11] bpf: Collect typed arena declarations during verification
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260813/202608130429.eBgINrZ3-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608130429.eBgINrZ3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608130429.eBgINrZ3-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/bpf/verifier.o: in function `collect_arena_types':
>> verifier.c:(.text+0xd4ba): undefined reference to `bpf_prog_arena'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
