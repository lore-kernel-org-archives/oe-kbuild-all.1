Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4939D2E5B27
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Mar 2026 02:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773886010; cv=none; b=dr29TYp+YxkRUQMZoW5Ss77qyQzcV/ppHZi0lVxgLHwk7sP1uJSb54YKU/GqqDYqpOV/9vy8LOvQay2UamdFIoSHLBhNwc+4GVXF8/qCM4Fxlnw2BfgGA+2pjQ6AfByKHOhD50UhwOfBKH2obXnzk/08+DwpdquDcw+WaHpXTiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773886010; c=relaxed/simple;
	bh=BLQb//NbEmVulMyuweUGeo9az95ORf4NTnZcm0qDdSg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=r9KFlUZer5o6KddJTNu0+1uKH94RdGQkPBav1VOKk6JHm762W9op1VGOmOvpJ5SJFK96QNsNhDaD5o5MPOPooQDyaBfJeTNo4BTw10mTjD9GokxIRZ0o83n+S8MvtkE9KAzF94EveJTbR+pEYMGFprQUNeEqtNaU1rE9azilR88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MSpfESlJ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MSpfESlJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773886008; x=1805422008;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BLQb//NbEmVulMyuweUGeo9az95ORf4NTnZcm0qDdSg=;
  b=MSpfESlJ3oZoo/gNpp4me/W8knud91X83ZqAhi0IfvBH0bEYdRdvhqAl
   Gzgn2/HmRFKOicEQCUk9CTYU8cJXgNsbP0c5a3zcKMMgtHelXPepmpx1i
   oxLuf339p6RJxy2lRJhRw+hk02Ir4pBIsAKmqxdZpEvqTi7P/YKw736A5
   qcQZ5P7ZjsvCuTkX7lEUPZxjgKu8u93qJ+DBOOe9FeTlznmfuZEXwYySQ
   akCZ114+b1X/TJ+D0U/e8e31oRl6PbHY7hjcaplK45cwavOgPyI+Ro3q3
   RXmIcxXNhG8QnWKJSJ0rZk2/mGXjcGec21KfuJGY3e8qax9wnEcKMmoby
   w==;
X-CSE-ConnectionGUID: iEL1NSZSRYeNJBWhE5CmJA==
X-CSE-MsgGUID: E8dN1IbSQvieNcxUv2QCug==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="75032716"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="75032716"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 19:06:48 -0700
X-CSE-ConnectionGUID: dNHPMPwaRCqNMvBzRYuBsw==
X-CSE-MsgGUID: YEEzB63dT2S/FgI94bDOxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="226953190"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 18 Mar 2026 19:06:46 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w32lp-000000000C9-0kXZ;
	Thu, 19 Mar 2026 02:06:21 +0000
Date: Thu, 19 Mar 2026 10:05:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Christoph =?utf-8?Q?B=C3=B6hmwalder"?= <christoph.boehmwalder@linbit.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 6496/7246] ERROR: modpost:
 "tls_alert_recv" [drivers/block/drbd/drbd_transport_tcp.ko] undefined!
Message-ID: <202603190923.raOgcxAV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8e42d2514a7e8eb8d740d0ba82339dd6c0b6463f
commit: 7d6deec50773e43a5840f798ea0a730f20f74700 [6496/7246] drbd: remove BROKEN for DRBD
config: microblaze-randconfig-r062-20260319 (https://download.01.org/0day-ci/archive/20260319/202603190923.raOgcxAV-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260319/202603190923.raOgcxAV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603190923.raOgcxAV-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "tls_alert_recv" [drivers/block/drbd/drbd_transport_tcp.ko] undefined!
>> ERROR: modpost: "tls_server_hello_x509" [drivers/block/drbd/drbd_transport_tcp.ko] undefined!
>> ERROR: modpost: "tls_handshake_cancel" [drivers/block/drbd/drbd_transport_tcp.ko] undefined!
>> ERROR: modpost: "tls_get_record_type" [drivers/block/drbd/drbd_transport_tcp.ko] undefined!
>> ERROR: modpost: "tls_client_hello_x509" [drivers/block/drbd/drbd_transport_tcp.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
