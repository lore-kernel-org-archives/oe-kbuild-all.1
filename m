Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6654510FD
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Oct 2023 05:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YKXIDUaB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697952708; x=1729488708;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NeJo+egwUh4B9eKk6d9wAigGTNn1Eqdmbw/4fJR2euY=;
  b=YKXIDUaBze5a9skxNVhYPK4JnxRFSMsMhGLPuWxGouy6djCNZaq0ORai
   g9ZSvt48RV1ya71dJClSjdNDfd46LsN9uIVIMDwSFUnM8bUfBf6/Cfr/9
   j9/LnPGjdUAszG5JBQEVl9HarY6bnz8balDmgcMqQpO/20Se39xLPtXWS
   gGOhJ0B+LZjaD81NXw6EEcOyMU/bsaFDjNxD1eb0h9+nn3JDF2BKQmgWo
   OpYlEdQpKiOomoPckEclxsNz1IywCXfSghtwWZ38kf+v0YSYfR6QM4n1A
   1dfRyRGO/PQRNjtVV4e2xRNF7m8+x99Ten0eHpDaw6klw4uQqsVj+/SuP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="390568043"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="390568043"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 22:31:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="881438342"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="881438342"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 21 Oct 2023 22:31:43 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quR3t-0005d4-05;
	Sun, 22 Oct 2023 05:31:41 +0000
Date: Sun, 22 Oct 2023 13:31:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jordan Niethe <jniethe5@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [powerpc:topic/ppc-kvm 3/12] checkpatch: ERROR: Macros with complex
 values should be enclosed in parentheses
Message-ID: <202310221335.0vbQtwyO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jordan,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git topic/ppc-kvm
head:   b7bce570430e42229fb63f775fcbb10f38b83c71
commit: 2a64bc673133346a7a3bd163f2e6048bd1788727 [3/12] KVM: PPC: Rename accessor generator macros
reproduce: (https://download.01.org/0day-ci/archive/20231022/202310221335.0vbQtwyO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310221335.0vbQtwyO-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#41: FILE: arch/powerpc/include/asm/kvm_ppc.h:942:
+#define KVMPPC_VCPU_SHARED_REGS_ACCESSOR_GET(reg, size)			\
 static inline u##size kvmppc_get_##reg(struct kvm_vcpu *vcpu)		\
 {									\
 	if (kvmppc_shared_big_endian(vcpu))				\

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
