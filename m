Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B67E177998
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jun 2024 10:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719398097; cv=none; b=sV4ogUdzpTSwqxAnCsNZ4WN8BYj1Q1Fv0QwxaeIJonWTlQplQEP/iONhUxcaW1ao0IbMCqpjo0WYUb4083DFSeilGzulsn0W/DGH2x5dhZ1qmtKklF+xgUI1J/pKInfXZ2TflzlmDIjTM00ZXtfhNPaT74z1NrOwnjvzHRgYABY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719398097; c=relaxed/simple;
	bh=xU+WACS6guDfp3khbUWZJSIr/WJobuA6mh0a6j028os=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UqCiQlMm0msKF46l2qDvkd3KE/e9pGIQzJmhvGX87hLXKNcwB7+ntYLUewYfUK6PNmUVPA7WnBI9Veu1hHjfdgOIwOjel5ZXtUCEkh2OJBZ3MIYvQL5n+CFxn6ACeNRzbUsdc/bRMQCuRSJEIj4sD6maPZRP/QkxcDZWby+Jqo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l5LsNdCD; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l5LsNdCD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719398096; x=1750934096;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xU+WACS6guDfp3khbUWZJSIr/WJobuA6mh0a6j028os=;
  b=l5LsNdCDMdgrOcJpxCo6lyr20phsEYfYEevEGQY3A+BMp+SMEF24V9SI
   nnNUcollQMeDI0CyhqaCL6kbVlEfz00cY2z5NtYC6OZOfJfc3xcDLzR2U
   koKM1+UOzntglQfUH9Eoi2bYowwrT8soTFnySLDCWFULKMQK5K1PFgKbg
   GL5r7zk8DFtW/gk/2uTb3bdZLFANu4Nz07Vw7yqCFp1NVekVcLNKBLtED
   hIrwQ+aWp5i3UX1QUH3ejKvJAq6870cseFluPgIp9Zs18VUfuejSGGGP4
   CCpmV3w5qCci12sspw+++hOJHBJ0rJn6AuPcDi8ZMMrDhzGWlFllqPTTo
   Q==;
X-CSE-ConnectionGUID: CFE6WrCTRxWiNaCNQ9Np2A==
X-CSE-MsgGUID: oKZ/Bt7BSlKenc8S8loAeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16283370"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="16283370"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 03:34:55 -0700
X-CSE-ConnectionGUID: VwUPJBFIQ0i9JrzWzLa7rA==
X-CSE-MsgGUID: 0R6/esdBSDizT7t/1EsTyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="81501084"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 Jun 2024 03:34:53 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMPzG-000FCH-1c;
	Wed, 26 Jun 2024 10:34:50 +0000
Date: Wed, 26 Jun 2024 18:34:24 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 5561/7880] kismet: WARNING: unmet direct
 dependencies detected for CRYPTO_LZ4HC when selected by EMM_ZRAM_CONF
Message-ID: <202406261841.wwG2XDVw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ca7064b2308b42201419e17b030e6a9347be29cd
commit: 5723adb73901b05640a72b59bfa6125a3a469cd3 [5561/7880] emm: configs: enabled EMM related configs
config: loongarch-kismet-CONFIG_CRYPTO_LZ4HC-CONFIG_EMM_ZRAM_CONF-0-0 (https://download.01.org/0day-ci/archive/20240626/202406261841.wwG2XDVw-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240626/202406261841.wwG2XDVw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406261841.wwG2XDVw-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CRYPTO_LZ4HC when selected by EMM_ZRAM_CONF
   WARNING: unmet direct dependencies detected for CRYPTO_LZO
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - EMM_ZRAM_CONF [=y]
     - EMM_ZRAM_CONF [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_ZSTD
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - EMM_ZRAM_CONF [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_LZ4
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - EMM_ZRAM_CONF [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_LZ4HC
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - EMM_ZRAM_CONF [=y]
   
   WARNING: unmet direct dependencies detected for MEMCG_ZRAM
     Depends on [n]: CGROUPS [=y] && MEMCG [=y] && SWAP [=n]
     Selected by [y]:
     - EMM_ZRAM_CONF [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
