Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D03822A7F9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Mar 2026 07:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773905571; cv=none; b=FZaW3gT6xeXZQXQHJ5zMGvjSPvGhTb/9bVujArAo8mcmbl04OzJvN1zj7jhtQ5qtwyDadDqTNR88p+hSQdUkbOkeAFu3vgmkO/R4OX1oHcats1IYCvajkhWrLodgGUZSctxsf9alRvhvtElj2hQpoL0fmYAgJpesSKmiC32xij8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773905571; c=relaxed/simple;
	bh=vvDh3XgHlKGzNQstkz1p9VVmKJXEVBCYO14q0KSjmx4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=W4wnF3tBgj8Tu57cJexS6bI4F/asPhJ1jvDQPjsSN2pZYwZjAPl+ccWJ1DlOvsRsc/twqSh28iHmCBF1QGe5YRGjov+d4TsL6cyDP4XqDwGC97bqlm9/bRh+8oGn28jt6y9tF5VJKMAzOirz08hfp3Qx2tnJGmYCN3Jja+3z310=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c8nNSsgo; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c8nNSsgo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773905557; x=1805441557;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vvDh3XgHlKGzNQstkz1p9VVmKJXEVBCYO14q0KSjmx4=;
  b=c8nNSsgoEDsyQ94nLeZWSHbaZwg37JdbG9jM+KH74M9hsdJB+29UR/JP
   OnRlCNdiArDVJ+ZL2zNlmSe+k2jm5c0iup7AxLxbN4dUmNX1yMpgf8IkB
   BlY9u+oCzQmJFILU5G/eOxR3SUokNXHP7s4yQ85Ob6CC9Jllcz3oN77f4
   SzwmtwNU3KgPXPOLXgectlICulRmUsEttKOLOnCakzjvSVoCcn1BoLSt2
   0+FPWrstUbDWQ7TRCXfnmh58nIPIceU62OCJ4NhHzf3l1BlP1k2BtegvE
   VlPR7f7WhHsG3sJFqTGmlDDkz7DICcKjRCitSwJrrbegYoAdVtvlDeVI1
   Q==;
X-CSE-ConnectionGUID: otu0yX2oRiCImRdtL2xZzA==
X-CSE-MsgGUID: 2hQ6Ti57TLisjX9ZtxrWWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="86449636"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="86449636"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 00:32:36 -0700
X-CSE-ConnectionGUID: M8leyYb5Qw+izcDkAf4OlA==
X-CSE-MsgGUID: Uef2JZp+QgqkTjJR9WH1Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="227578545"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 19 Mar 2026 00:32:33 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w37rq-000000000UN-1hJP;
	Thu, 19 Mar 2026 07:32:30 +0000
Date: Thu, 19 Mar 2026 15:24:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Christoph =?utf-8?Q?B=C3=B6hmwalder"?= <christoph.boehmwalder@linbit.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 5796/6828]
 drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: incorrect type in
 argument 1 (different base types)
Message-ID: <202603191508.U8ePudCE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   8e42d2514a7e8eb8d740d0ba82339dd6c0b6463f
commit: 314794b19fb4b08aba87ff06d650a1d38c86c094 [5796/6828] drbd: remove B=
ROKEN for DRBD
config: csky-randconfig-r121-20260318 (https://download.01.org/0day-ci/arch=
ive/20260319/202603191508.U8ePudCE-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260319/202603191508.U8ePudCE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603191508.U8ePudCE-lkp@i=
ntel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:607:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:607:42: sparse:     got restricted __le=
32 [usertype]
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:612:36: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [use=
rtype] @@     got int @@
   drivers/block/drbd/drbd_bitmap.c:612:36: sparse:     expected restricted=
 __le32 [usertype]
   drivers/block/drbd/drbd_bitmap.c:612:36: sparse:     got int
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse:     got restricted __le=
32 [usertype]
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:515:24: sparse: sparse: incorrect type =
in initializer (different base types) @@     expected unsigned int [usertyp=
e] val @@     got restricted __le32 const [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:515:24: sparse:     expected unsigned i=
nt [usertype] val
   drivers/block/drbd/drbd_bitmap.c:515:24: sparse:     got restricted __le=
32 const [usertype]
>> drivers/block/drbd/drbd_bitmap.c:517:28: sparse: sparse: cast to restric=
ted __le32
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse: sparse: incorrect type =
in initializer (different base types) @@     expected unsigned int [usertyp=
e] val @@     got restricted __le32 const [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse:     expected unsigned i=
nt [usertype] val
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse:     got restricted __le=
32 const [usertype]
   drivers/block/drbd/drbd_bitmap.c:524:34: sparse: sparse: cast to restric=
ted __le32
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:607:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:607:42: sparse:     got restricted __le=
32 [usertype]
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:612:36: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [use=
rtype] @@     got int @@
   drivers/block/drbd/drbd_bitmap.c:612:36: sparse:     expected restricted=
 __le32 [usertype]
   drivers/block/drbd/drbd_bitmap.c:612:36: sparse:     got int
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse:     got restricted __le=
32 [usertype]
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:515:24: sparse: sparse: incorrect type =
in initializer (different base types) @@     expected unsigned int [usertyp=
e] val @@     got restricted __le32 const [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:515:24: sparse:     expected unsigned i=
nt [usertype] val
   drivers/block/drbd/drbd_bitmap.c:515:24: sparse:     got restricted __le=
32 const [usertype]
>> drivers/block/drbd/drbd_bitmap.c:517:28: sparse: sparse: cast to restric=
ted __le32
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse: sparse: incorrect type =
in initializer (different base types) @@     expected unsigned int [usertyp=
e] val @@     got restricted __le32 const [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse:     expected unsigned i=
nt [usertype] val
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse:     got restricted __le=
32 const [usertype]
   drivers/block/drbd/drbd_bitmap.c:524:34: sparse: sparse: cast to restric=
ted __le32
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:607:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:607:42: sparse:     got restricted __le=
32 [usertype]
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:612:36: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [use=
rtype] @@     got int @@
   drivers/block/drbd/drbd_bitmap.c:612:36: sparse:     expected restricted=
 __le32 [usertype]
   drivers/block/drbd/drbd_bitmap.c:612:36: sparse:     got int
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse:     got restricted __le=
32 [usertype]
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:515:24: sparse: sparse: incorrect type =
in initializer (different base types) @@     expected unsigned int [usertyp=
e] val @@     got restricted __le32 const [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:515:24: sparse:     expected unsigned i=
nt [usertype] val
   drivers/block/drbd/drbd_bitmap.c:515:24: sparse:     got restricted __le=
32 const [usertype]
>> drivers/block/drbd/drbd_bitmap.c:517:28: sparse: sparse: cast to restric=
ted __le32
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse: sparse: incorrect type =
in initializer (different base types) @@     expected unsigned int [usertyp=
e] val @@     got restricted __le32 const [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse:     expected unsigned i=
nt [usertype] val
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse:     got restricted __le=
32 const [usertype]
   drivers/block/drbd/drbd_bitmap.c:524:34: sparse: sparse: cast to restric=
ted __le32
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:607:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:607:42: sparse:     got restricted __le=
32 [usertype]
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:612:36: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [use=
rtype] @@     got int @@
   drivers/block/drbd/drbd_bitmap.c:612:36: sparse:     expected restricted=
 __le32 [usertype]
   drivers/block/drbd/drbd_bitmap.c:612:36: sparse:     got int
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse:     got restricted __le=
32 [usertype]
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:515:24: sparse: sparse: incorrect type =
in initializer (different base types) @@     expected unsigned int [usertyp=
e] val @@     got restricted __le32 const [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:515:24: sparse:     expected unsigned i=
nt [usertype] val
   drivers/block/drbd/drbd_bitmap.c:515:24: sparse:     got restricted __le=
32 const [usertype]
>> drivers/block/drbd/drbd_bitmap.c:517:28: sparse: sparse: cast to restric=
ted __le32
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse: sparse: incorrect type =
in initializer (different base types) @@     expected unsigned int [usertyp=
e] val @@     got restricted __le32 const [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse:     expected unsigned i=
nt [usertype] val
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse:     got restricted __le=
32 const [usertype]
   drivers/block/drbd/drbd_bitmap.c:524:34: sparse: sparse: cast to restric=
ted __le32
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:607:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:607:42: sparse:     got restricted __le=
32 [usertype]
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:612:36: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [use=
rtype] @@     got int @@
   drivers/block/drbd/drbd_bitmap.c:612:36: sparse:     expected restricted=
 __le32 [usertype]
   drivers/block/drbd/drbd_bitmap.c:612:36: sparse:     got int
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse:     got restricted __le=
32 [usertype]
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:515:24: sparse: sparse: incorrect type =
in initializer (different base types) @@     expected unsigned int [usertyp=
e] val @@     got restricted __le32 const [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:515:24: sparse:     expected unsigned i=
nt [usertype] val
   drivers/block/drbd/drbd_bitmap.c:515:24: sparse:     got restricted __le=
32 const [usertype]
>> drivers/block/drbd/drbd_bitmap.c:517:28: sparse: sparse: cast to restric=
ted __le32
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse: sparse: incorrect type =
in initializer (different base types) @@     expected unsigned int [usertyp=
e] val @@     got restricted __le32 const [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse:     expected unsigned i=
nt [usertype] val
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse:     got restricted __le=
32 const [usertype]
   drivers/block/drbd/drbd_bitmap.c:524:34: sparse: sparse: cast to restric=
ted __le32
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:607:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:607:42: sparse:     got restricted __le=
32 [usertype]
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:612:36: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [use=
rtype] @@     got int @@
   drivers/block/drbd/drbd_bitmap.c:612:36: sparse:     expected restricted=
 __le32 [usertype]
   drivers/block/drbd/drbd_bitmap.c:612:36: sparse:     got int
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse:     got restricted __le=
32 [usertype]
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:515:24: sparse: sparse: incorrect type =
in initializer (different base types) @@     expected unsigned int [usertyp=
e] val @@     got restricted __le32 const [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:515:24: sparse:     expected unsigned i=
nt [usertype] val
   drivers/block/drbd/drbd_bitmap.c:515:24: sparse:     got restricted __le=
32 const [usertype]
>> drivers/block/drbd/drbd_bitmap.c:517:28: sparse: sparse: cast to restric=
ted __le32
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse: sparse: incorrect type =
in initializer (different base types) @@     expected unsigned int [usertyp=
e] val @@     got restricted __le32 const [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse:     expected unsigned i=
nt [usertype] val
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse:     got restricted __le=
32 const [usertype]
   drivers/block/drbd/drbd_bitmap.c:524:34: sparse: sparse: cast to restric=
ted __le32
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:607:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:607:42: sparse:     got restricted __le=
32 [usertype]
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:612:36: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [use=
rtype] @@     got int @@
   drivers/block/drbd/drbd_bitmap.c:612:36: sparse:     expected restricted=
 __le32 [usertype]
   drivers/block/drbd/drbd_bitmap.c:612:36: sparse:     got int
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse:     got restricted __le=
32 [usertype]
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:515:24: sparse: sparse: incorrect type =
in initializer (different base types) @@     expected unsigned int [usertyp=
e] val @@     got restricted __le32 const [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:515:24: sparse:     expected unsigned i=
nt [usertype] val
   drivers/block/drbd/drbd_bitmap.c:515:24: sparse:     got restricted __le=
32 const [usertype]
>> drivers/block/drbd/drbd_bitmap.c:517:28: sparse: sparse: cast to restric=
ted __le32
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse: sparse: incorrect type =
in initializer (different base types) @@     expected unsigned int [usertyp=
e] val @@     got restricted __le32 const [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse:     expected unsigned i=
nt [usertype] val
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse:     got restricted __le=
32 const [usertype]
   drivers/block/drbd/drbd_bitmap.c:524:34: sparse: sparse: cast to restric=
ted __le32
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:607:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:607:42: sparse:     got restricted __le=
32 [usertype]
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:612:36: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [use=
rtype] @@     got int @@
   drivers/block/drbd/drbd_bitmap.c:612:36: sparse:     expected restricted=
 __le32 [usertype]
   drivers/block/drbd/drbd_bitmap.c:612:36: sparse:     got int
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse:     got restricted __le=
32 [usertype]
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:515:24: sparse: sparse: incorrect type =
in initializer (different base types) @@     expected unsigned int [usertyp=
e] val @@     got restricted __le32 const [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:515:24: sparse:     expected unsigned i=
nt [usertype] val
   drivers/block/drbd/drbd_bitmap.c:515:24: sparse:     got restricted __le=
32 const [usertype]
>> drivers/block/drbd/drbd_bitmap.c:517:28: sparse: sparse: cast to restric=
ted __le32
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse: sparse: incorrect type =
in initializer (different base types) @@     expected unsigned int [usertyp=
e] val @@     got restricted __le32 const [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse:     expected unsigned i=
nt [usertype] val
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse:     got restricted __le=
32 const [usertype]
   drivers/block/drbd/drbd_bitmap.c:524:34: sparse: sparse: cast to restric=
ted __le32
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:607:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:607:42: sparse:     got restricted __le=
32 [usertype]
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:612:36: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [use=
rtype] @@     got int @@
   drivers/block/drbd/drbd_bitmap.c:612:36: sparse:     expected restricted=
 __le32 [usertype]
   drivers/block/drbd/drbd_bitmap.c:612:36: sparse:     got int
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse:     got restricted __le=
32 [usertype]
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:515:24: sparse: sparse: incorrect type =
in initializer (different base types) @@     expected unsigned int [usertyp=
e] val @@     got restricted __le32 const [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:515:24: sparse:     expected unsigned i=
nt [usertype] val
   drivers/block/drbd/drbd_bitmap.c:515:24: sparse:     got restricted __le=
32 const [usertype]
>> drivers/block/drbd/drbd_bitmap.c:517:28: sparse: sparse: cast to restric=
ted __le32
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse: sparse: incorrect type =
in initializer (different base types) @@     expected unsigned int [usertyp=
e] val @@     got restricted __le32 const [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse:     expected unsigned i=
nt [usertype] val
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse:     got restricted __le=
32 const [usertype]
   drivers/block/drbd/drbd_bitmap.c:524:34: sparse: sparse: cast to restric=
ted __le32
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:607:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:607:42: sparse:     got restricted __le=
32 [usertype]
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:612:36: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [use=
rtype] @@     got int @@
   drivers/block/drbd/drbd_bitmap.c:612:36: sparse:     expected restricted=
 __le32 [usertype]
   drivers/block/drbd/drbd_bitmap.c:612:36: sparse:     got int
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse:     got restricted __le=
32 [usertype]
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:515:24: sparse: sparse: incorrect type =
in initializer (different base types) @@     expected unsigned int [usertyp=
e] val @@     got restricted __le32 const [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:515:24: sparse:     expected unsigned i=
nt [usertype] val
   drivers/block/drbd/drbd_bitmap.c:515:24: sparse:     got restricted __le=
32 const [usertype]
>> drivers/block/drbd/drbd_bitmap.c:517:28: sparse: sparse: cast to restric=
ted __le32
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse: sparse: incorrect type =
in initializer (different base types) @@     expected unsigned int [usertyp=
e] val @@     got restricted __le32 const [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse:     expected unsigned i=
nt [usertype] val
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse:     got restricted __le=
32 const [usertype]
   drivers/block/drbd/drbd_bitmap.c:524:34: sparse: sparse: cast to restric=
ted __le32
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:607:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:607:42: sparse:     got restricted __le=
32 [usertype]
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:612:36: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [use=
rtype] @@     got int @@
   drivers/block/drbd/drbd_bitmap.c:612:36: sparse:     expected restricted=
 __le32 [usertype]
   drivers/block/drbd/drbd_bitmap.c:612:36: sparse:     got int
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse:     got restricted __le=
32 [usertype]
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:515:24: sparse: sparse: incorrect type =
in initializer (different base types) @@     expected unsigned int [usertyp=
e] val @@     got restricted __le32 const [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:515:24: sparse:     expected unsigned i=
nt [usertype] val
   drivers/block/drbd/drbd_bitmap.c:515:24: sparse:     got restricted __le=
32 const [usertype]
>> drivers/block/drbd/drbd_bitmap.c:517:28: sparse: sparse: cast to restric=
ted __le32
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse: sparse: incorrect type =
in initializer (different base types) @@     expected unsigned int [usertyp=
e] val @@     got restricted __le32 const [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse:     expected unsigned i=
nt [usertype] val
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse:     got restricted __le=
32 const [usertype]
   drivers/block/drbd/drbd_bitmap.c:524:34: sparse: sparse: cast to restric=
ted __le32
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:607:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:607:42: sparse:     got restricted __le=
32 [usertype]
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:612:36: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [use=
rtype] @@     got int @@
   drivers/block/drbd/drbd_bitmap.c:612:36: sparse:     expected restricted=
 __le32 [usertype]
   drivers/block/drbd/drbd_bitmap.c:612:36: sparse:     got int
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse:     got restricted __le=
32 [usertype]
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:515:24: sparse: sparse: incorrect type =
in initializer (different base types) @@     expected unsigned int [usertyp=
e] val @@     got restricted __le32 const [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:515:24: sparse:     expected unsigned i=
nt [usertype] val
   drivers/block/drbd/drbd_bitmap.c:515:24: sparse:     got restricted __le=
32 const [usertype]
>> drivers/block/drbd/drbd_bitmap.c:517:28: sparse: sparse: cast to restric=
ted __le32
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse: sparse: incorrect type =
in initializer (different base types) @@     expected unsigned int [usertyp=
e] val @@     got restricted __le32 const [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse:     expected unsigned i=
nt [usertype] val
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse:     got restricted __le=
32 const [usertype]
   drivers/block/drbd/drbd_bitmap.c:524:34: sparse: sparse: cast to restric=
ted __le32
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:607:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:607:42: sparse:     got restricted __le=
32 [usertype]
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:612:36: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [use=
rtype] @@     got int @@
   drivers/block/drbd/drbd_bitmap.c:612:36: sparse:     expected restricted=
 __le32 [usertype]
   drivers/block/drbd/drbd_bitmap.c:612:36: sparse:     got int
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse:     got restricted __le=
32 [usertype]
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:515:24: sparse: sparse: incorrect type =
in initializer (different base types) @@     expected unsigned int [usertyp=
e] val @@     got restricted __le32 const [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:515:24: sparse:     expected unsigned i=
nt [usertype] val
   drivers/block/drbd/drbd_bitmap.c:515:24: sparse:     got restricted __le=
32 const [usertype]
>> drivers/block/drbd/drbd_bitmap.c:517:28: sparse: sparse: cast to restric=
ted __le32
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse: sparse: incorrect type =
in initializer (different base types) @@     expected unsigned int [usertyp=
e] val @@     got restricted __le32 const [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse:     expected unsigned i=
nt [usertype] val
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse:     got restricted __le=
32 const [usertype]
   drivers/block/drbd/drbd_bitmap.c:524:34: sparse: sparse: cast to restric=
ted __le32
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:607:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:607:42: sparse:     got restricted __le=
32 [usertype]
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:612:36: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [use=
rtype] @@     got int @@
   drivers/block/drbd/drbd_bitmap.c:612:36: sparse:     expected restricted=
 __le32 [usertype]
   drivers/block/drbd/drbd_bitmap.c:612:36: sparse:     got int
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse:     got restricted __le=
32 [usertype]
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:515:24: sparse: sparse: incorrect type =
in initializer (different base types) @@     expected unsigned int [usertyp=
e] val @@     got restricted __le32 const [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:515:24: sparse:     expected unsigned i=
nt [usertype] val
   drivers/block/drbd/drbd_bitmap.c:515:24: sparse:     got restricted __le=
32 const [usertype]
>> drivers/block/drbd/drbd_bitmap.c:517:28: sparse: sparse: cast to restric=
ted __le32
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse: sparse: incorrect type =
in initializer (different base types) @@     expected unsigned int [usertyp=
e] val @@     got restricted __le32 const [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse:     expected unsigned i=
nt [usertype] val
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse:     got restricted __le=
32 const [usertype]
   drivers/block/drbd/drbd_bitmap.c:524:34: sparse: sparse: cast to restric=
ted __le32
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:607:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:607:42: sparse:     got restricted __le=
32 [usertype]
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:612:36: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [use=
rtype] @@     got int @@
   drivers/block/drbd/drbd_bitmap.c:612:36: sparse:     expected restricted=
 __le32 [usertype]
   drivers/block/drbd/drbd_bitmap.c:612:36: sparse:     got int
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse:     got restricted __le=
32 [usertype]
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:515:24: sparse: sparse: incorrect type =
in initializer (different base types) @@     expected unsigned int [usertyp=
e] val @@     got restricted __le32 const [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:515:24: sparse:     expected unsigned i=
nt [usertype] val
   drivers/block/drbd/drbd_bitmap.c:515:24: sparse:     got restricted __le=
32 const [usertype]
>> drivers/block/drbd/drbd_bitmap.c:517:28: sparse: sparse: cast to restric=
ted __le32
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse: sparse: incorrect type =
in initializer (different base types) @@     expected unsigned int [usertyp=
e] val @@     got restricted __le32 const [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse:     expected unsigned i=
nt [usertype] val
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse:     got restricted __le=
32 const [usertype]
   drivers/block/drbd/drbd_bitmap.c:524:34: sparse: sparse: cast to restric=
ted __le32
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:607:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:607:42: sparse:     got restricted __le=
32 [usertype]
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:612:36: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [use=
rtype] @@     got int @@
   drivers/block/drbd/drbd_bitmap.c:612:36: sparse:     expected restricted=
 __le32 [usertype]
   drivers/block/drbd/drbd_bitmap.c:612:36: sparse:     got int
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse:     got restricted __le=
32 [usertype]
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:515:24: sparse: sparse: incorrect type =
in initializer (different base types) @@     expected unsigned int [usertyp=
e] val @@     got restricted __le32 const [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:515:24: sparse:     expected unsigned i=
nt [usertype] val
   drivers/block/drbd/drbd_bitmap.c:515:24: sparse:     got restricted __le=
32 const [usertype]
>> drivers/block/drbd/drbd_bitmap.c:517:28: sparse: sparse: cast to restric=
ted __le32
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse: sparse: incorrect type =
in initializer (different base types) @@     expected unsigned int [usertyp=
e] val @@     got restricted __le32 const [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse:     expected unsigned i=
nt [usertype] val
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse:     got restricted __le=
32 const [usertype]
   drivers/block/drbd/drbd_bitmap.c:524:34: sparse: sparse: cast to restric=
ted __le32
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:607:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:607:42: sparse:     got restricted __le=
32 [usertype]
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:612:36: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [use=
rtype] @@     got int @@
   drivers/block/drbd/drbd_bitmap.c:612:36: sparse:     expected restricted=
 __le32 [usertype]
   drivers/block/drbd/drbd_bitmap.c:612:36: sparse:     got int
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse:     got restricted __le=
32 [usertype]
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:515:24: sparse: sparse: incorrect type =
in initializer (different base types) @@     expected unsigned int [usertyp=
e] val @@     got restricted __le32 const [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:515:24: sparse:     expected unsigned i=
nt [usertype] val
   drivers/block/drbd/drbd_bitmap.c:515:24: sparse:     got restricted __le=
32 const [usertype]
>> drivers/block/drbd/drbd_bitmap.c:517:28: sparse: sparse: cast to restric=
ted __le32
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse: sparse: incorrect type =
in initializer (different base types) @@     expected unsigned int [usertyp=
e] val @@     got restricted __le32 const [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse:     expected unsigned i=
nt [usertype] val
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse:     got restricted __le=
32 const [usertype]
   drivers/block/drbd/drbd_bitmap.c:524:34: sparse: sparse: cast to restric=
ted __le32
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:607:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:607:42: sparse:     got restricted __le=
32 [usertype]
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:607:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:611:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:612:36: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [use=
rtype] @@     got int @@
   drivers/block/drbd/drbd_bitmap.c:612:36: sparse:     expected restricted=
 __le32 [usertype]
   drivers/block/drbd/drbd_bitmap.c:612:36: sparse:     got int
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse:     got restricted __le=
32 [usertype]
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:618:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:621:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int w @@     =
got restricted __le32 @@
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse:     expected unsigned i=
nt w
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse:     got restricted __le=
32
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/block/drbd/drbd_bitmap.c:681:42: sparse: sparse: restricted __le=
32 degrades to integer
>> drivers/block/drbd/drbd_bitmap.c:515:24: sparse: sparse: incorrect type =
in initializer (different base types) @@     expected unsigned int [usertyp=
e] val @@     got restricted __le32 const [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:515:24: sparse:     expected unsigned i=
nt [usertype] val
   drivers/block/drbd/drbd_bitmap.c:515:24: sparse:     got restricted __le=
32 const [usertype]
>> drivers/block/drbd/drbd_bitmap.c:517:28: sparse: sparse: cast to restric=
ted __le32
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse: sparse: incorrect type =
in initializer (different base types) @@     expected unsigned int [usertyp=
e] val @@     got restricted __le32 const [usertype] @@
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse:     expected unsigned i=
nt [usertype] val
   drivers/block/drbd/drbd_bitmap.c:522:24: sparse:     got restricted __le=
32 const [usertype]
   drivers/block/drbd/drbd_bitmap.c:524:34: sparse: sparse: cast to restric=
ted __le32
--
>> drivers/block/drbd/drbd_req.c:886:9: sparse: sparse: incorrect type in a=
ssignment (different address spaces) @@     expected struct drbd_request [n=
oderef] __rcu *volatile @@     got struct drbd_request *[assigned] found_re=
q @@
   drivers/block/drbd/drbd_req.c:886:9: sparse:     expected struct drbd_re=
quest [noderef] __rcu *volatile
   drivers/block/drbd/drbd_req.c:886:9: sparse:     got struct drbd_request=
 *[assigned] found_req
>> drivers/block/drbd/drbd_req.c:1031:48: sparse: sparse: incorrect type in=
 argument 2 (different address spaces) @@     expected struct drbd_request =
[noderef] __rcu **cache_ptr @@     got struct drbd_request ** @@
   drivers/block/drbd/drbd_req.c:1031:48: sparse:     expected struct drbd_=
request [noderef] __rcu **cache_ptr
   drivers/block/drbd/drbd_req.c:1031:48: sparse:     got struct drbd_reque=
st **
   drivers/block/drbd/drbd_req.c:1051:48: sparse: sparse: incorrect type in=
 argument 2 (different address spaces) @@     expected struct drbd_request =
[noderef] __rcu **cache_ptr @@     got struct drbd_request ** @@
   drivers/block/drbd/drbd_req.c:1051:48: sparse:     expected struct drbd_=
request [noderef] __rcu **cache_ptr
   drivers/block/drbd/drbd_req.c:1051:48: sparse:     got struct drbd_reque=
st **
--
>> drivers/block/drbd/drbd_main.c:142:31: sparse: sparse: symbol 'param_ops=
_drbd_strict_names' was not declared. Should it be static?
>> drivers/block/drbd/drbd_main.c:215:21: sparse: sparse: incorrect type in=
 assignment (different address spaces) @@     expected struct list_head *[a=
ddressable] pos @@     got struct list_head [noderef] __rcu * @@
   drivers/block/drbd/drbd_main.c:215:21: sparse:     expected struct list_=
head *[addressable] pos
   drivers/block/drbd/drbd_main.c:215:21: sparse:     got struct list_head =
[noderef] __rcu *
   drivers/block/drbd/drbd_main.c:264:21: sparse: sparse: incorrect type in=
 assignment (different address spaces) @@     expected struct list_head *[a=
ddressable] pos @@     got struct list_head [noderef] __rcu * @@
   drivers/block/drbd/drbd_main.c:264:21: sparse:     expected struct list_=
head *[addressable] pos
   drivers/block/drbd/drbd_main.c:264:21: sparse:     got struct list_head =
[noderef] __rcu *
   drivers/block/drbd/drbd_main.c:851:20: sparse: sparse: incorrect type in=
 assignment (different base types) @@     expected unsigned int [usertype] =
magic @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:851:20: sparse:     expected unsigned int=
 [usertype] magic
   drivers/block/drbd/drbd_main.c:851:20: sparse:     got restricted __be32=
 [usertype]
   drivers/block/drbd/drbd_main.c:852:20: sparse: sparse: incorrect type in=
 assignment (different base types) @@     expected unsigned short [usertype=
] command @@     got restricted __be16 [usertype] @@
   drivers/block/drbd/drbd_main.c:852:20: sparse:     expected unsigned sho=
rt [usertype] command
   drivers/block/drbd/drbd_main.c:852:20: sparse:     got restricted __be16=
 [usertype]
   drivers/block/drbd/drbd_main.c:853:20: sparse: sparse: incorrect type in=
 assignment (different base types) @@     expected unsigned short [usertype=
] length @@     got restricted __be16 [usertype] @@
   drivers/block/drbd/drbd_main.c:853:20: sparse:     expected unsigned sho=
rt [usertype] length
   drivers/block/drbd/drbd_main.c:853:20: sparse:     got restricted __be16=
 [usertype]
   drivers/block/drbd/drbd_main.c:858:20: sparse: sparse: incorrect type in=
 assignment (different base types) @@     expected unsigned short [usertype=
] magic @@     got restricted __be16 [usertype] @@
   drivers/block/drbd/drbd_main.c:858:20: sparse:     expected unsigned sho=
rt [usertype] magic
   drivers/block/drbd/drbd_main.c:858:20: sparse:     got restricted __be16=
 [usertype]
   drivers/block/drbd/drbd_main.c:859:20: sparse: sparse: incorrect type in=
 assignment (different base types) @@     expected unsigned short [usertype=
] command @@     got restricted __be16 [usertype] @@
   drivers/block/drbd/drbd_main.c:859:20: sparse:     expected unsigned sho=
rt [usertype] command
   drivers/block/drbd/drbd_main.c:859:20: sparse:     got restricted __be16=
 [usertype]
   drivers/block/drbd/drbd_main.c:860:19: sparse: sparse: incorrect type in=
 assignment (different base types) @@     expected unsigned int [usertype] =
length @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:860:19: sparse:     expected unsigned int=
 [usertype] length
   drivers/block/drbd/drbd_main.c:860:19: sparse:     got restricted __be32=
 [usertype]
   drivers/block/drbd/drbd_main.c:866:18: sparse: sparse: incorrect type in=
 assignment (different base types) @@     expected unsigned int [usertype] =
magic @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:866:18: sparse:     expected unsigned int=
 [usertype] magic
   drivers/block/drbd/drbd_main.c:866:18: sparse:     got restricted __be32=
 [usertype]
   drivers/block/drbd/drbd_main.c:867:19: sparse: sparse: incorrect type in=
 assignment (different base types) @@     expected unsigned short [usertype=
] volume @@     got restricted __be16 [usertype] @@
   drivers/block/drbd/drbd_main.c:867:19: sparse:     expected unsigned sho=
rt [usertype] volume
   drivers/block/drbd/drbd_main.c:867:19: sparse:     got restricted __be16=
 [usertype]
   drivers/block/drbd/drbd_main.c:868:20: sparse: sparse: incorrect type in=
 assignment (different base types) @@     expected unsigned short [usertype=
] command @@     got restricted __be16 [usertype] @@
   drivers/block/drbd/drbd_main.c:868:20: sparse:     expected unsigned sho=
rt [usertype] command
   drivers/block/drbd/drbd_main.c:868:20: sparse:     got restricted __be16=
 [usertype]
   drivers/block/drbd/drbd_main.c:869:19: sparse: sparse: incorrect type in=
 assignment (different base types) @@     expected unsigned int [usertype] =
length @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:869:19: sparse:     expected unsigned int=
 [usertype] length
   drivers/block/drbd/drbd_main.c:869:19: sparse:     got restricted __be32=
 [usertype]
>> drivers/block/drbd/drbd_main.c:1175:17: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long long [use=
rtype] mask @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_main.c:1175:17: sparse:     expected unsigned lo=
ng long [usertype] mask
   drivers/block/drbd/drbd_main.c:1175:17: sparse:     got restricted __be6=
4 [usertype]
>> drivers/block/drbd/drbd_main.c:1176:19: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long long [use=
rtype] dagtag @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_main.c:1176:19: sparse:     expected unsigned lo=
ng long [usertype] dagtag
   drivers/block/drbd/drbd_main.c:1176:19: sparse:     got restricted __be6=
4 [usertype]
>> drivers/block/drbd/drbd_main.c:1219:32: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 resync_rate @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:1219:32: sparse:     expected unsigned in=
t [usertype] resync_rate
   drivers/block/drbd/drbd_main.c:1219:32: sparse:     got restricted __be3=
2 [usertype]
>> drivers/block/drbd/drbd_main.c:1220:33: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 c_plan_ahead @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:1220:33: sparse:     expected unsigned in=
t [usertype] c_plan_ahead
   drivers/block/drbd/drbd_main.c:1220:33: sparse:     got restricted __be3=
2 [usertype]
>> drivers/block/drbd/drbd_main.c:1221:35: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 c_delay_target @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:1221:35: sparse:     expected unsigned in=
t [usertype] c_delay_target
   drivers/block/drbd/drbd_main.c:1221:35: sparse:     got restricted __be3=
2 [usertype]
>> drivers/block/drbd/drbd_main.c:1222:34: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 c_fill_target @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:1222:34: sparse:     expected unsigned in=
t [usertype] c_fill_target
   drivers/block/drbd/drbd_main.c:1222:34: sparse:     got restricted __be3=
2 [usertype]
>> drivers/block/drbd/drbd_main.c:1223:31: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 c_max_rate @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:1223:31: sparse:     expected unsigned in=
t [usertype] c_max_rate
   drivers/block/drbd/drbd_main.c:1223:31: sparse:     got restricted __be3=
2 [usertype]
   drivers/block/drbd/drbd_main.c:1226:32: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 resync_rate @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:1226:32: sparse:     expected unsigned in=
t [usertype] resync_rate
   drivers/block/drbd/drbd_main.c:1226:32: sparse:     got restricted __be3=
2 [usertype]
   drivers/block/drbd/drbd_main.c:1227:33: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 c_plan_ahead @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:1227:33: sparse:     expected unsigned in=
t [usertype] c_plan_ahead
   drivers/block/drbd/drbd_main.c:1227:33: sparse:     got restricted __be3=
2 [usertype]
   drivers/block/drbd/drbd_main.c:1228:35: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 c_delay_target @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:1228:35: sparse:     expected unsigned in=
t [usertype] c_delay_target
   drivers/block/drbd/drbd_main.c:1228:35: sparse:     got restricted __be3=
2 [usertype]
   drivers/block/drbd/drbd_main.c:1229:34: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 c_fill_target @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:1229:34: sparse:     expected unsigned in=
t [usertype] c_fill_target
   drivers/block/drbd/drbd_main.c:1229:34: sparse:     got restricted __be3=
2 [usertype]
   drivers/block/drbd/drbd_main.c:1230:31: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 c_max_rate @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:1230:31: sparse:     expected unsigned in=
t [usertype] c_max_rate
   drivers/block/drbd/drbd_main.c:1230:31: sparse:     got restricted __be3=
2 [usertype]
>> drivers/block/drbd/drbd_main.c:1271:26: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 protocol @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:1271:26: sparse:     expected unsigned in=
t [usertype] protocol
   drivers/block/drbd/drbd_main.c:1271:26: sparse:     got restricted __be3=
2 [usertype]
>> drivers/block/drbd/drbd_main.c:1272:26: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 after_sb_0p @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:1272:26: sparse:     expected unsigned in=
t [usertype] after_sb_0p
   drivers/block/drbd/drbd_main.c:1272:26: sparse:     got restricted __be3=
2 [usertype]
>> drivers/block/drbd/drbd_main.c:1273:26: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 after_sb_1p @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:1273:26: sparse:     expected unsigned in=
t [usertype] after_sb_1p
   drivers/block/drbd/drbd_main.c:1273:26: sparse:     got restricted __be3=
2 [usertype]
>> drivers/block/drbd/drbd_main.c:1274:26: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 after_sb_2p @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:1274:26: sparse:     expected unsigned in=
t [usertype] after_sb_2p
   drivers/block/drbd/drbd_main.c:1274:26: sparse:     got restricted __be3=
2 [usertype]
>> drivers/block/drbd/drbd_main.c:1275:26: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 two_primaries @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:1275:26: sparse:     expected unsigned in=
t [usertype] two_primaries
   drivers/block/drbd/drbd_main.c:1275:26: sparse:     got restricted __be3=
2 [usertype]
>> drivers/block/drbd/drbd_main.c:1281:26: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 conn_flags @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:1281:26: sparse:     expected unsigned in=
t [usertype] conn_flags
   drivers/block/drbd/drbd_main.c:1281:26: sparse:     got restricted __be3=
2 [usertype]
>> drivers/block/drbd/drbd_main.c:1306:25: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long long [use=
rtype] current_uuid @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_main.c:1306:25: sparse:     expected unsigned lo=
ng long [usertype] current_uuid
   drivers/block/drbd/drbd_main.c:1306:25: sparse:     got restricted __be6=
4 [usertype]
>> drivers/block/drbd/drbd_main.c:1307:24: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long long [use=
rtype] bitmap_uuid @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_main.c:1307:24: sparse:     expected unsigned lo=
ng long [usertype] bitmap_uuid
   drivers/block/drbd/drbd_main.c:1307:24: sparse:     got restricted __be6=
4 [usertype]
   drivers/block/drbd/drbd_main.c:1309:37: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long long @@  =
   got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_main.c:1309:37: sparse:     expected unsigned lo=
ng long
   drivers/block/drbd/drbd_main.c:1309:37: sparse:     got restricted __be6=
4 [usertype]
>> drivers/block/drbd/drbd_main.c:1313:23: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long long [use=
rtype] dirty_bits @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_main.c:1313:23: sparse:     expected unsigned lo=
ng long [usertype] dirty_bits
   drivers/block/drbd/drbd_main.c:1313:23: sparse:     got restricted __be6=
4 [usertype]
>> drivers/block/drbd/drbd_main.c:1328:23: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long long [use=
rtype] uuid_flags @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_main.c:1328:23: sparse:     expected unsigned lo=
ng long [usertype] uuid_flags
   drivers/block/drbd/drbd_main.c:1328:23: sparse:     got restricted __be6=
4 [usertype]
   drivers/block/drbd/drbd_main.c:1441:25: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long long [use=
rtype] current_uuid @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_main.c:1441:25: sparse:     expected unsigned lo=
ng long [usertype] current_uuid
   drivers/block/drbd/drbd_main.c:1441:25: sparse:     got restricted __be6=
4 [usertype]
   drivers/block/drbd/drbd_main.c:1456:47: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long long @@  =
   got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_main.c:1456:47: sparse:     expected unsigned lo=
ng long
   drivers/block/drbd/drbd_main.c:1456:47: sparse:     got restricted __be6=
4 [usertype]
   drivers/block/drbd/drbd_main.c:1462:39: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long long @@  =
   got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_main.c:1462:39: sparse:     expected unsigned lo=
ng long
   drivers/block/drbd/drbd_main.c:1462:39: sparse:     got restricted __be6=
4 [usertype]
>> drivers/block/drbd/drbd_main.c:1465:30: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long long [use=
rtype] bitmap_uuids_mask @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_main.c:1465:30: sparse:     expected unsigned lo=
ng long [usertype] bitmap_uuids_mask
   drivers/block/drbd/drbd_main.c:1465:30: sparse:     got restricted __be6=
4 [usertype]
   drivers/block/drbd/drbd_main.c:1468:23: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long long [use=
rtype] dirty_bits @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_main.c:1468:23: sparse:     expected unsigned lo=
ng long [usertype] dirty_bits
   drivers/block/drbd/drbd_main.c:1468:23: sparse:     got restricted __be6=
4 [usertype]
>> drivers/block/drbd/drbd_main.c:1473:30: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long long [use=
rtype] node_mask @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_main.c:1473:30: sparse:     expected unsigned lo=
ng long [usertype] node_mask
   drivers/block/drbd/drbd_main.c:1473:30: sparse:     got restricted __be6=
4 [usertype]
   drivers/block/drbd/drbd_main.c:1476:30: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long long [use=
rtype] node_mask @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_main.c:1476:30: sparse:     expected unsigned lo=
ng long [usertype] node_mask
   drivers/block/drbd/drbd_main.c:1476:30: sparse:     got restricted __be6=
4 [usertype]
   drivers/block/drbd/drbd_main.c:1479:23: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long long [use=
rtype] uuid_flags @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_main.c:1479:23: sparse:     expected unsigned lo=
ng long [usertype] uuid_flags
   drivers/block/drbd/drbd_main.c:1479:23: sparse:     got restricted __be6=
4 [usertype]
   drivers/block/drbd/drbd_main.c:1525:17: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long long [use=
rtype] uuid @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_main.c:1525:17: sparse:     expected unsigned lo=
ng long [usertype] uuid
   drivers/block/drbd/drbd_main.c:1525:17: sparse:     got restricted __be6=
4 [usertype]
>> drivers/block/drbd/drbd_main.c:1526:23: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long long [use=
rtype] weak_nodes @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_main.c:1526:23: sparse:     expected unsigned lo=
ng long [usertype] weak_nodes
   drivers/block/drbd/drbd_main.c:1526:23: sparse:     got restricted __be6=
4 [usertype]
   drivers/block/drbd/drbd_main.c:1551:25: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long long [use=
rtype] uuid @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_main.c:1551:25: sparse:     expected unsigned lo=
ng long [usertype] uuid
   drivers/block/drbd/drbd_main.c:1551:25: sparse:     got restricted __be6=
4 [usertype]
   drivers/block/drbd/drbd_main.c:1588:46: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 physical_block_size @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:1588:46: sparse:     expected unsigned in=
t [usertype] physical_block_size
   drivers/block/drbd/drbd_main.c:1588:46: sparse:     got restricted __be3=
2 [usertype]
   drivers/block/drbd/drbd_main.c:1590:45: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 logical_block_size @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:1590:45: sparse:     expected unsigned in=
t [usertype] logical_block_size
   drivers/block/drbd/drbd_main.c:1590:45: sparse:     got restricted __be3=
2 [usertype]
   drivers/block/drbd/drbd_main.c:1592:43: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 alignment_offset @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:1592:43: sparse:     expected unsigned in=
t [usertype] alignment_offset
   drivers/block/drbd/drbd_main.c:1592:43: sparse:     got restricted __be3=
2 [usertype]
   drivers/block/drbd/drbd_main.c:1594:33: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 io_min @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:1594:33: sparse:     expected unsigned in=
t [usertype] io_min
   drivers/block/drbd/drbd_main.c:1594:33: sparse:     got restricted __be3=
2 [usertype]
   drivers/block/drbd/drbd_main.c:1595:33: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 io_opt @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:1595:33: sparse:     expected unsigned in=
t [usertype] io_opt
   drivers/block/drbd/drbd_main.c:1595:33: sparse:     got restricted __be3=
2 [usertype]
   drivers/block/drbd/drbd_main.c:1605:46: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 physical_block_size @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:1605:46: sparse:     expected unsigned in=
t [usertype] physical_block_size
   drivers/block/drbd/drbd_main.c:1605:46: sparse:     got restricted __be3=
2 [usertype]
   drivers/block/drbd/drbd_main.c:1607:45: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 logical_block_size @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:1607:45: sparse:     expected unsigned in=
t [usertype] logical_block_size
   drivers/block/drbd/drbd_main.c:1607:45: sparse:     got restricted __be3=
2 [usertype]
   drivers/block/drbd/drbd_main.c:1610:33: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 io_min @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:1610:33: sparse:     expected unsigned in=
t [usertype] io_min
   drivers/block/drbd/drbd_main.c:1610:33: sparse:     got restricted __be3=
2 [usertype]
   drivers/block/drbd/drbd_main.c:1611:33: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 io_opt @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:1611:33: sparse:     expected unsigned in=
t [usertype] io_opt
   drivers/block/drbd/drbd_main.c:1611:33: sparse:     got restricted __be3=
2 [usertype]
>> drivers/block/drbd/drbd_main.c:1630:19: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long long [use=
rtype] d_size @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_main.c:1630:19: sparse:     expected unsigned lo=
ng long [usertype] d_size
   drivers/block/drbd/drbd_main.c:1630:19: sparse:     got restricted __be6=
4 [usertype]
>> drivers/block/drbd/drbd_main.c:1631:19: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long long [use=
rtype] u_size @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_main.c:1631:19: sparse:     expected unsigned lo=
ng long [usertype] u_size
   drivers/block/drbd/drbd_main.c:1631:19: sparse:     got restricted __be6=
4 [usertype]
>> drivers/block/drbd/drbd_main.c:1636:19: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long long [use=
rtype] c_size @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_main.c:1636:19: sparse:     expected unsigned lo=
ng long [usertype] c_size
   drivers/block/drbd/drbd_main.c:1636:19: sparse:     got restricted __be6=
4 [usertype]
>> drivers/block/drbd/drbd_main.c:1637:25: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 max_bio_size @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:1637:25: sparse:     expected unsigned in=
t [usertype] max_bio_size
   drivers/block/drbd/drbd_main.c:1637:25: sparse:     got restricted __be3=
2 [usertype]
>> drivers/block/drbd/drbd_main.c:1638:29: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned short [usertyp=
e] queue_order_type @@     got restricted __be16 [usertype] @@
   drivers/block/drbd/drbd_main.c:1638:29: sparse:     expected unsigned sh=
ort [usertype] queue_order_type
   drivers/block/drbd/drbd_main.c:1638:29: sparse:     got restricted __be1=
6 [usertype]
>> drivers/block/drbd/drbd_main.c:1639:22: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned short [usertyp=
e] dds_flags @@     got restricted __be16 [usertype] @@
   drivers/block/drbd/drbd_main.c:1639:22: sparse:     expected unsigned sh=
ort [usertype] dds_flags
   drivers/block/drbd/drbd_main.c:1639:22: sparse:     got restricted __be1=
6 [usertype]
   drivers/block/drbd/drbd_main.c:1665:18: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 state @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:1665:18: sparse:     expected unsigned in=
t [usertype] state
   drivers/block/drbd/drbd_main.c:1665:18: sparse:     got restricted __be3=
2 [usertype]
   drivers/block/drbd/drbd_main.c:1699:17: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 mask @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:1699:17: sparse:     expected unsigned in=
t [usertype] mask
   drivers/block/drbd/drbd_main.c:1699:17: sparse:     got restricted __be3=
2 [usertype]
   drivers/block/drbd/drbd_main.c:1700:16: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 val @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:1700:16: sparse:     expected unsigned in=
t [usertype] val
   drivers/block/drbd/drbd_main.c:1700:16: sparse:     got restricted __be3=
2 [usertype]
>> drivers/block/drbd/drbd_main.c:1717:16: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 tid @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:1717:16: sparse:     expected unsigned in=
t [usertype] tid
   drivers/block/drbd/drbd_main.c:1717:16: sparse:     got restricted __be3=
2 [usertype]
   drivers/block/drbd/drbd_main.c:1719:26: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 flags @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:1719:26: sparse:     expected unsigned in=
t [usertype] flags
   drivers/block/drbd/drbd_main.c:1719:26: sparse:     got restricted __be3=
2 [usertype]
>> drivers/block/drbd/drbd_main.c:1724:42: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 u32_initiator_node_id @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:1724:42: sparse:     expected unsigned in=
t [usertype] u32_initiator_node_id
   drivers/block/drbd/drbd_main.c:1724:42: sparse:     got restricted __be3=
2 [usertype]
>> drivers/block/drbd/drbd_main.c:1725:39: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 u32_target_node_id @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:1725:39: sparse:     expected unsigned in=
t [usertype] u32_target_node_id
   drivers/block/drbd/drbd_main.c:1725:39: sparse:     got restricted __be3=
2 [usertype]
>> drivers/block/drbd/drbd_main.c:1727:27: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long long [use=
rtype] nodes_to_reach @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_main.c:1727:27: sparse:     expected unsigned lo=
ng long [usertype] nodes_to_reach
   drivers/block/drbd/drbd_main.c:1727:27: sparse:     got restricted __be6=
4 [usertype]
   drivers/block/drbd/drbd_main.c:1732:33: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 mask @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:1732:33: sparse:     expected unsigned in=
t [usertype] mask
   drivers/block/drbd/drbd_main.c:1732:33: sparse:     got restricted __be3=
2 [usertype]
   drivers/block/drbd/drbd_main.c:1733:32: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 val @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:1733:32: sparse:     expected unsigned in=
t [usertype] val
   drivers/block/drbd/drbd_main.c:1733:32: sparse:     got restricted __be3=
2 [usertype]
>> drivers/block/drbd/drbd_main.c:1735:42: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long long [use=
rtype] primary_nodes @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_main.c:1735:42: sparse:     expected unsigned lo=
ng long [usertype] primary_nodes
   drivers/block/drbd/drbd_main.c:1735:42: sparse:     got restricted __be6=
4 [usertype]
>> drivers/block/drbd/drbd_main.c:1738:52: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long long [use=
rtype] reachable_nodes @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_main.c:1738:52: sparse:     expected unsigned lo=
ng long [usertype] reachable_nodes
   drivers/block/drbd/drbd_main.c:1738:52: sparse:     got restricted __be6=
4 [usertype]
   drivers/block/drbd/drbd_main.c:1741:41: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 mask @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:1741:41: sparse:     expected unsigned in=
t [usertype] mask
   drivers/block/drbd/drbd_main.c:1741:41: sparse:     got restricted __be3=
2 [usertype]
   drivers/block/drbd/drbd_main.c:1742:40: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 val @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:1742:40: sparse:     expected unsigned in=
t [usertype] val
   drivers/block/drbd/drbd_main.c:1742:40: sparse:     got restricted __be3=
2 [usertype]
>> drivers/block/drbd/drbd_main.c:1748:38: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long long [use=
rtype] user_size @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_main.c:1748:38: sparse:     expected unsigned lo=
ng long [usertype] user_size
   drivers/block/drbd/drbd_main.c:1748:38: sparse:     got restricted __be6=
4 [usertype]
   drivers/block/drbd/drbd_main.c:1749:38: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned short [usertyp=
e] dds_flags @@     got restricted __be16 [usertype] @@
   drivers/block/drbd/drbd_main.c:1749:38: sparse:     expected unsigned sh=
ort [usertype] dds_flags
   drivers/block/drbd/drbd_main.c:1749:38: sparse:     got restricted __be1=
6 [usertype]
>> drivers/block/drbd/drbd_main.c:1751:50: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long long [use=
rtype] diskful_primary_nodes @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_main.c:1751:50: sparse:     expected unsigned lo=
ng long [usertype] diskful_primary_nodes
   drivers/block/drbd/drbd_main.c:1751:50: sparse:     got restricted __be6=
4 [usertype]
>> drivers/block/drbd/drbd_main.c:1753:41: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long long [use=
rtype] exposed_size @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_main.c:1753:41: sparse:     expected unsigned lo=
ng long [usertype] exposed_size
   drivers/block/drbd/drbd_main.c:1753:41: sparse:     got restricted __be6=
4 [usertype]
   drivers/block/drbd/drbd_main.c:1770:28: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 retcode @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:1770:28: sparse:     expected unsigned in=
t [usertype] retcode
   drivers/block/drbd/drbd_main.c:1770:28: sparse:     got restricted __be3=
2 [usertype]
   drivers/block/drbd/drbd_main.c:1782:24: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 tid @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:1782:24: sparse:     expected unsigned in=
t [usertype] tid
   drivers/block/drbd/drbd_main.c:1782:24: sparse:     got restricted __be3=
2 [usertype]
>> drivers/block/drbd/drbd_main.c:1783:38: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 initiator_node_id @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:1783:38: sparse:     expected unsigned in=
t [usertype] initiator_node_id
   drivers/block/drbd/drbd_main.c:1783:38: sparse:     got restricted __be3=
2 [usertype]
   drivers/block/drbd/drbd_main.c:1784:36: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long long [use=
rtype] reachable_nodes @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_main.c:1784:36: sparse:     expected unsigned lo=
ng long [usertype] reachable_nodes
   drivers/block/drbd/drbd_main.c:1784:36: sparse:     got restricted __be6=
4 [usertype]
   drivers/block/drbd/drbd_main.c:1787:42: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long long [use=
rtype] primary_nodes @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_main.c:1787:42: sparse:     expected unsigned lo=
ng long [usertype] primary_nodes
   drivers/block/drbd/drbd_main.c:1787:42: sparse:     got restricted __be6=
4 [usertype]
   drivers/block/drbd/drbd_main.c:1788:39: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long long [use=
rtype] weak_nodes @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_main.c:1788:39: sparse:     expected unsigned lo=
ng long [usertype] weak_nodes
   drivers/block/drbd/drbd_main.c:1788:39: sparse:     got restricted __be6=
4 [usertype]
   drivers/block/drbd/drbd_main.c:1791:50: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long long [use=
rtype] diskful_primary_nodes @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_main.c:1791:50: sparse:     expected unsigned lo=
ng long [usertype] diskful_primary_nodes
   drivers/block/drbd/drbd_main.c:1791:50: sparse:     got restricted __be6=
4 [usertype]
>> drivers/block/drbd/drbd_main.c:1792:46: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long long [use=
rtype] max_possible_size @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_main.c:1792:46: sparse:     expected unsigned lo=
ng long [usertype] max_possible_size
   drivers/block/drbd/drbd_main.c:1792:46: sparse:     got restricted __be6=
4 [usertype]
   drivers/block/drbd/drbd_main.c:1805:27: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long long [use=
rtype] sector @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_main.c:1805:27: sparse:     expected unsigned lo=
ng long [usertype] sector
   drivers/block/drbd/drbd_main.c:1805:27: sparse:     got restricted __be6=
4 [usertype]
   drivers/block/drbd/drbd_main.c:1806:25: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long long [use=
rtype] mask @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_main.c:1806:25: sparse:     expected unsigned lo=
ng long [usertype] mask
   drivers/block/drbd/drbd_main.c:1806:25: sparse:     got restricted __be6=
4 [usertype]
   drivers/block/drbd/drbd_main.c:1807:25: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 size @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:1807:25: sparse:     expected unsigned in=
t [usertype] size
   drivers/block/drbd/drbd_main.c:1807:25: sparse:     got restricted __be3=
2 [usertype]
   drivers/block/drbd/drbd_main.c:1821:19: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long long [use=
rtype] dagtag @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_main.c:1821:19: sparse:     expected unsigned lo=
ng long [usertype] dagtag
   drivers/block/drbd/drbd_main.c:1821:19: sparse:     got restricted __be6=
4 [usertype]
>> drivers/block/drbd/drbd_main.c:1822:20: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 node_id @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:1822:20: sparse:     expected unsigned in=
t [usertype] node_id
   drivers/block/drbd/drbd_main.c:1822:20: sparse:     got restricted __be3=
2 [usertype]
>> drivers/block/drbd/drbd_main.c:1835:27: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long long [use=
rtype] flush_sequence @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_main.c:1835:27: sparse:     expected unsigned lo=
ng long [usertype] flush_sequence
   drivers/block/drbd/drbd_main.c:1835:27: sparse:     got restricted __be6=
4 [usertype]
   drivers/block/drbd/drbd_main.c:1849:27: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long long [use=
rtype] flush_sequence @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_main.c:1849:27: sparse:     expected unsigned lo=
ng long [usertype] flush_sequence
   drivers/block/drbd/drbd_main.c:1849:27: sparse:     got restricted __be6=
4 [usertype]
   drivers/block/drbd/drbd_main.c:1850:30: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 initiator_node_id @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:1850:30: sparse:     expected unsigned in=
t [usertype] initiator_node_id
   drivers/block/drbd/drbd_main.c:1850:30: sparse:     got restricted __be3=
2 [usertype]
   drivers/block/drbd/drbd_main.c:1864:27: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long long [use=
rtype] flush_sequence @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_main.c:1864:27: sparse:     expected unsigned lo=
ng long [usertype] flush_sequence
   drivers/block/drbd/drbd_main.c:1864:27: sparse:     got restricted __be6=
4 [usertype]
>> drivers/block/drbd/drbd_main.c:1865:28: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 primary_node_id @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:1865:28: sparse:     expected unsigned in=
t [usertype] primary_node_id
   drivers/block/drbd/drbd_main.c:1865:28: sparse:     got restricted __be3=
2 [usertype]
   drivers/block/drbd/drbd_main.c:2234:27: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long long [use=
rtype] sector @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_main.c:2234:27: sparse:     expected unsigned lo=
ng long [usertype] sector
   drivers/block/drbd/drbd_main.c:2234:27: sparse:     got restricted __be6=
4 [usertype]
   drivers/block/drbd/drbd_main.c:2235:28: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 blksize @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:2235:28: sparse:     expected unsigned in=
t [usertype] blksize
   drivers/block/drbd/drbd_main.c:2235:28: sparse:     got restricted __be3=
2 [usertype]
   drivers/block/drbd/drbd_main.c:2243:22: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long long [use=
rtype] sector @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_main.c:2243:22: sparse:     expected unsigned lo=
ng long [usertype] sector
   drivers/block/drbd/drbd_main.c:2243:22: sparse:     got restricted __be6=
4 [usertype]
   drivers/block/drbd/drbd_main.c:2244:23: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 blksize @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:2244:23: sparse:     expected unsigned in=
t [usertype] blksize
   drivers/block/drbd/drbd_main.c:2244:23: sparse:     got restricted __be3=
2 [usertype]
   drivers/block/drbd/drbd_main.c:2258:19: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long long [use=
rtype] sector @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_main.c:2258:19: sparse:     expected unsigned lo=
ng long [usertype] sector
   drivers/block/drbd/drbd_main.c:2258:19: sparse:     got restricted __be6=
4 [usertype]
   drivers/block/drbd/drbd_main.c:2260:20: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 blksize @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:2260:20: sparse:     expected unsigned in=
t [usertype] blksize
   drivers/block/drbd/drbd_main.c:2260:20: sparse:     got restricted __be3=
2 [usertype]
>> drivers/block/drbd/drbd_main.c:2282:35: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 dagtag_node_id @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:2282:35: sparse:     expected unsigned in=
t [usertype] dagtag_node_id
   drivers/block/drbd/drbd_main.c:2282:35: sparse:     got restricted __be3=
2 [usertype]
   drivers/block/drbd/drbd_main.c:2283:27: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long long [use=
rtype] dagtag @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_main.c:2283:27: sparse:     expected unsigned lo=
ng long [usertype] dagtag
   drivers/block/drbd/drbd_main.c:2283:27: sparse:     got restricted __be6=
4 [usertype]
   drivers/block/drbd/drbd_main.c:2297:28: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long long [use=
rtype] sector @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_main.c:2297:28: sparse:     expected unsigned lo=
ng long [usertype] sector
   drivers/block/drbd/drbd_main.c:2297:28: sparse:     got restricted __be6=
4 [usertype]
   drivers/block/drbd/drbd_main.c:2299:29: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 blksize @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:2299:29: sparse:     expected unsigned in=
t [usertype] blksize
   drivers/block/drbd/drbd_main.c:2299:29: sparse:     got restricted __be3=
2 [usertype]
   drivers/block/drbd/drbd_main.c:2520:28: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 size @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:2520:28: sparse:     expected unsigned in=
t [usertype] size
   drivers/block/drbd/drbd_main.c:2520:28: sparse:     got restricted __be3=
2 [usertype]
   drivers/block/drbd/drbd_main.c:2531:19: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long long [use=
rtype] sector @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_main.c:2531:19: sparse:     expected unsigned lo=
ng long [usertype] sector
   drivers/block/drbd/drbd_main.c:2531:19: sparse:     got restricted __be6=
4 [usertype]
   drivers/block/drbd/drbd_main.c:2533:20: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 seq_num @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:2533:20: sparse:     expected unsigned in=
t [usertype] seq_num
   drivers/block/drbd/drbd_main.c:2533:20: sparse:     got restricted __be3=
2 [usertype]
   drivers/block/drbd/drbd_main.c:2543:21: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 dp_flags @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:2543:21: sparse:     expected unsigned in=
t [usertype] dp_flags
   drivers/block/drbd/drbd_main.c:2543:21: sparse:     got restricted __be3=
2 [usertype]
   drivers/block/drbd/drbd_main.c:2610:19: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long long [use=
rtype] sector @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_main.c:2610:19: sparse:     expected unsigned lo=
ng long [usertype] sector
   drivers/block/drbd/drbd_main.c:2610:19: sparse:     got restricted __be6=
4 [usertype]
   drivers/block/drbd/drbd_main.c:2638:19: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long long [use=
rtype] sector @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_main.c:2638:19: sparse:     expected unsigned lo=
ng long [usertype] sector
   drivers/block/drbd/drbd_main.c:2638:19: sparse:     got restricted __be6=
4 [usertype]
   drivers/block/drbd/drbd_main.c:2639:20: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 blksize @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_main.c:2639:20: sparse:     expected unsigned in=
t [usertype] blksize
   drivers/block/drbd/drbd_main.c:2639:20: sparse:     got restricted __be3=
2 [usertype]
   drivers/block/drbd/drbd_main.c:2653:19: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long long [use=
rtype] dagtag @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_main.c:2653:19: sparse:     expected unsigned lo=
ng long [usertype] dagtag
   drivers/block/drbd/drbd_main.c:2653:19: sparse:     got restricted __be6=
4 [usertype]
>> drivers/block/drbd/drbd_main.c:3407:26: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@     expected void const *objp @@=
     got struct fifo_buffer [noderef] __rcu *rs_plan_s @@
   drivers/block/drbd/drbd_main.c:3407:26: sparse:     expected void const =
*objp
   drivers/block/drbd/drbd_main.c:3407:26: sparse:     got struct fifo_buff=
er [noderef] __rcu *rs_plan_s
>> drivers/block/drbd/drbd_main.c:3408:26: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@     expected void const *objp @@=
     got struct peer_device_conf [noderef] __rcu *conf @@
   drivers/block/drbd/drbd_main.c:3408:26: sparse:     expected void const =
*objp
   drivers/block/drbd/drbd_main.c:3408:26: sparse:     got struct peer_devi=
ce_conf [noderef] __rcu *conf
>> drivers/block/drbd/drbd_main.c:4073:36: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@     expected void const *objp @@=
     got struct net_conf [noderef] __rcu *net_conf @@
   drivers/block/drbd/drbd_main.c:4073:36: sparse:     expected void const =
*objp
   drivers/block/drbd/drbd_main.c:4073:36: sparse:     got struct net_conf =
[noderef] __rcu *net_conf
--
>> drivers/block/drbd/drbd_nl.c:3253:24: sparse: sparse: incorrect type in =
assignment (different address spaces) @@     expected struct disk_conf [nod=
eref] __rcu *disk_conf @@     got struct disk_conf *[assigned] new_disk_con=
f @@
   drivers/block/drbd/drbd_nl.c:3253:24: sparse:     expected struct disk_c=
onf [noderef] __rcu *disk_conf
   drivers/block/drbd/drbd_nl.c:3253:24: sparse:     got struct disk_conf *=
[assigned] new_disk_conf
>> drivers/block/drbd/drbd_nl.c:2446:23: sparse: sparse: incorrect type in =
assignment (different address spaces) @@     expected struct disk_conf *old=
_disk_conf @@     got struct disk_conf [noderef] __rcu *disk_conf @@
   drivers/block/drbd/drbd_nl.c:2446:23: sparse:     expected struct disk_c=
onf *old_disk_conf
   drivers/block/drbd/drbd_nl.c:2446:23: sparse:     got struct disk_conf [=
noderef] __rcu *disk_conf
>> drivers/block/drbd/drbd_nl.c:4006:22: sparse: sparse: incorrect type in =
assignment (different address spaces) @@     expected struct net_conf *old_=
net_conf @@     got struct net_conf [noderef] __rcu *net_conf @@
   drivers/block/drbd/drbd_nl.c:4006:22: sparse:     expected struct net_co=
nf *old_net_conf
   drivers/block/drbd/drbd_nl.c:4006:22: sparse:     got struct net_conf [n=
oderef] __rcu *net_conf
>> drivers/block/drbd/drbd_nl.c:4165:30: sparse: sparse: incorrect type in =
assignment (different address spaces) @@     expected struct peer_device_co=
nf *old_peer_device_conf @@     got struct peer_device_conf [noderef] __rcu=
 *conf @@
   drivers/block/drbd/drbd_nl.c:4165:30: sparse:     expected struct peer_d=
evice_conf *old_peer_device_conf
   drivers/block/drbd/drbd_nl.c:4165:30: sparse:     got struct peer_device=
_conf [noderef] __rcu *conf
   drivers/block/drbd/drbd_nl.c:5354:31: sparse: sparse: incorrect type in =
assignment (different address spaces) @@     expected struct disk_conf *old=
_disk_conf @@     got struct disk_conf [noderef] __rcu *disk_conf @@
   drivers/block/drbd/drbd_nl.c:5354:31: sparse:     expected struct disk_c=
onf *old_disk_conf
   drivers/block/drbd/drbd_nl.c:5354:31: sparse:     got struct disk_conf [=
noderef] __rcu *disk_conf
>> drivers/block/drbd/drbd_nl.c:179:25: sparse: sparse: cannot size express=
ion
>> drivers/block/drbd/drbd_nl.c:2780:19: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const *objp @@  =
   got struct disk_conf [noderef] __rcu *disk_conf @@
   drivers/block/drbd/drbd_nl.c:2780:19: sparse:     expected void const *o=
bjp
   drivers/block/drbd/drbd_nl.c:2780:19: sparse:     got struct disk_conf [=
noderef] __rcu *disk_conf
>> drivers/block/drbd/drbd_nl.c:4261:27: sparse: sparse: incorrect type in =
assignment (different address spaces) @@     expected struct peer_device_co=
nf [noderef] __rcu *conf @@     got struct peer_device_conf *[assigned] con=
f @@
   drivers/block/drbd/drbd_nl.c:4261:27: sparse:     expected struct peer_d=
evice_conf [noderef] __rcu *conf
   drivers/block/drbd/drbd_nl.c:4261:27: sparse:     got struct peer_device=
_conf *[assigned] conf
>> drivers/block/drbd/drbd_nl.c:4376:26: sparse: sparse: incorrect type in =
assignment (different address spaces) @@     expected char const *tmp_name =
@@     got char [noderef] __rcu * @@
   drivers/block/drbd/drbd_nl.c:4376:26: sparse:     expected char const *t=
mp_name
   drivers/block/drbd/drbd_nl.c:4376:26: sparse:     got char [noderef] __r=
cu *
   drivers/block/drbd/drbd_nl.c:4521:22: sparse: sparse: incorrect type in =
assignment (different address spaces) @@     expected struct net_conf *old_=
net_conf @@     got struct net_conf [noderef] __rcu *net_conf @@
   drivers/block/drbd/drbd_nl.c:4521:22: sparse:     expected struct net_co=
nf *old_net_conf
   drivers/block/drbd/drbd_nl.c:4521:22: sparse:     got struct net_conf [n=
oderef] __rcu *net_conf
>> drivers/block/drbd/drbd_nl.c:5968:83: sparse: sparse: incorrect type in =
argument 3 (different address spaces) @@     expected char const *str @@   =
  got char [noderef] __rcu * @@
   drivers/block/drbd/drbd_nl.c:5968:83: sparse:     expected char const *s=
tr
   drivers/block/drbd/drbd_nl.c:5968:83: sparse:     got char [noderef] __r=
cu *
>> drivers/block/drbd/drbd_nl.c:6960:67: sparse: sparse: incorrect type in =
initializer (different address spaces) @@     expected char *name @@     go=
t char [noderef] __rcu * @@
   drivers/block/drbd/drbd_nl.c:6960:67: sparse:     expected char *name
   drivers/block/drbd/drbd_nl.c:6960:67: sparse:     got char [noderef] __r=
cu *
>> drivers/block/drbd/drbd_nl.c:985:32: sparse: sparse: dereference of node=
ref expression
   drivers/block/drbd/drbd_nl.c:3175:37: sparse: sparse: dereference of nod=
eref expression
   drivers/block/drbd/drbd_nl.c:3525:63: sparse: sparse: dereference of nod=
eref expression
   drivers/block/drbd/drbd_nl.c:3533:25: sparse: sparse: dereference of nod=
eref expression
   drivers/block/drbd/drbd_nl.c:3544:75: sparse: sparse: dereference of nod=
eref expression
   drivers/block/drbd/drbd_nl.c:3547:40: sparse: sparse: dereference of nod=
eref expression
   drivers/block/drbd/drbd_nl.c:4825:45: sparse: sparse: dereference of nod=
eref expression
--
   drivers/block/drbd/drbd_receiver.c:7392:23: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:7394:33: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:7399:45: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:7400:42: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:7402:34: sparse: sparse: cast to rest=
ricted __be64
   drivers/block/drbd/drbd_receiver.c:7564:48: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:7565:47: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:7567:55: sparse: sparse: cast to rest=
ricted __be64
   drivers/block/drbd/drbd_receiver.c:7568:57: sparse: sparse: cast to rest=
ricted __be64
   drivers/block/drbd/drbd_receiver.c:7573:60: sparse: sparse: cast to rest=
ricted __be64
   drivers/block/drbd/drbd_receiver.c:7574:60: sparse: sparse: cast to rest=
ricted __be16
   drivers/block/drbd/drbd_receiver.c:7577:33: sparse: sparse: cast to rest=
ricted __be64
   drivers/block/drbd/drbd_receiver.c:7578:59: sparse: sparse: cast to rest=
ricted __be64
   drivers/block/drbd/drbd_receiver.c:7614:40: sparse: sparse: cast to rest=
ricted __be64
   drivers/block/drbd/drbd_receiver.c:7666:17: sparse: sparse: cast to rest=
ricted __be64
   drivers/block/drbd/drbd_receiver.c:7666:17: sparse: sparse: cast to rest=
ricted __be64
   drivers/block/drbd/drbd_receiver.c:7666:17: sparse: sparse: cast to rest=
ricted __be64
   drivers/block/drbd/drbd_receiver.c:7666:17: sparse: sparse: cast to rest=
ricted __be64
>> drivers/block/drbd/drbd_receiver.c:1055:31: sparse: sparse: restricted _=
_be32 degrades to integer
>> drivers/block/drbd/drbd_receiver.c:1056:31: sparse: sparse: restricted _=
_be16 degrades to integer
   drivers/block/drbd/drbd_receiver.c:1067:28: sparse: sparse: restricted _=
_be32 degrades to integer
   drivers/block/drbd/drbd_receiver.c:1069:27: sparse: sparse: cast to rest=
ricted __be16
   drivers/block/drbd/drbd_receiver.c:1075:27: sparse: sparse: cast to rest=
ricted __be16
   drivers/block/drbd/drbd_receiver.c:1076:28: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:1079:34: sparse: sparse: restricted _=
_be16 degrades to integer
   drivers/block/drbd/drbd_receiver.c:1082:27: sparse: sparse: cast to rest=
ricted __be16
   drivers/block/drbd/drbd_receiver.c:1083:28: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:1087:35: sparse: sparse: restricted _=
_be32 degrades to integer
   drivers/block/drbd/drbd_receiver.c:1090:27: sparse: sparse: cast to rest=
ricted __be16
   drivers/block/drbd/drbd_receiver.c:1091:28: sparse: sparse: cast to rest=
ricted __be16
>> drivers/block/drbd/drbd_receiver.c:1334:21: sparse: sparse: incorrect ty=
pe in assignment (different base types) @@     expected unsigned int [usert=
ype] set_size @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_receiver.c:1334:21: sparse:     expected unsigne=
d int [usertype] set_size
   drivers/block/drbd/drbd_receiver.c:1334:21: sparse:     got restricted _=
_be32 [usertype]
   drivers/block/drbd/drbd_receiver.c:1376:21: sparse: sparse: incorrect ty=
pe in assignment (different base types) @@     expected unsigned int [usert=
ype] set_size @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_receiver.c:1376:21: sparse:     expected unsigne=
d int [usertype] set_size
   drivers/block/drbd/drbd_receiver.c:1376:21: sparse:     got restricted _=
_be32 [usertype]
   drivers/block/drbd/drbd_receiver.c:2025:21: sparse: sparse: cast to rest=
ricted __be64
   drivers/block/drbd/drbd_receiver.c:2027:23: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:2028:23: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:2030:42: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:2648:18: sparse: sparse: cast to rest=
ricted __be64
>> drivers/block/drbd/drbd_receiver.c:2688:20: sparse: sparse: incorrect ty=
pe in assignment (different base types) @@     expected unsigned int [usert=
ype] seq_num @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_receiver.c:2688:20: sparse:     expected unsigne=
d int [usertype] seq_num
   drivers/block/drbd/drbd_receiver.c:2688:20: sparse:     got restricted _=
_be32 [usertype]
>> drivers/block/drbd/drbd_receiver.c:2714:31: sparse: sparse: incorrect ty=
pe in argument 3 (different base types) @@     expected unsigned long long =
[usertype] sector @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_receiver.c:2714:31: sparse:     expected unsigne=
d long long [usertype] sector
   drivers/block/drbd/drbd_receiver.c:2714:31: sparse:     got restricted _=
_be64 [usertype]
>> drivers/block/drbd/drbd_receiver.c:2715:31: sparse: sparse: incorrect ty=
pe in argument 4 (different base types) @@     expected unsigned int [usert=
ype] blksize @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_receiver.c:2715:31: sparse:     expected unsigne=
d int [usertype] blksize
   drivers/block/drbd/drbd_receiver.c:2715:31: sparse:     got restricted _=
_be32 [usertype]
   drivers/block/drbd/drbd_receiver.c:2723:49: sparse: sparse: incorrect ty=
pe in argument 3 (different base types) @@     expected unsigned long long =
[usertype] sector @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_receiver.c:2723:49: sparse:     expected unsigne=
d long long [usertype] sector
   drivers/block/drbd/drbd_receiver.c:2723:49: sparse:     got restricted _=
_be64 [usertype]
   drivers/block/drbd/drbd_receiver.c:2723:70: sparse: sparse: incorrect ty=
pe in argument 4 (different base types) @@     expected unsigned int [usert=
ype] blksize @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_receiver.c:2723:70: sparse:     expected unsigne=
d int [usertype] blksize
   drivers/block/drbd/drbd_receiver.c:2723:70: sparse:     got restricted _=
_be32 [usertype]
   drivers/block/drbd/drbd_receiver.c:2736:31: sparse: sparse: incorrect ty=
pe in argument 3 (different base types) @@     expected unsigned long long =
[usertype] sector @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_receiver.c:2736:31: sparse:     expected unsigne=
d long long [usertype] sector
   drivers/block/drbd/drbd_receiver.c:2736:31: sparse:     got restricted _=
_be64 [usertype]
   drivers/block/drbd/drbd_receiver.c:2737:31: sparse: sparse: incorrect ty=
pe in argument 4 (different base types) @@     expected unsigned int [usert=
ype] blksize @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_receiver.c:2737:31: sparse:     expected unsigne=
d int [usertype] blksize
   drivers/block/drbd/drbd_receiver.c:2737:31: sparse:     got restricted _=
_be32 [usertype]
   drivers/block/drbd/drbd_receiver.c:2749:33: sparse: sparse: incorrect ty=
pe in argument 3 (different base types) @@     expected unsigned long long =
[usertype] sector @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_receiver.c:2749:33: sparse:     expected unsigne=
d long long [usertype] sector
   drivers/block/drbd/drbd_receiver.c:2749:33: sparse:     got restricted _=
_be64 [usertype]
   drivers/block/drbd/drbd_receiver.c:2750:33: sparse: sparse: incorrect ty=
pe in argument 4 (different base types) @@     expected unsigned int [usert=
ype] blksize @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_receiver.c:2750:33: sparse:     expected unsigne=
d int [usertype] blksize
   drivers/block/drbd/drbd_receiver.c:2750:33: sparse:     got restricted _=
_be32 [usertype]
>> drivers/block/drbd/drbd_receiver.c:2751:33: sparse: sparse: incorrect ty=
pe in argument 5 (different base types) @@     expected unsigned long long =
[usertype] block_id @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_receiver.c:2751:33: sparse:     expected unsigne=
d long long [usertype] block_id
   drivers/block/drbd/drbd_receiver.c:2751:33: sparse:     got restricted _=
_be64 [usertype]
>> drivers/block/drbd/drbd_receiver.c:2759:19: sparse: sparse: incorrect ty=
pe in assignment (different base types) @@     expected unsigned long long =
[usertype] sector @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_receiver.c:2759:19: sparse:     expected unsigne=
d long long [usertype] sector
   drivers/block/drbd/drbd_receiver.c:2759:19: sparse:     got restricted _=
_be64 [usertype]
>> drivers/block/drbd/drbd_receiver.c:2761:20: sparse: sparse: incorrect ty=
pe in assignment (different base types) @@     expected unsigned int [usert=
ype] blksize @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_receiver.c:2761:20: sparse:     expected unsigne=
d int [usertype] blksize
   drivers/block/drbd/drbd_receiver.c:2761:20: sparse:     got restricted _=
_be32 [usertype]
   drivers/block/drbd/drbd_receiver.c:2762:20: sparse: sparse: incorrect ty=
pe in assignment (different base types) @@     expected unsigned int [usert=
ype] seq_num @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_receiver.c:2762:20: sparse:     expected unsigne=
d int [usertype] seq_num
   drivers/block/drbd/drbd_receiver.c:2762:20: sparse:     got restricted _=
_be32 [usertype]
>> drivers/block/drbd/drbd_receiver.c:2763:19: sparse: sparse: incorrect ty=
pe in assignment (different base types) @@     expected unsigned int [usert=
ype] result @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_receiver.c:2763:19: sparse:     expected unsigne=
d int [usertype] result
   drivers/block/drbd/drbd_receiver.c:2763:19: sparse:     got restricted _=
_be32 [usertype]
   drivers/block/drbd/drbd_receiver.c:3735:27: sparse: sparse: cast to rest=
ricted __be64
   drivers/block/drbd/drbd_receiver.c:3738:20: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:4024:25: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:4024:64: sparse: sparse: cast to rest=
ricted __be64
   drivers/block/drbd/drbd_receiver.c:4033:27: sparse: sparse: cast to rest=
ricted __be64
   drivers/block/drbd/drbd_receiver.c:4035:20: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:4108:25: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:4108:64: sparse: sparse: cast to rest=
ricted __be64
   drivers/block/drbd/drbd_receiver.c:4132:38: sparse: sparse: cast to rest=
ricted __be64
   drivers/block/drbd/drbd_receiver.c:4155:30: sparse: sparse: cast to rest=
ricted __be64
   drivers/block/drbd/drbd_receiver.c:4156:31: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:5397:27: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:5398:27: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:5399:27: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:5400:27: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:5401:27: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:5402:27: sparse: sparse: cast to rest=
ricted __be32
>> drivers/block/drbd/drbd_receiver.c:5500:22: sparse: sparse: incorrect ty=
pe in assignment (different address spaces) @@     expected struct net_conf=
 *old_net_conf @@     got struct net_conf [noderef] __rcu *net_conf @@
   drivers/block/drbd/drbd_receiver.c:5500:22: sparse:     expected struct =
net_conf *old_net_conf
   drivers/block/drbd/drbd_receiver.c:5500:22: sparse:     got struct net_c=
onf [noderef] __rcu *net_conf
   drivers/block/drbd/drbd_receiver.c:5619:22: sparse: sparse: incorrect ty=
pe in assignment (different address spaces) @@     expected struct net_conf=
 *old_net_conf @@     got struct net_conf [noderef] __rcu *net_conf @@
   drivers/block/drbd/drbd_receiver.c:5619:22: sparse:     expected struct =
net_conf *old_net_conf
   drivers/block/drbd/drbd_receiver.c:5619:22: sparse:     got struct net_c=
onf [noderef] __rcu *net_conf
   drivers/block/drbd/drbd_receiver.c:5860:18: sparse: sparse: cast to rest=
ricted __be64
   drivers/block/drbd/drbd_receiver.c:5861:19: sparse: sparse: cast to rest=
ricted __be64
   drivers/block/drbd/drbd_receiver.c:5862:19: sparse: sparse: cast to rest=
ricted __be64
   drivers/block/drbd/drbd_receiver.c:5891:46: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:5893:16: sparse: sparse: cast to rest=
ricted __be16
>> drivers/block/drbd/drbd_receiver.c:5958:39: sparse: sparse: incorrect ty=
pe in assignment (different address spaces) @@     expected struct disk_con=
f *old_disk_conf @@     got struct disk_conf [noderef] __rcu *disk_conf @@
   drivers/block/drbd/drbd_receiver.c:5958:39: sparse:     expected struct =
disk_conf *old_disk_conf
   drivers/block/drbd/drbd_receiver.c:5958:39: sparse:     got struct disk_=
conf [noderef] __rcu *disk_conf
   drivers/block/drbd/drbd_receiver.c:5974:61: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:5975:60: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:5976:58: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:5977:48: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:5978:48: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:6086:47: sparse: sparse: cast to rest=
ricted __be16
   drivers/block/drbd/drbd_receiver.c:6357:37: sparse: sparse: cast to rest=
ricted __be64
   drivers/block/drbd/drbd_receiver.c:6358:46: sparse: sparse: cast to rest=
ricted __be64
   drivers/block/drbd/drbd_receiver.c:6360:49: sparse: sparse: cast to rest=
ricted __be64
   drivers/block/drbd/drbd_receiver.c:6363:35: sparse: sparse: cast to rest=
ricted __be64
   drivers/block/drbd/drbd_receiver.c:6364:35: sparse: sparse: cast to rest=
ricted __be64
   drivers/block/drbd/drbd_receiver.c:6386:29: sparse: sparse: cast to rest=
ricted __be64
   drivers/block/drbd/drbd_receiver.c:6421:45: sparse: sparse: cast to rest=
ricted __be64
   drivers/block/drbd/drbd_receiver.c:6423:35: sparse: sparse: cast to rest=
ricted __be64
   drivers/block/drbd/drbd_receiver.c:6424:35: sparse: sparse: cast to rest=
ricted __be64
   drivers/block/drbd/drbd_receiver.c:6435:39: sparse: sparse: cast to rest=
ricted __be64
   drivers/block/drbd/drbd_receiver.c:6448:49: sparse: sparse: cast to rest=
ricted __be64
   drivers/block/drbd/drbd_receiver.c:6457:21: sparse: sparse: cast to rest=
ricted __be64
   drivers/block/drbd/drbd_receiver.c:6848:32: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:6849:31: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:7195:21: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:7200:43: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:7201:40: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:7280:31: sparse: sparse: incorrect ty=
pe in assignment (different address spaces) @@     expected struct disk_con=
f *old_disk_conf @@     got struct disk_conf [noderef] __rcu *disk_conf @@
   drivers/block/drbd/drbd_receiver.c:7280:31: sparse:     expected struct =
disk_conf *old_disk_conf
   drivers/block/drbd/drbd_receiver.c:7280:31: sparse:     got struct disk_=
conf [noderef] __rcu *disk_conf
   drivers/block/drbd/drbd_receiver.c:7955:24: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:8344:48: sparse: sparse: cast to rest=
ricted __be64
   drivers/block/drbd/drbd_receiver.c:8760:18: sparse: sparse: cast to rest=
ricted __be64
   drivers/block/drbd/drbd_receiver.c:8771:9: sparse: sparse: cast to restr=
icted __be32
   drivers/block/drbd/drbd_receiver.c:8780:43: sparse: sparse: cast to rest=
ricted __be64
   drivers/block/drbd/drbd_receiver.c:8821:62: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:8874:78: sparse: sparse: cast to rest=
ricted __be64
   drivers/block/drbd/drbd_receiver.c:8893:74: sparse: sparse: cast to rest=
ricted __be64
   drivers/block/drbd/drbd_receiver.c:8894:73: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:8974:24: sparse: sparse: cast to rest=
ricted __be64
   drivers/block/drbd/drbd_receiver.c:8975:22: sparse: sparse: cast to rest=
ricted __be64
   drivers/block/drbd/drbd_receiver.c:9201:26: sparse: sparse: cast to rest=
ricted __be64
   drivers/block/drbd/drbd_receiver.c:9202:24: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:9207:26: sparse: sparse: cast to rest=
ricted __be64
   drivers/block/drbd/drbd_receiver.c:9208:24: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:9940:25: sparse: sparse: incorrect ty=
pe in assignment (different base types) @@     expected unsigned int [usert=
ype] protocol_min @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_receiver.c:9940:25: sparse:     expected unsigne=
d int [usertype] protocol_min
   drivers/block/drbd/drbd_receiver.c:9940:25: sparse:     got restricted _=
_be32 [usertype]
   drivers/block/drbd/drbd_receiver.c:9941:25: sparse: sparse: incorrect ty=
pe in assignment (different base types) @@     expected unsigned int [usert=
ype] protocol_max @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_receiver.c:9941:25: sparse:     expected unsigne=
d int [usertype] protocol_max
   drivers/block/drbd/drbd_receiver.c:9941:25: sparse:     got restricted _=
_be32 [usertype]
>> drivers/block/drbd/drbd_receiver.c:9942:27: sparse: sparse: incorrect ty=
pe in assignment (different base types) @@     expected unsigned int [usert=
ype] sender_node_id @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_receiver.c:9942:27: sparse:     expected unsigne=
d int [usertype] sender_node_id
   drivers/block/drbd/drbd_receiver.c:9942:27: sparse:     got restricted _=
_be32 [usertype]
>> drivers/block/drbd/drbd_receiver.c:9943:29: sparse: sparse: incorrect ty=
pe in assignment (different base types) @@     expected unsigned int [usert=
ype] receiver_node_id @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_receiver.c:9943:29: sparse:     expected unsigne=
d int [usertype] receiver_node_id
   drivers/block/drbd/drbd_receiver.c:9943:29: sparse:     got restricted _=
_be32 [usertype]
   drivers/block/drbd/drbd_receiver.c:9944:26: sparse: sparse: incorrect ty=
pe in assignment (different base types) @@     expected unsigned int [usert=
ype] feature_flags @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_receiver.c:9944:26: sparse:     expected unsigne=
d int [usertype] feature_flags
   drivers/block/drbd/drbd_receiver.c:9944:26: sparse:     got restricted _=
_be32 [usertype]
   drivers/block/drbd/drbd_receiver.c:9991:27: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:9992:27: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:10017:54: sparse: sparse: cast to res=
tricted __be32
   drivers/block/drbd/drbd_receiver.c:10040:21: sparse: sparse: cast to res=
tricted __be32
   drivers/block/drbd/drbd_receiver.c:10041:25: sparse: sparse: cast to res=
tricted __be32
   drivers/block/drbd/drbd_receiver.c:10041:25: sparse: sparse: cast to res=
tricted __be32
   drivers/block/drbd/drbd_receiver.c:10041:25: sparse: sparse: cast to res=
tricted __be32
   drivers/block/drbd/drbd_receiver.c:10041:25: sparse: sparse: cast to res=
tricted __be32
   drivers/block/drbd/drbd_receiver.c:10045:21: sparse: sparse: cast to res=
tricted __be32
   drivers/block/drbd/drbd_receiver.c:10046:25: sparse: sparse: cast to res=
tricted __be32
   drivers/block/drbd/drbd_receiver.c:10046:25: sparse: sparse: cast to res=
tricted __be32
   drivers/block/drbd/drbd_receiver.c:10046:25: sparse: sparse: cast to res=
tricted __be32
   drivers/block/drbd/drbd_receiver.c:10046:25: sparse: sparse: cast to res=
tricted __be32
>> drivers/block/drbd/drbd_receiver.c:10186:29: sparse: sparse: incorrect t=
ype in assignment (different base types) @@     expected unsigned int [user=
type] i @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_receiver.c:10186:29: sparse:     expected unsign=
ed int [usertype] i
   drivers/block/drbd/drbd_receiver.c:10186:29: sparse:     got restricted =
__be32 [usertype]
>> drivers/block/drbd/drbd_receiver.c:10235:32: sparse: sparse: incorrect t=
ype in assignment (different base types) @@     expected unsigned int [addr=
essable] [usertype] i @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_receiver.c:10235:32: sparse:     expected unsign=
ed int [addressable] [usertype] i
   drivers/block/drbd/drbd_receiver.c:10235:32: sparse:     got restricted =
__be32 [usertype]
   drivers/block/drbd/drbd_receiver.c:10392:26: sparse: sparse: cast to res=
tricted __be64
   drivers/block/drbd/drbd_receiver.c:10393:24: sparse: sparse: cast to res=
tricted __be32
   drivers/block/drbd/drbd_receiver.c:10394:56: sparse: sparse: cast to res=
tricted __be64
   drivers/block/drbd/drbd_receiver.c:10414:23: sparse: sparse: cast to res=
tricted __be32
   drivers/block/drbd/drbd_receiver.c:10435:56: sparse: sparse: cast to res=
tricted __be32
   drivers/block/drbd/drbd_receiver.c:10436:42: sparse: sparse: cast to res=
tricted __be32
   drivers/block/drbd/drbd_receiver.c:10446:43: sparse: sparse: cast to res=
tricted __be64
   drivers/block/drbd/drbd_receiver.c:10461:41: sparse: sparse: cast to res=
tricted __be64
   drivers/block/drbd/drbd_receiver.c:10463:41: sparse: sparse: cast to res=
tricted __be64
   drivers/block/drbd/drbd_receiver.c:10468:41: sparse: sparse: cast to res=
tricted __be64
   drivers/block/drbd/drbd_receiver.c:10469:44: sparse: sparse: cast to res=
tricted __be64
   drivers/block/drbd/drbd_receiver.c:10488:17: sparse: sparse: cast to res=
tricted __be32
   drivers/block/drbd/drbd_receiver.c:10488:17: sparse: sparse: cast to res=
tricted __be32
   drivers/block/drbd/drbd_receiver.c:10488:17: sparse: sparse: cast to res=
tricted __be32
   drivers/block/drbd/drbd_receiver.c:10488:17: sparse: sparse: cast to res=
tricted __be32
   drivers/block/drbd/drbd_receiver.c:10533:27: sparse: sparse: cast to res=
tricted __be64
   drivers/block/drbd/drbd_receiver.c:10534:23: sparse: sparse: cast to res=
tricted __be32
   drivers/block/drbd/drbd_receiver.c:10543:38: sparse: sparse: cast to res=
tricted __be32
   drivers/block/drbd/drbd_receiver.c:10597:27: sparse: sparse: cast to res=
tricted __be64
   drivers/block/drbd/drbd_receiver.c:10604:38: sparse: sparse: cast to res=
tricted __be32
   drivers/block/drbd/drbd_receiver.c:10632:27: sparse: sparse: cast to res=
tricted __be64
   drivers/block/drbd/drbd_receiver.c:10633:20: sparse: sparse: cast to res=
tricted __be32
   drivers/block/drbd/drbd_receiver.c:10647:38: sparse: sparse: cast to res=
tricted __be32
   drivers/block/drbd/drbd_receiver.c:10684:27: sparse: sparse: cast to res=
tricted __be64
   drivers/block/drbd/drbd_receiver.c:10685:20: sparse: sparse: cast to res=
tricted __be32
   drivers/block/drbd/drbd_receiver.c:10696:38: sparse: sparse: cast to res=
tricted __be32
   drivers/block/drbd/drbd_receiver.c:10718:27: sparse: sparse: cast to res=
tricted __be64
   drivers/block/drbd/drbd_receiver.c:10724:38: sparse: sparse: cast to res=
tricted __be32
   drivers/block/drbd/drbd_receiver.c:10726:9: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:10726:9: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:10726:9: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:10726:9: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:10773:18: sparse: sparse: cast to res=
tricted __be64
   drivers/block/drbd/drbd_receiver.c:10774:16: sparse: sparse: cast to res=
tricted __be32
   drivers/block/drbd/drbd_receiver.c:10779:38: sparse: sparse: cast to res=
tricted __be32
   drivers/block/drbd/drbd_receiver.c:10800:57: sparse: sparse: cast to res=
tricted __be32
   drivers/block/drbd/drbd_receiver.c:10808:27: sparse: sparse: cast to res=
tricted __be32
   drivers/block/drbd/drbd_receiver.c:10830:26: sparse: sparse: cast to res=
tricted __be64
   drivers/block/drbd/drbd_receiver.c:10831:24: sparse: sparse: cast to res=
tricted __be32
   drivers/block/drbd/drbd_receiver.c:10833:27: sparse: sparse: cast to res=
tricted __be32
   drivers/block/drbd/drbd_receiver.c:10834:53: sparse: sparse: cast to res=
tricted __be64
   drivers/block/drbd/drbd_receiver.c:10838:26: sparse: sparse: cast to res=
tricted __be64
   drivers/block/drbd/drbd_receiver.c:10839:24: sparse: sparse: cast to res=
tricted __be32
   drivers/block/drbd/drbd_receiver.c:10841:27: sparse: sparse: cast to res=
tricted __be32
   drivers/block/drbd/drbd_receiver.c:10842:26: sparse: sparse: cast to res=
tricted __be32
   drivers/block/drbd/drbd_receiver.c:11034:18: sparse: sparse: cast to res=
tricted __be64
   drivers/block/drbd/drbd_receiver.c:11035:19: sparse: sparse: cast to res=
tricted __be64
   drivers/block/drbd/drbd_receiver.c:11179:30: sparse: sparse: cast to res=
tricted __be64
   drivers/block/drbd/drbd_receiver.c:11180:33: sparse: sparse: cast to res=
tricted __be32
>> drivers/block/drbd/drbd_receiver.c:7276:37: sparse: sparse: dereference =
of noderef expression
   drivers/block/drbd/drbd_receiver.c: note: in included file:
   drivers/block/drbd/drbd_vli.h:305:23: sparse: sparse: cast to restricted=
 __le64
   drivers/block/drbd/drbd_vli.h:305:23: sparse: sparse: cast to restricted=
 __le64
--
>> drivers/block/drbd/drbd_transport.c:346:21: sparse: sparse: incorrect ty=
pe in assignment (different address spaces) @@     expected struct list_hea=
d *[addressable] pos @@     got struct list_head [noderef] __rcu * @@
   drivers/block/drbd/drbd_transport.c:346:21: sparse:     expected struct =
list_head *[addressable] pos
   drivers/block/drbd/drbd_transport.c:346:21: sparse:     got struct list_=
head [noderef] __rcu *
--
>> drivers/block/drbd/drbd_legacy_84.c:97:30: sparse: sparse: cast to restr=
icted __be64
   drivers/block/drbd/drbd_legacy_84.c:98:28: sparse: sparse: cast to restr=
icted __be64
   drivers/block/drbd/drbd_legacy_84.c:100:27: sparse: sparse: cast to rest=
ricted __be64
>> drivers/block/drbd/drbd_legacy_84.c:101:28: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_legacy_84.c:102:25: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_legacy_84.c:104:25: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_legacy_84.c:106:25: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_legacy_84.c:110:29: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_legacy_84.c:112:26: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_legacy_84.c:113:33: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_legacy_84.c:125:32: sparse: sparse: cast to rest=
ricted __be64
   drivers/block/drbd/drbd_legacy_84.c:134:59: sparse: sparse: cast to rest=
ricted __be64
>> drivers/block/drbd/drbd_legacy_84.c:150:30: sparse: sparse: incorrect ty=
pe in assignment (different base types) @@     expected unsigned long long =
[usertype] la_size_sect @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_legacy_84.c:150:30: sparse:     expected unsigne=
d long long [usertype] la_size_sect
   drivers/block/drbd/drbd_legacy_84.c:150:30: sparse:     got restricted _=
_be64 [usertype]
>> drivers/block/drbd/drbd_legacy_84.c:151:29: sparse: sparse: incorrect ty=
pe in assignment (different base types) @@     expected unsigned long long =
[usertype] device_uuid @@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_legacy_84.c:151:29: sparse:     expected unsigne=
d long long [usertype] device_uuid
   drivers/block/drbd/drbd_legacy_84.c:151:29: sparse:     got restricted _=
_be64 [usertype]
>> drivers/block/drbd/drbd_legacy_84.c:152:34: sparse: sparse: incorrect ty=
pe in assignment (different base types) @@     expected unsigned long long =
@@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_legacy_84.c:152:34: sparse:     expected unsigne=
d long long
   drivers/block/drbd/drbd_legacy_84.c:152:34: sparse:     got restricted _=
_be64 [usertype]
   drivers/block/drbd/drbd_legacy_84.c:153:33: sparse: sparse: incorrect ty=
pe in assignment (different base types) @@     expected unsigned long long =
@@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_legacy_84.c:153:33: sparse:     expected unsigne=
d long long
   drivers/block/drbd/drbd_legacy_84.c:153:33: sparse:     got restricted _=
_be64 [usertype]
   drivers/block/drbd/drbd_legacy_84.c:155:33: sparse: sparse: incorrect ty=
pe in assignment (different base types) @@     expected unsigned long long =
@@     got restricted __be64 [usertype] @@
   drivers/block/drbd/drbd_legacy_84.c:155:33: sparse:     expected unsigne=
d long long
   drivers/block/drbd/drbd_legacy_84.c:155:33: sparse:     got restricted _=
_be64 [usertype]
>> drivers/block/drbd/drbd_legacy_84.c:157:23: sparse: sparse: incorrect ty=
pe in assignment (different base types) @@     expected unsigned int [usert=
ype] flags @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_legacy_84.c:157:23: sparse:     expected unsigne=
d int [usertype] flags
   drivers/block/drbd/drbd_legacy_84.c:157:23: sparse:     got restricted _=
_be32 [usertype]
>> drivers/block/drbd/drbd_legacy_84.c:158:23: sparse: sparse: incorrect ty=
pe in assignment (different base types) @@     expected unsigned int [usert=
ype] magic @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_legacy_84.c:158:23: sparse:     expected unsigne=
d int [usertype] magic
   drivers/block/drbd/drbd_legacy_84.c:158:23: sparse:     got restricted _=
_be32 [usertype]
>> drivers/block/drbd/drbd_legacy_84.c:159:30: sparse: sparse: incorrect ty=
pe in assignment (different base types) @@     expected unsigned int [usert=
ype] md_size_sect @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_legacy_84.c:159:30: sparse:     expected unsigne=
d int [usertype] md_size_sect
   drivers/block/drbd/drbd_legacy_84.c:159:30: sparse:     got restricted _=
_be32 [usertype]
>> drivers/block/drbd/drbd_legacy_84.c:160:27: sparse: sparse: incorrect ty=
pe in assignment (different base types) @@     expected unsigned int [usert=
ype] al_offset @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_legacy_84.c:160:27: sparse:     expected unsigne=
d int [usertype] al_offset
   drivers/block/drbd/drbd_legacy_84.c:160:27: sparse:     got restricted _=
_be32 [usertype]
>> drivers/block/drbd/drbd_legacy_84.c:161:31: sparse: sparse: incorrect ty=
pe in assignment (different base types) @@     expected unsigned int [usert=
ype] al_nr_extents @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_legacy_84.c:161:31: sparse:     expected unsigne=
d int [usertype] al_nr_extents
   drivers/block/drbd/drbd_legacy_84.c:161:31: sparse:     got restricted _=
_be32 [usertype]
>> drivers/block/drbd/drbd_legacy_84.c:162:27: sparse: sparse: incorrect ty=
pe in assignment (different base types) @@     expected unsigned int [usert=
ype] bm_offset @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_legacy_84.c:162:27: sparse:     expected unsigne=
d int [usertype] bm_offset
   drivers/block/drbd/drbd_legacy_84.c:162:27: sparse:     got restricted _=
_be32 [usertype]
>> drivers/block/drbd/drbd_legacy_84.c:163:34: sparse: sparse: incorrect ty=
pe in assignment (different base types) @@     expected unsigned int [usert=
ype] bm_bytes_per_bit @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_legacy_84.c:163:34: sparse:     expected unsigne=
d int [usertype] bm_bytes_per_bit
   drivers/block/drbd/drbd_legacy_84.c:163:34: sparse:     got restricted _=
_be32 [usertype]
>> drivers/block/drbd/drbd_legacy_84.c:164:38: sparse: sparse: incorrect ty=
pe in assignment (different base types) @@     expected unsigned int [usert=
ype] la_peer_max_bio_size @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_legacy_84.c:164:38: sparse:     expected unsigne=
d int [usertype] la_peer_max_bio_size
   drivers/block/drbd/drbd_legacy_84.c:164:38: sparse:     got restricted _=
_be32 [usertype]
>> drivers/block/drbd/drbd_legacy_84.c:166:28: sparse: sparse: incorrect ty=
pe in assignment (different base types) @@     expected unsigned int [usert=
ype] al_stripes @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_legacy_84.c:166:28: sparse:     expected unsigne=
d int [usertype] al_stripes
   drivers/block/drbd/drbd_legacy_84.c:166:28: sparse:     got restricted _=
_be32 [usertype]
>> drivers/block/drbd/drbd_legacy_84.c:167:35: sparse: sparse: incorrect ty=
pe in assignment (different base types) @@     expected unsigned int [usert=
ype] al_stripe_size_4k @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_legacy_84.c:167:35: sparse:     expected unsigne=
d int [usertype] al_stripe_size_4k
   drivers/block/drbd/drbd_legacy_84.c:167:35: sparse:     got restricted _=
_be32 [usertype]
--
>> drivers/block/drbd/drbd_transport_tcp.c:610:17: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned int [u=
sertype] magic @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_transport_tcp.c:610:17: sparse:     expected uns=
igned int [usertype] magic
   drivers/block/drbd/drbd_transport_tcp.c:610:17: sparse:     got restrict=
ed __be32 [usertype]
>> drivers/block/drbd/drbd_transport_tcp.c:611:19: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned short =
[usertype] command @@     got restricted __be16 [usertype] @@
   drivers/block/drbd/drbd_transport_tcp.c:611:19: sparse:     expected uns=
igned short [usertype] command
   drivers/block/drbd/drbd_transport_tcp.c:611:19: sparse:     got restrict=
ed __be16 [usertype]
>> drivers/block/drbd/drbd_transport_tcp.c:850:25: sparse: sparse: restrict=
ed __be32 degrades to integer
>> drivers/block/drbd/drbd_transport_tcp.c:851:17: sparse: sparse: cast to =
restricted __be32
>> drivers/block/drbd/drbd_transport_tcp.c:855:16: sparse: sparse: cast to =
restricted __be16
--
>> drivers/block/drbd/drbd_transport_lb-tcp.c:1690:33: sparse: sparse: inco=
rrect type in assignment (different base types) @@     expected unsigned in=
t [usertype] sequence @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_transport_lb-tcp.c:1690:33: sparse:     expected=
 unsigned int [usertype] sequence
   drivers/block/drbd/drbd_transport_lb-tcp.c:1690:33: sparse:     got rest=
ricted __be32 [usertype]
>> drivers/block/drbd/drbd_transport_lb-tcp.c:1691:30: sparse: sparse: inco=
rrect type in assignment (different base types) @@     expected unsigned in=
t [usertype] bytes @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_transport_lb-tcp.c:1691:30: sparse:     expected=
 unsigned int [usertype] bytes
   drivers/block/drbd/drbd_transport_lb-tcp.c:1691:30: sparse:     got rest=
ricted __be32 [usertype]
   drivers/block/drbd/drbd_transport_lb-tcp.c:1773:41: sparse: sparse: inco=
rrect type in assignment (different base types) @@     expected unsigned in=
t [usertype] sequence @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_transport_lb-tcp.c:1773:41: sparse:     expected=
 unsigned int [usertype] sequence
   drivers/block/drbd/drbd_transport_lb-tcp.c:1773:41: sparse:     got rest=
ricted __be32 [usertype]
   drivers/block/drbd/drbd_transport_lb-tcp.c:1774:38: sparse: sparse: inco=
rrect type in assignment (different base types) @@     expected unsigned in=
t [usertype] bytes @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_transport_lb-tcp.c:1774:38: sparse:     expected=
 unsigned int [usertype] bytes
   drivers/block/drbd/drbd_transport_lb-tcp.c:1774:38: sparse:     got rest=
ricted __be32 [usertype]
>> drivers/block/drbd/drbd_transport_lb-tcp.c:400:40: sparse: sparse: cast =
to restricted __be32
   drivers/block/drbd/drbd_transport_lb-tcp.c:401:37: sparse: sparse: cast =
to restricted __be32
>> drivers/block/drbd/drbd_transport_lb-tcp.c:677:67: sparse: sparse: incor=
rect type in initializer (different base types) @@     expected unsigned in=
t [usertype] bytes @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_transport_lb-tcp.c:677:67: sparse:     expected =
unsigned int [usertype] bytes
   drivers/block/drbd/drbd_transport_lb-tcp.c:677:67: sparse:     got restr=
icted __be32 [usertype]
>> drivers/block/drbd/drbd_transport_lb-tcp.c:684:17: sparse: sparse: incor=
rect type in assignment (different base types) @@     expected unsigned int=
 [usertype] magic @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_transport_lb-tcp.c:684:17: sparse:     expected =
unsigned int [usertype] magic
   drivers/block/drbd/drbd_transport_lb-tcp.c:684:17: sparse:     got restr=
icted __be32 [usertype]
>> drivers/block/drbd/drbd_transport_lb-tcp.c:685:19: sparse: sparse: incor=
rect type in assignment (different base types) @@     expected unsigned sho=
rt [usertype] command @@     got restricted __be16 [usertype] @@
   drivers/block/drbd/drbd_transport_lb-tcp.c:685:19: sparse:     expected =
unsigned short [usertype] command
   drivers/block/drbd/drbd_transport_lb-tcp.c:685:19: sparse:     got restr=
icted __be16 [usertype]
>> drivers/block/drbd/drbd_transport_lb-tcp.c:721:13: sparse: sparse: incom=
patible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_transport_lb-tcp.c:721:13: sparse:    struct soc=
ket [noderef] __rcu *
   drivers/block/drbd/drbd_transport_lb-tcp.c:721:13: sparse:    struct soc=
ket *
>> drivers/block/drbd/drbd_transport_lb-tcp.c:851:29: sparse: sparse: restr=
icted __be32 degrades to integer
   drivers/block/drbd/drbd_transport_lb-tcp.c:852:17: sparse: sparse: cast =
to restricted __be32
>> drivers/block/drbd/drbd_transport_lb-tcp.c:856:16: sparse: sparse: cast =
to restricted __be16
   drivers/block/drbd/drbd_transport_lb-tcp.c:937:55: sparse: sparse: cast =
to restricted __be32
   drivers/block/drbd/drbd_transport_lb-tcp.c:938:52: sparse: sparse: cast =
to restricted __be32

vim +607 drivers/block/drbd/drbd_bitmap.c

21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  497 =20
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  498 =20
b411b3637fa71f Philipp Reisner      2009-09-25  499  /*
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  500   * find_next_bit(=
) and find_next_zero_bit() expect an (unsigned long *),
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  501   * and will deref=
erence it.
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  502   * When scanning =
our bitmap, we are interested in 32bit words of it.
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  503   * The "current 3=
2 bit word pointer" may point to the last 32 bits in a page.
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  504   * For 64bit long=
, if the page after the current page is not mapped,
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  505   * this causes "p=
age fault - not-present page".
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  506   * Duplicate the =
"fast path" of these functions,
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  507   * simplified for=
 "size: 32, offset: 0".
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  508   * Little endian =
arch: le32_to_cpu is a no-op.
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  509   * Big endian arc=
h: le32_to_cpu moves the least significant 32 bits around.
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  510   * __ffs / ffz do=
 an implicit cast to (unsignd long). On 64bit, that fills up
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  511   * the most signi=
ficant bits with 0; we are not interested in those anyways.
b411b3637fa71f Philipp Reisner      2009-09-25  512   */
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  513  static inline uns=
igned long find_next_bit_le32(const __le32 *addr)
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  514  {
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16 @515  	uint32_t val =3D =
*addr;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  516 =20
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16 @517  	return val ? __f=
fs(le32_to_cpu(val)) : 32;
b411b3637fa71f Philipp Reisner      2009-09-25  518  }
b411b3637fa71f Philipp Reisner      2009-09-25  519 =20
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  520  static inline uns=
igned long find_next_zero_bit_le32(const __le32 *addr)
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  521  {
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  522  	uint32_t val =3D =
*addr;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  523 =20
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  524  	return val =3D=
=3D ~0U ? 32 : ffz(le32_to_cpu(val));
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  525  }
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  526 =20
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  527 =20
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  528  static __always_i=
nline unsigned long
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  529  ____bm_op(struct =
drbd_device *device, unsigned int bitmap_index, unsigned long start, unsign=
ed long end,
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  530  	 enum bitmap_ope=
rations op, __le32 *buffer)
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  531  {
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  532  	struct drbd_bitm=
ap *bitmap =3D device->bitmap;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  533  	unsigned int wor=
d32_skip =3D 32 * bitmap->bm_max_peers;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  534  	unsigned long to=
tal =3D 0;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  535  	unsigned long wo=
rd;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  536  	unsigned int pag=
e, bit_in_page;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  537 =20
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  538  	if (end >=3D bit=
map->bm_bits)
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  539  		end =3D bitmap-=
>bm_bits - 1;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  540 =20
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  541  	word =3D interle=
aved_word32(bitmap, bitmap_index, start);
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  542  	page =3D word32_=
to_page(word);
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  543  	bit_in_page =3D =
(word32_in_page(word) << 5) | (start & 31);
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  544 =20
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  545  	for (; start <=
=3D end; page++) {
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  546  		unsigned int co=
unt =3D 0;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  547  		void *addr;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  548 =20
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  549  		addr =3D bm_map=
(bitmap, page);
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  550  		if (((start & 3=
1) && (start | 31) <=3D end) || op =3D=3D BM_OP_TEST) {
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  551  			unsigned int l=
ast =3D bit_in_page | 31;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  552 =20
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  553  			switch (op) {
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  554  			default:
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  555  				do {
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  556  					switch (op) {
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  557  					case BM_OP_C=
LEAR:
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  558  						if (__test_=
and_clear_bit_le(bit_in_page, addr))
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  559  							count++;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  560  						break;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  561  					case BM_OP_S=
ET:
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  562  						if (!__test=
_and_set_bit_le(bit_in_page, addr))
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  563  							count++;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  564  						break;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  565  					case BM_OP_C=
OUNT:
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  566  						if (test_bi=
t_le(bit_in_page, addr))
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  567  							total++;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  568  						break;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  569  					case BM_OP_T=
EST:
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  570  						total =3D !=
!test_bit_le(bit_in_page, addr);
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  571  						bm_unmap(bi=
tmap, addr);
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  572  						return tota=
l;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  573  					default:
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  574  						break;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  575  					}
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  576  					bit_in_page+=
+;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  577  				} while (bit_=
in_page <=3D last);
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  578  				break;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  579  			case BM_OP_MER=
GE:
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  580  			case BM_OP_EXT=
RACT:
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  581  				BUG();
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  582  				break;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  583  			case BM_OP_FIN=
D_BIT:
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  584  				count =3D fin=
d_next_bit_le(addr, last + 1, bit_in_page);
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  585  				if (count < l=
ast + 1)
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  586  					goto found;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  587  				bit_in_page =
=3D last + 1;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  588  				break;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  589  			case BM_OP_FIN=
D_ZERO_BIT:
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  590  				count =3D fin=
d_next_zero_bit_le(addr, last + 1, bit_in_page);
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  591  				if (count < l=
ast + 1)
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  592  					goto found;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  593  				bit_in_page =
=3D last + 1;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  594  				break;
b411b3637fa71f Philipp Reisner      2009-09-25  595  			}
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  596  			start =3D (sta=
rt | 31) + 1;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  597  			bit_in_page +=
=3D word32_skip - 32;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  598  			if (bit_in_pag=
e >=3D BITS_PER_PAGE)
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  599  				goto next_pag=
e;
b411b3637fa71f Philipp Reisner      2009-09-25  600  		}
b411b3637fa71f Philipp Reisner      2009-09-25  601 =20
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  602  		while (start + =
31 <=3D end) {
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  603  			__le32 *p =3D =
(__le32 *)addr + (bit_in_page >> 5);
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  604 =20
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  605  			switch (op) {
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  606  			case BM_OP_CLE=
AR:
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16 @607  				count +=3D hw=
eight32(*p);
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  608  				*p =3D 0;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  609  				break;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  610  			case BM_OP_SET:
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16 @611  				count +=3D hw=
eight32(~*p);
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16 @612  				*p =3D -1;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  613  				break;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  614  			case BM_OP_TES=
T:
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  615  				BUG();
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  616  				break;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  617  			case BM_OP_COU=
NT:
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  618  				total +=3D hw=
eight32(*p);
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  619  				break;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  620  			case BM_OP_MER=
GE:
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  621  				count +=3D hw=
eight32(~*p & *buffer);
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  622  				*p |=3D *buff=
er++;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  623  				break;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  624  			case BM_OP_EXT=
RACT:
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  625  				*buffer++ =3D =
*p;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  626  				break;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  627  			case BM_OP_FIN=
D_BIT:
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  628  				count =3D fin=
d_next_bit_le32(p);
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  629  				if (count < 3=
2) {
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  630  					count +=3D b=
it_in_page;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  631  					goto found;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  632  				}
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  633  				break;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  634  			case BM_OP_FIN=
D_ZERO_BIT:
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  635  				count =3D fin=
d_next_zero_bit_le32(p);
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  636  				if (count < 3=
2) {
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  637  					count +=3D b=
it_in_page;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  638  					goto found;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  639  				}
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  640  				break;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  641  			}
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  642  			start +=3D 32;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  643  			bit_in_page +=
=3D word32_skip;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  644  			if (bit_in_pag=
e >=3D BITS_PER_PAGE)
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  645  				goto next_pag=
e;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  646  		}
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  647 =20
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  648  		/* don't overru=
n buffers with MERGE or EXTRACT,
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  649  		 * jump to the =
kunmap and then out... */
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  650  		if (start > end)
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  651  			goto next_page;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  652 =20
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  653  		switch (op) {
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  654  		default:
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  655  			while (start <=
=3D end) {
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  656  				switch (op) {
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  657  				case BM_OP_CL=
EAR:
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  658  					if (__test_a=
nd_clear_bit_le(bit_in_page, addr))
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  659  						count++;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  660  					break;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  661  				case BM_OP_SE=
T:
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  662  					if (!__test_=
and_set_bit_le(bit_in_page, addr))
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  663  						count++;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  664  					break;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  665  				case BM_OP_CO=
UNT:
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  666  					if (test_bit=
_le(bit_in_page, addr))
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  667  						total++;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  668  					break;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  669  				default:
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  670  					break;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  671  				}
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  672  				start++;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  673  				bit_in_page++;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  674  			}
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  675  			break;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  676  		case BM_OP_MERG=
E:
b411b3637fa71f Philipp Reisner      2009-09-25  677  			{
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  678  				__le32 *p =3D =
(__le32 *)addr + (bit_in_page >> 5);
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  679  				__le32 b =3D =
*buffer++ & cpu_to_le32((1 << (end - start + 1)) - 1);
b411b3637fa71f Philipp Reisner      2009-09-25  680 =20
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  681  				count +=3D hw=
eight32(~*p & b);
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  682  				*p |=3D b;
b411b3637fa71f Philipp Reisner      2009-09-25  683 =20
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  684  				start =3D end=
 + 1;
b411b3637fa71f Philipp Reisner      2009-09-25  685  			}
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  686  			break;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  687  		case BM_OP_EXTR=
ACT:
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  688  			{
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  689  				__le32 *p =3D =
(__le32 *)addr + (bit_in_page >> 5);
b411b3637fa71f Philipp Reisner      2009-09-25  690 =20
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  691  				*buffer++ =3D =
*p & cpu_to_le32((1 << (end - start + 1)) - 1);
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  692  				start =3D end=
 + 1;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  693  			}
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  694  			break;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  695  		case BM_OP_FIND=
_BIT:
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  696  			{
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  697  				unsigned int =
last =3D bit_in_page + (end - start);
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  698 =20
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  699  				count =3D fin=
d_next_bit_le(addr, last + 1, bit_in_page);
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  700  				if (count < l=
ast + 1)
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  701  					goto found;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  702  				start =3D end=
 + 1;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  703  			}
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  704  			break;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  705  		case BM_OP_FIND=
_ZERO_BIT:
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  706  			{
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  707  				unsigned int =
last =3D bit_in_page + (end - start);
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  708  				count =3D fin=
d_next_zero_bit_le(addr, last + 1, bit_in_page);
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  709  				if (count < l=
ast + 1)
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  710  					goto found;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  711  				start =3D end=
 + 1;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  712  			}
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  713  			break;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  714  		}
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  715 =20
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  716  	    next_page:
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  717  		bm_unmap(bitmap=
, addr);
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  718  		bit_in_page -=
=3D BITS_PER_PAGE;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  719  		switch (op) {
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  720  		case BM_OP_CLEA=
R:
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  721  			if (count) {
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  722  				bm_set_page_l=
azy_writeout(bitmap, page);
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  723  				total +=3D co=
unt;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  724  			}
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  725  			break;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  726  		case BM_OP_SET:
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  727  		case BM_OP_MERG=
E:
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  728  			if (count) {
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  729  				bm_set_page_n=
eed_writeout(bitmap, page);
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  730  				total +=3D co=
unt;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  731  			}
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  732  			break;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  733  		default:
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  734  			break;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  735  		}
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  736  		continue;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  737 =20
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  738  	    found:
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  739  		bm_unmap(bitmap=
, addr);
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  740  		return start + =
count - bit_in_page;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  741  	}
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  742  	switch (op) {
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  743  	case BM_OP_CLEAR:
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  744  		if (total)
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  745  			bitmap->bm_set=
[bitmap_index] -=3D total;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  746  		break;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  747  	case BM_OP_SET:
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  748  	case BM_OP_MERGE:
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  749  		if (total)
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  750  			bitmap->bm_set=
[bitmap_index] +=3D total;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  751  		break;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  752  	case BM_OP_FIND_=
BIT:
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  753  	case BM_OP_FIND_=
ZERO_BIT:
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  754  		total =3D DRBD_=
END_OF_BITMAP;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  755  		break;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  756  	default:
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  757  		break;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  758  	}
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  759  	return total;
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  760  }
21a8204649475c Christoph B=C3=B6hmwalder 2025-12-16  761 =20

:::::: The code at line 607 was first introduced by commit
:::::: 21a8204649475cdb3371ee62c258992ecaea406d drbd: rework activity log a=
nd bitmap for DRBD 9 multi-peer replication

:::::: TO: Christoph B=C3=B6hmwalder <christoph.boehmwalder@linbit.com>
:::::: CC: Christoph B=C3=B6hmwalder <christoph.boehmwalder@linbit.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
