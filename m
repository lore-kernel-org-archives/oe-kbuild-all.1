Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253EF70809
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 06:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774420375; cv=none; b=HIK5JwRFdAJm7uDKY26hc8IRMuN2zUiBNI6E9azgxbdPhQbMqODIHdHFt96kLyMZqxJwN0NGaqNVrdleKQUzQ8hi2Lf2odn50U0q5udUy+dEYU+zz+R+ZIVXWuRRORInZjC8Bgce357TuzF3Dn9bxkTbxQgfMtXJ1mPYSWXWOHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774420375; c=relaxed/simple;
	bh=YBbsUXIgPOz12j+HTNK0uXJyOPr7ppRxB1i7f4kuo5k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nTk6auu9OA2bYt2J1dk11eLOwZ1hKvOQD5kgD+GDsLHxlBkSSNx/uUOg16UZcYY9NAEkSU4dMWxsMWF1L0D/ynvah8q59Q5O+uibjDNL0Jf+Hu9gWsNhwrXU9N50OQAXr3YsVOJ14kskk9JQeEG6bWCoDMhrCKEx3BNa9ufZys4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hdGradjz; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hdGradjz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774420374; x=1805956374;
  h=date:from:to:cc:subject:message-id;
  bh=YBbsUXIgPOz12j+HTNK0uXJyOPr7ppRxB1i7f4kuo5k=;
  b=hdGradjzAHq8hHkfeJQ3Bk/A/DK5eITrvjnWdDPRcf6w9Ye9TWDiiK5m
   lhRHJHRVrVzS64OUaasq7Umiy9QmLnyAUPqky5zNogsxlF8BN/mKSiYuW
   85aTK/GqXbEc6j9dDubE9ybB+YDcDyEFkv+JpnytI1drdT9w6b2209Kph
   57cjw1PHkekPgZjrhlf52zTdsoyMN8vt5hJgr4qpNfuYY1XUiM/CkMmLn
   YzNXrVqm1gxwSc2itnSJLUMuuub++mmVQQUjTuSkmv5lWXffBbsQ8ur2G
   VeW65MoMYl2b68hu9uZwNZOIp3EFKfu+6k19PnTiRcjrX/CX8vBJcBgFV
   A==;
X-CSE-ConnectionGUID: K+6XjWBmReO2ndf3YHrrFA==
X-CSE-MsgGUID: y14AA9IQS4m20o10ZYGZ7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86823556"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="86823556"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 23:32:54 -0700
X-CSE-ConnectionGUID: VkE4SLR6QbG63m4AMJvpZA==
X-CSE-MsgGUID: eC0ScbHKQBO8SO6f8Us3ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="221261331"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 24 Mar 2026 23:32:52 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5HnO-000000006JH-0wXy;
	Wed, 25 Mar 2026 06:32:50 +0000
Date: Wed, 25 Mar 2026 14:32:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 drivers/virt/gunyah/gunyah_vcpu.c:52: warning: Incorrect use of kernel-doc
 format:          * Track why the vcpu_run hypercall returned. This mirrors
 the vcpu_run
Message-ID: <202603251407.fbxJaSgK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Elliot,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   36e33448be90aea3d2e98da271b35aac511b8dc6
commit: 26bfa9e2b93d8e270470dc39e9ee4cc66940c63d [1/1] FROMLIST: virt: gunyah: Add proxy-scheduled vCPUs
config: arm64-randconfig-r054-20260325 (https://download.01.org/0day-ci/archive/20260325/202603251407.fbxJaSgK-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603251407.fbxJaSgK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603251407.fbxJaSgK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/virt/gunyah/gunyah_vcpu.c:52: warning: Incorrect use of kernel-doc format:          * Track why the vcpu_run hypercall returned. This mirrors the vcpu_run

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]


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
