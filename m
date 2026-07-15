Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4B73D953D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Jul 2026 12:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784117970; cv=none; b=r3XbrAW2EmOvAgHSfc5kP/TbtpNGpyOyHzInzGUfKgkL+6ztzuJ4zXnBwLaqNou1TH8P/c01BZUIf2tQnB/FQz9nNSA3LXYVVmc20nOJG+KPXeFiWVDzIdY8rVgvg7Oc7HkNXcBGoTeSiLyOI2etHJKpX5NHWlyKjvgCbmo5RNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784117970; c=relaxed/simple;
	bh=OgarXVnrYDC69yIxgPyvUQJc3jsCLVsIkkwknOihnHE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ioNDpIthhnxolMGDLsr6FtQv9LGZZBDak162Q2rd7FfM5ir7ZwvkAQ2ApzSkI+XlxUc3Otu5eGTTNzeX77XO6eLrjvyw6HN3kZRai8VfgLLUO9tlOLbrqsoqePL2vvvnVXXIe63wYiV3S26jpKaDVAH9Gdf/O6N540JsBnMR6qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I3poCxek; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I3poCxek"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784117968; x=1815653968;
  h=date:from:to:cc:subject:message-id;
  bh=OgarXVnrYDC69yIxgPyvUQJc3jsCLVsIkkwknOihnHE=;
  b=I3poCxekAii7L1pXcgzvwF0p5pZzmr3w/FduiBXDk0uBog0ML8xQkVDd
   9czGMoEKjx8RY1eVE3TtNHpKy8cmHzAWtCdhAq99sbYYoV26pv/IpP3hn
   DsYvdRHd60fJvmo3ZLYgq7iVJH1H5f4txHyckUFVtdfUZe8IbU9zVfttm
   IkcAWmPAu+aAMTas9jOuKA+UZgMPMIfb23I1kAYq9bLeSztMRKucgpPNe
   qpOm5/Fe/1h5GhFeGolNARzXAbXdsTQkyuPQDNVC7ILYS0W+ohIdQXjqe
   H6PJDzAxlrqnj5hp/bzRgR44gaRA8TTMiM876Lina+NJDe1vDh+MNWOui
   Q==;
X-CSE-ConnectionGUID: AGlpt0v/TiGLd5WBXFmBAQ==
X-CSE-MsgGUID: H5QjzKzgQK6a62M4rb1r/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="83872976"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="83872976"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 05:19:27 -0700
X-CSE-ConnectionGUID: pg8ORdLiRnG7MnpeTVxeqg==
X-CSE-MsgGUID: gVD2ND1KQKyuzwxtoTivBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="255046714"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 15 Jul 2026 05:19:26 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjyaB-000000004FV-1YuF;
	Wed, 15 Jul 2026 12:19:23 +0000
Date: Wed, 15 Jul 2026 14:18:36 +0200
From: kernel test robot <lkp@intel.com>
To: Prike Liang <Prike.Liang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Michael Chen <michael.chen@amd.com>
Subject: [agd5f:drm-next 109/155] Warning:
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1046 function parameter 'queue' not
 described in 'amdgpu_mes_alloc_proc_ctx_index'
Message-ID: <202607151416.vo4dHmX1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   7ca36e897bceeedf917bf98f024f5d2c8e87324d
commit: aa459cc2497b947fc02f7143d6bac9689b18a443 [109/155] drm/amdgpu: add mes process context alloc/free
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260715/202607151416.vo4dHmX1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260715/202607151416.vo4dHmX1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607151416.vo4dHmX1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:958 function parameter 'mes' not described in 'amdgpu_mes_rs64mem_fini'
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1046 function parameter 'queue' not described in 'amdgpu_mes_alloc_proc_ctx_index'
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1071 function parameter 'mes' not described in 'amdgpu_mes_free_proc_ctx_index'
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1071 function parameter 'queue' not described in 'amdgpu_mes_free_proc_ctx_index'
   Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:958 function parameter 'mes' not described in 'amdgpu_mes_rs64mem_fini'
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1046 function parameter 'queue' not described in 'amdgpu_mes_alloc_proc_ctx_index'
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1071 function parameter 'mes' not described in 'amdgpu_mes_free_proc_ctx_index'
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1071 function parameter 'queue' not described in 'amdgpu_mes_free_proc_ctx_index'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
