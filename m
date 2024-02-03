Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E39512B6D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Feb 2024 06:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706940352; cv=none; b=X83jH9kyHZKdHSIW0Vmi8wmyvs7c808gbB/cmlWY0O0VFieMSWRl8MyUYIBn3tmWffGujEhCfgmmOZnZp6+bGfTfJQbhP44G2ES7ak5rDaYjAMXzQUbGEZ4hEaQUX/pVFrFbA3d52RtMz36iB0JXAQTqryFbqHBrxMr9SqrGngc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706940352; c=relaxed/simple;
	bh=a+KOD2Io2SvXqbhdytP1/9/sgGoBhHAYtYP/EKTXkiY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Es0hvc9rRK6QhFEsiRR9gYImDjHEo0halAFn9uES9UAONhEaPPvHq77bAnZpNg+sffIBerwhkX3/JmheBk43qSvJmm58Y8ILSjyMvV2P4jfOo3iDFnZlOPzlM08dD6ufR7iirPSsDL7mL12kVBAd5+e/AeUMb3rNgJyr7mjQwMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NTyJPzRE; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NTyJPzRE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706940351; x=1738476351;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a+KOD2Io2SvXqbhdytP1/9/sgGoBhHAYtYP/EKTXkiY=;
  b=NTyJPzREaZ28wDx+wcMrxDCaeo2x2QWYMNANYQZcTVyWVf8OuXE1QMmd
   QCxJTVVx/j6JfxSaxmsL9n/6vkBY3SO8aQ/ZDUKdwLgp7aqqKrNhFIzef
   50ssojEfr4gVoXslBvKe3XxsU/PCu+5mJvh1EpTgrDXPlsxFTFkq+3cpz
   cXlC1CZadkrgBmwEqKKugarLosQo5oVuaYtajQ5n91unyy7nw97alSKvH
   hhBZF06xFLQffBqxEJL4lcsZdLhv2j/ICPCjG+8N2InKCt1yMTO3DjT8b
   pxajgsxzfSz7J6G+O/Ak8MyqqhYRWB487zlAaOWphfp5yCVriVQsGYYha
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="4103520"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="4103520"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 22:05:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="4869593"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 02 Feb 2024 22:05:49 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rW99t-0004go-0f;
	Sat, 03 Feb 2024 06:05:45 +0000
Date: Sat, 3 Feb 2024 14:04:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 2/3] undefined reference to
 `uhid_hid_driver'
Message-ID: <202402031335.Zsw7kmEJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   3e89c479a14b12acdbbdca69f9208104ae684ede
commit: 6804500c16a5ba86b57c9976fc1491fa0efc2132 [2/3] ANDROID: HID; Over-ride default maximum buffer size when using UHID
config: x86_64-buildonly-randconfig-003-20240201 (https://download.01.org/0day-ci/archive/20240203/202402031335.Zsw7kmEJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240203/202402031335.Zsw7kmEJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402031335.Zsw7kmEJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/hid/hid-core.o: in function `hid_report_raw_event':
>> (.text+0x1a4d): undefined reference to `uhid_hid_driver'
   ld: drivers/hid/hid-core.o: in function `hid_add_field':
>> hid-core.c:(.text+0x204b): undefined reference to `uhid_hid_driver'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
