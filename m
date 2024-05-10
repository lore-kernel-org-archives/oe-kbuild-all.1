Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A2B29CE1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 May 2024 03:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715310465; cv=none; b=Cc40D+teKgkzq1a3bJXlMha3fXvBM9+F+zHZnLiAirQCQaVJiAZFA61K73RKDuNReDYwRjBlMeJm0smbRxJk9PBP/Q8cipkwrtfo5UXQ0f3xer8F9VQsYRVOcy0VNgUxABdISh3phy5x1xNTRfnj2SsGZxTTCA4Qhb3txzAMbTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715310465; c=relaxed/simple;
	bh=k5JlauAL+hUz+FuvTEoQVxTjGjBHwzd7DDb4MgPT3Gs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ln/3Il51eMbx9hyXsKA3SXTKOvxf8AYdKRCBy0l9b5+bdxaKiadOJfj4wvU22Fn+6YwQJveaX3hhTA/DO3pIa6fdnjC9+TvNoskNWCAUnK96hD9ndCOhup6Cbwybl3jcIwiTzg8ise2dYX+AbHV4IOcOJBcFJy3A9bkWmQzkv8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SEq9xceo; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SEq9xceo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715310464; x=1746846464;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k5JlauAL+hUz+FuvTEoQVxTjGjBHwzd7DDb4MgPT3Gs=;
  b=SEq9xceop+SVzcx9ZA23fCNsCinyDLfdULYz8rqI6ayx5aKV3nhNIGFP
   9WXJOujgfNWG+iqq1E5aaNzw0qShIBfxwb5IrgpAQvSRBy/TxiQBro2FN
   wMsU6inSKah63OiKmyojq7oSceqFVRegAD6d8pkzZAS3xd0pLeGdewIRm
   XaD1xlFHqED1hL3vOSJqZ+wy4VKLUqkm3xLV/sJhyiHVdHrrD4JwauUbK
   aHhnQyUgMDDT/9DKdRkQsnpvrTK+rOexc9/fD9MAyNn5wo/LA626ofZL2
   T6yNKN4ZKd2Hi09t8z/q3FWDFtbQGB9IGBEdkIjdAR3twrxAMcl5mdYX+
   w==;
X-CSE-ConnectionGUID: NOsLjCTLSMePeJVXNQC3Ow==
X-CSE-MsgGUID: O8nOeJjOTgi7JCY5KLEU0w==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="21847650"
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; 
   d="scan'208";a="21847650"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 20:07:44 -0700
X-CSE-ConnectionGUID: tf9fBVdAQwG8LsLCZRnDOQ==
X-CSE-MsgGUID: pRj6I2SKTDKmv2BxHURuEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; 
   d="scan'208";a="60634916"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 May 2024 20:07:43 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5Gbk-0005ew-0o;
	Fri, 10 May 2024 03:07:40 +0000
Date: Fri, 10 May 2024 11:07:29 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/dts-panel-timings 1/9]
 drivers/net/wireless/intel/iwlwifi/mvm/tests/../mvm.h:23:10: fatal error:
 iwl-op-mode.h: No such file or directory
Message-ID: <202405101140.NKzk8mrx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Krzysztof,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/krzk/linux n/dts-panel-timings
head:   e1ccbcf1aa7ffc798c7dc81e9698e1a913fe5f7f
commit: b010817abf0197596fbfddf1957bac968facb991 [1/9] Revert "kbuild: use $(src) instead of $(srctree)/$(src) for source directory"
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240510/202405101140.NKzk8mrx-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240510/202405101140.NKzk8mrx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405101140.NKzk8mrx-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/wireless/intel/iwlwifi/mvm/tests/links.c:8:
>> drivers/net/wireless/intel/iwlwifi/mvm/tests/../mvm.h:23:10: fatal error: iwl-op-mode.h: No such file or directory
      23 | #include "iwl-op-mode.h"
         |          ^~~~~~~~~~~~~~~
   compilation terminated.


vim +23 drivers/net/wireless/intel/iwlwifi/mvm/tests/../mvm.h

c4ae8b9d0f3217 drivers/net/wireless/intel/iwlwifi/mvm/mvm.h Luca Coelho       2021-06-12  22  
8ca151b568b67a drivers/net/wireless/iwlwifi/mvm/mvm.h       Johannes Berg     2013-01-24 @23  #include "iwl-op-mode.h"
8ca151b568b67a drivers/net/wireless/iwlwifi/mvm/mvm.h       Johannes Berg     2013-01-24  24  #include "iwl-trans.h"
9fca9d5c9745a1 drivers/net/wireless/intel/iwlwifi/mvm/mvm.h Johannes Berg     2017-06-01  25  #include "fw/notif-wait.h"
8ca151b568b67a drivers/net/wireless/iwlwifi/mvm/mvm.h       Johannes Berg     2013-01-24  26  #include "iwl-eeprom-parse.h"
d962f9b1013b32 drivers/net/wireless/intel/iwlwifi/mvm/mvm.h Johannes Berg     2017-06-01  27  #include "fw/file.h"
3444682a9f5ee5 drivers/net/wireless/iwlwifi/mvm/mvm.h       Chaya Rachel Ivgi 2015-04-19  28  #include "iwl-config.h"
8ca151b568b67a drivers/net/wireless/iwlwifi/mvm/mvm.h       Johannes Berg     2013-01-24  29  #include "sta.h"
8ca151b568b67a drivers/net/wireless/iwlwifi/mvm/mvm.h       Johannes Berg     2013-01-24  30  #include "fw-api.h"
99545924a10c2c drivers/net/wireless/iwlwifi/mvm/mvm.h       Johannes Berg     2013-06-14  31  #include "constants.h"
235acb1894321f drivers/net/wireless/intel/iwlwifi/mvm/mvm.h Johannes Berg     2017-06-01  32  #include "fw/runtime.h"
7174beb60c5320 drivers/net/wireless/intel/iwlwifi/mvm/mvm.h Johannes Berg     2017-06-01  33  #include "fw/dbg.h"
e7a3b8d87910bb drivers/net/wireless/intel/iwlwifi/mvm/mvm.h Luca Coelho       2017-09-21  34  #include "fw/acpi.h"
6d19a5eba5cda2 drivers/net/wireless/intel/iwlwifi/mvm/mvm.h Emmanuel Grumbach 2021-11-12  35  #include "mei/iwl-mei.h"
9c4f7d51274022 drivers/net/wireless/intel/iwlwifi/mvm/mvm.h Shaul Triebitz    2018-01-14  36  #include "iwl-nvm-parse.h"
8ca151b568b67a drivers/net/wireless/iwlwifi/mvm/mvm.h       Johannes Berg     2013-01-24  37  

:::::: The code at line 23 was first introduced by commit
:::::: 8ca151b568b67a7b72dcfc6ee6ea7c107ddd795c iwlwifi: add the MVM driver

:::::: TO: Johannes Berg <johannes.berg@intel.com>
:::::: CC: Johannes Berg <johannes.berg@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
