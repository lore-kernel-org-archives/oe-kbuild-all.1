Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49FA366822
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 09:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779354298; cv=none; b=ec9K6az/+r7sYwuW/hDzmvQKlcojEpuRRFmI9gcCDybPGO00EHvIIlX7wRNLa3fXKTpYWlJWMMH3oCpwqAcmeQSiDw0emw38dKrDmpZK4ZU6/pwIOTT5D1/dg4WlIpdB1vXcUcaDxITIMohv5lTwMLAhdEHkKt0SW9q3riePCxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779354298; c=relaxed/simple;
	bh=FuRi+Yx5nF1PRlCKya743d0IWOlZzkzhR1nyJoUZ5BM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mFQ+szAINO3Eww+OeA3Ze61umAH6uUEfCP8LD7ci3WZX9NqfNq+wITKx8ART5UP+V9gSRHJKaCfJ6PxKSpp0f40gHvTWqUv7GN9RPa23O4fd46nnNYM4EzllK5Sgp9r15e6eYWjhjhrPeUpBx0oPcom7gnBx6SZabrudVC6R+lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gO6vD8y7; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gO6vD8y7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779354297; x=1810890297;
  h=date:from:to:cc:subject:message-id;
  bh=FuRi+Yx5nF1PRlCKya743d0IWOlZzkzhR1nyJoUZ5BM=;
  b=gO6vD8y7til0qHIaRUhFqPED6aVoWloGSrYqwNO2jHNuuGX0wAIF6TCi
   KNMdSif3ByFA19rSiPtfHB3OV4zZqUEyViCoGrRAg1Wig1GdMTUseq9+6
   kczViCbgIe9NSfhOLfhtQGYD+lOoK4hdjATG11piMQ0HkwdGJEPwH5cDp
   gfI2gbPhuZ6uyW/mdkl89l/MX3Q4numQ7mHe6r1r+IuujVz/2/JQWFywG
   5L3Qf7jzwXRe2HjPy/VyzGQy3d2XpFgTLQdTwtMPPyekq8ROrBN+u2QXu
   jQru6L8m68OYiKjaaz+fxVUh0vHTCJ3KP07gT9M7qWtE39qS4jEHgtDvh
   g==;
X-CSE-ConnectionGUID: XUl1zPz1Rtu8z7e5mbBMWQ==
X-CSE-MsgGUID: vWmU5jv3SpSY7wgwySIZQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="79418299"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="79418299"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 02:04:56 -0700
X-CSE-ConnectionGUID: HlMn3JOjSlKDkHHtP4M2rQ==
X-CSE-MsgGUID: GrKFVPBLTaGY+RgrdyWhOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="245507806"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 21 May 2026 02:04:54 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPzKm-00000000ApV-2nW2;
	Thu, 21 May 2026 09:04:52 +0000
Date: Thu, 21 May 2026 11:04:36 +0200
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: kernel/time/ntp.c:496:undefined reference to `__moddi3'
Message-ID: <202605211015.w1ty1QTp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/David-Woodhouse/MAINTAINERS-Add-Miroslav-as-timekeeping-reviewer/20260520-221128
head:   9f455e02d06fb889c99cbc8e086de8a7e0e6ad23
commit: 4b8bb3567c83524d66804ad73481d150cdfccf37 timekeeping: Drive time_offset skew via per-tick ntp_error transfer
date:   19 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260521/202605211015.w1ty1QTp-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605211015.w1ty1QTp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605211015.w1ty1QTp-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/time/ntp.o: in function `second_overflow':
>> kernel/time/ntp.c:496:(.text+0x942): undefined reference to `__moddi3'


vim +496 kernel/time/ntp.c

   413	
   414	/*
   415	 * This routine handles the overflow of the microsecond field
   416	 *
   417	 * The tricky bits of code to handle the accurate clock support
   418	 * were provided by Dave Mills (Mills@UDEL.EDU) of NTP fame.
   419	 * They were originally developed for SUN and DEC kernels.
   420	 * All the kudos should go to Dave for this stuff.
   421	 *
   422	 * Also handles leap second processing, and returns leap offset
   423	 */
   424	int second_overflow(unsigned int tkid, time64_t secs)
   425	{
   426		struct ntp_data *ntpdata = &tk_ntp_data[tkid];
   427		s64 delta;
   428		int leap = 0;
   429		s32 rem;
   430	
   431		/*
   432		 * Leap second processing. If in leap-insert state at the end of the
   433		 * day, the system clock is set back one second; if in leap-delete
   434		 * state, the system clock is set ahead one second.
   435		 */
   436		switch (ntpdata->time_state) {
   437		case TIME_OK:
   438			if (ntpdata->time_status & STA_INS) {
   439				ntpdata->time_state = TIME_INS;
   440				div_s64_rem(secs, SECS_PER_DAY, &rem);
   441				ntpdata->ntp_next_leap_sec = secs + SECS_PER_DAY - rem;
   442			} else if (ntpdata->time_status & STA_DEL) {
   443				ntpdata->time_state = TIME_DEL;
   444				div_s64_rem(secs + 1, SECS_PER_DAY, &rem);
   445				ntpdata->ntp_next_leap_sec = secs + SECS_PER_DAY - rem;
   446			}
   447			break;
   448		case TIME_INS:
   449			if (!(ntpdata->time_status & STA_INS)) {
   450				ntpdata->ntp_next_leap_sec = TIME64_MAX;
   451				ntpdata->time_state = TIME_OK;
   452			} else if (secs == ntpdata->ntp_next_leap_sec) {
   453				leap = -1;
   454				ntpdata->time_state = TIME_OOP;
   455				pr_notice("Clock: inserting leap second 23:59:60 UTC\n");
   456			}
   457			break;
   458		case TIME_DEL:
   459			if (!(ntpdata->time_status & STA_DEL)) {
   460				ntpdata->ntp_next_leap_sec = TIME64_MAX;
   461				ntpdata->time_state = TIME_OK;
   462			} else if (secs == ntpdata->ntp_next_leap_sec) {
   463				leap = 1;
   464				ntpdata->ntp_next_leap_sec = TIME64_MAX;
   465				ntpdata->time_state = TIME_WAIT;
   466				pr_notice("Clock: deleting leap second 23:59:59 UTC\n");
   467			}
   468			break;
   469		case TIME_OOP:
   470			ntpdata->ntp_next_leap_sec = TIME64_MAX;
   471			ntpdata->time_state = TIME_WAIT;
   472			break;
   473		case TIME_WAIT:
   474			if (!(ntpdata->time_status & (STA_INS | STA_DEL)))
   475				ntpdata->time_state = TIME_OK;
   476			break;
   477		}
   478	
   479		/* Bump the maxerror field */
   480		ntpdata->time_maxerror += MAXFREQ / NSEC_PER_USEC;
   481		if (ntpdata->time_maxerror > NTP_PHASE_LIMIT) {
   482			ntpdata->time_maxerror = NTP_PHASE_LIMIT;
   483			ntpdata->time_status |= STA_UNSYNC;
   484		}
   485	
   486		/* Compute the phase adjustment for the next second */
   487		ntpdata->tick_length	 = ntpdata->tick_length_base;
   488	
   489		/*
   490		 * Set the per-tick skew rate for the tick code. This is in the
   491		 * same units as tick_length (ns << NTP_SCALE_SHIFT), and is
   492		 * rounded to a multiple of NTP_INTERVAL_FREQ so that the per-tick
   493		 * division in the tick code is exact.
   494		 */
   495		delta			 = ntp_offset_chunk(ntpdata, ntpdata->time_offset);
 > 496		ntpdata->skew_delta	 = delta - delta % NTP_INTERVAL_FREQ;
   497	
   498		/* Check PPS signal */
   499		pps_dec_valid(ntpdata);
   500	
   501		if (!ntpdata->time_adjust)
   502			goto out;
   503	
   504		if (ntpdata->time_adjust > MAX_TICKADJ) {
   505			ntpdata->time_adjust -= MAX_TICKADJ;
   506			ntpdata->tick_length += MAX_TICKADJ_SCALED;
   507			goto out;
   508		}
   509	
   510		if (ntpdata->time_adjust < -MAX_TICKADJ) {
   511			ntpdata->time_adjust += MAX_TICKADJ;
   512			ntpdata->tick_length -= MAX_TICKADJ_SCALED;
   513			goto out;
   514		}
   515	
   516		ntpdata->tick_length += (s64)(ntpdata->time_adjust * NSEC_PER_USEC / NTP_INTERVAL_FREQ)
   517					<< NTP_SCALE_SHIFT;
   518		ntpdata->time_adjust = 0;
   519	
   520	out:
   521		return leap;
   522	}
   523	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
