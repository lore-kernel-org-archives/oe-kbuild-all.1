Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98C213C9C4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 May 2026 00:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779584047; cv=none; b=HD0J+d8vxKAaM6IAQUt704Hs+/5sHcjmPMOKGHFZ7MqdbrqJnM8TGQcbIAYcDN1BWcyoczSBTWf0KXbacbjW0Qd7iv9nhoQY47+Nf4bVOkjzUTZV59fsJco54RvnU0gCfi6G3EVVTNY8qX9boERcW0v+qLIL4wSVwtfWfOmxqIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779584047; c=relaxed/simple;
	bh=XTuCzt4UnjQy7WwwpxNy/8UMxY/yUlbT9XKAWGNwtEc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ucW+N0q7svGvEaVbWjsl1k2E8Q338qU+pmQNp5hKrj/9ZV2sFogBaJKJRbpshfvsmMJy3rRbNkeuF0Z87uL9Lg8svStGS9H3PhFOvrzK4NjSSKnMwWD029nG2UelHo6iDHeEha+ZTzg6imKLNXI+8tVPTSh5gIxAIol6G3JLylQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mA/N3jVi; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mA/N3jVi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779584046; x=1811120046;
  h=date:from:to:cc:subject:message-id;
  bh=XTuCzt4UnjQy7WwwpxNy/8UMxY/yUlbT9XKAWGNwtEc=;
  b=mA/N3jVitYDcS4IGJyx1R8D0FUo2aOEMCULpUpPcRSU37LzWUzBc7hpg
   j4M0YDoJGkq+BmKtvA6ctpTGOe3ozjOhcGZ6BS/yp6ynThHCCjTl+R1aG
   /XgNnAKTrjdx6hn/1jqkx1hmd9CcVU1UII1711mQyJqqTT1VXgrMLOMme
   lEofzUmFufuLoRnLOsTo/3NoCLp/3qsj84vpBSX1YpjQpWyg0fswuv9/N
   DDQ67N8KGy2tRLuI/08pj+RW+9V0udOqxLpGqqBZE6CzXzq+eZAvAKDO/
   9RTLPSG3vhKMn/XC20p/+XQxAduFYXZfX+FpsCpHR6flP62eevwUobaXu
   Q==;
X-CSE-ConnectionGUID: AkdcsM5BQimPvflRRja9BA==
X-CSE-MsgGUID: vYGDJhDaSqyg0gLUSGXKKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="84345516"
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="84345516"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 17:54:06 -0700
X-CSE-ConnectionGUID: e6BL4HCjRaagTgVlvjG7sg==
X-CSE-MsgGUID: Fiyz64tMT8COupUjSeCSKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="237040109"
Received: from lkp-server01.sh.intel.com (HELO 6ba8523b1a8f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 May 2026 17:54:04 -0700
Received: from kbuild by 6ba8523b1a8f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQx6P-000000000Vl-44jB;
	Sun, 24 May 2026 00:54:01 +0000
Date: Sun, 24 May 2026 08:53:19 +0800
From: kernel test robot <lkp@intel.com>
To: "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 14/1130]
 ./usr/include/linux/netfilter/xt_nfacct.h:13:17: error: unknown type name
 '__uptr'
Message-ID: <202605240810.d4U81HbP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: 1a7f37775859aa02cea0deea860f8baa6ae4502b [14/1130] cheri: UAPI: Fix use of kernel pointer in UAPI netfilter UAPI structs
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20260524/202605240810.d4U81HbP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260524/202605240810.d4U81HbP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605240810.d4U81HbP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/netfilter/xt_nfacct.h:13:17: error: unknown type name '__uptr'
      13 |                 __uptr __nfacct;
         |                 ^~~~~~
   ./usr/include/linux/netfilter/xt_nfacct.h:21:17: error: unknown type name '__uptr'
      21 |                 __uptr __nfacct;
         |                 ^~~~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
