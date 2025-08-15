Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3818821
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Aug 2025 01:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755220825; cv=none; b=ZK+dycU9ATh56js3pfXJ+17JmoQf5824Czk7jTmBmn2w2obHkWapvGEn1MbTFz1uoJkwOHV4QRoUE+gIGuFGT8t2n6rY8aM+mr8M/aA8G0AT+9kcFDcKq55S8+l0sw6mBfTQM14qtjZwN/H2zTtn+Y29On7FnYzUPN6wQV7A9VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755220825; c=relaxed/simple;
	bh=LOeUM6Oh3nDUL9ObqLUpmTAIWOXVrI736XpKHC35fV0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rs8GzDQHPSq+Tf8M7ubbEBLya75rxzkF1q6pt0jPzKTyUpOCgF6eKpIwwK35rfX1BXBpnfGjMq03IdCOw4mLanPlQ6MGOEL2CTsLae1hxlVBUjK/myG1ZgOkg6FysVriFJtgLTEute/j47POkyf2L0ueJlvaFxf+buU49DEcjwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RK7Jr88Y; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RK7Jr88Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755220824; x=1786756824;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LOeUM6Oh3nDUL9ObqLUpmTAIWOXVrI736XpKHC35fV0=;
  b=RK7Jr88YwrZa4pDiaSDGHVAK5nlZNlguMnSTVbBTdqPGFfiCWXN6bZjy
   oBvIdqrP418vW7BRcOB6SuXpCvDRSOOPVGESXAivtIaaEbge/+au+G/U0
   qsthD0jFDDiyQHhGawAdPbQcIpaacTJulVNUNBls3jzNYwUHZ41w7B4Yj
   lJnCvKhMaFV6RTYcx1mdjVmX5EJwdVdH2/X6pBaJJobaMDRC5Bgd3+Qid
   6QXEKAztkYm5Lwd6Pxg8qit+KxcOfTK1tJaXso4O/0x6fQ5MTNVIkUaEo
   1F2E9uljOSHV+zPJWSwrnO9zO/8pC+jmZOPh7Un+AG1tM5tx6o0AiN60w
   Q==;
X-CSE-ConnectionGUID: xLtDgNewTImNjycrHpjw+w==
X-CSE-MsgGUID: 1NaPwWWnSkG7TXE4D5K3sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="80128890"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="80128890"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 18:20:24 -0700
X-CSE-ConnectionGUID: phn2Qt17S9epSnEQbxkCxQ==
X-CSE-MsgGUID: 393jxoZhTUWBvPXkqrWeuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="167250521"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa008.fm.intel.com with ESMTP; 14 Aug 2025 18:20:23 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umj7E-0000OF-17;
	Fri, 15 Aug 2025 01:20:20 +0000
Date: Fri, 15 Aug 2025 03:20:14 +0200
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 2483/2527] include/linux/sprintf.h:
 linux/stdarg.h is included more than once.
Message-ID: <202508150356.rhIn9Heq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   931e46dcbc7e6035a90e9c4a27a84b660e083f0a
commit: 77ecfa7912a66070bca8efb0ef07e7ffe9c4b35c [2483/2527] Merge branch 'next' of https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508150356.rhIn9Heq-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> include/linux/sprintf.h: linux/stdarg.h is included more than once.

vim +6 include/linux/sprintf.h

     4	
     5	#include <linux/compiler_attributes.h>
   > 6	#include <linux/stdarg.h>
     7	#include <linux/types.h>
   > 8	#include <linux/stdarg.h>
     9	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
