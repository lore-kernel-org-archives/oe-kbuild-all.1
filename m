Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FFB32C92
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Mar 2024 15:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711640056; cv=none; b=ibcgRkxQdKl3OwXI6v38JSrLWcQeMUNdcWrjAoK9vRua9p7DVBVm9h2NX/udB6tkK2WyXaGxaq4eDam/2SF2RbeIEmrjyjMx4hBeoRRJPeC2gaR9yNo63jAkKewCHN4zl/X7T+RaumjHiijsXypRlyMMwZridAGePPhXS4PFW8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711640056; c=relaxed/simple;
	bh=x6jPp4jCwHyreBefisRUuxLgFRwgDnN9gENTHvQ0xWU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YEUjpUSRsLzcsRejIpnyQicZEXU/FIsmzuLmlqowkdBr4k5MrK/7pgeV+fDWu4f7nCmWojtfOWj6duRfv256aCjjR6elewr6sndbaTP2Xb3OZx4eNfi08OcOqYuWjT/7sPH2Yo4DHDghJApSKawsQbdZE6xNbuoysSda1A8834c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZGIHwFIk; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZGIHwFIk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711640054; x=1743176054;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x6jPp4jCwHyreBefisRUuxLgFRwgDnN9gENTHvQ0xWU=;
  b=ZGIHwFIk3YFhTaGekgjqLSkiQ20MnTGgcINiau56oc3dexzyjLyS6kRb
   8ibljNsLxAEuBvFEJ2LDpxi5yeVqKTluXEmyMpKKhuwTbkomkeW1YyWAj
   HnoOpjZZE28A2cgmUFLQlNlV7h+dSjjzOakm/iHGPmnO/oM/63enXb5+c
   fxHIbr7zxOS7OVAwcXgDCDtbEynandA+C5eWsi3mFERsWz4IJKKvLwQJf
   PHPhetxMJldlfTkvkDpW2AeN9A0DDUNYVB0Xug66dX4HrrM4G6BFDTcjG
   aMcShw63hJFpqwNZMcs9eQMTMVreYITosyzFi0u19o7qy7eF4/j4GMGcJ
   A==;
X-CSE-ConnectionGUID: egoXNQ8oQo2H39j3DU5GFQ==
X-CSE-MsgGUID: qgD2u2RQT42DbVkqv3dh3g==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="6912012"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="6912012"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 08:34:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="16519441"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Mar 2024 08:34:12 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rprlZ-0002Go-2L;
	Thu, 28 Mar 2024 15:34:09 +0000
Date: Thu, 28 Mar 2024 23:33:53 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zgzxx <zhangguangzhi3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3338/7000] kismet: WARNING: unmet direct
 dependencies detected for PGP_KEY_PARSER when selected by PGP_PRELOAD
Message-ID: <202403282349.LRO1UNJH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   704605877ce9913071214d2515a4c2b9077f5078
commit: 43d4042e06d2bf96adf67d25e8d91653507a4cf9 [3338/7000] KEYS: Provide a function to load keys from a PGP keyring blob
config: loongarch-kismet-CONFIG_PGP_KEY_PARSER-CONFIG_PGP_PRELOAD-0-0 (https://download.01.org/0day-ci/archive/20240328/202403282349.LRO1UNJH-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240328/202403282349.LRO1UNJH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403282349.LRO1UNJH-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PGP_KEY_PARSER when selected by PGP_PRELOAD
   
   WARNING: unmet direct dependencies detected for PGP_KEY_PARSER
     Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=n]
     Selected by [y]:
     - PGP_PRELOAD [=y] && CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
