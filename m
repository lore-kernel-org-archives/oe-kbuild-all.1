Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4960C29CF4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 03:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731899455; cv=none; b=KcvbGUMBJJ7iVWSxH6Xhb1Zx0ATT187GDF2PXxFTJzpTOlkUzjJaBMe2bsBBcpozTTWo1QYqcqsly767U8auVa3uQwdU6JGe+lfmKkxKdF3E2BHhE5nsVhjVJbsn8Vu+Lkotfj+5+/gY3VCkZ5eRrX2mEy4Qaz5UYwYBFBJq8bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731899455; c=relaxed/simple;
	bh=uLVSDicGhXmWGhjlprt17Wa5A9Ck8KUlsNOqZyN3UzE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SXDd4PpoLQ+5Iw4AHCP/G6Y7WkNqGyFvMO79t4L/HBo8TqXxNLkotUoOvtbd3beBEeqL6UMUtfCsnFCa7Kp77qqmrHh6YlMm/vMOi/Sscdhg7cUSeOjbvSY3VdJ8aw7SS/EC4HKLttjYQphrzbyvNBdbOXspzqZN4RGTOsET1Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lxpVfWIW; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lxpVfWIW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731899453; x=1763435453;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uLVSDicGhXmWGhjlprt17Wa5A9Ck8KUlsNOqZyN3UzE=;
  b=lxpVfWIWn3D3CBBa6avilT9ROtSJq9yQeuCZ0zdCNzqsF9d1UOoRZuYP
   NcGO8zZDrf05vZtPtMEWvCazP/+8VtWLhpmpvhB2O3TzcJjFa0la9uKc0
   nDFmbCUvlNog6fqFERxVOHJLijbC45hcb8dYKOHPJ247npoR+8UwJvnIn
   wcLvdNy7+sOgLrhw47tXQCQjhqWe1j/KidkJtUxW3kEW202haVv5TYxY7
   tNSeZszN0uufmJctTZ7sGwdKr8nhpwqqquM0aeZuLmO1PJHBbVcrMC+EZ
   pxPyd4iTdaA8MlcgIILbBwd4/K+R+zhZcuRySdmmW8tIzUnFGnrQFEZqb
   w==;
X-CSE-ConnectionGUID: 9eDUz9/3S+qDuXeUL03Gfw==
X-CSE-MsgGUID: lG4VMO8ET82XiEkMqpLvYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="42913667"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="42913667"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 19:10:53 -0800
X-CSE-ConnectionGUID: Cc4M9cbGT4uBOWc5SJRhpw==
X-CSE-MsgGUID: ESdrv7lRR0mcz8f8SYrB1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="93932366"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Nov 2024 19:09:03 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCs8K-0002Ef-2C;
	Mon, 18 Nov 2024 03:09:00 +0000
Date: Mon, 18 Nov 2024 11:08:12 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?unknown-8bit?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/b4-sysfs-const-bin_attr-cb 111/120]
 drivers/scsi/ipr.c:9688:11: error: use of undeclared identifier
 'bin_attr_dump'; did you mean 'bin_attr_trace'?
Message-ID: <202411181100.cVPSuziS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/b4-sysfs-const-bin_attr-cb
head:   7a315c5c3a11f198244918c63efbc9205fc501a1
commit: e8fed0bb67c88ef43f708e0bfb819f69f5c9a1c2 [111/120] scsi/ipr macro
config: i386-randconfig-141-20241118 (https://download.01.org/0day-ci/archive/20241118/202411181100.cVPSuziS-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411181100.cVPSuziS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411181100.cVPSuziS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/scsi/ipr.c:52:
   In file included from include/linux/pci.h:1650:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/scsi/ipr.c:9688:11: error: use of undeclared identifier 'bin_attr_dump'; did you mean 'bin_attr_trace'?
    9688 |                               &bin_attr_dump);
         |                                ^~~~~~~~~~~~~
         |                                bin_attr_trace
   drivers/scsi/ipr.h:1698:71: note: expanded from macro 'ipr_remove_trace_file'
    1698 | #define ipr_remove_trace_file(kobj, attr) sysfs_remove_bin_file(kobj, attr)
         |                                                                       ^
   drivers/scsi/ipr.c:3386:8: note: 'bin_attr_trace' declared here
    3386 | static BIN_ATTR_RO(trace, 0);
         |        ^
   include/linux/sysfs.h:376:22: note: expanded from macro 'BIN_ATTR_RO'
     376 | struct bin_attribute bin_attr_##_name = __BIN_ATTR_RO(_name, _size)
         |                      ^
   <scratch space>:78:1: note: expanded from here
      78 | bin_attr_trace
         | ^
   drivers/scsi/ipr.c:9730:9: error: use of undeclared identifier 'bin_attr_dump'; did you mean 'bin_attr_trace'?
    9730 |                                    &bin_attr_dump);
         |                                     ^~~~~~~~~~~~~
         |                                     bin_attr_trace
   drivers/scsi/ipr.h:1697:71: note: expanded from macro 'ipr_create_trace_file'
    1697 | #define ipr_create_trace_file(kobj, attr) sysfs_create_bin_file(kobj, attr)
         |                                                                       ^
   drivers/scsi/ipr.c:3386:8: note: 'bin_attr_trace' declared here
    3386 | static BIN_ATTR_RO(trace, 0);
         |        ^
   include/linux/sysfs.h:376:22: note: expanded from macro 'BIN_ATTR_RO'
     376 | struct bin_attribute bin_attr_##_name = __BIN_ATTR_RO(_name, _size)
         |                      ^
   <scratch space>:78:1: note: expanded from here
      78 | bin_attr_trace
         | ^
   drivers/scsi/ipr.c:9745:6: error: use of undeclared identifier 'bin_attr_dump'; did you mean 'bin_attr_trace'?
    9745 |                                 &bin_attr_dump);
         |                                  ^~~~~~~~~~~~~
         |                                  bin_attr_trace
   drivers/scsi/ipr.h:1698:71: note: expanded from macro 'ipr_remove_trace_file'
    1698 | #define ipr_remove_trace_file(kobj, attr) sysfs_remove_bin_file(kobj, attr)
         |                                                                       ^
   drivers/scsi/ipr.c:3386:8: note: 'bin_attr_trace' declared here
    3386 | static BIN_ATTR_RO(trace, 0);
         |        ^
   include/linux/sysfs.h:376:22: note: expanded from macro 'BIN_ATTR_RO'
     376 | struct bin_attribute bin_attr_##_name = __BIN_ATTR_RO(_name, _size)
         |                      ^
   <scratch space>:78:1: note: expanded from here
      78 | bin_attr_trace
         | ^
   drivers/scsi/ipr.c:9758:12: error: use of undeclared identifier 'bin_attr_dump'; did you mean 'bin_attr_trace'?
    9758 |                                       &bin_attr_dump);
         |                                        ^~~~~~~~~~~~~
         |                                        bin_attr_trace
   drivers/scsi/ipr.h:1698:71: note: expanded from macro 'ipr_remove_trace_file'
    1698 | #define ipr_remove_trace_file(kobj, attr) sysfs_remove_bin_file(kobj, attr)
         |                                                                       ^
   drivers/scsi/ipr.c:3386:8: note: 'bin_attr_trace' declared here
    3386 | static BIN_ATTR_RO(trace, 0);
         |        ^
   include/linux/sysfs.h:376:22: note: expanded from macro 'BIN_ATTR_RO'
     376 | struct bin_attribute bin_attr_##_name = __BIN_ATTR_RO(_name, _size)
         |                      ^
   <scratch space>:78:1: note: expanded from here
      78 | bin_attr_trace
         | ^
   1 warning and 4 errors generated.


vim +9688 drivers/scsi/ipr.c

  9671	
  9672	/**
  9673	 * ipr_remove - IOA hot plug remove entry point
  9674	 * @pdev:	pci device struct
  9675	 *
  9676	 * Adapter hot plug remove entry point.
  9677	 *
  9678	 * Return value:
  9679	 * 	none
  9680	 **/
  9681	static void ipr_remove(struct pci_dev *pdev)
  9682	{
  9683		struct ipr_ioa_cfg *ioa_cfg = pci_get_drvdata(pdev);
  9684	
  9685		ENTER;
  9686	
  9687		ipr_remove_trace_file(&ioa_cfg->host->shost_dev.kobj,
> 9688				      &bin_attr_dump);
  9689		ipr_remove_dump_file(&ioa_cfg->host->shost_dev.kobj,
  9690				     &bin_attr_dump);
  9691		sysfs_remove_bin_file(&ioa_cfg->host->shost_dev.kobj,
  9692				&bin_attr_async_err_log);
  9693		scsi_remove_host(ioa_cfg->host);
  9694	
  9695		__ipr_remove(pdev);
  9696	
  9697		LEAVE;
  9698	}
  9699	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
