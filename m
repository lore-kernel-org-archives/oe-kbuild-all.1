Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4041E36B07C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Feb 2026 09:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771927121; cv=none; b=VGDTZvQtwT4R/qBftsSrbByaIlDj6Pf/XChU+Y+4sbnJjRO6HvIa9PUwOLH7031+MYHHYr/OqBBUDLZHcPRtsufxAOXKwHv2Al2FYpSl2dblXbqm0/V0xdS71+Onvs39+Abp4PvQGdHranMA03nbdsVDjYtqFK+obpD91ROo/Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771927121; c=relaxed/simple;
	bh=ENJmh/Til4a4XOpJJAbv5bDvxnkPmJfPr5HM61fmrdI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Ho3xoRYlAWKR3ZX57ogOmUSaS5sY7JxsSUcq1mIVP5VJjjPq6vNLbqx5JaOc+iC5gFyHZgtVv2F/dxlvAJbDNp9ORNrglQ8uchsUgDDpm7oHPPDukehkw4GdCH6rpEQBhcUF9mYQxOgJWkxbxcLrEi64dFpBL21S+GowWRUf8Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hb5Nh8nn; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hb5Nh8nn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771927120; x=1803463120;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ENJmh/Til4a4XOpJJAbv5bDvxnkPmJfPr5HM61fmrdI=;
  b=Hb5Nh8nnJQuYyAp2t/C0JfbVjwMiDeo9E1mLF2veD/lqM4Ip/WSKyTNt
   2ZiOTnlWwCl5r2NZkIP+FbGdrFx3fUvquzf6ZLKxdRliyXWyCnY8u2bWZ
   7gIAQ4c2s0K5goTAHCBhtU5HOI1iNQlcP8eeEqiaicd/GRib9ILVYeLuq
   mj//EG9aUfl52ooMADYdoaWGjponrAL2Lio//ZDMCR63VgdO5w4iDAcKz
   uDSdXYTlyKWFAgdnmOY7zhFso0p8e1hkLB2yOzEJNYa6O5DRdXJ6UDqzP
   YcT6fhJOW4fexqL7ThPTEyoVv34lJ7d0her5EzW5LoKfMoJUsSbHoooxM
   w==;
X-CSE-ConnectionGUID: INuUzfmAThmvlOnWdXcZ+A==
X-CSE-MsgGUID: zww6/ZFQRwy5qZMnYD6EQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="76798242"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="76798242"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 01:58:39 -0800
X-CSE-ConnectionGUID: 3ncLNXOGTOW0vVo4Vg7tTQ==
X-CSE-MsgGUID: ATdq4Mg4QIGz6WqxYTRZDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="246435467"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 24 Feb 2026 01:58:38 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vupBc-000000005Az-0HzK;
	Tue, 24 Feb 2026 09:58:36 +0000
Date: Tue, 24 Feb 2026 10:57:36 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-DMR-APX-ANBZ29353 30/30]
 dt-extract-compatibles: error: unrecognized arguments: -d
Message-ID: <202602241009.nhIKN3SF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi N=C3=ADcolas,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-DMR-APX-A=
NBZ29353
head:   d8e6957edead90297a4f8cb1f247c54e559dbf8c
commit: e20861fb88ee3302349370c595e2498122732f3a [30/30] kselftest: Add new=
 test for detecting unprobed Devicetree devices
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/202=
60224/202602241009.nhIKN3SF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260224/202602241009.nhIKN3SF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602241009.nhIKN3SF-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   usage: dt-extract-compatibles [-h] [-H] [cfile ...]
>> dt-extract-compatibles: error: unrecognized arguments: -d

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
