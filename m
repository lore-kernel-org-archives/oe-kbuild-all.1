Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F6A30BB8D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Apr 2026 05:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776404331; cv=none; b=j/pEDasCFnkrfraIV0fdhQ8pM8G22QuFfAiFxeuACqUKfyu/rSlcGwVdIaZIok3kBKKozkjlOXfYFxEmDicJybXUSScBrrREGoD+sSmnDcHbhWq0/ebA1PeevEdpueIb8AVhpAbd7qR7GjU/XJwBpD7sE9vjUz+TA2fSvItKlPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776404331; c=relaxed/simple;
	bh=RuU0/pP/xzAqc1wWo/jG/K7lKYHrg7XTt5O5bI1nhaA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cTC6Vnk4y6eASPeG0oNkQT8v0xgH+ctHoTs9cd6hrffkdjfaqAvRmEKXIRXNIzDn2iWlRFjG2Qseet8IIu3PmUuhb4PDEDV0dEiDYlYAIxwRYrbAFMTr+HgNaDCDWjP4IL7XISiOtf0Z3x2ssuduulBCNISilCVwdLUcqNno/ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Drt+Nsgl; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Drt+Nsgl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776404330; x=1807940330;
  h=date:from:to:cc:subject:message-id;
  bh=RuU0/pP/xzAqc1wWo/jG/K7lKYHrg7XTt5O5bI1nhaA=;
  b=Drt+NsglJYB7a7FAOkaWoePBjeP2mRwgjd49XE5fxcWEmohlVr+e4hUU
   qEdxSyHHe0uFXyLGBP4hhOZ51ZKqtbu9Ig3iR8BhVhW+1v9WaUj9LuPhs
   esEMNs8JCqSGFiN+NpJxqnyuAjMEKEZUkWquNqAP7Jh4BhFr1oU4frY6w
   q2yUrbi77l8A0RHOAagAp2wWrmJArtYKTtITJSuPz2C70eytzv92dBO4P
   qrL21P68yEL9cuWcrKPIm5o5HQ7ZWz3HIPLA5f15/UCtbF8WFS9276b5l
   lMGvSM4LlSlElGX1JsFDvVS0oaGb0crQqngzrha+DEW9C3n79UAAqkTTl
   Q==;
X-CSE-ConnectionGUID: YOfAJaCgQnS7FTu/GaBR4A==
X-CSE-MsgGUID: Ne6uyBItSjuE9vEAzJq2FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="88798522"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="88798522"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 22:38:50 -0700
X-CSE-ConnectionGUID: AipoAeNNSaOu5Y28DM0eHQ==
X-CSE-MsgGUID: 4ydURzdJTNycOOkjpOljNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="230085057"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 16 Apr 2026 22:38:48 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDbuf-000000001Ej-3I4h;
	Fri, 17 Apr 2026 05:38:45 +0000
Date: Fri, 17 Apr 2026 07:37:53 +0200
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/030-misc 7/19] Warning:
 drivers/pmdomain/core.c:980 function parameter 'one_dev_probing' not
 described in 'genpd_power_off'
Message-ID: <202604170728.lPM15t49-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/030-misc
head:   ecad9364496d64ceef9ab8ef75ab398aba04781c
commit: 95dd6a61265dd715bba154f546db7bc36148a742 [7/19] PM: domains: Add a flag to defer power-off until all consumers probe
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260417/202604170728.lPM15t49-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260417/202604170728.lPM15t49-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604170728.lPM15t49-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/pmdomain/core.c:980 function parameter 'one_dev_probing' not described in 'genpd_power_off'
>> Warning: drivers/pmdomain/core.c:980 function parameter 'one_dev_probing' not described in 'genpd_power_off'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
