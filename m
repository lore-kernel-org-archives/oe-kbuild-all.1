Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DDD210FF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Apr 2024 07:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714115681; cv=none; b=gzTkEHu2hFT/9ulCpP8fQRyxNSRssGKq6HRhRof2g0Y87muChZ9a+yeDHbeQo35Dy8S5HStoRiCSHCcaOhtNlY6+OtmWS5TI/I/lPK/RFBziUl/97B8knYOrMzoT+iOl31m+PMrA2y3SV3qyQyHmO5FKAfgHBHLPFUJKU4luR9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714115681; c=relaxed/simple;
	bh=3Y7oKfbtDcdHdFHBW+lYWQMsn88Dq7wMGL8hz7U6kvg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S6JEsgIJuWSIQHKoqQoT2fB3/WKz8uZfvDHML92cGy1/5fqBJ6CekRLZ2g57TjeUjkC3T+hkoiYpgbQP5K6mYwlJnWvjba6mqYqKIl4foUPJLGQBoqN8fYbi6NuWAKIYLMG86XVusw/JTnYNQgNVL7hQU72sSV4ZnbXjMeZNjfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RmjEiODd; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RmjEiODd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714115679; x=1745651679;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3Y7oKfbtDcdHdFHBW+lYWQMsn88Dq7wMGL8hz7U6kvg=;
  b=RmjEiODd9taRBVVgWw9/QGchFKk3KJot7evL5i0r7/+fuPyoVCSmoETL
   9rUyrvwClDGREbpqY8p3x9OZ2s93zKYXTAfD/JQW3inpNLqV56f+7cSVS
   E3zDj2CqGOJx85TN0aA6RatgdlPVHTau7s/oINNgXQCRCu9JYlcQKaqIx
   h1qLScgB+YCZnjlfJrXmjqh94ntonWIYd3j3CMQgpxUSKZYkuz+d/kgzn
   6N7AGzHrA3la9O5lLug/aasOw56fwCqKCLbtPvYZAnFnrukhEsmt/D6zU
   hUdaF7VMup3LtFqLTXsMqMDBLyicabsKjLxe4GPuxMq7zX8Mu+v+5qwOf
   g==;
X-CSE-ConnectionGUID: iA22I7cPTJGzbwA0CZ2JoA==
X-CSE-MsgGUID: Rx7PpbExRtKOV1NEHY8vWg==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="10057057"
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; 
   d="scan'208";a="10057057"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 00:14:38 -0700
X-CSE-ConnectionGUID: lgDapl34TfO2+BDN918yXQ==
X-CSE-MsgGUID: P7iGHZlnQ2eFIdEFxspsbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; 
   d="scan'208";a="48577203"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 Apr 2024 00:14:37 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0Fn1-0003Nu-0D;
	Fri, 26 Apr 2024 07:14:35 +0000
Date: Fri, 26 Apr 2024 15:13:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 21/48] drivers/hid/hid-himax.c:1706:
 warning: expecting prototype for himax_mcu_resned_cmd_func(). Prototype was
 for himax_mcu_resend_cmd_func() instead
Message-ID: <202404261511.pnm2O4NU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   baf623b47c0e8c5913b25cea2f1d75cc09b001cb
commit: 4e458c7ec64884693625db54d6eee71cf2976971 [21/48] CHROMIUM: HID: hid-himax: Add power check function
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240426/202404261511.pnm2O4NU-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240426/202404261511.pnm2O4NU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404261511.pnm2O4NU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hid/hid-himax.c:1706: warning: expecting prototype for himax_mcu_resned_cmd_func(). Prototype was for himax_mcu_resend_cmd_func() instead


vim +1706 drivers/hid/hid-himax.c

  1693	
  1694	/**
  1695	 * himax_mcu_resned_cmd_func() - Resend command collection
  1696	 * @ts: Himax touch screen data
  1697	 *
  1698	 * This function is used to collect commands that need to be resent to TPIC after
  1699	 * firmware restore. Usually we put system configuration status FW need to know
  1700	 * after FW restore from system resume, firmware update or esd recovery. Currently,
  1701	 * we put cable status here.
  1702	 *
  1703	 * return: 0 on success, negative error code on failure
  1704	 */
  1705	static int himax_mcu_resend_cmd_func(struct himax_ts_data *ts)
> 1706	{
  1707		return himax_cable_detect_func(ts, true);
  1708	}
  1709	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
