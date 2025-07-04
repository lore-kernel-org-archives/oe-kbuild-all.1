Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976EE2BF3CA
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Jul 2025 13:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751635920; cv=none; b=YdEX9tBRjSIue22vT3hSJKF6USzEHPbWQbczY8vvTDD7oDIO+UJoChdAGSK5MvSmOgDshk3KGu00jSNwRM+9hiBd2Lqrl+UFhZgTqNu4UykbcPiP5kf7g6had5LL/w5eMUjudeZdngkKWeo+Ha8rMvYPw9a1cH5tnr+RTfNkvE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751635920; c=relaxed/simple;
	bh=ZGDk22QHegNsG+tGNWOEi/I87/wE4tjMglIYVp8AFTs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bfdrEKYI9yV31/hbgMU3HIDuVx2o+jhmkLljOFVVUyEq13hqWeb3QMtDp4hZqvbmW7jn2DA4AnmZ/F2Nl/HjISu2OnYWxBQ1z0UfEnE60bJABwBeGltsyV+RYuOYTA24BIqwdrO3KY0gBC8uvJKakxTpRt2kGoknhzNvsyjWJ44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ElsgMoY6; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ElsgMoY6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751635919; x=1783171919;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZGDk22QHegNsG+tGNWOEi/I87/wE4tjMglIYVp8AFTs=;
  b=ElsgMoY6H6KmmBLSX3gruxO/n9gBR+Sua3rROoUedr/eAji2M/fJJQcF
   r9rmbWjdqJwD7gE4nJ980amoFBoix/eogJWcLwVOitxDOpFLSFCvqJ0oI
   6H059VEopHY2eQG71+3p8LJg0goh/n4mJOBhPhfF/jGcGEdw4GBGLQQCV
   bgMKGRefE8EhcKtcUHTmVlEMwkCYwIznM2AZQnst1+8cdwDGNHRUuXqqk
   kNRE9Krm0aySIcSVh380LSCM3oZbrYmgMuralmVUniJ+VWcI4mDrQ8ayQ
   VuKyNm7GaE0lGUUh7vZuCrdh5mhVk64ITaUaHwcjM+QJ6bYv4Eb7Sy1iu
   g==;
X-CSE-ConnectionGUID: D0Fo3L/9TYmd/EcXkrbmjA==
X-CSE-MsgGUID: 4WBVKDIqTEuyw7eGxboHIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="65423254"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="65423254"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 06:31:58 -0700
X-CSE-ConnectionGUID: UpnxCV+kRGSQbv7HPpV39A==
X-CSE-MsgGUID: M2+NGK0AR2ydI+sBMhokWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="158674106"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Jul 2025 06:31:57 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXgWA-0003kx-36;
	Fri, 04 Jul 2025 13:31:54 +0000
Date: Fri, 4 Jul 2025 21:31:08 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 6447/7039] ERROR: modpost: "utf8_casefold"
 [fs/bcachefs/bcachefs.ko] undefined!
Message-ID: <202507042115.6QKdbsMT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   26ffb3d6f02cd0935fb9fa3db897767beee1cb2a
commit: 45be9b922c1675bfca0a115089a2ff17d5be12da [6447/7039] bcachefs: More errcode conversions
config: x86_64-buildonly-randconfig-006-20250704 (https://download.01.org/0day-ci/archive/20250704/202507042115.6QKdbsMT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507042115.6QKdbsMT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507042115.6QKdbsMT-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "utf8_casefold" [fs/bcachefs/bcachefs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
