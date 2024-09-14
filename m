Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4395FBBA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 21:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726350325; cv=none; b=q406smwQIBE0/DL+D/+NDIZWDPj8sKOHhf7P1WuyB+EYgALxaYRfugz+hw41xdSOv37yPYGxsMxB+/omGS6ja9un97D51Vd4/fuIEQGTzmjzMZ5fvcSgZ3c/l8NaBygyZk55RMuzC4ihepXvIYwPdMrVjNyCLx8Fw81ZZ/bZ6DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726350325; c=relaxed/simple;
	bh=CLSu4mI5ZhyM2hJDPioSr4jdpcE7Sig1rtveFIUk3Pw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AGtDCOSfH8dGzxUoX4xVudf26VqyxIyXGx1vo4QaerMyhj1+gW+RsU0ccX5UoiM4YnbaVfnELMqBwW4VllrVQVoKVhWE62OgST/a9Vtt7TlWC9nEbXDSxY+5Vku+Lmq5NAf1E0tB3f6E/LNccfokXVD89vYqBq1DZwM/k5XkF3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lif74Feu; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lif74Feu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726350323; x=1757886323;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CLSu4mI5ZhyM2hJDPioSr4jdpcE7Sig1rtveFIUk3Pw=;
  b=Lif74FeuBAH0xcZKyxoBNDEgW9ohmkf2yHz9JAKn2MfUFl4X4tx7WLiW
   TFBNxcNx0JVCbH4PCfnsWUqJDLnCzMth0HMrG3MkB7kB08HVzTxvq3HIX
   Z4olET7N9somvZABwF3bflIq54fKWFUJGR13anUhO0ClPXCsdJ7/5Zdv3
   lcnvchjx474JXxJEV6OBa0sy791e62Qwv88J4KUXcWKBTM30RRlZy7pVk
   cPSaLFj+RVFGskKqSVwQM7DUmm6VUIaPwyBXfvnRh4ndsoIzoSRkQbUUe
   ShNJK+FYoQM1y9eMISY86X4lGRY0aoeu7ofClIoWqPbz8O5BMvb/xJ2+S
   A==;
X-CSE-ConnectionGUID: pBBWryKoT7K1GZz7o9biCQ==
X-CSE-MsgGUID: L/9hOfffSkW4JfyMj15W4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="25323743"
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="25323743"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 14:45:22 -0700
X-CSE-ConnectionGUID: uIx6SCKFQdi5OsSPjmFsnA==
X-CSE-MsgGUID: MlDVNTZUTcu69bdBhEdP5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="73482304"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 14 Sep 2024 14:45:20 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spaZy-0008A6-0j;
	Sat, 14 Sep 2024 21:45:18 +0000
Date: Sun, 15 Sep 2024 05:45:05 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yanhaitao <yanhaitao2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 22035/30000] arch/arm64/kvm/reset.c:102:34:
 error: implicit declaration of function 'sve_max_virtualisable_vl'
Message-ID: <202409150529.mcKQAqhK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   1b6ac823ff98dd4dbd1b6bff478a1b9b44855f67
commit: 68da302c8ae30331c8917f1dc7b0f1682f696d71 [22035/30000] arm64/sve: Put system wide vector length information into structs
config: arm64-randconfig-002-20240915 (https://download.01.org/0day-ci/archive/20240915/202409150529.mcKQAqhK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240915/202409150529.mcKQAqhK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409150529.mcKQAqhK-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kvm/reset.c: In function 'kvm_arm_init_sve':
>> arch/arm64/kvm/reset.c:102:34: error: implicit declaration of function 'sve_max_virtualisable_vl' [-Werror=implicit-function-declaration]
     102 |                 kvm_sve_max_vl = sve_max_virtualisable_vl();
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/sve_max_virtualisable_vl +102 arch/arm64/kvm/reset.c

    98	
    99	int kvm_arm_init_sve(void)
   100	{
   101		if (system_supports_sve()) {
 > 102			kvm_sve_max_vl = sve_max_virtualisable_vl();
   103	
   104			/*
   105			 * The get_sve_reg()/set_sve_reg() ioctl interface will need
   106			 * to be extended with multiple register slice support in
   107			 * order to support vector lengths greater than
   108			 * SVE_VL_ARCH_MAX:
   109			 */
   110			if (WARN_ON(kvm_sve_max_vl > SVE_VL_ARCH_MAX))
   111				kvm_sve_max_vl = SVE_VL_ARCH_MAX;
   112	
   113			/*
   114			 * Don't even try to make use of vector lengths that
   115			 * aren't available on all CPUs, for now:
   116			 */
   117			if (kvm_sve_max_vl < sve_max_vl())
   118				pr_warn("KVM: SVE vector length for guests limited to %u bytes\n",
   119					kvm_sve_max_vl);
   120		}
   121	
   122		return 0;
   123	}
   124	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
