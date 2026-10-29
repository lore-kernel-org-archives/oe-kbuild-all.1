Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793292353;
	b=oa9LyZ0BIn0my7hojwA+39HADENAqD9LDuwjimMKAomZ6oIcGmzr5isckKnlaNBwGuDc
	 kACqpRMCnCuj08+n5hhc+C0lUyXZbcH/s/cTYsS2W7gD31PLWJ8DLbQhsEsCYaBgFgcCw
	 0LJlI18XwTvZ7DoBT1l7bOPzMmXYD+3ojc6SYshb4Sj6fx/VfeotWT2HqolJbms4gMBW4
	 zhWLA0yY0yyM48zbJlYDCi6t8V9h1Ph0pLIPGYFV88UUa/L6n5geZErHl6qlCeijRcEaX
	 CoogFe33MpW6ATpcbQcA92ZO07euA5mGv+rVv49s8dVUYFtMkWO7lrEuri4lsyKsOJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793292353;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=6WbWr3mayw/Tlb8sXhdja0fVOdZzf3onse/iGFSjGaU=;
	b=GTrpPw7nTXe629JmfUnKZCNI4lOsiBd0D8hLdoqaBc1pSWnYQlETUqn42djugrZp49C7
	 aYyokFC2caleUcck9cJ4VF5vlGgxF5PRCmvqEn9ALcDrVyCSxCkW15q0tOBvOZ0Zg3jsM
	 4uNkV2cCU/W2MfT+nCqGZbf/z6Bl08WaKQ1eqNu7qsOUHbRPgoPpXIXesWmH5tIGSOpy4
	 nXUfggKTT9dFqUZJwOBpqIb+LlW8K8WmGSjdkaI6mvmWJGmFBce7wflchl5kKqR8q5upR
	 wMpDTLM7PB4zXE2IoD4ibS2+zyOVRFbYcBPJ4v67IX5WnnjBzRIUYJDRUibV69FV5zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VTso0AkV;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E78E606A31F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Oct 2026 16:45:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E78E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VTso0AkV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793292353; x=1824828353;
  h=date:from:to:cc:subject:message-id;
  bh=LYNMFjyjrBdakTWMNwM+EOdCbQSmiUu2wD4JFX+TdBg=;
  b=VTso0AkVdSM/ywZrJcu/DBOuvWj/5IrmpcxhjUfco7PE7/b05RLqKkmR
   N6mBBXM86vb/4PpMKFpNO/E4ey4KC+YsVJtYeFbo9whNgvx69/sKM7gsx
   UCDZlxYbRbEk3QmwpEZdTrAX5VisH/P9UHcJpkHy1jk+4wQ4T2t7BBdPx
   ZAAxGusRMAG3EckLz0cmSaudoWmtfmEkqA5w/84LsUpQpye85XsMajgQ4
   lHYLlwyRQ93TjgYGPtobtAudk2uLpm9a+4wJaSwolB3izRXeUAXIazE7E
   9LElsBAYB9xfP6xyqwHOIa8yoImXr9zZleNRlAJiHZNqmizPVWl/aACMo
   g==;
X-CSE-ConnectionGUID: epm7TtxtSOuw0/u1f5Uohw==
X-CSE-MsgGUID: yoicSlN/SbSzU0p64bHUEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="1941735"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1941735"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 09:45:51 -0700
X-CSE-ConnectionGUID: Rc410VmKRK6wqVD/8Stsjw==
X-CSE-MsgGUID: x8pKrdZXQQe5H9PEww5ftA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5733452"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Oct 2026 09:45:50 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMTG7-00000000aRc-1jc2;
	Thu, 29 Oct 2026 16:45:47 +0000
Date: Fri, 30 Oct 2026 00:45:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-lts 1/1]
 arch/arm64/kvm/hyp_trace.c:650:52: warning: '%ld' directive output may be
 truncated writing between 1 and 20 bytes into a region of size 13
Message-ID: <202610300005.ODjkXEyV-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android17-6.18-lts
head:   7aa62a531907e90da2a2bcd2aa20be3e26c4d37e
commit: 50ff494e3843188c222d9a65c18da8590cd6250e [1/1] FROMLIST: KVM: arm64: Add hyp tracing to tracefs
config: arm64-randconfig-1002-20261029 (https://download.01.org/0day-ci/archive/20261030/202610300005.ODjkXEyV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261030/202610300005.ODjkXEyV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610300005.ODjkXEyV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/hyp_trace.c: In function 'hyp_trace_init_tracefs':
>> arch/arm64/kvm/hyp_trace.c:650:52: warning: '%ld' directive output may be truncated writing between 1 and 20 bytes into a region of size 13 [-Wformat-truncation=]
      snprintf(per_cpu_name, sizeof(per_cpu_name), "cpu%ld", cpu);
                                                       ^~~
   arch/arm64/kvm/hyp_trace.c:650:48: note: directive argument in the range [-9223372036854775808, 4294967294]
      snprintf(per_cpu_name, sizeof(per_cpu_name), "cpu%ld", cpu);
                                                   ^~~~~~~~
   arch/arm64/kvm/hyp_trace.c:650:3: note: 'snprintf' output between 5 and 24 bytes into a destination of size 16
      snprintf(per_cpu_name, sizeof(per_cpu_name), "cpu%ld", cpu);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +650 arch/arm64/kvm/hyp_trace.c

   616	
   617	int hyp_trace_init_tracefs(void)
   618	{
   619		struct dentry *root, *per_cpu_root;
   620		char per_cpu_name[16];
   621		long cpu;
   622	
   623		if (!is_protected_kvm_enabled())
   624			return 0;
   625	
   626		root = tracefs_create_dir(TRACEFS_DIR, NULL);
   627		if (!root) {
   628			pr_err("Failed to create tracefs "TRACEFS_DIR"/\n");
   629			return -ENODEV;
   630		}
   631	
   632		tracefs_create_file("tracing_on", TRACEFS_MODE_WRITE, root, NULL,
   633				    &hyp_tracing_on_fops);
   634	
   635		tracefs_create_file("buffer_size_kb", TRACEFS_MODE_WRITE, root, NULL,
   636				    &hyp_buffer_size_fops);
   637	
   638		tracefs_create_file("trace_pipe", TRACEFS_MODE_WRITE, root,
   639				    (void *)RING_BUFFER_ALL_CPUS, &hyp_trace_pipe_fops);
   640	
   641		per_cpu_root = tracefs_create_dir("per_cpu", root);
   642		if (!per_cpu_root) {
   643			pr_err("Failed to create tracefs folder "TRACEFS_DIR"/per_cpu/\n");
   644			return -ENODEV;
   645		}
   646	
   647		for_each_possible_cpu(cpu) {
   648			struct dentry *per_cpu_dir;
   649	
 > 650			snprintf(per_cpu_name, sizeof(per_cpu_name), "cpu%ld", cpu);

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
