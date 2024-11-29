Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10E61A4AA1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Nov 2024 21:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732914420; cv=none; b=u4nsWsHrdTfUuxq60CHuB1VMAlpNoVtv8F8thv4wMP2/zALzskx93vbyYneINGGI6EgF8sWiIx84jBrkruY+DKgYjGrTHP9yvfqtrF9iLxst5JX9rwRT2dCK0w2ppNYNG6k9aCCEbKJlT98hQDbYj6wEEI3CtOA+LlmEnAPdRMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732914420; c=relaxed/simple;
	bh=KNG0fF7kHb67K3poJypspiJ6k0hHbpJD5se9XikRlWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KSmARXiogrv7DPzC2daCtUVUtGfDcoBF6WqQTSiVt2PsRpaAzOwdqcBcIjIfi8hN4efprHQ3U3XI34bT5z9Og1r3OmhgZtq5iQkaHgcEHBg2t5uh7F/onNDcsxc+QVDtbjxzU7FnPLAvlkPnXSPZ9ii2dRLBlnsRsm4qjWMy5rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hYWJrnuS; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hYWJrnuS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732914419; x=1764450419;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KNG0fF7kHb67K3poJypspiJ6k0hHbpJD5se9XikRlWc=;
  b=hYWJrnuSOVUx4RHAnao9qLmVeI33/9QPWB+l9zPz1vM25HR/5Tonu1/w
   Ci9BZIjyy/ZtSJx06/2gLwZOAmCoEw7RXOnkydqdnKK/zYXQhx3BOSwab
   o6hWrhNWWyvzapCYvQoUjBsoKlKbIKUT1oslABrQQMvbFX6yoGdNGuDAu
   yTEPMAL0Rc3WcbYpA2o9+TSKJF2m0pwS7h+yRzS00IBU/kJFmpyxJMwyX
   /DyCyrQIgPXO8wSptsAV5CnCAVOS4wN+Z1N6y4kF3OICHceebQCF8AgTf
   5tgJ/x816/k1nyBVIMQ8YnctQyRYR7IrCymRhpOU9dVGY6zL4EWVLhyQD
   A==;
X-CSE-ConnectionGUID: TXUBLySQRsOslwWLDbu8rA==
X-CSE-MsgGUID: 8EYf8MKWTdOPyTS0felhgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="36012866"
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; 
   d="scan'208";a="36012866"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 13:06:56 -0800
X-CSE-ConnectionGUID: IUqO8ZEbRTykY1960/vQ6g==
X-CSE-MsgGUID: /1sWLacUT9q2I+hnm1zdJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; 
   d="scan'208";a="92480813"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 Nov 2024 13:06:54 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tH8CR-0000hJ-0l;
	Fri, 29 Nov 2024 21:06:51 +0000
Date: Sat, 30 Nov 2024 05:05:54 +0800
From: kernel test robot <lkp@intel.com>
To: Anastasia Kovaleva <a.kovaleva@yadro.com>, martin.petersen@oracle.com,
	bootc@bootc.net, bostroesser@gmail.com, michael.christie@oracle.com
Cc: oe-kbuild-all@lists.linux.dev, linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org, linux@yadro.com
Subject: Re: [PATCH 08/10] target: core: Use extended logs where possible
Message-ID: <202411300419.umKHNg4I-lkp@intel.com>
References: <20241129153056.6985-9-a.kovaleva@yadro.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241129153056.6985-9-a.kovaleva@yadro.com>

Hi Anastasia,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mkp-scsi/for-next]
[also build test WARNING on linus/master next-20241128]
[cannot apply to v6.12]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anastasia-Kovaleva/target-core-Improve-SCSI-target-logs/20241129-234412
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
patch link:    https://lore.kernel.org/r/20241129153056.6985-9-a.kovaleva%40yadro.com
patch subject: [PATCH 08/10] target: core: Use extended logs where possible
config: arc-randconfig-001-20241130 (https://download.01.org/0day-ci/archive/20241130/202411300419.umKHNg4I-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241130/202411300419.umKHNg4I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411300419.umKHNg4I-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/target/target_core_pr.c:75:26: warning: 'pr_preempt_type_table_str' defined but not used [-Wunused-const-variable=]
      75 | static const char *const pr_preempt_type_table_str[] = {
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/target/target_core_pr.c:64:26: warning: 'pr_register_type_table_str' defined but not used [-Wunused-const-variable=]
      64 | static const char *const pr_register_type_table_str[] = {
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/pr_preempt_type_table_str +75 drivers/target/target_core_pr.c

    63	
  > 64	static const char *const pr_register_type_table_str[] = {
    65		"REGISTER",
    66		"REGISTER_AND_IGNORE_EXISTING_KEY",
    67		"REGISTER_AND_MOVE",
    68	};
    69	
    70	enum preempt_type {
    71		PREEMPT,
    72		PREEMPT_AND_ABORT,
    73	};
    74	
  > 75	static const char *const pr_preempt_type_table_str[] = {
    76		"PREEMPT",
    77		"PREEMPT_AND_ABORT",
    78	};
    79	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
