Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDC9648
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Apr 2023 06:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680588686; x=1712124686;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9F7YQRSZFK13/Z9zwynaAX3RA0wY3n9l4ibviHITmm8=;
  b=T4SWY9+HcoIBvumpTHfJ8oFor5qD5JaUCUXR/wDQbCjX7QEfc3gLUEZg
   nqHUSVDqw4sDQSrD7TSs9Pf1ebozc+g6mvIcgqJuz9PxqzJ5JptBWEnlx
   OYoYZ1+8AIGZqU1E/fESTyrLBJPd6nTX3B++Jj0Sshu0SP3d1CVdtNm8C
   gOhY3yXOI+Bgw+woF5+Bq71+aNS2g23Eqst8I1ehGU9ZS/DgVKKJEaU6d
   6MjtMt4eNGuezGqiRQc587r1Npr2ArH8Y+y2aT0FuDqzMwVXbDReyKwXJ
   oYX4zOecnntUG9nVWfVzBIARTm2fFY9PkqhMtvTgdysh1nkaZw7z9UPbv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="407160199"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; 
   d="scan'208";a="407160199"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2023 23:11:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="663464133"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; 
   d="scan'208";a="663464133"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 03 Apr 2023 23:11:24 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjZt6-000PH0-0M;
	Tue, 04 Apr 2023 06:11:24 +0000
Date: Tue, 4 Apr 2023 14:11:19 +0800
From: kernel test robot <lkp@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-tpm-wip 2/7] arch/x86/coco/tdx/tdx.c:188:13:
 warning: unused variable 'ret'
Message-ID: <202304041445.y55Wrazc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-tpm-wip
head:   e2f91af6624fa658a8c4fea969584f50e46f0397
commit: 32ff50e52646b95356c1b7849b88bc67305795b3 [2/7] x86/coco: Add service hypercall support
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20230404/202304041445.y55Wrazc-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel/tdx/commit/32ff50e52646b95356c1b7849b88bc67305795b3
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-tpm-wip
        git checkout 32ff50e52646b95356c1b7849b88bc67305795b3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/coco/tdx/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304041445.y55Wrazc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/coco/tdx/tdx.c: In function 'tdx_hcall_service':
>> arch/x86/coco/tdx/tdx.c:188:13: warning: unused variable 'ret' [-Wunused-variable]
     188 |         int ret;
         |             ^~~


vim +/ret +188 arch/x86/coco/tdx/tdx.c

   168	
   169	/**
   170	 * tdx_hcall_service() - Wrapper to request service from VMM
   171	 *                       using Service hypercall.
   172	 * @req: Address of the direct mapped command request buffer
   173	 *       which contains the service command.
   174	 * @resp: Address of the direct mapped command response buffer
   175	 *        to store service response.
   176	 * @timeout: Maximum Timeout in seconds for command request and
   177	 *           response.
   178	 *
   179	 * Refer to section titled "TDG.VP.VMCALL<Service>" in the TDX GHCI
   180	 * v1.5 specification for more information on Service hypercall.
   181	 * It is used in the TDX TPM driver to service TPM commands.
   182	 *
   183	 * Return 0 on success, error code on failure.
   184	 */
   185	int tdx_hcall_service(u8 *req, u8 *resp, u64 timeout)
   186	{
   187		struct tdx_hypercall_args args = {0};
 > 188		int ret;
   189	
   190		if (!tdx_event_irq_vector)
   191			return -EIO;
   192	
   193		args.r10 = TDX_HYPERCALL_STANDARD;
   194		args.r11 = TDVMCALL_SERVICE;
   195		args.r12 = cc_mkdec(virt_to_phys(req));
   196		args.r13 = cc_mkdec(virt_to_phys(resp));
   197		args.r14 = tdx_event_irq_vector;
   198		args.r15 = timeout;
   199	
   200		return __tdx_hypercall(&args, 0);
   201	}
   202	EXPORT_SYMBOL_GPL(tdx_hcall_service);
   203	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
