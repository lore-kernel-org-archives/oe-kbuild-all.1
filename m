Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCEB264F80
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 13:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739539762; cv=none; b=Z7zs9ovEiPn0+i3e/ayCujdq5Ky8MAJegP+lEF+87DROpm+qDcuvmXV0QTEiP1z9SuywEntu9dO+uj6oQpylE4PrApaRjicy7Ca2rllPU7z2i5APSz6ap0yHY3P6Ir4EZCwrsFj4VrVpbHYr90N5VvLM+hJv6mWEo6AcxzaI6i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739539762; c=relaxed/simple;
	bh=FCprMT+flCYUmdcbkL4MUknlrJIcMDRTpTe0w1hJmw4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z2tGnSpPfOF0preFH5M7ZoYXJYxIblj5hgSGhzHtC/jjue4sd1yvoHSAmnDxpTphtxxQChIZaalppBjNDv2/r0dss0/fZdHtOankHqlx4IxeLkznBH5SkBfqnu/+9rq0aLtUvrvh73NnFsyJm3xJ6cq3K/0Q3EptvSgFnLPScYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SmfpAABe; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SmfpAABe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739539760; x=1771075760;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FCprMT+flCYUmdcbkL4MUknlrJIcMDRTpTe0w1hJmw4=;
  b=SmfpAABefXnBL+oae3QPA0+vlUy2EfXs61gyHvqvJ/UZswAt5MzUqZQp
   cTGZPNUMafXMRiXFp52IZIXHqSxGY2v3kVIQSlTxkp+TUFEusgYh52Wn7
   QGZVm8R7U77/z6DMvlfbTRQu0muJtC0CNm52ts11WKcgV5D92DrCaC+SX
   /ZQQv9pCWUJ8ha7wUFGZ8YHMPRhkr3q5dPnwgGmrOWn0hQKNjeIYgm1tv
   LmK6FoukGfNBdp6Eebb9GhlYh2w9kwGCR9Rz96sq4SAAKiwt7YW4uz/7R
   2ClIZoFNlbpm1PPV/QmQnaU2b+GTBqZsuFxHRgCIUuYIf7SnKOFD6G0GT
   w==;
X-CSE-ConnectionGUID: YcXZTUXQRiKTWwirdbLE7Q==
X-CSE-MsgGUID: EcBsQGO2SvWUSTrgMO5rXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="40430941"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="40430941"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 05:29:17 -0800
X-CSE-ConnectionGUID: Qi1qDWG2TuqBP96OagFNaA==
X-CSE-MsgGUID: SkMbsKAERueSNBW84YoD7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="118489189"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 14 Feb 2025 05:29:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tivko-0019aa-2F;
	Fri, 14 Feb 2025 13:29:14 +0000
Date: Fri, 14 Feb 2025 21:28:37 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jens-wiklander-tee:testing/tuxbuild 6/13] ERROR: modpost:
 "cma_alloc" [drivers/tee/optee/optee.ko] undefined!
Message-ID: <202502142109.SzwDwLnb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   http://git.linaro.org/people/jens.wiklander/linux-tee testing/tuxbuild
head:   555b5836d9936d414184315fcb81a803ea138036
commit: 61bc951a3f61c1b82cfddf39a61674bc3eeae4a8 [6/13] optee: FF-A: dynamic restricted memory allocation
config: arm64-randconfig-002-20250214 (https://download.01.org/0day-ci/archive/20250214/202502142109.SzwDwLnb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250214/202502142109.SzwDwLnb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502142109.SzwDwLnb-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "cma_alloc" [drivers/tee/optee/optee.ko] undefined!
>> ERROR: modpost: "dma_contiguous_default_area" [drivers/tee/optee/optee.ko] undefined!
>> ERROR: modpost: "cma_release" [drivers/tee/optee/optee.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
