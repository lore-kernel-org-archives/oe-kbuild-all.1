Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D84A50274
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Dec 2023 20:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fHiLcIEd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701981235; x=1733517235;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PHqifBiWEHbsa46Qfs0YPcsxJ8fWH5vozW392+Dl+YA=;
  b=fHiLcIEdcUTLtJt7k4OhR5HxnSj0K4eyJ3Wc46hbPLvIjq+zqJWTsmPF
   +1y45kifYo1Gz9f1dSTZkRijp1J7GRwuScdwpVREXrsSk1NPuyi82sj3W
   p5E+rb/45uWbRTmkAGcSpr76x4yFp4vRDYxzQkyQNtTIaywU1UHaEeen+
   AM/6A9ly2N5hACPrRm3diZmR9JiD90LQxRmFAReoMmjbUweziTsUgdWPY
   yfOnl372KgfSfiVHMDurr+WTqgq0IBKBAqH2zNgGTDmZhBROlxMfvsKH0
   +eVNa8Ji3uW6A3IgmwJ5XVWInTyaTqhP9pAfeW4mfSliGxDatuWH17ViW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="379306313"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="379306313"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 12:33:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="915695865"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="915695865"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 07 Dec 2023 12:33:53 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBL4B-000Cnb-1V;
	Thu, 07 Dec 2023 20:33:51 +0000
Date: Fri, 8 Dec 2023 04:33:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 6/11]
 arch/arm64/kvm/hyp_trace.c:96:27: sparse: sparse: symbol 'hyp_cb' was not
 declared. Should it be static?
Message-ID: <202312080408.nUbOqvQh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   bd5883688256f8eaf708cad509ce2a47ec8384aa
commit: 575dd1da644e642dd122a5af1e81c4171af0f842 [6/11] ANDROID: KVM: arm64: Add host support for the nVHE hyp tracing
config: arm64-randconfig-r121-20231207 (https://download.01.org/0day-ci/archive/20231208/202312080408.nUbOqvQh-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231208/202312080408.nUbOqvQh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312080408.nUbOqvQh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/hyp_trace.c:96:27: sparse: sparse: symbol 'hyp_cb' was not declared. Should it be static?
   arch/arm64/kvm/hyp_trace.c:488:5: sparse: sparse: symbol 'hyp_trace_release' was not declared. Should it be static?

vim +/hyp_cb +96 arch/arm64/kvm/hyp_trace.c

    95	
  > 96	struct ring_buffer_ext_cb hyp_cb = {
    97		.update_footers = __update_footers,
    98		.swap_reader = __swap_reader_page,
    99	};
   100	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
