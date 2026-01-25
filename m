Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EF52D739B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jan 2026 04:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769315992; cv=none; b=tLFl3yRgRE1QXwvHWYBXj+5YzqsPf0+P+/V/Wuk4Kq7kZSMLLUNOuKMVu1zPcmc4SJ0bw3SmqKuTPbPE5a1VIzMpm/6tQLsIUQW4913L8tO2NLzlQgxLDkg2wU7vMllIwvH/VXWztr/yFAuVcwb/S98DhquZ3VRqSOSw3xqPkvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769315992; c=relaxed/simple;
	bh=hHOUqiUNZPz88x5kDHDV6cazO/gwa+Su8WuYMs1jw7g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iIw3pIOs5mil9faUw1SEtqqoMGegaExt1b2YMeTXeKHLXqqRAyiqwXckgqnSZNQiNB3aG644dNGkLJrsfd+6ep04ip//nv5Rg2v1YYBHwlhBMWf4pdgnXQTl4QUkGXokgn2vPAm53YZl1WZWuA77rN03GC921EegyFgfV74nnyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KIF0o/O4; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KIF0o/O4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769315991; x=1800851991;
  h=date:from:to:cc:subject:message-id;
  bh=hHOUqiUNZPz88x5kDHDV6cazO/gwa+Su8WuYMs1jw7g=;
  b=KIF0o/O4GuRds6EfKFVUUo67j0rpVYCoVbftnC07rx41E7wD2PAZ7JXr
   VFfxXevSU3gMOvc8nid29MK+dk89JYhsS0py1mtinzDURM6eGQ34WtCPj
   JoSt7+8tQEQiOKC2GSCRuzOgw+CqXO6f3m2uLNieYv1ZbQfUUwvGuQg4a
   SQooQHqE2RK5N5PTRCgD/X1mLFY+iQpnqqjNJmarTJNPfbxo2Y6oXqYeI
   Y6Bi5gIw3FkUmwPvRYjxBHJv4iPWdajv7GYW8RAiw91xtSCObAyBj0aUP
   RgxDWwWZs8lA06XPZRd9xThVBdWYSRcOinyPkrShd9lC5CMhk7bwMVvSX
   w==;
X-CSE-ConnectionGUID: rcvQGXXDSlO05xN4BBmFBA==
X-CSE-MsgGUID: pYAuHxTgQimiyN+GSn5Fyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="95984204"
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="95984204"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 20:39:50 -0800
X-CSE-ConnectionGUID: q1/t9l0eTn6/AUTCdu52ag==
X-CSE-MsgGUID: LwSVQ7dxTYSNgA7U2UxTKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="244994784"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 24 Jan 2026 20:39:49 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjrub-00000000Vmg-3id0;
	Sun, 25 Jan 2026 04:39:45 +0000
Date: Sun, 25 Jan 2026 12:38:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:for-next 10347/10348] io_uring.c:undefined reference
 to `io_uring_dump_reqs'
Message-ID: <202601251239.mVAxL0IK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-next
head:   eb5f0ef856d5eb3b92207f9b5ebcf604524d2532
commit: 52ebc4deb79dfb889e7ee3bacbc0a1276d1f8439 [10347/10348] io_uring: add debug dumping for when the ring can't exit
config: arm-randconfig-001-20260125 (https://download.01.org/0day-ci/archive/20260125/202601251239.mVAxL0IK-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260125/202601251239.mVAxL0IK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601251239.mVAxL0IK-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: io_uring/io_uring.o: in function `io_ring_exit_work':
>> io_uring.c:(.text.unlikely+0xdec): undefined reference to `io_uring_dump_reqs'
   arm-linux-gnueabi-ld: (io_uring_dump_reqs): Unknown destination type (ARM/Thumb) in io_uring/io_uring.o
>> io_uring.c:(.text.unlikely+0xdec): dangerous relocation: unsupported relocation

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
