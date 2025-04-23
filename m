Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7657428D84E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Apr 2025 15:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745421066; cv=none; b=dIUKL2+RsCbb7y1WThKV6u33M1S6vu7u//WZVc5Fhl86QiXrO2+PT42R8XEXnaAe3LbBzGdWYY44IlEltj6wE7spcEI2hQ8lWmNyQ0Rcv+WXgTk1CFU+DL3vaKPgnX7edXY6KUbKpScmz4DrPxhZnRR/hNIGikQtbdY6is3EJ28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745421066; c=relaxed/simple;
	bh=ZUrtpWqg6s/y29eb6AtJbjXoHQRsTRMkwAziy67pcyU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jmH36CTHatq575YoUYSt1WTfd82a9TX31Wl2lbXkD/GPu881Sipu1VJuWc+B2x2jJApwrcrTATJHl3N8TTQF7Xj99TtiPorlmuGoGyAZ2YodcrqIHlsUfMJLBYBU8ji17J7Ae5b3JbkUsiUXSjgmKJ2phF1uPx5orwe4BA4XDY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CoCVEQXz; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CoCVEQXz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745421065; x=1776957065;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZUrtpWqg6s/y29eb6AtJbjXoHQRsTRMkwAziy67pcyU=;
  b=CoCVEQXzly/6mRJBwrm7WroA8tmcJT8pjBdmW1I9uM/bEn3U5WW7ZXgh
   JXZUaNDGzA/1FnuzFs/bLu3M/SLuDIpFE4UPVrzEiIDbx9iNBvYMXs/la
   ad/qxHd2wMnXG/bbhmAN/2WTmc81YXN2pU2pnjJDOiKJi/VLy6+ciiNko
   KHEslvJHgz3Fk3zHDbO8K2i+1EqomVSUwzvbmvEshVFxSmX6Y9dBg8Dw0
   JEA4sB/hwZTjhdOw6BxHizAVPqAqKb3vrh/1NcPrpwfc/VZMaejI3+sgs
   sjnkUWufrmz1OGeLjR1zSvujAHP+Q+qWCU/KlmXUE9jdlQ2jMVgLmPYcf
   w==;
X-CSE-ConnectionGUID: yxGlmXulQUya6nWg5reoJg==
X-CSE-MsgGUID: XIXNFXOkQF2fMpYAqzLFGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="46724902"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="46724902"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 08:11:02 -0700
X-CSE-ConnectionGUID: zMV+/1sPR2ifoUe/e0hG1Q==
X-CSE-MsgGUID: ywl/BGIgSWOF+SHMVoShqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="137509283"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 23 Apr 2025 08:11:00 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7bkY-0002bV-0i;
	Wed, 23 Apr 2025 15:10:58 +0000
Date: Wed, 23 Apr 2025 23:10:47 +0800
From: kernel test robot <lkp@intel.com>
To: Tomas Winkler <tomas.winkler@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>
Subject: [intel-lts:5.15/android_u 1/1] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist: Documentation/driver-api/rpmb.rst
Message-ID: <202504232340.Ad2OFEU6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tomas,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 5.15/android_u
head:   f72fcd722e2d0f1cd9bb6fcff7009048d528bec9
commit: a2d17e22111160662f622d94e4ed6c6740330039 [1/1] char: rpmb: Document Replay Protected Memory Block (RPMB) subsystem
reproduce: (https://download.01.org/0day-ci/archive/20250423/202504232340.Ad2OFEU6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504232340.Ad2OFEU6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/mtd/cypress,hyperflash.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/intel,ixp46x-rng.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/intel,kmb_display.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/media/imx8-jpeg.yaml
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/driver-api/rpmb.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/regulator/silergy,sy8106a.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/arm/keystone/ti,sci.txt
   Warning: drivers/md/Kconfig references a file that doesn't exist: file:Documentation/block/dm-user.rst
   Warning: fs/locks.c references a file that doesn't exist: Documentation/filesystems/mandatory-locking.rst
   Warning: include/uapi/linux/dm-user.h references a file that doesn't exist: Documentation/block/dm-user.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
