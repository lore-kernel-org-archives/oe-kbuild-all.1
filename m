Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC029EC2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Dec 2023 02:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b291rZbv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703297356; x=1734833356;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0exgWRjrurkVaXE3fX/328e4KiiQPYLJ0HOBIRLaAm4=;
  b=b291rZbvuCpVSlv/dUqyB5sbIGsnf/pda9VQhUBYnYil9FK9gNNttU5N
   hyGG2BztMaGlO8A3CbqSd4+qzTf1Pwqo+6BYjEFeKQhEUD8REnDlz7mX+
   M1iF3ulxtgepkxlT4Xyv1g574sCeRuMqRriH+jaeroyyDpQggVJiwrPey
   pBUbuJsPX9BYTTFrW07bF2/G7CjLpR7Xveu0Vze3AaVHpEDU7jQjROVql
   BQw3+zBguVY1r6FbQe9agnLVof6PHXTOUf7NvP3TgEGbC5m0MUqrtApJi
   7KwV3pfhIlFrgoUXJHTwP7o2GE1bKQlNlZ4XuGeJu9p5vBYTvvsS87Wy4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="395920402"
X-IronPort-AV: E=Sophos;i="6.04,298,1695711600"; 
   d="scan'208";a="395920402"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2023 18:09:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="1108671422"
X-IronPort-AV: E=Sophos;i="6.04,298,1695711600"; 
   d="scan'208";a="1108671422"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 22 Dec 2023 18:09:00 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGrR4-000A8b-3C;
	Sat, 23 Dec 2023 02:08:29 +0000
Date: Sat, 23 Dec 2023 10:05:44 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Chan <michael.chan@broadcom.com>, davem@davemloft.net
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	pavan.chebbi@broadcom.com, andrew.gospodarek@broadcom.com
Subject: Re: [PATCH net-next 04/13] bnxt_en: Refactor L2 filter alloc/free
 firmware commands.
Message-ID: <202312230929.Ut7Jl9Ym-lkp@intel.com>
References: <20231221220218.197386-5-michael.chan@broadcom.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231221220218.197386-5-michael.chan@broadcom.com>

Hi Michael,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Chan/bnxt_en-Refactor-bnxt_ntuple_filter-structure/20231222-174043
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231221220218.197386-5-michael.chan%40broadcom.com
patch subject: [PATCH net-next 04/13] bnxt_en: Refactor L2 filter alloc/free firmware commands.
config: arm64-randconfig-002-20231222 (https://download.01.org/0day-ci/archive/20231223/202312230929.Ut7Jl9Ym-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231223/202312230929.Ut7Jl9Ym-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312230929.Ut7Jl9Ym-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/broadcom/bnxt/bnxt.c: In function 'bnxt_vf_target_id':
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:5443:42: error: invalid use of undefined type 'struct bnxt_vf_info'
    5443 |         struct bnxt_vf_info *vf = &pf->vf[vf_idx];
         |                                          ^
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:5445:18: error: invalid use of undefined type 'struct bnxt_vf_info'
    5445 |         return vf->fw_fid;
         |                  ^~
>> drivers/net/ethernet/broadcom/bnxt/bnxt.c:5446:1: warning: control reaches end of non-void function [-Wreturn-type]
    5446 | }
         | ^


vim +5446 drivers/net/ethernet/broadcom/bnxt/bnxt.c

  5440	
  5441	static u16 bnxt_vf_target_id(struct bnxt_pf_info *pf, u16 vf_idx)
  5442	{
> 5443		struct bnxt_vf_info *vf = &pf->vf[vf_idx];
  5444	
  5445		return vf->fw_fid;
> 5446	}
  5447	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
