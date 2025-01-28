Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF66422619
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jan 2025 19:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738092744; cv=none; b=e1wJ8ZM/URrf+1H5MJc1XH6zFC6MsDISTPcmMdz0sCbJYMS8C0sFp61L9xQxcdKOOQ/EsEzLTUG0DLUVwXpuC0LOG7FyLT6wOLdybjiUx1dBHdd+eia+vk+JZl1c61j9wOY4QhYinJB5byFF0VME/7fLnahNeYvohEeyoFiqD/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738092744; c=relaxed/simple;
	bh=edINuiy7CT0R8dQGRoUhH5YcWjzBBqLGSEXHzw7tsWk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=utc9zknJOafwU2ud+BdOk/QnErWFd/RRYM9UfR5V91aV/rv2ef7IGufuB/1AWvZOaOZb7u4jtbHtMvdEm7IrOuAnvi+VTLf7QnwG2QcNzd8AtYOpxuPVyAI09BFdUHBa71xytrDY5A8m7h8L83/YwuCbuoMpxSIQxAZPghna//o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B4e63mYQ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B4e63mYQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738092741; x=1769628741;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=edINuiy7CT0R8dQGRoUhH5YcWjzBBqLGSEXHzw7tsWk=;
  b=B4e63mYQ050sFHujOqXt8HGRlI1r/g5grsxQC3G2pNeFgaHss5JjmL/u
   /1fV2xkX477MNJIsfwbPSEIymIOK7grcVHjb0W2+TgYOdb7AZtDYYUt3t
   LeL2+EY4JFFCxa+tUPwfdYMKEgbRtlx/BBV4o0Lj1rebkjoCtoT9Tbw9B
   BeUbcP/wVe2rjj4mVlU+HDBWhPnNLNrakgOeOfYW3oythDV1AMIT3zF/r
   6ItQ6NiX9voeeG9+jqEQgjiHDD3N3kGZlINXfv1Idq1D37ANKt6dirdpr
   OwTZTcOqW6jWZYtvu/dxOwxDiE857MXtD4iiY7/3+tkyd7kqxlttBTYlG
   Q==;
X-CSE-ConnectionGUID: IpDgd+hORRqzVzMOtGfy1Q==
X-CSE-MsgGUID: IkmjF3X2T/uUmYAw5M3eOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38293458"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; 
   d="scan'208";a="38293458"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 11:32:21 -0800
X-CSE-ConnectionGUID: Mw8yklpzQfabjuVCkhrMtw==
X-CSE-MsgGUID: a043+O+uStq00P41TGHZMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; 
   d="scan'208";a="108709676"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 Jan 2025 11:32:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcrJq-000i8D-0t;
	Tue, 28 Jan 2025 19:32:18 +0000
Date: Wed, 29 Jan 2025 03:31:43 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2720/2720] drivers/block/null_blk/main.o:
 warning: objtool: local_lock_release()+0x16c: unreachable instruction
Message-ID: <202501290314.CKmch30j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Damien,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   683824f7f33a10565e9afcc9358ed8004d851077
commit: 35959f33a5dde63a001111516adda66dbe7a7027 [2720/2720] null_blk: Move driver into its own directory
config: x86_64-buildonly-randconfig-006-20250124 (https://download.01.org/0day-ci/archive/20250129/202501290314.CKmch30j-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250129/202501290314.CKmch30j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501290314.CKmch30j-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/block/null_blk/main.o: warning: objtool: local_lock_release()+0x16c: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
