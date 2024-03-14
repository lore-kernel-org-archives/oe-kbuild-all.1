Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708A77F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Mar 2024 05:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710393081; cv=none; b=Eu2o5KI+OFHcihEUdds3MVqMAoR2us6vrkaoUKRHngg5R82GcDPL0ux9/NTIWX4KXhZSI+8RDsM03bI38HaHmW4CxwXE4axsyzJ4zYHtVp44TGbX6A8n3q1UlbtsGkMI13Ltz+n0oYnen/UehRGrFFafNMBS3+gPHLsTqbO4AHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710393081; c=relaxed/simple;
	bh=I6kHyGsrtyOFl14zVHworSapinaP71YCE6q6E5d6oNs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kjuXBXRyApl2rNaM+3xJBSLP1ZQf0+CeOA1CAg8NQcchqyVcMH6JLVzfVOQUe7sV4O8QrR2QN/yb26vXHKpESqVORJUcyW2HYYo8mJAq02lyJGGIBSFkbc+83a9R3+Jnoph/IFA+ak0bam+qHJCWcwDxbZXsWwnUXOVtpVH2XHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LEuwDzgF; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LEuwDzgF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710393079; x=1741929079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I6kHyGsrtyOFl14zVHworSapinaP71YCE6q6E5d6oNs=;
  b=LEuwDzgFYvF2dQumH2exhqjWPwoILV1vUf23GOys6C4vj6HcKuWdmrvh
   I0ch0jhRJJD7L2ScnquCIWy9hCRwjO6PNn9oqR97+X5Sqyn/GWaT/+KT/
   aJ6wJwUHc43B+LTTOFQo+S+905vRg9rmbZMNi1bmVX/MaS6jY0bgiQqgT
   03q25FA0zxXNCZ4l3WwfdIaCmMTBM2f3oEassYjIqIGoNiggNBFyCySYO
   P93yrKZRkvpmCiQg3ThU1sB5V6fStzXBRkGM7uhZJCAS63Oxa5yPdpmSv
   pMNlUSHH9eiKGncqeYl6ruMBtv2Ae3akZsyE2KPXWhDC84iwAAe0Vi2SH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5318128"
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="5318128"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 22:11:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="12748087"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Mar 2024 22:11:18 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkdN5-000D7p-2E;
	Thu, 14 Mar 2024 05:11:15 +0000
Date: Thu, 14 Mar 2024 13:10:50 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-recvsend-bundle 12/15] kbuf.c:undefined
 reference to `io_uring_mmap_pages'
Message-ID: <202403141346.YSOyKPFF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-recvsend-bundle
head:   57fd6bfcfb482b2e57219118e3a9a2c0c95b0f45
commit: 45b3fdf7a56108a2aa0aa4787dbe4825ec3359f9 [12/15] io_uring: get rid of remap_pfn_range() for mapping rings/sqes
config: sh-allnoconfig (https://download.01.org/0day-ci/archive/20240314/202403141346.YSOyKPFF-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240314/202403141346.YSOyKPFF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403141346.YSOyKPFF-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: io_uring/kbuf.o: in function `io_pbuf_mmap':
>> kbuf.c:(.text+0x13fc): undefined reference to `io_uring_mmap_pages'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
