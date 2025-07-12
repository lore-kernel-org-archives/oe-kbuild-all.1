Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E0718D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Jul 2025 19:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752349220; cv=none; b=gbfPndjQTLGruGsmLYO7Z382WkM5RDMG+U+lTDgqlA+eNgXiHpoLktazYIXLKoPZj55GrNQuyL4Aix8FmRs1oROSw+GrHi3GV0RXvzW8Qec2qxbEdyK+IyasS62JyAcihNRrBVspCOupmOmaq2+lhxLyWk6y0qow83v8l+nmS+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752349220; c=relaxed/simple;
	bh=mDad/KR4pimWWg+Kh0Oxg6AiO2xF9/Dsy+dLp+nq0HU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y+F8Hh3P+IJaEOuYMSnVolSNu75/ax09mhMZhngYWK78aYKEgvWuBxBBq5mOIMYQt1ieWulonxUQFJUZ1qstuRXi7Uyj/2FHqUAaMEJZH/sSOF0eFbrVRIRUMSKV8taeUgS3YwhaMQZvTOdsMUGbDTV02XhBFwH/T6LUliap0Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xm6QD5d9; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xm6QD5d9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752349219; x=1783885219;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mDad/KR4pimWWg+Kh0Oxg6AiO2xF9/Dsy+dLp+nq0HU=;
  b=Xm6QD5d9LGOBvMzAvBHXp2je+Iw5E+Sje88EOF2/kmMrInG2N8NsAKQ0
   4XuEuWE99Ofg/HHKFZYY6czFgYKM6pr/e4Yke3t/P2lct8o36lkvQhqAp
   5EFL6SHbxIv4JRRN2UZI1+s9iiNJjvpr+WgTJZVKnWyTh4iKpo6AEqq2R
   94PLZxv9Q7YSc3wNnhJ3JzbI64yIY7oUH6Nse1Ou4N50OUxQqJaIasSm6
   0J4TDzYBOtJzZAwCdxWd6p3RwPzcLS2nsyFzXuDGx4e+Yfd31e0e50LV9
   Grn+cbrbQIfx+KHV0SNsQpmQdk9YJ+z7A+31WGG2aZPzp+TJroFulFUdn
   g==;
X-CSE-ConnectionGUID: /JpLe07vQry23+uwXzyF2w==
X-CSE-MsgGUID: VPQitDT7QDWi1425aLHt6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54462208"
X-IronPort-AV: E=Sophos;i="6.16,306,1744095600"; 
   d="scan'208";a="54462208"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2025 12:40:19 -0700
X-CSE-ConnectionGUID: ecH1Kdi6TY61CrPmyDE8Aw==
X-CSE-MsgGUID: 8Xqffsp6Q9uyKD6TMy4afg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,306,1744095600"; 
   d="scan'208";a="156701722"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Jul 2025 12:40:17 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uag50-0007eJ-2H;
	Sat, 12 Jul 2025 19:40:14 +0000
Date: Sun, 13 Jul 2025 03:39:57 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Zhang <guoqing.zhang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Mario Limonciello <mario.limonciello@amd.com>,
	Lijo Lazar <lijo.lazar@amd.com>
Subject: [linux-next:master 8552/9053] arc-linux-ld: amdgpu_drv.c:undefined
 reference to `pm_hibernate_is_recovering'
Message-ID: <202507130333.ABgltDgA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a62b7a37e6fcf4a675b1548e7c168b96ec836442
commit: 530694f54dd5e097866999bbaebc5c133e5507b6 [8552/9053] drm/amdgpu: do not resume device in thaw for normal hibernation
config: arc-randconfig-002-20250713 (https://download.01.org/0day-ci/archive/20250713/202507130333.ABgltDgA-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250713/202507130333.ABgltDgA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507130333.ABgltDgA-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o: in function `amdgpu_pmops_thaw':
   amdgpu_drv.c:(.text+0x480): undefined reference to `pm_hibernate_is_recovering'
>> arc-linux-ld: amdgpu_drv.c:(.text+0x480): undefined reference to `pm_hibernate_is_recovering'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
