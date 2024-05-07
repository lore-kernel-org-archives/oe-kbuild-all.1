Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7FAA951
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 May 2024 17:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715102384; cv=none; b=pbJGaQ3le8eeT0TbkVoKgT/KokqHCJzKs4wlO45qA04mNLF6U9hNF9IS6MTbDro95tluGxMtpYHy7nX9e2wf6pF9mR7hgQrr99R4gdMyQtlX5C7x0Rt5TnG010pTxxCvVldrzJRxXMCmcmnZ7DNe/3g3zg1HklsWU+T8IuJ3KqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715102384; c=relaxed/simple;
	bh=qPi/dpPIDUkIHoBxKiFuPRmTng7b8D4mLbauNkYUIMA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OUGOhuEYqvKzk6vb1igcon+ocp65eEhDxmMeOtbuHLMaMovlhHbV4MtgYueDEByDb33KwQIgpQT0eZYqkbcScURVUD//idK0oCnuMlW7vLrpBCn2hppM66M91/1fTnSSZcWuyHWBWRJ4luWCsed2a2VQFGOY0yix+pJJxopIH+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lisu5eZF; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lisu5eZF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715102382; x=1746638382;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qPi/dpPIDUkIHoBxKiFuPRmTng7b8D4mLbauNkYUIMA=;
  b=lisu5eZFoupKQtga4O8/LpRzhxyPP19wdknT7sdvsovLOof0b86l4weu
   XJjZn+1Fd7yBboCPr6aW3p1vHQJNtNQYGs8X76nkg+2Yt48W9WQVBA275
   fnqLn846wAAt8NT92xH27Wjlbjms4oXVjBvhNjErc6aK1Nf9/9Erwb5wM
   KkrNLUqXcoJIpIiKbXwaTT5uNdQd3gHQwjFzvq511eqy6TMsWi158dXp/
   g+msWxKYrTMsRZmsxpf/X8etkTOX7g2BzNksCnTUjcf4ISJx8ZOJui7Kx
   WIYaFc+JJmS6aVPBaBOkR7ROkKgJAmtNMvj21ovQSP9tzHGVr+Yg2MD6Q
   Q==;
X-CSE-ConnectionGUID: JCzOf9RXT6CQVMdtsU1zow==
X-CSE-MsgGUID: gA0UKK60Q/2OYFM68af2Xg==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="11042397"
X-IronPort-AV: E=Sophos;i="6.08,142,1712646000"; 
   d="scan'208";a="11042397"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 10:19:42 -0700
X-CSE-ConnectionGUID: upMb9px0TWuUMr2ORrcC8A==
X-CSE-MsgGUID: vpGoA7bWQZGCqtvM0dzDDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,142,1712646000"; 
   d="scan'208";a="59760888"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 May 2024 10:19:41 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4OTa-0002Se-2t;
	Tue, 07 May 2024 17:19:38 +0000
Date: Wed, 8 May 2024 01:19:02 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Maxime Ripard <mripard@kernel.org>
Subject: [linux-next:master 9739/11707] panel-lg-sw43408.c:undefined
 reference to `.drm_dsc_pps_payload_pack'
Message-ID: <202405080133.16ZI5eaY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   93a39e4766083050ca0ecd6a3548093a3b9eb60c
commit: 7fe302ae198a35ac071d3a9e78ebd8e14b0958eb [9739/11707] Revert "drm: Switch DRM_DISPLAY_DP_HELPER to depends on"
config: powerpc64-randconfig-001-20240507 (https://download.01.org/0day-ci/archive/20240508/202405080133.16ZI5eaY-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240508/202405080133.16ZI5eaY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405080133.16ZI5eaY-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc64-linux-ld: warning: discarding dynamic section .glink
   powerpc64-linux-ld: warning: discarding dynamic section .plt
   powerpc64-linux-ld: linkage table error against `drm_dsc_pps_payload_pack'
   powerpc64-linux-ld: stubs don't match calculated size
   powerpc64-linux-ld: can not build stubs: bad value
   powerpc64-linux-ld: drivers/gpu/drm/panel/panel-lg-sw43408.o: in function `.sw43408_program':
>> panel-lg-sw43408.c:(.text+0x934): undefined reference to `.drm_dsc_pps_payload_pack'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
