Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A705182
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Feb 2025 00:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740701445; cv=none; b=kE/n18dxVgjRapUQ8j4CQLctDLjq08TqPUs9mJNdVA8FDdVjzVn5RQ6V/gzdyaf4sm8Bz1wHamNRnYNW3tgLIWy/yp9KsSfSVwDPP+0HgzUJYEFi0SDh1Kensimu0+jT5dbL/kKz4Rv6cMk2J9HtJR7g0MxjPi7iQT1v9lJp7F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740701445; c=relaxed/simple;
	bh=CEd+M6a4jHwfX0vrUsL0cFl4jGpd9GqL4nZj6CZNx1o=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sjM/wCbGbZXSODaXLMltrzm+Qp/BJ03I1F39LPOMjNdYAu29AycLDEOE36hdMjOujPAMC0yDa4p8EsrNQBSf2yzi7qMZxwjovTB/Y5ZNM3AGOm9sb65mYJYX0cw5s8tkrapotp9cBCwSheNbkiNNpwSDCuXwGnD/ntcrqIDJaTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ni+vQ2sm; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ni+vQ2sm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740701444; x=1772237444;
  h=date:from:cc:subject:message-id:mime-version;
  bh=CEd+M6a4jHwfX0vrUsL0cFl4jGpd9GqL4nZj6CZNx1o=;
  b=Ni+vQ2smxT3VoMmsKa7CT5wcgF4LzPGW7J+O+oAWmHDfJiSNVny5dIKn
   DE/jfwRuCvSwxS40LfCZ2NkmOg2pgAZNuxhN1sqK+oxCOAksd5Vjln9EM
   tSzSATm91qxlOVsZdu4Ln5JOY3MqrLC+2ZieoambJYfBRAJ5mP48s30oM
   j7uqJ9TsgpdQwYH2PvHUvRF4z61dpA9K8NG2NpWvyYRzdft5hy+KaOmGQ
   jldDCjHaem3RkDeHkTs3h5Bu9RVcv6B6fabi4HY7y7zsAnhfQZQDQjkXW
   Q8thZk8YbSjdt7kH5ynUhzWcE0zvlabpjkeAiyLknJZoXLCMOdFb2LWCK
   g==;
X-CSE-ConnectionGUID: Guc0PbIsQbGHVaS6zcfYoA==
X-CSE-MsgGUID: vGtkEWgKS06izKke+HJ5VQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="52251651"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="52251651"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 16:10:43 -0800
X-CSE-ConnectionGUID: xr4Vo/qLTMWAjo9PgfYhHw==
X-CSE-MsgGUID: +aGG7+oDTH+HdesqUz/nUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="117843899"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 27 Feb 2025 16:10:42 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnnxg-000EDk-0P;
	Fri, 28 Feb 2025 00:10:40 +0000
Date: Fri, 28 Feb 2025 08:10:20 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Zhou Furong <furong.zhou@intel.com>,
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@intel.com>
Subject: [intel-lts:pr/59 1/1] drivers/net/wireless/bcmdhd/include/wlioctl.h:
 proto/bcmip.h is included more than once.
Message-ID: <202502280830.uSHq5EVX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/59
head:   19ae9bc73680fd6c1c95edb5b7e2aaa790e7f011
commit: 36100482e8bdc4b5c45f6db9f8f5023422674528 [1/1] VENDOR: broadcom: bcmdhd: support the wifi module on kylin board
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502280830.uSHq5EVX-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/net/wireless/bcmdhd/include/wlioctl.h: proto/bcmip.h is included more than once.
--
>> drivers/net/wireless/bcmdhd/wl_cfg80211.h: linux/wireless.h is included more than once.
--
>> drivers/net/wireless/bcmdhd/bcmxtlv.c: stdlib.h is included more than once.
--
>> drivers/net/wireless/bcmdhd/wl_cfg80211.c: proto/ethernet.h is included more than once.
>> drivers/net/wireless/bcmdhd/wl_cfg80211.c: linux/kernel.h is included more than once.
--
>> drivers/net/wireless/bcmdhd/include/linuxver.h: linux/sched.h is included more than once.
--
>> drivers/net/wireless/bcmdhd/dhd_linux.c: linux/notifier.h is included more than once.
--
>> drivers/net/wireless/bcmdhd/include/linux_osl.h: linux/kernel.h is included more than once.
>> drivers/net/wireless/bcmdhd/include/linux_osl.h: linuxver.h is included more than once.
>> drivers/net/wireless/bcmdhd/include/linux_osl.h: linux/string.h is included more than once.
--
>> drivers/net/wireless/bcmdhd/wl_cfgvendor.c: proto/ethernet.h is included more than once.
>> drivers/net/wireless/bcmdhd/wl_cfgvendor.c: linux/kernel.h is included more than once.

vim +38 drivers/net/wireless/bcmdhd/include/wlioctl.h

    35	
    36	#include <typedefs.h>
    37	#include <proto/ethernet.h>
  > 38	#include <proto/bcmip.h>
    39	#include <proto/bcmeth.h>
  > 40	#include <proto/bcmip.h>
    41	#include <proto/bcmevent.h>
    42	#include <proto/802.11.h>
    43	#include <proto/802.1d.h>
    44	#include <bcmwifi_channels.h>
    45	#include <bcmwifi_rates.h>
    46	#include <devctrl_if/wlioctl_defs.h>
    47	#include <proto/bcmipv6.h>
    48	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
