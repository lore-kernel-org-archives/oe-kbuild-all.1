Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF1941A8F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 03:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733716566; cv=none; b=gmQlZdjb8rWLyLUgmKvh5iFx4kQusLChoZzjIeWqXVA96ehcLviFrIImospyQX0KYs+Gx5WEqXEnxekEVTcN0r+6Z4FIyfMqfZp+qwthCBa0noSgv58LDg6oP8Gvh/wWd0awk3ocHy4iFJI5+KFNE1f9XIrNrd2WdWe8fRh6+XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733716566; c=relaxed/simple;
	bh=ucxWnCm4ox0jC+8irnf4tMggVKe4Ej6re5LPXGSUGlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OgfCW5Gj2skXUlIQdN93hbF3qqdXcOxlMMFsnuaTbMv9EN4bxcqJ14BqEM5LtCT2cFv703qq45Am9zfqcfDTYKJERkOZBpNTK2iSNJZRgB/UAy5ogYA63T6Af9reF2uugUuhaP33NLQYZb5CkyMNBFQtya0wY3XYvjreVd50ZsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F6mCpPYn; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F6mCpPYn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733716565; x=1765252565;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ucxWnCm4ox0jC+8irnf4tMggVKe4Ej6re5LPXGSUGlQ=;
  b=F6mCpPYntv49yu12yyHTwn+m4yiLFZXhDP1QNvmw8bfuIe5zzXVVkmSa
   xOAJkBSw1PJHTaPDp+AX/PkavYHBBKInYnBKXppu3HE23ZOcNh10RvXK/
   5OSDQm5nJK1f3WkgGJXWm/7xdzn2qr+ruLFy610lf0+BupANk7p+L2aw7
   ytE//0KYUyhVutcfi1aUIIZ7UO8cJjz56f8ZU6RwvJDrCl6RThPAzxOH7
   OdWAiXXjAWVEWL04u5bvO3CrrqcI5NRbM9j9q/oHHBhbSHWPPguIFGuxE
   qWrcqUukTk2AfFeG1ykL+zN7u19EyanTfYsWnZQetEZlnFzZwe09v4m3e
   w==;
X-CSE-ConnectionGUID: PxiJhZMIR7eCsSGDjJ/E1Q==
X-CSE-MsgGUID: XOOmHO0XTvuJR2bIcM3J8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="34234796"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="34234796"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 19:56:04 -0800
X-CSE-ConnectionGUID: QQZdwdBAT96aa3ZM2GXtyQ==
X-CSE-MsgGUID: HX4Z76VSTAiqA9QCg54O+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="95746065"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Dec 2024 19:56:03 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKUsK-0003lR-33;
	Mon, 09 Dec 2024 03:56:00 +0000
Date: Mon, 9 Dec 2024 11:55:27 +0800
From: kernel test robot <lkp@intel.com>
To: Andrey Ryabinin <arbn@yandex-team.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 5/7] kstate: Add mechanism to preserved specified
 memory pages across kexec.
Message-ID: <202412070900.xeyNt7Lg-lkp@intel.com>
References: <20241002160722.20025-6-arbn@yandex-team.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002160722.20025-6-arbn@yandex-team.com>

Hi Andrey,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on akpm-mm/mm-nonmm-unstable linus/master tip/x86/core v6.13-rc1]
[cannot apply to next-20241206]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrey-Ryabinin/kstate-Add-kstate-a-mechanism-to-migrate-some-kernel-state-across-kexec/20241206-032658
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20241002160722.20025-6-arbn%40yandex-team.com
patch subject: [RFC PATCH 5/7] kstate: Add mechanism to preserved specified memory pages across kexec.
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20241207/202412070900.xeyNt7Lg-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412070900.xeyNt7Lg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412070900.xeyNt7Lg-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: kernel/kstate.o: in function `kstate_page_save':
>> kstate.c:(.text+0xaac): undefined reference to `kstate_register_page'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
