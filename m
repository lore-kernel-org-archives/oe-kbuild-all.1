Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D6963E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jul 2023 07:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689061851; x=1720597851;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RNYGF5Ev/lsJEzz9WPK7upYl9AwNdGF/SwruolyqLy4=;
  b=FOUkUZVFrd6YRxvpOwBnTQNM6cmEYtR1iQIIA5r/9N0VOLNjdoiksOOs
   8IjgO4coXOdeyqRVGzu3EpKOxpxAyb1hbEu31Enz7Ka6fS3PIVtiw977k
   9OMdlnGds/GeYsWs8k+hIoLXcTxfTg+PsOzQENk1xkPC6aNw8eo4X6G/m
   7baThMasmkTlAXtSkWsKb8E442ZRopYO8qx+PSBNPdacWlsMbuMJiHQVN
   bVHiBhBy55GpNSB87uh/RC0griZp77EhYmr6+BhNb43QQLai/ceuFvbRe
   CiAcTM1BaFbxN1f3ICyCrALcwc/ocIdYItDg2flui6sJMfa0vGfsi/lN6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="344150860"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="344150860"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 00:50:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="698339708"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="698339708"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 11 Jul 2023 00:50:48 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJ891-0004Sz-1R;
	Tue, 11 Jul 2023 07:50:47 +0000
Date: Tue, 11 Jul 2023 15:50:21 +0800
From: kernel test robot <lkp@intel.com>
To: Tomer Tayar <ttayar@habana.ai>
Cc: oe-kbuild-all@lists.linux.dev, Oded Gabbay <ogabbay@kernel.org>
Subject: [ogabbay:habanalabs-accel-6.6 21/31]
 drivers/accel/habanalabs/common/device.c:587:5: warning: no previous
 prototype for '__hl_mmap'
Message-ID: <202307111502.SxXwUnc6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux.git habanalabs-accel-6.6
head:   77b8d2a4b6264baf8566813c7e61809e4722c327
commit: cc9c2ec0e61883b26effbe0b8cf40d5180999d21 [21/31] accel/habanalabs: register compute device as an accel device
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230711/202307111502.SxXwUnc6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230711/202307111502.SxXwUnc6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307111502.SxXwUnc6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/accel/habanalabs/common/device.c:587:5: warning: no previous prototype for '__hl_mmap' [-Wmissing-prototypes]
     587 | int __hl_mmap(struct hl_fpriv *hpriv, struct vm_area_struct *vma)
         |     ^~~~~~~~~


vim +/__hl_mmap +587 drivers/accel/habanalabs/common/device.c

   586	
 > 587	int __hl_mmap(struct hl_fpriv *hpriv, struct vm_area_struct *vma)
   588	{
   589		struct hl_device *hdev = hpriv->hdev;
   590		unsigned long vm_pgoff;
   591	
   592		if (!hdev) {
   593			pr_err_ratelimited("Trying to mmap after device was removed! Please close FD\n");
   594			return -ENODEV;
   595		}
   596	
   597		vm_pgoff = vma->vm_pgoff;
   598	
   599		switch (vm_pgoff & HL_MMAP_TYPE_MASK) {
   600		case HL_MMAP_TYPE_BLOCK:
   601			vma->vm_pgoff = HL_MMAP_OFFSET_VALUE_GET(vm_pgoff);
   602			return hl_hw_block_mmap(hpriv, vma);
   603	
   604		case HL_MMAP_TYPE_CB:
   605		case HL_MMAP_TYPE_TS_BUFF:
   606			return hl_mem_mgr_mmap(&hpriv->mem_mgr, vma, NULL);
   607		}
   608		return -EINVAL;
   609	}
   610	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
