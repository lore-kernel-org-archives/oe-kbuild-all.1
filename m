Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7F3224B06
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Apr 2025 11:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745582174; cv=none; b=GMnG4O/GkQigRoLUh5ftK6gs0Zdb+sEpw+cYawzoGICei/bLCsUuosR62X+hPXEbFvVPDqFeJgIK/rTeMqDDX7iLpzICTRPL0KCDjyhz0piSeyKCzt9anXXvZhkQ4MkffBopwXHCa2wPo6E6Xd+U1Cj02OVmRDGdxLr+9nvSaIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745582174; c=relaxed/simple;
	bh=lA3hzoPBORNOiIoShtaFF9hxb8Hu7bBlkottNaDDcmY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UhbdL+TDjTcSZJpURvw5bYAXw+h//oVq3ZYajSizw4DwUh4nt/BR6TD/eHsdsrrUf2OLKGqpwYKaz8w8lcVDjJGYuRoKRj0hmqchfFPYCyM97mxIEZtOdyvgWqihs6X6Qzu5At4Ffw8x234b/vH92SSUDKHMYvox0RgQOSABnow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jbvqNlSZ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jbvqNlSZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745582171; x=1777118171;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lA3hzoPBORNOiIoShtaFF9hxb8Hu7bBlkottNaDDcmY=;
  b=jbvqNlSZkeyk6Xy55upkdnuExy6QHl2B31iPaYCYdWX5Qh/icHsw9CV4
   bTvJJ3oCeLsYUXTqTvKe5RTuv3zmkoErDwF9XpmkORqnfU//rxaeRjOIp
   u/edwJ+FXK/LyeV2ZdjZZc/OOjxVirP+LVVzIgbFzKjY86MANOyXbEBvM
   K6mHGb6Id9CiLd8L4OBvFCdvU1tEqid/EQD2sdupQuIKeMe9NUjBS62Yw
   vskwqSW6NtSx+KK3k1rMavOOtz/wl8JGdlxlHk/DBTO4JLOx6pu+BWPPF
   CqKa8PR9k1s74XDAZf4LIS9uvaNEncaFlz2RfPX+w+zhNSV4O8EUuvjQ+
   g==;
X-CSE-ConnectionGUID: tsqfz6j7QcOAr7D+wO/yFg==
X-CSE-MsgGUID: FkxPZC1xQxOO5M0dLztBLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="51050957"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="51050957"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 04:56:11 -0700
X-CSE-ConnectionGUID: q6zv8uyxQcKlL6nvJaRcFg==
X-CSE-MsgGUID: 9F+ihN1KSD+BZQcbMPLSiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="137881061"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 25 Apr 2025 04:56:10 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8Hf5-00058Z-0f;
	Fri, 25 Apr 2025 11:56:07 +0000
Date: Fri, 25 Apr 2025 19:55:46 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1365/1365]
 drivers/acpi/cppc_acpi.c:614:3-8: WARNING: NULL check before some freeing
 functions is not needed.
Message-ID: <202504251932.cIMoMrVY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   08111f03f1ec65598372cfe9bf64f366d575671e
commit: b8815fbbe89b0d15fa3296c3e57d2197a92f5bc0 [1365/1365] ACPI: CPPC: Fix cppc_cpufreq_init failed in CPU Hotplug situation
config: x86_64-randconfig-102-20250103 (https://download.01.org/0day-ci/archive/20250425/202504251932.cIMoMrVY-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504251932.cIMoMrVY-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/acpi/cppc_acpi.c:614:3-8: WARNING: NULL check before some freeing functions is not needed.

vim +614 drivers/acpi/cppc_acpi.c

   576	
   577	int acpi_get_psd_map(struct cppc_cpudata **all_cpu_data)
   578	{
   579		struct cpc_desc **cpc_pptr, *cpc_ptr;
   580		int parsed_core_num = 0;
   581		int i, ret;
   582	
   583		cpc_pptr = kcalloc(num_possible_cpus(), sizeof(void *), GFP_KERNEL);
   584		if (!cpc_pptr)
   585			return -ENOMEM;
   586		for_each_possible_cpu(i) {
   587			cpc_pptr[i] = kzalloc(sizeof(struct cpc_desc), GFP_KERNEL);
   588			if (!cpc_pptr[i]) {
   589				ret = -ENOMEM;
   590				goto out;
   591			}
   592		}
   593	
   594		/*
   595		 * We can not use acpi_get_devices() to walk the processor devices
   596		 * because some processor device is not present.
   597		 */
   598		ret = acpi_walk_namespace(ACPI_TYPE_DEVICE, ACPI_ROOT_OBJECT,
   599					  ACPI_UINT32_MAX, acpi_parse_cpc, NULL,
   600					  cpc_pptr, (void **)&parsed_core_num);
   601		if (ret)
   602			goto out;
   603		if (parsed_core_num != num_possible_cpus()) {
   604			ret = -EINVAL;
   605			goto out;
   606		}
   607	
   608		ret = __acpi_get_psd_map(all_cpu_data, cpc_pptr);
   609	
   610	out:
   611		for_each_possible_cpu(i) {
   612			cpc_ptr = cpc_pptr[i];
   613			if (cpc_ptr)
 > 614				kfree(cpc_ptr);
   615		}
   616		kfree(cpc_pptr);
   617	
   618		return ret;
   619	}
   620	EXPORT_SYMBOL_GPL(acpi_get_psd_map);
   621	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
