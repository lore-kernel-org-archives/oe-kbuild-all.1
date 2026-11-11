Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423360;
	b=h4ZeR0bA7ORpGVsGDjRBanCN/kw+gqL9audtBDbPmIMFdTaDyaEsuYwBvHfSl9mx1vcr
	 9NkpM0rXKt/ARJeWL2Q3K9e7CCT0UatsYretHiuve7CnMfUGneCKx21utC0pRiK+2rRi2
	 QlEzC3bZVvlSBesIPYJHPceiNoDBlM4bi8yrfztpD6wuZx/74yhI37YCrqQfVcuzH5Eam
	 lwGi8e/6HtqqxYmKVMjnuMGDzwwp/CkgKGk6AJK23Iwx0W9rN4+wcBDMXEfIcAmlFJMko
	 61UowAuuJdpjbPWvvDoj72uTTiyR4V5a8TyFrv+JFVbpS21pVluJdTPiDS52gnzW/DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423360;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ntg5scnlgeho/3Q0/bAW7xkWv8d8aOENXz/22OAkkhY=;
	b=gLu2yQeNzwY6+4cDPQNhxGGmYuZR2D23vPBlaRk3882/PKlW9P+z8NUCB6YTGt0yyCQq
	 KZuxTHpD1PyimsFXKbZoBzevWUAn6atTHbKlbhNGniS8O/p5hZO9KfNyG0pji8M8djF7D
	 ViVALBa/5FwxLpDRBuxz19aOC1q8QuhXLQjIVneSXJkktKdrANG59IlYGf4NID2nCGgKv
	 +gb8qC8PvdqYOhLR+rizEreijeng+RsTsZY+u6GixbH7+Q7ZSaK1F0XFNb4vnd8pahX8h
	 D6pfhGkiudzAuCLwsBxKBSef4U+OobYcXdnesVpzNTswrPygL6ELi5DG77XYLVlWvDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EyeuDJJR;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5F0606A324
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Nov 2026 18:55:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E5F0606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EyeuDJJR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794423360; x=1825959360;
  h=date:from:to:cc:subject:message-id;
  bh=dohUDYJ+3FhODm5USKCeoP5EQ+p95F0tFOJotApQZf0=;
  b=EyeuDJJRhoM2kRZbZEIEkBWHZFGA82iK6YM5sIpYgu6Kdxb5XWPon9zY
   rQbRypBhOja3J8DmqHxovlXWPxBVHJAddmPWiDbpKFMN5Wav9jld2sEB1
   qhQg2e3d2Vse+FVsmePlkWMfobXJZAF4RIMca8rVKSYVjjaqOngTaPcdr
   I6UEvi3f8pxOvC7EeClM6xsXKIMfzP7KkYtdjCEM0kF5SInJSldxShJPV
   uqAknxcr74ZmKp0O8zB+ZA8atIFMLEPJ7vhqqrAWzbhun8hmS+SyuTgsU
   QbktjY9yO1ozmOdCZbbPYltYEM+H6DzWjRrRGEA31srh+z60R5arwG10J
   w==;
X-CSE-ConnectionGUID: j15CDg+UQBW3VfsRup4Xfg==
X-CSE-MsgGUID: BJKysb9bRQqSepVnUPGJKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3107327"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3107327"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 10:55:59 -0800
X-CSE-ConnectionGUID: IB9dLc8iRDmhr+nsC/MWHQ==
X-CSE-MsgGUID: b6J60d99Q1iI7iW2Z9ffWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8572785"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 11 Nov 2026 10:55:57 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRDUB-000000000e3-0pGD;
	Wed, 11 Nov 2026 18:55:55 +0000
Date: Wed, 11 Nov 2026 19:55:37 +0100
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:cancellations-backup/frame-slots 28/34]
 mips-linux-ld: unwind.c:undefined reference to `bpf_sk_release_proto'
Message-ID: <202611111945.2bSvbdQR-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/kkdwivedi/linux cancellations-backup/frame-slots
head:   57f1029f852dc5be270836c5ca820f32cdb62637
commit: 870dec4c95cf19c79626c22a410e1c90303bc1ff [28/34] bpf: Add frame descriptors and release what their slots hold when unwinding
config: mips-randconfig-r2302-20261111 (https://download.01.org/0day-ci/archive/20261111/202611111945.2bSvbdQR-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261111/202611111945.2bSvbdQR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611111945.2bSvbdQR-lkp@intel.com/

All errors (new ones prefixed by >>):

   mips-linux-ld: kernel/bpf/unwind.o: in function `bpf_unwind_release':
   unwind.c:(.text+0x2e4): undefined reference to `bpf_sk_release_proto'
>> mips-linux-ld: unwind.c:(.text+0x2f8): undefined reference to `bpf_sk_release_proto'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
