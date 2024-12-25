Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9D414A4C7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Dec 2024 20:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735158121; cv=none; b=tpLIpUms7nrnZuw+AtHzIO8TX+hVnwqM5gRTt/eZ3opVmmeq+ABtwXS/ZIggMRKegRQ2r0HYRhjI+96QqbTrMQI7QF8v3WxmNORmoooOsrBIvvOOCbGdB61xTtXDmBRB7CiWAy9xaPdMJyyUQn3vQfQU1t9T+kHZcxW9lwPEHIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735158121; c=relaxed/simple;
	bh=0eA98sVCZ3xyoOTILSfUjCIh2J3nFnU/GSH35m32DO4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u5J7Cs1STWU5oEcQj4JtgS5M/RgvZhwUD7Zp6wsWgUV0dQG7VvekPQhgBPpYuZG1sleSRfp5xLklwM7rS9H7r93x1JgqnzouISXIrB4XAEI6c1d00F+D4uq14FPC6Wu2dAiUuzW3rPY99U6McWZcc3o9OLb/sTvoxyJj6dR5C1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fHDsuZ9Y; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fHDsuZ9Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735158119; x=1766694119;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0eA98sVCZ3xyoOTILSfUjCIh2J3nFnU/GSH35m32DO4=;
  b=fHDsuZ9Y1vR8kyBCK9eP8HVP5T6fos/VphNfYTA2+RBlaCdPht4JTy4e
   NS0GBvf+yXjrqz+FZPWiPwuPEyXJWZ/1I2AmFeXRm1GYlx92A7O06PKpu
   uGCY+MI3cmKY4/yeDErgK5lEJ3SC1eriLB3BVfpkaqyMl2dAJgzMaELa9
   ZyrNKJUIE2FXT6MisZePL52gUOezpYKNuF8SgXrdtGE5dU21+3xnAN0Ck
   jUFfLjD4BMcQ7LB28EFehucac9tqhlsIKNiPIqe3N4yTxBwfveYhRhm2x
   R4ddLTFC5YIZQ7+3GzmgbULb5AI3HJ2uxInX1q6xJgARfZ6r9hKvCd26k
   A==;
X-CSE-ConnectionGUID: eBJ73yxPRsSlffZmU0vFhw==
X-CSE-MsgGUID: 7RMo6zeJTM2NyUg0zaIzpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="46276610"
X-IronPort-AV: E=Sophos;i="6.12,264,1728975600"; 
   d="scan'208";a="46276610"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2024 12:21:59 -0800
X-CSE-ConnectionGUID: +sGCjkXPQVesTaFN8xCkRQ==
X-CSE-MsgGUID: VRQ0OQKsTw655D7XKCkfMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="130756511"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 25 Dec 2024 12:21:57 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQXtD-000286-18;
	Wed, 25 Dec 2024 20:21:55 +0000
Date: Thu, 26 Dec 2024 04:21:29 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Chinner <dchinner@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Chandan Babu R <chandanbabu@kernel.org>,
	"Darrick J. Wong" <djwong@kernel.org>
Subject: fs/xfs/libxfs/xfs_dir2.c:336:15-22: WARNING opportunity for kmemdup
Message-ID: <202412260425.O3CDUhIi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9b2ffa6148b1e4468d08f7e0e7e371c43cac9ffe
commit: f078d4ea827607867d42fb3b2ef907caf86ce49d xfs: convert kmem_alloc() to kmalloc()
date:   11 months ago
config: hexagon-randconfig-r064-20241225 (https://download.01.org/0day-ci/archive/20241226/202412260425.O3CDUhIi-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 9daf10ff8f29ba3a88a105aaa9d2379c21b77d35)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412260425.O3CDUhIi-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/libxfs/xfs_dir2.c:336:15-22: WARNING opportunity for kmemdup

vim +336 fs/xfs/libxfs/xfs_dir2.c

   319	
   320	/*
   321	 * If doing a CI lookup and case-insensitive match, dup actual name into
   322	 * args.value. Return EEXIST for success (ie. name found) or an error.
   323	 */
   324	int
   325	xfs_dir_cilookup_result(
   326		struct xfs_da_args *args,
   327		const unsigned char *name,
   328		int		len)
   329	{
   330		if (args->cmpresult == XFS_CMP_DIFFERENT)
   331			return -ENOENT;
   332		if (args->cmpresult != XFS_CMP_CASE ||
   333						!(args->op_flags & XFS_DA_OP_CILOOKUP))
   334			return -EEXIST;
   335	
 > 336		args->value = kmalloc(len, GFP_NOFS | __GFP_RETRY_MAYFAIL);
   337		if (!args->value)
   338			return -ENOMEM;
   339	
   340		memcpy(args->value, name, len);
   341		args->valuelen = len;
   342		return -EEXIST;
   343	}
   344	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
