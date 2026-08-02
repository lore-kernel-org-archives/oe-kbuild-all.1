Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05B829C35A
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Aug 2026 22:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785709632; cv=none; b=gtf0mekwpaKlg55AgPC48TWE2k1jCzWtnKjkYqw8fWUqtYt3HTnabpvlQCMKYiznt6ZoY9UOa9zEStmlVmnkYZAvqXdoDtrR8nXu5s6YUQu1Af9/Lbrvgf8zkbKXp1cjh8Z1egfUJHj/+2K/A3FxTOfbBvWpQl8hsBYBNShUdf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785709632; c=relaxed/simple;
	bh=ORspprpyv8VxUf0X6zEKUGmda84NZi4zFuevuriDZh4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YVC7rE31SHxpQPfiv5H7K9o/0TTsND0Ovod/LrB2NwGsOsdsrCLwP23CjrXRhhQa2OYsFwcMH5F8DP+gqN4sH+kObcC2Y+SMCKawFNFOxWxvfa0PLkBHSt0vhkfNH3cXY/OJPpxxkMQvlIjgUCkAfAs8O+8KGSX5ScB+JjOdvpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FsdjXRVZ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FsdjXRVZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785709630; x=1817245630;
  h=date:from:to:cc:subject:message-id;
  bh=ORspprpyv8VxUf0X6zEKUGmda84NZi4zFuevuriDZh4=;
  b=FsdjXRVZ/f/iTg2DvEn6zZ03Z8GR3kUmGCjnXC9PAcvqOpKbN24I6Vqa
   /8VyTt4uQNLI+S5seap6uNJmjV82Y7TM/9dx0UbOlcp1F+0ZlqfdS12FA
   i7k4WG/QR/3LP8yJxxFN/NiEMTb21nAAXJiI8XzY5LEPiD+0lPTatLkRN
   JUfLpY4JDS0zkfXx4/IXaTN7Al4oU99da8+T+e/XN4TAJsX3fNeROJxmw
   K8StcncqkCcx57da6CH1yi8pUTrzPQlFCUXmiKUnFXSF5+bhR7YsjHFR9
   5Sh+8Gjet4CMHaN/3NF1Mox3nvfxSEAR5lmCTX2R2YxHG3uheP9B5ODom
   g==;
X-CSE-ConnectionGUID: EHbeGXMjQs22ZlXx0h7UlQ==
X-CSE-MsgGUID: 3gYwwwKAT4WE3kgUIw1pDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="97409004"
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; 
   d="scan'208";a="97409004"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2026 15:27:09 -0700
X-CSE-ConnectionGUID: mIf5r6QSQwOpa5uUT35zgA==
X-CSE-MsgGUID: FyFKJMmIRKCCD+6ta33TwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; 
   d="scan'208";a="299291175"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 02 Aug 2026 15:27:08 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqee9-000000005bj-1w0R;
	Sun, 02 Aug 2026 22:27:05 +0000
Date: Mon, 03 Aug 2026 06:26:20 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Machhiwal <amachhiw@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>,
 "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [linuxppc:merge-test 6/19]
 arch/powerpc/kvm/powerpc.c:262:19: error: dereferencing pointer to incomplete
 type 'struct kvmppc_vcore'
Message-ID: <202608030623.cXr4111l-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/linuxppc/linux merge-test
head:   f5ee8a918bf98d0bb46b91ffbb4283a64f17c3fd
commit: a7452640914469676b5fcffee80ee045525bddb8 [6/19] KVM: PPC: Book3S HV: Validate arch_compat against host compatibility mode
config: powerpc64-randconfig-002-20260803 (https://download.01.org/0day-ci/archive/20260803/202608030623.cXr4111l-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260803/202608030623.cXr4111l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608030623.cXr4111l-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/kvm/powerpc.c: In function 'kvmppc_sanity_check':
>> arch/powerpc/kvm/powerpc.c:262:19: error: dereferencing pointer to incomplete type 'struct kvmppc_vcore'
      vcpu->arch.vcore->arch_compat == PVR_ARCH_INVALID)
                      ^~


vim +262 arch/powerpc/kvm/powerpc.c

   252	
   253	int kvmppc_sanity_check(struct kvm_vcpu *vcpu)
   254	{
   255		int r = false;
   256	
   257		/* We have to know what CPU to virtualize */
   258		if (!vcpu->arch.pvr)
   259			goto out;
   260	
   261		if (vcpu->arch.vcore &&
 > 262			vcpu->arch.vcore->arch_compat == PVR_ARCH_INVALID)
   263			goto out;
   264	
   265		/* PAPR only works with book3s_64 */
   266		if ((vcpu->arch.cpu_type != KVM_CPU_3S_64) && vcpu->arch.papr_enabled)
   267			goto out;
   268	
   269		/* HV KVM can only do PAPR mode for now */
   270		if (!vcpu->arch.papr_enabled && is_kvmppc_hv_enabled(vcpu->kvm))
   271			goto out;
   272	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
