Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B250175BB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jan 2024 08:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706170239; cv=none; b=GYLCdiD26Jz6IbN9fG+XC3qHzEyHW8T8lDjbbSLutu39dwI9ceEZVtAFgwCfYPy97FraQrNIojPNuqCO30FlAKQNxnRkBiI5D6lmxoCl3Okde5FQwY0a7I5noEJx3qgaKU2OwAvWmai2371kg9KYK7xtXpgpjQRh1eaK79hbKOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706170239; c=relaxed/simple;
	bh=A/3gMpBZBjNfccjp/tU3kHi+FRp1vQeQMN21Zpun0sc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GqxRRIOujuBwg8qiIpPZbV4hQsZP2B2uQUNIklXe3Oq2kSRHQqpl2Mb+y+/v7Pe2CnW+GZpKEw8VwtpZOBW4LSqjNvNe0UlfGooMLjCcMhMLJ82tKMb9+irtxBIiXpupmHVAw9GabM9nwa26+HYPh4xiU9hZD3voPTmL8AegzFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Krg1I68m; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Krg1I68m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706170238; x=1737706238;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A/3gMpBZBjNfccjp/tU3kHi+FRp1vQeQMN21Zpun0sc=;
  b=Krg1I68mGJ45O+3XO9641QW+klwWKkW1DErlpSPVrNuDAN1Ld5Y0b/th
   vMwO/tu3K1tiDAyKkeOeUmBkbzQ66kMO8jKVWFtgyZRhlFsMDpiJK1suO
   eH397AdZ/cJPE64BuYyVtU1DUA5tbRcJ1CphHB6Nhs3+41Dn+mUI7UMSo
   cUJ9OyHEkndlDiW+uLiEYXByW5x1+kuB/vOZvluHMrqg7/VZfGST3VdcX
   Fa9UNI8qXzlx11zZbrZywnSEE2ZXTN2/gk1k8R46n3sBNIqdTzbMVKiEo
   irPAyQKTwuSZlsJ9nYHic0Px8CxGoU9pAjNvwSwSnbGHMe0WQXA4PAWri
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="1967920"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1967920"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 00:10:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="736242272"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="736242272"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 25 Jan 2024 00:10:31 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSuoe-0008rF-1t;
	Thu, 25 Jan 2024 08:10:28 +0000
Date: Thu, 25 Jan 2024 16:09:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 13192/21567]
 drivers/crypto/hisilicon/qm.c:2916:39: error: 'struct device' has no member
 named 'numa_node'
Message-ID: <202401251651.XSRrMu3C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   c147f19e06e08b90efa3dda49bc4dcaf06424518
commit: 73d33f5c59dc3824444baca6a458427f4de3d8fa [13192/21567] qm: Move all the same logic functions of hisilicon crypto to qm
config: arm64-randconfig-004-20240123 (https://download.01.org/0day-ci/archive/20240125/202401251651.XSRrMu3C-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240125/202401251651.XSRrMu3C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401251651.XSRrMu3C-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/crypto/hisilicon/qm.c: In function 'hisi_qm_sort_devices':
>> drivers/crypto/hisilicon/qm.c:2916:39: error: 'struct device' has no member named 'numa_node'
    2916 |                         dev_node = dev->numa_node;
         |                                       ^~


vim +2916 drivers/crypto/hisilicon/qm.c

  2902	
  2903	static int hisi_qm_sort_devices(int node, struct list_head *head,
  2904						struct hisi_qm_list *qm_list)
  2905	{
  2906		struct hisi_qm_resource *res, *tmp;
  2907		struct hisi_qm *qm;
  2908		struct list_head *n;
  2909		struct device *dev;
  2910		int dev_node = 0;
  2911	
  2912		list_for_each_entry(qm, &qm_list->list, list) {
  2913			dev = &qm->pdev->dev;
  2914	
  2915			if (IS_ENABLED(CONFIG_NUMA)) {
> 2916				dev_node = dev->numa_node;
  2917				if (dev_node < 0)
  2918					dev_node = 0;
  2919			}
  2920	
  2921			if (qm_list->check && !qm_list->check(qm))
  2922				continue;
  2923	
  2924			res = kzalloc(sizeof(*res), GFP_KERNEL);
  2925			if (!res)
  2926				return -ENOMEM;
  2927	
  2928			res->qm = qm;
  2929			res->distance = node_distance(dev_node, node);
  2930			n = head;
  2931			list_for_each_entry(tmp, head, list) {
  2932				if (res->distance < tmp->distance) {
  2933					n = &tmp->list;
  2934					break;
  2935				}
  2936			}
  2937			list_add_tail(&res->list, n);
  2938		}
  2939	
  2940		return 0;
  2941	}
  2942	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
