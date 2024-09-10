Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7684F168C3F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 05:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725945216; cv=none; b=ltYf3BTFYw1KLZKscfjIpxkmIjHpXH/atBILVf2Pn3O1PfzqvXwfqtSPgX4gZ0/HYI9GODuArm22BmGKCeGObo5S7dMOoOxNKLDPVjEQnPwSiZT+de4e2Fy6LUen2q+hH+4MhjP8bxNgZmCGXpTY17gEEghVBOUnDW45qyPsY/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725945216; c=relaxed/simple;
	bh=SuuZllRm35ADvfaTLAuyMG97Is+OLQc+Q2WWo5c4Rp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MT3y1flxuL1UbnKgh2lvZAix/ygKe2e0uX2GwW2mDdtIi0u+FZ7B2M4/+ipzRgFzPQO5LWnagGSpc4l9IEUZHdU2NrvlPfOXodYz0yDYnmz1/mPI9nPwCdhlAyCqsY55vWK25/8ou4ig0Gz35PcVfz3Sl+lxpAqqmeEFz4UjuVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e1+raYm5; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e1+raYm5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725945215; x=1757481215;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SuuZllRm35ADvfaTLAuyMG97Is+OLQc+Q2WWo5c4Rp0=;
  b=e1+raYm5KTSdV7r0eo+DpkbENoolgvacY+AihjbwtdkzF3nQQhjykaS+
   x6loUG0VahgAadhvtCg6l5rwvX3y1EZ13JbW7qKozH/yVAq+vrdIPjBOL
   N4sqOypGNjZC5wg+ED11w9MXspPVeG/AFUcemg+K7AGrk4KC7Kjn8E0L4
   1PcTgRZzTGTdrBrzSXIRASr73ViqNLXTj3mCZjexzQTgxeFGxjHDHXTg9
   JY0frS0SpSUtNOqiQ5tL6fFDd6BO8Wu+RLTMwXDgdLSwXC3beEbB0bpzE
   +BuZUFcu5O/yw/Rc20I5TxdGr49EXmy3gLEhaPOuNtIt7szogwN7VAeON
   A==;
X-CSE-ConnectionGUID: 4k4+7kJ9Sca/y2XgO/o8bw==
X-CSE-MsgGUID: +ajrjLMPTlil48JsHTsSbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24814208"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="24814208"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 22:13:31 -0700
X-CSE-ConnectionGUID: tHw762XeQ7qFiwBUe0zozA==
X-CSE-MsgGUID: R0NOdDYlSSy3Go/mTses5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="66924553"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Sep 2024 22:13:29 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sntBu-00006B-2k;
	Tue, 10 Sep 2024 05:13:26 +0000
Date: Tue, 10 Sep 2024 13:12:27 +0800
From: kernel test robot <lkp@intel.com>
To: Cindy Lu <lulu@redhat.com>, jasowang@redhat.com, mst@redhat.com,
	michael.christie@oracle.com, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RESEND PATCH v1 1/7] vhost: Add a new module_param for enable
 kthread
Message-ID: <202409101256.eWKWH1mw-lkp@intel.com>
References: <20240909020138.1245873-2-lulu@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240909020138.1245873-2-lulu@redhat.com>

Hi Cindy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mst-vhost/linux-next]
[also build test WARNING on linus/master v6.11-rc7 next-20240909]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cindy-Lu/vhost-Add-kthread-support-in-function-vhost_worker_queue/20240909-110046
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git linux-next
patch link:    https://lore.kernel.org/r/20240909020138.1245873-2-lulu%40redhat.com
patch subject: [RESEND PATCH v1 1/7] vhost: Add a new module_param for enable kthread
config: x86_64-randconfig-123-20240910 (https://download.01.org/0day-ci/archive/20240910/202409101256.eWKWH1mw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409101256.eWKWH1mw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409101256.eWKWH1mw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/vhost/vhost.c:44:6: sparse: sparse: symbol 'enforce_kthread' was not declared. Should it be static?
   drivers/vhost/vhost.c:1898:54: sparse: sparse: self-comparison always evaluates to false
   drivers/vhost/vhost.c:1899:54: sparse: sparse: self-comparison always evaluates to false
   drivers/vhost/vhost.c:1900:55: sparse: sparse: self-comparison always evaluates to false
   drivers/vhost/vhost.c:2155:46: sparse: sparse: self-comparison always evaluates to false
   drivers/vhost/vhost.c:2235:48: sparse: sparse: self-comparison always evaluates to false

vim +/enforce_kthread +44 drivers/vhost/vhost.c

    35	
    36	static ushort max_mem_regions = 64;
    37	module_param(max_mem_regions, ushort, 0444);
    38	MODULE_PARM_DESC(max_mem_regions,
    39		"Maximum number of memory regions in memory map. (default: 64)");
    40	static int max_iotlb_entries = 2048;
    41	module_param(max_iotlb_entries, int, 0444);
    42	MODULE_PARM_DESC(max_iotlb_entries,
    43		"Maximum number of iotlb entries. (default: 2048)");
  > 44	bool enforce_kthread = true;
    45	module_param(enforce_kthread, bool, 0444);
    46	MODULE_PARM_DESC(enforce_kthread, "enable vhost to use kthread (default: Y)");
    47	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
