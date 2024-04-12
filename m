Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9171B635
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Apr 2024 00:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712883545; cv=none; b=s4URFKy1qGHmO2kQzpZmdl2CUHtW3Nu/jo0djecNGXY3b/6NJ8pZIOAYLe7hHfuuCe3sNBqh/OS8O4oIzZg5E5L8wH+zlVT7QBOpVXQjvTqcQWbX60m4+ivUja4lXkL+jkCSKIxzls+S6FqQlAGwso4qIsRGMAj1iFDFgrne3jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712883545; c=relaxed/simple;
	bh=SJcWczMdW5Gs49m+jWmTPUzN+zn7zdLBz7pKw4AlNNI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HmSLYE9SfTk3msQ/qC3hL5BBTS6rNoznXoH0NU42mBOtpvQjSoNpzeaEn9Hbhf+cKc887xtmF+2x94xbTclvhVG8WJvx9Qnw7h3SvNWQae2O9dL7W31lNsxBTtp1GOzxW9Hn+7FZ5+vGjjDNFk8OmEZS/5pJsRQjnnPFwvUul0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hZ3SmAiQ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hZ3SmAiQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712883543; x=1744419543;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SJcWczMdW5Gs49m+jWmTPUzN+zn7zdLBz7pKw4AlNNI=;
  b=hZ3SmAiQwn22mlpplMB3y8VOfDWl/UEutrkKztue+bRw4c2MExlBXu3s
   JqR1ADFmqZ4EW1pyo9DX4v/VAFHhhNRP5tiYs+9IP5MvDQYEVbSBjU9xY
   30LdahQ7AQ6GZ+R8Np0hD+HB8ufpuRboncjQP745vmd8qLUSMixmEMSR5
   w6FAhx4S3xYh8xUnKg3jClzzojOFzSmAPHzb7k7oAE71pRSzWp/cEwfSv
   W2HtkTQuTn+Q4lQ/1n2bazio9qHVy+27vFsP3PETLFPwYEfCqxtOAIAeW
   Qg7X+P0+V6gkFPhy61jpwInaWAscaHfs5gj+jFsyhh1TvQf9xUH+7fAEr
   A==;
X-CSE-ConnectionGUID: rjAO6ecjQM+5WQ0W+kvzyA==
X-CSE-MsgGUID: cXD6aD3VRpyNtj1s7bKceg==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="33724345"
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; 
   d="scan'208";a="33724345"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 17:59:02 -0700
X-CSE-ConnectionGUID: SvGUXM1pQPSknYqVnSyb1g==
X-CSE-MsgGUID: yH1uYasBS5ev1gN7DeKnEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; 
   d="scan'208";a="25878048"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Apr 2024 17:59:00 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rv5Fp-00099R-1J;
	Fri, 12 Apr 2024 00:58:57 +0000
Date: Fri, 12 Apr 2024 08:58:45 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 4787/4792]
 drivers/net/ethernet/bzwx/nce/ne6x/ne6x.h:35:10: fatal error: reg.h: No such
 file or directory
Message-ID: <202404120843.kMBsluN5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   5a4887e84d1f38cdaa7d82d911ad735fb06009fe
commit: c783f7daed8739b9497e40656bc220d2d17c9c10 [4787/4792] drivers: add Chengdu BeiZhongWangXin Technology N5/N6 Series Network Card Driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240412/202404120843.kMBsluN5-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240412/202404120843.kMBsluN5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404120843.kMBsluN5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:15:
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x.h:35:10: fatal error: reg.h: No such file or directory
      35 | #include "reg.h"
         |          ^~~~~~~
   compilation terminated.
--
   In file included from drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_main.c:8:
>> drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf.h:41:10: fatal error: reg.h: No such file or directory
      41 | #include "reg.h"
         |          ^~~~~~~
   compilation terminated.


vim +35 drivers/net/ethernet/bzwx/nce/ne6x/ne6x.h

    34	
  > 35	#include "reg.h"
    36	#include "feature.h"
    37	#include "txrx.h"
    38	#include "common.h"
    39	#include "ne6x_txrx.h"
    40	#include "ne6x_ethtool.h"
    41	#include "ne6x_procfs.h"
    42	#include "ne6x_virtchnl_pf.h"
    43	#include "version.h"
    44	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
