Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7AD36CDE9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 11:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781262179; cv=none; b=RCTdQSmLkyZubp5NOEAY7A7brjsWsDxxPJGLLWtSfmRCkUUuDbdlkE+iK3MefuEuoy+7mHgTOOYWmoOM/0oSx+gA84+41l14T3bnnDrzMWuxK0xpwCpDzicgK51ibCROdpEF9bXP9Ld6A2AiDw0TdefnYR7hEfo9pm4+Ot+fdrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781262179; c=relaxed/simple;
	bh=Ml3WmBGW3TCCwQkwXgG8K1B74V0ppFx8cwOs47BveBI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=THHAyrsJky1aZeax5GXglX0WTZ0/ljFR21d6MhQHYqMO9qM8Ax0JDquAA9G9/sqlkWiH7ZHwk4/ENgHd22UCblGMSbuQEqiurOmrFyCAV5ntKQnj6RehJr7suC/v7bqx3XGLA887GCmaN4OmpzrwaYcjjJUJWWCFKlx8qNB4wXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=crkwGFFp; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="crkwGFFp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781262178; x=1812798178;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Ml3WmBGW3TCCwQkwXgG8K1B74V0ppFx8cwOs47BveBI=;
  b=crkwGFFp7/ON1cOz+Ej8HV1HN9gqVMVte3qJs/vuV0fZ6Px2lUU2s4ni
   w084ANLsbRBPQ5QRn5yu0/mx7TmaQ+nAryX3n1woGeH0hYvwqX0zEdyr5
   r9os0O/H0CZDbEqhFemNYgP632Jnv3PQqmdfb5CenEYTW/OPh8eLY3Qmb
   yMJGZjdZ191Sg1/JZsGKkKNg0zY2jGHAzS7gbt4vM1zJEG6ReG+DVzBLh
   4hmzBr6sVVyR1Y9QOfGmawKHKU3KrC/9SFX6a2Ef5XhTnbHpONM0l+yGj
   LSmu0rpA91IDt1K4zt2RpzxIvFR+wWHXRPEdXyB6D2B6deaG8PBQDWtjG
   g==;
X-CSE-ConnectionGUID: H6rMo4DlQKGMjYdfb5Bm3Q==
X-CSE-MsgGUID: A2NxIIvuRWuvIZqzC2Y8Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82096192"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="82096192"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 04:02:57 -0700
X-CSE-ConnectionGUID: 9qVu8A4kQga8rgwRhoFJqA==
X-CSE-MsgGUID: 2yE6AlMXQzmwOP9iJGsm4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="251735995"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Jun 2026 04:02:56 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXzf2-00000000Odj-4BRr;
	Fri, 12 Jun 2026 11:02:52 +0000
Date: Fri, 12 Jun 2026 19:02:21 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:timekeeping 3/4] kernel/time/ntp.c:530:undefined
 reference to `__divdi3'
Message-ID: <202606121817.k5Kmr0vk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   git://git.infradead.org/users/dwmw2/linux timekeeping
head:   e7f603c6279b37147e7f69f394706df2546459b9
commit: c763fbd03afe23fb69685b6987fabf43c65ed579 [3/4] timekeeping: Settle =
competing time_offset and time_adjust skew
config: i386-randconfig-001-20260612 (https://download.01.org/0day-ci/archi=
ve/20260612/202606121817.k5Kmr0vk-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260612/202606121817.k5Kmr0vk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606121817.k5Kmr0vk-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   ld: kernel/time/ntp.o: in function `ntp_transfer_offset_adjust':
>> kernel/time/ntp.c:530:(.text+0xe53): undefined reference to `__divdi3'


vim +530 kernel/time/ntp.c

   488=09
   489	/*
   490	 * time_offset (drained exponentially) and time_adjust (drained line=
arly at the
   491	 * MAX_TICKADJ rate) can be asked to slew the clock in opposite dire=
ctions.
   492	 * second_overflow() only folds their *net* into skew_delta, so the =
cancelling
   493	 * part would never be drained from either tracker via the per-tick =
code -- and
   494	 * if they cancel exactly, skew_delta is zero and neither converges =
at all.
   495	 *
   496	 * Settle that cancelling phase directly between the two here. No cl=
ock motion
   497	 * results (the opposing slews annihilate), but both move toward zer=
o so neither
   498	 * stalls. @amount is the phase to take off time_offset, in its (=C3=
=B7HZ) units and
   499	 * with its sign; the same real magnitude comes off time_adjust in t=
he opposite
   500	 * direction. Clamped so neither tracker is driven past zero.
   501	 */
   502	static void ntp_transfer_offset_adjust(struct ntp_data *ntpdata, s64=
 amount)
   503	{
   504		s64 frac_delta, carry;
   505=09
   506		/*
   507		 * Don't drain time_offset past zero. @amount shares its sign and is
   508		 * normally bounded below it by ntp_offset_chunk(), but the =C2=B11=
 skew_delta
   509		 * floor for a tiny time_offset can exceed it, so clamp.
   510		 */
   511		if (abs(amount) > abs(ntpdata->time_offset))
   512			amount =3D ntpdata->time_offset;
   513		if (!amount)
   514			return;
   515=09
   516		/*
   517		 * Remove the matching phase from time_adjust, in plain shifted-ns.=
 No
   518		 * clamp against time_adjust's zero is needed: @amount is bounded b=
y the
   519		 * adjtime chunk, which second_overflow() never lets exceed time_ad=
just's
   520		 * own pending phase, so this cannot overshoot.
   521		 */
   522		frac_delta =3D amount * NTP_INTERVAL_FREQ;
   523=09
   524		ntpdata->time_offset -=3D amount;
   525=09
   526		/* Add the matching phase to time_adjust, carrying whole =C2=B5s (O=
(1)). */
   527		ntpdata->time_adjust_frac +=3D frac_delta;
   528		if (ntpdata->time_adjust_frac >=3D ONE_US_NS ||
   529		    ntpdata->time_adjust_frac <=3D -ONE_US_NS) {
 > 530			carry =3D ntpdata->time_adjust_frac / ONE_US_NS;
   531			ntpdata->time_adjust	  +=3D carry;
   532			ntpdata->time_adjust_frac -=3D carry * ONE_US_NS;
   533		}
   534=09
   535		/*
   536		 * Keep time_adjust and its sub-=C2=B5s remainder the same sign. The
   537		 * truncating carry above can leave them opposed (e.g. +4 =C2=B5s p=
aired
   538		 * with -250 ns), and ntp_drain_time_adjust() treats abs(time_adjus=
t_frac)
   539		 * as same-direction drawer capacity -- an opposing remainder there=
 makes
   540		 * it over-deliver phase that was never removed from the pile. Borr=
ow or
   541		 * repay a single whole =C2=B5s to realign; the total phase is unch=
anged.
   542		 */
   543		if (ntpdata->time_adjust > 0 && ntpdata->time_adjust_frac < 0) {
   544			ntpdata->time_adjust--;
   545			ntpdata->time_adjust_frac +=3D ONE_US_NS;
   546		} else if (ntpdata->time_adjust < 0 && ntpdata->time_adjust_frac > =
0) {
   547			ntpdata->time_adjust++;
   548			ntpdata->time_adjust_frac -=3D ONE_US_NS;
   549		}
   550	}
   551=09

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
