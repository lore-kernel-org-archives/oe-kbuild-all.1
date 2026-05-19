Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014432F83A0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 May 2026 04:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779164497; cv=none; b=ko3NgSIH5NZW36mx94ILlPVLUi4mrtqXSFgWAGwGVxtY7jbpnqJ6pQ7gd0SnZWJ+Fg6GCmuOzj0HcTwChDS72hIynqRzJKMu6nfxJuQi4MwmeEU2xouoPX1klVBxxZqswd9EP/9en4OXrNT6GRRXuKY3FlRRPlpQmbtDnVTLYmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779164497; c=relaxed/simple;
	bh=AD8GR5A0uehLJGfLEh1AlC9ihjxVoOSKUgDeJSEa83Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O5hW/obOMe2V8GwQ6M2xdU848qC5FgRlmyyy+70gS9Ou6CiWBPGeXA9aTfr5qDs+6sOIxWbqGuBUzuvLSHr+R6roNzDDfSmI0+fDz0SC6m7v8UNtVvIpx0tMetFgF15yV8CEeWHM6UMie0jnCzPNEZt58udGLFnWW01kjrbrQko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DylQB1sx; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DylQB1sx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779164496; x=1810700496;
  h=date:from:to:cc:subject:message-id;
  bh=AD8GR5A0uehLJGfLEh1AlC9ihjxVoOSKUgDeJSEa83Q=;
  b=DylQB1sxeQu7bocdOsMaMheKHnqhI2sS4nCOC2YgXWp8fUcJ2Hl152sl
   Q6ZpURPuIz7rbzn4Iym9jyXfnDmQeWpCbTBB0UPcW4tOo5g0xIHQbw3Vw
   6YUnQ44/gdldDSl2t3pTtANNOz6QffcnPfE7YZlI3s5W/Q8RsQ4TAa0LX
   dnYb5Ku5lfEo/5SjNwOCJeTDBzk34+lHR6hwMLaWxfkVeVfYDKCEgSl4A
   wBP2G6PgENc27DYBzoZXD+zooGcPMvP5OokJo2WMC/MPyoJ2uM6MKROdZ
   Yj87loGMTTChuPmp7aU6DNq+UW+2dBg5+k9Ireur8uwTpNp1Np7I3Dl6Q
   Q==;
X-CSE-ConnectionGUID: nNsv3ELFQq2mwE74Yy4SUg==
X-CSE-MsgGUID: P0Is/xJZSiiDkdcWzFFupQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="79749375"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="79749375"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 21:21:33 -0700
X-CSE-ConnectionGUID: 0nWTkgaIT8i4xi3NwT/wbg==
X-CSE-MsgGUID: r70ULJ0fToSjcGisw6Ikgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="235408931"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 18 May 2026 21:21:31 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPBxR-000000000R3-0Z5o;
	Tue, 19 May 2026 04:21:29 +0000
Date: Tue, 19 May 2026 12:18:54 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:ffclock 43/43] kernel/time/ntp_internal.h:18:47:
 warning: 'struct audit_ntp_data' declared inside parameter list will not be
 visible outside of this definition or declaration
Message-ID: <202605191213.TZYR0rt1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux ffclock
head:   123146665ac9426e106557f5c14f8743b128a6b2
commit: 123146665ac9426e106557f5c14f8743b128a6b2 [43/43] kernel/time: Add /dev/vmclock_host miscdev
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20260519/202605191213.TZYR0rt1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605191213.TZYR0rt1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605191213.TZYR0rt1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/time/vmclock_host.c:19:
>> kernel/time/ntp_internal.h:18:47: warning: 'struct audit_ntp_data' declared inside parameter list will not be visible outside of this definition or declaration
      18 |                         s32 *time_tai, struct audit_ntp_data *ad);
         |                                               ^~~~~~~~~~~~~~
   kernel/time/vmclock_host.c:48:1: warning: "/*" within comment [-Wcomment]
      48 | /*
   kernel/time/vmclock_host.c: In function 'vmclock_compute_period':
   kernel/time/vmclock_host.c:65:26: warning: unused variable 'need' [-Wunused-variable]
      65 |         int bits_so_far, need;
         |                          ^~~~


vim +18 kernel/time/ntp_internal.h

aa6f9c595d8573 John Stultz     2013-03-22   4  
aa6f9c595d8573 John Stultz     2013-03-22   5  extern void ntp_init(void);
123146665ac942 David Woodhouse 2026-05-17   6  extern int ntp_get_status(void);
123146665ac942 David Woodhouse 2026-05-17   7  extern int ntp_get_time_state(void);
5ffa25f573cf52 Thomas Gleixner 2025-05-19   8  extern void ntp_clear(unsigned int tkid);
aa6f9c595d8573 John Stultz     2013-03-22   9  /* Returns how long ticks are at present, in ns / 2^NTP_SCALE_SHIFT. */
5ffa25f573cf52 Thomas Gleixner 2025-05-19  10  extern u64 ntp_tick_length(unsigned int tkid);
62941377ae6950 David Woodhouse 2026-05-18  11  extern s64 ntp_get_skew_delta(unsigned int tkid);
62941377ae6950 David Woodhouse 2026-05-18  12  extern s64 ntp_drain_time_offset(unsigned int tkid, s64 amount);
3bb3f3d284811d David Woodhouse 2026-05-18  13  extern void ntp_set_time_offset(unsigned int tkid, s64 offset_ns);
8f592fb554b22b David Woodhouse 2026-05-15  14  extern void ntp_set_tick_length(unsigned int tkid, u64 tick_length);
5ffa25f573cf52 Thomas Gleixner 2025-05-19  15  extern ktime_t ntp_get_next_leap(unsigned int tkid);
5ffa25f573cf52 Thomas Gleixner 2025-05-19  16  extern int second_overflow(unsigned int tkid, time64_t secs);
c7ebfbc440151a Thomas Gleixner 2025-05-19  17  extern int ntp_adjtimex(unsigned int tkid, struct __kernel_timex *txc, const struct timespec64 *ts,
7e8eda734d30de Ondrej Mosnacek 2019-04-10 @18  			s32 *time_tai, struct audit_ntp_data *ad);
985e695074d357 Ondrej Mosnacek 2018-07-13  19  extern void __hardpps(const struct timespec64 *phase_ts, const struct timespec64 *raw_ts);
c9e6189fb03123 Thomas Gleixner 2020-12-06  20  

:::::: The code at line 18 was first introduced by commit
:::::: 7e8eda734d30de81d06a949c9bf9853c445ede4e ntp: Audit NTP parameters adjustment

:::::: TO: Ondrej Mosnacek <omosnace@redhat.com>
:::::: CC: Paul Moore <paul@paul-moore.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
