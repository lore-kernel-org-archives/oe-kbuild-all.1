Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5375314B91
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 16:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765471254; cv=none; b=hwKsTlVGQEowEX5EqMmFUxzLJPL83ySOnQgFiIY2NHAQYsE3tZt0mYeVO5xty7FCeIwWb4qtYA7rW03s+0cHLrhqmpzt1GT8p/BQsYqTATrAHYvRXBtZK87m6+x9GRjiwXBHsnQiQEDHMmXwCR0b2qfnArCA2pKtckUG8CqwsMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765471254; c=relaxed/simple;
	bh=gKH9G2MGiOIJjB1tDnavoPQw5wvqG1/nbJeTDXxCsFc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DfRevv7xlWDipMBsB7IEsscvm1sV3oD9t2U7fcNEPp8MQGFd1vjzAeOD7mz/k3eapKURNAjONrAheWPYlYOCPIhqgmd/rQBjzttV9bUl5qPnWYq9wnVtZsqZwGyWnHi1XARZztcHop4xOkjrBXdjpagt/K86avTql41OfWkciuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lHcvFsPl; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lHcvFsPl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765471251; x=1797007251;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gKH9G2MGiOIJjB1tDnavoPQw5wvqG1/nbJeTDXxCsFc=;
  b=lHcvFsPlc/2xoN03UuEdnxlHrdXoCUMrSdkKcnjA7TOlGylkdbc81JQ3
   abwixNmI77RC4j0W1QLDS6jtkv0rorLWCkDCV0OWSPuOyasD2bM161rGk
   3YRlM5yJoui1rDROKFtmsTvrJhI9zB010VTTlYvl7e/Eh2w3Ub7XJq9zS
   Q++GPXl8z3OyzaxIjSDANlizteSfBR8PmfFNZbpfWxo/zW12p6fD3tWtr
   h4UF3zjcep7cc7WFFcLeGgf3mwNhbzS//H/83GiGpbrpUZgf+AoSr4Ex/
   WLe8FlADNbI55GKTW8NZRgZTCa7thUKWklMMF/s0oI23iZX9akd3znn1y
   A==;
X-CSE-ConnectionGUID: lTpCxScyREu8y/6X2E7z2g==
X-CSE-MsgGUID: etUhkt1QRGeLhl4WycTcTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67500154"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="67500154"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 08:40:51 -0800
X-CSE-ConnectionGUID: 3fnpWNJtSuartPzMAS1sIw==
X-CSE-MsgGUID: pGE7kjLuRmuj+ClXbkzBLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="196615743"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 11 Dec 2025 08:40:50 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTjih-00000000196-1QLW;
	Thu, 11 Dec 2025 16:40:47 +0000
Date: Thu, 11 Dec 2025 17:40:06 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Yejian <zhengyejian1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3534/3534] htmldocs:
 ./kernel/livepatch/core.c:2046: warning: bad line:
Message-ID: <202512111739.Q8ijhkEi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zheng,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   5930fa3740c518a9f6ba688fd0c1873d6f3adbce
commit: 29f85d3cff2dfa35ace94d3e4036d5ea456eb859 [3534/3534] livepatch: Add klp_module_delete_safety_check
reproduce: (https://download.01.org/0day-ci/archive/20251211/202512111739.Q8ijhkEi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111739.Q8ijhkEi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Error: Cannot open file ./include/linux/hid_bpf.h
   Error: Cannot open file ./include/linux/hid.h
   Error: Cannot open file ./include/linux/i2c-atr.h
   Error: Cannot open file ./include/linux/mutex.h
   Error: Cannot open file ./include/linux/mutex.h
>> ./kernel/livepatch/core.c:2046: warning: bad line:
   Error: Cannot open file ./include/linux/livepatch.h
   Error: Cannot open file ./include/linux/seqlock.h
   Error: Cannot open file ./include/linux/damon.h
   Error: Cannot open file ./include/linux/highmem.h
   Error: Cannot open file ./include/linux/highmem-internal.h


vim +2046 ./kernel/livepatch/core.c

  2033	
  2034	/**
  2035	 * klp_module_delete_safety_check() - safety check in livepatch scenario when delete a module
  2036	 * @mod:	Module to be deleted
  2037	 *
  2038	 * Module refcnt ensures that there is no rare case between enable_patch and delete_module:
  2039	 * 1. safety_check -> try_enable_patch -> try_release_module_ref:
  2040	 *    try_enable_patch would increase module refcnt, which cause try_release_module_ref fails.
  2041	 * 2. safety_check -> try_release_module_ref -> try_enable_patch:
  2042	 *    after release module ref, try_enable_patch would fail because try_module_get fails.
  2043	 * So the problem that release resources unsafely when enable livepatch after safety_check is
  2044	 * passed during module deletion does not exist, complex synchronization protection is not
  2045	 * required.
> 2046	
  2047	 * Return: 0 on success, otherwise error
  2048	 */
  2049	int klp_module_delete_safety_check(struct module *mod)
  2050	{
  2051		int ret;
  2052	
  2053		if (!mod || !is_livepatch_module(mod))
  2054			return 0;
  2055	
  2056		ret = stop_machine(arch_klp_module_check_calltrace, (void *)mod, NULL);
  2057		if (ret) {
  2058			pr_debug("failed to check klp module calltrace: %d\n", ret);
  2059			return ret;
  2060		}
  2061	
  2062		return 0;
  2063	}
  2064	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
