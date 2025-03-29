Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BDD1E4AB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Mar 2025 02:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743213837; cv=none; b=GRnO/6AppcOwR1EGcu/0aoea4TlOwarUje4TWFNFSnrWUdU+n3FNGF9gQgR5VDQIokSvbIB73efg1a6tgB+CPygVpRZuGQgML37JbQdw+2ZRigtGpZyqYTqVRHkRdYcoCWLY8jr2/CeVZQ91yprBivHdGoFyn/rn2wWgE7Zojo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743213837; c=relaxed/simple;
	bh=DQW+ijuiW/WLU+z0OJ8QPnO3yNFhVrDz0wTETLXj0lg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m39DR1JVE7GD2QPqemqrmKjyqpoFgmx5+x9hWo03gYtQ5mDTzZ4t91lk/JvTf3BAQL2NjQqv7ICEjNzkqoeULgGFgwaF5fTV4suAp6boMC+oaWkn1KUnOvBUMFJL6Hvtm1B9pjXx5GaXgSAun3q5011vPR3GsRS3giWUH7UIR/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d3gsddGR; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d3gsddGR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743213835; x=1774749835;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DQW+ijuiW/WLU+z0OJ8QPnO3yNFhVrDz0wTETLXj0lg=;
  b=d3gsddGRwUPgP5vs0v3yWyrMls0T7lj4VlVuu2u+fklI7z/WSqEE8gvI
   rQ5knE9dXDCD5+w7CkI6AMx3uu5XopjA8Dhqs0OmhzGyZ290Ipa6EHVy8
   +o3HHcgzQwkEomCc4P49ObDxya50522DPM6cMLsNmo8dmN1/qKxqrbjUU
   IiPaYjd4PzmJxNaYHnQS5xnPmD/xwP6mwPskgeY9FLPPYhtF4p4kBhf2m
   lF92gXOukAAF/WSWAirBJqYTUR8a+9ElF60nIwu7ZImzqmU1SNiUyTcB8
   g3WlemsDkpoSi6OcWiUwNe6OEy1jmjRWe0DSmy19kJCHeCSkktbZlg9tQ
   w==;
X-CSE-ConnectionGUID: Z5ai5yd2Q06t28qIt9g7nA==
X-CSE-MsgGUID: t0xH5bLYRp69r+/ots6rsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="61979485"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="61979485"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 19:03:55 -0700
X-CSE-ConnectionGUID: GJUComh+QaOZpPy1erg4XQ==
X-CSE-MsgGUID: 56O9kjd2TKyRkg36jjLFOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="156595709"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 28 Mar 2025 19:03:54 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyLY8-0007qM-04;
	Sat, 29 Mar 2025 02:03:52 +0000
Date: Sat, 29 Mar 2025 10:03:06 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-linux-6.14.y 65/71] ERROR: modpost:
 "dwc3_pm_complete" [drivers/usb/dwc3/dwc3-qcom.ko] undefined!
Message-ID: <202503291007.khKw5pEd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-linux-6.14.y
head:   02aed781c87390cf176b68e20906e28b96e9d18a
commit: c6d1338299fe7fa2ce5af02188c6ad20f3fef81b [65/71] usb: dwc3: qcom: Transition to flattened model
config: i386-buildonly-randconfig-001-20250329 (https://download.01.org/0day-ci/archive/20250329/202503291007.khKw5pEd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250329/202503291007.khKw5pEd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503291007.khKw5pEd-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in lib/slub_kunit.o
>> ERROR: modpost: "dwc3_pm_complete" [drivers/usb/dwc3/dwc3-qcom.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
