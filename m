Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E1014A4CC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 May 2026 04:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779165433; cv=none; b=hLhMGjOxAB5kbMIZ2S4vAxYtanymALRZRWKXvfzJCx3sFrQR3R9nmYR1DWJ/2UyIcArYeyxm/Q4W47C3CUuvk0VpB6UqMy9tu/J6E8Y4G0yf3rFsu/oTYBhf8A+rCBdum3r1BfF3Ul9YEtM/aaiRy0+Zu8cGMxmjnEJdRsdTYuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779165433; c=relaxed/simple;
	bh=vlqdj1WNctYBTww1fB/ljqkGS8QIULcrRzhKMQlYt84=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ncGcnFDH19u7kkUoaGMuWkqH+s+fsKLIZxX3Tdja12cxW0JKfc2WlmkP2LHoFAwVD7lZcMVfrsfLfRS7Wzb6KM4qr5c+I5W1sfskKUQFBq3LOWmNPYC5r4/7ZR2DY4mgp6BZCdhSc9xIsFjlcvBI88HEp/n7HWqSAzT6/GiYMcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KhA6aIB7; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KhA6aIB7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779165432; x=1810701432;
  h=date:from:to:cc:subject:message-id;
  bh=vlqdj1WNctYBTww1fB/ljqkGS8QIULcrRzhKMQlYt84=;
  b=KhA6aIB7sE4qgGcvyEyhR+5PvjkVzzQBpnZD8+5RLHyZzA01wcbtpl+B
   /elmt4zbHhUEjvNwnOkE+3TYH39RFBxwpN12EpU6ZQyKkibt3uqJ0bzXr
   F3hfRe5YoOkvkLckQco6lG/gcUVyYPT1MgUqB8fEnBMrJReJl84b+pZNe
   iyM4m2/kziwaJSAR3U/V9V77lYdlKNfIm3+Hid8EpETzqsOK5MSbAgh2o
   534oweLajVSBRX48T946Sp/vTV/D7omU/VD590U0ZV5WEv9PE0yV1QtCC
   CmZnquwr800Ab+6dpLv/2dDWUQAtaDZxz11U3Rv47B3WAC0fKL2DUYHlE
   A==;
X-CSE-ConnectionGUID: oCbL+Y+yRm6Dvc3OUoGpBg==
X-CSE-MsgGUID: WBIHSP02Qh2uyzzyjug/LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="97466105"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="97466105"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 21:37:12 -0700
X-CSE-ConnectionGUID: DIOVEHrNSuuGrpECBgfxIA==
X-CSE-MsgGUID: v3q8yVgwQq2i72F5TCetYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="243941603"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 18 May 2026 21:37:11 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPCCa-00000000A4z-2DRs;
	Tue, 19 May 2026 04:37:08 +0000
Date: Tue, 19 May 2026 06:36:40 +0200
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:ffclock 43/43] kernel/time/ntp.c:370:5: warning: no
 previous prototype for 'ntp_get_time_offset_ns'
Message-ID: <202605190635.W4nrSRvQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux ffclock
head:   123146665ac9426e106557f5c14f8743b128a6b2
commit: 123146665ac9426e106557f5c14f8743b128a6b2 [43/43] kernel/time: Add /dev/vmclock_host miscdev
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260519/202605190635.W4nrSRvQ-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605190635.W4nrSRvQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605190635.W4nrSRvQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/time/ntp.c:370:5: warning: no previous prototype for 'ntp_get_time_offset_ns' [-Wmissing-prototypes]
     370 | s64 ntp_get_time_offset_ns(unsigned int tkid)
         |     ^~~~~~~~~~~~~~~~~~~~~~


vim +/ntp_get_time_offset_ns +370 kernel/time/ntp.c

   369	
 > 370	s64 ntp_get_time_offset_ns(unsigned int tkid)
   371	{
   372		return shift_right(tk_ntp_data[tkid].time_offset * NTP_INTERVAL_FREQ,
   373				   NTP_SCALE_SHIFT);
   374	}
   375	EXPORT_SYMBOL_GPL(ntp_get_time_offset_ns);
   376	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
