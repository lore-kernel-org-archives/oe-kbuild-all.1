Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06116170A0B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 May 2025 18:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747249027; cv=none; b=ITy/RRNgkvxQMe1LH/weut9injfPEfNAt5NT0li9Hy0oaa2Be+iG/VVwbo8llkqgnYYCfukT+HF8TOP9B83TKSZng3GPOOmZlXuiLqluHqtu4WtPQXIwgEU6B+wiowLeWT6uDGXjOm1b74/BxECU36VBSJVALFJQRZGxyNwYLdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747249027; c=relaxed/simple;
	bh=/DLHVyf6F9OHtMXbIiRyOTeMAtOaqksFlKI38h/75Ts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UswPqgMX0njGIF8Tpbx0chnD0SgQtQU/08IuDVLaqdgqbIczqdPnHp5v6Hh2WdiddVFdj/Dwowk7Qe0QS5QnjlvSeO19LrzjsZYaogVWcD8U7Ld23KCyq+FsJeHIuBvfB432Sz1Fu9zw42WjOYszs8URzTHajVtZXLasGUk0mA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JmFntgWD; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JmFntgWD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747249025; x=1778785025;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/DLHVyf6F9OHtMXbIiRyOTeMAtOaqksFlKI38h/75Ts=;
  b=JmFntgWDkQr02fkYwH/0Hv6ne5Z8VRlTNS1f5OYfbTucxqB1vMAFVbyg
   p2E6WibQnm0sJvUXyGDvgdBoKNvVA6BgjCudWFLkvf2BOvUu40CgGphHe
   /f3bfTeFXbMxd6zA4JXBC9qAETAa6Gq1pZrhZ2AFAfatF24Tps+K2ODc/
   ODYGmvBOLeqXpJUEhb/dOxy4ZJdd72VS0pGAAw9qN6hxLNhau7UW1rlXn
   6pIXWM7XibkbRQuY2Lo5FjeLJXfpDrXv4XKnwb6o9rreQP0wMNez8ovL/
   0iEBvxVwWA/jmnRJe9WTTY5TEyt/2SNnL+t2s88RxEG3MGAj431DHAAH1
   w==;
X-CSE-ConnectionGUID: AYJvXf98RdS3p0QYuNGtYw==
X-CSE-MsgGUID: FMyHBKz0TyaOw5S1vmBFqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="74564240"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="74564240"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 11:57:04 -0700
X-CSE-ConnectionGUID: y7Y1Fm9NTEy5ubserOvIIQ==
X-CSE-MsgGUID: IpBTgxktT7erCpx39UOWZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="138655338"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 May 2025 11:57:03 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFHHo-000HTT-2j;
	Wed, 14 May 2025 18:57:00 +0000
Date: Thu, 15 May 2025 02:56:27 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 3/4] ACPI: scan: Add support for RISC-V in
 acpi_iommu_configure_id()
Message-ID: <202505150246.yPBKQUrh-lkp@intel.com>
References: <20250514055723.1328557-4-sunilvl@ventanamicro.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514055723.1328557-4-sunilvl@ventanamicro.com>

Hi Sunil,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.15-rc6]
[cannot apply to rafael-pm/linux-next rafael-pm/bleeding-edge next-20250514]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sunil-V-L/ACPICA-actbl2-Add-definitions-for-RIMT/20250514-135910
base:   linus/master
patch link:    https://lore.kernel.org/r/20250514055723.1328557-4-sunilvl%40ventanamicro.com
patch subject: [PATCH 3/4] ACPI: scan: Add support for RISC-V in acpi_iommu_configure_id()
config: loongarch-randconfig-001-20250514 (https://download.01.org/0day-ci/archive/20250515/202505150246.yPBKQUrh-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505150246.yPBKQUrh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505150246.yPBKQUrh-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/acpi/scan.o: in function `acpi_dma_configure_id':
>> scan.c:(.text+0x1db0): undefined reference to `rimt_iommu_configure_id'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
