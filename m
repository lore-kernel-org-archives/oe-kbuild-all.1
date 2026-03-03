Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F61138837A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Mar 2026 08:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772525962; cv=none; b=sXZL1Uow43cyryiKiALXuv2qRBwKTS5Ki/heKl6WYuYAdHQlr5XaL4ctkV7/ME6u2P36jPM6ItcEjVb7w1Zet/f80B+PPZaccHUU/pxGZurTRZyJ3dsDLaOAr0Tr3GkhzeaZ3zh/64GbmyOxJKuYxin1LIK+3SltV1SNk8Pc3RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772525962; c=relaxed/simple;
	bh=K4Ng+Irqw3VUpIpKx6unXCf/bRMbGDzVejAU/dZsL+U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FAWQNfc3xCkOr9l4KrqVkaH4M38Es4aFA99EuePUXWVAsiUjN/8tiGs3HVjwdF5CInk5zoqEw8ZkqUnT/9VhwP1Liwl3qDAFKTjyVjKLsmxuyWIz8FKps/vHRfJSTtocPzo55sFNa3oXF5bso9pokUjasy1u3WzKlilHdkOfjtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DCT3zVNm; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DCT3zVNm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772525956; x=1804061956;
  h=date:from:to:cc:subject:message-id;
  bh=K4Ng+Irqw3VUpIpKx6unXCf/bRMbGDzVejAU/dZsL+U=;
  b=DCT3zVNmlPL9js6wlZFcIu5UG8TLfup8oQBI6KzTteC425DnjQRTizLR
   h0lCBnGaY8DsOXF+ZwvwfaVVxdszKsgroeOEevEJ2bRcrID+Hc+9PErmq
   aPObdGUd8JeKKdwneJCyjPVyY+m6QKBcCYO10S+fMbV+zwVCEB+5SazdJ
   0m3nJSMrVRhthn3wMsjnsjCJCRK3N2up7t0bysbEr9krblQQn9mlYh2P9
   fQJehdzDlGDi25J2E6An5mGcAA7o3cRl7jdE7GEEeclvqS/qEYa9qEzHV
   L4dARnEVuxJqf5n7xo/OqeYQjXEv74ikL9HfiEF12niFhFH/lgNC256AP
   A==;
X-CSE-ConnectionGUID: Vcz5m0fLQuaqCXtx8ge4dQ==
X-CSE-MsgGUID: ZtGz2tS8TFq3cvJjM2Yy5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="84643561"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="84643561"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 00:19:15 -0800
X-CSE-ConnectionGUID: B1xd+ak4TDuPYSi36eRc6g==
X-CSE-MsgGUID: dKdwH4jJTVSL7mO1BE82Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="220949322"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 03 Mar 2026 00:19:14 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxKyF-000000001OX-3oRu;
	Tue, 03 Mar 2026 08:19:11 +0000
Date: Tue, 03 Mar 2026 09:18:19 +0100
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20260302 10/12]
 usr/include/asm/setup_data.h:35:30: error: declaration does not declare
 anything
Message-ID: <202603030910.jqhwu54N-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20260302
head:   759ff201de93e9bf74683ac6d4414b9141b12c27
commit: 0c2f151521b10100c7f4415d3ef1f7ae4999634d [10/12] x86/setup: Avoid multiple -Wflex-array-member-not-at-end warnings
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260303/202603030910.jqhwu54N-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260303/202603030910.jqhwu54N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603030910.jqhwu54N-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./usr/include/asm/bootparam.h:5,
                    from <command-line>:
>> usr/include/asm/setup_data.h:35:30: error: declaration does not declare anything [-Werror]
      35 |         struct setup_data_hdr;
         |                              ^
>> usr/include/asm/setup_data.h:36:14: error: flexible array member in a struct with no named members
      36 |         __u8 data[];
         |              ^~~~
   cc1: all warnings being treated as errors
--
   In file included from <command-line>:
>> ./usr/include/asm/setup_data.h:35:30: error: declaration does not declare anything [-Werror]
      35 |         struct setup_data_hdr;
         |                              ^
>> ./usr/include/asm/setup_data.h:36:14: error: flexible array member in a struct with no named members
      36 |         __u8 data[];
         |              ^~~~
   cc1: all warnings being treated as errors

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
