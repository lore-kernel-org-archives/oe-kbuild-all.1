Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D678B1EF36C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 06:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765607669; cv=none; b=ICnS8XtxIDUOVBq1SazxotQZ0WR4amaVc8lqUX0m/cqf252CiQef3w4AKiFYS2b7gV2AOPwo9T8skf8DGCs3AC+w0z510ECBJoFg1yjlxrGgdmwZmpZM93QBuZf3VcQ6xq9hWMUMoICeAr3+pGgS0XNyMxJPpCqTQRSjJH5FDb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765607669; c=relaxed/simple;
	bh=YZYyekP/1F6yGsFyVE9f8CSYRe6o+DMTiTMZnKouB48=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z88FK+H1iJYl840s3FCfWR63kbFbD4L+53RRhzpqH2TimAcbsv1ex+QGtSnwZHHJwlSE6Sg8i3kfp85rkch9CZ8aIYtgzsbOKBp1qYnjfDTHTda9rWzbM7SwEa/8R2HvM3cLqICVG16+4e7ox2ZeW2m1kq4Yq0xB4/ibrZUHK/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bwlLZmbR; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bwlLZmbR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765607668; x=1797143668;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YZYyekP/1F6yGsFyVE9f8CSYRe6o+DMTiTMZnKouB48=;
  b=bwlLZmbRksDjjiAQljWW00UkIgfM3hzFiQJneWjh/P/M2+B6ogeVAqq9
   2iKzCtMqlFqdW4B0kh8flPHLGHD5f6jjmnPJtXpIW6OfE45l2Ugj1hmVF
   zrDH9k0185AKH8wTw2zfF94eJLwsne4phTzkaJ5oCK2xDMX3ubDL2BHxZ
   MNUo6RkmXgWdzulYLt8uUbnEsio008LyjIjrukT4BA0wywLqDVE3oYUuC
   k4c8lNDe1o+7dEBUQaPmfQyiDYr1UoomkvFsELoJs3ufYQvibZZsfF3S6
   fCJ33u/04A/nUYZBQTzb/N9bnkkbQOeNsaDZVgiGo+90ng0CaCJHdntG6
   A==;
X-CSE-ConnectionGUID: HEZIgZ7TRBKLn8AzC1LGTw==
X-CSE-MsgGUID: j00enDERRMKCvOJ7pYjDGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="66775062"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="66775062"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 22:34:27 -0800
X-CSE-ConnectionGUID: 22WflsQkR2u2EwPuWkC5NA==
X-CSE-MsgGUID: UPjNhH6xTXSxSsOXpdrM+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="202190306"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 12 Dec 2025 22:34:26 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUJCy-000000001yq-1aFR;
	Sat, 13 Dec 2025 06:34:24 +0000
Date: Sat, 13 Dec 2025 07:34:07 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/18] htmldocs:
 Documentation/virt/kvm/x86/pkvm-intel.rst:349: WARNING: Bullet list ends
 without a blank line; unexpected unindent. [docutils]
Message-ID: <202512130739.79IGmhWV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jason,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   da2da0badf05a4631edf06f9a37e822b20875663
commit: e24fbeb999488f1320ea19b2a0d0ec12aafe994c [0/18] ANDROID: [DOC]: Isolate pKVM & host
reproduce: (https://download.01.org/0day-ci/archive/20251213/202512130739.79IGmhWV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130739.79IGmhWV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 ./include/linux/xz.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 ./include/linux/fprobe.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/mutex.h' failed with return code 2
   Documentation/virt/kvm/arm/hypercalls.rst:229: ERROR: Unexpected indentation. [docutils]
   Documentation/virt/kvm/arm/mmio-guard.rst:94: ERROR: Unexpected indentation. [docutils]
>> Documentation/virt/kvm/x86/pkvm-intel.rst:349: WARNING: Bullet list ends without a blank line; unexpected unindent. [docutils]
   Documentation/filesystems/incfs.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/sound/designs/compress-accel.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/trace/debugging.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/virt/kvm/x86/pkvm-intel.rst: WARNING: document isn't included in any toctree [toc.not_included]


vim +349 Documentation/virt/kvm/x86/pkvm-intel.rst

   347	
   348	* Page-table management
 > 349	-----------------------
   350	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
