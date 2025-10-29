Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A333A2EC0A0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 04:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761711443; cv=none; b=CSE9ItVfDFjAjQ87SyWny+boMr4jtYVf9XGhFTk1S8rzcZHID4BhPvVh5yoD+zpXCN21SjhY0th7WClkQR367pmsxon4e8LGKmkBejEvL+Tc29a93ux509GPl/Up3x84B7VtAzKteu2madFb9bpS78qKFA5p9EFuLllfqtcauG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761711443; c=relaxed/simple;
	bh=9FM5+LaLOLkp+6QQxScs/yV0515uXyHbB3erUYcffb0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YycYIsBHxAVyYx6oTyPszHcfYasON2NLK2LRcnPYmD5miP9YiTJ7b4RjbY8don9X1ZKTsuZNMcYlVvQcD33ILy52rCNYlTf+3qvJwi3m5JnatW5VdiAuGORvkp3wPcYQ5HLYhWRXuEOR8tLkHRquQs51fhJpl3pm45Upu0z5pBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W7795lbz; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W7795lbz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761711441; x=1793247441;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9FM5+LaLOLkp+6QQxScs/yV0515uXyHbB3erUYcffb0=;
  b=W7795lbzRRSdGDgu2Rwh//+26vu0veSgKwcm+v/WtpyqZRydBKU8KVEK
   VkNy+0cSrvgUvkAKvI3jmnA1a6cImEAoPKz/mT/RXgjZlExBzsZQohZMy
   6GpG6o71elsB4/6EGI7B5S3oOmk63wWx8IteGQ6E5YJSkHsWtEsbfbN9n
   xJ/aun9YuNzup4IjqmPZA6X0INo0XQPUGPqhu7p/4EViyNDvVDycaH7NF
   MeafE9kV1gNHHOLgnPYIFmNvqslqAOHy4Y/fSaQ949m9i7Nn+myJG2njp
   42IzkKVI4UgzHpM6giRzzfk4Lwu0gkkoSkOhvIR8vGnlapfsMg1NCezWF
   g==;
X-CSE-ConnectionGUID: Ll8Fd3O0TKqxHSy158B0ZQ==
X-CSE-MsgGUID: 80/WzVAkRUqDI+bwrheLLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67686646"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="67686646"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 21:17:21 -0700
X-CSE-ConnectionGUID: Qh0GPDALQAe9BM4YWuO2PQ==
X-CSE-MsgGUID: 57ZvwbEHRcuvPGTcrPDyiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="184731018"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 28 Oct 2025 21:17:19 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDxcb-000K8Z-1S;
	Wed, 29 Oct 2025 04:17:17 +0000
Date: Wed, 29 Oct 2025 12:16:04 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Rathor <mrathor@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, Wei Liu <wei.liu@kernel.org>
Subject: [linux-next:master 2495/4731] arch/x86/hyperv/hv_crash.c:631:9:
 error: 'smp_ops' undeclared
Message-ID: <202510291235.IsyuIDrm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f9ba12abc5282bf992f9a9ae87ad814fd03a0270
commit: 11831782653e2f4a909275dee7562883e8aa421c [2495/4731] x86/hyperv: Enable build of hypervisor crashdump collection files
config: x86_64-randconfig-073-20251029 (https://download.01.org/0day-ci/archive/20251029/202510291235.IsyuIDrm-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510291235.IsyuIDrm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510291235.IsyuIDrm-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/hyperv/hv_crash.c: In function 'crash_nmi_callback':
   arch/x86/hyperv/hv_crash.c:282:13: warning: variable 'status' set but not used [-Wunused-but-set-variable]
     282 |         u64 status;
         |             ^~~~~~
   arch/x86/hyperv/hv_crash.c: In function 'hv_root_crash_init':
>> arch/x86/hyperv/hv_crash.c:631:9: error: 'smp_ops' undeclared (first use in this function)
     631 |         smp_ops.crash_stop_other_cpus = hv_crash_stop_other_cpus;
         |         ^~~~~~~
   arch/x86/hyperv/hv_crash.c:631:9: note: each undeclared identifier is reported only once for each function it appears in


vim +/smp_ops +631 arch/x86/hyperv/hv_crash.c

cd0e114e4583bb Mukesh Rathor 2025-10-06  580  
cd0e114e4583bb Mukesh Rathor 2025-10-06  581  /* Setup for kdump kexec to collect hypervisor RAM when running as root */
cd0e114e4583bb Mukesh Rathor 2025-10-06  582  void hv_root_crash_init(void)
cd0e114e4583bb Mukesh Rathor 2025-10-06  583  {
cd0e114e4583bb Mukesh Rathor 2025-10-06  584  	int rc;
cd0e114e4583bb Mukesh Rathor 2025-10-06  585  	struct hv_input_get_system_property *input;
cd0e114e4583bb Mukesh Rathor 2025-10-06  586  	struct hv_output_get_system_property *output;
cd0e114e4583bb Mukesh Rathor 2025-10-06  587  	unsigned long flags;
cd0e114e4583bb Mukesh Rathor 2025-10-06  588  	u64 status;
cd0e114e4583bb Mukesh Rathor 2025-10-06  589  	union hv_pfn_range cda_info;
cd0e114e4583bb Mukesh Rathor 2025-10-06  590  
cd0e114e4583bb Mukesh Rathor 2025-10-06  591  	if (pgtable_l5_enabled()) {
cd0e114e4583bb Mukesh Rathor 2025-10-06  592  		pr_err("Hyper-V: crash dump not yet supported on 5level PTs\n");
cd0e114e4583bb Mukesh Rathor 2025-10-06  593  		return;
cd0e114e4583bb Mukesh Rathor 2025-10-06  594  	}
cd0e114e4583bb Mukesh Rathor 2025-10-06  595  
cd0e114e4583bb Mukesh Rathor 2025-10-06  596  	rc = register_nmi_handler(NMI_LOCAL, hv_crash_nmi_local, NMI_FLAG_FIRST,
cd0e114e4583bb Mukesh Rathor 2025-10-06  597  				  "hv_crash_nmi");
cd0e114e4583bb Mukesh Rathor 2025-10-06  598  	if (rc) {
cd0e114e4583bb Mukesh Rathor 2025-10-06  599  		pr_err("Hyper-V: failed to register crash nmi handler\n");
cd0e114e4583bb Mukesh Rathor 2025-10-06  600  		return;
cd0e114e4583bb Mukesh Rathor 2025-10-06  601  	}
cd0e114e4583bb Mukesh Rathor 2025-10-06  602  
cd0e114e4583bb Mukesh Rathor 2025-10-06  603  	local_irq_save(flags);
cd0e114e4583bb Mukesh Rathor 2025-10-06  604  	input = *this_cpu_ptr(hyperv_pcpu_input_arg);
cd0e114e4583bb Mukesh Rathor 2025-10-06  605  	output = *this_cpu_ptr(hyperv_pcpu_output_arg);
cd0e114e4583bb Mukesh Rathor 2025-10-06  606  
cd0e114e4583bb Mukesh Rathor 2025-10-06  607  	memset(input, 0, sizeof(*input));
cd0e114e4583bb Mukesh Rathor 2025-10-06  608  	input->property_id = HV_SYSTEM_PROPERTY_CRASHDUMPAREA;
cd0e114e4583bb Mukesh Rathor 2025-10-06  609  
cd0e114e4583bb Mukesh Rathor 2025-10-06  610  	status = hv_do_hypercall(HVCALL_GET_SYSTEM_PROPERTY, input, output);
cd0e114e4583bb Mukesh Rathor 2025-10-06  611  	cda_info.as_uint64 = output->hv_cda_info.as_uint64;
cd0e114e4583bb Mukesh Rathor 2025-10-06  612  	local_irq_restore(flags);
cd0e114e4583bb Mukesh Rathor 2025-10-06  613  
cd0e114e4583bb Mukesh Rathor 2025-10-06  614  	if (!hv_result_success(status)) {
cd0e114e4583bb Mukesh Rathor 2025-10-06  615  		pr_err("Hyper-V: %s: property:%d %s\n", __func__,
cd0e114e4583bb Mukesh Rathor 2025-10-06  616  		       input->property_id, hv_result_to_string(status));
cd0e114e4583bb Mukesh Rathor 2025-10-06  617  		goto err_out;
cd0e114e4583bb Mukesh Rathor 2025-10-06  618  	}
cd0e114e4583bb Mukesh Rathor 2025-10-06  619  
cd0e114e4583bb Mukesh Rathor 2025-10-06  620  	if (cda_info.base_pfn == 0) {
cd0e114e4583bb Mukesh Rathor 2025-10-06  621  		pr_err("Hyper-V: hypervisor crash dump area pfn is 0\n");
cd0e114e4583bb Mukesh Rathor 2025-10-06  622  		goto err_out;
cd0e114e4583bb Mukesh Rathor 2025-10-06  623  	}
cd0e114e4583bb Mukesh Rathor 2025-10-06  624  
cd0e114e4583bb Mukesh Rathor 2025-10-06  625  	hv_cda = phys_to_virt(cda_info.base_pfn << HV_HYP_PAGE_SHIFT);
cd0e114e4583bb Mukesh Rathor 2025-10-06  626  
cd0e114e4583bb Mukesh Rathor 2025-10-06  627  	rc = hv_crash_trampoline_setup();
cd0e114e4583bb Mukesh Rathor 2025-10-06  628  	if (rc)
cd0e114e4583bb Mukesh Rathor 2025-10-06  629  		goto err_out;
cd0e114e4583bb Mukesh Rathor 2025-10-06  630  
cd0e114e4583bb Mukesh Rathor 2025-10-06 @631  	smp_ops.crash_stop_other_cpus = hv_crash_stop_other_cpus;

:::::: The code at line 631 was first introduced by commit
:::::: cd0e114e4583bb2146c9e3d95c036fddde8d4bb7 x86/hyperv: Implement hypervisor RAM collection into vmcore

:::::: TO: Mukesh Rathor <mrathor@linux.microsoft.com>
:::::: CC: Wei Liu <wei.liu@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
