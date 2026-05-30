Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4177F219E8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 May 2026 04:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780115358; cv=none; b=JU2jO/Cp6h5bG5CcMqUWOrN5qYJLd8otf6HMHTvU6zDoEt8ugU++iurKmDCoZhU6Kh9+IaXCz3zJkavS7r0VJpEjwDqOVk3xBfXhw211b8uEP58Jb6TwTFBTe/6OdpuU3ZeoCp3TdoFmWltVVFF61pjMG6PbWJQi+P8id7vaDUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780115358; c=relaxed/simple;
	bh=tvsbr3YkMGGN8ALrRXY7JrnBJUsDMC6XBbsxiL0c5Xw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PT8BNdK5gb9dBELEDElv4d9A+zPOhCfA9DSLwdlUSOvTAwVAOW5BLRRmOvdGe399K+YMUlU9BEBerV87F4P0AH/0/x3Ys4vPf6V2PyjlBE8s+dwfJ2ZacVMKPzsViwsihY56SzwxMFU8bYK44SQnCgpweJn4eJRJr+DWs32xLS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cPZrfB2k; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cPZrfB2k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780115356; x=1811651356;
  h=date:from:to:cc:subject:message-id;
  bh=tvsbr3YkMGGN8ALrRXY7JrnBJUsDMC6XBbsxiL0c5Xw=;
  b=cPZrfB2kX5VviZp9t+s5Y+o2RI70+ZjSSdaO1YWEcFiX9LNOkCmOubtN
   7k49SIckjcwnKC87hFQlGA5pFx2tcleRhiFqW0MqhDYThNvNrnQ5u73Rf
   UiQQY/cgA6iUuGnMoJp8XNYXMHDwnNrUTG9duSm6PpNbss1wJuuC9m2nW
   LXrUgRH5mV9UUqrNMZ4FKGowaoRnTMf4Tr5ZOWXuPRs33j38BJTr71oHt
   MxI6c5WFkrtrh2qHJ1Vo5l5oOFqVKP7qNTnrDUobxuNu9ClvJwYoV0f+H
   WJK6LT1sc1nr5ceusTazsPd9snmYprxCSbOX8BcGFwFtlW32fLpGFac2v
   w==;
X-CSE-ConnectionGUID: 1cSGPH/qQLSYXznNB8hPlw==
X-CSE-MsgGUID: 1VstNLhCQ9em7Qo8yfbMtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="80692296"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="80692296"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 21:29:16 -0700
X-CSE-ConnectionGUID: i1UgVAC4T/2ydfdyz8ukww==
X-CSE-MsgGUID: TAS1R5p1SrGC91vAauOoVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="247953179"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 29 May 2026 21:29:15 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTBJv-0000000086c-3j2y;
	Sat, 30 May 2026 04:29:11 +0000
Date: Sat, 30 May 2026 12:28:25 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:ffclock 11/11] kernel/time/ntp.c:366:5: warning: no
 previous prototype for 'ntp_get_time_offset_ns'
Message-ID: <202605301221.NHuOpJ4z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux ffclock
head:   70c32e7a9e128f2579034276c19d34bcf79f4b0c
commit: 70c32e7a9e128f2579034276c19d34bcf79f4b0c [11/11] kernel/time: Add /dev/vmclock_host miscdev
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260530/202605301221.NHuOpJ4z-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605301221.NHuOpJ4z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605301221.NHuOpJ4z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/time/ntp.c:366:5: warning: no previous prototype for 'ntp_get_time_offset_ns' [-Wmissing-prototypes]
     366 | s64 ntp_get_time_offset_ns(unsigned int tkid)
         |     ^~~~~~~~~~~~~~~~~~~~~~


vim +/ntp_get_time_offset_ns +366 kernel/time/ntp.c

   365	
 > 366	s64 ntp_get_time_offset_ns(unsigned int tkid)
   367	{
   368		return shift_right(tk_ntp_data[tkid].time_offset * NTP_INTERVAL_FREQ,
   369				   NTP_SCALE_SHIFT);
   370	}
   371	EXPORT_SYMBOL_GPL(ntp_get_time_offset_ns);
   372	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
