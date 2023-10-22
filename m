Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5DE1107
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Oct 2023 05:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DrOyOIpV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697952711; x=1729488711;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yItrDf461ntVlZAP9UUgMK0a5hWjKHsrcy/6sWP+vSI=;
  b=DrOyOIpV8oasnXP8cSTEoRPBEw3Mxlk0ngglur1moC6PDon3Z6mtlcLD
   JFeWv9QS7sRTbZ6Trb9jYlbNxTFy+a586nsa/G4IM9X0bFpUexbNHH3wm
   QYv0+nU9AiwKW+0Hc/iL/DWR1FpwCP7x5SwE2t7ccVo1ualvaNpvmi2FO
   myJ3KB68a3PhMOmIYLqKxOBjA/E988ceBom4vs1oGA53oCBBSRGOMZ0/B
   ORIcnwDjMOOdl02cDO3WUhCRTth8E6aKYu6Wr92DWoIzRlqW/1kr5FfJM
   jW23HE7vcdKWzAtr6PH7+Gtrtaoxjt2BoO31tZ+TRW0+iWrW8fF8iShkQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="390568045"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="390568045"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 22:31:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="881438340"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="881438340"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 21 Oct 2023 22:31:43 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quR3s-0005d0-34;
	Sun, 22 Oct 2023 05:31:40 +0000
Date: Sun, 22 Oct 2023 13:31:05 +0800
From: kernel test robot <lkp@intel.com>
To: Jordan Niethe <jniethe5@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [powerpc:topic/ppc-kvm 5/12] checkpatch: ERROR: Macros with complex
 values should be enclosed in parentheses
Message-ID: <202310221301.bPaA3wyI-lkp@intel.com>
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
commit: c8ae9b3c6e7f22a4b71e42edb0fc3942aa7a7c42 [5/12] KVM: PPC: Use accessors for VCORE registers
reproduce: (https://download.01.org/0day-ci/archive/20231022/202310221301.bPaA3wyI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310221301.bPaA3wyI-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#37: FILE: arch/powerpc/include/asm/kvm_book3s.h:493:
+#define KVMPPC_BOOK3S_VCORE_ACCESSOR_GET(reg, size)			\
+static inline u##size kvmppc_get_##reg(struct kvm_vcpu *vcpu)		\
+{									\
+	return vcpu->arch.vcore->reg;					\
+}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
