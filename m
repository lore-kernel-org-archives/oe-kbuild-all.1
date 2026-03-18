Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F741175A96
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Mar 2026 00:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773793269; cv=none; b=KF9nganbkBKe8D7yPQaQOg6Ad1zJY5/7HkRs1Iy4Woky5dZt5Z6z8d1G9kjYuPC+MZRSarcIRvMO5MiKNsyUFHSioRAuYtpqke0tFF1hs9RbMejNq129I9DDCDrvgI050s0lv7Cwo8KIK7HMTutO2tljqgw2N1V2FHcHGB3GeYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773793269; c=relaxed/simple;
	bh=oq2ZqhgFm//+c/ekDPWe+BbwOsCbRR7oScQ9iJZbg90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dIGNbePcj6yk/t+AaD/1FkfgLFQ2lQNgeAMp1TLvsQ931k3mjMJzya0MyAOPDYmCvncFmRo2t1PPMwsv4LzRgm4Dq+wL6gSMi/QWg8KYgfahlU8SJbkfWDfGAFmwWflp7E2Tw1H+scs1d+K0cz+aEeCCtJp+3EY/ZgiYZXUYzWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xal2BPKp; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xal2BPKp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773793267; x=1805329267;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oq2ZqhgFm//+c/ekDPWe+BbwOsCbRR7oScQ9iJZbg90=;
  b=Xal2BPKp42NjLbP4VmdDQGnR6uQkXB0A2xFo2r71IP6DM7wYyZwsi0Eo
   27IxaANgYHLmrE6gYlM931R5Vx2gJUncEfRbspC45EL56wchWS00cuBMh
   ayBgRpRZRTXLNwK3/9mmuFiZ4OaKSkUz6/vEDuSyVyoS6nItZAl1iiHBJ
   /oQnKbMFSiwwt+OPOU4DitIgy8YGapbKfPTQvSOjZev5Z0B7CGrC77WTa
   tI75AZivbgAyAzbgxY4q4Yi5qzFsMzNZFdJDINqj54FMVU4I96qFFcK1s
   +gHQ9LQx1BS0Uai40GeXEDOb3ZIkF0AtHId36D4btVu1E03wa8KFrPRC1
   Q==;
X-CSE-ConnectionGUID: /wL+HqEDSQGfOOXCvM9acw==
X-CSE-MsgGUID: cvVDvgdmR1ut0n9mbOutIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74729611"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="74729611"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 17:21:06 -0700
X-CSE-ConnectionGUID: pHP2SPTDSjmpEfKqdytMLQ==
X-CSE-MsgGUID: MwgKDGBXTvGcpquxZJK+mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="219903878"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Mar 2026 17:20:59 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2eed-000000002EX-2zNc;
	Wed, 18 Mar 2026 00:20:55 +0000
Date: Wed, 18 Mar 2026 08:20:41 +0800
From: kernel test robot <lkp@intel.com>
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org,
	axelrasmussen@google.com, yuanchu@google.com, david@kernel.org,
	hughd@google.com, chrisl@kernel.org, kasong@tencent.com
Cc: oe-kbuild-all@lists.linux.dev, weixugc@google.com, ljs@kernel.org,
	Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, riel@surriel.com,
	harry.yoo@oracle.com, jannh@google.com, pfalcato@suse.de,
	baolin.wang@linux.alibaba.com, shikemeng@huaweicloud.com,
	nphamcs@gmail.com, bhe@redhat.com, baohua@kernel.org,
	youngjun.park@lge.com, ziy@nvidia.com, kas@kernel.org,
	willy@infradead.org, yuzhao@google.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/9] mm/swapfile: Make folio_dup_swap batchable
Message-ID: <202603180851.hRAaHR6o-lkp@intel.com>
References: <20260310073013.4069309-7-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310073013.4069309-7-dev.jain@arm.com>

Hi Dev,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Dev-Jain/mm-rmap-make-nr_pages-signed-in-try_to_unmap_one/20260310-153604
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260310073013.4069309-7-dev.jain%40arm.com
patch subject: [PATCH 6/9] mm/swapfile: Make folio_dup_swap batchable
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260318/202603180851.hRAaHR6o-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603180851.hRAaHR6o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603180851.hRAaHR6o-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/swapfile.c:1757 function parameter 'nr_pages' not described in 'folio_dup_swap'
>> Warning: mm/swapfile.c:1757 function parameter 'nr_pages' not described in 'folio_dup_swap'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
