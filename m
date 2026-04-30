Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B8E38838C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 03:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777519594; cv=none; b=g8OdEfWpHCC4UJbYVLH+KFz9lkr1NmHPKrzlvg7u/2rZ3Vw6/Fx6m2JKr/rsq81Briy4el8w05gShE0uB7GC0I/sWzms0s6que1wRARbpiZ/gt87NP29V1YoHHXRDn1badEriVWDrgu4NI0f1LsYzLuPujegUDYoTgZfLmvrpMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777519594; c=relaxed/simple;
	bh=mBGFoGTfVIEYnD9cpA0hiK85Y7/1pj9ug2F2TD8pFfs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ooUfkDFfvW1mh24ewR6f9J8VJ/NiWaTbWNchhFI5NGYSTvx4JowP6qCRvSS0hH4HNtVkHienVqLYgchgEVrnnZocigZKWKUCEwQwgX/gSTgiFxEOIxeIghVuCIWCPXq3wV4EFo558V62+iGBQQaZe9HDU+JiZR+U+5l8UC8jBfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WtgM2e2z; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WtgM2e2z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777519593; x=1809055593;
  h=date:from:to:cc:subject:message-id;
  bh=mBGFoGTfVIEYnD9cpA0hiK85Y7/1pj9ug2F2TD8pFfs=;
  b=WtgM2e2zvbt6t+x2qSZnskrCd0wugb6ZcizIeBsgyAqIB9VZSlq8Y5y+
   ZTwWyR3DFLLm+W/gJg5G1SUlUYQhHQDQz0wPohE7Cf8/Jj50lMoOAP597
   ZefKrMJ33oCQDaZNbkqVtvS3WYzzJeAZ0mWdOG7HH8mGNEadQIHk1UM9/
   kCd3vPJMpcsZVl3GQXC1QTM9jkLSN1cvIczVW+GF9UO5uH4xUlSYYWw7Y
   XuzJ0Y5CCXEP7sAUapjIlPBFtX46kUcWp7kgU34MEvgbW3OlMZI7Kw/OW
   ZmU+xpS2fcdwMheaO1Sta2vsaEQLnxOea6e4Wl8qJoFi8Tshg/IbncGpT
   w==;
X-CSE-ConnectionGUID: wR2RRwKWSbuyQ6LJd0DTRA==
X-CSE-MsgGUID: JX76PorzTjKFpkejDp0GCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78566193"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="78566193"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 20:26:32 -0700
X-CSE-ConnectionGUID: 4dfhP2MASIucLbyUveDZbw==
X-CSE-MsgGUID: lZ2IQQPlR5iUYIMdAfbYaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="234340171"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 29 Apr 2026 20:26:31 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wII2m-000000004j3-3p9r;
	Thu, 30 Apr 2026 03:26:28 +0000
Date: Thu, 30 Apr 2026 05:25:29 +0200
From: kernel test robot <lkp@intel.com>
To: Eduard Zingerman <eddyz87@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Alexei Starovoitov <ast@kernel.org>
Subject: [linux-next:master 1144/2157] ERROR: modpost: "cnum64_umin"
 [drivers/net/ethernet/netronome/nfp/nfp.ko] undefined!
Message-ID: <202604300532.DOKjDgJo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0787c45ea08a13b5482e701fabc741877cf681f6
commit: bbc631085503a7fde9617be18b0657cc9a83910a [1144/2157] bpf: replace min/max fields with struct cnum{32,64}
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260430/202604300532.DOKjDgJo-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604300532.DOKjDgJo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604300532.DOKjDgJo-lkp@intel.com/

Note: the linux-next/master HEAD 0787c45ea08a13b5482e701fabc741877cf681f6 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "cnum64_umin" [drivers/net/ethernet/netronome/nfp/nfp.ko] undefined!
>> ERROR: modpost: "cnum64_umax" [drivers/net/ethernet/netronome/nfp/nfp.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
