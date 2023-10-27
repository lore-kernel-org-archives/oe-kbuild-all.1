Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E5238BCE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Oct 2023 16:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XAzjTjQz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698423951; x=1729959951;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qn3lhUE4VbskEvWdpqhn1+gRUnHraEhhgZELUlLHdDY=;
  b=XAzjTjQzIu8BubBH/oCN65iRHLmresjHWE53MSj1F4DXNkM3/M5NP4V2
   yqdxzE+TpVE7X+3zrFaqC0+G3W3zf9iADcTLrZyJdYHpUt8zwoqSej9Av
   ongrGQeqhpkiHbgS2u75MIyfQRrGHLtPo2WUBuWiSFTdtH9mj5K+FAOl5
   eSAMHPZfgW+AEvgO0LjayZnnueVAjxFkI30if/ZCCZjN72dbP175VrsHQ
   iLZ/mY3X4BAd+1TOzeIvzqy6/+zAdwiASfulGrEYWjD/Hjkdw9L6YU6pJ
   XHk+MCn4drzxl2GvR2vdzn8JCzm3CbIZpVwDczRLXjVLyceyWhM1Ik2Zz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="372857315"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="372857315"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 09:25:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="933125955"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="933125955"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 27 Oct 2023 09:25:49 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwPed-000B0V-0W;
	Fri, 27 Oct 2023 16:25:47 +0000
Date: Sat, 28 Oct 2023 00:25:41 +0800
From: kernel test robot <lkp@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-attest-wip 9/9]
 drivers/virt/coco/tdx-guest/tdx-guest.c:269:13: warning: unused variable
 'ret'
Message-ID: <202310280049.XbWsB1Ja-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-attest-wip
head:   5034cafa77d0ce537efe8a05f25c46db6de5c2e7
commit: 5034cafa77d0ce537efe8a05f25c46db6de5c2e7 [9/9] virt: tdx-guest: Add TDX RTMR extend support
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231028/202310280049.XbWsB1Ja-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231028/202310280049.XbWsB1Ja-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310280049.XbWsB1Ja-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/virt/coco/tdx-guest/tdx-guest.c: In function 'tdx_update_rtmr':
>> drivers/virt/coco/tdx-guest/tdx-guest.c:269:13: warning: unused variable 'ret' [-Wunused-variable]
     269 |         int ret;
         |             ^~~


vim +/ret +269 drivers/virt/coco/tdx-guest/tdx-guest.c

   266	
   267	static int tdx_update_rtmr(struct tsm_rtmr *rtmr, void *data)
   268	{
 > 269		int ret;
   270	
   271		pr_info("%s:%d called for index:%d\n", __func__, __LINE__, rtmr->index);
   272	
   273		if (rtmr->data_len != TDX_RTMR_EXTEND_LEN)
   274			return -EINVAL;
   275	
   276		void *buf __free(kfree) = kzalloc(TDX_RTMR_BUF_LEN, GFP_KERNEL);
   277		if (!buf)
   278			return -ENOMEM;
   279	
   280		memcpy(buf, rtmr->data, rtmr->data_len);
   281	
   282		/* Extend RTMR registers using "TDG.MR.RTMR.EXTEND" TDCALL */
   283		return tdx_mcall_extend_rtmr(buf, rtmr->index);
   284	}
   285	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
