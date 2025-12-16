Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4A5314A7E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 04:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765858280; cv=none; b=I3wAJ4qLJ/sWeRzS+XHr0+BNswV9Uy+1DBN2haKHJ5z85ADpFiAN2d6fcZ/V9F8zHLC30K+V0Fogag7p+8jsv5n7ZukfOAm7l3wm3JjynToT9C/0aOf6+Bj9R/ObxYSQ+6D3sckBLmEZDR1OkFZ4kxgJT0lMzkBNFOVZhiGVH0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765858280; c=relaxed/simple;
	bh=5MAQov5ZrWqWKIcs2pi7x8RXdSH88yl2XqAplQS84ww=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q8nPtntVuFWTjSiyfrDsHPq31Xzrrsq4IcFY4jx6L2Ub7BvECkbt7UvacULMAHaBgEWRPOIkzABKlmm3gMo6i6izUL0f08L032HdorVijhyWy6EvTc/3C5Xrdj8sVvHoDOAGEt6twhHFOmmnuMV6gsyfAyUEFJ9tfrTSb7vmrIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H6Prsyh7; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H6Prsyh7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765858268; x=1797394268;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5MAQov5ZrWqWKIcs2pi7x8RXdSH88yl2XqAplQS84ww=;
  b=H6Prsyh7VNmwcvWgOhA5CcIjLj+KcWg5tmTXZqgG6L7XGUQKRuLqR11a
   7bj6RGxljz+Kbpx0L0F7vDveKtfcDUiGUuLFgFLy5PGuMDaDolY/oXUer
   5C9ohkmx3VtHY7YFUZgLs5vh5lTqswY9W+CVM0gPv4o+JMOB0eyOzjyE5
   OFcN93vYDm/+6x38ETBnyDI/16r7rWTaIQFllOCYghnqRysEemu5gayAO
   q4M64zBDXDIzzrhOqJL/fQ2DYsiS+nS9EBKBVDSICDQ/vyxown/Fv1Pen
   p6SBDVLObne4BCZ9NsEpVlzPSNXWEhKyGKgPA38q6IZf9dZH5PMPAHIPU
   Q==;
X-CSE-ConnectionGUID: 0SGZEYhJSDKr+3JO4LsTdQ==
X-CSE-MsgGUID: iszXhrEaSGqbiwp6J9uFGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67648747"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="67648747"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 20:11:06 -0800
X-CSE-ConnectionGUID: 60X8DGjRS1iexXyJdn3GRw==
X-CSE-MsgGUID: gTiZZc0RTfWUcTULOD8mAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="196999872"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 15 Dec 2025 20:11:05 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVMOs-00000000193-4AdG;
	Tue, 16 Dec 2025 04:11:02 +0000
Date: Tue, 16 Dec 2025 12:10:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 drivers/virt/gunyah/gunyah_vcpu.c:52: warning: Incorrect use of kernel-doc
 format:          * Track why the vcpu_run hypercall returned. This mirrors
 the vcpu_run
Message-ID: <202512161239.1rqq4P2D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Elliot,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   e48fbb6a53e582d8881d31d6b3de0405f7543cfd
commit: 26bfa9e2b93d8e270470dc39e9ee4cc66940c63d [2/2] FROMLIST: virt: gunyah: Add proxy-scheduled vCPUs
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251216/202512161239.1rqq4P2D-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512161239.1rqq4P2D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512161239.1rqq4P2D-lkp@intel.com/

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
