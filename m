Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3902D4AAC46
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 13:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790170071; cv=none; b=jhNikaet5368jgEz4NGxpOh1QaQx4KbUTPMSMeJtlfvUpMP2saqlsTg4+vx2wV1ftfNTtqPM3ldu3LCwzSERjjtXQo/cQgbllPAAWa39Oc+pM+F4RekdIxUZgfoRyp/NNnhJx1GajBTWKr/X0JA3Gq3bi2Lfxb/Tz/jnT1EGuYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790170071; c=relaxed/simple;
	bh=8ITsfBzhu5LTkqIzmMywKVva6CIb+icYQldN1PW3gO8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iEVnpnNjBR14UhAhvLy3wYrCiRZV9lzd2Q0lnkcMcJgoa9QJceGUGtui/5Tb/TRENUcEHHKAFMDTm7jQ3jtc+VlS2jNSJQhh2mi+frB6G6oWQjmruDbO6AKVh6Yl3adfO2sxBr0mGhq5i9lIKRXU31vsvyNBaKAvIjPYfpnmo+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kN8g2ePE; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kN8g2ePE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790170070; x=1821706070;
  h=date:from:to:cc:subject:message-id;
  bh=8ITsfBzhu5LTkqIzmMywKVva6CIb+icYQldN1PW3gO8=;
  b=kN8g2ePEQ9vF/OaLI6G3tpx4fbW8vcfz+UHepzDaoyopqusaCqUlavbs
   9EXYqwT04VoNEYyAVYutuEO+UQoVn/SKW1aft5UY8+ylUdcfhx6kw0IxY
   q215CZvAI0axXLQTZEz6qNAck6Wf7DrGZVhbMQSmSECprF9YdYMS1ukTB
   Qg85Bh1XlaT76h6LBPjTps3EtVsRuPmoRpD2ItYzbe5GALKlelBS6kPsF
   IP0XKBgEBqXH12gwpHkzWoOc9boynJvm66qKpsYo5qGTU/mqVtz4RyECS
   kIHDeJJv+QyYw38NL/EwwGk/yW9wiKCxv2FZYaK2PfdUwNqNDPkuBEZ7o
   w==;
X-CSE-ConnectionGUID: 1J3GSfvtRC6Qds7xI18yFQ==
X-CSE-MsgGUID: 7uQoAPRhQfyyYbhyXaOL0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="78419089"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="78419089"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 06:27:50 -0700
X-CSE-ConnectionGUID: MZlVfxYxSbCa979++txBcg==
X-CSE-MsgGUID: Rz2zJfYeTEur0zjfaVkFOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="4703699"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 23 Sep 2026 06:27:48 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9N0k-000000000h9-0btw;
	Wed, 23 Sep 2026 13:27:46 +0000
Date: Wed, 23 Sep 2026 15:27:10 +0200
From: kernel test robot <lkp@intel.com>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: Warning: drivers/counter/rz-mtu3-cnt.c:79 struct member
 'ceiling' not described in 'rz_mtu3_cnt'
Message-ID: <202609231524.l5T8jqto-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Cosmin-Tanislav/counter-rz-mtu3-cnt-put-runtime-PM-on-initialization-error-path/20260914-233600
head:   954d90b083946d6e70b731917c145a5125bed7c4
commit: b0e6ac5a30b6b1c5f63d8ce4479391f192b0b4f5 counter: rz-mtu3-cnt: unify ceiling values
date:   9 days ago
config: parisc-randconfig-r2202-20260923 (https://download.01.org/0day-ci/archive/20260923/202609231524.l5T8jqto-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609231524.l5T8jqto-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609231524.l5T8jqto-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/counter/rz-mtu3-cnt.c:79 struct member 'ceiling' not described in 'rz_mtu3_cnt'
   Warning: drivers/counter/rz-mtu3-cnt.c:79 Excess struct member 'clk' description in 'rz_mtu3_cnt'
>> Warning: drivers/counter/rz-mtu3-cnt.c:79 Excess struct member 'mtu_16bit_max' description in 'rz_mtu3_cnt'
>> Warning: drivers/counter/rz-mtu3-cnt.c:79 Excess struct member 'mtu_32bit_max' description in 'rz_mtu3_cnt'
>> Warning: drivers/counter/rz-mtu3-cnt.c:79 struct member 'ceiling' not described in 'rz_mtu3_cnt'
   Warning: drivers/counter/rz-mtu3-cnt.c:79 Excess struct member 'clk' description in 'rz_mtu3_cnt'
>> Warning: drivers/counter/rz-mtu3-cnt.c:79 Excess struct member 'mtu_16bit_max' description in 'rz_mtu3_cnt'
>> Warning: drivers/counter/rz-mtu3-cnt.c:79 Excess struct member 'mtu_32bit_max' description in 'rz_mtu3_cnt'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
