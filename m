Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C03E15957D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Aug 2024 11:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724844794; cv=none; b=O0TjJkey1qwspeh17C76Ys2sy3o3l1n+JMYC6KkvoiDKNVhywkj1ZgEsGE2+3MDnwyjL+OuMZ5LPlJwQ4hypb0SZIpCJxWB1mE5NV8epJQPaJoMMrxKRHiOtuMw00lAlOiMZbBO2uDmf/M4AYUrj8l6iM8yzgik+OHbHOokfZK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724844794; c=relaxed/simple;
	bh=HcJmqor3lpBy28BsD7nzjNR+MMag7sYFy8vdZcBwLxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YXcOHaUvx4VbkwzPQxQVt5DvQw+0avr3tVsL/trwBaFLZ5Y1G8PtPzsAOO3C5kruZFKYqvMjqM+7k8Nh33Lbf5d7K173Trrnmh5UNEItZ+mZXvXGOBofK2CneEyv4uH1POXMrrpeHrfOiqJ2EnQMrLIf8epL28r5PKFEA7vSum8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dP0x2K2i; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dP0x2K2i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724844792; x=1756380792;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HcJmqor3lpBy28BsD7nzjNR+MMag7sYFy8vdZcBwLxQ=;
  b=dP0x2K2iNAsY90WQzs35UjUf1a4bXl7JYNIdIxDwLObsyBSCPVMZVdCv
   VLRoD/wnG215seNDbrIABfHxlE105H4nN8kcOzS4txBZDsp3LG0sTuLAp
   oawRS2ugdox6dTHNyaTIR4vzAjg4VKj8XlSXPbSClT6qB9CjrzzKnGF66
   YBdKJ+xdHqYVmOzk1LfE5jKwCnnDXsIHyd9fEVfxRa3I4sCHQYJkjJ9Jp
   BjOo8cWnJZ9HrCyMkOwjmAlThFSnwSGSPUwe+gdKJ5IJMAMdIpRaGz0AY
   FqIcWo5vACLDHVqIZezw97hL/aGeosLsLrbOz9E1FbGEJ3AYYlUYdHd80
   A==;
X-CSE-ConnectionGUID: Ykx+uRvhQPy434Ur041joA==
X-CSE-MsgGUID: zrJhg1hSTh6UZ5v4BQJaPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="23173711"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="23173711"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 04:33:11 -0700
X-CSE-ConnectionGUID: vMebNDCzS3WSMsdbSzTDjg==
X-CSE-MsgGUID: t4/RQJONQbKPuZde4AiY8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="67555412"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 28 Aug 2024 04:33:10 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjGvE-000KtS-1N;
	Wed, 28 Aug 2024 11:33:08 +0000
Date: Wed, 28 Aug 2024 19:32:46 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 19041/23581] fs/f2fs/.tmp_gc.o:
 warning: objtool: do_garbage_collect()+0xe35: unreachable instruction
Message-ID: <202408281910.ImD8ZAp3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   46d28312ab3cc0cfe7e8dea2f41d22fe4ac35e67
commit: 584279e21249fcd4d9774a566420de500c90f472 [19041/23581] f2fs: fix to do sanity check on inode type during garbage collection
config: x86_64-buildonly-randconfig-004-20240825 (https://download.01.org/0day-ci/archive/20240828/202408281910.ImD8ZAp3-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240828/202408281910.ImD8ZAp3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408281910.ImD8ZAp3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/f2fs/gc.c:13:
   In file included from include/linux/backing-dev.h:15:
   In file included from include/linux/blkdev.h:16:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
>> fs/f2fs/.tmp_gc.o: warning: objtool: do_garbage_collect()+0xe35: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
