Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C0910F8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Oct 2023 05:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dgi+3ZwA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697952708; x=1729488708;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CbHagfx/Pp/GNpmJXZ2FLnrFWllnh3G5eTdg18Pw050=;
  b=Dgi+3ZwAjPe8X8MuCx/h315x5xiOfeytVUWqk7onz7qqKtJYBdRcrKIj
   hINdrN2rYk7RZQhLN0mFFyVI2rV2aKFpI2PQw1spU30z30ZsXG+bBukC0
   EIhRZ1zRESpqc7IoDKSLJ64tRz5JWuSw4DVRrMGHRkUHYTq936JVrSzNc
   YcaejbDa64SimLf8nxZ7orcRrmGsvkTfNAxrsdwXkDSrqWH/fQwaG8adv
   d79SumslimdtuqvbMjdn7SZANZcCACm1Hz3p3eCpCI1mQvOLrf2kr206C
   4DUNQ4cT2z4WQE4jIOIRTM8Dsq2TQa7UX00RD68kjRltOEVba7F8TPYFj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="390568041"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="390568041"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 22:31:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="881438343"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="881438343"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 21 Oct 2023 22:31:43 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quR3s-0005cy-30;
	Sun, 22 Oct 2023 05:31:40 +0000
Date: Sun, 22 Oct 2023 13:31:05 +0800
From: kernel test robot <lkp@intel.com>
To: Jordan Niethe <jniethe5@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [powerpc:topic/ppc-kvm 6/12] checkpatch: ERROR: Macros with complex
 values should be enclosed in parentheses
Message-ID: <202310221314.qTLTB0pW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git topic/ppc-kvm
head:   b7bce570430e42229fb63f775fcbb10f38b83c71
commit: ebc88ea7a6ad0ea349df9c765357d3aa4e662aa9 [6/12] KVM: PPC: Book3S HV: Use accessors for VCPU registers
reproduce: (https://download.01.org/0day-ci/archive/20231022/202310221314.qTLTB0pW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310221314.qTLTB0pW-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#469: FILE: arch/powerpc/kvm/book3s_hv.h:60:
+#define KVMPPC_BOOK3S_HV_VCPU_ACCESSOR_GET(reg, size)			\
+static inline u##size kvmppc_get_##reg ##_hv(struct kvm_vcpu *vcpu)	\
+{									\
+	return vcpu->arch.reg;						\
+}

ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#491: FILE: arch/powerpc/kvm/book3s_hv.h:82:
+#define KVMPPC_BOOK3S_HV_VCPU_ARRAY_ACCESSOR(reg, size)			\
+	KVMPPC_BOOK3S_HV_VCPU_ARRAY_ACCESSOR_SET(reg, size)		\
+	KVMPPC_BOOK3S_HV_VCPU_ARRAY_ACCESSOR_GET(reg, size)		\
+

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
