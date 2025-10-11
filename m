Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E6B2652B7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Oct 2025 13:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760189040; cv=none; b=FW88FhysD7SmrfznyrS0CaYAzmQEsIY2GlhVkZXtX0jrDJAR9ePXvi3BOTT842Pdd1jB7+1Un1tkSTqTRXLdYMj5RDMwrZogPGc+TJrv3X9ArOMxLpKe8XH1q0epv4KI1IDUXAm4V/raniVzHZWO9wvbP9ZVZsZ3TMdaGm+Rk4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760189040; c=relaxed/simple;
	bh=vd8x+6guveuIkurLDI0nZmJ8rgW6AIMIsEarolMZEo0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OBed415LRkW3GNyJuD1KFYNBFXrWZNYZHmYJ0X9JSi/QKB42nAkdBrKUrEk0UysksgQx1XzOO8EsNwSGuQPxZ9gSFWWYsLe+ScsKOZ4cIiab/y/s0JhIFt1QavdxoKCtfI4opGCS5IACKy569RGFh/ClyvWnw5vC2zWhqm+vfbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ApweCvYO; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ApweCvYO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760189039; x=1791725039;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vd8x+6guveuIkurLDI0nZmJ8rgW6AIMIsEarolMZEo0=;
  b=ApweCvYOv6dwXenPq2J6BITlTfmQtJKJyPnLTcgaICSqrulSrdQNJKuf
   UqRu6Gh4A84hV4lN9JTA01EP+yVVEs3X8sX96qAIO7AOcx7TOuVcqUcqm
   9ga0r/NZDWa9Pq2KAY0mOB1gbkWXxSq/1qkDAt/AFWRyfiH+Wj2D5//LF
   VF/9bSM0NXBvOurIq4tSqWw/8BvQTcCgmtafK/T2lHRjll6n5OAB/dJkK
   n0s/8hpO+o+LHOPvzyv5vL9lM6whQzk0bAkgD3BvY6GTjYnkKDpsIjXZF
   U9VuFhJBJI3zc65Xfc0HfYiXlCZACbphMz0OHiNgFWRxRdvaxE/o8tyyQ
   g==;
X-CSE-ConnectionGUID: QutuwtMqRnW9Iwc0iDAeuQ==
X-CSE-MsgGUID: JEqC1GJMRru51eNMX2KTug==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="66042896"
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; 
   d="scan'208";a="66042896"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2025 06:23:58 -0700
X-CSE-ConnectionGUID: 228wYSD8QT2fmvxmbzQwBg==
X-CSE-MsgGUID: HNakmuk2RNK3vAN1BAy93A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; 
   d="scan'208";a="218299324"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Oct 2025 06:23:57 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7ZZi-0003nL-09;
	Sat, 11 Oct 2025 13:23:54 +0000
Date: Sat, 11 Oct 2025 21:22:55 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.17-r4pro2 134/139]
 utils/firmware/mediatek/mt7987/i2p5ge-phy-DSPBitTb.bin: warning: ignored by
 one of the .gitignore files
Message-ID: <202510112145.Kk5DVPE7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.17-r4pro2
head:   7b9918476e16be05ccbbc0d029a1672264fb604e
commit: 6beb9c43422026d43a76a771dcbafa58cd4a95de [134/139] firmware: add firmware for mt7987/BPI-R4Lite phy
config: i386-buildonly-randconfig-001-20251011 (https://download.01.org/0day-ci/archive/20251011/202510112145.Kk5DVPE7-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510112145.Kk5DVPE7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510112145.Kk5DVPE7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   .github/workflows/build.yml: warning: ignored by one of the .gitignore files
   utils/firmware/aeonsemi/as21x1x_fw.bin: warning: ignored by one of the .gitignore files
>> utils/firmware/mediatek/mt7987/i2p5ge-phy-DSPBitTb.bin: warning: ignored by one of the .gitignore files
>> utils/firmware/mediatek/mt7987/i2p5ge-phy-pmb.bin: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
