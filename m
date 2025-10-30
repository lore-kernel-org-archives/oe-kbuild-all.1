Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECC436B972
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Oct 2025 18:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761850152; cv=none; b=mMlRsE0yRLmyRMnFHpKeIcmVyMf0/HYzcOYEipynau4DVbnAYh5OFnb89Tn1Dl3vgTz8oZL3+Q/ygGZcqevQHAA0s6wJ2DWttlPg6EE6CdgR3ZjOQT7FHV5QCT+OFs3PmNiLktnbU6v4Z1aO0LVV9CyjckTCYo2j0EowTqzmwqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761850152; c=relaxed/simple;
	bh=VCuPSyWJoXsUEfwokDYoj/SLJGyu2B621/T8dElvZlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NZ8qT4LhLoHkp9QHwzv92VsTF9poB06hQk4YVzSI5BSwrzU1dJ9fgCwv63TcSjzgBObYm41V8pSeB5Ah3Rppbp3+KHVp4hDJYGOyL/iFS+E8K+JxnL3JUxr5Q6kuQnPAIT3sM4W+g2hKDRNLwkf0+fuhoC/N1/Sq2HRGgwAropU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NCXmAJHK; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NCXmAJHK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761850151; x=1793386151;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VCuPSyWJoXsUEfwokDYoj/SLJGyu2B621/T8dElvZlY=;
  b=NCXmAJHKnyVMsI07Ya/VkDqyWeNGc7Cjtviwd8ANvzkORGjIJvJ7ABRg
   GUIkN44HwgzXetpamUILojSeZcsANvJ8Adfrr7wKuq9rn+5fBULud8UDr
   t9qSKfCdnmLXriGmRINeLxNThpuwns9zWzgAqh25z5RYWSbLBS2MSoT3N
   ClBToONjSPeqv+gZLIAVkn3hLpCIwBnhIKOMPNUqbe7VAXHkJMyCsVSme
   /fjA6y+2vYk1xYcevNBa50AVdtVHJLF7qnOUhWUyMidRrPTdrU1BAtWDh
   SRFOXy2JWV94uIHXwhU4BUr9YSFPPs56jrqdqzoyYCWZem0eiFFPzx7Ko
   A==;
X-CSE-ConnectionGUID: Zq145tFiRECj9iN5h09dSg==
X-CSE-MsgGUID: xX0tNl95SgutuLPj3FL/DQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63908444"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63908444"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 11:49:11 -0700
X-CSE-ConnectionGUID: 6ApZtlUSQLus/E7Ym+HZBQ==
X-CSE-MsgGUID: SMUMd3n/T3ivoE6UBpL9xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="223264628"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 30 Oct 2025 11:49:08 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEXhl-000MQ4-1G;
	Thu, 30 Oct 2025 18:49:02 +0000
Date: Fri, 31 Oct 2025 02:48:30 +0800
From: kernel test robot <lkp@intel.com>
To: Ranjan Kumar <ranjan.kumar@broadcom.com>, linux-scsi@vger.kernel.org,
	martin.petersen@oracle.com
Cc: oe-kbuild-all@lists.linux.dev, sathya.prakash@broadcom.com,
	sumit.saxena@broadcom.com, chandrakanth.patil@broadcom.com,
	prayas.patel@broadcom.com, Ranjan Kumar <ranjan.kumar@broadcom.com>
Subject: Re: [PATCH v1 1/5] mpt3sas: Added no_turs flag to device unblock
 logic
Message-ID: <202510310216.gerpzbxP-lkp@intel.com>
References: <20251029181058.39157-2-ranjan.kumar@broadcom.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029181058.39157-2-ranjan.kumar@broadcom.com>

Hi Ranjan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jejb-scsi/for-next]
[also build test WARNING on mkp-scsi/for-next linus/master v6.18-rc3 next-20251030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ranjan-Kumar/mpt3sas-Added-no_turs-flag-to-device-unblock-logic/20251030-025730
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git for-next
patch link:    https://lore.kernel.org/r/20251029181058.39157-2-ranjan.kumar%40broadcom.com
patch subject: [PATCH v1 1/5] mpt3sas: Added no_turs flag to device unblock logic
config: i386-randconfig-054-20251030 (https://download.01.org/0day-ci/archive/20251031/202510310216.gerpzbxP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251031/202510310216.gerpzbxP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510310216.gerpzbxP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/scsi/mpt3sas/mpt3sas_scsih.c:3832 function parameter 'no_turs' not described in '_scsih_ublock_io_all_device'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
