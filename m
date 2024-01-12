Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F726BB3E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jan 2024 14:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i44Ge855"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705068581; x=1736604581;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TmJPoV4/PIoV4vJXXg/8kOcJMi9htTlyY/Vob9++HYw=;
  b=i44Ge855TZe5U52dN28BJF3ZNhOtklwTGS5yBFF2Zgo9IPmnZMgL8Wt7
   xSCb1aB10AuazrjsvZbfARhB/QiMpMtzULZu9qPINOMrgam0ykfFFmgiN
   QsK4deC9jycSsOu0Zmg+d9ZCm0kBBhKRpI0PsxUzM9e4RGaoWuuONHQlt
   0e0sovQe6BbVR31eIlqIiBC3rErfjGRcW+gwEBd5HykmJ1cjmQJBD1eEs
   //AnLesx8lLBAQhvSJzscJn4PDYlIjPLeWtFvPddbWsj44OzeNBUSYJKO
   tcnB9qo5lVZAPz7Wp9gHyWXZH8LXf7/UiFel8JGPH0K5Zi3Jz6yxRh6+8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="402947398"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; 
   d="scan'208";a="402947398"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 06:09:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="906333906"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; 
   d="scan'208";a="906333906"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 12 Jan 2024 06:09:38 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOIE3-0009YR-2R;
	Fri, 12 Jan 2024 14:09:35 +0000
Date: Fri, 12 Jan 2024 22:08:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 20947/21544]
 net/netfilter/nf_nat_proto.c:56:6: warning: no previous prototype for
 function 'nf_nat_csum_recalc'
Message-ID: <202401122246.SG8ArdnN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   1f0983450549eeea71fb9333517330947a779262
commit: 83abe3a3b85762720192809ac8695ff9255cfd23 [20947/21544] netfilter: nat: remove csum_recalc hook
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240112/202401122246.SG8ArdnN-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240112/202401122246.SG8ArdnN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401122246.SG8ArdnN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/netfilter/nf_nat_proto.c:56:6: warning: no previous prototype for function 'nf_nat_csum_recalc' [-Wmissing-prototypes]
      56 | void nf_nat_csum_recalc(struct sk_buff *skb,
         |      ^
   net/netfilter/nf_nat_proto.c:56:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      56 | void nf_nat_csum_recalc(struct sk_buff *skb,
         | ^
         | static 
   1 warning generated.


vim +/nf_nat_csum_recalc +56 net/netfilter/nf_nat_proto.c

    55	
  > 56	void nf_nat_csum_recalc(struct sk_buff *skb,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
