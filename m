Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8F725EF94
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Apr 2025 17:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746032902; cv=none; b=uUI/gRNkeM0BB0tQg5JHK6I2fn/7mOmpH0aWvCzERvcegOEIOk7HmF5upvVSWpxqYF11lhOsu4uvzqGFo/Ln33j/b+DbWXuWGaMCPaT69gXbEXcdeRlb10AUrTe/AD9XBQOL//Nlfxny4WQHimwHJan6Hzhr6K+bXAyngCmKVJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746032902; c=relaxed/simple;
	bh=6Uns/c3Ze6kdFTknrYD4nG4E/S3Fl5N9nVq7uowgBIs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WlBkTL6nHkOXD7ZaqV7s6rG7iOg5l2I3rULsyF5LgmJ9xy7woPEsNg02SXW7ymAMMdi4hkymt1vogQFLO7jLlrWgs+NpMERXqqrALFthOjYvRca5typMAsIZoTGQ91CvN42u4woQRhD0FWUJom64x69s3wr4WLQdnaGH2JeIHh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bTRkw1xP; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bTRkw1xP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746032900; x=1777568900;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6Uns/c3Ze6kdFTknrYD4nG4E/S3Fl5N9nVq7uowgBIs=;
  b=bTRkw1xP1dX3d1IieGWyKFBT3dg2cZQuA8luiipPJwHhtfSrtyUJpEhq
   yZxh6ZICx3BMPU3ozvwkrx/g+pLdwz3oDwgiFlLfPFso1XIAXqaOE3Mo3
   1D83Q9xh5oSvyHnBNn8xNfw8LCRtNZ0uLzdUjw5yD0bR5JfjEmXVc6D0b
   fId8/KvAnjMOjHCCj6/tG11qIzg9gwWi+qSFRtOSdsz4BF17OrpkfD3Fe
   Zp8X49Oo1yKtGfVoS8TGCRSzci96DACsLKZQOpEoUVkbgl7vAsblrAZtE
   mIvWxZNzfRWnMVgfJrERx9x0xdznKhC4cSo8sO5U6G/nG3ftPp7Br4ICV
   Q==;
X-CSE-ConnectionGUID: PhyQgnepQGe7gl2b+q7JeQ==
X-CSE-MsgGUID: K+a+XhOuTAyxQ3IfTC7V7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="51519971"
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="51519971"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 10:08:19 -0700
X-CSE-ConnectionGUID: s99shdAgRhyvjXlU0twebQ==
X-CSE-MsgGUID: oQhrShUFRtafsz5e5vmynw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="138989408"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 30 Apr 2025 10:08:17 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAAut-0003dd-09;
	Wed, 30 Apr 2025 17:08:15 +0000
Date: Thu, 1 May 2025 01:07:49 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:b4/cdx-clean 2/6] kismet: WARNING: unmet direct
 dependencies detected for REMOTEPROC when selected by CDX_CONTROLLER
Message-ID: <202505010143.fz0bRef7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux b4/cdx-clean
head:   de1f8f52771e7f5d746a733d6010ffcded8ab788
commit: 0e275aca86857b030d8628ff0f4feac16d1627dd [2/6] cdx: Enable compile testing
config: sh-kismet-CONFIG_REMOTEPROC-CONFIG_CDX_CONTROLLER-0-0 (https://download.01.org/0day-ci/archive/20250501/202505010143.fz0bRef7-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250501/202505010143.fz0bRef7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505010143.fz0bRef7-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for REMOTEPROC when selected by CDX_CONTROLLER
   WARNING: unmet direct dependencies detected for REMOTEPROC
     Depends on [n]: HAS_DMA [=n]
     Selected by [y]:
     - CDX_CONTROLLER [=y] && CDX_BUS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
