Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BBC7F3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Oct 2023 04:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i2UGcMvt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697950071; x=1729486071;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6w47m5NeeVyhktpDaC6MoEkuPiXZoh/gr6BHjeKHaI0=;
  b=i2UGcMvtlglrg2YGTupZTRC5M/x62qb8Z8W5eQdE45bQMqsgY0Pgw67d
   mGg3M1v8G4xZm0sVFvRQgpA4SeNvDKi80h9vkJBDMEq1GS7X8CBZ1Wwpn
   8kFsfYsOzFob9M2ET/7VrFSzhngXpjRwRZ8D1s1YQntnxXTmc1FplaMW3
   CrxsktwkT6ii7S0dzeQmwchj/UX8JICV4hB8CwXJ88dh3yLzuBV6zqv3B
   5oLkzet7eciUZn4wl9rotRDL+r3m0eS0ovf7pgMexlpbRR7ttbe0vXHAp
   TjKJg74/5h7OjS9b9cz0UIRykUYdB+kbddWYiljtJ8xfxUNgKxYo+sDxa
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="450901103"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="450901103"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 21:47:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="757832391"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="757832391"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 21 Oct 2023 21:47:42 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quQNH-0005aJ-1M;
	Sun, 22 Oct 2023 04:47:39 +0000
Date: Sun, 22 Oct 2023 12:46:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jordan Niethe <jniethe5@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linuxppc:topic/ppc-kvm 6/12] checkpatch: ERROR: Macros with complex
 values should be enclosed in parentheses
Message-ID: <202310221216.VqY1wzWF-lkp@intel.com>
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
commit: ebc88ea7a6ad0ea349df9c765357d3aa4e662aa9 [6/12] KVM: PPC: Book3S HV: Use accessors for VCPU registers
reproduce: (https://download.01.org/0day-ci/archive/20231022/202310221216.VqY1wzWF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310221216.VqY1wzWF-lkp@intel.com/

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
