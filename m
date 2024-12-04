Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACA71FAC5B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 22:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733352947; cv=none; b=AoHipead3mC2MOhv66T4Mtgvr3mrtOPAe0cf5LrXain49MyTrKlFB2GV9/76xDBn1mdVXocO25CaPGU19BR+1RE4sJ8noTKKdiPsy7AWhrN2nqy1Wg8nT/ACLz7GlS6dt+mz8wpzGGTTDx8puFr1h4x0qhULkD08G2QNTqPAIZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733352947; c=relaxed/simple;
	bh=aGww9T9wZ8kG8b1KcIPaGEF9FCaUusb+/lfITlei+rk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IHFMT5nNRW0at0lfO3CpMp7Zi7gWJp7iruQL7NfIV449uAKfUAHYDxYvBDcxkqbFosfu4qacUi2RhrKhq/79Y+UhML/4eR7dVyta6q410lVc3ijeX2Z7EzaViNA746a0MLmfo38x5L6lMaX/7pc/zY7cbSdXMH91mz/qpWtcYKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kQINozSe; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kQINozSe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733352945; x=1764888945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aGww9T9wZ8kG8b1KcIPaGEF9FCaUusb+/lfITlei+rk=;
  b=kQINozSeVd++rT9UiLzihMZo8gCG1PFuHhd03fRHPbk/r7XVFQio5fzv
   fKgBLmpLi8VRUex3BzbqfFUUeB9kVDt0aGNeSUFhCLND+7oDQwXQWdYQk
   PvRlQ6DZp74Jkk0YfjEVHhZjAiIEj06Fy8+iNEUKJqKTJk7wflhgEB2VD
   nxM6iRqCrgUVSSPdmcJyiPxnp7l4BruaqbPvuaG5KAAikU/R5lrvkqblP
   elMP/DLrgI8O2wsYq58cWII/Br1btCZUgI/FsDOL6VQG3DSqHSnOTzFmN
   dd1dCrGHUGnzDrfEIockolj+LO0eTFj3U6P4y8nTnqajUbZ2Eam/02kZ7
   A==;
X-CSE-ConnectionGUID: 3vkiPU/hSuuuGA7Bzgf1nQ==
X-CSE-MsgGUID: 37TnEJUvSbWaFEgqz/VuVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33889751"
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="33889751"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 14:55:44 -0800
X-CSE-ConnectionGUID: EBDVMqFPQ7eqrJFjkHPIAg==
X-CSE-MsgGUID: DpfVyxqBRc6lnbGvB0QoBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="98720868"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 04 Dec 2024 14:55:43 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIyHV-0003ZX-0N;
	Wed, 04 Dec 2024 22:55:41 +0000
Date: Thu, 5 Dec 2024 06:55:31 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, hanliyang <hanliyang@hygon.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1590/1590]
 drivers/virt/coco/csv-guest/csv-guest.c:39:43: sparse: sparse: incorrect
 type in argument 2 (different address spaces)
Message-ID: <202412050642.ZbO2qNHp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a2c7a5a53b2787fa56e28a271e9d3894f70e8374
commit: be5ee944496f8e6f9b5d12ef9ce89ab7100fc84a [1590/1590] driver/virt/coco: Add HYGON CSV Guest dirver.
config: x86_64-randconfig-121 (https://download.01.org/0day-ci/archive/20241205/202412050642.ZbO2qNHp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412050642.ZbO2qNHp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412050642.ZbO2qNHp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/virt/coco/csv-guest/csv-guest.c:39:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got unsigned char [usertype] *[addressable] report_data @@
   drivers/virt/coco/csv-guest/csv-guest.c:39:43: sparse:     expected void const [noderef] __user *from
   drivers/virt/coco/csv-guest/csv-guest.c:39:43: sparse:     got unsigned char [usertype] *[addressable] report_data
>> drivers/virt/coco/csv-guest/csv-guest.c:49:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got unsigned char [usertype] *[addressable] report_data @@
   drivers/virt/coco/csv-guest/csv-guest.c:49:29: sparse:     expected void [noderef] __user *to
   drivers/virt/coco/csv-guest/csv-guest.c:49:29: sparse:     got unsigned char [usertype] *[addressable] report_data

vim +39 drivers/virt/coco/csv-guest/csv-guest.c

    19	
    20	static long csv_get_report(void __user *argp)
    21	{
    22		u8	*csv_report;
    23		long	ret;
    24		struct	csv_report_req req;
    25	
    26		if (copy_from_user(&req, argp, sizeof(struct csv_report_req)))
    27			return -EFAULT;
    28	
    29		if (req.len < CSV_REPORT_INPUT_DATA_LEN)
    30			return -EINVAL;
    31	
    32		csv_report = kzalloc(req.len, GFP_KERNEL);
    33		if (!csv_report) {
    34			ret = -ENOMEM;
    35			goto out;
    36		}
    37	
    38		/* Save user input data */
  > 39		if (copy_from_user(csv_report, req.report_data, CSV_REPORT_INPUT_DATA_LEN)) {
    40			ret = -EFAULT;
    41			goto out;
    42		}
    43	
    44		/* Generate CSV_REPORT using "KVM_HC_VM_ATTESTATION" VMMCALL */
    45		ret = kvm_hypercall2(KVM_HC_VM_ATTESTATION, __pa(csv_report), req.len);
    46		if (ret)
    47			goto out;
    48	
  > 49		if (copy_to_user(req.report_data, csv_report, req.len))
    50			ret = -EFAULT;
    51	
    52	out:
    53		kfree(csv_report);
    54		return ret;
    55	}
    56	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
