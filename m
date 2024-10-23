Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E9415746E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Oct 2024 21:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729720581; cv=none; b=HoblOeHq6HuDtrJ6pUSQTFdD2Wd1Y0OJ4K96zfr8b6226bINBhWxmut2ixZ+dpXlh1E70lumZ1POY0SMmzLaecv9bmnRLR5JkNkB3imnkVjBYiJV5WJYTrVvvqk+L8hjH9WssMn4ZaZygmKedT4paj7NlURO95L2Avb4PnFwpCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729720581; c=relaxed/simple;
	bh=O+c6QJGzDTUMd3DJsl79W7e4k0Y5IuYyYj3/7iCVsjE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PV/qjOgFsL4U4QjIl3QojQiOq2iza7a5xrhsFHKsNou/LnaZwmZGDiRa4uo1c76ABXTqPamIa0/v2yQX91L9WULaPMn4RLxM/mq3rtQ0XiUInACQbBOsOV70c810WPSyydCSsHCBCnYWrQxFSg8pLZdNl+vvx3gNRazkie6GRck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cyfaJxzy; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cyfaJxzy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729720580; x=1761256580;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O+c6QJGzDTUMd3DJsl79W7e4k0Y5IuYyYj3/7iCVsjE=;
  b=cyfaJxzypJmEs8ISZSmB1+QetQFTg3QV8d0UDR314qrb6UHU6XcvPmsY
   50EQDQuUb5QSGxQSBZ74UfdUbLt8fVqRmKDvuaIrlP9uDRmPpCcleyGl6
   3xYswD4bT2//BRjCxWvrVmwrujmWZz2OM+9OcsclfKMqr7hCWr4se/G77
   3oN4rRpQGB+dbKeRxodrJv3wQNCCr62DwlkFXQfGkjCy7ejbMWq9p/X5x
   71wKL30Dttlpa3S7tUYC4jzS/9OU+GIgvep7AL01qShzci/DWilyF8krN
   vueHT+q5xd0I18gr0AjNhDZkQfAacO71tK/+Wqm96dSYEcxPyul8TiTgK
   g==;
X-CSE-ConnectionGUID: 308UHdozQYOjYQiBz+yFVg==
X-CSE-MsgGUID: TF0PtpeATt2cTy/9l0VjmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29111304"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29111304"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 14:56:20 -0700
X-CSE-ConnectionGUID: /pKdKTlyRtmrxSQAxyKMLA==
X-CSE-MsgGUID: AM6FtfPUSWOdPtA+M9073A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="85189633"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 23 Oct 2024 14:56:18 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3jKx-000VcL-2B;
	Wed, 23 Oct 2024 21:56:15 +0000
Date: Thu, 24 Oct 2024 05:55:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 155/176]
 arch/arm64/kvm/hyp_trace.c:702:66: warning: '%ld' directive output may be
 truncated writing between 1 and 20 bytes into a region of size 13
Message-ID: <202410240556.pRRFT1lD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   7f1ad2ebaa24958e3b0527f36d96e58f42cf3f0e
commit: ac2974ee9aea548e53ad498d0708ba332de85f41 [155/176] ANDROID: KVM: arm64: Add nVHE hyp tracing to tracefs
config: arm64-randconfig-002-20241024 (https://download.01.org/0day-ci/archive/20241024/202410240556.pRRFT1lD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410240556.pRRFT1lD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410240556.pRRFT1lD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/hyp_trace.c: In function 'hyp_trace_init_tracefs':
>> arch/arm64/kvm/hyp_trace.c:702:66: warning: '%ld' directive output may be truncated writing between 1 and 20 bytes into a region of size 13 [-Wformat-truncation=]
     702 |                 snprintf(per_cpu_name, sizeof(per_cpu_name), "cpu%ld", cpu);
         |                                                                  ^~~
   arch/arm64/kvm/hyp_trace.c:702:62: note: directive argument in the range [-9223372036854775808, 4294967294]
     702 |                 snprintf(per_cpu_name, sizeof(per_cpu_name), "cpu%ld", cpu);
         |                                                              ^~~~~~~~
   arch/arm64/kvm/hyp_trace.c:702:17: note: 'snprintf' output between 5 and 24 bytes into a destination of size 16
     702 |                 snprintf(per_cpu_name, sizeof(per_cpu_name), "cpu%ld", cpu);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +702 arch/arm64/kvm/hyp_trace.c

   665	
   666	int hyp_trace_init_tracefs(void)
   667	{
   668		struct dentry *root, *per_cpu_root;
   669		char per_cpu_name[16];
   670		long cpu;
   671	
   672		if (!is_protected_kvm_enabled())
   673			return 0;
   674	
   675		root = tracefs_create_dir(TRACEFS_DIR, NULL);
   676		if (!root) {
   677			pr_err("Failed to create tracefs "TRACEFS_DIR"/\n");
   678			return -ENODEV;
   679		}
   680	
   681		tracefs_create_file("tracing_on", TRACEFS_MODE_WRITE, root, NULL,
   682				    &hyp_tracing_on_fops);
   683	
   684		tracefs_create_file("buffer_size_kb", TRACEFS_MODE_WRITE, root, NULL,
   685				    &hyp_buffer_size_fops);
   686	
   687		tracefs_create_file("trace", TRACEFS_MODE_WRITE, root,
   688				    (void *)RING_BUFFER_ALL_CPUS, &hyp_trace_fops);
   689	
   690		tracefs_create_file("trace_pipe", TRACEFS_MODE_WRITE, root,
   691				    (void *)RING_BUFFER_ALL_CPUS, &hyp_trace_pipe_fops);
   692	
   693		per_cpu_root = tracefs_create_dir("per_cpu", root);
   694		if (!per_cpu_root) {
   695			pr_err("Failed to create tracefs folder "TRACEFS_DIR"/per_cpu/\n");
   696			return -ENODEV;
   697		}
   698	
   699		for_each_possible_cpu(cpu) {
   700			struct dentry *per_cpu_dir;
   701	
 > 702			snprintf(per_cpu_name, sizeof(per_cpu_name), "cpu%ld", cpu);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
