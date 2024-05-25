Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5610E17996
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 May 2024 08:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716627304; cv=none; b=cccQEyocsT3Cu4TYsPEBaS4KleJJbEnv3YZ240wo3AQyyv+jR8zCHFjSnxbk2FxTXC/DWlFa7r3oe94E1wxHxuU5Rhg7cP50bRGnoimvlA4vC70mDcd3h7KecVYc+OuGrcOweGs87MsjZ9Zkw1FR22fnTRVzqUQA6T2jEmgs0Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716627304; c=relaxed/simple;
	bh=3efR1VwjPEW8quQpH9QZ3Mb7JviFzZvmhLydID48DoU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DEvo6R1LnYD/nkqTdkWPM/q+/yrCKm8aN6qLrj9gHvOyusmBFtlinS7VORsStB9usw1NBAiuUT5WaeMEF2ySI0i7rwuKaOAa8XSYlUQKT9ofjh1F3qNn4cVcb+K2aXL+YSFekzMD58pz/k4h2HiRXsHgIQnePg2OypBeF7LmE+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kabl9gEM; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kabl9gEM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716627303; x=1748163303;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3efR1VwjPEW8quQpH9QZ3Mb7JviFzZvmhLydID48DoU=;
  b=kabl9gEMn0cQiNecRRUrRcgletWr4O2gx+Nyv8+2r4aFcbNC/GBkKAPa
   Ro4BcqximgRGv008rsSf/pZIJJGMDBKY/YO+tqRuX43yxFrLtBxZU9uYZ
   D9SVzEV534nTMVHgbHvIjgd0EbKvAykG1WSYp4I520PhzeyYFxAjOarHn
   SGlggH34R5T3p3MbD/567rhcO5zaI1p0T8Ds9/FFo0USKmVfbFzgCCPaG
   OGJMLaJPNm5n+xZDVk2petgprl5zuvyx7rhGQFrjxQRb7mNv8BPoibxmp
   BinF80Tcjbq2yD7rHhbn52wOSlPGJls3t0TfJ78wkKAlTcjiB+8/xloNr
   Q==;
X-CSE-ConnectionGUID: MLi7LJAgRmGBRC+WdnaQ+w==
X-CSE-MsgGUID: oAI0myb+QO6xefFi9cJ+Fw==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="24415545"
X-IronPort-AV: E=Sophos;i="6.08,188,1712646000"; 
   d="scan'208";a="24415545"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2024 01:55:02 -0700
X-CSE-ConnectionGUID: sBzf5A7lQmOpFfM6xmYXPg==
X-CSE-MsgGUID: bXsjciLBQy6OdhH8MqtViw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,188,1712646000"; 
   d="scan'208";a="71661647"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 25 May 2024 01:55:02 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAnB5-0006jz-1R;
	Sat, 25 May 2024 08:54:59 +0000
Date: Sat, 25 May 2024 16:54:56 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Bristot de Oliveira <bristot@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [bristot:sample/dummy_rv 3/4] kismet: WARNING: unmet direct
 dependencies detected for RV_MON_DUMMY when selected by DUMMY_DRIVER
Message-ID: <202405251657.I2E70os5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/bristot/linux sample/dummy_rv
head:   497867198313321f90ae76cec6409a9886e2eea9
commit: f68a80e151e0c3df3b4b98eb1822f444d97378b9 [3/4] driver/dummy-driver: Connect to the dummy monitor
config: alpha-kismet-CONFIG_RV_MON_DUMMY-CONFIG_DUMMY_DRIVER-0-0 (https://download.01.org/0day-ci/archive/20240525/202405251657.I2E70os5-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240525/202405251657.I2E70os5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405251657.I2E70os5-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for RV_MON_DUMMY when selected by DUMMY_DRIVER
   WARNING: unmet direct dependencies detected for RV_MON_DUMMY
     Depends on [n]: FTRACE [=n] && RV [=n] && DUMMY_DRIVER [=y]
     Selected by [y]:
     - DUMMY_DRIVER [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
