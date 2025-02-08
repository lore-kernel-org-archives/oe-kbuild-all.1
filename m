Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D362B182BC
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 14:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739025550; cv=none; b=XG9ef5k1kATYe6emkeUZPenBu4kMFlhP5n/exrFSsmQNP6Nx8NZfiOK+XK96dyiAlBMQF/7Xs5u2AYazhKjjz4Jv3Sj5+TOjbbeMMmV8E4mS4ksFEwL/Ga+j2okP6scfWtClMezZBFLE0TKmH5hV2sZgot7RIENj5R7rYLn4vcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739025550; c=relaxed/simple;
	bh=ibSoCAolrU/PAkE85XuYJE+TWzaFzQ8uxcaurG+6x5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t2LHG+E8h58xIklnaJMsQCUUQUi+xLPmz8Hln01JRs+oXypKXGSOn1yoAKHWSyWyFl2fzqDmkGlAWovJwYesldODc7uFU4UbZmPbAGfAb4zQN201tliQ6YUUnC47nzXryc65lzUOY5sUC98SvO1OVAcPWqCOiegnasHXY7vz/jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ock/hQWK; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ock/hQWK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739025548; x=1770561548;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ibSoCAolrU/PAkE85XuYJE+TWzaFzQ8uxcaurG+6x5Q=;
  b=Ock/hQWKshIYrD30eaC0aQs9RrnsCfm6s8brJlepENE5KkAoA5zrNOcH
   OwbZ8SgLQM9zmylg6h1gGApjC1h0eSUUJRNM7xYCfQkxHUDySg2w1ptEr
   EIeProCtycb72ZIpdGiPDRncmGb+Q7OxfRojG968OKpVnMM/regatPboq
   4uZlS21DFNwVr1SSnpPuaMwlA+cww64RVyZpqFQhUQ4maY62mz2fBZhEE
   SvaL3quCyS5IYuRoQW91KMU189oPPt0d2ZttGBTFvrGJLGVWNA4xH+yLI
   RTFV1mjgRVvINFa8QJG3fcwV/qN1bZ+mu5x0pp6+nzip+jRYLsdtnZLnW
   w==;
X-CSE-ConnectionGUID: cWV/vyWrTIWizlKfmHHXGQ==
X-CSE-MsgGUID: hdaVewJdTAKOJ6Oq/2evbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="39811676"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="39811676"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 06:39:07 -0800
X-CSE-ConnectionGUID: +7N3xlktRJOPzUh8IjjDrw==
X-CSE-MsgGUID: A0/db/2tRdGo8xJEL33cHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116385938"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Feb 2025 06:39:06 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tglz5-00105L-0O;
	Sat, 08 Feb 2025 14:39:03 +0000
Date: Sat, 8 Feb 2025 22:38:40 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1418/1418] mm/.tmp_ioremap.o: warning:
 objtool: missing symbol for section .text
Message-ID: <202502082225.bZGoGhTq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   cc7cb040bd0afe96f1da94c9f21eda5a986510a5
commit: 004cface9c1c0b6351473934a4ce452193e05b07 [1418/1418] mm: Move vmap_range from mm/ioremap.c to mm/vmalloc.c
config: x86_64-buildonly-randconfig-004-20250207 (https://download.01.org/0day-ci/archive/20250208/202502082225.bZGoGhTq-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502082225.bZGoGhTq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502082225.bZGoGhTq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/.tmp_ioremap.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
