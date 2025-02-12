Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFDC271828
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 12:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739362431; cv=none; b=Xyr96fksZh4aye8DofOiN9xWc/buB4v/ykEn2kVEtHCo/kYZ1ozA2fdPBlymdvcutlJVmIRoLFVurgs8gAtxJlNvMQaD61+pCtZ8ym1wmRvXoAogSdgMCCyMA+et/8Dm29qjJGBEZC71N4XiEqPAdZ0NRRvBb0jw8aS1x+9fCdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739362431; c=relaxed/simple;
	bh=HhOOZbq4h8lkGi+KnY02JvymdovXU7bizGpsDfhfsWA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cQ+HKF2yMlh0mTmf0hSa34zi08QbsUECRELxJxYz1ifZSr5NDuFgH2NsXs9E3rfb48/uOd29bId/4lNYyptBlrnxmTAKuaoYUSnm+QXBest2Q5ppY7+lP3yyETf8Ney18cJeQXn9K/GD7xDy/SFGRDQgUwFzjVqwbXVsauW9xMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NuJZRj0G; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NuJZRj0G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739362430; x=1770898430;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HhOOZbq4h8lkGi+KnY02JvymdovXU7bizGpsDfhfsWA=;
  b=NuJZRj0GW40pLfij4u9192zERwCTqUMIq4ekcjK5UW7wXUjceGNpe9uw
   iFzDv0w/pSmbpJQT8eCIcYDp4OULgTPoFf7cwoWR/xoRK/V0mEtiH5RA9
   nDKlXaQKOFJzuH4w5hh5OBqEqq/o+IRFNNOAPBaYPaHlceF+TpktToQSY
   hir/n8iXHH6xAsvNdwHKZfeeCBblGFp4AHtjsJf/BJSoT3aVf7c4Kc7Fl
   Tmk/ZLhk8SAiG+kZzU+By/rDZx3nu4q+AN2xan2KYMEn0RNQ8AWmzWlFk
   ejz/D/doVfJQQvfJA+pansP3gxrlkLbCd1irjMnsUyuqBZPcl2aZkfzLF
   A==;
X-CSE-ConnectionGUID: gFA50vmZTXS4zz9PJac/NA==
X-CSE-MsgGUID: 3jhnLyT0RQyY83/NPJHXrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="43669644"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="43669644"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 04:13:49 -0800
X-CSE-ConnectionGUID: YvU8FC9YTuy6cRCCpLmYlw==
X-CSE-MsgGUID: zR2l+edVTRu5q3UgLE8VNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117431147"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 Feb 2025 04:13:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiBcf-0015aN-1o;
	Wed, 12 Feb 2025 12:13:45 +0000
Date: Wed, 12 Feb 2025 20:13:12 +0800
From: kernel test robot <lkp@intel.com>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Gregory Price <gourry@gourry.net>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>
Subject: [linux-next:master 2991/3226] mempolicy.c:undefined reference to
 `__udivdi3'
Message-ID: <202502122023.eLwykK2O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c674aa7c289e51659e40dda0f954886ef7f80042
commit: aab5f6eb05fd382835c042853bb0a44198aba71f [2991/3226] mm/mempolicy: Weighted Interleave Auto-tuning
config: sh-defconfig (https://download.01.org/0day-ci/archive/20250212/202502122023.eLwykK2O-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502122023.eLwykK2O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502122023.eLwykK2O-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: mm/mempolicy.o: in function `reduce_interleave_weights':
>> mempolicy.c:(.text+0x3b0): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
