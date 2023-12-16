Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6D4186B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Dec 2023 09:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PnkNnmb0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702717250; x=1734253250;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J/l/3LY6ygO68cQm4iom2Ezbc747pOTS/BrMv4X9KoQ=;
  b=PnkNnmb0PmpcyDzdbsjyfy1s+4LPkZbJQ7/wRFgAmm/IQNgTF/SWpRP3
   +VDTB7Luf+tusa+QJvVTk54MqGde+V6/CjqMpNgUEXt94Mp4O5ctQbwdx
   vvzHUY1xpXNdIuHtcH9w0SXdmbSkJJo7W8Fcx5tqabxMVdRG7etQhbZTu
   mgbNQ/1ocDSM0HGxKkXYuUxwJkyuLBySKn9GTtwHbmYDv829dRqs6TCHb
   ujhEcbQKRJSiHzbBWFBvXl7vJDSWls/952sAQvzXDyuk9DAquPzoqp0/J
   lMwEOIsGzAKVLbQGUK/VVnDviMQYgMjcAIVuUJ1C+AhFnRu+yiVS3uHtN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="374866222"
X-IronPort-AV: E=Sophos;i="6.04,281,1695711600"; 
   d="scan'208";a="374866222"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 01:00:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="809241450"
X-IronPort-AV: E=Sophos;i="6.04,281,1695711600"; 
   d="scan'208";a="809241450"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 16 Dec 2023 01:00:47 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEQXM-0001MA-2r;
	Sat, 16 Dec 2023 09:00:44 +0000
Date: Sat, 16 Dec 2023 17:00:37 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>
Subject: [linux-next:master 6145/8213] arch/s390/kvm/kvm-s390.c:4315:5-8:
 Unneeded variable: "ret". Return "  0" on line 4327
Message-ID: <202312161632.vbRyBScY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   17cb8a20bde66a520a2ca7aad1063e1ce7382240
commit: b988b1bb0053c0dcd26187d29ef07566a565cf55 [6145/8213] KVM: s390: fix setting of fpc register
config: s390-randconfig-r053-20231216 (https://download.01.org/0day-ci/archive/20231216/202312161632.vbRyBScY-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312161632.vbRyBScY-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/s390/kvm/kvm-s390.c:4315:5-8: Unneeded variable: "ret". Return "  0" on line 4327

vim +4315 arch/s390/kvm/kvm-s390.c

b0c632db637d68 Heiko Carstens        2008-03-25  4312  
b0c632db637d68 Heiko Carstens        2008-03-25  4313  int kvm_arch_vcpu_ioctl_set_fpu(struct kvm_vcpu *vcpu, struct kvm_fpu *fpu)
b0c632db637d68 Heiko Carstens        2008-03-25  4314  {
6a96bc7fa0cdd9 Christoffer Dall      2017-12-04 @4315  	int ret = 0;
6a96bc7fa0cdd9 Christoffer Dall      2017-12-04  4316  
6a96bc7fa0cdd9 Christoffer Dall      2017-12-04  4317  	vcpu_load(vcpu);
6a96bc7fa0cdd9 Christoffer Dall      2017-12-04  4318  
e1788bb995befe Christian Borntraeger 2016-11-22  4319  	vcpu->run->s.regs.fpc = fpu->fpc;
9abc2a08a7d665 David Hildenbrand     2016-01-14  4320  	if (MACHINE_HAS_VX)
a7d4b8f2565ad0 David Hildenbrand     2016-08-16  4321  		convert_fp_to_vx((__vector128 *) vcpu->run->s.regs.vrs,
a7d4b8f2565ad0 David Hildenbrand     2016-08-16  4322  				 (freg_t *) fpu->fprs);
9abc2a08a7d665 David Hildenbrand     2016-01-14  4323  	else
a7d4b8f2565ad0 David Hildenbrand     2016-08-16  4324  		memcpy(vcpu->run->s.regs.fprs, &fpu->fprs, sizeof(fpu->fprs));
6a96bc7fa0cdd9 Christoffer Dall      2017-12-04  4325  
6a96bc7fa0cdd9 Christoffer Dall      2017-12-04  4326  	vcpu_put(vcpu);
6a96bc7fa0cdd9 Christoffer Dall      2017-12-04 @4327  	return ret;
b0c632db637d68 Heiko Carstens        2008-03-25  4328  }
b0c632db637d68 Heiko Carstens        2008-03-25  4329  

:::::: The code at line 4315 was first introduced by commit
:::::: 6a96bc7fa0cdd96bac2b8298d708a94f8de6f6d4 KVM: Move vcpu_load to arch-specific kvm_arch_vcpu_ioctl_set_fpu

:::::: TO: Christoffer Dall <christoffer.dall@linaro.org>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
