Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752323905E0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Jul 2026 02:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784688617; cv=none; b=DdsEZNqoMccRiGvDz5LiZCLIqwfFF9hDWA/TMobMfeO3UdwzrnTnNZ7PhA8A4h3Z5Iycy2vpNZdsfDzhOAe7dqSibdIRfAV49oLFhVjmqwQa2Dohu8b4J6mq/BOHJIoKKKaifnw4wNGSjMdf9WvDR9UjPVezURvx0P4lTXgyzXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784688617; c=relaxed/simple;
	bh=PvJeZiurkH4hA37D4Kuy14SAYkpp8miAROrqct/H8+E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=u97JvIyhtIj+53dB4HULWymsuu2bLTZ3AIbhltCTI3JSuiv4sVTz/yU7vZNpdEQKGO3fjh00uVjCvwBolo+5MWIZGlSdlxeEOiIxS0FU+cLc3J27L4oOizm8j4VXiDaZ7MEOn+ZfIpTIGN68I2E+35dRAzsWuQri6y4CepI6C6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yt/p3pY9; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yt/p3pY9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784688612; x=1816224612;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PvJeZiurkH4hA37D4Kuy14SAYkpp8miAROrqct/H8+E=;
  b=Yt/p3pY9jXE2G1nOq+sU682PBgaBITp2nHgYwm8vW/BS/Cgr3HAVVT1v
   dauI5P0TyVF8Odb9brnNwoPBeil42MuQl1XTcg9FdvSLG+wi0f4jqdGiX
   1Uq5cFAe6Ccbx6vjvc+5cGdEo5+vRDIbqMyV45rEozDRNGEt4a31aTq4G
   sPOLBPFiWVYWntnSr1CjIHRLeh0ydE/ccRMXMsoI52t3Gt5Lp+IuHGpME
   TMIvOkvpU+o6HqHGGhjQT9W5RcsKkgIjIcZXa2Lrelb/QOUnPsB4oa7/c
   5gVMA7y2n29oEI1CPou0U2pJoxUIdVu4S8JqXU5momP7PLYAOlj5W8aNM
   Q==;
X-CSE-ConnectionGUID: 7iWb8KG5TRK5necqHqOcZA==
X-CSE-MsgGUID: uTbqaRKSRh28Q9bmT3CJ9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="85354030"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="85354030"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 19:50:11 -0700
X-CSE-ConnectionGUID: V5X3JpWRSl6CqkWSQeVPHw==
X-CSE-MsgGUID: h0VtoVzBTiaBB27zvwCbdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="296180164"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 21 Jul 2026 19:50:10 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmN27-00000000YM5-2kHV;
	Wed, 22 Jul 2026 02:50:07 +0000
Date: Wed, 22 Jul 2026 10:49:25 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 28/49]
 hrtimer.c:undefined reference to `ktime_mono_to_aux'
Message-ID: <202607221013.4Qja3wXR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep
head:   d26052c6ae3ab10f0585d9e359247aa1beeafada
commit: 0d8de0912bbdd873eb051fe76eb7049691ef3993 [28/49] hrtimer: Add support for auxiliary clocks
config: xtensa-randconfig-001-20260722 (https://download.01.org/0day-ci/archive/20260722/202607221013.4Qja3wXR-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260722/202607221013.4Qja3wXR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607221013.4Qja3wXR-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: kernel/time/hrtimer.o: in function `__run_hrtimer.constprop.44':
>> hrtimer.c:(.text+0x1088): undefined reference to `ktime_mono_to_aux'
   xtensa-linux-ld: kernel/time/hrtimer.o: in function `__hrtimer_run_queues.constprop.37':
   hrtimer.c:(.text+0x118c): undefined reference to `ktime_mono_to_aux'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
