Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5AE3BADA5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Aug 2026 15:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787153606; cv=none; b=jbNs6vL2+h4+T0RZI6eznCZXi6BBa7VtdTpVCFM7tc2PmMYUwjXrA9AZ9JpKNgkjj1BqZHHHIYLLYK9hhaHcC3MFhrRMk4aAasjWJyFX6SBmJYTSaaFdVjpjK2Jdhabd+Wil/c/WLWc+Uiw2mP0y3XuTLKMHOEZL05QMEBjbtUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787153606; c=relaxed/simple;
	bh=Ef/awIdhTKIe0mNLglMxthj2jqnPkaD47D3RkbhSSUo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NdwJ/Zb6dxLru44NcQxk+Zej9HO8BJUpETSI/nFlyTomTrUk0d5ERAuJogm0Sp/BeBiULV3+pw5e+n10rc+rHCD7Pghc2wAiZpWShAuFtG3+uFhDLyS1TagwGgZMqjEPxKUbD2uH57lJ0LnrmlssE4B6wPimWO6zQREiXy7bpwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MU4Oqk7S; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MU4Oqk7S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787153605; x=1818689605;
  h=date:from:to:cc:subject:message-id;
  bh=Ef/awIdhTKIe0mNLglMxthj2jqnPkaD47D3RkbhSSUo=;
  b=MU4Oqk7SH0o/B2A/OEq/y9WQK4tx9eXYLHNqn5wBB4XfpbH49ZwD4vJ+
   por36tWTPU2wGl6oZm6se8A0KSWv2j59QyE/gfZEz1qOskWbRe49jwd7u
   wos0Pzv8w0fI6XOzlUGWLhmTB/Zo4K4FhUBvj9yjxzHK+Aro16dOogdJy
   e15IIBPf47cSshUbvD2xoVBSVnytgdRm1fc/lEXHRaYDsZmzsC/Wi3k5I
   R+W1sl/xmjv6e1oaFX9r/q+knZP1OjPyiWHjUE1XfvtTjlXMQaLbYBzdc
   Vm0Svg8c3foS5lplflJd0X5dfD/A1f5rMAkNiC8sj3ebCIcWc0VkRbbFp
   g==;
X-CSE-ConnectionGUID: neTcXiV0RNukAzL75uBLGA==
X-CSE-MsgGUID: RTFqSECHTCi0j/GNV7jlVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87544472"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="87544472"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 08:33:24 -0700
X-CSE-ConnectionGUID: hx46A3lZRB2vFtFjCevGMw==
X-CSE-MsgGUID: ysq0Q+/GQMK4ZHKvKddsrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="265132654"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 19 Aug 2026 08:33:22 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwiI3-00000000fco-1A5J;
	Wed, 19 Aug 2026 15:33:19 +0000
Date: Wed, 19 Aug 2026 23:33:14 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 15828/15982] ERROR: modpost:
 drivers/firmware/qcom/qcom-scm.ko: symbol 'devm_ioremap' undefined!
Message-ID: <202608192356.comukA0C-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Mark,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5453bc3279e9f8578ac3e534d476240e40c879e1
commit: 648d290f1946b2bbb1c83342e77ff9e2a150c973 [15828/15982] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
config: um-randconfig-001-20260819 (https://download.01.org/0day-ci/archive/20260819/202608192356.comukA0C-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608192356.comukA0C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608192356.comukA0C-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: drivers/firmware/qcom/qcom-scm.ko: symbol 'devm_ioremap' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
