Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FF1277CA1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Oct 2025 03:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761103561; cv=none; b=i0NWNTjdwy4NR1jW8irhffBR6ZQU7tH5qZw8b7jbkiFXf4Y717fj3veT7CJKucma74QR9SK9MIqrjaeKnjfyYDhkgcHvuIdMJ8KfslZYkLPlPXFkC3pX7jGYfBO1UUMSX+R0a1O8Cj0TwXXJ5hzskrYB5tet4UlE2f9WsldXk+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761103561; c=relaxed/simple;
	bh=fc1iUV7x5+gSaUe2+G0wxbC1Vl7vNY95kcl8BMh8V2I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=adcKWaqG56FJazobUFQj6m3/iHEfXABDjIyjguuoUYp1NRQF8RlYUSrgWA7ptoKQYnqem7hQye98Y5OCf+gqVdFvybDutU5spiwf1vrqR8QAtg9KTHwaJVwF5lK+Q7Qg3w1Io+yNJ/yIvmv2DWFfidD2LufG2hYdwRp9OqFp3/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dsE/8tOf; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dsE/8tOf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761103560; x=1792639560;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fc1iUV7x5+gSaUe2+G0wxbC1Vl7vNY95kcl8BMh8V2I=;
  b=dsE/8tOfQ8Y1R831ZbNiCgpJDPTah8HOd0J+kLoDcL8fKpgcv0bxkMs2
   IO3tT9gfqoJehE+tIDOdlnVWhzHYpgVwYKyy7YsU9KAJQDkRLy6mKSUvK
   eIUMp6VvzQ95rfEratSw7XFIexvh/zcxz+9VV43tiw3Kj2mJJj8mUtM34
   pPnVkbdDSNejsKMi7QYy+c3U9Is48SirzxAy4tjF2jEz5Uk6eEHR/2TDH
   yluyvXdIzV2/6UZDJgnl0PjSmkTa+GtD5CMkdT2Tzh4tIbfFIEcyPbhzf
   amGJK/fB3RYmhA/MCvbNmQuBpMbmDmmCyHbM7x3ITVCsa2s8EsmOwg/qr
   w==;
X-CSE-ConnectionGUID: khnoK6jBRnyrsXe9dZVXtg==
X-CSE-MsgGUID: W2RWIHT5THOnHueE2P74Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63145682"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63145682"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 20:25:59 -0700
X-CSE-ConnectionGUID: 57IW5IHISRmxf+GHqoePEw==
X-CSE-MsgGUID: uAY6QhuZTmy0trlZuqrO4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="182924095"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 21 Oct 2025 20:25:59 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBPTq-000Bxb-0B;
	Wed, 22 Oct 2025 03:25:52 +0000
Date: Wed, 22 Oct 2025 11:24:12 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:pinctrl-v1 6/7] pinctrl-mpfs-iomux0.c:undefined reference to
 `pinconf_generic_dt_node_to_map'
Message-ID: <202510221156.GwT0VveF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pinctrl-v1
head:   812dac031dbeccaf5456d0426f3f53768fb7902a
commit: d5760f78d45770285035484a982c145ac806056e [6/7] pinctrl: add polarfire soc iomux0 pinmux driver
config: x86_64-buildonly-randconfig-003-20251022 (https://download.01.org/0day-ci/archive/20251022/202510221156.GwT0VveF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510221156.GwT0VveF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510221156.GwT0VveF-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `pinconf_generic_dt_node_to_map_all':
   pinctrl-pic64gx-gpio2.c:(.text+0x4fcdc8): undefined reference to `pinconf_generic_dt_node_to_map'
   ld: vmlinux.o: in function `pinconf_generic_dt_node_to_map_all':
>> pinctrl-mpfs-iomux0.c:(.text+0x4fd198): undefined reference to `pinconf_generic_dt_node_to_map'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
