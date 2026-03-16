Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E557E351C04
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Mar 2026 07:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773646962; cv=none; b=W3ShXd/gOSNm6yUS9lFnJWPPENPAdI++KKMoVAsAwj9W+FkUDgexhDxw8IiqfwTlKdKNz6oBF1shQVk0hAFjOaKgEfF8GX9upWt4buH5YvS9vrf/CYLIPYFU5n8XiaYkYja1ZBPri7Q6md8579UB0AZTdG4RewrQNMe7kB72azA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773646962; c=relaxed/simple;
	bh=m8Nc7gf7hO/rG8HIb59O/Ot4OEm8tRrbZdDz7zx2FVE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UVqSt9tPFqtpEv5hNAuvRDNb5Uc5j1JzBQhRO8479Z/fivUMTvMBjgb/hA9IlLPH4whBk4rt/vA38p94IHdBnVhc5aiSF4vPeLQPcjvPvlBKKw/LT/Hzw5n4U2buaB+utfoC0CNRAfpk9ytmyfbb6tHE/Au83OF0FPxQsgjEaKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UcMIbOsI; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UcMIbOsI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773646960; x=1805182960;
  h=date:from:to:cc:subject:message-id;
  bh=m8Nc7gf7hO/rG8HIb59O/Ot4OEm8tRrbZdDz7zx2FVE=;
  b=UcMIbOsI4OonoOKjRUsM3WbWYmaga04C2ucfjLoWStlZy7oZ4yKlMs4O
   rY28BMImsy2kFvsjdFklFPLWnnP2/n2hpcOkcd+AqlErRzOTG++r4DC66
   F5j4XuI/6dJY4mPM+vyA63GOVDG0u1f9v+TgrvWopEx1OarWNtBEmrM5B
   4vjABf29JX0V01nmNg/F+TlRzpYbJdhdNL4Qa4Duh9xmnML8pA8U872ip
   9xpw1xhlN8LRM2LgKE91oTDntMWO1omjprrn7QHDJ4wt/aHonTpZHKcq4
   9IF0kDQic4QnH/z3nyrzgp4Jn8SuWBXvMeE6CKXuQ26hd8ur2x3vgQkNk
   g==;
X-CSE-ConnectionGUID: wH3FIzfBS0eFb6Zujj8E5Q==
X-CSE-MsgGUID: jvbosu/HQP+UWYY9cTy/FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="73670909"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
   d="scan'208";a="73670909"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 00:42:39 -0700
X-CSE-ConnectionGUID: sL2yMJXWS9OZwF3a2bTtmg==
X-CSE-MsgGUID: PwCjQRzZTRKUMaKB6VND5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
   d="scan'208";a="244870226"
Received: from lkp-server01.sh.intel.com (HELO 892944969b78) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 Mar 2026 00:42:37 -0700
Received: from kbuild by 892944969b78 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w22ax-000000000JE-11A1;
	Mon, 16 Mar 2026 07:42:35 +0000
Date: Mon, 16 Mar 2026 15:41:39 +0800
From: kernel test robot <lkp@intel.com>
To: Yuli Wang <wangyuli@uniontech.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 Wentao Guan <guanwentao@uniontech.com>
Subject: lib/dhry_1.o: warning: objtool: dhry+0x74c: stack state
 mismatch: reg1[22]=-1+0 reg2[22]=-2-16
Message-ID: <202603161524.SMXn5Tav-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Yuli,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f338e77383789c0cae23ca3d48adcc5e9e137e3c
commit: 892a79634196d2729b81bb8e5b029d095704df63 LoongArch: Enable UBSAN (Undefined Behavior Sanitizer)
date:   12 months ago
config: loongarch-randconfig-001-20260316 (https://download.01.org/0day-ci/archive/20260316/202603161524.SMXn5Tav-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260316/202603161524.SMXn5Tav-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603161524.SMXn5Tav-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/dhry_1.o: warning: objtool: dhry+0x74c: stack state mismatch: reg1[22]=-1+0 reg2[22]=-2-16

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
