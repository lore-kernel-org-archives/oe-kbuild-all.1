Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1A7266EE1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Feb 2025 21:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739308749; cv=none; b=CK/1hkQweCHkUAaxxNWn9QBQ9WqWuJDYwsDfaXwF5/q953FTXy9Ngnr3YAd+Y2ADCHPCDHxGqw8SGvllX0Rbw+LE35sImKoF/EBkb5nA+RufB1XwLq6E4gBwKeAVzsXaPGYA8dxd6ScXlJxnO/nVhT2LvZdMFBIWapy5bdtDErg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739308749; c=relaxed/simple;
	bh=hH11Ekx7qLbAovvBYKICnN+sYYDDd5UOIiQ5OrreElA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bh88khRiT8aBjYJb4a+07JUxBWd/c5NJglZ6rIzF3kxjh4qi1kWDslDgYZXQV67xNu5AOEvHy+noqnjjrvWsO329IY3ALqoHXx8f5HsoAyeUW528+eklsVsvx7t6r/4LjGRU2r+uchWibQYyRKkjyPEGxMVB7uf4rR7jqRs0dKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jwdsVhdm; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jwdsVhdm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739308747; x=1770844747;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hH11Ekx7qLbAovvBYKICnN+sYYDDd5UOIiQ5OrreElA=;
  b=jwdsVhdmctUhS69mcRYrodxkQLZQ3gMQXDU2nMjJRdclriv9bC/apfuK
   vJqmijvsoy7xHRek0sSFFWMt4Fu4dSJYLa9WYsbCiv5W693sQ+4edLsd3
   Nfs6E/Jcm8mC6MpPu3wdDJNPEMIsNoMh+FOr9u5YI+6h/bnjgHRC4iWzk
   BkrsaTLPi4xa+lrMHtPdS1o4NL6vZCnr2ycZ4rqp4hPIqassYqIzHIpUa
   mCHdYtghOIty2yiCYgAIxWwgyPR+EpxAKw36cyPEkjojQQ6zvPUaoDQNn
   KlZ98mcbwJWxoxu6us8KFCswDQTILb/T2QHQzsOTvNbI2wX0kwEAMe98S
   g==;
X-CSE-ConnectionGUID: FX7HKiyATk6p9l7vnQ0L6w==
X-CSE-MsgGUID: wYSJ5nwHQXm2TA+dgZUBvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="51340522"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="51340522"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 13:19:07 -0800
X-CSE-ConnectionGUID: uP8kxcVaQNSsMA70eVFQEw==
X-CSE-MsgGUID: W0cN8m9nTUml1oimGphYVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="117566594"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Feb 2025 13:19:06 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thxep-0014ih-0w;
	Tue, 11 Feb 2025 21:19:03 +0000
Date: Wed, 12 Feb 2025 05:18:41 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1365/1365]
 drivers/acpi/cppc_acpi.c:614:3-8: WARNING: NULL check before some freeing
 functions is not needed.
Message-ID: <202502120521.erdwl1NY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   6a6cc2b6b95dc80ae01221670e21a8059229a023
commit: b8815fbbe89b0d15fa3296c3e57d2197a92f5bc0 [1365/1365] ACPI: CPPC: Fix cppc_cpufreq_init failed in CPU Hotplug situation
config: x86_64-randconfig-102-20250103 (https://download.01.org/0day-ci/archive/20250212/202502120521.erdwl1NY-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502120521.erdwl1NY-lkp@intel.com/

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
