Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608F0238166
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jan 2026 06:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768719553; cv=none; b=kdx9oXvHZ/bh5CtZbjnJ7yZWWYr6OTwTIxb74FDnmVJutXMZQsEP9YjN75f6u6PNljEysQlxI1EIvr7Xr9sVvCiadqkScluPe8CwgVYfpozeM15vLmUsCy1JYtBLbzCShmnyscAaLeWrdk8Nwsg8Pp1wzcSr8VhEEzLjOtaizKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768719553; c=relaxed/simple;
	bh=j9ydfxk5Q5Hvvi3Ft1YuonsAl5GtVTv7hqyHBcI+sg4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iDlbyKC73/TAfvzKb13uUIgB6JycCj+T4z+ACM7DKWWJawlJG8vYnZM03A6T0y0IKzhjorXR1K9C6uPhmUdUD47SwSbL2AUms9ZJNLX13bLjkVwbSYNa3mtNhNuhfg4bHC2tspIxGysQhwZ1iWJtquY4PIUXekmsguNZheyRf4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dGJfvgFr; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dGJfvgFr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768719552; x=1800255552;
  h=date:from:to:cc:subject:message-id;
  bh=j9ydfxk5Q5Hvvi3Ft1YuonsAl5GtVTv7hqyHBcI+sg4=;
  b=dGJfvgFrqHTLSCPsRRQhHbcH7Yg0p/k9sq3JqvZ3CrGQW4Uaw06G/3cK
   kcbF+OoSk21AMCp1CXlr1MGdMpNOrfU2T+5u84+lthxzkNMFotmHd4pFZ
   LzXOGdVFeH88vXOBap5n/W1uFdOwf9Cg6WnUZRl08DNYZBtxu7XCFBr+G
   YRjZqewsC0ypZ7Ng3z2IS4cKSZcZBGGG3hFlnhsEiPrfAnKH3wbu/fYa9
   yQG7/3bHzdoXctvoVepzL4mLFL/Vd39p7LjwYIkfg1hYO/gry/9TarK/i
   GpK81WO5Hr3FlI5znssz6CW4BO+ybawotL61GV7il6K6kgWVFedu0AvaD
   g==;
X-CSE-ConnectionGUID: B+kpNCtKRaSsnUau+LK8NQ==
X-CSE-MsgGUID: 9DyVsavHRM6ZcqEgQji9Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="73822641"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="73822641"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 22:59:10 -0800
X-CSE-ConnectionGUID: XwmEYfCpQfeA/Dybu7wCyw==
X-CSE-MsgGUID: gdn0Bsx4Tcaj2JMJ/LcvJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="205865697"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Jan 2026 22:59:09 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhMkc-00000000MkS-3DS0;
	Sun, 18 Jan 2026 06:59:06 +0000
Date: Sun, 18 Jan 2026 14:58:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:io_uring-cbpf-restrictions 13/18]
 bpf_filter.c:undefined reference to `bpf_prog_destroy'
Message-ID: <202601181424.Y741EYBi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git io_uring-cbpf-restrictions
head:   0f8a03cfaae90d44799d4cd29cc308ffdd81d93e
commit: 5592bb2b6fab7adb19ebedac49d65820d92c8b04 [13/18] io_uring: add support for BPF filtering for opcode restrictions
config: x86_64-buildonly-randconfig-001-20260118 (https://download.01.org/0day-ci/archive/20260118/202601181424.Y741EYBi-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260118/202601181424.Y741EYBi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601181424.Y741EYBi-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `io_free_bpf_filters':
>> bpf_filter.c:(.text+0x52235c): undefined reference to `bpf_prog_destroy'
   ld: vmlinux.o: in function `io_register_bpf_filter':
>> (.text+0x522891): undefined reference to `bpf_prog_create_from_user'
>> ld: (.text+0x5229e9): undefined reference to `bpf_prog_destroy'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
