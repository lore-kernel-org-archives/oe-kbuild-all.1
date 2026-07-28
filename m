Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC30F3C5DBA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jul 2026 07:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785222345; cv=none; b=OuqMG/7Ko1NRZJ3wf2fLSMjtfGlGphYCL0fv9hcYe6GZNkyoSCK6C9T28PgZ/dOPk0bAxCVZAIsr3Hvf0CJFKcqw/U1IemTR3uZqqV69hkwrdkJ5t0ox1H6b6P2oblx+9nVhpp97Zz3jlEiZW2wizXSbYVZw4CoCvj/VQiIoHHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785222345; c=relaxed/simple;
	bh=a6Gm3GkS0OgLRhKlU0TVPArpgy1y1Tf6BS3vGrWx2nI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bHNEshYYscRumLni38wVVTET8k84NCEtCNJQq7NVBBykTwDX2UGmzPk/N1HzdP3yxJjJtWKw8KP2lz4yNbb4ZjKuUlFGivqU2MFEaBDkmAlZItpWIlrJwQRrQ3/BsEwv3He/RzE+LNo9ZHgmIYO8nokbOf/5VmNXWs24GjoummM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l3A7eAiu; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l3A7eAiu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785222342; x=1816758342;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=a6Gm3GkS0OgLRhKlU0TVPArpgy1y1Tf6BS3vGrWx2nI=;
  b=l3A7eAiuapS4y9BkkryB/Zm9R1U1QXQ6gMPJUft28ftfmJ6d+KUoahrO
   SREAioHTBNz+cbZvaEzeLi2nC7vd9ynHOPNhlW1lmuEpqUk1yPbSQ64py
   j0Aiv2bcn2adkVm6n3kPR1wWP9TxvtPlRl+1Cn86M65IB51QanddxOmef
   qPG7N/RSiEdGUBBQ4h0LRnfoufLfSTVNsDZyM3sq0nxZUlatI7UDVd6jQ
   mhVx0DTIkmGuwQfo+27DPSeXIv0XgixyDp1hTZ2F9DVmFdOueMKyCVhAk
   KGHrcEtPGNJz5mIsx/4dexuUDpfClbAv8X+yOnzvfMcq25ootXRZSHqlf
   g==;
X-CSE-ConnectionGUID: bkGxPuQfQFaZWCKa9xm1kA==
X-CSE-MsgGUID: 4Km59pn3TkmS5rHMUFrpOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="89691546"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="89691546"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 00:05:41 -0700
X-CSE-ConnectionGUID: TKT8YIgJRLaVz96NkJ0baQ==
X-CSE-MsgGUID: 58hbIVD+RdCslww/IMQm2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="289580882"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 28 Jul 2026 00:05:40 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wobsf-000000001v2-3ZER;
	Tue, 28 Jul 2026 07:05:37 +0000
Date: Tue, 28 Jul 2026 09:04:52 +0200
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [stefandoesinger-zx297520:dlink 81/130] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202607280801.HDCY2Nv7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel dlink
head:   3d8eb1c72ad9937912307a2d4f3de812b572b9b3
commit: 579efadf16dc73a20f2f252c88c418334eedcd6f [81/130] Add a ZTE RTC dri=
ver
reproduce: (https://download.01.org/0day-ci/archive/20260728/202607280801.H=
DCY2Nv7-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#55: FILE: drivers/rtc/rtc-zx23.c:6:
+ * Copyright 2026 Stefan D=C3=B6singer
+*/

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
