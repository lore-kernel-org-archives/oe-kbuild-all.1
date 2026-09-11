Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB5E43DEA0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Sep 2026 11:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125630; cv=none; b=UqCIYL4s2b3wyEWXo6ocoo+/EXcUg4mzt63nlqOvxWVAA+rf0mUqlDD9ce5dUgpVn5BBETTpt4MdF1Tr5iaWaZDn+FM2lS1PcS/Bu228FgLJ381x+7nuKB5iwLZsYy9oBWmE61DuExhMTTqM5Q1hM/XJiHJVt1DZYConIbnAxkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125630; c=relaxed/simple;
	bh=b+BGuqQWUWCxc9UfOpHWCU1EJHrTDLWIlu9uZrtj790=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cxHXCpvCGazDygM5Z6R14D8ujkmCBqffGH2S7mxcxly0KW1EZ7TN24UBjAR3v1Gbb2crQ79bMBx9/Hyr7TxfPxfIMe2/rEyuME1DMRvNIiyo3Bf380Usrgy0ztK7sh3Ep8eJnDcySyS6jLo9LsDTA5S/h7B21r1HOwMoZIoLIXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mO6SaDou; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mO6SaDou"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789125628; x=1820661628;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b+BGuqQWUWCxc9UfOpHWCU1EJHrTDLWIlu9uZrtj790=;
  b=mO6SaDouJeHfovDuiGPvi8UpqksInk4EH3wYWcsiTUZfpKdaSQuVYvHw
   NSukYXFYUwF+zEAfWAjND5qMUmgabbNPu/kKR94hkfPmAJ2eUF26Pkaev
   36NlGoXBkgIE71bOnkGm/Cp3BO3Wht/n3Q7k2+AIxFGPFYPG94j3iEEjh
   VwAmG5ScR0ACZJWc/hsZwTzYWByDLJmSBvqCXQ4bRB8Xn9sEiHXQqa+Ai
   IzxD1e1makXcWrQCEkzdcXymiWj8XyQmhCoXGgXjCy2SZWUGYv6kSCwXs
   FgazkjWhwQnAPg0jYUHNVE+XzoKHZDQNZK9nEN66N8CbzdvQMUdQjCGu4
   w==;
X-CSE-ConnectionGUID: YS7t8BapTJS8kvG0GKDUdQ==
X-CSE-MsgGUID: 08AzcdwtSHi1DIz70Hqetw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="100939121"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="100939121"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 04:20:27 -0700
X-CSE-ConnectionGUID: 5vxRRMvdS8Ks4Yb3TdkILw==
X-CSE-MsgGUID: Y2O3lwiWTveL/yrztYws3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="273824829"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 11 Sep 2026 04:20:26 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4zIt-000000000mR-4ACK;
	Fri, 11 Sep 2026 11:20:23 +0000
Date: Fri, 11 Sep 2026 13:20:03 +0200
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 17/42] ERROR:
 modpost: kernel/time/time_tests.ko: module uses symbol
 'tk_aux_capture_mono_conv' from namespace 'module:time_test', but does not
 import it.
Message-ID: <202609111304.uKQ1Qm2n-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep
head:   368883ddc7ac709883254193a4588fdf9b2da65a
commit: 05ab3171697e70cdc4302f27ef62d851a2580f93 [17/42] timekeeping: Add a test for auxiliary to monotonic clock conversions
config: i386-randconfig-054-20260911 (https://download.01.org/0day-ci/archive/20260911/202609111304.uKQ1Qm2n-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609111304.uKQ1Qm2n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609111304.uKQ1Qm2n-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: kernel/time/time_tests.ko: module uses symbol 'tk_aux_capture_mono_conv' from namespace 'module:time_test', but does not import it.
>> ERROR: modpost: kernel/time/time_tests.ko: module uses symbol 'ktime_mono_to_aux' from namespace 'module:time_test', but does not import it.
>> ERROR: modpost: kernel/time/time_tests.ko: module uses symbol 'ktime_aux_before_mono_and_convert' from namespace 'module:time_test', but does not import it.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
