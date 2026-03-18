Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E89D33D4E1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Mar 2026 20:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773864315; cv=none; b=R4oj3hzvOw8FBL66kXCrG/vXWPdFwjHSVF7qpaFhrMKTDF+FeO5xayJuI2e+xg/sIJlMpQAc10tK8hSw0Ccpd2Ob3ojXquRv/I8uXGlElKnvfzmpxjX/WKEgItt7zxI8EXtzVG7cI9DdkGGn2hA+MYTx/ex2rFVwdBxd92TzdLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773864315; c=relaxed/simple;
	bh=TK+CF180/rcJiXjG57YuvvzldnMxAJj/EQ8N1EcIGMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=H9lUyOf7ZjcyWvHZBs6PpV8SLDWvpRF5TZXzrKae35GBde8/9r0+5bunMmoEMazYDAjyPm4NKGPI1RxD0ph7b9+zkqdPxlXplotSC7pmA6xWg/AVh+kGO7zaTOXUhSRhcFCNW9TgMFHFGrHgJby9Krzb8f2ZQusVCl+daR5aP1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dJ+xVC7l; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dJ+xVC7l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773864314; x=1805400314;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=TK+CF180/rcJiXjG57YuvvzldnMxAJj/EQ8N1EcIGMQ=;
  b=dJ+xVC7lPgsHK+6/Du3hfgmm2+BvS4kDpHR8VHyjdBr3k++DxmqTM9WG
   RjMMe9TP4sEj8E2M06DwSzf2eYjcZOMRmgzzUP4fMpUsfxS2JV+p3oKNP
   Tt22ITKQICjjmK+aXuckRhnqa3eZwA1WVSaSaDQex390JO9Xe1b4WDOnH
   T5siirvPnCN3kq+awuLX3Z5tx8Nql8rtOgfzx/yUxqNRE8c6PCQ4A3+vj
   qm78PW2V1rZWwjIhfzFO3HDtZ9RhaY+jcqzRvosLY8DpUDBH+R6MBeEI4
   5sRPokFytOAhytHdpOmByVfMJF0CnvUZFZXw9fkm8stE0edPuGt+IUcKW
   A==;
X-CSE-ConnectionGUID: wi0snKS3ToScupnsMrJFyA==
X-CSE-MsgGUID: I3e3NkiHQn6sAPmjqrlqgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="100388763"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="100388763"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 13:05:14 -0700
X-CSE-ConnectionGUID: 54lze1hmQ46cK9hHEVx+vw==
X-CSE-MsgGUID: umDJ4+m3Td+IIJi3iO/6lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="218270434"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 18 Mar 2026 13:05:13 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2x8g-000000004if-3T7w;
	Wed, 18 Mar 2026 20:05:10 +0000
Date: Wed, 18 Mar 2026 21:05:08 +0100
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 30/39]
 kernel/time/timer_list.c:105:20: warning: cast from pointer to integer of
 different size
Message-ID: <202603182126.wDgMSsyL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/auxclock-nanosleep
head:   0b217bafd1a2c635903a7062a0a2d6411c4ade76
commit: 7bbf09aff0b4b0e64f9cb3bd1263d7bdb57a20ce [30/39] offset pointer
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260=
318/202603182126.wDgMSsyL-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260318/202603182126.wDgMSsyL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603182126.wDgMSsyL-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   kernel/time/timer_list.c: In function 'print_base':
>> kernel/time/timer_list.c:105:20: warning: cast from pointer to integer o=
f different size [-Wpointer-to-int-cast]
     105 |                    (long long) base->offset);
         |                    ^


vim +105 kernel/time/timer_list.c

289f480af87e45 Ingo Molnar                           2007-02-16   95 =20
289f480af87e45 Ingo Molnar                           2007-02-16   96  stati=
c void
289f480af87e45 Ingo Molnar                           2007-02-16   97  print=
_base(struct seq_file *m, struct hrtimer_clock_base *base, u64 now)
289f480af87e45 Ingo Molnar                           2007-02-16   98  {
a52067c24ccf6e Thomas Wei=C3=9Fschuh                      2025-03-11   99  =
	SEQ_printf(m, "  .base:       %p\n", base);
398ca17fb54b21 Thomas Gleixner                       2015-04-14  100  	SEQ_=
printf(m, "  .index:      %d\n", base->index);
398ca17fb54b21 Thomas Gleixner                       2015-04-14  101 =20
7551b02b94ad1d Mars Cheng                            2017-02-09  102  	SEQ_=
printf(m, "  .resolution: %u nsecs\n", hrtimer_resolution);
289f480af87e45 Ingo Molnar                           2007-02-16  103  #ifde=
f CONFIG_HIGH_RES_TIMERS
bb2705b4e03605 Thomas Wei=C3=9Fschuh (Schneider Electric  2026-03-11  104) =
	SEQ_printf(m, "  .offset:     %Ld nsecs\n",
bb2705b4e03605 Thomas Wei=C3=9Fschuh (Schneider Electric  2026-03-11 @105) =
		   (long long) base->offset);
289f480af87e45 Ingo Molnar                           2007-02-16  106  #endif
289f480af87e45 Ingo Molnar                           2007-02-16  107  	SEQ_=
printf(m,   "active timers:\n");
7bbf09aff0b4b0 Thomas Wei=C3=9Fschuh                      2026-03-16  108  =
	print_active_timers(m, base, now + ktime_to_ns(*base->offset));
289f480af87e45 Ingo Molnar                           2007-02-16  109  }
289f480af87e45 Ingo Molnar                           2007-02-16  110 =20

:::::: The code at line 105 was first introduced by commit
:::::: bb2705b4e03605532b429525cc8d1e9a2afe3e00 timer_list: Print offset as=
 signed integer

:::::: TO: Thomas Wei=C3=9Fschuh (Schneider Electric) <thomas.weissschuh@li=
nutronix.de>
:::::: CC: Thomas Gleixner <tglx@kernel.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
