Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793119716;
	b=ssNWmRJWD6SVlkjInrIYjeAaAPf8Egsd4RTZN+s4UfrWJBx+aCGvqgoqDkLPh05ce3Id
	 u/phXxIhr2VX4XpGHieokKX1YApTb/6hz0Vj7o2ssI8DZhdOncz/J/uw6HjgsUl5QaJSS
	 yeYAuJfY7hRBraHWCkUxZoUMkBgmxU37My+A4C5qnKYbtbZ6VqIbgz3uHcnhtkwNm2e6F
	 odTqjY4mLhGAQc14zEOyAQ88ewXS7uMMhJsUNcK5VsKAufXbsQsxcumY47Zlf2mQ18o/h
	 +vr+Smlo8/u8TsMyduhGcHcWEHiZCupXUsDlREr+DEQo9G4ZL//NSZo36F1LoftxP8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793119716;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=fi8d3EdfWQ+qEdP1Qhi+XNs+aXEeMx080Inax1fkDRE=;
	b=FFUeqL89ZjiRCFjXHnUtBS956hSIyN21BRlPqA+IsbueIrDHzl5T8jdGYSd5n3AnTNRi
	 8d595geinixR0ygXpLGKf9YJPlgCxsS/0W8utmxoG16Cm8G+xtr8mu5XXiacl8Yx83cGh
	 DPQCng/ghUxxr4GtJBQ+JTXLvkGvu7WG7S9Zh3cXkJCkWgIzhff4gjVusYgGSTE2PASpn
	 lp44MOnNQ7KPANTjv3oH2r8bnW8FZX22K9xjEFYu+BNfn8eWNC1/q0ISqnT20YhISmb5R
	 Nt07nfH0Jp9sRVBLkgLIlP/jccYDUGgRNiFiNHevNF+GzdzyOwaeqB47Vt8SikrPBLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Swb42LRY;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D205606A31A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Oct 2026 16:48:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D205606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Swb42LRY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793119715; x=1824655715;
  h=date:from:to:cc:subject:message-id;
  bh=p4EoSfywNezw5sK8ZZNndvkhVFXtO/jP1J/N9ooR770=;
  b=Swb42LRYzrtcNQ4XhjQynnc03hUg9L1TVQXISX0EY0SQ7vsjl48ItCTI
   ZSlj8Uz4joWWRC5CfW5iGNHu7GLnH8GfXOB14mpmJHTNXiXLQ57LcmJN7
   kENmSA07MA3guGmF77NJys2hy4kosjcPLpJkGATIuCk0AAxPGF+3gKooz
   cgRv2ESirUia6kgV6h08+F9/9M9nFbfzE+VszWq8VCowJwvLxFWAUFUVB
   FHkvFwiNSGOagiv4c94WGTujTAvL/1NpFj3Ne4sK5Cz7yXvC7Yt3D0WjS
   Kv2QSOPlQbCKirTFmpaBqKgdb4jt94h7FXoh3DpUMf24pz8Mv2TnBIZs7
   Q==;
X-CSE-ConnectionGUID: MkHw5+z6TsykBxBmwNz+2A==
X-CSE-MsgGUID: GtVq/sahR4SBtmuNco3/RQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1917426"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1917426"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 09:48:35 -0700
X-CSE-ConnectionGUID: VG/sWFxaTIewRe8uG/Izig==
X-CSE-MsgGUID: erLgQNQ3QY6jCSfxoLb8tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4728642"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 27 Oct 2026 09:48:34 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLkLf-000000004ZL-0uJa;
	Tue, 27 Oct 2026 16:48:31 +0000
Date: Tue, 27 Oct 2026 17:48:28 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android18-7.3 1/1] fs/incfs/main.c:15:25:
 sparse: sparse: symbol 'incfs_fs_type' was not declared. Should it be static?
Message-ID: <202610271700.RaVu691T-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android18-7.3
head:   f10481be4b057d0d5c830ae6c352d780a27bf753
commit: 84cf0402d4ab98f85c4a366b78bb12efd230efc7 [1/1] ANDROID: incfs: Use new mount APIs
config: arm-randconfig-r2310-20261027 (https://download.01.org/0day-ci/archive/20261027/202610271700.RaVu691T-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610271700.RaVu691T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610271700.RaVu691T-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/incfs/main.c:15:25: sparse: sparse: symbol 'incfs_fs_type' was not declared. Should it be static?

vim +/incfs_fs_type +15 fs/incfs/main.c

    14	
  > 15	struct file_system_type incfs_fs_type = {
    16		.owner			= THIS_MODULE,
    17		.name			= INCFS_NAME,
    18		.init_fs_context	= incfs_init_fs_context,
    19		.parameters		= incfs_param_specs,
    20		.kill_sb		= incfs_kill_sb,
    21		.fs_flags		= 0
    22	};
    23	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
