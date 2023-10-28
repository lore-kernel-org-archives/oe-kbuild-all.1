Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928819479
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Oct 2023 14:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cMAF8D6C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698502587; x=1730038587;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BFLKTzr95MeCEN8/amOtNxbsy0YEmdJMJMd+2XCjvAY=;
  b=cMAF8D6CMMz/Xrq/VMUisPWLyA6jyWsIlgOAnYJKh3KXzjrzjXpvQyCi
   j3fKu04RnJJkGDidiWSWBrqXgXmJ2bTJ2uO+t9ZD3tDplvLjhzpn/QHxR
   oszcattoxH5yMo313NEiW0XygmSA8AzthwylcTFuJDfkvouxh/K0t31aW
   mrqtGS7IkwCJMHxaEmcj684i6s74VVtHZhxNcLjdOylvvLc9kutL2z9Ba
   jTSSDCQAd57P/a4ka/PZuT4KAfmPc7vZWpja9JehimRb0WNAYj50riPl6
   houEofC039m9tMXhxNdPUc358nKuXy5PYoLD3/rwzjbt170mF9ck1GJsF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="385105007"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; 
   d="scan'208";a="385105007"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2023 07:16:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="709677128"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; 
   d="scan'208";a="709677128"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 28 Oct 2023 07:16:24 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwk6w-000Bnn-15;
	Sat, 28 Oct 2023 14:16:22 +0000
Date: Sat, 28 Oct 2023 22:15:33 +0800
From: kernel test robot <lkp@intel.com>
To: Pavan Chebbi <pavan.chebbi@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev, David Wei <davidhwei@meta.com>,
	Michael Chan <michael.chan@broadcom.com>,
	Vasundhara Volam <vasundhara-v.volam@broadcom.com>
Subject: [isilence:zc/rx-latest 981/1024]
 drivers/net/ethernet/broadcom/bnxt/bnxt.c:5090:42: error: invalid use of
 undefined type 'struct bnxt_vf_info'
Message-ID: <202310282255.G5VSupxI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Pavan,

FYI, the error/warning still remains.

tree:   https://github.com/isilence/linux zc/rx-latest
head:   8b71540bf926b02cf19123b31b20daf76a314e33
commit: f0e90b8007759fb67368a36df5c34d428acbc040 [981/1024] bnxt: Refactor L2 filter alloc/free firmware commands.
config: sparc-randconfig-002-20231028 (https://download.01.org/0day-ci/archive/20231028/202310282255.G5VSupxI-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231028/202310282255.G5VSupxI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310282255.G5VSupxI-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/broadcom/bnxt/bnxt.c: In function 'bnxt_vf_target_id':
>> drivers/net/ethernet/broadcom/bnxt/bnxt.c:5090:42: error: invalid use of undefined type 'struct bnxt_vf_info'
    5090 |         struct bnxt_vf_info *vf = &pf->vf[vf_idx];
         |                                          ^
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:5092:18: error: invalid use of undefined type 'struct bnxt_vf_info'
    5092 |         return vf->fw_fid;
         |                  ^~
   drivers/net/ethernet/broadcom/bnxt/bnxt.c: In function 'bnxt_request_irq':
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:9547:16: warning: variable 'j' set but not used [-Wunused-but-set-variable]
    9547 |         int i, j, rc = 0;
         |                ^
   drivers/net/ethernet/broadcom/bnxt/bnxt.c: In function 'bnxt_vf_target_id':
>> drivers/net/ethernet/broadcom/bnxt/bnxt.c:5093:1: error: control reaches end of non-void function [-Werror=return-type]
    5093 | }
         | ^
   cc1: some warnings being treated as errors


vim +5090 drivers/net/ethernet/broadcom/bnxt/bnxt.c

  5087	
  5088	static u16 bnxt_vf_target_id(struct bnxt_pf_info *pf, u16 vf_idx)
  5089	{
> 5090		struct bnxt_vf_info *vf = &pf->vf[vf_idx];
  5091	
> 5092		return vf->fw_fid;
> 5093	}
  5094	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
