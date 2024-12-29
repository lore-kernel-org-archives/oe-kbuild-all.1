Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB32E2594B6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Dec 2024 12:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735475270; cv=none; b=rD8DnXA9eTZcVks87ou16M5sSsRtNPGezYIFJjOGwdBBr5V1+/o75IRI+da4I+EXebiT3gKHSd6g0dTnna0VyVIThJGklSnx/4fLcmE5XFAbSrKQJd0ItX4CRgZvIFHyLrdqHKbfR89qIh0TPXWAt8sdpJCRfCTZy4yXmePRh08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735475270; c=relaxed/simple;
	bh=cV75I0Ijm4fapxVsEew/c/bz48T8JUOn+HdIIK2dXcc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MEh/sxIIkutZs9tZzuIgKqZYPpgN1PLcILyON4Z8di0O1ccuOVrT80yc5eWBURamWdbWpfBs3lQkU0K0oVlWx1OT0rE00sFntGDF2geJq2zwi9m4l85ELoJlszCLTz476MV4c/xH0DAvn6Huw8ZiWQAb658ts8kxSlkUvvUX/78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fFUPWK94; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fFUPWK94"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735475268; x=1767011268;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cV75I0Ijm4fapxVsEew/c/bz48T8JUOn+HdIIK2dXcc=;
  b=fFUPWK94UEehs+2Hj3xQ9VBNP+bYT2jLgCvX6bNTC34tAbMhswG7wDEJ
   MNj9MtIExh9DZ+Ybi7RyWDQvX+GonJ1CJm3yndlX/Fy83m/+iL8V/3BpB
   3+OR+YOkPb1bxuU/x78uNML5o0kUsTF+JAz5COUZelP9joh+egokdHAgI
   dnzhY5hhMcmbQj3gkWuqE4Bxk1hs+QL1n+GFtqTPj1nb2bTW4Ma0sReA9
   9kSkthmOIODI0o6g89g4GQ0z+TFLKHPIyB69jJJdKxBmVKxkG9hFOKigU
   J9DTSDrKFc8ApjMdRji2b6salTAsrTIMxp5Dws5bytTFquU8VvE9mpgwd
   w==;
X-CSE-ConnectionGUID: Kq4i8B3dSs6Hbsm36xjScA==
X-CSE-MsgGUID: v40abA3qRl2kOv4uYk+DwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="23384001"
X-IronPort-AV: E=Sophos;i="6.12,274,1728975600"; 
   d="scan'208";a="23384001"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2024 04:27:47 -0800
X-CSE-ConnectionGUID: XgimIZN5SoKjnRzAY8BLdw==
X-CSE-MsgGUID: 9rC83csRRxiX+FfJlYxX1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,274,1728975600"; 
   d="scan'208";a="100401321"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 Dec 2024 04:27:46 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRsOV-0004fb-2H;
	Sun, 29 Dec 2024 12:27:43 +0000
Date: Sun, 29 Dec 2024 20:27:36 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	Barret Rhoden <brho@google.com>
Subject: kernel/bpf/arena.c:245:6-25: WARNING: atomic_dec_and_test variation
 before object free at line 249.
Message-ID: <202412292037.LXlYSHKl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   059dd502b263d8a4e2a84809cf1068d6a3905e6f
commit: b90d77e5fd784ada62ddd714d15ee2400c28e1cf bpf: Fix remap of arena.
date:   6 months ago
config: x86_64-randconfig-104-20241229 (https://download.01.org/0day-ci/archive/20241229/202412292037.LXlYSHKl-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412292037.LXlYSHKl-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/bpf/arena.c:245:6-25: WARNING: atomic_dec_and_test variation before object free at line 249.

vim +245 kernel/bpf/arena.c

   238	
   239	static void arena_vm_close(struct vm_area_struct *vma)
   240	{
   241		struct bpf_map *map = vma->vm_file->private_data;
   242		struct bpf_arena *arena = container_of(map, struct bpf_arena, map);
   243		struct vma_list *vml = vma->vm_private_data;
   244	
 > 245		if (!atomic_dec_and_test(&vml->mmap_count))
   246			return;
   247		guard(mutex)(&arena->lock);
   248		/* update link list under lock */
 > 249		list_del(&vml->head);
   250		vma->vm_private_data = NULL;
   251		kfree(vml);
   252	}
   253	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
