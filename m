Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E760139580
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jul 2024 20:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722286446; cv=none; b=CCKcQOgY1QD1+YCO2jhNzLlB/sutgVwWnM7n0gGo4mzREdzvRj6ofKcPdZebdWLPfGxe4QaYPmdlmUH7+bFhEq8CRrlBi2k25OH7xWpuCDvTBHHfejo1XZ/mFToQnei/A3Gi32zk74sycWNm02eZ4chMruoMETDr4hd5oBHVvrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722286446; c=relaxed/simple;
	bh=0fAVzBLCxoM151Ff779XQQk9PxTzGyQxOr+PxA9jJ9k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dMc7u0tVdDKHV+KThBj1YAUuaQ7TgTbXE0IhdrBoKBri/8hZKyXKwDgbiScdFn2m8ZOuIIEuhBOwbHSJvpctSU7WBUnqUPjC2eg8ZZi8zvNcZwF01P8Zmkp9mFD6YQfvBxCxFFsS6VqSbQ9wQYh0CBKYjWVJjnQLQ9tYFyAVROM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JDZyFDDI; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JDZyFDDI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722286445; x=1753822445;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0fAVzBLCxoM151Ff779XQQk9PxTzGyQxOr+PxA9jJ9k=;
  b=JDZyFDDIFTy4LkXEvLuPf3a6yh//ymn9ZO4h8mWrt7rtW1BVye8tnoFK
   eZaEaTXaopYZSTdtaSwgegGYwd9E9UE1L4dNCEoLPKeO0rQXYpSXNV2hR
   U/uBWfRiCgE9hRcO5Dhi9GRnYQVSVtnTUnJAQqiyWeaArlni98z5K+LCA
   C2s2O9ypM5ebpgsTk1jJq01tAmETZAOJTi2rhU/Jzx75A/oWEcDv48sxV
   jQ1R7oLQxMm+F1/HFEOJy5WIRFrIFg7kKmvqWa+rkjCHFmi7HG54U60hQ
   EFRQWP5L3k9V0LcbaQlSC2Ng56CYNXHHNB+OTxY+F0HhRe5KACz7syZTT
   A==;
X-CSE-ConnectionGUID: GdRMBFvbQoCuTcAxK3V26A==
X-CSE-MsgGUID: lSpQuamOQ4uYVDy8IJT4yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="23860351"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; 
   d="scan'208";a="23860351"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 13:54:04 -0700
X-CSE-ConnectionGUID: 0RrAr485TE+BrZ4naiyZqA==
X-CSE-MsgGUID: r6S2WJi4QreO24EI1hMToA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; 
   d="scan'208";a="58415284"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 29 Jul 2024 13:54:02 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYXNX-000s40-2m;
	Mon, 29 Jul 2024 20:53:59 +0000
Date: Tue, 30 Jul 2024 04:53:42 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Nirmoy Das <nirmoy.das@intel.com>
Subject: [linux-next:master 653/1162] drivers/gpu/drm/xe/xe_sync.c:58:21-27:
 ERROR: application of sizeof to pointer
Message-ID: <202407300421.IBkAja96-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   931a3b3bccc96e7708c82b30b2b5fa82dfd04890
commit: 0fde907da2d5fd4da68845e96c6842497159c858 [653/1162] drm/xe: Validate user fence during creation
config: sh-randconfig-r051-20240729 (https://download.01.org/0day-ci/archive/20240730/202407300421.IBkAja96-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407300421.IBkAja96-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/xe/xe_sync.c:58:21-27: ERROR: application of sizeof to pointer

vim +58 drivers/gpu/drm/xe/xe_sync.c

    51	
    52	static struct xe_user_fence *user_fence_create(struct xe_device *xe, u64 addr,
    53						       u64 value)
    54	{
    55		struct xe_user_fence *ufence;
    56		u64 __user *ptr = u64_to_user_ptr(addr);
    57	
  > 58		if (!access_ok(ptr, sizeof(ptr)))
    59			return ERR_PTR(-EFAULT);
    60	
    61		ufence = kmalloc(sizeof(*ufence), GFP_KERNEL);
    62		if (!ufence)
    63			return ERR_PTR(-ENOMEM);
    64	
    65		ufence->xe = xe;
    66		kref_init(&ufence->refcount);
    67		ufence->addr = ptr;
    68		ufence->value = value;
    69		ufence->mm = current->mm;
    70		mmgrab(ufence->mm);
    71	
    72		return ufence;
    73	}
    74	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
