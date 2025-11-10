Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A6C242D60
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Nov 2025 21:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762811266; cv=none; b=uqWAMnTRpfRGsYbHF3oxiIcdrNVQ+3CHy537/Ol1oU/jO9CzeeqFrmn1Zr58p3TDMaHB9Hcu8vnrtP4lExO6zV5lzHYu6qPDPruXM5klk4PQOG4bIWEHxPSoydM/Whli7GI/SCHC/zniyqLxxCPPdgweYprV9yw9LTc//1nBdjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762811266; c=relaxed/simple;
	bh=pRKku37Qvyk4KwLty6P7ysKjgWuWkBj3HfBsVhP64yQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HV11yaqtIqSU+99eASWTRXfBX03NY2pKO16GYqWgB+DQf25lrZo97PfOVr8Yx/SNuXp8F3Lxr7FQoa4VJQdharK5hlkQJXtwy1MnNLSsjvPFdEvIND0T+a7ZlZHe7jd5mTKj9M0mDDIRhVeCOCggIQpGv5BWJlViUn0/wtSLNfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V7N87QSY; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V7N87QSY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762811265; x=1794347265;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pRKku37Qvyk4KwLty6P7ysKjgWuWkBj3HfBsVhP64yQ=;
  b=V7N87QSYWiKQeXXs4PNnEdhe53X9kM/M+Z+SDV5rr4gU8hSMQRBuk8io
   zLoQVII8oR8RAGSWUnP27wJueDdJfGTcvJB61S3X6+BKm4d4ux9UtPKN9
   UMOp2qADgsVHEtPD6fGcc6BkMEdefdjc3iAB7SHpe21LMAcFmNbeQ8eLy
   ETVE0qU1TfoCVdDLXTQK/rhXBW1oL3F+EIgzgYb2Bv25KNUTjVwWa6e7R
   4/2TQbVo8Yz89L5258h3H0EC73Nm+/pAneIWA23BSFq1APGAOajWk5s7m
   0v+Y+ygryBvnI4HeSm2eJNudnzHaGwU+h53YHXTajGNIcnqxa1L69lcXt
   Q==;
X-CSE-ConnectionGUID: hNVwzvORRteiiEQ4gIHOIw==
X-CSE-MsgGUID: Em3+kORYTcihJ5aGBM4MYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64750642"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; 
   d="scan'208";a="64750642"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 13:47:44 -0800
X-CSE-ConnectionGUID: A0aQ8/M6RIGMNQq4EGrhow==
X-CSE-MsgGUID: lPacuhshSbe8h6aUpe9PKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; 
   d="scan'208";a="188738952"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Nov 2025 13:47:43 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIZjg-00013p-2m;
	Mon, 10 Nov 2025 21:47:40 +0000
Date: Tue, 11 Nov 2025 05:46:44 +0800
From: kernel test robot <lkp@intel.com>
To: Linu Cherian <lcherian@marvell.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Anil Kumar Reddy <areddy3@marvell.com>,
	Tanmay Jagdale <tanmay@marvell.com>
Subject: drivers/hwtracing/coresight/coresight-tmc-core.c:403:5-8: Unneeded
 variable: "ret". Return "0" on line 416
Message-ID: <202511110556.RDLHL0DU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4ea7c1717f3f2344f7a1cdab4f5875cfa89c87a9
commit: d58a70bdab575264fe75e4826464aaef0dd096b4 coresight: tmc: Add support for reading crash data
date:   9 months ago
config: arm64-randconfig-r052-20251110 (https://download.01.org/0day-ci/archive/20251111/202511110556.RDLHL0DU-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0d786b9a207aa0e6d88dde7fd9ffe0b364db69a4)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511110556.RDLHL0DU-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/hwtracing/coresight/coresight-tmc-core.c:403:5-8: Unneeded variable: "ret". Return "0" on line 416

vim +403 drivers/hwtracing/coresight/coresight-tmc-core.c

   400	
   401	static int tmc_crashdata_release(struct inode *inode, struct file *file)
   402	{
 > 403		int ret = 0;
   404		unsigned long flags;
   405		struct tmc_resrv_buf *rbuf;
   406		struct tmc_drvdata *drvdata = container_of(file->private_data,
   407							   struct tmc_drvdata,
   408							   crashdev);
   409	
   410		rbuf = &drvdata->resrv_buf;
   411		spin_lock_irqsave(&drvdata->spinlock, flags);
   412		rbuf->reading = false;
   413		spin_unlock_irqrestore(&drvdata->spinlock, flags);
   414	
   415		dev_dbg(&drvdata->csdev->dev, "%s: released\n", __func__);
 > 416		return ret;
   417	}
   418	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
