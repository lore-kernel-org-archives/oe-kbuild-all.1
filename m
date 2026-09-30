Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937FD44607B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 07:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790753390; cv=none; b=qqKmyV1+WTFSodmX3SputeOM4eByMsbw4LGUZ1/w3pmwmZq15d8VNFLgWRxnh0pwkgNqHrl7CuUSc31Ix66vxUYQLmgP9oP13ja8GY1+mA45LxYF5vT2yv93D7TwKk2g1KeNff5/SopP1tO0RoCDSErcmgGal7gkbHo2TszGWBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790753390; c=relaxed/simple;
	bh=aGXkhvesS4gMVaVyRwqCRGoFal7K1Tf4cUNRcAj887c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LLWql60b1/Mf97KmmFuybocGWsbNe+u08o/z/8kyaLU4UMuwmIhA7uhRggmw3oAGqtXCoUvpNgLqJEkdmTqxY8fwPzFJHGA9LZdZTW6JK6rNguyKioM4t+b2EpaKtP7WT98JRx+P2tfbPE42SignwjeCtazK0RzqxeHszM+qZF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VRT/AMkB; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VRT/AMkB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790753388; x=1822289388;
  h=date:from:to:cc:subject:message-id;
  bh=aGXkhvesS4gMVaVyRwqCRGoFal7K1Tf4cUNRcAj887c=;
  b=VRT/AMkBRVaWJNratjw/W2v9YRFFS8YZlsCdZYj2mogOWSzJrh5YAw6/
   3zhIV/dpuXqhXcPOvLlpG5A1qrD55Hz8kh2l7iDZf6QoIHReHOQPcIMdR
   kjaI9ZlO1DJgurcIFWba94UxCw1F/lFhg/11sOHDLmtWEOrqrcdRwZM67
   OGRM9bUxdAK0kIdTBKz6Zx0GUYwaHRNmaGNooHIVMPM2LVsm3NdMPNXlI
   Sa+0imcunjgMqz4WqjAoUmecFmMysIGG/6C0yy037bX+TL9tpyZ+MqQ8Y
   XPbB3ByAMnHsMd0qGx7YaWUCdJXyNUqK00fzTZNNgVf7UExB2xc2MtSr5
   Q==;
X-CSE-ConnectionGUID: OpYpu2cpRbuR+887AZTCiw==
X-CSE-MsgGUID: HdWNW154QqS8+Thu7Kn/iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90384137"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="90384137"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 00:29:47 -0700
X-CSE-ConnectionGUID: 37ddDZM4SyucgF3nOy5olw==
X-CSE-MsgGUID: JG1lDe0LSH+GxH72k4sxBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="301868961"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 30 Sep 2026 00:29:45 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBol4-000000001m7-0sHw;
	Wed, 30 Sep 2026 07:29:42 +0000
Date: Wed, 30 Sep 2026 09:29:03 +0200
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpirko-mlxsw:wip_attestation_pre_rfc_draft1 23/26]
 drivers/attestation/core/mr.c:57:1: error: static declaration of
 'attestation_mr_info_alloc' follows non-static declaration
Message-ID: <202609300905.9hycDcRI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw wip_attestation_pre_rfc_draft1
head:   a18af4e1b514bf11f88ca42d29b7b68f3b375378
commit: 1fbb59be0a8c4b5d5f56b10f397f6b085018733e [23/26] attestation: add core KUnit tests
config: arc-randconfig-r2101-20260930 (https://download.01.org/0day-ci/archive/20260930/202609300905.9hycDcRI-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609300905.9hycDcRI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609300905.9hycDcRI-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/attestation/core/core.c:247:1: warning: 'attestation_test_find_device' defined but not used [-Wunused-function]
    attestation_test_find_device(const struct ctlv_device *ctlvdev)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/attestation/core/mr.c:57:1: error: static declaration of 'attestation_mr_info_alloc' follows non-static declaration
    attestation_mr_info_alloc(const struct attestation_mr *mr)
    ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/attestation/core/mr.c:10:
   drivers/attestation/core/internal.h:150:1: note: previous declaration of 'attestation_mr_info_alloc' was here
    attestation_mr_info_alloc(const struct attestation_mr *mr);
    ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/attestation_mr_info_alloc +57 drivers/attestation/core/mr.c

7c3e9198f02658 Jiri Pirko 2026-09-29  54  
1fbb59be0a8c4b Jiri Pirko 2026-09-29  55  VISIBLE_IF_KUNIT
7c3e9198f02658 Jiri Pirko 2026-09-29  56  struct attestation_mr_log_entry_info *
7c3e9198f02658 Jiri Pirko 2026-09-29 @57  attestation_mr_info_alloc(const struct attestation_mr *mr)
7c3e9198f02658 Jiri Pirko 2026-09-29  58  {
7c3e9198f02658 Jiri Pirko 2026-09-29  59  	struct attestation_mr_log_entry_info *info;
7c3e9198f02658 Jiri Pirko 2026-09-29  60  	enum hash_algo *algorithms;
7c3e9198f02658 Jiri Pirko 2026-09-29  61  	char *name;
7c3e9198f02658 Jiri Pirko 2026-09-29  62  
1fbb59be0a8c4b Jiri Pirko 2026-09-29  63  	KUNIT_STATIC_STUB_REDIRECT(attestation_mr_info_alloc, mr);
1fbb59be0a8c4b Jiri Pirko 2026-09-29  64  
7c3e9198f02658 Jiri Pirko 2026-09-29  65  	info = kzalloc_obj(*info, GFP_KERNEL);
7c3e9198f02658 Jiri Pirko 2026-09-29  66  	if (!info)
7c3e9198f02658 Jiri Pirko 2026-09-29  67  		return ERR_PTR(-ENOMEM);
7c3e9198f02658 Jiri Pirko 2026-09-29  68  	name = kstrdup(mr->props->name, GFP_KERNEL);
7c3e9198f02658 Jiri Pirko 2026-09-29  69  	if (!name)
7c3e9198f02658 Jiri Pirko 2026-09-29  70  		goto err_info;
7c3e9198f02658 Jiri Pirko 2026-09-29  71  	algorithms = kmemdup_array(mr->props->algorithms,
7c3e9198f02658 Jiri Pirko 2026-09-29  72  				   mr->props->algorithms_count,
7c3e9198f02658 Jiri Pirko 2026-09-29  73  				   sizeof(*algorithms), GFP_KERNEL);
7c3e9198f02658 Jiri Pirko 2026-09-29  74  	if (!algorithms)
7c3e9198f02658 Jiri Pirko 2026-09-29  75  		goto err_name;
7c3e9198f02658 Jiri Pirko 2026-09-29  76  	info->entry.type = ATTESTATION_MR_LOG_ENTRY_INFO;
7c3e9198f02658 Jiri Pirko 2026-09-29  77  	info->entry.mr_id = mr->props->id;
7c3e9198f02658 Jiri Pirko 2026-09-29  78  	info->props = *mr->props;
7c3e9198f02658 Jiri Pirko 2026-09-29  79  	info->props.name = name;
7c3e9198f02658 Jiri Pirko 2026-09-29  80  	info->props.algorithms = algorithms;
7c3e9198f02658 Jiri Pirko 2026-09-29  81  	return info;
7c3e9198f02658 Jiri Pirko 2026-09-29  82  
7c3e9198f02658 Jiri Pirko 2026-09-29  83  err_name:
7c3e9198f02658 Jiri Pirko 2026-09-29  84  	kfree(name);
7c3e9198f02658 Jiri Pirko 2026-09-29  85  err_info:
7c3e9198f02658 Jiri Pirko 2026-09-29  86  	kfree(info);
7c3e9198f02658 Jiri Pirko 2026-09-29  87  	return ERR_PTR(-ENOMEM);
7c3e9198f02658 Jiri Pirko 2026-09-29  88  }
1fbb59be0a8c4b Jiri Pirko 2026-09-29  89  EXPORT_SYMBOL_IF_KUNIT(attestation_mr_info_alloc);
7c3e9198f02658 Jiri Pirko 2026-09-29  90  

:::::: The code at line 57 was first introduced by commit
:::::: 7c3e9198f02658988c2f0ea335cdfd75b93236e0 attestation: introduce the core framework

:::::: TO: Jiri Pirko <jiri@nvidia.com>
:::::: CC: Jiri Pirko <jiri@nvidia.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
