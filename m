Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD2610F8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Oct 2023 05:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ij8z9L0m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697952705; x=1729488705;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VkzQJ15CD2+6Tr1ST8WzaDfM8ikB74XxAaVpRxNa6xg=;
  b=ij8z9L0mOqwYmQsGPQwaztwtT/08EsB4FWkiU9TpsWy8tIq8zfr1XAvU
   vXscdMxnKCPlvKgQqlbJRQQx4WlF9AOC5RiahdWyGbuc2SOe6iQGLWOaU
   sezkkwfsrfdiW+XtOvBvntC7UbDdDoj7h8DwSwu7aUtBuGrHOPM7GiCLh
   OIakmLIS8ArnqkcpJciWev5FmLadKC+guXfomi3BM99aXCMOr51bR3MRg
   j5oXc6uxg3qaxIBGfwi3IihEYSToItD6FdK1BB7MsXqVKrhloP5isBRBC
   nY1715aGxbJ/3XLyOtAdIPl+8Pvrp3TDZC2Y4ZGDEf+x0OHJAdeQxAHD+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="390568047"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="390568047"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 22:31:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="881438341"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="881438341"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 21 Oct 2023 22:31:43 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quR3s-0005d2-37;
	Sun, 22 Oct 2023 05:31:40 +0000
Date: Sun, 22 Oct 2023 13:31:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jordan Niethe <jniethe5@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [powerpc:topic/ppc-kvm 4/12] checkpatch: ERROR: Macros with complex
 values should be enclosed in parentheses
Message-ID: <202310221349.4dijqgdK-lkp@intel.com>
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
commit: 7028ac8d174f28220f0e2de0cb3346cd3c31976d [4/12] KVM: PPC: Use accessors for VCPU registers
reproduce: (https://download.01.org/0day-ci/archive/20231022/202310221349.4dijqgdK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310221349.4dijqgdK-lkp@intel.com/

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
