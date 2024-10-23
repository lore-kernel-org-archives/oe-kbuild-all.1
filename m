Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35C31A0737
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Oct 2024 10:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729678610; cv=none; b=bHKnGl4fDJQqYz3o5+K4oIUBBNqeypADGSop3Yrk1QDY9btPeRak4Zx/6dsOCC+V25ZeBBFszhorx9KsppN2Wm13a8rFloGcZupWAFkjChwXNZxFJJ/9JWvXymJLpG5nQ+hiTZME4fEZazIiB46rpkNbSs12b1j8DZuspH7VNnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729678610; c=relaxed/simple;
	bh=R9aS0gLZED0Uo8GKkDjhCh1f5MoVPc+I8iLCgFhXAjI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sJZ7J3nNYOqnV4v9+eh33LESOWL0IfJePjGM+DBbuBCSTzXRb9lRe5YuqNQJfxV0OUZIQb5c7/3AIdWlIwfVcKw50djws4Wc9AtJIeQF/Tk8krADGAnsit45t4BtKPqzwXNCWJRf4wCK6TeAx3DWsSQPFx944NBsmlbN6T/eTYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SJsy1jqK; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SJsy1jqK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729678609; x=1761214609;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R9aS0gLZED0Uo8GKkDjhCh1f5MoVPc+I8iLCgFhXAjI=;
  b=SJsy1jqKtbHjgsHJ7z/zjUrU8cgoqslHYiNV+8/DtFrd3zbiufxxX/GW
   Bg7gOUdqAqzuKl3AtGrVcGUmfPlcbO60qCs0LDqQMCZfxl/z+C0ib3EEw
   4CUPijjNMgsNjzMMt3/BlBtmv2IvBueVAZxQsL8U3eTXjy4gWw8k4TxFR
   Kao7t8cHIQGKE2ZuvkBW+qD/r+AxljRprRaC/6cesEkJFqywWbCEzp4lJ
   6vJqkZKoN84Vh3Kz7kFeDzrOzeDu4it7nL7wnjtKhX7JWuE8YfSTTmo5A
   xxMnVzmwKi1aWFwvW68c5ZCWD0m+UmHLUGe8ZQpEILqkLXK/x8NmN5qLT
   w==;
X-CSE-ConnectionGUID: +KGQty8pSYydK1oeDGZkWA==
X-CSE-MsgGUID: kNHU2UyWTOyj+UoBt5posA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29418147"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29418147"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 03:16:46 -0700
X-CSE-ConnectionGUID: Jve8UUBRSn2Qvtz22AStaQ==
X-CSE-MsgGUID: ha6Pl7eDTc6ah8qRpJd6bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="80229399"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 23 Oct 2024 03:16:44 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3YPy-000Umf-21;
	Wed, 23 Oct 2024 10:16:42 +0000
Date: Wed, 23 Oct 2024 18:16:31 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: oe-kbuild-all@lists.linux.dev, Paul Moore <paul@paul-moore.com>
Subject: [linux-next:master 6325/6433] powerpc64le-linux-ld:
 security/lsm_audit.o:undefined reference to `lockdown_reasons'
Message-ID: <202410231801.qfEAY6xl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ceab669fdf7b7510b4e4997b33d6f66e433a96db
commit: 762ebdee0cea1245e19ceb3d40e877532475b7b0 [6325/6433] lsm: Only build lsm_audit.c if CONFIG_AUDIT is set
config: powerpc-powernv_defconfig (https://download.01.org/0day-ci/archive/20241023/202410231801.qfEAY6xl-lkp@intel.com/config)
compiler: powerpc64le-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241023/202410231801.qfEAY6xl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410231801.qfEAY6xl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> powerpc64le-linux-ld: security/lsm_audit.o:(.toc+0x0): undefined reference to `lockdown_reasons'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
