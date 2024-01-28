Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA2D6FA9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jan 2024 05:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706420060; cv=none; b=TGvMwICvn6L6LR2n1MQ23y65Mk3AxQtuPq8hlOaYvfmS/G8Qt+UAcYdveQMUpo7rMMjENqUMhNjxb42SkYJ3GWUUAu6LjHQ0KOZVwZJilIA8iO4CDolU4f4c3jfCDABh3uhYofyDk7R0Yq/f3vHphO4moJB9LUm2/YWWKenIsPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706420060; c=relaxed/simple;
	bh=Qnmvl794rnRdeyOqNCVu16iJKI56LuGWzYCa73H9AWM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bwDKEXZ5J31Y8X404yZvVP22MsnqRmWNGLM9jEtGoeNWqSD9E1hEQMxVayeRWCA3Zk1iRCfz/wkvob+JwnJ16Y64yokbTfuJvy5enVYN7GU9PBfDOrt6beGTlDWMUrc+MyMhaDEvxpXq42os9aOyBM/EopVs8zoie18lZKq0/4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kjnEgiFo; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kjnEgiFo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706420059; x=1737956059;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qnmvl794rnRdeyOqNCVu16iJKI56LuGWzYCa73H9AWM=;
  b=kjnEgiFosf47A9L27j2u25N2AhXsoCtY/Bw1vKmMATxgoSwvtmjS6dOh
   k3/KFj/YxuLEk9ed82jsdc6schsXTZ9z/+3ih5CohpbPx5GoAds8eNSKO
   eW4xHDKJJNcUukYreF7JxZNsehw9KvukImJBtcMa3mGb5a2j11r6oY2n2
   xQ1aH3Nszw3gPBb2kluKgZ2zxydUJu5GGl/sMP8olOOYwmVf4U9AbCpfc
   JnR5WtMalLbeCECnb6HMuAiRL93NIH5cmKMUg3U1CQ90to7MKhQXY0/3g
   RtSnja19VzI87QSC0rRPyNkJdfnPiQm+t/5zmEvSyTG9zgt4ysgAmh9QG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="24212930"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="24212930"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 21:34:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="3067959"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 27 Jan 2024 21:34:14 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTxo4-000374-26;
	Sun, 28 Jan 2024 05:34:12 +0000
Date: Sun, 28 Jan 2024 13:34:02 +0800
From: kernel test robot <lkp@intel.com>
To: Patricia Alfonso <trishalfonso@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>,
	Vincent Whitchurch <vincent.whitchurch@axis.com>,
	David Gow <davidgow@google.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Dmitry Vyukov <dvyukov@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>
Subject: mm/kasan/kasan.h:485:2: error: #error kasan_arch_is_ready only works
 in KASAN generic outline mode!
Message-ID: <202401281301.YwKiPtas-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Patricia,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8a696a29c6905594e4abf78eaafcb62165ac61f1
commit: 5b301409e8bc5d7fad2ee138be44c5c529dd0874 UML: add support for KASAN under x86_64
date:   1 year, 6 months ago
config: um-randconfig-001-20240127 (https://download.01.org/0day-ci/archive/20240128/202401281301.YwKiPtas-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240128/202401281301.YwKiPtas-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401281301.YwKiPtas-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/kasan/generic.c:34:
>> mm/kasan/kasan.h:485:2: error: #error kasan_arch_is_ready only works in KASAN generic outline mode!
     485 | #error kasan_arch_is_ready only works in KASAN generic outline mode!
         |  ^~~~~


vim +485 mm/kasan/kasan.h

e2db1a9aa38149 Andrey Konovalov 2021-02-25  481  
af3751f3c2b628 Daniel Axtens    2021-06-28  482  #ifndef kasan_arch_is_ready
af3751f3c2b628 Daniel Axtens    2021-06-28  483  static inline bool kasan_arch_is_ready(void)	{ return true; }
af3751f3c2b628 Daniel Axtens    2021-06-28  484  #elif !defined(CONFIG_KASAN_GENERIC) || !defined(CONFIG_KASAN_OUTLINE)
af3751f3c2b628 Daniel Axtens    2021-06-28 @485  #error kasan_arch_is_ready only works in KASAN generic outline mode!
af3751f3c2b628 Daniel Axtens    2021-06-28  486  #endif
af3751f3c2b628 Daniel Axtens    2021-06-28  487  

:::::: The code at line 485 was first introduced by commit
:::::: af3751f3c2b6282bebcb56c35bbe4c8b671f80aa kasan: allow architectures to provide an outline readiness check

:::::: TO: Daniel Axtens <dja@axtens.net>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
