Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E12D2E7F11
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Mar 2026 01:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773884114; cv=none; b=RtsHLY4wKOKSjLqVgaYIHE/LHmdaQXbOxA5S8QC9CQnQ4BR9R1LGL//8zDxNVrP8kdZ43QMTVX5YUUysgrpQ6KFOf1xSGPr8kkYtIf6LzeeCrSwEuFNyHxPR/ATxHc96ivCFLwuDseq9ZY+PMJBxf/w7LJzgEHGPMe83EgA30iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773884114; c=relaxed/simple;
	bh=FZf9zpgRuAflvsR61DclwY6VYPSCq439Dms06SsntjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=U2YaIkWZxeeRyq05x+Bu+FJiQoBIYfWn67uNSHHkEMNegK+An59qXOEa0SmNEVnOpc737OUIQijktN/o1634cmdZxnbnR0hs+nVJ9Yzhs+dUryLiJ4ZFV4W6A7jyAUXB8pFU24/iRs6YtyO3nC9IWmVgYa3+fUmOv0L8BkxFmlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G3S3PBv4; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G3S3PBv4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773884106; x=1805420106;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=FZf9zpgRuAflvsR61DclwY6VYPSCq439Dms06SsntjQ=;
  b=G3S3PBv4yu0lLax3MhQsqR4nNXfsop0CyD6akQoU+sYWc3knVGxnooSz
   aml/wVlo5feJCC2iPLSUswFmZ57mbir+8mPVlcDisz+tz1a/4pg6rgcLN
   9rMQYcVFV2+vjmR6exsgzcENqICkKFBIOOveVHQCukO/W6myp53YQvOYe
   JZnzgwSyyDENnzapuf7vMK9i3ICklYUOPhuO2OIwpqGvBgcflwpiLUiwQ
   1t46fUlsdu0uBEgAu6crSlqpO5T2hfRYOlFPW/231PALJ95XmYopKstes
   nTWqD9ImCxzNJ/5oF7IyffuxcIV0fXw77iXC6llUHx63PePSyNPfsOl+R
   g==;
X-CSE-ConnectionGUID: whDpROY5SvWs3plfs3GgVw==
X-CSE-MsgGUID: oxFLpX45Rz6Xl3H4aO90YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="85654853"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="85654853"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 18:35:05 -0700
X-CSE-ConnectionGUID: F07xau+jQWSzqq1MWWewRg==
X-CSE-MsgGUID: qZTvdyuUQAuAgiWXx4Ro9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="218322725"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 18 Mar 2026 18:35:03 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w32Ht-000000000B9-2au7;
	Thu, 19 Mar 2026 01:35:01 +0000
Date: Thu, 19 Mar 2026 09:28:44 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 30/39]
 kernel/time/timer_list.c:105:20: warning: cast from pointer to integer of
 different size
Message-ID: <202603190916.KJvdLKRG-lkp@intel.com>
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
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260319=
/202603190916.KJvdLKRG-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260319/202603190916.KJvdLKRG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603190916.KJvdLKRG-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   kernel/time/timer_list.c: In function 'print_base':
>> kernel/time/timer_list.c:105:20: warning: cast from pointer to integer o=
f different size [-Wpointer-to-int-cast]
     105 |                    (long long) base->offset);
         |                    ^


vim +105 kernel/time/timer_list.c

289f480af87e45f Ingo Molnar                           2007-02-16   95 =20
289f480af87e45f Ingo Molnar                           2007-02-16   96  stat=
ic void
289f480af87e45f Ingo Molnar                           2007-02-16   97  prin=
t_base(struct seq_file *m, struct hrtimer_clock_base *base, u64 now)
289f480af87e45f Ingo Molnar                           2007-02-16   98  {
a52067c24ccf6ee Thomas Wei=C3=9Fschuh                      2025-03-11   99 =
 	SEQ_printf(m, "  .base:       %p\n", base);
398ca17fb54b212 Thomas Gleixner                       2015-04-14  100  	SEQ=
_printf(m, "  .index:      %d\n", base->index);
398ca17fb54b212 Thomas Gleixner                       2015-04-14  101 =20
7551b02b94ad1da Mars Cheng                            2017-02-09  102  	SEQ=
_printf(m, "  .resolution: %u nsecs\n", hrtimer_resolution);
289f480af87e45f Ingo Molnar                           2007-02-16  103  #ifd=
ef CONFIG_HIGH_RES_TIMERS
bb2705b4e036055 Thomas Wei=C3=9Fschuh (Schneider Electric  2026-03-11  104)=
 	SEQ_printf(m, "  .offset:     %Ld nsecs\n",
bb2705b4e036055 Thomas Wei=C3=9Fschuh (Schneider Electric  2026-03-11 @105)=
 		   (long long) base->offset);
289f480af87e45f Ingo Molnar                           2007-02-16  106  #end=
if
289f480af87e45f Ingo Molnar                           2007-02-16  107  	SEQ=
_printf(m,   "active timers:\n");
7bbf09aff0b4b0e Thomas Wei=C3=9Fschuh                      2026-03-16  108 =
 	print_active_timers(m, base, now + ktime_to_ns(*base->offset));
289f480af87e45f Ingo Molnar                           2007-02-16  109  }
289f480af87e45f Ingo Molnar                           2007-02-16  110 =20

:::::: The code at line 105 was first introduced by commit
:::::: bb2705b4e03605532b429525cc8d1e9a2afe3e00 timer_list: Print offset as=
 signed integer

:::::: TO: Thomas Wei=C3=9Fschuh (Schneider Electric) <thomas.weissschuh@li=
nutronix.de>
:::::: CC: Thomas Gleixner <tglx@kernel.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
