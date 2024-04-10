Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737DE181338
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Apr 2024 20:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712779713; cv=none; b=UfysJaW+idIxNchfyMWnKlSK+Xsluv3oZjY7wIYW3lOy3nwdVphnxPpUZFQPP6d8zuTM5Jgfek1kc4Ghy1PRXz06KWVonLgjucsNq3NR0Yl4vNX//zq5CGAV/U01S1ysxiwQK76QjJpmgD6/J3VLj5WKn2zvpKqrFi9CHvUIgHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712779713; c=relaxed/simple;
	bh=sxbG46G8tw2vYGVSXEHYQKof+J6If9suMRxNq9p9onQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lFh+5MTlW+CF7gwD8ajqDxIdxZlcBTbpQdZTxP60pSeNVCvU9HXTfvSsZL9QsYQz4zhwm0wjBc6InsQzE1N94qnqtiPABWYvafQth3Kn2im6v8OQjCBnOQO02cjUxDz3v5s+eo9AOtU/PiCKBaLu/OtA8RWuS63fBuyM80HJ5JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N2A7npPJ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N2A7npPJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712779711; x=1744315711;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sxbG46G8tw2vYGVSXEHYQKof+J6If9suMRxNq9p9onQ=;
  b=N2A7npPJ9AkXCSDjyE+Ycw65rJ3phT7K0fXz5pSAz9WUWJmg1/jOhUpA
   y5hcYPSyQZihU/WzH0iQlVYsJXLV2ljkPM/VtlnpQW0Tr7WmiCOd/CMmZ
   cHMmeNXqXl0yuCEFsuKLfnzgbsWlZ9MYE3bjrmJ6Oad6jA797EzGy94w0
   dD4946D3Kz482j0GzTgJHCRazSTGHBgsUqmmjl4V1wk/QUoOx7xzRtuFq
   v1jPQMjw437VFqsqaTYvrugbB/sChNZWor8v6Ul72nYGHSEgQRRGwyyAD
   wwdkwjxW7k/x+eoqJKgp6XBXdkyvmubNjubuiC4FulruhmoJ5q5xG5iTm
   w==;
X-CSE-ConnectionGUID: cL1hlvh8SnqjeoqCO4ASeQ==
X-CSE-MsgGUID: 2sPE4fMnT+eeFx5qJMbYLg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8027640"
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="8027640"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 13:08:29 -0700
X-CSE-ConnectionGUID: x964TEFXQwKIYbrpQWpUrA==
X-CSE-MsgGUID: Wnwwme3+SBy54CRfv55LYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="20728951"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Apr 2024 13:08:28 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rueF8-0007kr-2j;
	Wed, 10 Apr 2024 20:08:26 +0000
Date: Thu, 11 Apr 2024 04:08:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 23822/30000]
 drivers/gpu/drm/inspur/inspur_cursor.c:54:32: sparse: sparse: cast removes
 address space '__iomem' of expression
Message-ID: <202404110414.lls2ROdf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   f1776d0ca22cf72bfcdc93dced47d9dde9934d97
commit: b9d65551a3adfa87a7c5d33391187ee60a1b501d [23822/30000] drm: add inspur drm driver support
config: x86_64-randconfig-r122-20240410 (https://download.01.org/0day-ci/archive/20240411/202404110414.lls2ROdf-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404110414.lls2ROdf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404110414.lls2ROdf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/inspur/inspur_cursor.c:54:32: sparse: sparse: cast removes address space '__iomem' of expression
--
>> drivers/gpu/drm/inspur/inspur_drm_drv.c:30:13: sparse: sparse: symbol 'inspur_drm_interrupt' was not declared. Should it be static?

vim +/__iomem +54 drivers/gpu/drm/inspur/inspur_cursor.c

    49	
    50	#define HW_FLAG_OFFSET 0x01ffff00
    51	#define HW_FLAG_ENABLE 0x1bd40750
    52	unsigned char getKVMHWCursorSetting(struct inspur_drm_private *priv)
    53	{
  > 54		unsigned int value = *(unsigned int *)(priv->fb_map + HW_FLAG_OFFSET);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
