Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0623418FC75
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jul 2024 14:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722351526; cv=none; b=VO/mSSw8JkiF215EvMyDYWhy2U9Uhf8FZED2Teluqu+jYDKahYxMPEF5rCeFqRZMYzS/QLeKcm/Ftg6f8t/iFWp7oMAmCBOfUxDAG7dUvxirMYLYcSb3hyL6BYrGPbQtXM2cpdNS+su71ILpzpBsmiiTbedW7M4/Bbu8K2pE58U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722351526; c=relaxed/simple;
	bh=exS7BBg29bkfLm6pyKyjd39sKyvi6XSARHn2U0LYNfU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L4hoY3rj+/VPIP7UxF/TtlIZYMdIFGEksRck/OhPNJdEVOxiLouBe1xcqkrITrq9YYek8XFG1Uy235UvULMqdV4sMXwDGY0blCROoT777J5ECBLZVvMDrYsX0Jrj/OVmBDDa/4/ZrO9EcsWs4X4fp9wa5f/Uww9ouSV5zk5a85I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A+Qwhsvz; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A+Qwhsvz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722351525; x=1753887525;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=exS7BBg29bkfLm6pyKyjd39sKyvi6XSARHn2U0LYNfU=;
  b=A+Qwhsvzr2CSfk4dWyoj8pGEUPjJ2fl5qDUXqPKYATj5teUHsp9REqtH
   2TdPchZLfT0nLyl8ZsDSX0zXvtnUAkWSXziNXcOgznEbpdFRPxKjFG25e
   hrvtXdNsc/cJwhxNt+lIQCcjOMHQKkob/HNEf1JU7NCoCknCUT7M1bs3c
   PkDeShc8S9gc5omE535JcD72h4mRMd9Gx2VWpUNT3aChDq0idNHrjYvhT
   nxB57JrnW3CrexXD9q8LxeCxhg73ZyiIDZRS+rf72ytX13q1Hkk35oBlM
   zfO8X+RtQtRB0hhx09njCNfc7vmCGh+ySvODz0Bk+CnA9CNTYv/zJvHYs
   Q==;
X-CSE-ConnectionGUID: qd+FhM4wQA+vfzr/hby5Qg==
X-CSE-MsgGUID: W/cs868+RyeJp/Z3H4l3yQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="20057609"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="20057609"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 07:58:44 -0700
X-CSE-ConnectionGUID: 1dY9SUdrRCazXdk2IfUBwQ==
X-CSE-MsgGUID: cs2cnwwFRKOZphzCH9lnsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="59157201"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 30 Jul 2024 07:58:43 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYoJE-000syp-2T;
	Tue, 30 Jul 2024 14:58:40 +0000
Date: Tue, 30 Jul 2024 22:58:20 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/fastpath_pi_nv 2/2] arch/x86/kvm/svm/svm.c:4147:46:
 error: expected ';' before 'if'
Message-ID: <202407302211.4Yvj6Tnj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/fastpath_pi_nv
head:   b2746b169a9de85ccd1760906aadedd71e30497d
commit: b2746b169a9de85ccd1760906aadedd71e30497d [2/2] KVM: x86: Add a fastpath HLT handler
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240730/202407302211.4Yvj6Tnj-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240730/202407302211.4Yvj6Tnj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407302211.4Yvj6Tnj-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/x86/kvm/svm/svm.c: In function 'svm_exit_handlers_fastpath':
>> arch/x86/kvm/svm/svm.c:4147:36: warning: value computed is not used [-Wunused-value]
    4147 |         to_svm(vcpu)->vmcb->control.exit_code
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
>> arch/x86/kvm/svm/svm.c:4147:46: error: expected ';' before 'if'
    4147 |         to_svm(vcpu)->vmcb->control.exit_code
         |                                              ^
         |                                              ;
    4148 |         if (is_guest_mode(vcpu))
         |         ~~                                    
>> arch/x86/kvm/svm/svm.c:4151:13: error: 'exit_code' undeclared (first use in this function); did you mean 'exit_creds'?
    4151 |         if (exit_code == SVM_EXIT_MSR &&
         |             ^~~~~~~~~
         |             exit_creds
   arch/x86/kvm/svm/svm.c:4151:13: note: each undeclared identifier is reported only once for each function it appears in


vim +4147 arch/x86/kvm/svm/svm.c

  4144	
  4145	static fastpath_t svm_exit_handlers_fastpath(struct kvm_vcpu *vcpu)
  4146	{
> 4147		to_svm(vcpu)->vmcb->control.exit_code
  4148		if (is_guest_mode(vcpu))
  4149			return EXIT_FASTPATH_NONE;
  4150	
> 4151		if (exit_code == SVM_EXIT_MSR &&
  4152		    to_svm(vcpu)->vmcb->control.exit_info_1)
  4153			return handle_fastpath_set_msr_irqoff(vcpu);
  4154	
  4155		if (exit_code == SVM_EXIT_HLT)
  4156			return handle_fastpath_hlt(vcpu);
  4157	
  4158		return EXIT_FASTPATH_NONE;
  4159	}
  4160	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
