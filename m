Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74498A29
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Oct 2023 04:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jkdxhouv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697950068; x=1729486068;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NZnaLWkOPqLzOUx+meNVQeG/VxyBAz+8AmZ7+GX4QkI=;
  b=jkdxhouvr9W5m5lZIL/OqEke00bNx+CjXYwpXWZwELPCXdOcyiJ40L/8
   mF/mTXpwz497Bp6/1dFcUTmXxiBYbdPMcaR31kitizmpLGR6ERRL31f5V
   TkmBdIiZ54eJHQvMWM2Vvdy+bc7kCUFzy812bmBeALG8iJBTlOBPOEOvM
   tqAazsJMSdqNUqiBqVJPDx2NVWu/z+cAaYYQ3VXaQhj7ookfzgl0V+Xu7
   JjxuBid5sRSah8J0zWmiE+VBGy7PrPVXCA4VGNP7GXojE1e9Ibo2B9Vb0
   xvK531XwMLJD5BY2cvSLdwFNegWKwiwa8w4U91JvCrAW8akRWZ8WBqJgQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="450901099"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="450901099"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 21:47:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="757832390"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="757832390"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 21 Oct 2023 21:47:42 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quQNH-0005aF-1E;
	Sun, 22 Oct 2023 04:47:39 +0000
Date: Sun, 22 Oct 2023 12:46:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jordan Niethe <jniethe5@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linuxppc:topic/ppc-kvm 5/12] checkpatch: ERROR: Macros with complex
 values should be enclosed in parentheses
Message-ID: <202310221201.BLBfwzn4-lkp@intel.com>
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
commit: c8ae9b3c6e7f22a4b71e42edb0fc3942aa7a7c42 [5/12] KVM: PPC: Use accessors for VCORE registers
reproduce: (https://download.01.org/0day-ci/archive/20231022/202310221201.BLBfwzn4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310221201.BLBfwzn4-lkp@intel.com/

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
