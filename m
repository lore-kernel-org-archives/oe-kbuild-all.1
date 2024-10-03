Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9DA19F401
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Oct 2024 17:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727977549; cv=none; b=XAOa6gBbktwyHqKuDhZFST95M+hBAmfGpikQH8OawoHJTiyv24pxv1AncQ0fHWJvOqoLm4HeiFxB3GaSrNKs37ZmIO2iRPQ0ZryNwP0wxgkzT5/L/ntA8evmy0jxzXfzM5Jcfev59Izi8r4jftTapXb+P8Usr/09sXDMvcFjKrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727977549; c=relaxed/simple;
	bh=SFS7JZp0BmNkhHmTr6vu7GWFf0NCcOShFpTJxzQdDgE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ol4H7nV9450UWNcfSYrq1o61xKSqoCf9H8xW51fsaVXVvT1yo11LAHZkGz4v0QkWtegveVKuAWMwu0wNX8l3flhWozHInQPvylzmtYVfk/bfsUtFYl6RpcACmjH9xwKmb6ZUUHW8YBKn9WbLqtDvEKkrdCbsmjmHWZgFqJMxs6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PxwGDHB8; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PxwGDHB8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727977547; x=1759513547;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SFS7JZp0BmNkhHmTr6vu7GWFf0NCcOShFpTJxzQdDgE=;
  b=PxwGDHB8Fh3eDkU1cyZ8qWR8G38ZbEnT+74lXLKZjDbPUZfOEXTysEnC
   hW64qKK6a8FmtkD3hWD3i7CD75VyHCqdYqR+IW21g/oWyqgxpq1cb/rr0
   rMQxPj8PmvrDpILgfgWF4znyAXaZa0RPq+rC7aHwGtn0G5qn37fRyf+o8
   dVpfb/nDIJbGPVSuT4S0cp8Ftv97/uSbfwyGHzSVKBDPIabcXLA7J0DSG
   NDN85jRPGzj5QhokIiAWkK0ejNPuwb+E3iz/qcxiksGLDbdecwFfR2eR+
   O0o/6WB4CjpzHhld2M8MozZlXeiAAgWohaBzTisN5pNDJojH/L9MNItMD
   g==;
X-CSE-ConnectionGUID: qpPTtq+DRL6TNY19gIQdug==
X-CSE-MsgGUID: 6y1tERcfQdKwd2I/FwexUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="37749093"
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="37749093"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 10:45:45 -0700
X-CSE-ConnectionGUID: lnRP/2mCSMi3Tei/dSkT4w==
X-CSE-MsgGUID: Pn+3Z+6DRWS4KTje4kuQuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="74009902"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 Oct 2024 10:45:44 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swPtW-0000jY-0m;
	Thu, 03 Oct 2024 17:45:42 +0000
Date: Fri, 4 Oct 2024 01:44:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1553/23811]
 drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:3553:25: sparse: sparse: symbol
 'host_attrs_v2_hw' was not declared. Should it be static?
Message-ID: <202410040135.yxN1SBCM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5c63bd0fa5e86474d30ecd06d67f2393de081434
commit: a9cc7cd9ecc843e5cc77a350cfe76ae24421064d [1553/23811] scsi: hisi_sas: add a separate host attribute for every host adapter
config: arm64-randconfig-r111-20241003 (https://download.01.org/0day-ci/archive/20241004/202410040135.yxN1SBCM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241004/202410040135.yxN1SBCM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410040135.yxN1SBCM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:968:26: sparse: sparse: cast from restricted __le64
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:968:26: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __le64 [usertype] sas_addr @@
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:968:26: sparse:     expected unsigned long long [usertype] val
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:968:26: sparse:     got restricted __le64 [usertype] sas_addr
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:968:26: sparse: sparse: cast from restricted __le64
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:968:26: sparse: sparse: cast from restricted __le64
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:968:26: sparse: sparse: cast from restricted __le64
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:968:26: sparse: sparse: cast from restricted __le64
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:968:26: sparse: sparse: cast from restricted __le64
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:968:26: sparse: sparse: cast from restricted __le64
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:968:26: sparse: sparse: cast from restricted __le64
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:968:26: sparse: sparse: cast from restricted __le64
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:968:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 [usertype] sas_addr @@     got unsigned long long @@
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:968:24: sparse:     expected restricted __le64 [usertype] sas_addr
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:968:24: sparse:     got unsigned long long
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2045:34: sparse: sparse: cast from restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2045:34: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] trans_tx_fail_type @@
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2045:34: sparse:     expected unsigned int [usertype] val
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2045:34: sparse:     got restricted __le32 [usertype] trans_tx_fail_type
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2045:34: sparse: sparse: cast from restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2045:34: sparse: sparse: cast from restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2045:34: sparse: sparse: cast from restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2045:34: sparse: sparse: cast from restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2045:34: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] trans_tx_fail_type @@     got restricted __le32 [usertype] @@
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2045:34: sparse:     expected unsigned int [usertype] trans_tx_fail_type
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2045:34: sparse:     got restricted __le32 [usertype]
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2046:34: sparse: sparse: cast from restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2046:34: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] trans_rx_fail_type @@
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2046:34: sparse:     expected unsigned int [usertype] val
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2046:34: sparse:     got restricted __le32 [usertype] trans_rx_fail_type
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2046:34: sparse: sparse: cast from restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2046:34: sparse: sparse: cast from restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2046:34: sparse: sparse: cast from restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2046:34: sparse: sparse: cast from restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2046:34: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] trans_rx_fail_type @@     got restricted __le32 [usertype] @@
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2046:34: sparse:     expected unsigned int [usertype] trans_rx_fail_type
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2046:34: sparse:     got restricted __le32 [usertype]
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2047:31: sparse: sparse: cast from restricted __le16
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2047:31: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] dma_tx_err_type @@
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2047:31: sparse:     expected unsigned short [usertype] val
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2047:31: sparse:     got restricted __le16 [usertype] dma_tx_err_type
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2047:31: sparse: sparse: cast from restricted __le16
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2047:31: sparse: sparse: cast from restricted __le16
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2047:31: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned short [usertype] dma_tx_err_type @@     got restricted __le16 [usertype] @@
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2047:31: sparse:     expected unsigned short [usertype] dma_tx_err_type
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2047:31: sparse:     got restricted __le16 [usertype]
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2048:32: sparse: sparse: cast from restricted __le16
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2048:32: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] sipc_rx_err_type @@
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2048:32: sparse:     expected unsigned short [usertype] val
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2048:32: sparse:     got restricted __le16 [usertype] sipc_rx_err_type
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2048:32: sparse: sparse: cast from restricted __le16
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2048:32: sparse: sparse: cast from restricted __le16
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2048:32: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned short [usertype] sipc_rx_err_type @@     got restricted __le16 [usertype] @@
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2048:32: sparse:     expected unsigned short [usertype] sipc_rx_err_type
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2048:32: sparse:     got restricted __le16 [usertype]
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2049:31: sparse: sparse: cast from restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2049:31: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] dma_rx_err_type @@
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2049:31: sparse:     expected unsigned int [usertype] val
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2049:31: sparse:     got restricted __le32 [usertype] dma_rx_err_type
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2049:31: sparse: sparse: cast from restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2049:31: sparse: sparse: cast from restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2049:31: sparse: sparse: cast from restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2049:31: sparse: sparse: cast from restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2049:31: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] dma_rx_err_type @@     got restricted __le32 [usertype] @@
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2049:31: sparse:     expected unsigned int [usertype] dma_rx_err_type
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2049:31: sparse:     got restricted __le32 [usertype]
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2383:30: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2409:26: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2410:32: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2411:46: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2538:26: sparse: sparse: invalid assignment: |=
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2538:26: sparse:    left side has type restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2538:26: sparse:    right side has type int
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:3153:51: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] act_tmp @@     got restricted __le32 [usertype] act @@
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:3153:51: sparse:     expected unsigned int [usertype] act_tmp
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:3153:51: sparse:     got restricted __le32 [usertype] act
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:3156:47: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:3165:48: sparse: sparse: restricted __le64 degrades to integer
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:3177:45: sparse: sparse: restricted __le32 degrades to integer
>> drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:3553:25: sparse: sparse: symbol 'host_attrs_v2_hw' was not declared. Should it be static?
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:773:1: sparse: sparse: context imbalance in 'slot_index_alloc_quirk_v2_hw' - wrong count at exit
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:3646:36: warning: 'sas_v2_acpi_match' defined but not used [-Wunused-const-variable=]
    3646 | static const struct acpi_device_id sas_v2_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c: In function 'clear_itct_v2_hw':
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:987:29: warning: storing the address of local variable 'completion' in '*sas_dev.completion' [-Wdangling-pointer=]
     987 |         sas_dev->completion = &completion;
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~
   In file included from include/linux/srcutree.h:28,
                    from include/linux/srcu.h:62,
                    from include/linux/notifier.h:16,
                    from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:748,
                    from include/linux/gfp.h:6,
                    from include/linux/slab.h:15,
                    from include/linux/resource_ext.h:19,
                    from include/linux/acpi.h:26,
                    from drivers/scsi/hisi_sas/hisi_sas.h:15,
                    from drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:12:
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:981:36: note: 'completion' declared here
     981 |         DECLARE_COMPLETION_ONSTACK(completion);
         |                                    ^~~~~~~~~~
   include/linux/completion.h:70:27: note: in definition of macro 'DECLARE_COMPLETION_ONSTACK'
      70 |         struct completion work = COMPLETION_INITIALIZER_ONSTACK(work)
         |                           ^~~~
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:979:55: note: 'sas_dev' declared here
     979 |                               struct hisi_sas_device *sas_dev)
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:3319: warning: Function parameter or member 'hisi_hba' not described in 'interrupt_init_v2_hw'

vim +/host_attrs_v2_hw +3553 drivers/scsi/hisi_sas/hisi_sas_v2_hw.c

  3552	
> 3553	struct device_attribute *host_attrs_v2_hw[] = {
  3554		&dev_attr_phy_event_threshold,
  3555		NULL
  3556	};
  3557	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
