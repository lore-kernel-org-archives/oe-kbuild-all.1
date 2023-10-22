Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F9736A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Oct 2023 04:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PG+WeyXZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697950064; x=1729486064;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1H+LM3SBKKOaTHTf9sRUA+BAMlCVWYr2dAQNd7HQAeM=;
  b=PG+WeyXZFk5SqAeCMWKYsKJgVhpghqJyTBm4YddPnD0dL+eIdme0d5F0
   aKdxZJGx5mp1uhZVlRzpCj2rz8u8tWcINkFnUhQP8Mh2YXeR8LAaX/BLA
   l1ykHrefvOf/COlyQDkMGb6fBg4+uKNtASFpusf/gqvbm2KokhpiEE/7B
   BhoNlpSvkNcppez/zbQDseypICIpaUs8BI8egTijXl+yJenUzeX6xmXge
   O0p4cpoLncLhHhfQBXpdhF6SwHCYXREvpGmewzjD6sFPrtcgm1KwYheLG
   i1xnX/TNpdDHxXQkDg3MZ/YQbM1VabCyFw0lzIdsn4QSjet+i57fVEwY/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="8240509"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="8240509"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 21:47:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="761420909"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="761420909"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 21 Oct 2023 21:47:41 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quQNH-0005aA-15;
	Sun, 22 Oct 2023 04:47:39 +0000
Date: Sun, 22 Oct 2023 12:46:45 +0800
From: kernel test robot <lkp@intel.com>
To: Jordan Niethe <jniethe5@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linuxppc:topic/ppc-kvm 3/12] checkpatch: ERROR: Macros with complex
 values should be enclosed in parentheses
Message-ID: <202310221232.SWNre7Wq-lkp@intel.com>
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

tree:   https://github.com/linuxppc/linux topic/ppc-kvm
head:   b7bce570430e42229fb63f775fcbb10f38b83c71
commit: 2a64bc673133346a7a3bd163f2e6048bd1788727 [3/12] KVM: PPC: Rename accessor generator macros
reproduce: (https://download.01.org/0day-ci/archive/20231022/202310221232.SWNre7Wq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310221232.SWNre7Wq-lkp@intel.com/

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
