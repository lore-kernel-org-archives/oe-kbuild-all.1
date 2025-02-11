Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775B11D5161
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Feb 2025 06:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739255782; cv=none; b=UyjZ6Y6cChcEo6WxP46BrnL3nyQjSF3Snfbh9ddGzGUg3l6eunaZl9lzK6bVeB0wkBO6EuiCNblNIhFK3RWSRLcQlx1lJ0K4zoSQV7EL4BGUdwS+XpsB+Vx63Jw71NQLwstQbTZ+XAML+Apz5FRLjHMSIbhfVvLr4EyduAKgsc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739255782; c=relaxed/simple;
	bh=E2xbJIfcZrypTUJuAguhh1ameV4JJhC9m1E879BvrIU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IlAtWfjdBJNDLbErotZUY6VoFlGWqDaUhob4bu7Dp6OrKu5HlOY9u/UAmOtTlVxCdGKvd8VFOlHQYOjHk3av1l9HcFwJEC5CMR+xVU+1GuS/SBEoO5Vq0xQAZFXMAUrFVi04rPguhlJVegKp7V0vckmH8UyWOMd6z5cYIrZEna0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bS2sm4ss; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bS2sm4ss"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739255780; x=1770791780;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E2xbJIfcZrypTUJuAguhh1ameV4JJhC9m1E879BvrIU=;
  b=bS2sm4ssWS6gWg8bVEsa+7OG9wZ9aPVBvE4PlRsJz2gIlx24hVzBhsi3
   gSfAjfZkMfYuLEKYtqfxKq0J1Zkul+67V4ZrFFgpgpn5+2PNVHJQcVMMl
   aq7IFss4LjswzC6ZhzLvrtrDH2nDTt6pMkXnFAx+pga+nEy+9FFtujhpW
   1NZjfXi7mG5S9UTp0xKP84OahU48f3yoTmzK1lSioEpvMw+oBVkaahBYG
   xDqlIN2lzwwtp3StODZzrtURt4ow7A3Hlz4zh2IoGAgXSV/7a4+RMfBF9
   dUh3LzSjaKrKz1r+Doukc0xA+TE1ciuHYIf0ejuHHEdOCfQk7qHZw9YY1
   g==;
X-CSE-ConnectionGUID: RV+mWnGKQw+ypfSzCuY+ng==
X-CSE-MsgGUID: Dq14bvrQTkC4fpfgtRYM9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="65217069"
X-IronPort-AV: E=Sophos;i="6.13,276,1732608000"; 
   d="scan'208";a="65217069"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 22:36:19 -0800
X-CSE-ConnectionGUID: C50TRvbrRiOhU9xjViSn2g==
X-CSE-MsgGUID: 9A9S2eYwT5+mRM5p4pg/7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="143318304"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Feb 2025 22:36:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thjsW-0013q7-2Y;
	Tue, 11 Feb 2025 06:36:16 +0000
Date: Tue, 11 Feb 2025 14:36:15 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-riscv64 1/1] .bazelignore: warning:
 ignored by one of the .gitignore files
Message-ID: <202502111404.uoPCIPQ1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline-riscv64
head:   024b10b8c9d3569cdc944ce321e4d3410362579b
commit: 6ce0e9e8ca4babbc9e47fa5e67e8a72998594d52 [1/1] ANDROID: add .bazelignore file
config: arm-randconfig-001-20250211 (https://download.01.org/0day-ci/archive/20250211/202502111404.uoPCIPQ1-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502111404.uoPCIPQ1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502111404.uoPCIPQ1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> .bazelignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/tags_test.c: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
