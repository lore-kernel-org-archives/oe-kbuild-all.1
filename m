Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6888829346F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 04:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790137917; cv=none; b=czrWQagSGVyUSVeJczjh9UBhkCJVaVj9DffPfkiEiK9CLsmDmxLIpuEcIXYTKf+U3tZchhZjWY4q49JsgoP+Bb3mbzyEre5xcVwJoCVlQDkQX66n7Bqak2yZjC1GPY7h+0Ul9iStMm17s+1xDLwcce96ct7SOumoJimIOqX4HQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790137917; c=relaxed/simple;
	bh=dANUgt63zs4u5BrC09JBLdCPNg2U5p4Hj9jypaUr2Mg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HmPsxx6TW203S66VZHZIZYZtK7vAe8mhEvTTv4l/FzQWGsG1hf3PBx/yjDcLfSXepqR0ygxWmE2Osq0/7ySDfGXSoi49P6n2rEMN/tgNO8Eru7K8T97USpx7QYlJCZojryfXoWuZdoKFpfj+hTweqy1+PzzwlinqOpvb5U1PnYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DiF9x0Qj; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DiF9x0Qj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790137915; x=1821673915;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dANUgt63zs4u5BrC09JBLdCPNg2U5p4Hj9jypaUr2Mg=;
  b=DiF9x0QjI6s8azlibDGWF6EnwDvJooNFWpBUHTVYbAlmIZ40cGkXbV6W
   EksC/wBnmtwgb8TrqP1xUTtXV+M3UxYN+S7BjZxL+sTA/NlbeCcTdbwo1
   jsRPVfhnqH1NHdeEDvKb7tKbfc80q6YuqNHNkhs3/qAkM+kFbh99n5i2U
   eiHOWjn3MX4I4BVcXk4rn/KYe2HaU44XxQc/tlmJkdMnTMuZEc5jC7dIq
   ncz1uZHBvdoGIcJsug11zkWMe33lk7zmqWi0ZNGVaZt/LwQn7thymhmDb
   XAzvet6bQxG5DE6FY5lmYbqfdAP/i02PqKOeDy+keEI6ke1UdHTVGOBLb
   Q==;
X-CSE-ConnectionGUID: vXbqIUrhQAKM/Nwm4M9A7g==
X-CSE-MsgGUID: eEXPAt0MTFS8qtzu4M+SLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="102154698"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="102154698"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 21:31:55 -0700
X-CSE-ConnectionGUID: 5XMjQoiHRHOwBIkvD+Z6+Q==
X-CSE-MsgGUID: DIpMBRKoTLmXu5eTTL3KnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="301354904"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 22 Sep 2026 21:31:53 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9Ee7-000000000Ux-27j7;
	Wed, 23 Sep 2026 04:31:51 +0000
Date: Wed, 23 Sep 2026 06:31:21 +0200
From: kernel test robot <lkp@intel.com>
To: "Timur =?utf-8?Q?Krist=C3=B3f"?= <timur.kristof@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [drm-amdgpu:drm-amdgpu-next 76/114] Warning:
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c:756 Excess function parameter
 'restore' description in 'sdma_v4_4_2_page_resume'
Message-ID: <202609230641.k3wjo8bh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.freedesktop.org/drm/amdgpu/kernel drm-amdgpu-next
head:   cf48bd0a46279f4607956cb17c71bda96ee802e3
commit: 0518c66cf841f5f701143ffa72840ad367838490 [76/114] drm/amdgpu/sdma: Fix executing duplicate commands after recovery on SDMA v4.4.2
config: arm-randconfig-r2201-20260923 (https://download.01.org/0day-ci/archive/20260923/202609230641.k3wjo8bh-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609230641.k3wjo8bh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609230641.k3wjo8bh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c:756 Excess function parameter 'restore' description in 'sdma_v4_4_2_page_resume'
>> Warning: drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c:756 Excess function parameter 'restore' description in 'sdma_v4_4_2_page_resume'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
