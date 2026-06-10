Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A5F390CAB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jun 2026 09:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781082670; cv=none; b=IkT2O7zf/OJuGw5DK8bJavK6BTZvnaKT8IjBY2iETTr1uZ5h9LZ2NWV1aMt093X9XvBq+57WJ78SXIyha4pmp0LRrZxG1FPsEfLQTActHIayldt64keNl3h7BwQiC7DYyPFsD6nxV+zWkbfVXeejq3rOdNa6RaIE1lEBYQ6dyLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781082670; c=relaxed/simple;
	bh=3TalKRV8qGeR9ZF1SFBBywHQi5ceRMnsRKs7R90NegE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eVUruQTYeinTRjc1x1GH1iWR2y0vE68wgdjHkXjlyQ8Z/E/yp61t8trX4eIXmcHdHsdH5RU0wWhJB8RJINj+1V3yRcBSwkcEpIiG82XsZoehVgDU1k66nIhuo7pGaPaYvvlmRn2b6cw457MINF6fQXuVo8JJhnNZQiGu3bHo+Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ssnj2hi4; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ssnj2hi4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781082669; x=1812618669;
  h=date:from:to:cc:subject:message-id;
  bh=3TalKRV8qGeR9ZF1SFBBywHQi5ceRMnsRKs7R90NegE=;
  b=Ssnj2hi4h5JWpxxss0du8GQcJjABV3Xsu2sSUhq0UnhuIFgmQrcy1/WI
   NH12rKTQ+bmZ3rKWOXgAUqN4muJHqShs8HcJxPXKUBHFnimX4/2fkxlrg
   Imi1K0imsId+agSWfvbOadIR3CLCjsPs+ibAGH7eBM48HQYwIw1dIJM50
   9EhAj+cgRGd9hTlgfZNjavcxEmWyHrLwJT4iQd0NlulbrwolAsZ28K450
   dDfqwTIOQkK4AXEWJ/8VWGQf43/R4y/bzRoBD/ebe4tD+Oi/vp0trn2yd
   vvhwkpXID/8FbpCsbDBFGd8hw7SfVio6U3YnUMXeBmKOMUWhY5fWR+SBM
   w==;
X-CSE-ConnectionGUID: 1OkqSM8dTKSuGDuNyCxfMQ==
X-CSE-MsgGUID: 9RlWvY5AQW22Eps/e7ab3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="92977173"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="92977173"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 02:11:09 -0700
X-CSE-ConnectionGUID: YdOQhLFfRgKLRx+sXifyzQ==
X-CSE-MsgGUID: LaSfSvLsQYivoq87cmnfsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="245261047"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 10 Jun 2026 02:11:07 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXExk-00000000LBq-1nkL;
	Wed, 10 Jun 2026 09:11:04 +0000
Date: Wed, 10 Jun 2026 17:10:07 +0800
From: kernel test robot <lkp@intel.com>
To: Nilay Shroff <nilay@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, Keith Busch <kbusch@kernel.org>
Subject: [linux-next:master 10410/12670]
 drivers/nvme/host/sysfs.c:397:25: sparse: sparse: symbol 'dev_attr_io_errors'
 was not declared. Should it be static?
Message-ID: <202606101721.YwMkLwpB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   49e02880ec0a8c378e811bc9d85da188d7c6204c
commit: 30ab37a128000600dcaae2b35d4a594e304dfe7e [10410/12670] nvme: export command error counters via sysfs
config: microblaze-randconfig-r131-20260610 (https://download.01.org/0day-ci/archive/20260610/202606101721.YwMkLwpB-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260610/202606101721.YwMkLwpB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606101721.YwMkLwpB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/nvme/host/sysfs.c:397:25: sparse: sparse: symbol 'dev_attr_io_errors' was not declared. Should it be static?
   drivers/nvme/host/sysfs.c:434:30: sparse: sparse: symbol 'nvme_ns_diag_attr_group' was not declared. Should it be static?
>> drivers/nvme/host/sysfs.c:1140:25: sparse: sparse: symbol 'dev_attr_adm_errors' was not declared. Should it be static?

vim +/dev_attr_io_errors +397 drivers/nvme/host/sysfs.c

   396	
 > 397	struct device_attribute dev_attr_io_errors =
   398		__ATTR(command_error_count, 0644,
   399			nvme_io_errors_show, nvme_io_errors_store);
   400	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
