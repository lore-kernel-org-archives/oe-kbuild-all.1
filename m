Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8663936897E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Mar 2026 12:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774181424; cv=none; b=OM+wpPmEdpzzbrVM3G5yZUMTYCiED3h7KT0xKt3tT4dDs8r1qeK73nu1PUB9qg723TMRUi1s/nPsD37P1LggBL+wcE89W4znlRBo5NYQOJ+Jt0tp9xnj9Q7BQKKpkco8pYC9xEs1C5irfy/Rd934z74yoyvytiW6UjZ6PcEQcks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774181424; c=relaxed/simple;
	bh=s0QPTvKuatGTDNmexAqkvyh+xyzyvkRSV3kOWKRHwtg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e996a8cmyDXTkFjRbap1LOZ3UPXpWGWhxKgDw06qBgLfawm2nJQ8inc7NQntr2mqlqVodAuduDHrX9fu+/vL2jA1HnNyCUasDq5cRnRNj17t/lYLsTdT3rA7gBBGWflMD+IavAp6bXcaxCOqNMq88SxhjYbVL/WyM/eLl1GcEDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=alPOytcE; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="alPOytcE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774181422; x=1805717422;
  h=date:from:to:cc:subject:message-id;
  bh=s0QPTvKuatGTDNmexAqkvyh+xyzyvkRSV3kOWKRHwtg=;
  b=alPOytcE0YJ8LI1kWgIHemvlBujvM8bzGMhtAJr7BPeespVUGnHA/WU9
   TZ8WpQKz8uXLqdILpRZn7xz3H8a2rV9/lpo+pWUNmtGrVznSm5HnRU2DT
   CzYK5tKvi1dEelVOUlhH6nZPaKAXHk/71mhzoa5fwaYSs2WdLZPX78gJd
   WFQnZ3fYvecjU9LU3q9tlNDGgKiUYaQx/dTuyCoCX/jWvsGrAgi9xuz5+
   e1I+zpKek7CI67H9qm3kTE07ja3pMDIDqjpzpYlnwfNDhlVBOzAJS2ki/
   OnecTXvVPwWE8qRGUyszpH7veXdFJntmiV4iJJLSlAbsaea6wrLU4woCk
   Q==;
X-CSE-ConnectionGUID: 5qPRW7cdSkaAtE+JwGnNkQ==
X-CSE-MsgGUID: MsS79wc8QSeifC0nsYre4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11736"; a="78801346"
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="78801346"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 05:10:20 -0700
X-CSE-ConnectionGUID: 4mr+dMpDTj+vok1Gsdmk6A==
X-CSE-MsgGUID: yOXBjdvsRGyy6nAbkcv3lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="227856983"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 22 Mar 2026 05:10:19 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4HdI-0000000026T-1PnY;
	Sun, 22 Mar 2026 12:10:16 +0000
Date: Sun, 22 Mar 2026 20:09:30 +0800
From: kernel test robot <lkp@intel.com>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:pte_size 25/30]
 mips-linux-ld:./arch/mips/kernel/vmlinux.lds:14: undefined symbol `PTE_SIZE'
 referenced in expression
Message-ID: <202603222031.Ds63WY4j-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kiryl,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git pte_size
head:   3ecd2bc82d7d0382233099de8d07616df26745c4
commit: e1de23d90976e8ca344a9813e2001d4a9769b745 [25/30] treewide: The rest of the owl
config: mips-allnoconfig (https://download.01.org/0day-ci/archive/20260322/202603222031.Ds63WY4j-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260322/202603222031.Ds63WY4j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603222031.Ds63WY4j-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mips-linux-ld:./arch/mips/kernel/vmlinux.lds:14: undefined symbol `PTE_SIZE' referenced in expression

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
