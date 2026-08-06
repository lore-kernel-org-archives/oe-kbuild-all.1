Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5137185B48
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Aug 2026 02:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785983537; cv=none; b=gS2pNBe8heO6aKTJ0cNLAj5rvNhWraeToiwU6wUjUrdlznE7YznCqLa/rPAYuKRUeQk4wJ5sR5CjNXdsftOieSyNgzHhcdMmOQLycXASP6o9T7EFnu/xdn6lQRv+cJCZoEJqJnrT+W4WxSlho/AY4DwzjA/9yFn6XgHMgap8Mio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785983537; c=relaxed/simple;
	bh=xYiRyhrWKnKgyxY25qEou2HXPHwQ3gtXdcL8qy3+YwQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qJeDMHjz1PyZ+8outfHCjl2BbVAQ2gg14IEMHC60M+2wMwbLVoIB3wD3l7yXKrXkH283q4ifcthzDwzpEmWey86HcE0A0e3FS9tgZz0DOyQUyZwU/+9gAIFH4bmUZ575dzEOYyD2w22tZ9y/3Pkje0tTium36cAhgHxAsgXnaJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KwjEv9xJ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KwjEv9xJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785983535; x=1817519535;
  h=date:from:to:cc:subject:message-id;
  bh=xYiRyhrWKnKgyxY25qEou2HXPHwQ3gtXdcL8qy3+YwQ=;
  b=KwjEv9xJdjrxARLDkpGZZMIqqusrFOsMVBU0xdzzEhtf++srsjzCm5Wa
   uKUIK3h+xZs6muOlP5IKEMnsiDlpKBq10VnXm2VUdyQ/ShFQITVgwL1zb
   UJGrcB4O6Vz5nJogwBCHCCxMeqpH2rMH7cw884kfvXQkAzDzxg6frsZRE
   0fv6SSFWILZU8w6uYyss5PFDJiVjvYeTO+OOOvg0xJamC7MkX9UE2QgyN
   qH2MfujuOypMRsvoxbDDLesxIj0aKytMBtvUECz6ItdPmdIO6/IwQiit/
   mK+Lj9EDSjZ4a3KfdWnXs138h43uIV3sks/zefoA/NqQz2C7nEqi20MoD
   w==;
X-CSE-ConnectionGUID: IvHMW1YASLuB8EfNOWpEAg==
X-CSE-MsgGUID: +UG+U85yT8uFitBSOgtCNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="98080994"
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="98080994"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 19:32:15 -0700
X-CSE-ConnectionGUID: X9fQQ/iQTC64gAus09ygfA==
X-CSE-MsgGUID: zE8+PQ1PRmCoXdo6y7ME5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="262587039"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 05 Aug 2026 19:32:13 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrntw-00000000Dz1-31HK;
	Thu, 06 Aug 2026 02:32:08 +0000
Date: Thu, 06 Aug 2026 10:31:43 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: ld: lontium-lt9611uxc.c:undefined reference to
 `drm_connector_hdmi_audio_plugged_notify'
Message-ID: <202608060903.vKw3g0Q9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0d839570765118029aa8bf4a95444c6a11aacf85
commit: c08c123d4cd6ec3ee482d607e29388d0db2d3f1d drm/bridge: lontium-lt9611uxc: switch to HDMI audio helpers
date:   7 months ago
config: i386-buildonly-randconfig-005-20260806 (https://download.01.org/0day-ci/archive/20260806/202608060903.vKw3g0Q9-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260806/202608060903.vKw3g0Q9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c08c123d4cd6 ("drm/bridge: lontium-lt9611uxc: switch to HDMI audio helpers")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608060903.vKw3g0Q9-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/bridge/lontium-lt9611uxc.o: in function `lt9611uxc_bridge_hpd_notify':
   lontium-lt9611uxc.c:(.text+0x44f): undefined reference to `drm_connector_hdmi_audio_plugged_notify'
>> ld: lontium-lt9611uxc.c:(.text+0x482): undefined reference to `drm_connector_hdmi_audio_plugged_notify'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
