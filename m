Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D5A193432
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Nov 2024 23:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732750638; cv=none; b=QX5FcABTmOvT5QK0Jg2Mwqy8Q6keViK2VaizKgvq6BM4FUZhUMdZTnQBsIEwKe7LteztJasZ604RDc5JQhW/UdfPI6RvJOgn9jRd2G6Cnlgz/6R6B3b6mZ1yp6O3QgfBKcn7+wV4HohpTCCd4Yq14d7r1ZoIyPBMwSr7rbz8Zvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732750638; c=relaxed/simple;
	bh=7JrchfkMrDmo8koevSsjpxAMyH8gB8YbumIvgUCLAsc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KiHmuAUq7/CQMvpXsLD15h8YodDGumsiPtN44qF/RJACoq1F20jwDmpBNNdwCOzCDOW7ftkbM7DQLiEDH+nRvirL09hNRFuwXx267AmXR+mmxycCcZq1/EwEt73sEfcY8nigbDrwtCwlXavIRnsFZTON7Rk5nuMETDATnd58bR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CTaQUZZ6; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CTaQUZZ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732750638; x=1764286638;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7JrchfkMrDmo8koevSsjpxAMyH8gB8YbumIvgUCLAsc=;
  b=CTaQUZZ6iIl/mFkSwS7JiHzMIaiU3vU/umAQZ5ObAtcTdOPdT3q2NeCF
   BASs/ycb2Nk4jMQcTcME8lNDALrFlrWwxFTsw7bmk73BfYbUNVJuJC0ml
   GD2qQBvo+ACVQqD33glMBudQC0Y7h92VMPRN1wRHEgEfGgvcRsyBOp5Bm
   t6b3gR2gskO+xyE3IWGtIXnasnh4+ytdMCxISrBYrnqU3jFd4kMgxKW5Y
   Ap7tMgt+GrJMN+QSxWoesV+gJyY2U/79ulRn6BG0KYcIWxXmKctQlW7ZN
   I/MuL18JvBdBSQuPVYXuWZHzc1olVefreE9SCcloOEJx7DmGGABkrcDkG
   w==;
X-CSE-ConnectionGUID: IncfmTFeQ7W7hO2WMb2ZCw==
X-CSE-MsgGUID: Gp5MFnAfS6eoBkEPmcTi0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="44032353"
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; 
   d="scan'208";a="44032353"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 15:37:17 -0800
X-CSE-ConnectionGUID: E2NEZAXJSpugBWi14rcM5Q==
X-CSE-MsgGUID: Y9mzMd3wQ1GDKXGI74kouA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="97143557"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 27 Nov 2024 15:37:16 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGRar-0008Rr-28;
	Wed, 27 Nov 2024 23:37:13 +0000
Date: Thu, 28 Nov 2024 07:37:11 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/optimized_usdt_9 5/12]
 include/linux/uprobes.h:176:33: error: field 'tramp_mutex' has incomplete
 type
Message-ID: <202411280751.1RaRqso9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/optimized_usdt_9
head:   b1d916ea335d828e290e0c2bb8bb5bebdf0b633a
commit: 9151504d74ead16a6d8e1d163df0f46df5cfa008 [5/12] uprobes: Add mapping for optimized uprobe trampolines
config: arm-tegra_defconfig (https://download.01.org/0day-ci/archive/20241128/202411280751.1RaRqso9-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411280751.1RaRqso9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411280751.1RaRqso9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mm_types.h:16,
                    from mm/init-mm.c:2:
>> include/linux/uprobes.h:176:33: error: field 'tramp_mutex' has incomplete type
     176 |         struct mutex            tramp_mutex;
         |                                 ^~~~~~~~~~~


vim +/tramp_mutex +176 include/linux/uprobes.h

   172	
   173	struct uprobes_state {
   174		struct xol_area		*xol_area;
   175		struct hlist_head	tramp_head;
 > 176		struct mutex		tramp_mutex;
   177	};
   178	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
