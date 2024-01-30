Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBC366B23
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jan 2024 10:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706612243; cv=none; b=BJq2+xPa8aWTLdzDFp/YE+DzMIMIQybSNnO8+lgB6B0wn/o+LXJL6TIAoPz7lSbP2UTMk2ewvPzfptPo4KaY/b4piWIbHxk782TwRsU8Ac2OQk+6HDvuqEQU6kC+u8MLzzabXeDaMgH0fhPQZ16Ku0aIy/r0749tbRqUlwqp0U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706612243; c=relaxed/simple;
	bh=nBOpbCzEM+B6/GDqBTyixqW4/2KzPp9FGoi+VgHcK2s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RER2/odix/LMMg6BB9IwNKT+rPpapSlylLTsMtKl8hHjbz8yXOeXbbVCGjkW1UnYSEdI0vl2z4T25E5awAJ85uDz+s/NbijFdsLexZqHyklzGndaG/WAvcNu2y7WRRsIncRP52oXpnLx7ygGRcxF355c9YtNFb1MB28L0NEuPbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vsp3ruQ7; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vsp3ruQ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706612242; x=1738148242;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nBOpbCzEM+B6/GDqBTyixqW4/2KzPp9FGoi+VgHcK2s=;
  b=Vsp3ruQ7v4WcaFbcPJqMJ1+RDBuaLC0l2/KbsBvyTf2u4CYEsyHs/PgA
   7PUzIIaFehoLiRT8+SycR6OLavILznaSAQvowxx9lQ4obyHB+rVQBAM9U
   6im76u83hoaGD5UZgzsKOewLgeaVWkbxDlqJ0SwzkvEhe6IKPKao7BFhm
   sS3gds0WcG9/cFrLJ95hC7WkGewnSrl81VpYgvZoQnydD/d1kkgk/OPno
   p6yRaJgrcSfqPkW3TWYA7VtvSm4BQb703Wqrndb8GMut/BOVJosVb/uD2
   y+Rb3F1hqiIoHOhRnUAVP1cbbP8c48GjwbLP6aE52hnW71hX31ANVp1sf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="21764763"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="21764763"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 02:56:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="29867329"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 30 Jan 2024 02:56:57 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUlnT-0000D2-0H;
	Tue, 30 Jan 2024 10:56:55 +0000
Date: Tue, 30 Jan 2024 18:56:32 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [drm-misc:drm-misc-next 1/3] ps3av.c:undefined reference to
 `video_get_options'
Message-ID: <202401301825.pVNLzuRt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   4db102dcb0396a4ccf89b1eac0f4eb3fd167a080
commit: a3b6792e990d63d47c4d2622a9704a01db50c3a2 [1/3] video/cmdline: Introduce CONFIG_VIDEO for video= parameter
config: powerpc-cell_defconfig (https://download.01.org/0day-ci/archive/20240130/202401301825.pVNLzuRt-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240130/202401301825.pVNLzuRt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401301825.pVNLzuRt-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc64-linux-ld: warning: discarding dynamic section .glink
   powerpc64-linux-ld: warning: discarding dynamic section .plt
   powerpc64-linux-ld: linkage table error against `video_get_options'
   powerpc64-linux-ld: stubs don't match calculated size
   powerpc64-linux-ld: can not build stubs: bad value
   powerpc64-linux-ld: drivers/ps3/ps3av.o: in function `ps3av_probe':
>> ps3av.c:(.text+0x13ec): undefined reference to `video_get_options'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
