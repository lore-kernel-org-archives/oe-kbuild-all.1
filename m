Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689357F3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Oct 2023 04:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iMkIIH+C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697950065; x=1729486065;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z2XrPGA9pK7aGCfzoByozsaPHBwQd4SjHy201tZoYJE=;
  b=iMkIIH+CAhB96nOQPUdQ8l6qTpnlKLGXP0mPjR559BsG2T596n8iOH2M
   VQF76EFeUiwb3CCYltCEe8xdhX/rA07foY5R6cPr7OXkJDA8E82KX8uI+
   7I8r3OXZ56rdSJHbPLNDbCJNdtynhsVppLWI0Z3Kzl8GNyakDcAdd36ai
   JcG3vQ+hdOMi9v5kyZcgKUgs20zMqhbjrdN4f8qwxbkCQS6smpM/Yfgjr
   4Bk/88jui7ASZQ2OZeC+UbLg5FvMeMShwqVcU1Ao1JHsSilbSGmmGmX6l
   tZSkYeJGvGF4WcBBI0OnQfOnwb52w4v16D+JLL2QT5DAc7GmcuY/mPOhE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="450901097"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="450901097"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 21:47:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="757832392"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="757832392"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 21 Oct 2023 21:47:42 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quQNH-0005aC-19;
	Sun, 22 Oct 2023 04:47:39 +0000
Date: Sun, 22 Oct 2023 12:46:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jordan Niethe <jniethe5@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linuxppc:topic/ppc-kvm 4/12] checkpatch: ERROR: Macros with complex
 values should be enclosed in parentheses
Message-ID: <202310221248.XyW9NjUH-lkp@intel.com>
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
commit: 7028ac8d174f28220f0e2de0cb3346cd3c31976d [4/12] KVM: PPC: Use accessors for VCPU registers
reproduce: (https://download.01.org/0day-ci/archive/20231022/202310221248.XyW9NjUH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310221248.XyW9NjUH-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#39: FILE: arch/powerpc/include/asm/kvm_book3s.h:468:
+#define KVMPPC_BOOK3S_VCPU_ACCESSOR_GET(reg, size)			\
+static inline u##size kvmppc_get_##reg(struct kvm_vcpu *vcpu)		\
+{									\
+	return vcpu->arch.reg;						\
+}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
