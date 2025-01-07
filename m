Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7F3219ED
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jan 2025 11:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736247861; cv=none; b=PPBaNDdb4NDQe8Kpt55UPk8LnxHthofaDyDtvj5fAHeN9AXP//bS5mRdIvjHsu/DUzuN8Q3bf3jOoTEHVyvyb7HF74NO9vj9pfl9oFmN7lxchQXznzIV2cwVD+11ijgpsrDdsBL9afGQyXvCd0bQsVb1Bmj9SUJ61+bN1Q7Roc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736247861; c=relaxed/simple;
	bh=Uq3T4gTsDIFn5tLMrrei8yHaiCOijiZ5QFWDv6aaUmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=saAphTb/nqzeruU6vlMAvyshbmu+AqgmVOa8fy/flCHGyh+94DS8qZHvbpYcBTSIkm0vhjsHBjMsZNYg+c8Mlq9QI8kLHxGj4N7PlG/zRdsZrSWM4FBicNR2U4P/cCeZvKWLz1Dmpf59zWFo0LiOKqpOPsWiQNd+yrAXKVyTzN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L3zYInbH; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L3zYInbH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736247858; x=1767783858;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Uq3T4gTsDIFn5tLMrrei8yHaiCOijiZ5QFWDv6aaUmA=;
  b=L3zYInbHilTIRIurXN3X6m4CUJ7UVoBhyCq+Dfey4zFBquO5hdkc6JE0
   4lejCOJ/Rs+qIpSAJ3Qd/A/S11+Ut45/Yi0FwhhH+aTm0y2wIQwUuQxL0
   Ova/+RP4ZPjJyQEudkivtCtIaNeibfxC8Lqb7Psmz1EJzXiTcJ+rzrpj7
   NBsaTCZrFY88YJOcIjGoTm3QQs0brWPtQCQXwFv8WRpidklkB+d54O8AI
   BQPcXAGmw29jCTEnCg1U+ngpV52wjdASSYKLUVvxEJrFpaJq8QMhpRE9S
   Oh4bkA922RFLyCjdW8R2WJnur+sR+TeMMB28sYak5ctndQ+flgt6WSaJU
   Q==;
X-CSE-ConnectionGUID: ccSpnsclSTafiQtxgYztbA==
X-CSE-MsgGUID: 84EVMWr6QW67ZzNLEexXcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="47091936"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; 
   d="scan'208";a="47091936"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 03:04:17 -0800
X-CSE-ConnectionGUID: UFA9rXnaTyKjP8W7XBIcrQ==
X-CSE-MsgGUID: h5e7nyh+REq4q37ozfStDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; 
   d="scan'208";a="102816356"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Jan 2025 03:04:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tV7Nd-000EZv-3C;
	Tue, 07 Jan 2025 11:04:13 +0000
Date: Tue, 7 Jan 2025 19:03:33 +0800
From: kernel test robot <lkp@intel.com>
To: Wathsala Vithanage <wathsala.vithanage@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] PCI: Add generic netlink interface to TPH _DSM
Message-ID: <202501071830.yBofLC9n-lkp@intel.com>
References: <20250106163045.508959-3-wathsala.vithanage@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106163045.508959-3-wathsala.vithanage@arm.com>

Hi Wathsala,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on rafael-pm/bleeding-edge pci/next pci/for-linus linus/master v6.13-rc6 next-20250107]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wathsala-Vithanage/ACPI-Add-support-for-invoking-select-_DSM-methods-from-user-space/20250107-003201
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20250106163045.508959-3-wathsala.vithanage%40arm.com
patch subject: [RFC PATCH 2/2] PCI: Add generic netlink interface to TPH _DSM
config: loongarch-randconfig-002-20250107 (https://download.01.org/0day-ci/archive/20250107/202501071830.yBofLC9n-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250107/202501071830.yBofLC9n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501071830.yBofLC9n-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pci/tph.c: In function 'tph_invoke_dsm_genl_cb':
>> drivers/pci/tph.c:169:13: warning: variable 'cpu_uid' set but not used [-Wunused-but-set-variable]
     169 |         u32 cpu_uid;
         |             ^~~~~~~


vim +/cpu_uid +169 drivers/pci/tph.c

   163	
   164	static int tph_invoke_dsm_genl_cb(struct acpi_genl_dsm_id *in,
   165					  struct acpi_genl_dsm_id *out)
   166	{
   167		struct pci_dev *pdev, *pdev_rp;
   168		acpi_handle handle;
 > 169		u32 cpu_uid;
   170		int status = 0;
   171	
   172		struct tph_genl_dsm_info *arg = (struct tph_genl_dsm_info *)in;
   173		struct tph_genl_dsm_info *ret = (struct tph_genl_dsm_info *)out;
   174	
   175		/* Honor  notph and acpi kernel parameters */
   176		if (acpi_disabled || acpi_pci_disabled || pci_tph_disabled) {
   177			status = -EINVAL;
   178			goto out;
   179		}
   180	
   181		/*
   182		 * pkg_arg1 contains the kernel logical CPU id provided by the user,
   183		 * make sure it's a valid CPU id before passing it to down to firmware.
   184		 * pkg_arg2 is not use by tph_invoke_dsm, hence no validation is
   185		 * required.
   186		 */
   187		if (!(arg->info.arg.pkg_arg1 < nr_cpu_ids &&
   188		    cpu_present(arg->info.arg.pkg_arg1))) {
   189			status = -EINVAL;
   190			goto out;
   191		}
   192	
   193		cpu_uid = topology_core_id(arg->info.arg.pkg_arg1);
   194	
   195		ret->id.guid = pci_acpi_dsm_guid;
   196		ret->id.rev = 7;
   197		ret->id.func = TPH_ST_DSM_FUNC_INDEX;
   198	
   199		pdev = pci_get_domain_bus_and_slot(arg->info.arg.bus, arg->info.arg.dev,
   200						   arg->info.arg.devfn);
   201		if (!pdev) {
   202			status = -ENODEV;
   203			goto out;
   204		}
   205	
   206		pdev_rp = pcie_find_root_port(pdev);
   207		if (!pdev_rp || !pdev_rp->bus || !pdev_rp->bus->bridge) {
   208			status = -ENODEV;
   209			goto out;
   210		}
   211	
   212		handle = ACPI_HANDLE(pdev_rp->bus->bridge);
   213	
   214		if (tph_invoke_dsm(handle, arg->info.arg.pkg_arg1, &ret->info.ret.st) !=
   215				   AE_OK) {
   216			status = -EOPNOTSUPP;
   217			goto out;
   218		}
   219	out:
   220		ret->info.ret.status = status;
   221		return 0;
   222	}
   223	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
