Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2A82DCC0B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 May 2025 07:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748245519; cv=none; b=e8Xw/Y2HG3W3gjNPWB7b64CdvFohH18IE3AttMy3EXENtGPW+3L3RHL7JdoM5Hc7LYZ9OEGbFj518asSew+7qaH3Z6Q5e6fJwKZ3cHftc/CRLkLGu4YvoBaO3MndOrLch76hiAiFQIN/s3t2TxlM213z3qWVK5LuN1SGzaj6aKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748245519; c=relaxed/simple;
	bh=H5jXxXJwi23dRKYsAgHgswVHe2Djl/5+LielyK8of+4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Guh2K9YVSDKwLCEyZ9LHzfi2QJB5o6CTtLBq0mjTso5D5a/khQUslKPDhwYy92soH+GG5gs81IPF6J2pvPZhCCD52hL6fWRjTdt4ZprLNwxnUTHMDzj7wI7NU/YsrzGtBEGdZQbYmIcnTISBp0xkD+sLD5Rq5n8U4L4+796z+Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hKky/AI0; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hKky/AI0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748245517; x=1779781517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H5jXxXJwi23dRKYsAgHgswVHe2Djl/5+LielyK8of+4=;
  b=hKky/AI0wjUpTow6oSQE6OvjIbqVnJRzn0URjrUDHoqgSoYxAzU/RPnY
   UNpOxnEzFeYWkwNjRnHD1Am+G0nqYPIJY4b4Xf93fWFCF0UrNDB9GuMsm
   UjPiG3pVto7WNy/vHfEqPV88Bq9/KlVw6h3QVzTFUZdpf6sZAKO+q3bcY
   rVP4Cum6VSZy/ntGWnUnF/EJv1u9NqbxT2UycL0eAiyTdepXrahtSDSv5
   MWPhoXxOPYTHLNJ2HCdvOdKc5DKV91dV5L0rWPEfthwdD6dBh7mds4P2u
   c4iBq5x6D8XsCUEPy/1t1gqnnAhJN0/lqzRPzbdrGW4m4+0PisrwqPcoH
   g==;
X-CSE-ConnectionGUID: m/h/diiaTlSc12Ukc9HFEQ==
X-CSE-MsgGUID: VNge77vzRVavdhcJhbdbAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="50092517"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; 
   d="scan'208";a="50092517"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 00:45:16 -0700
X-CSE-ConnectionGUID: GwbALlCKQIi7k2F9KbwSMA==
X-CSE-MsgGUID: sLedyccNT9W8weHyPCYRmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; 
   d="scan'208";a="142091555"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 26 May 2025 00:45:15 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJSWH-000SDk-1G;
	Mon, 26 May 2025 07:45:13 +0000
Date: Mon, 26 May 2025 15:44:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, libai <libai12@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2284/2284]
 arch/arm64/kvm/../../../virt/kvm/eventfd.c:719: warning: cannot understand
 function prototype: 'struct eventfd_shadow '
Message-ID: <202505261539.RLecPVlr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   44721e23ce684272eca9901966f55cd2780f4b7e
commit: 2dcf53278783921137dbb4eb4628f2c96cac65e2 [2284/2284] eventfd:Introduce the eventfd batch processing interface
config: arm64-randconfig-003-20250526 (https://download.01.org/0day-ci/archive/20250526/202505261539.RLecPVlr-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250526/202505261539.RLecPVlr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505261539.RLecPVlr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/../../../virt/kvm/eventfd.c:719: warning: cannot understand function prototype: 'struct eventfd_shadow '
>> arch/arm64/kvm/../../../virt/kvm/eventfd.c:1102: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * If an exception occurs,
   arch/arm64/kvm/../../../virt/kvm/eventfd.c:1131: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * If the temporarily stored eventfd cannot be successfully updated
   arch/arm64/kvm/../../../virt/kvm/eventfd.c:1176: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Copy the current buses,


vim +719 arch/arm64/kvm/../../../virt/kvm/eventfd.c

   713	
   714	/**
   715	 * eventfd_shadow
   716	 * Save the eventfd pointer and operation.
   717	 * To protect Kabi, these members are placed here
   718	 */
 > 719	struct eventfd_shadow {
   720		struct list_head node;
   721		struct _ioeventfd *eventfd;
   722		/* Indicate the operations required for this eventfd */
   723		u8 flag;
   724	};
   725	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
