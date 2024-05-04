Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF09433C4
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 May 2024 18:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714847028; cv=none; b=NDX53KEVcnGR96Q+ImvwHs4WXgAdoiSkknjCKxewDrPuNWJ06eDuCZ8HeWA2Ihtt7zBTVJVSsmknJlRI8Nr8Fbc9LZ1pm8u+1us4XYNxG+8MfuGVbQeu0yNn1qUpjq8iwvlofoL4ZW8Pz0vZQhGmXTBGEf/ZiQlyn5lGmhYxWs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714847028; c=relaxed/simple;
	bh=vNFouF6oDBYW0xZWqdIzzfxr8WKy74IBQqD9FwtmuAg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DLJmoTWC2Mu6NLQHrEXZAGZxPi97q2+FkaPWcSt4BVPS+h0e/biKugtXUn2AcKo7RdY2cRYvC5zxmqeKRebZ2dXOZ/I5T38N8ocwnigxEm6vs+qUlZM+oeO7SKR9bamJ+Gv8MRbiBip2xw6VEimEklVv/l2J82XqolM5YdKoGgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ULjASV5B; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ULjASV5B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714847026; x=1746383026;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vNFouF6oDBYW0xZWqdIzzfxr8WKy74IBQqD9FwtmuAg=;
  b=ULjASV5B6MKg55w6EZFfNR+KfXQoDf02/RgVZvGC2XYVcsleHxzXcBPx
   SXuWQ9tlPoyE0otCy2ouAHfkuxKnbIfxQ3nBsp3iG/mufJQcb8kMUne/j
   /aBHIR7A5obKOi1J1z9meuVcxZCwjdek4YeQqE3iJNbaO4AE5+5BcGtcM
   geGrUlVIIXKm3cJDlN0NsQOjWGV1THkBBkDYK9h7pLiRKFUWPxsqMiijf
   O08Nfj02mL/SEN7nkvTyKffXyZMnAXqsea6XyAKenDfVhKKYQs8ltrYlQ
   S93Y4/UCizaHILhHV0SrPaJXP70z7JHotkRdpp4/xFL+kmB0B+/6S+13f
   g==;
X-CSE-ConnectionGUID: DjPmCM8CQUqGOAMqZpjcAA==
X-CSE-MsgGUID: y3VkhUDEREOrkwxOB7tpyQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="11171579"
X-IronPort-AV: E=Sophos;i="6.07,254,1708416000"; 
   d="scan'208";a="11171579"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2024 11:23:45 -0700
X-CSE-ConnectionGUID: H32UsUa4S9ezjUF2fiGfYQ==
X-CSE-MsgGUID: WBpBBBtuSRqO/0tVHSg6vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,254,1708416000"; 
   d="scan'208";a="28160451"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 04 May 2024 11:23:44 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3K2v-000D3s-2I;
	Sat, 04 May 2024 18:23:41 +0000
Date: Sun, 5 May 2024 02:23:00 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Graf <graf@amazon.com>
Cc: oe-kbuild-all@lists.linux.dev, kvm-ppc@vger.kernel.org
Subject: [agraf-2.6:kvm-kho-gmem-test 19/27]
 arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:4421:49: warning: 'struct
 kvm_s2_mmu' declared inside parameter list will not be visible outside of
 this definition or declaration
Message-ID: <202405050208.ErN5HQGM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/agraf/linux-2.6.git kvm-kho-gmem-test
head:   9a58862a298a63bad21d05191e28b857063bb9dc
commit: ea39f95803e6da8a46791922be3724b49bea2c7a [19/27] XXX make fdbox work
config: powerpc-powernv_defconfig (https://download.01.org/0day-ci/archive/20240505/202405050208.ErN5HQGM-lkp@intel.com/config)
compiler: powerpc64le-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240505/202405050208.ErN5HQGM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405050208.ErN5HQGM-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:4421:49: warning: 'struct kvm_s2_mmu' declared inside parameter list will not be visible outside of this definition or declaration
    4421 | int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigned long type);
         |                                                 ^~~~~~~~~~
   arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:4422:5: warning: no previous prototype for 'kvm_unwrap_file' [-Wmissing-prototypes]
    4422 | int kvm_unwrap_file(struct file *filp)
         |     ^~~~~~~~~~~~~~~
   arch/powerpc/kvm/../../../virt/kvm/kvm_main.c: In function 'kvm_unwrap_file':
   arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:4427:17: warning: statement with no effect [-Wunused-value]
    4427 |                 vcpu;
         |                 ^~~~
>> arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:4432:58: error: 'struct kvm_arch' has no member named 'mmu'
    4432 |                 ret = kvm_init_stage2_mmu(kvm, &kvm->arch.mmu, 0);
         |                                                          ^


vim +4421 arch/powerpc/kvm/../../../virt/kvm/kvm_main.c

  4417	
  4418	/* XXX hack for prototype. Needs to move into file ops */
  4419	static struct file_operations kvm_vm_fops;
  4420	/* XXX hack for prototype. Needs to live in arch code */
> 4421	int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigned long type);
  4422	int kvm_unwrap_file(struct file *filp)
  4423	{
  4424		int ret = 0;
  4425		if (filp->f_op == &kvm_vcpu_fops) {
  4426			struct kvm_vcpu *vcpu = filp->private_data;
  4427			vcpu;
  4428		} else if (filp->f_op == &kvm_vm_fops) {
  4429			struct kvm *kvm = filp->private_data;
  4430	
  4431			kvm->mm = current->mm;
> 4432			ret = kvm_init_stage2_mmu(kvm, &kvm->arch.mmu, 0);
  4433		} else {
  4434			ret = -EINVAL;
  4435		}
  4436	
  4437		return ret;
  4438	}
  4439	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
