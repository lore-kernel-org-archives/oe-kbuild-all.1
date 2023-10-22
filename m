Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CFDA4D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Oct 2023 04:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eUObKxa9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697950068; x=1729486068;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cqqo5n3gxeJSC5B/ZVBX77Ac9vYZWGhVigIC2/1DETM=;
  b=eUObKxa9HvkOv36VyQbhMP21dqeIrVZGkY01seoCf75aNv4pZ8OgPYLv
   Gi7FgAPoYTiTs9rlBl4lsOcC3Y51raA3EspEGWoLj/aheaYB4UowzKqgK
   LPi/CODe7CMbezdMG40wQmpZQ3O/Xjbz1IlGPYc6k7Pkgupm6kTPEF+yi
   D1bjJIVOHg5Y99965XDddxf0wqfpua5BLys0WggU6xNrW5lSmFxGQJWco
   IzPhtfISRBK0JMefdAKxNyXgM3GzRgCINw2b6V/NvCL/G9xXTA+r49H0g
   B7ffoLBUP9/EC1hNWuU7awgsCCYS+mdzCC+moJYHTh5ftQtvzV0TzE6Uk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="450901101"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="450901101"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 21:47:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="757832389"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="757832389"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 21 Oct 2023 21:47:42 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quQNH-0005aH-1H;
	Sun, 22 Oct 2023 04:47:39 +0000
Date: Sun, 22 Oct 2023 12:46:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jordan Niethe <jniethe5@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linuxppc:topic/ppc-kvm 10/12] checkpatch: ERROR: Macros with
 complex values should be enclosed in parentheses
Message-ID: <202310221224.ahfgKXVT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/linuxppc/linux topic/ppc-kvm
head:   b7bce570430e42229fb63f775fcbb10f38b83c71
commit: 19d31c5f115754c369c0995df47479c384757f82 [10/12] KVM: PPC: Add support for nestedv2 guests
reproduce: (https://download.01.org/0day-ci/archive/20231022/202310221224.ahfgKXVT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310221224.ahfgKXVT-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#496: FILE: arch/powerpc/include/asm/kvm_book3s.h:556:
+#define KVMPPC_BOOK3S_VCPU_ACCESSOR_GET(reg, size, iden)		\
 static inline u##size kvmppc_get_##reg(struct kvm_vcpu *vcpu)		\
 {									\
+	WARN_ON(kvmhv_nestedv2_cached_reload(vcpu, iden) < 0);		\
 	return vcpu->arch.reg;						\
 }

ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#545: FILE: arch/powerpc/include/asm/kvm_book3s.h:590:
+#define KVMPPC_BOOK3S_VCORE_ACCESSOR(reg, size, iden)			\
+	KVMPPC_BOOK3S_VCORE_ACCESSOR_SET(reg, size, iden)		\
+	KVMPPC_BOOK3S_VCORE_ACCESSOR_GET(reg, size, iden)		\
 

ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#688: FILE: arch/powerpc/include/asm/kvm_ppc.h:978:
+#define KVMPPC_VCPU_SHARED_REGS_ACCESSOR_GET(reg, size, iden)		\
 static inline u##size kvmppc_get_##reg(struct kvm_vcpu *vcpu)		\
 {									\
+	if (iden)							\
+		WARN_ON(kvmhv_nestedv2_cached_reload(vcpu, iden) < 0);	\
 	if (kvmppc_shared_big_endian(vcpu))				\
 	       return be##size##_to_cpu(vcpu->arch.shared->reg);	\
 	else								\
 	       return le##size##_to_cpu(vcpu->arch.shared->reg);	\
 }									\
 

ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#715: FILE: arch/powerpc/include/asm/kvm_ppc.h:1001:
+#define KVMPPC_VCPU_SHARED_REGS_ACCESSOR(reg, size, iden)		\
+	KVMPPC_VCPU_SHARED_REGS_ACCESSOR_GET(reg, size, iden)		\
+	KVMPPC_VCPU_SHARED_REGS_ACCESSOR_SET(reg, size, iden)		\
 

ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#1358: FILE: arch/powerpc/kvm/book3s_hv.h:75:
+#define KVMPPC_BOOK3S_HV_VCPU_ACCESSOR_GET(reg, size, iden)		\
 static inline u##size kvmppc_get_##reg ##_hv(struct kvm_vcpu *vcpu)	\
 {									\
+	kvmhv_nestedv2_cached_reload(vcpu, iden);			\
 	return vcpu->arch.reg;						\
 }

ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#1368: FILE: arch/powerpc/kvm/book3s_hv.h:82:
+#define KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(reg, size, iden)			\
+	KVMPPC_BOOK3S_HV_VCPU_ACCESSOR_SET(reg, size, iden)		\
+	KVMPPC_BOOK3S_HV_VCPU_ACCESSOR_GET(reg, size, iden)		\
 

ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#1381: FILE: arch/powerpc/kvm/book3s_hv.h:93:
+#define KVMPPC_BOOK3S_HV_VCPU_ARRAY_ACCESSOR_GET(reg, size, iden)	\
 static inline u##size kvmppc_get_##reg ##_hv(struct kvm_vcpu *vcpu, int i)	\
 {									\
+	WARN_ON(kvmhv_nestedv2_cached_reload(vcpu, iden(i)) < 0);	\
 	return vcpu->arch.reg[i];					\
 }

ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#1417: FILE: arch/powerpc/kvm/book3s_hv.h:100:
+#define KVMPPC_BOOK3S_HV_VCPU_ARRAY_ACCESSOR(reg, size, iden)		\
+	KVMPPC_BOOK3S_HV_VCPU_ARRAY_ACCESSOR_SET(reg, size, iden)	\
+	KVMPPC_BOOK3S_HV_VCPU_ARRAY_ACCESSOR_GET(reg, size, iden)	\
+

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
