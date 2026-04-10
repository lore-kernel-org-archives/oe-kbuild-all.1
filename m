Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C603469E7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 09:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775811805; cv=none; b=px2fqPPOUK+rOs5J/WkM6Hsk54oj6aOlESxSFoSOKtebMsWIES9xyxdig1OGsKydugE1SxUmZaNsAU8JTMOc7rp6A5Opk24oagc8DBzXRI20Uuq7uWGG4yqzqk0Zjpoik6zUhDNV1vFNXxhpsez1hX/BawQzXYxBL6yuid0i6Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775811805; c=relaxed/simple;
	bh=+yUGymdWAops3sTWUdRW3Llw6uAt92lLQfH89gzBEwU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UlHx08yrerViwgw79lPwLZ9iaJjut4Nxw1/8ui8a8Yo/7X7oxS+BIKTPFN9GE8yoUDQbC2YAEoC6gRw24I2SXRzlNdo96eDT/zbhE3y3eklMBQza1wS5sPu+MmMeRcKEWqrzvOXBngf4P+FIm744lx9EsvPxTP6s1FJ9Z5z6P/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j73ZTmOv; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j73ZTmOv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775811804; x=1807347804;
  h=date:from:to:cc:subject:message-id;
  bh=+yUGymdWAops3sTWUdRW3Llw6uAt92lLQfH89gzBEwU=;
  b=j73ZTmOv7DUp/yk6WGcF9lROwwTC6TpLANYydvm/13r/uLkKW42iZPbx
   tqS45g8Les15DSKnsTqydgLCjr+t8wP8rrL/emdDoAUTwY1FXwV2gNmPs
   4TvQ3kvnP4uuuLMg84oAZoffVgUCq0X+6uP9N7bti2Bd05Ls4YP3yuE0H
   adPuEd/tY5TjrMeKiavYnTR1ArFPu47DoPB5Myy9+juGIhcYhmSCTYN+Q
   wFSXbEgRsZggv87Drp4YCrXXAt3E5R/JhiB9y7SziCw7IyC/va1Rvwehl
   LPlxySniSSuvsBQGFih0JYQOK4fLYp4lQSSYai537EMw1WZCp9mCVN6H9
   g==;
X-CSE-ConnectionGUID: ezI7EwuVR8C6VHvHWbttpQ==
X-CSE-MsgGUID: txirmbs7QeW4zLKMj/+BRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87116492"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="87116492"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 02:03:24 -0700
X-CSE-ConnectionGUID: /xjJHk5dTVOdGtFTVqGKNw==
X-CSE-MsgGUID: 2KL5hW8GTZOt7qshT0fJPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="233960260"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Apr 2026 02:03:22 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wB7ln-000000003Vx-4Byy;
	Fri, 10 Apr 2026 09:03:20 +0000
Date: Fri, 10 Apr 2026 17:02:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 2/2]
 mm/page_size_compat.c:101:21: error: use of undeclared identifier
 'bpf_map_fops'; did you mean 'bpf_map_put'?
Message-ID: <202604101625.iJPMFeIM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   08e21ebff803243bccd5e6cd4a8253ffebf74c64
commit: 156b58543560782fded68ccebbf252314d2d9ba7 [2/2] ANDROID: 16K: Adjust bpf ringbuffer pgoffset on 16K x86 emulation
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260410/202604101625.iJPMFeIM-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project ae825cb8cea7f3ac8e5e4096f22713845cf5e501)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604101625.iJPMFeIM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604101625.iJPMFeIM-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> mm/page_size_compat.c:101:21: error: use of undeclared identifier 'bpf_map_fops'; did you mean 'bpf_map_put'?
     101 |         if (file->f_op != &bpf_map_fops)
         |                            ^~~~~~~~~~~~
         |                            bpf_map_put
   include/linux/bpf.h:3135:20: note: 'bpf_map_put' declared here
    3135 | static inline void bpf_map_put(struct bpf_map *map)
         |                    ^
>> mm/page_size_compat.c:101:17: warning: comparison of distinct pointer types ('const struct file_operations *' and 'void (*)(struct bpf_map *)') [-Wcompare-distinct-pointer-types]
     101 |         if (file->f_op != &bpf_map_fops)
         |             ~~~~~~~~~~ ^  ~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +101 mm/page_size_compat.c

    98	
    99	bool bpf_is_ringbuf_file(struct file *file)
   100	{
 > 101		if (file->f_op != &bpf_map_fops)
   102			return false;
   103	
   104		struct bpf_map *map = file->private_data;
   105	
   106		return map->map_type == BPF_MAP_TYPE_RINGBUF ||
   107			map->map_type == BPF_MAP_TYPE_USER_RINGBUF;
   108	}
   109	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
