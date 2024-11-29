Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8455D1E480
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Nov 2024 02:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732846550; cv=none; b=Qo74VdTuKCWSHGeLbhQ/lbQnh8fw8X/lClCkvl3qlaFhYOE91J2IIpusfPyadU1PiEy78SewSweRT6KKojn48acjXGxHHU0kTT2PS6acEmYmBnqV3J0w5Sofe0ab4a4esyBK7KQqbcMn4ErffZbwdzmQ5gILgHfn02PiAZlEWVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732846550; c=relaxed/simple;
	bh=LUAUmx/Ctcz1vCVooua7FD1Z7QlObYdNzJHu2NPtpq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K5VI96v2l7jXDBFfte/9GV+oL4UXgNRqGvk6uyZQjSUmJZLCiHp3Nds74TWovWq0h41K0lg1wbvsNFNwS7w7re3MGXQezRT6gf2X+rRwKmrKo+wpQgwL4gLHXjOLswV0ScQsNsLr53lkk1BY5JrEzc16uYNY4wWyMEbFc4Myjag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PKMGTL+M; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PKMGTL+M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732846548; x=1764382548;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LUAUmx/Ctcz1vCVooua7FD1Z7QlObYdNzJHu2NPtpq8=;
  b=PKMGTL+Mq9GxiZUzAjoRWdSvo/WdSWVQQlNg6W9Mp7yDIa7VzvDV5D+I
   fZvwCKmIUeeuOp/IsboMliJjunbnBYSxFUtEB1hPlHRk5GjOxDxBFUhfo
   ofm+tFDpI0uEMTb0cB4G0hTyLRjX48sCO4quw0FT+uWP9HD+Yl2CXKBzB
   W2ECPP1Mztilo+wOIdxY2urdeohdcbSaIiUzayT3F83ejpZLc5Sf7GuDx
   /YsGuX4f2WDuH/Gjh7sBcpMZKHgpmd9SgQV9enmZ8j60E18IslJn9f4br
   f2cYW6i9A8xi4QEebKrOfxo3PVOKnhho7GvXfOVcvdrhSkSE2qzPYspkz
   w==;
X-CSE-ConnectionGUID: 0cFkANazT9Gq4LffOBuSVQ==
X-CSE-MsgGUID: XWKHEmNySkyqpayzzxaU/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="43746650"
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="43746650"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 18:15:48 -0800
X-CSE-ConnectionGUID: OfJutdOsRmqT4WSF0hXMLQ==
X-CSE-MsgGUID: bEg+94yUTnKryxroX+SQhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="97413359"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 28 Nov 2024 18:15:47 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGqXo-000AF9-0S;
	Fri, 29 Nov 2024 02:15:44 +0000
Date: Fri, 29 Nov 2024 10:15:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 1/4] tee: add restricted memory allocation
Message-ID: <202411290951.HRF9OTmf-lkp@intel.com>
References: <20241128150927.1377981-2-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241128150927.1377981-2-jens.wiklander@linaro.org>

Hi Jens,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on next-20241128]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jens-Wiklander/tee-add-restricted-memory-allocation/20241128-231155
base:   linus/master
patch link:    https://lore.kernel.org/r/20241128150927.1377981-2-jens.wiklander%40linaro.org
patch subject: [PATCH v3 1/4] tee: add restricted memory allocation
config: x86_64-buildonly-randconfig-004-20241129 (https://download.01.org/0day-ci/archive/20241129/202411290951.HRF9OTmf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411290951.HRF9OTmf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411290951.HRF9OTmf-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-mgr-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-bridge-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-region-test.o
>> WARNING: modpost: module tee uses symbol dma_buf_export from namespace DMA_BUF, but does not import it.
>> WARNING: modpost: module tee uses symbol dma_buf_put from namespace DMA_BUF, but does not import it.
>> WARNING: modpost: module tee uses symbol dma_buf_fd from namespace DMA_BUF, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
