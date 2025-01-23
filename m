Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A541BDAB5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jan 2025 23:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737676325; cv=none; b=Xqgu31SNaIwwOhXbhnbIqOV6IzEgmxEhbpNx85GwnGtPy66VYIq8pG4Ry8SSkgfi22klMYh5+yJDsPVf5n6Q1tq2AaBp3cI+bIrn+DsDm3WEXdAIMLbik9SvV/wXuC+mWL0VkjpFDaEG+xqFQ8Yar6UyN6BFWybGHeKer4s8IVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737676325; c=relaxed/simple;
	bh=V+jcjrWWR1DZd0Qez6QdTyX7xRAKJoodykcO3+8Kmtw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uo3HEM+05a/9buDPmMDlCzPML8kE6YkPpVriVjhx/40kVk2ezVcvUE4uI3PMgeZJZwxG0uTMHQdmSaKteVp15k2U/pnsO7AZr++GBQe/SKk1Tap4avemUQ2b181VepQANw9SYXFruQMMa92E5WBCU6pFKliUsecl+izMIUcxUVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Az8loKoT; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Az8loKoT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737676323; x=1769212323;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V+jcjrWWR1DZd0Qez6QdTyX7xRAKJoodykcO3+8Kmtw=;
  b=Az8loKoTjjNJRZi/g51z5vnp6bNfptNq4OKGXxtp0d2Rgk4Jz+BUJFu+
   dnpn8o2uYBtSitwUfeQyEWHufxYQ8ZvPzJRn8lz/YWikGjO4uf0lnbntJ
   Y4cQW7VP2fO0NtDlnrgYpm9K4QtG7+Uc0cBNrYKTszfLpJMm0xauySR2s
   iaWB9p9oV0H5m/cEr0/OIJKA7eKDEISNFijAgvAYMsDnn6sXGEeauSe3n
   SdaMLITLxb0EZpRcVDnVCVlaSlHdXlUAU7ZQu6hpvf1GSMSfNU+hA6jWY
   OSyoAJWT1nDjU/gfkBheVNIpeNVekD+cQDtI8RuBrh3xy67YkMlwyUNMc
   Q==;
X-CSE-ConnectionGUID: BbbvkuLcS2WsXG3CyfHF6Q==
X-CSE-MsgGUID: 7x/zFGd3Tim7Lty3DRWM8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="37459608"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; 
   d="scan'208";a="37459608"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 15:52:02 -0800
X-CSE-ConnectionGUID: 5Z+Pg6mKTR+VQQxZsaOqIw==
X-CSE-MsgGUID: JItuq8JxREihm1lk7JKrKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; 
   d="scan'208";a="107610522"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 23 Jan 2025 15:52:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb6zO-000bsN-1w;
	Thu, 23 Jan 2025 23:51:58 +0000
Date: Fri, 24 Jan 2025 07:51:02 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zgzxx <zhangguangzhi3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1841/1841] kismet: WARNING: unmet direct
 dependencies detected for PGP_PRELOAD when selected by
 PGP_PRELOAD_PUBLIC_KEYS
Message-ID: <202501240749.GUsIJE1V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   30472c94514880cf07700ef041e5c611a6d6888e
commit: 43d4042e06d2bf96adf67d25e8d91653507a4cf9 [1841/1841] KEYS: Provide a function to load keys from a PGP keyring blob
config: x86_64-kismet-CONFIG_PGP_PRELOAD-CONFIG_PGP_PRELOAD_PUBLIC_KEYS-0-0 (https://download.01.org/0day-ci/archive/20250124/202501240749.GUsIJE1V-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250124/202501240749.GUsIJE1V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501240749.GUsIJE1V-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PGP_PRELOAD when selected by PGP_PRELOAD_PUBLIC_KEYS
   WARNING: unmet direct dependencies detected for PGP_PRELOAD
     Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=n]
     Selected by [y]:
     - PGP_PRELOAD_PUBLIC_KEYS [=y] && CRYPTO [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
