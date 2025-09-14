Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91D42DC795
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Sep 2025 10:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757844317; cv=none; b=KGnFreFQkdVC/TpI5RdxN9FSiHWBNcFst6svwx2jw7rSBN/1Yl4z5B99kHaCx/EQ/0XalvYosTp4k4SkzMiTGiBt/oLOgTZxh0lgg5gRSo1bV8G5eNaZ4I6dNYKhFY61bGr2/JYHgJuISAy2g7qtf6wA3c26irgpWCaqEbi6pEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757844317; c=relaxed/simple;
	bh=i/enlNqvDbaSxl0sTIZcV03Brldlweq8zY98OnKCqhU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KteboM2wJ+9NdIVOuTw7Twb86XgSITMlPWRVS3P+zSOSPb4GOgN/m4bPoE5HBiXlk/acKrm0qzo6sFmdzfymaWNPWOc75vbQ/vqQE466fwootfblB8RDS4nwlfJPLmZ0IawoRQdhYaqNhpWcJSjD691WjwpimcmJfp5CyTsuVvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E9xOhQqO; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E9xOhQqO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757844316; x=1789380316;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i/enlNqvDbaSxl0sTIZcV03Brldlweq8zY98OnKCqhU=;
  b=E9xOhQqOsX9pej/hBJ2kRX6TG9nHcICQL1QAuUIaRtPG5tj2Y4Gndhia
   j+Qcyneiei/AIly+y4CFJYQz9zbPDj2V9Kbfz3AdrZEoVhf3891iaK0ZN
   eLf0+JWwQw9+HUEYDy8lXgL3qNQPjk4JRo+/Zhro+HRqjvvCe5+9jwQOp
   MwI3Kf7O4/N0pUoAJT2g746Hd6vikBuNRKADqZZzrsegbIx/S+1GYZMUa
   2teOpgFB+ZGgJ1t2MW4SY4p/DFENoWamcpQMnPmNsIEES+5qRycrBj3ca
   uR6ENBC0vOmxkfEVyQkviExNm+eiXgmlcmZ6uXlRvCtCspdXSViFxNPy3
   A==;
X-CSE-ConnectionGUID: q4QA3NVpTk2kc/a/dYT4ZA==
X-CSE-MsgGUID: SEWbZFbDTMSzyM4YAlgPDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11552"; a="71223747"
X-IronPort-AV: E=Sophos;i="6.18,263,1751266800"; 
   d="scan'208";a="71223747"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2025 03:05:16 -0700
X-CSE-ConnectionGUID: NmWgqEPGS72+PWKpHdZw2w==
X-CSE-MsgGUID: 7Oixv++wQ3qzC1UxYYxZhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,263,1751266800"; 
   d="scan'208";a="174450196"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 14 Sep 2025 03:05:15 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxjbc-0002JA-0x;
	Sun, 14 Sep 2025 10:05:12 +0000
Date: Sun, 14 Sep 2025 18:04:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 31/35] ERROR: modpost: "nfsd_handle_dir_event"
 [fs/nfsd/nfsd.ko] undefined!
Message-ID: <202509141852.qX5wRKz0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   6a798d439bcd3984de7c3814b9c731666015b5d8
commit: 56569a0248c9c435289406e68f66608a72372b8e [31/35] nfsd: add notification handlers for dir events
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20250914/202509141852.qX5wRKz0-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250914/202509141852.qX5wRKz0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509141852.qX5wRKz0-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "nfsd_handle_dir_event" [fs/nfsd/nfsd.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
