Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77BC28FD
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 02:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735870310; cv=none; b=RUU7iA76+hbMTzjet78ydX82oSnKAWedLtFqxHWu3vvtiBiQg28ok9ugB7V5Iav2JGTxYAgRVNbFFWNVHOl4E8ns0ARIYOdM5xfZ5bIdl4jdTuue/D8ZLW1RZYfEG5Xig+xSkvYCKw/YMNielKxuhrxN+Bt4fyawj3pzEv42BSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735870310; c=relaxed/simple;
	bh=kiGSriwFiLGeZxKeXvWF2Y527ET0lualB9INdQ+6Z8w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XwLoN52Husa6wIl8XvJKdQr+LfMlOPV5yb5j8RGWyxLBicjC7m5VHtWoO6sd6pKjzARFBUOY8IFTxDaY758sv5zppHMp3qpHYwfvB15ezdgiR/opWU5RAiEcHAkSxcR0rwuvsFgUEDyub6w88dgqa0Q6XPt2tGjX6vCwORD3TSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eMxugML/; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eMxugML/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735870309; x=1767406309;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kiGSriwFiLGeZxKeXvWF2Y527ET0lualB9INdQ+6Z8w=;
  b=eMxugML/3GlBw5zSknVZOyuzbdIvXqTcwU3TtNALB65Qg0MQe+Oh50m+
   NqZYGC0czQeLaXEyGv3Fq+0bpAA9y6+FDpuuAoWEywl+9kTofm0QzeRu2
   zwjoPWfwUv6V8E4sSgD6Abb8avENa9/2sbSRjLJmB8l5W2ECV5j8XLzJO
   FjQVqFqmICpWqQEfoF2RuVIjALdOptZkY/zqeng5bR29nCGLs6Lg0atZB
   X3wINeGWaZjgB0MFNL91KBmc7YLcXoGgsV/W4rvuPD9DjhlLE92h8Bw35
   +MkLzQVY8ev5wcpi/ztD/VqSrkJsV3U2rsQwC1SxHLIqggWerpcJ0JJrO
   A==;
X-CSE-ConnectionGUID: M+iH/nlGT8ubYZBGKE/6AQ==
X-CSE-MsgGUID: HmbJK6l2Qmynpj5lA2jkxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="46606584"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="46606584"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 18:11:48 -0800
X-CSE-ConnectionGUID: 6GuRW9IBRWGatSlfErNPxg==
X-CSE-MsgGUID: o1XGnzgqRqu3D/lJ8+zr5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="132520910"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 02 Jan 2025 18:11:48 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTXA9-00094b-0f;
	Fri, 03 Jan 2025 02:11:45 +0000
Date: Fri, 3 Jan 2025 10:11:02 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1365/1365]
 drivers/acpi/cppc_acpi.c:614:3-8: WARNING: NULL check before some freeing
 functions is not needed.
Message-ID: <202501030955.epvYv0Bn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   4c116febc8d53bc1f8f25a3d60db331f17ab8cd8
commit: b8815fbbe89b0d15fa3296c3e57d2197a92f5bc0 [1365/1365] ACPI: CPPC: Fix cppc_cpufreq_init failed in CPU Hotplug situation
config: x86_64-randconfig-102-20250103 (https://download.01.org/0day-ci/archive/20250103/202501030955.epvYv0Bn-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501030955.epvYv0Bn-lkp@intel.com/

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
