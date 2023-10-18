Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5818E34CD7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 16:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HuCP9fW/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697645855; x=1729181855;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ugrz6Slk0eMj61Z+LmwmE5rpF91iwzPR+XzXlI0vKeE=;
  b=HuCP9fW/Z9dEr4xizRqAaGz9E5Mx8uOTwfuMPXNGgJVHCcEXS9AeoQ4h
   +EueInhwtP3R+pF1UMpEMEjTSO67kZjiCCy9sCN/6+sXyrUeWsg4ko4p2
   FnTDjXOvHsrz+p1P0992seNRMkvq9g3Wm6azPZzQEtFZKNsfL6T8xRr2V
   yqezEyjSRtef77FgUlsQuSblHKyzVpLn+L5WMpysTcnzCuPSfTZSPNsLQ
   3+ErawHmQbxA8OyZuSu9HTWeGdhHTPhn5u46Ul1htKKhlUDDlfs6x0oAG
   rtrpAZvg02E95a+AerAL2tWXsrWjEEv4MsG7X1rD3YAGkECHzoV6genIr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="389925754"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="389925754"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 09:17:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="1087998284"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="1087998284"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 18 Oct 2023 09:17:06 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qt9EG-0000e4-0w;
	Wed, 18 Oct 2023 16:17:04 +0000
Date: Thu, 19 Oct 2023 00:16:54 +0800
From: kernel test robot <lkp@intel.com>
To: Jordan Niethe <jniethe5@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Gautam Menghani <gautam@linux.ibm.com>
Subject: [linux-next:master 4316/13299] arch/powerpc/kvm/powerpc.c:1061:9:
 error: implicit declaration of function 'kvmppc_get_vsx_vr'; did you mean
 'kvmppc_get_sr'?
Message-ID: <202310190002.uTcOpMyF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2dac75696c6da3c848daa118a729827541c89d33
commit: 52425a3b3c11cec58cf66e4c897fc1504f3911a9 [4316/13299] KVM: PPC: Introduce FPR/VR accessor functions
config: powerpc64-randconfig-r011-20211214 (https://download.01.org/0day-ci/archive/20231019/202310190002.uTcOpMyF-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310190002.uTcOpMyF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310190002.uTcOpMyF-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/kvm/powerpc.c: In function 'kvmppc_set_vmx_dword':
>> arch/powerpc/kvm/powerpc.c:1061:9: error: implicit declaration of function 'kvmppc_get_vsx_vr'; did you mean 'kvmppc_get_sr'? [-Werror=implicit-function-declaration]
    1061 |         kvmppc_get_vsx_vr(vcpu, index, &val.vval);
         |         ^~~~~~~~~~~~~~~~~
         |         kvmppc_get_sr
>> arch/powerpc/kvm/powerpc.c:1063:9: error: implicit declaration of function 'kvmppc_set_vsx_vr'; did you mean 'kvmppc_set_sr'? [-Werror=implicit-function-declaration]
    1063 |         kvmppc_set_vsx_vr(vcpu, index, &val.vval);
         |         ^~~~~~~~~~~~~~~~~
         |         kvmppc_set_sr
   In file included from arch/powerpc/kvm/powerpc.c:25:
   arch/powerpc/kvm/powerpc.c: In function 'kvm_vcpu_ioctl_get_one_reg':
>> arch/powerpc/kvm/powerpc.c:1729:52: error: implicit declaration of function 'kvmppc_get_vscr'; did you mean 'kvmppc_get_sr'? [-Werror=implicit-function-declaration]
    1729 |                         val = get_reg_val(reg->id, kvmppc_get_vscr(vcpu));
         |                                                    ^~~~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h:412:29: note: in definition of macro 'get_reg_val'
     412 |         case 4: __u.wval = (reg); break;        \
         |                             ^~~
   arch/powerpc/kvm/powerpc.c: In function 'kvm_vcpu_ioctl_set_one_reg':
>> arch/powerpc/kvm/powerpc.c:1780:25: error: implicit declaration of function 'kvmppc_set_vscr'; did you mean 'kvmppc_set_sr'? [-Werror=implicit-function-declaration]
    1780 |                         kvmppc_set_vscr(vcpu, set_reg_val(reg->id, val));
         |                         ^~~~~~~~~~~~~~~
         |                         kvmppc_set_sr
   cc1: all warnings being treated as errors


vim +1061 arch/powerpc/kvm/powerpc.c

  1048	
  1049	
  1050	static inline void kvmppc_set_vmx_dword(struct kvm_vcpu *vcpu,
  1051		u64 gpr)
  1052	{
  1053		union kvmppc_one_reg val;
  1054		int offset = kvmppc_get_vmx_dword_offset(vcpu,
  1055				vcpu->arch.mmio_vmx_offset);
  1056		int index = vcpu->arch.io_gpr & KVM_MMIO_REG_MASK;
  1057	
  1058		if (offset == -1)
  1059			return;
  1060	
> 1061		kvmppc_get_vsx_vr(vcpu, index, &val.vval);
  1062		val.vsxval[offset] = gpr;
> 1063		kvmppc_set_vsx_vr(vcpu, index, &val.vval);
  1064	}
  1065	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
