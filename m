Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F17B43D51E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Jul 2026 09:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785317796; cv=none; b=gvOY5k3cd6MDQbTv9qht9n8sSkbaS7ZyUi13Q92NtckFbbNo1zKYG1408qtMtRzy5SVHzDBtMVp6Qh0cJE9lW2JLDDnFGEqSsDjK92TfkY8JRaTxyj2/VCJMHXjFW27m3HvXqr7DpJJjvIWLNY8D/t0n93kfMs/huUYAhOTw4nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785317796; c=relaxed/simple;
	bh=FyPDdxoObHwWztBA2dgFHnxxEGiM+jt+9cKmVt8tXGI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sZRDYfmM1pi1ka6Cz5AUXOR5BkpUBLmQBrIOBc9+uf++M3lnyMyI/CPzuHaaAlTsqj415Ja8Q9IgTyXZ0W+Ibmdct7Zd7AG/ZuOnGi0zyWbRGbGscq5hzbsUOfcyh2tQiiuknmDY6V09jRTm+rs5U4ZxmB2YbA+KWnisNdcs0CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WC+ypU+v; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WC+ypU+v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785317795; x=1816853795;
  h=date:from:to:cc:subject:message-id;
  bh=FyPDdxoObHwWztBA2dgFHnxxEGiM+jt+9cKmVt8tXGI=;
  b=WC+ypU+vivMCIyxpwqcd3bo6ilI9BMxLLW0bT4IHYP+AbdptsBuZiof0
   SAt5PpOgyKWWjUojtzQucOZNFP3rsNXQM2VUmBOjCjOXEjA3H5SBhtg+D
   6uTBBwPYTkC8xcoj4wJdMHbin1iMVu7h9CbTR2Uff2rki+WPiHUyczn2A
   DEit82EoNBj9mK9d594+sj76Ql0TXFOMbxr/NiG00VOU+pryzubxtgYD4
   pZXbBjPXcQCfWTOj+iInTZw81XllSdreBIDq6o2PlChXY5DDt0o7wP/gc
   436M88DMg1vcRQsGW3i+tsdNBcAjaVS1ijQoHKWXRu/Xpap6pqpUwUl03
   w==;
X-CSE-ConnectionGUID: fylSq8YKTtqK9dOJt7iY3A==
X-CSE-MsgGUID: SNuGjAxvSkimknUt5QnqRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86108496"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="86108496"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 02:36:34 -0700
X-CSE-ConnectionGUID: 89NUT2w0SgeXqOUsNEok0w==
X-CSE-MsgGUID: JpypsyapScCmiXb8lzSToA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="256045620"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 29 Jul 2026 02:36:32 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wp0iD-00000000fEV-3ZKK;
	Wed, 29 Jul 2026 09:36:29 +0000
Date: Wed, 29 Jul 2026 17:35:33 +0800
From: kernel test robot <lkp@intel.com>
To: Clay King <clayking@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Jerry Zuo <Jerry.Zuo@amd.com>,
 Dillon Varone <dillon.varone@amd.com>
Subject: [agd5f:amd-staging-drm-next 2123/2180] Warning:
 drivers/gpu/drm/amd/amdgpu/../display/dc/basics/conversion.c:145 function
 parameter 'format' not described in 'convert_hw_matrix'
Message-ID: <202607291743.7dCpexdC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   76e667ef60446d435b869360961888cca1500cb6
commit: 2d4886697595c5e216687475c50d54b62058f086 [2123/2180] drm/amd/display: adjust floating point format for gamut remap when needed
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260729/202607291743.7dCpexdC-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260729/202607291743.7dCpexdC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607291743.7dCpexdC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/basics/conversion.c:145 function parameter 'format' not described in 'convert_hw_matrix'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/basics/conversion.c:145 function parameter 'format' not described in 'convert_hw_matrix'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
