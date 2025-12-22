Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F8E3043C8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 11:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766402292; cv=none; b=o/gMdd1uqAwLC2wZwX+4Kynq66RSEkHKR3eS6vuMOrYOzsVLJswm0Uj66hnn4pP+D49AQA5P0o2qjz9YUG8G8EcXotvfaZywtKbHRusVVAXRK4WRLFbOa6KjnyQkEN3ekBVZCcnhhfQaf0GTc8cyJ+M3DCcgRhK1J9hxOKvgOQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766402292; c=relaxed/simple;
	bh=F8LYRsUujfLxgINoIQR4FvMU9SyqgTWu2qM6pDVwX6I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TeNqQCG+8SZKxKMVGowahVu4AYhM/8mCxAkUO3SgmIXx5FdQvZbqQRMdqikbtJQgp+BXyOfojAB44ZMaKGO1Zz8mBJrDlyNUbfgHVOiQlRjFBAWoa8JdmHRwHSY3CdyFgknn4VwEi42g7vgC7lBoV0RZNDjASftj1+hph+dFttw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mQqKhuev; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mQqKhuev"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766402291; x=1797938291;
  h=date:from:to:cc:subject:message-id;
  bh=F8LYRsUujfLxgINoIQR4FvMU9SyqgTWu2qM6pDVwX6I=;
  b=mQqKhuevI4R0HCD8lLiJ83F1KaupsnN/kUwsHQ/FF1UfxH/JP97RUeM0
   Cph+J1SV8h6VyVuKRzjiWC19uPdIOJIDabukqGAEzJFVMF81FDeBnpHqk
   2J38rvWpU4CRwluqSCCefdBTMzTCybzFrimGSG3LyaU1Q/1TV4MJytr19
   ZpL7cgQ9dG94gCR0SbxsO6qwMqrSRD7jXUURBWoZs6KnMLzUC1Dmdefgu
   i6iaBSiAzOO1yQSbxkYBIFFWYQWtVydbcYhRGpIwbfIgUVJDl7vVfwyxu
   5Ium/5KJ4o8+TWv/Ajx0VlrHZBFEbD405P1AVwh/k7Fh3kUm/11vmlTte
   Q==;
X-CSE-ConnectionGUID: hIGPxpZPREiD92OGdf3ZDw==
X-CSE-MsgGUID: WXlIE0R6RjylJGel7OdV7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68299863"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="68299863"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 03:18:10 -0800
X-CSE-ConnectionGUID: QtH+ErLqSHGc5KlBJosp6g==
X-CSE-MsgGUID: xeu7f66+RYKNfzmCk6pM/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="203631650"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 22 Dec 2025 03:18:08 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXdvS-000000000Rd-1YuH;
	Mon, 22 Dec 2025 11:18:06 +0000
Date: Mon, 22 Dec 2025 19:18:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-06 2/2]
 arch/arm64/kvm/hyp_trace.c:709:37: warning: 'hyp_trace_raw_fops' defined but
 not used
Message-ID: <202512221937.0uaGVDma-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vincent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-06
head:   6a72f127f3f04bcb09afec2cab622c6d2118a5c0
commit: 8ae140fc839f2739df17942add206b1dc938c85c [2/2] ANDROID: KVM: arm64: Add raw interface to nVHE hyp tracing
config: arm64-randconfig-004-20251221 (https://download.01.org/0day-ci/archive/20251222/202512221937.0uaGVDma-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512221937.0uaGVDma-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512221937.0uaGVDma-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp_trace.c:709:37: warning: 'hyp_trace_raw_fops' defined but not used [-Wunused-const-variable=]
     709 | static const struct file_operations hyp_trace_raw_fops = {
         |                                     ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp_trace.c: In function 'hyp_trace_init_tracefs':
   arch/arm64/kvm/hyp_trace.c:778:66: warning: '%ld' directive output may be truncated writing between 1 and 20 bytes into a region of size 13 [-Wformat-truncation=]
     778 |                 snprintf(per_cpu_name, sizeof(per_cpu_name), "cpu%ld", cpu);
         |                                                                  ^~~
   arch/arm64/kvm/hyp_trace.c:778:62: note: directive argument in the range [-9223372036854775808, 4294967294]
     778 |                 snprintf(per_cpu_name, sizeof(per_cpu_name), "cpu%ld", cpu);
         |                                                              ^~~~~~~~
   arch/arm64/kvm/hyp_trace.c:778:17: note: 'snprintf' output between 5 and 24 bytes into a destination of size 16
     778 |                 snprintf(per_cpu_name, sizeof(per_cpu_name), "cpu%ld", cpu);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/hyp_trace_raw_fops +709 arch/arm64/kvm/hyp_trace.c

   708	
 > 709	static const struct file_operations hyp_trace_raw_fops = {
   710		.open           = hyp_trace_raw_open,
   711		.read           = hyp_trace_raw_read,
   712		.release        = hyp_trace_raw_release,
   713		.llseek         = no_llseek,
   714	};
   715	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
