Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F30218A921
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Nov 2025 15:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764343860; cv=none; b=qsmxHRScapiP/Ks0Gqp7y+2l/w7gXyigLJmMPHNfqnzHKOFJp+OqXb9C3j/L4WpZ8qUvGVEnHUCz4BKzutPrvq0rKGOQOo1inmQ99HwPTQus73YR58wGxyU4baMCSOFht+RLHLK2DvKVmwJmkyok8e1Hjtvqc2NImw9dHmUbqos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764343860; c=relaxed/simple;
	bh=o8w0GcbOYYyktk9xrMJplWkhBlzAraaGogfnpqbyE8s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rjuz2QiQ2nE0RJxNu188cq/c2gbqANTeQbFAtalnRMTlHbJ0QtIf0l8CjWUPsZwIyY7aAbrDcTjEASv+Y4wYxWeMBC9PyT0VmYhS/5/Qx8SDxlXKSe8I3/l65GGd/dDBiVCiupRIl9U/IodqVqDcj/THdjCAdenKJwgM7Wzpen8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fy+mAf7r; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fy+mAf7r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764343859; x=1795879859;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o8w0GcbOYYyktk9xrMJplWkhBlzAraaGogfnpqbyE8s=;
  b=Fy+mAf7rFO/0yKX7nz8gjukE46mfZlxadD5Ay+KoisirEBY9TUMv2OmR
   Lrj8nDXkJ1KYp0V1edUrORhhi2epA4E6umyj4cMdFnLiQZHuwTpkliylG
   qqsdrkN+Pj+YC/GjxPyA7JxoHWwJJLCoNMlvPEu0M86fAQRgXae958ZU9
   dtTmdRXc6LPepJKlDrqz3Cfwo9fMOq4gWJCDjttlQUgOYB/PgFnZgL7dM
   mQlrLQMmx/rh+B2Dkvqs8XrnYkx2fQhyuO0ZEsljphrXixL3GRvRP/hQq
   tBL+yv/54l6Hj9J9xm19omrAWSf8wIajjQBkuaXrmbYaVNFZTwei8K2Kb
   A==;
X-CSE-ConnectionGUID: aJWdoO6eSu+Ibv0HFEahUQ==
X-CSE-MsgGUID: TksOnG5ZSr6AWp+q2lTgPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="69996117"
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; 
   d="scan'208";a="69996117"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 07:30:58 -0800
X-CSE-ConnectionGUID: fhQEEyA7R/OBi7212sTSpg==
X-CSE-MsgGUID: lQd5xwTWQYmrVCHMbWeWZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; 
   d="scan'208";a="193484347"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 28 Nov 2025 07:30:57 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vP0Qw-0000000024b-1HBC;
	Fri, 28 Nov 2025 15:30:54 +0000
Date: Fri, 28 Nov 2025 16:30:11 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jiaqi Cheng <chengjiaqi3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3406/3406] htmldocs:
 ./drivers/fwctl/ub/ub_common.h:43: warning: Function parameter or member
 'ioctl_fifo' not described in 'ubctl_dev'
Message-ID: <202511281644.oBrjsPKC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ae3faae9efa6dabe1e7613b5e5d3758ffaefb86a
commit: f632e7e84ac26e324f4c4a43bc72947d44590d1d [3406/3406] ub: ub_fwctl: add ub_fwctl driver-api documentation description
reproduce: (https://download.01.org/0day-ci/archive/20251128/202511281644.oBrjsPKC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511281644.oBrjsPKC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Error: Cannot open file ./include/linux/energy_model.h
   Error: Cannot open file ./include/linux/energy_model.h
   Error: Cannot open file ./include/linux/fprobe.h
   Error: Cannot open file ./include/linux/mutex.h
   Error: Cannot open file ./include/linux/mutex.h
>> ./drivers/fwctl/ub/ub_common.h:43: warning: Function parameter or member 'ioctl_fifo' not described in 'ubctl_dev'
>> ./drivers/fwctl/ub/ub_common.h:79: warning: Function parameter or member 'in_data' not described in 'ubctl_cmd'
>> ./drivers/fwctl/ub/ub_common.h:79: warning: Function parameter or member 'out_data' not described in 'ubctl_cmd'
   ./drivers/ub/ubfi/ubc.h:91: warning: Function parameter or member 'reserved' not described in 'ubrt_ubc_table'
   ./drivers/ub/ubfi/ubc.h:91: warning: Function parameter or member 'ubcs' not described in 'ubrt_ubc_table'
   ./drivers/ub/ubfi/ubc.h:60: warning: Function parameter or member 'reserved' not described in 'ubc_node'
   ./drivers/ub/ubfi/ubc.h:60: warning: Function parameter or member 'reserved2' not described in 'ubc_node'
   ./drivers/ub/ubfi/ubc.h:60: warning: Function parameter or member 'ubc_guid_low' not described in 'ubc_node'
   ./drivers/ub/ubfi/ubc.h:60: warning: Function parameter or member 'ubc_guid_high' not described in 'ubc_node'
   ./include/ub/ubus/ubus.h:387: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'ub_driver'
   Error: Cannot open file ./include/linux/mod_devicetable.h
>> ./include/uapi/fwctl/ub_fwctl.h:293: warning: expecting prototype for struct fwctl_pkt_in_enable. Prototype was for struct fwctl_pkt_in_port instead
>> ./include/uapi/fwctl/ub_fwctl.h:301: warning: expecting prototype for struct fwctl_pkt_in_enable. Prototype was for struct fwctl_pkt_in_index instead
>> ./include/uapi/fwctl/ub_fwctl.h:311: warning: expecting prototype for struct fwctl_pkt_in_enable. Prototype was for struct fwctl_pkt_in_ummuid_value instead
   Error: Cannot open file ./include/linux/fwctl.h
   ./include/uapi/linux/iommufd.h:615: warning: Enum value 'IOMMU_HW_CAP_PCI_PASID_EXEC' not described in enum 'iommufd_hw_capabilities'
   ./include/uapi/linux/iommufd.h:615: warning: Enum value 'IOMMU_HW_CAP_PCI_PASID_PRIV' not described in enum 'iommufd_hw_capabilities'
   ./include/uapi/linux/iommufd.h:615: warning: Excess enum value 'IOMMU_HW_CAP_PASID_EXEC' description in 'iommufd_hw_capabilities'
   ./include/uapi/linux/iommufd.h:615: warning: Excess enum value 'IOMMU_HW_CAP_PASID_PRIV' description in 'iommufd_hw_capabilities'
--
   Documentation/scsi/sssraid.rst:42: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 ./include/linux/fprobe.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/mutex.h' failed with return code 2
   Documentation/translations/zh_TW/dev-tools/index.rst:21: WARNING: toctree contains reference to nonexisting document 'translations/zh_TW/dev-tools/sparse' [toc.not_readable]
   Documentation/ub/index.rst:10: WARNING: toctree contains reference to nonexisting document 'ub/ummu-core' [toc.not_readable]
>> Documentation/ub/ub_fwctl/ub_fwctl.rst:85: WARNING: Title underline too short.
--
   Querying UB link and chip info by ub_fwctl
   ----------------------------------------- [docutils]
>> Documentation/ub/ub_fwctl/ub_fwctl.rst:85: WARNING: Title underline too short.


vim +43 ./drivers/fwctl/ub/ub_common.h

fe9e7907e911ee Jiaqi Cheng 2025-08-21  17  
aabc3d6533494e Jiaqi Cheng 2025-08-14  18  #define ubctl_err(ucdev, format, ...) \
aabc3d6533494e Jiaqi Cheng 2025-08-14  19  	dev_err(&ucdev->fwctl.dev, format, ##__VA_ARGS__)
aabc3d6533494e Jiaqi Cheng 2025-08-14  20  
aabc3d6533494e Jiaqi Cheng 2025-08-14  21  #define ubctl_dbg(ucdev, format, ...) \
aabc3d6533494e Jiaqi Cheng 2025-08-14  22  	dev_dbg(&ucdev->fwctl.dev, "PID %u: " format, current->pid, \
aabc3d6533494e Jiaqi Cheng 2025-08-14  23  		##__VA_ARGS__)
aabc3d6533494e Jiaqi Cheng 2025-08-14  24  
aabc3d6533494e Jiaqi Cheng 2025-08-14  25  #define ubctl_info(ucdev, format, ...) \
aabc3d6533494e Jiaqi Cheng 2025-08-14  26  	dev_info(&ucdev->fwctl.dev, "PID %u: " format, current->pid, \
aabc3d6533494e Jiaqi Cheng 2025-08-14  27  		##__VA_ARGS__)
aabc3d6533494e Jiaqi Cheng 2025-08-14  28  
59043edff2c8b6 Jiaqi Cheng 2025-08-21  29  #define UBCTL_GET_PHY_ADDR(high, low) ((((u64)(high)) << 32) | (low))
7ed154d74ca3de Jiaqi Cheng 2025-08-21  30  #define UBCTL_EXTRACT_BITS(value, start, end) \
7ed154d74ca3de Jiaqi Cheng 2025-08-21  31  	(((value) >> (start)) & ((1UL << ((end) - (start) + 1)) - 1))
59043edff2c8b6 Jiaqi Cheng 2025-08-21  32  
f632e7e84ac26e Jiaqi Cheng 2025-11-26  33  /**
f632e7e84ac26e Jiaqi Cheng 2025-11-26  34   * struct ubctl_dev - Device struct of framework
f632e7e84ac26e Jiaqi Cheng 2025-11-26  35   * @fwctl: The device of fwctl
f632e7e84ac26e Jiaqi Cheng 2025-11-26  36   * @data_size: Length of @data
f632e7e84ac26e Jiaqi Cheng 2025-11-26  37   * @adev: data transmitted to users
f632e7e84ac26e Jiaqi Cheng 2025-11-26  38   */
aabc3d6533494e Jiaqi Cheng 2025-08-14  39  struct ubctl_dev {
aabc3d6533494e Jiaqi Cheng 2025-08-14  40  	struct fwctl_device fwctl;
aabc3d6533494e Jiaqi Cheng 2025-08-14  41  	DECLARE_KFIFO_PTR(ioctl_fifo, unsigned long);
aabc3d6533494e Jiaqi Cheng 2025-08-14  42  	struct auxiliary_device *adev;
aabc3d6533494e Jiaqi Cheng 2025-08-14 @43  };
aabc3d6533494e Jiaqi Cheng 2025-08-14  44  
f632e7e84ac26e Jiaqi Cheng 2025-11-26  45  /**
f632e7e84ac26e Jiaqi Cheng 2025-11-26  46   * struct ubctl_query_cmd_param - Parameters of userspace RPC
f632e7e84ac26e Jiaqi Cheng 2025-11-26  47   * @in_len: Length of @in
f632e7e84ac26e Jiaqi Cheng 2025-11-26  48   * @in: Data of input
f632e7e84ac26e Jiaqi Cheng 2025-11-26  49   * @out_len: Length of @out
f632e7e84ac26e Jiaqi Cheng 2025-11-26  50   * @out: Data of output
f632e7e84ac26e Jiaqi Cheng 2025-11-26  51   *
f632e7e84ac26e Jiaqi Cheng 2025-11-26  52   * Used to receive parameters passed from userspace RPC
f632e7e84ac26e Jiaqi Cheng 2025-11-26  53   */
aabc3d6533494e Jiaqi Cheng 2025-08-14  54  struct ubctl_query_cmd_param {
aabc3d6533494e Jiaqi Cheng 2025-08-14  55  	size_t in_len;
aabc3d6533494e Jiaqi Cheng 2025-08-14  56  	struct fwctl_rpc_ub_in *in;
aabc3d6533494e Jiaqi Cheng 2025-08-14  57  	size_t out_len;
aabc3d6533494e Jiaqi Cheng 2025-08-14  58  	struct fwctl_rpc_ub_out *out;
aabc3d6533494e Jiaqi Cheng 2025-08-14  59  };
aabc3d6533494e Jiaqi Cheng 2025-08-14  60  
f632e7e84ac26e Jiaqi Cheng 2025-11-26  61  /**
f632e7e84ac26e Jiaqi Cheng 2025-11-26  62   * struct ubctl_cmd - Parameters of query command
f632e7e84ac26e Jiaqi Cheng 2025-11-26  63   * @op_code: The operation code
f632e7e84ac26e Jiaqi Cheng 2025-11-26  64   * @is_read: Read-only or read-write
f632e7e84ac26e Jiaqi Cheng 2025-11-26  65   * @in_len: Length of @in_data
f632e7e84ac26e Jiaqi Cheng 2025-11-26  66   * @out_len: Length of @out_data
f632e7e84ac26e Jiaqi Cheng 2025-11-26  67   * @in: Data of input
f632e7e84ac26e Jiaqi Cheng 2025-11-26  68   * @out: Data of output
f632e7e84ac26e Jiaqi Cheng 2025-11-26  69   *
f632e7e84ac26e Jiaqi Cheng 2025-11-26  70   * Used for sending and receiving software communication
f632e7e84ac26e Jiaqi Cheng 2025-11-26  71   */
aabc3d6533494e Jiaqi Cheng 2025-08-14  72  struct ubctl_cmd {
aabc3d6533494e Jiaqi Cheng 2025-08-14  73  	u32 op_code;
aabc3d6533494e Jiaqi Cheng 2025-08-14  74  	u32 is_read;
aabc3d6533494e Jiaqi Cheng 2025-08-14  75  	u32 in_len;
aabc3d6533494e Jiaqi Cheng 2025-08-14  76  	u32 out_len;
aabc3d6533494e Jiaqi Cheng 2025-08-14  77  	void *in_data;
aabc3d6533494e Jiaqi Cheng 2025-08-14  78  	void *out_data;
aabc3d6533494e Jiaqi Cheng 2025-08-14 @79  };
aabc3d6533494e Jiaqi Cheng 2025-08-14  80  

:::::: The code at line 43 was first introduced by commit
:::::: aabc3d6533494ed9a3ace44576d03572746f91cd ub: ub_fwctl: Add the ub_fwctl driver and its basic features.

:::::: TO: Jiaqi Cheng <chengjiaqi3@huawei.com>
:::::: CC: Jiaqi Cheng <chengjiaqi3@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
