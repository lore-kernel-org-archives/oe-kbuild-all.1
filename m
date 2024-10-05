Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287F71B960
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 17:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728147983; cv=none; b=p1aQsmOh6sLMZvlWsodnOg2EBGA9ZSAEKWPkQc71edqcedkPerUqjv0BOtK9l+geZ4ugNR72Sem6+xpBLKRu6eB/OBDtXmHFRi2Z5AxYm3rCrcV1lucjToVqsC2KEQVM28OJPu6ZKaXUKbSacK90f+Gwc+isIlRg8JR6Xl+qz78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728147983; c=relaxed/simple;
	bh=s2VAVA6VebMNi5VtNED0c/DEtWyizt+XrbYP9NoEEr8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=miJ92hR5M1FeuRZ3/BBX2WeKbr9li2AtGkzc7E613XnbIgocfSzk7Y7G194AQIY1B0A9xiVHm2D2pg5ovAvlvj4n1FXyJF0FoSuGzm1qfVtv6R9zk+bM37G8jxmrEQMMTIi5YOODpaHy3HEVVDl9bemy3uAvjtAaHHyDLsvovOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=beNppIfG; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="beNppIfG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728147981; x=1759683981;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s2VAVA6VebMNi5VtNED0c/DEtWyizt+XrbYP9NoEEr8=;
  b=beNppIfG6OQGl02FYIuYtYxS+g/nzBOXRN7c5MKWPHIF01mscQF82T6r
   eTtd0sNaFkBT+sO350QlfX1EnzrhlcMk16wAVJhooiX0CDjGySF82Yc7Z
   S3ny/7xdvMKyaXYx8850I8FK3PatWrzG8KSynzKhl65dD38RsVUWpiShZ
   lht3SSFHEhISG2cmkZx/aYbuV4tQWqv/1fUPqPC/dbiUCjtIuNqX5o6J9
   ZdkK1uCn9Q2Z45vZmkDmds5yZiGguV1bdat5VCQYkuTgOMAZxnz0HpF44
   uE3n1Cu7BZRMpdlwljny6buizVHuTNm83tCBd9b5xiQ4q9FKdFlj/JCBE
   w==;
X-CSE-ConnectionGUID: Jus6XMJVR8WjSWyYI2Hw4Q==
X-CSE-MsgGUID: 9KqeLh8JTnWRhSHa8w65RQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11216"; a="49879093"
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; 
   d="scan'208";a="49879093"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 10:06:21 -0700
X-CSE-ConnectionGUID: tjeSGu5HQkmnzrDVNA+5cA==
X-CSE-MsgGUID: ctNemPhNSQCwKBHG/ZNjJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; 
   d="scan'208";a="75146423"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Oct 2024 10:06:19 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sx8ET-0003Bb-1t;
	Sat, 05 Oct 2024 17:06:17 +0000
Date: Sun, 6 Oct 2024 01:05:20 +0800
From: kernel test robot <lkp@intel.com>
To: Vasant Hegde <vasant.hegde@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>
Subject: [jgunthorpe:for-vasant 8/10] drivers/iommu/amd/iommu.c:2483:31:
 sparse: sparse: symbol 'identity_domain_ops' was not declared. Should it be
 static?
Message-ID: <202410060157.R815S5a2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux for-vasant
head:   8aa0df6ce0d35430baeac4ee5e0ea77f82cf2ead
commit: 2122a607c5f8675c9fe3bb16664b7419bd4aa877 [8/10] iommu/amd: Implement global identity domain
config: x86_64-randconfig-122-20241005 (https://download.01.org/0day-ci/archive/20241006/202410060157.R815S5a2-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241006/202410060157.R815S5a2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410060157.R815S5a2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iommu/amd/iommu.c:2483:31: sparse: sparse: symbol 'identity_domain_ops' was not declared. Should it be static?
   drivers/iommu/amd/iommu.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +/identity_domain_ops +2483 drivers/iommu/amd/iommu.c

  2482	
> 2483	const struct iommu_domain_ops identity_domain_ops = {
  2484		.attach_dev = amd_iommu_attach_device,
  2485	};
  2486	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
