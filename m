Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352B92E2F09
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Sep 2025 14:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758983661; cv=none; b=Z5R/Ly9VLoF7vhjY7MdIOPlscCmykpucXQRJlt3umsWhzk+T+sogh2eUpofXVpQy+WtJKazk8OVhLcekHGMQubZXAIgtwVJCovYv12k8Nlm08bWDPegKWlbsor4m4UXvI4CCCqxy2pQBbfyd8aCejGdKrIz52EFJkBkmapCdIgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758983661; c=relaxed/simple;
	bh=ZmKQpEB08Mxzlcmb0UaDyY/0gQnGSP21LOGV/UEWZ8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NcQPVh8+wWvpeIWxMjWPwm52UkMuzcLEVIpoaXkyLN8ydP5T/M2AEG7DZTH6qXitYZf/3ARwc43ChlvVn+0TBUjeCdqeOFEg1kHDxuNIQRi502806Bq14mmsZ0ZOuKzYoDkNKdQnM8vjmruOeGQKyJAZCcegQ8wdB/Qk0wmyCWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ckJFizty; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ckJFizty"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758983659; x=1790519659;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZmKQpEB08Mxzlcmb0UaDyY/0gQnGSP21LOGV/UEWZ8I=;
  b=ckJFiztyRR/hPODAT7UWhhMNiT5I2EjpuTR77ps2fdSgpnLYshmiu5IY
   pprka5JWj24r+8OwL0N5Y94FhMWEgOD5Vq+rbEe2k6Q1QNJTVDx+EbNhQ
   w5GkKXsSmXz+0oIJuJeVf3V0n09ox34EHrixwI54LBDQwKwCmGj9MOh1W
   TvVwUcdSwyKCsmjY728UGExHLpuEEe6EzfeFKf75Ads6JJlUDI7IEUEeQ
   A3ssdiqCcoTWLP/Yghxt60YPy+S3KsFlLZazt5ExaRVSkJuXl0FWYmn7t
   GUL4EVKrKLJ+/j9hF0+JjNWdj8FsVaN5/aB5wbBVrv17E8vN4fkIkTzia
   A==;
X-CSE-ConnectionGUID: oMKljm1xS9GcHNw13FSMbA==
X-CSE-MsgGUID: PMsQxT73TYObITzPpzuO9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11566"; a="61182363"
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; 
   d="scan'208";a="61182363"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2025 07:34:17 -0700
X-CSE-ConnectionGUID: Cvp2keUjRg+pO+hAJsp4+Q==
X-CSE-MsgGUID: dcU+WiugSa+1tNRKTyxyZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; 
   d="scan'208";a="176972103"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 27 Sep 2025 07:34:16 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2W04-00077H-2g;
	Sat, 27 Sep 2025 14:34:12 +0000
Date: Sat, 27 Sep 2025 22:33:42 +0800
From: kernel test robot <lkp@intel.com>
To: adriana <adriana@arista.com>, jdelvare@suse.com,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Adriana Nicolae <adriana@arista.com>
Subject: Re: [PATCH 1/1] DMI: Scan for DMI tbale from DTS info
Message-ID: <202509272216.c9WBgv6U-lkp@intel.com>
References: <20250926155612.2737443-1-adriana@arista.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926155612.2737443-1-adriana@arista.com>

Hi adriana,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.17-rc7]
[also build test WARNING on linus/master next-20250926]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/adriana/DMI-Scan-for-DMI-tbale-from-DTS-info/20250926-235813
base:   v6.17-rc7
patch link:    https://lore.kernel.org/r/20250926155612.2737443-1-adriana%40arista.com
patch subject: [PATCH 1/1] DMI: Scan for DMI tbale from DTS info
config: i386-randconfig-061-20250927 (https://download.01.org/0day-ci/archive/20250927/202509272216.c9WBgv6U-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250927/202509272216.c9WBgv6U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509272216.c9WBgv6U-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/firmware/dmi_scan.c:704:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *p @@     got void * @@
   drivers/firmware/dmi_scan.c:704:19: sparse:     expected void [noderef] __iomem *p
   drivers/firmware/dmi_scan.c:704:19: sparse:     got void *
>> drivers/firmware/dmi_scan.c:709:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *addr @@     got void [noderef] __iomem *p @@
   drivers/firmware/dmi_scan.c:709:33: sparse:     expected void *addr
   drivers/firmware/dmi_scan.c:709:33: sparse:     got void [noderef] __iomem *p
   drivers/firmware/dmi_scan.c:721:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *p @@     got void * @@
   drivers/firmware/dmi_scan.c:721:19: sparse:     expected void [noderef] __iomem *p
   drivers/firmware/dmi_scan.c:721:19: sparse:     got void *
   drivers/firmware/dmi_scan.c:726:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *addr @@     got void [noderef] __iomem *p @@
   drivers/firmware/dmi_scan.c:726:33: sparse:     expected void *addr
   drivers/firmware/dmi_scan.c:726:33: sparse:     got void [noderef] __iomem *p
   drivers/firmware/dmi_scan.c:760:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char [noderef] __iomem *p @@     got void * @@
   drivers/firmware/dmi_scan.c:760:27: sparse:     expected char [noderef] __iomem *p
   drivers/firmware/dmi_scan.c:760:27: sparse:     got void *
   drivers/firmware/dmi_scan.c:764:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *addr @@     got char [noderef] __iomem *p @@
   drivers/firmware/dmi_scan.c:764:41: sparse:     expected void *addr
   drivers/firmware/dmi_scan.c:764:41: sparse:     got char [noderef] __iomem *p
   drivers/firmware/dmi_scan.c:778:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char [noderef] __iomem *p @@     got void * @@
   drivers/firmware/dmi_scan.c:778:19: sparse:     expected char [noderef] __iomem *p
   drivers/firmware/dmi_scan.c:778:19: sparse:     got void *
   drivers/firmware/dmi_scan.c:782:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *addr @@     got char [noderef] __iomem *p @@
   drivers/firmware/dmi_scan.c:782:33: sparse:     expected void *addr
   drivers/firmware/dmi_scan.c:782:33: sparse:     got char [noderef] __iomem *p
   drivers/firmware/dmi_scan.c:796:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char [noderef] __iomem *p @@     got void * @@
   drivers/firmware/dmi_scan.c:796:19: sparse:     expected char [noderef] __iomem *p
   drivers/firmware/dmi_scan.c:796:19: sparse:     got void *
   drivers/firmware/dmi_scan.c:809:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *addr @@     got char [noderef] __iomem *p @@
   drivers/firmware/dmi_scan.c:809:49: sparse:     expected void *addr
   drivers/firmware/dmi_scan.c:809:49: sparse:     got char [noderef] __iomem *p
   drivers/firmware/dmi_scan.c:827:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *addr @@     got char [noderef] __iomem *p @@
   drivers/firmware/dmi_scan.c:827:49: sparse:     expected void *addr
   drivers/firmware/dmi_scan.c:827:49: sparse:     got char [noderef] __iomem *p
   drivers/firmware/dmi_scan.c:832:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *addr @@     got char [noderef] __iomem *p @@
   drivers/firmware/dmi_scan.c:832:33: sparse:     expected void *addr
   drivers/firmware/dmi_scan.c:832:33: sparse:     got char [noderef] __iomem *p

vim +704 drivers/firmware/dmi_scan.c

   675	
   676	#if IS_ENABLED(CONFIG_OF)
   677	/**
   678	 * dmi_scan_from_dt - Find and parse DMI/SMBIOS tables from the Device Tree
   679	 *
   680	 * Checks if the bootloader has passed SMBIOS table addresses via the /chosen
   681	 * node in the Device Tree. This follows the standard kernel DT bindings and
   682	 * assumes a fixed 32-byte mapping for the entry point.
   683	 * Returns true if a valid table is found and successfully parsed.
   684	 */
   685	static bool __init dmi_scan_from_dt(void)
   686	{
   687		struct device_node *chosen;
   688		const __be64 *prop;
   689		char buf[32];
   690		void __iomem *p;
   691		bool dmi_available = false;
   692		u64 addr;
   693		int len;
   694	
   695		chosen = of_find_node_by_path("/chosen");
   696		if (!chosen)
   697			return false;
   698	
   699		/* SMBIOSv3 (64-bit entry point) has priority */
   700		prop = of_get_property(chosen, "linux,smbios3-table", &len);
   701		if (prop && len >= sizeof(u64)) {
   702			addr = be64_to_cpup(prop);
   703	
 > 704			p = dmi_early_remap(addr, 32);
   705			if (p == NULL)
   706				goto out;
   707	
   708			memcpy_fromio(buf, p, sizeof(buf));
 > 709			dmi_early_unmap(p, 32);
   710	
   711			if (!dmi_smbios3_present(buf)) {
   712				dmi_available = true;
   713				goto out;
   714			}
   715		}
   716	
   717		prop = of_get_property(chosen, "linux,smbios-table", &len);
   718		if (prop && len >= sizeof(u64)) {
   719			addr = be64_to_cpup(prop);
   720	
   721			p = dmi_early_remap(addr, 32);
   722			if (p == NULL)
   723				goto out;
   724	
   725			memcpy_fromio(buf, p, sizeof(buf));
   726			dmi_early_unmap(p, 32);
   727	
   728			if (!dmi_present(buf))
   729				dmi_available = true;
   730		}
   731	
   732	out:
   733		of_node_put(chosen);
   734		return dmi_available;
   735	}
   736	#else
   737	static bool __init dmi_scan_from_dt(void) { return false; }
   738	#endif /* IS_ENABLED(CONFIG_OF) */
   739	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
