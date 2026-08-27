Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B9E364E84
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Aug 2026 21:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787867495; cv=none; b=Zv3NHdwCaQUjcha0Wr2G67I7J+ujyEOYiZW7pw/mqFJMD2IVggUjm0wTTUHJ+YkIB5qx/70kDcC5B5xi5XgjBS9Gx6PNXF86a4txA71CcojDTpJvwi/7lrDianzKjNwSaymqdE+1UR0nAgHelaW2i0o8x66o4Cz6JuBlxFJMD8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787867495; c=relaxed/simple;
	bh=z8iUxw8Y7x5dQVc8xgUJf2ssJeGNU6IweQvmuw9czY4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=m/yKBuJMMLJVvyzWYHjJO/01AU9NDwIh3SoG4jzltvJXogJcXG4v2xAjZGWMtQNLSjHSnI1F4Uy/obb/t05gbv5iloSImAN7Dxa3fEs+hT/nJ/Z3SR49MY3bu+JHYm/v5s8uw3PSUNs5Gdgy7yOI9wL93aWI1bNH+1zNQks5pPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OR8OFqdR; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OR8OFqdR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787867493; x=1819403493;
  h=date:from:to:cc:subject:message-id;
  bh=z8iUxw8Y7x5dQVc8xgUJf2ssJeGNU6IweQvmuw9czY4=;
  b=OR8OFqdRRVC6zqHUbJOdqZpGGDkEimzeQlGZcQxEifXXEsgXfD8ukAGs
   T3cnY/xhT5SkuxMi8oikIZj+zEws7ukiD3r7b3UnHLoaXWT+uPOdnujZp
   nXC0h9b9dEqF+WO+5KY1UOl7WxzOPm8DV+JEEUG5l0nv1dv6qVhffV7Iy
   mmoGk0Wmhcd6sNaupKcxd4nTr132xmKhTh4AUEqRlVrmmMuo9Hjc+cAnq
   gvImM6SXFXwJcJ9gd0EABGjptdhGB9TLfktIS9soAogIawYbc3mMqOFOA
   liHmQrk74jrbxNUOzvce/yWG5Zn1r0MZv27jhkz8OupgN0d/ELOyUu1+Y
   A==;
X-CSE-ConnectionGUID: /WhjBppSSCG1u7n3DX54XQ==
X-CSE-MsgGUID: 1i2TTV6yT9SRDem2CuYWTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="105900872"
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="105900872"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 14:51:32 -0700
X-CSE-ConnectionGUID: +qzU2fA7SJqIbs+nWKkSCA==
X-CSE-MsgGUID: WiEHiOzGSae8yV8amW+6NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="266680971"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 27 Aug 2026 14:51:31 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzi0P-00000000A4X-0PQ9;
	Thu, 27 Aug 2026 21:51:29 +0000
Date: Fri, 28 Aug 2026 05:51:15 +0800
From: kernel test robot <lkp@intel.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linkinjeon-exfat:dev 1/1] fs/exfat/iomap.c:175:31: warning:
 'exfat_swap_iomap_ops' defined but not used
Message-ID: <202608280518.yScC1zDp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/exfat.git dev
head:   20cb0bad8c3ad9220aff3e61e8703e17f72bb7f9
commit: 20cb0bad8c3ad9220aff3e61e8703e17f72bb7f9 [1/1] exfat: map allocated extents for swap activation
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260828/202608280518.yScC1zDp-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260828/202608280518.yScC1zDp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608280518.yScC1zDp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/exfat/iomap.c:175:31: warning: 'exfat_swap_iomap_ops' defined but not used [-Wunused-const-variable=]
     175 | static const struct iomap_ops exfat_swap_iomap_ops = {
         |                               ^~~~~~~~~~~~~~~~~~~~


vim +/exfat_swap_iomap_ops +175 fs/exfat/iomap.c

   171	
   172	static DEFINE_IOMAP_ITER_NEXT(exfat_swap_iomap_next,
   173			exfat_swap_iomap_begin);
   174	
 > 175	static const struct iomap_ops exfat_swap_iomap_ops = {
   176		.iomap_next = exfat_swap_iomap_next,
   177	};
   178	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
