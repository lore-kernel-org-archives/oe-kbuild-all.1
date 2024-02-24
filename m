Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4AF029437
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Feb 2024 11:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708775397; cv=none; b=i4sAUYqV2xEEAcS4Dx3lj8w0/eEtcdaxLj0t6WPJ/eGn473rJ9/RL4OZCC8hSYyFExdJifN+eF5OpDViZeLk5xwiJO2EiAMFvRpkRPqQe+6Vbxl9kqVqzRaB6VHPTAlGUVlmpYcsL0WX226oPy89ACCsgD1p7hLoBYG9OTLU5Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708775397; c=relaxed/simple;
	bh=W40TL9CvCKWnCmFYu2hbY6rcDs5Q3oAKwTZ1bcUczSA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cG8p+CsmExKNtp7F7jJkjOLL1aLeGUQKhUI0yVp5SPPveRN9CouDn+e2a1bG0UWwrThVcwXqxD9GYHk7ljBphe1xwhutIhcXMyz99zj298dGtQ6Pxs8jhLsYhhUfRGbRgKy4eaORqgO8z/sDx/PMumyOzyULylPDH+NuJfkptfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IYsFQQCO; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IYsFQQCO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708775394; x=1740311394;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W40TL9CvCKWnCmFYu2hbY6rcDs5Q3oAKwTZ1bcUczSA=;
  b=IYsFQQCOSI5pQyern0Kh3Q34BIbQJfG1HQiibnzcCPc9mUStjfifKHox
   pj2oISfbCCPp6yWHJ9PIMqJ+hzg69NTV7eE/1SQJiJiPXFspTQI7OrpmP
   SeU2f1qWjI9dA7k/iOsc5P4dhKJ1jjI13Sd2wMERPF5KX4GpVu94I3Guv
   TeHcRuus6oa0iYZw9sVRrn17M3ol5aaeF3RVsYwIViLUx2iRfbThtbeXN
   /SWyYABGEb3lZAr7z0CgzvbK8Yb2nNyK7BDSwK8E2mLzkONoONBcR7iZE
   bfAq3ENdrwTec4YmKqZvIEOpwMtyfRWQAg74lw5VBZtFW31A5Q5qGUIT8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="3255373"
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="3255373"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2024 03:49:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="6543452"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 24 Feb 2024 03:49:53 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdqXO-0008VI-0w;
	Sat, 24 Feb 2024 11:49:50 +0000
Date: Sat, 24 Feb 2024 19:49:02 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zgzxx <zhangguangzhi3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3269/3388] security/integrity/ima/ima_fs.c:773:6:
 warning: variable 'ret' is used uninitialized whenever 'if' condition is
 true
Message-ID: <202402241932.aJqB4j0N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   0e6ac87df9e5122747ac5d9e7da9a45555f16374
commit: 0e45634e06109de7611c36f8d25c0ab35baa0624 [3269/3388] ima: Introduce new securityfs files
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240224/202402241932.aJqB4j0N-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402241932.aJqB4j0N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402241932.aJqB4j0N-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/integrity/ima/ima_fs.c:773:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     773 |         if (IS_ERR(digest_list_data_del))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/integrity/ima/ima_fs.c:791:9: note: uninitialized use occurs here
     791 |         return ret;
         |                ^~~
   security/integrity/ima/ima_fs.c:773:2: note: remove the 'if' if its condition is always false
     773 |         if (IS_ERR(digest_list_data_del))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     774 |                 goto out;
         |                 ~~~~~~~~
   security/integrity/ima/ima_fs.c:767:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     767 |         if (IS_ERR(digest_list_data))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   security/integrity/ima/ima_fs.c:791:9: note: uninitialized use occurs here
     791 |         return ret;
         |                ^~~
   security/integrity/ima/ima_fs.c:767:2: note: remove the 'if' if its condition is always false
     767 |         if (IS_ERR(digest_list_data))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     768 |                 goto out;
         |                 ~~~~~~~~
   security/integrity/ima/ima_fs.c:761:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     761 |         if (IS_ERR(digests_count))
         |             ^~~~~~~~~~~~~~~~~~~~~
   security/integrity/ima/ima_fs.c:791:9: note: uninitialized use occurs here
     791 |         return ret;
         |                ^~~
   security/integrity/ima/ima_fs.c:761:2: note: remove the 'if' if its condition is always false
     761 |         if (IS_ERR(digests_count))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
     762 |                 goto out;
         |                 ~~~~~~~~
   security/integrity/ima/ima_fs.c:690:9: note: initialize the variable 'ret' to silence this warning
     690 |         int ret;
         |                ^
         |                 = 0
   3 warnings generated.


vim +773 security/integrity/ima/ima_fs.c

   687	
   688	int __init ima_fs_init(void)
   689	{
   690		int ret;
   691	
   692		ima_dir = securityfs_create_dir("ima", integrity_dir);
   693		if (IS_ERR(ima_dir))
   694			return PTR_ERR(ima_dir);
   695	
   696		ima_symlink = securityfs_create_symlink("ima", NULL, "integrity/ima",
   697							NULL);
   698		if (IS_ERR(ima_symlink)) {
   699			ret = PTR_ERR(ima_symlink);
   700			goto out;
   701		}
   702	
   703		binary_runtime_measurements =
   704		    securityfs_create_file("binary_runtime_measurements",
   705					   S_IRUSR | S_IRGRP, ima_dir, NULL,
   706					   &ima_measurements_ops);
   707		if (IS_ERR(binary_runtime_measurements)) {
   708			ret = PTR_ERR(binary_runtime_measurements);
   709			goto out;
   710		}
   711	
   712		ascii_runtime_measurements =
   713		    securityfs_create_file("ascii_runtime_measurements",
   714					   S_IRUSR | S_IRGRP, ima_dir, NULL,
   715					   &ima_ascii_measurements_ops);
   716		if (IS_ERR(ascii_runtime_measurements)) {
   717			ret = PTR_ERR(ascii_runtime_measurements);
   718			goto out;
   719		}
   720	
   721		runtime_measurements_count =
   722		    securityfs_create_file("runtime_measurements_count",
   723					   S_IRUSR | S_IRGRP, ima_dir, NULL,
   724	#ifdef CONFIG_IMA_DIGEST_LIST
   725					   &ima_htable_value_ops);
   726	#else
   727					   &ima_measurements_count_ops);
   728	#endif
   729		if (IS_ERR(runtime_measurements_count)) {
   730			ret = PTR_ERR(runtime_measurements_count);
   731			goto out;
   732		}
   733	
   734		violations =
   735		    securityfs_create_file("violations", S_IRUSR | S_IRGRP,
   736	#ifdef CONFIG_IMA_DIGEST_LIST
   737					   ima_dir, NULL, &ima_htable_value_ops);
   738	#else
   739					   ima_dir, NULL, &ima_htable_violations_ops);
   740	#endif
   741		if (IS_ERR(violations)) {
   742			ret = PTR_ERR(violations);
   743			goto out;
   744		}
   745	
   746		ima_policy = securityfs_create_file("policy", POLICY_FILE_FLAGS,
   747						    ima_dir, NULL,
   748	#ifdef CONFIG_IMA_DIGEST_LIST
   749						    &ima_data_upload_ops);
   750	#else
   751						    &ima_measure_policy_ops);
   752	#endif
   753		if (IS_ERR(ima_policy)) {
   754			ret = PTR_ERR(ima_policy);
   755			goto out;
   756		}
   757	#ifdef CONFIG_IMA_DIGEST_LIST
   758		digests_count = securityfs_create_file("digests_count",
   759						       S_IRUSR | S_IRGRP, ima_dir,
   760						       NULL, &ima_htable_value_ops);
   761		if (IS_ERR(digests_count))
   762			goto out;
   763	
   764		digest_list_data = securityfs_create_file("digest_list_data", S_IWUSR,
   765							  ima_dir, NULL,
   766							  &ima_data_upload_ops);
   767		if (IS_ERR(digest_list_data))
   768			goto out;
   769	
   770		digest_list_data_del = securityfs_create_file("digest_list_data_del",
   771							      S_IWUSR, ima_dir, NULL,
   772							      &ima_data_upload_ops);
 > 773		if (IS_ERR(digest_list_data_del))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
