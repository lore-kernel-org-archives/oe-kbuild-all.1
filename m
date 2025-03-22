Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533DA2E338E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Mar 2025 00:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742603156; cv=none; b=iBqoJJYkSwVLJ8978u7orJnzpFbvjbaVLjO0deQM/W0j4orRWX8hRDsmRVZ4ty0nFPW25jCSz0n0listOdttZ5Qc5wD/VCQN1E2cLi7OPXHgfXgxtAisIL0hfI4oy59vfTqK6nuvYz3Ng/MpfmkXcEqmGBHIU0Fmyd0LaP7GTbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742603156; c=relaxed/simple;
	bh=zn4PopIyosCGXgcCWTqBcR1cWN+6+CgwuFKLAkkjSl4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c+1umMOuL4BpWAHqJeflif2Em/S59ulUIsmCeC09Q8VsGbN7Xh5raH7Yfl7RGEPONPBSldRqxevxS3hYtsRp9ydrxs2Oe20Hp8zw2OMrVaRvyG68dzOukxE0qoVQlhX325iMc8ahOQJxO6Y4GSQAZB6PpOvAx+ZLuKhUhHehImA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=elALPbs5; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="elALPbs5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742603155; x=1774139155;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zn4PopIyosCGXgcCWTqBcR1cWN+6+CgwuFKLAkkjSl4=;
  b=elALPbs5VjBTa3pfNKp63ME9j6k0dy/XPKw9gbx7eIIDqVzphmGited2
   rf/5679XD+QHrjCJSQBVycm/LfXXlSFwHG4CxDbxYKJ8BdurCTge1Mdy2
   l2lBlKPfCrM1LfwxSUSzSsEXzQBFo3kinL9t43Yul2E0qR7C5oWhB1q14
   QEBXdfI8Qo4KUAAbcrscwo1C4T77KcYGIygbQjSp7EAtgVGpakzjYHTZZ
   0RyKLGwpIuy06VCFcR3H3fj78hkuH+cVr4+452+05HJYRi2d6+rbnZIYd
   lZwLxKb5JGXkk8zTO1pjL2MlxpXUowbOPe7dOJVazaBgnlv1Eg2zSAtDA
   g==;
X-CSE-ConnectionGUID: tKY59LzISt2k2BXgWEsjjg==
X-CSE-MsgGUID: ueeIqxPrS+ywxlEdKIIj1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="54517783"
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="54517783"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 17:25:54 -0700
X-CSE-ConnectionGUID: AUkEPEGxTmGs1FKsh63Y/Q==
X-CSE-MsgGUID: uQUj1p0HTuqXcKSm3oGWnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="127686068"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 21 Mar 2025 17:25:54 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvmgR-0001nz-23;
	Sat, 22 Mar 2025 00:25:51 +0000
Date: Sat, 22 Mar 2025 08:22:52 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, liwei <liwei728@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2050/2050] kismet: WARNING: unmet direct
 dependencies detected for ACPI_HOTPLUG_IGNORE_OSC when selected by X86
Message-ID: <202503220823.mG13Rroz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f91bc9d0ae15025f6b0758053fb66480c3fec2ec
commit: 362f33cba6a04a09bcfc47ade55ace95e8a51c5b [2050/2050] ACPI: Add _OSC bits to advertise OS support for toggling CPU present/enabled
config: x86_64-kismet-CONFIG_ACPI_HOTPLUG_IGNORE_OSC-CONFIG_X86-0-0 (https://download.01.org/0day-ci/archive/20250322/202503220823.mG13Rroz-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250322/202503220823.mG13Rroz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503220823.mG13Rroz-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ACPI_HOTPLUG_IGNORE_OSC when selected by X86
   WARNING: unmet direct dependencies detected for ACPI_HOTPLUG_IGNORE_OSC
     Depends on [n]: ACPI [=y] && ACPI_HOTPLUG_PRESENT_CPU [=n]
     Selected by [y]:
     - X86 [=y] && ACPI [=y] && HOTPLUG_CPU [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
