Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EEC210E4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 May 2024 04:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716265092; cv=none; b=aqKHJ9P1YeGK7zxjM2F/K9cdK8Uy1FE1T6E01p5ctcMdkL26rSP8wGFT8FZgkOZdimLqj9Lz8Q6CUcQTwsYtDg3nZvKevWMtb/3UCgAsZDLx6P2Tp7m6As9iHRwnqOMrO0quJJ9CO/1arJwaLfAZrPM7c+cyoUwpkpTmurh5pJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716265092; c=relaxed/simple;
	bh=rH0GRZILIkx6tPa/+RbJ/fky0LqZwiF4dfFsFVVMzO8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y7tbZc7WTi2FGduLjKLK+5futjlacxD7n4ljU9HfKHsIIGj2Tqub9ORObHjq91ic+H4w7BQreIjid6t40PiroeeN4F06MAkVF/dvEtEbQxXrnS78FhugpOyJ9jErQDuro8Slwj40/Olm0b0YHAVmJFo3KmnC5ShV7rVlWz8LOBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EMXMWAwL; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EMXMWAwL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716265091; x=1747801091;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rH0GRZILIkx6tPa/+RbJ/fky0LqZwiF4dfFsFVVMzO8=;
  b=EMXMWAwLoSasiZyQWcFD3W0x9DymjXquN2wM5MmJxXR+okPDuf+Slaaz
   PCG+l7feBAIM58KBwuGeCenJXIfGCmvin1TPPh/NDR9txjktt8cVeTZUx
   BlaTOpnq6oxQlBGdqQy0yUcfnV5qBt4Prv7mffhytdoo+Vno6G0ZdNqwF
   5tB5RzMf85yQboA9VGvNbGBT/VWNRthx5eHvDCCxHZckniwQoN0foDAUL
   x14+tWqpJ1Ale29/CSK4NPPhcylMhqdTno5X8alda6egb1t7z4fmw7q/W
   6PfItwG6uUX+ltheZm3dplDKiAintpXt6CfmGyfmsoowUe9wUb+NvgGL+
   w==;
X-CSE-ConnectionGUID: 1i57N49jRH6AUcDLjwLDvQ==
X-CSE-MsgGUID: M5IRTK+ZR9ect6Fkv6JIkg==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="16260157"
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; 
   d="scan'208";a="16260157"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 21:18:10 -0700
X-CSE-ConnectionGUID: 9pBWDwziQpycQ//9j6Oaiw==
X-CSE-MsgGUID: PFx4Bn1tSiuC+4GdE1YEfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; 
   d="scan'208";a="37722556"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 20 May 2024 21:18:09 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9Gww-0005eW-2R;
	Tue, 21 May 2024 04:18:06 +0000
Date: Tue, 21 May 2024 12:17:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 18/44]
 drivers/virt/gunyah/gunyah_vcpu.c:52: warning: Incorrect use of kernel-doc
 format:          * Track why the vcpu_run hypercall returned. This mirrors
 the vcpu_run
Message-ID: <202405211249.wScmhOPT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   833aa73663421306198d4b3ea83ef44087c9fe19
commit: 26bfa9e2b93d8e270470dc39e9ee4cc66940c63d [18/44] FROMLIST: virt: gunyah: Add proxy-scheduled vCPUs
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240521/202405211249.wScmhOPT-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project fa9b1be45088dce1e4b602d451f118128b94237b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240521/202405211249.wScmhOPT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405211249.wScmhOPT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/virt/gunyah/gunyah_vcpu.c:52: warning: Incorrect use of kernel-doc format:          * Track why the vcpu_run hypercall returned. This mirrors the vcpu_run


vim +52 drivers/virt/gunyah/gunyah_vcpu.c

    21	
    22	/**
    23	 * struct gunyah_vcpu - Track an instance of gunyah vCPU
    24	 * @f: Function instance (how we get associated with the main VM)
    25	 * @rsc: Pointer to the Gunyah vCPU resource, will be NULL until VM starts
    26	 * @run_lock: One userspace thread at a time should run the vCPU
    27	 * @ghvm: Pointer to the main VM struct; quicker look up than going through
    28	 *        @f->ghvm
    29	 * @vcpu_run: Pointer to page shared with userspace to communicate vCPU state
    30	 * @state: Our copy of the state of the vCPU, since userspace could trick
    31	 *         kernel to behave incorrectly if we relied on @vcpu_run
    32	 * @mmio_read_len: Our copy of @vcpu_run->mmio.len; see also @state
    33	 * @mmio_addr: Our copy of @vcpu_run->mmio.phys_addr; see also @state
    34	 * @ready: if vCPU goes to sleep, hypervisor reports to us that it's sleeping
    35	 *         and will signal interrupt (from @rsc) when it's time to wake up.
    36	 *         This completion signals that we can run vCPU again.
    37	 * @nb: When VM exits, the status of VM is reported via @vcpu_run->status.
    38	 *      We need to track overall VM status, and the nb gives us the updates from
    39	 *      Resource Manager.
    40	 * @ticket: resource ticket to claim vCPU# for the VM
    41	 * @kref: Reference counter
    42	 */
    43	struct gunyah_vcpu {
    44		struct gunyah_vm_function_instance *f;
    45		struct gunyah_resource *rsc;
    46		struct mutex run_lock;
    47		struct gunyah_vm *ghvm;
    48	
    49		struct gunyah_vcpu_run *vcpu_run;
    50	
    51		/**
  > 52		 * Track why the vcpu_run hypercall returned. This mirrors the vcpu_run
    53		 * structure shared with userspace, except is used internally to avoid
    54		 * trusting userspace to not modify the vcpu_run structure.
    55		 */
    56		enum {
    57			GUNYAH_VCPU_RUN_STATE_UNKNOWN = 0,
    58			GUNYAH_VCPU_RUN_STATE_READY,
    59			GUNYAH_VCPU_RUN_STATE_MMIO_READ,
    60			GUNYAH_VCPU_RUN_STATE_MMIO_WRITE,
    61			GUNYAH_VCPU_RUN_STATE_SYSTEM_DOWN,
    62		} state;
    63		u8 mmio_read_len;
    64		u64 mmio_addr;
    65	
    66		struct completion ready;
    67	
    68		struct notifier_block nb;
    69		struct gunyah_vm_resource_ticket ticket;
    70		struct kref kref;
    71	};
    72	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
