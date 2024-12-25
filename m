Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5A61804E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Dec 2024 06:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735109942; cv=none; b=epQHzXpTbt9/tZy5wsU+RNFcdjFSAKSb4rgmu0hXoZKmF6K1aDtSG4Li3JiLNCa4Jb1MYTywuKuvo5gaJaJ2Qz1dcTAiCWiw6fuFoyEQHZflmHIwYxleZtWvdPSoPhW8loQLD/dpAok6HdrDIVLGEdGO0ACcL7bT8Pbl3QUV1G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735109942; c=relaxed/simple;
	bh=dc56Ywip/DMIX6/EPHpIi0PcfLdtCDAuaSt717NQ5iM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ngO9Fe6FQFUu42uhv4E6Ps+2dVv16VQDWvLjWUlcTabnVTLAnyaF/ofZEkjxut8mcsizZn4SABh3W9kyUYEkJvlkWYktmcdZr4zoJSjpdYl5OsWZgf/j9JtbIXzWlAX9SREJFZ89O6+ejsYQwuggZYzIWU3J8EZ0wCeAlGvQ3PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kwlhJ/Tm; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kwlhJ/Tm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735109941; x=1766645941;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dc56Ywip/DMIX6/EPHpIi0PcfLdtCDAuaSt717NQ5iM=;
  b=kwlhJ/TmgsEPhgJiPad5vpImCYR9goEe6IvWLzrvpgCiRVhXZsMmuZGN
   nOMw4MkLG4+d5hWoSpkOg3FVbBHj4zKSK4DqZZw5o6JrkAvSxftXrwIIl
   ZAs1bmsw1xFvDYlXi+rLMLq1uy0Bklgf+Zrn3MXYCYeBC5Vi9PsA//pJ/
   yEXDyTxd4sdiszEacI5LRldbCI1Ae12/bw1VNmM9avFfokYfRU1r80ZLK
   p/ZV4rVnNADmOLldSiwk2bsZSYYxIUKnEtUDOLQ6NNlhbqXvFgrGGX3gi
   N9DOhkoeTqZL1mmKqqKhSPF4tEVko53sbWn98o2oAJ++ToSM3fRBK8HRJ
   Q==;
X-CSE-ConnectionGUID: +sIiNJZkRdmAeT0izP9OFg==
X-CSE-MsgGUID: qmTRQ1L0QIKfBbLGcoR6Ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="34870428"
X-IronPort-AV: E=Sophos;i="6.12,262,1728975600"; 
   d="scan'208";a="34870428"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 22:59:00 -0800
X-CSE-ConnectionGUID: nD9yoHNrQXmvAuTXH4oXMA==
X-CSE-MsgGUID: +4nr8cAnQPit2qi+g346dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100482439"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 24 Dec 2024 22:58:58 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQLM5-0001mQ-1l;
	Wed, 25 Dec 2024 06:58:53 +0000
Date: Wed, 25 Dec 2024 14:58:43 +0800
From: kernel test robot <lkp@intel.com>
To: "Kooran Paul, Princy" <princy.kooran.paul@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Junxiao Chang <junxiao.chang@intel.com>,
	Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [intel-lts:6.12/linux 0/1]
 drivers/gpu/drm/i915/gt/iov/intel_iov_query.c:523:25: error: variable
 'vf_regs' set but not used
Message-ID: <202412251451.hcEDTigf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.12/linux
head:   af28adffb0fe876a7f6b55f145e6cae4861209a9
commit: d1d592bf75f7753518169d36bcc2dd9d196e27e3 [0/1] drm/i915: SR-IOV Enabling and Support
config: x86_64-buildonly-randconfig-005-20241225 (https://download.01.org/0day-ci/archive/20241225/202412251451.hcEDTigf-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241225/202412251451.hcEDTigf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412251451.hcEDTigf-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/gt/iov/intel_iov_query.c:17:
   In file included from drivers/gpu/drm/i915/gt/uc/intel_guc_print.h:9:
   In file included from drivers/gpu/drm/i915/gt/intel_gt.h:9:
   In file included from drivers/gpu/drm/i915/gt/intel_engine_types.h:21:
   In file included from drivers/gpu/drm/i915/i915_pmu.h:11:
   In file included from include/linux/perf_event.h:18:
   In file included from include/uapi/linux/bpf_perf_event.h:11:
   In file included from ./arch/x86/include/generated/uapi/asm/bpf_perf_event.h:1:
   In file included from include/uapi/asm-generic/bpf_perf_event.h:4:
   In file included from include/linux/ptrace.h:10:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/gpu/drm/i915/gt/iov/intel_iov_query.c:523:25: error: variable 'vf_regs' set but not used [-Werror,-Wunused-but-set-variable]
     523 |         struct vf_runtime_reg *vf_regs = iov->vf.runtime.regs;
         |                                ^
   2 errors generated.


vim +/vf_regs +523 drivers/gpu/drm/i915/gt/iov/intel_iov_query.c

   520	
   521	static void vf_show_runtime_info(struct intel_iov *iov)
   522	{
 > 523		struct vf_runtime_reg *vf_regs = iov->vf.runtime.regs;
   524		unsigned int size = iov->vf.runtime.regs_size;
   525	
   526		GEM_BUG_ON(!intel_iov_is_vf(iov));
   527	
   528		for (; size--; vf_regs++) {
   529			IOV_DEBUG(iov, "RUNTIME reg[%#x] = %#x\n",
   530				  vf_regs->offset, vf_regs->value);
   531		}
   532	}
   533	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
