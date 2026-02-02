Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F8D36166F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Feb 2026 11:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770032933; cv=none; b=cn0tG2VknmwD9fKsajX09Ct1ingwIVKTkF9ABN8ArBHlT+ZbZrXyFYbs2dwuV2RvXJWQxT88Lv3FzrmC7aAM0qjwySBj36MdI6Nuugn7sHSLnnTZZLkeTYROA2kgU1eJJ1VhrhM26yOBPvJZaSSntiGPfTLlQ4EyR4KLAOXegfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770032933; c=relaxed/simple;
	bh=tQC9rKz5sG34Db5b6u8TKXiIpb9Lc7vxAnsWKgKKJg4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=euVEsIludrvqgQOvWfTx6Xgw2rsZwUhxoo3DWfhN62fup84dz4Oc7ZS/mb6zwZqGJ+lFNDsXi/j+QYdrwP1NBGXUXXUYwNvEZ4j974j363/z478DiIMChnV8MumKaFIn9TA+NRlLcSaUAb7ivoQsu84FR2N/vku+/96hAzjdUJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M4zKAf12; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M4zKAf12"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770032933; x=1801568933;
  h=date:from:to:cc:subject:message-id;
  bh=tQC9rKz5sG34Db5b6u8TKXiIpb9Lc7vxAnsWKgKKJg4=;
  b=M4zKAf12ub88vuto8lDciCDoN8iwYWxCabpgiDre76VHfSaHwTbVj010
   LEmfG6hXnd+cPz/I3/1gGAZPO1C6CunfgHL3LaV9YJMsdc5Gp++TpGPsW
   1vTD0xbb5Hr/69VMdWC4FLCvk48v5M6Ruvjmra8V8Vj3mE+l8ooCKX756
   w7At4/85FfwllrI4PrgIMrOUxoWZ/A2pANfFy0J6GSzRqZQKyNyBlNG5D
   b4qMyIls1V7MYQgQ+I2iBm7Sb5EEPiGWLqblCZhp4LJhfr9G60hs7eO9W
   Il2h9BabdnIc6XtcZ/UT2H8Kqe48iZuSaNwzsxyvIYGEfPW4ePmlG0WyT
   w==;
X-CSE-ConnectionGUID: sg5qBmotTbyntGweManjng==
X-CSE-MsgGUID: 6gUHGVqLQYWeZC42t3ihTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="82296539"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; 
   d="scan'208";a="82296539"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 03:48:52 -0800
X-CSE-ConnectionGUID: NXjtFBUOQVeUaCDGKVHJFg==
X-CSE-MsgGUID: shww7IMsQsCPelnXseCoMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; 
   d="scan'208";a="214435420"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 Feb 2026 03:48:51 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmsQA-00000000fXc-4BSz;
	Mon, 02 Feb 2026 11:48:46 +0000
Date: Mon, 02 Feb 2026 19:48:11 +0800
From: kernel test robot <lkp@intel.com>
To: John Johansen <john.johansen@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Georgia Garcia <georgia.garcia@canonical.com>
Subject: [jj-apparmor:apparmor-next 24/29] Warning:
 security/apparmor/label.c:1347 function parameter 'inview' not described in
 'label_components_match'
Message-ID: <202602021932.mEYmkU9G-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jj/linux-apparmor.git apparmor-next
head:   173a18bf6c87bb337d2fe8d59b5a41b3cfa38fda
commit: 796c146fa6c8289afc9e18004c21bfe05c75a487 [24/29] apparmor: split xxx_in_ns into its two separate semantic use cases
config: microblaze-randconfig-r073-20260202 (https://download.01.org/0day-ci/archive/20260202/202602021932.mEYmkU9G-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260202/202602021932.mEYmkU9G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602021932.mEYmkU9G-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: security/apparmor/label.c:1347 function parameter 'inview' not described in 'label_components_match'
>> Warning: security/apparmor/label.c:1404 function parameter 'inview' not described in 'aa_label_match'
>> Warning: security/apparmor/label.c:1347 function parameter 'inview' not described in 'label_components_match'
>> Warning: security/apparmor/label.c:1404 function parameter 'inview' not described in 'aa_label_match'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_DEV
   Depends on [n]: NETDEVICES [=n] && CAN [=y]
   Selected by [y]:
   - CAN [=y] && NET [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
