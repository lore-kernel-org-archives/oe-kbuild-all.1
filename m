Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610BC2F49ED
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Oct 2025 20:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761165323; cv=none; b=Qc266sKJVH7hkLEwA3hn+VQnbhYpQUTHkqLYyIfKCXGHzGcRTdnUJVczgj45ONTXxrYiYqJBHdglbYF2xL3aY20xA658U/GxWIgi98WXf+5N90tPOkUrIZsa43n2oQiRmdOCLKBxMvL5+cNyeKQ8hy5IGnOoeiqrCwkOJOz4VNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761165323; c=relaxed/simple;
	bh=UVYE2m+dfTC8L+h8OkbpueMO00XTqC0cIJ5IUlC3jFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=clobE1c3QVOdJermIvhHbtPgnOtipe3EHRUtJubVO3Yq3iBzHbBHQ28peb+IGrEG/z1ZO7UHSJ6HIS4BlyQbcT8W5E+iySUhyERais4aFJGJ9lEAVCXZH3ZF1vR9oDjB816oXIEhy6vPzQbJPl+LphYL1+Psk3JoRgJeko034ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bMNd2+9P; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bMNd2+9P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761165321; x=1792701321;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UVYE2m+dfTC8L+h8OkbpueMO00XTqC0cIJ5IUlC3jFI=;
  b=bMNd2+9PjXWCl1gCSE8ydNU/bdOgcd/BnMIzy8E28Sx4ZcH+QOdPdfEf
   2qUjRwVS2fbzDFcUVglXvatC2Ol2tfo8MFaDiVvkNtITx5pn1GzvnBXk9
   NXcgkx3vKTLHowOWKZ4A3ConbD34Oh7iYAwzY8QfoZATkxSZjp4xOvGq9
   49MKLsF5VZlfg6SIRGagDnyr3rEmqpEQt0te1GnDsvnnzW3PVNVMhxoXo
   vIMPFhm3qY1etMWBDKHFygfop0hJsMuSjEDL1wYC3Kzz7AGaNwcmgdI9p
   SoKFv8jG++exP48XBvx2nqoA4zzEVw7KqRv8msnZumVDUlnYLGAHAVJpi
   g==;
X-CSE-ConnectionGUID: +KrxkzoxQnyFrQGH2PV7Hg==
X-CSE-MsgGUID: OZwvlia0Q7qVNb8hX94xjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62536146"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="62536146"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 13:35:21 -0700
X-CSE-ConnectionGUID: kwvg8BHhTeq3LPk10Ou7sg==
X-CSE-MsgGUID: hXOMDYU6RfmVGxNjnZQgDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="214906268"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 22 Oct 2025 13:35:17 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBfYB-000CiH-1x;
	Wed, 22 Oct 2025 20:35:15 +0000
Date: Thu, 23 Oct 2025 04:34:39 +0800
From: kernel test robot <lkp@intel.com>
To: Hui Min Mina Chou <minachou@andestech.com>, anup@brainfault.org,
	atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr
Cc: oe-kbuild-all@lists.linux.dev, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, tim609@andestech.com,
	minachou@andestech.com, ben717@andestech.com, az70021@gmail.com
Subject: Re: [PATCH v2] RISC-V: KVM: flush VS-stage TLB after VCPU migration
 to prevent stale entries
Message-ID: <202510230412.vKIvCmwU-lkp@intel.com>
References: <20251021083105.4029305-1-minachou@andestech.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021083105.4029305-1-minachou@andestech.com>

Hi Hui,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kvm/queue]
[also build test WARNING on kvm/next mst-vhost/linux-next linus/master v6.18-rc2 next-20251022]
[cannot apply to kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hui-Min-Mina-Chou/RISC-V-KVM-flush-VS-stage-TLB-after-VCPU-migration-to-prevent-stale-entries/20251021-163357
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20251021083105.4029305-1-minachou%40andestech.com
patch subject: [PATCH v2] RISC-V: KVM: flush VS-stage TLB after VCPU migration to prevent stale entries
config: riscv-randconfig-r072-20251023 (https://download.01.org/0day-ci/archive/20251023/202510230412.vKIvCmwU-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510230412.vKIvCmwU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510230412.vKIvCmwU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kvm/vmid.c:126:6: warning: no previous prototype for 'kvm_riscv_local_tlb_sanitize' [-Wmissing-prototypes]
     126 | void kvm_riscv_local_tlb_sanitize(struct kvm_vcpu *vcpu)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/kvm_riscv_local_tlb_sanitize +126 arch/riscv/kvm/vmid.c

   125	
 > 126	void kvm_riscv_local_tlb_sanitize(struct kvm_vcpu *vcpu)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
