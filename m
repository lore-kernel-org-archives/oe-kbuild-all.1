Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7527020B22
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 03:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745896682; cv=none; b=TUYtgJp4IAxa7mI0fxq24+D/eVB+JsUoTuaJ1p1Z27K3s5XqQBEkoSv01YOBordP2tG7xKBmE92hp3uBDyyOr1p4OAns6byTJuAtfJBe6xQs3NPMgvS18lGmQN4TFmfQ0jGQx7m+bZJbgwAjSYUgYws4xcAf88W/5IKxtzU7Whk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745896682; c=relaxed/simple;
	bh=W6d9XtL6ohUnBZn62b/usxGoSPzOBz+p4K7Yy5J+pC4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RxCh8c+sIdUXQVZgeC48ozS3P/4SDfK57Fi3dGxIGFOajswe5lMfeXBMI3wAccih0Xpulrdr1JNbscpFujKxG5qhJf156cOEuLFJzGbMh/46Sxu4TVdWsulSj9ULQJbepKxnwNY1ERP87ndgzYgeaKybO16xgzW2RsSwTzRkitY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NQXahTUL; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NQXahTUL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745896680; x=1777432680;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W6d9XtL6ohUnBZn62b/usxGoSPzOBz+p4K7Yy5J+pC4=;
  b=NQXahTULez7kjCRnc+nUDsJgFgyeX6zE1Pbckrsp5/buYa82cx3KzkSa
   2zYvtZHSE1u+f+gDhcDOBb8QE+E0c24dZdtsd4B9xZGTg/PYzorTps/rK
   59RxM21zjcbLgM0ZiZuPENLzqrd38mZdxydeYzauT2rs2zSb/RM1Jsr2B
   YigIk8auBwlrAsAnyfXwGH1w8AJR8MQijprz9VD/kMRHaDULMk2df0cLp
   BN9rjqZn5jawK8m1kXR/MvONsN6keOwZ/tfySCV4UXdqon3gJ7p1Pbli1
   wRXMjXA999t9QVJfw93V58K+6xKiYrQMG5OmgvZcycvOSg520NNomOUUK
   A==;
X-CSE-ConnectionGUID: Sx2GzSZVRRaozSikRnAZCw==
X-CSE-MsgGUID: n2FUVx0LR/uBIL6n2ZLCtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="47518547"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="47518547"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 20:18:00 -0700
X-CSE-ConnectionGUID: /jOz7qLwRyCkUXWBxVAtSA==
X-CSE-MsgGUID: V0D4D7TlRiixIIwlhpS5PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="138880569"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 28 Apr 2025 20:17:59 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9bTo-0000RH-2Y;
	Tue, 29 Apr 2025 03:17:56 +0000
Date: Tue, 29 Apr 2025 11:17:56 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1365/1365]
 drivers/acpi/cppc_acpi.c:614:3-8: WARNING: NULL check before some freeing
 functions is not needed.
Message-ID: <202504291127.BVuV3Rjt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   7bd21c560a6f5df598200cc367cad1a683cef8ef
commit: b8815fbbe89b0d15fa3296c3e57d2197a92f5bc0 [1365/1365] ACPI: CPPC: Fix cppc_cpufreq_init failed in CPU Hotplug situation
config: x86_64-randconfig-102-20250103 (https://download.01.org/0day-ci/archive/20250429/202504291127.BVuV3Rjt-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504291127.BVuV3Rjt-lkp@intel.com/

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
