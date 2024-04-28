Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F1D10E3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Apr 2024 02:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714271346; cv=none; b=u5H5hL/YhbNcu5GyuDBeLqiug3DbqHgLASuY/pmWDmERHcNta8Q4Ax1Xj/7s8y61jK0dkbxrJPYmazhGrzqlj92P0stLOmbs+Msl+ajQgpHbea7kYVqzCpGKzuahsGM29NKIcWqQc04o89oi/JfWwCtknaqtC4cYy4Pa/X4kOy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714271346; c=relaxed/simple;
	bh=AG5XTikbCp7Fww3q0yvwcUtBBeAEv9bGYFYLe1EFZHg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kq9pBKh8gxJIVbyf6Kk1OMi0Fe7tiONa5KW9Mg3kAO6by8p7rknNdQQ0Z3D55UU6btC5GmbpE7LSftNHp/pF7bzoOBew6o7B6LdcGdmIArVS7tGKGFY5Fk2M+h3TVU3YlL6K4/Cu0g9fXirMLY2iAOZAw8G1khlefjxKeNvk5qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TEXRbvKZ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TEXRbvKZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714271345; x=1745807345;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AG5XTikbCp7Fww3q0yvwcUtBBeAEv9bGYFYLe1EFZHg=;
  b=TEXRbvKZS6gWPvUt/FhO9ZFGozj4ScfEq3YFhPrjBlXVqVrZgikrIVb/
   NT+symxFfE6bnavjmznvsNABjh19W0KaLc9P8z/1ptSnSU69zQ5dcz7k5
   Ajrp3wqc7ZNIAOHQzYk9ocRJajkcMpYoltwup+mNbYkTyQXAmTnZ3iIY8
   WkeWZmiEJOXd7x1PUgcOT0C7knZsvjpyE22n8q0BQMZvFsgZ1jZCifvw1
   HY8WVKmiZ7WsycyOQYQ82o+pBlijFzz/9sicZIBqT34b3mCpSHd4RZRhY
   lYA/NoIcJq1FGG92dG4dLuMgGj0r1EU46ZwVb1Eif7sej2j6eALgZzqW2
   g==;
X-CSE-ConnectionGUID: acKjrBdXRime4OYreV1qhQ==
X-CSE-MsgGUID: Am7zmR59TrqxjXWQBJC+Ag==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="20652755"
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="20652755"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 19:29:04 -0700
X-CSE-ConnectionGUID: 866vqvmASEW4sClamnC0Yg==
X-CSE-MsgGUID: chOGK3HHR7iED0YncsOteA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="25758186"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Apr 2024 19:29:03 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0uHk-0005lM-2B;
	Sun, 28 Apr 2024 02:29:00 +0000
Date: Sun, 28 Apr 2024 10:28:04 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/sched_in_cleanup 2/3] arch/x86/kvm/svm/svm.c:1546:25:
 warning: unused variable 'sa'
Message-ID: <202404281007.s4Kg7sNr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/sched_in_cleanup
head:   f857e355f9536935b6c96bf389119576043aeb75
commit: 833d3234e0b64c433eb900b0eb62cee8131e5c43 [2/3] KVM: x86: Fold kvm_arch_sched_in() into kvm_arch_vcpu_load()
config: x86_64-randconfig-161-20240428 (https://download.01.org/0day-ci/archive/20240428/202404281007.s4Kg7sNr-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404281007.s4Kg7sNr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404281007.s4Kg7sNr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/svm/svm.c:1546:25: warning: unused variable 'sa' [-Wunused-variable]
    1546 |         struct vmcb_save_area *sa = page_address(sd->save_area);
         |                                ^~
   1 warning generated.


vim +/sa +1546 arch/x86/kvm/svm/svm.c

  1541	
  1542	static void svm_vcpu_load(struct kvm_vcpu *vcpu, int cpu, bool sched_in)
  1543	{
  1544		struct vcpu_svm *svm = to_svm(vcpu);
  1545		struct svm_cpu_data *sd = per_cpu_ptr(&svm_data, cpu);
> 1546		struct vmcb_save_area *sa = page_address(sd->save_area);
  1547	
  1548		if (sched_in && !kvm_pause_in_guest(vcpu->kvm))
  1549			shrink_ple_window(vcpu);
  1550	
  1551		if (sd->current_vmcb != svm->vmcb) {
  1552			sd->current_vmcb = svm->vmcb;
  1553	
  1554			if (!cpu_feature_enabled(X86_FEATURE_IBPB_ON_VMEXIT))
  1555				indirect_branch_prediction_barrier();
  1556		}
  1557		if (kvm_vcpu_apicv_active(vcpu))
  1558			avic_vcpu_load(vcpu, cpu);
  1559	}
  1560	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
