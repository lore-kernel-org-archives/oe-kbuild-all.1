Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7148246782
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 05:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777528071; cv=none; b=tXr8TEjhwT7+yA5orgfK/pOnckbl7DKdw8LkUNkwLfWEuVGGcSjhAe8HTRd5FwtFqWT1I5YxvR+jnuwcL5w+E7sg70IMny/qs2FJpCWdiMMjOBxUGmCCs/CWkyNd7gpKewW9CMmG5sLxLY9ib/1X98F3yBklHbENAXiQyvEiXBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777528071; c=relaxed/simple;
	bh=YiB5gm30XGU++bJfHdVkm/Q7dmpkxAJMjbH/jg6cLAM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gBhmgVSeUXHHNsAL+sQes0nXNw8VNmYYHEEJH+JolYpJEr0poUJtJIHgfKnAXIJYI3F2jXCDmkDnVXACGC9Wm5773+hNYpnosXUBopzIOmedQuyUVsGfKAP78ZRbs3LH6L6munTLNUVg27/0vdmGlzEy/wASzpp0KqEvqNlSYA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RYrJRWpV; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RYrJRWpV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777528070; x=1809064070;
  h=date:from:to:cc:subject:message-id;
  bh=YiB5gm30XGU++bJfHdVkm/Q7dmpkxAJMjbH/jg6cLAM=;
  b=RYrJRWpVSJSNxSsdxAGNZtjABvdz9F7KCJjZfU+tTDdSiwIwlP+UINPM
   38u6faYOWKtPcs0sZhoK8WevKPNZq7MZIyyxZmxNEvGTW3bDCtfHlWQAT
   GAiW0/sKAihmhLvAfYvAsYRg9/gy+wGtU3Tca9J/NHugV993RlGkcT0wm
   CfzI8yCZUVKOWMDHyeCg6joeBUul3Bco1kHQgFmu93RY0q2cWL/4mamK3
   8Foy9yl1snm5AhfrAwaHEs9nsQ7lQAt9kVBdeHjn+5wc/BoYEe97kWpPb
   dw7jM4nGI3Y1jsDoKHK4AxTIDd9yoG+0RmI+q8QOyJ2x0zCkU/L+pRpEm
   g==;
X-CSE-ConnectionGUID: qlQay5LCRfCIv9Jl0+XthQ==
X-CSE-MsgGUID: 6w74agPFR/+rN2F6SKrVBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="89843580"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="89843580"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 22:47:49 -0700
X-CSE-ConnectionGUID: RY35YS4uSEihCMQj+Fc6UA==
X-CSE-MsgGUID: suG9YXlFSsylH40QjvTWLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="229876210"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 29 Apr 2026 22:47:48 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIKFU-00000000C0W-45tK;
	Thu, 30 Apr 2026 05:47:44 +0000
Date: Thu, 30 Apr 2026 13:47:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20260408 8/20]
 ./usr/include/asm/setup_data.h:35:30: error: declaration does not declare
 anything
Message-ID: <202604301320.6Bws67gn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20260408
head:   6d701ba0454b8785a162a4ed3af4a26b4bd592e9
commit: fe3d1c9338d35f4fe07119f69a86858a762d784f [8/20] x86/setup: Avoid multiple -Wflex-array-member-not-at-end warnings
config: x86_64-buildonly-randconfig-005-20260430 (https://download.01.org/0day-ci/archive/20260430/202604301320.6Bws67gn-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301320.6Bws67gn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604301320.6Bws67gn-lkp@intel.com/

All errors (new ones prefixed by >>):

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
