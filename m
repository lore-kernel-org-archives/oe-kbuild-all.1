Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEB64EDCCF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 16:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790180765; cv=none; b=GxfsO6n273e0uqBLls4nYkpQvLDVJ4YvydNKhrBeV2dPFeSecJluhpjidXAkIMsUclDzkSj4rL6ApA15940cBHm6AxFf2Em0RJgsA2mrqSGfoAtiZMX+N1U6ib8F9xekabetJ1g403SVi1LQnmql5xpoK5mOVVM4sAfFUHgggnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790180765; c=relaxed/simple;
	bh=kzc2h00GwDML2ZCtlQJC+CJ8GSndZ9p3sv90UAbzgHo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TsMWYhdvFybIFevUDQU6dJC1Mgz1bwkw/y7r5U47HvmcU9IlqxR+D30U5t9OTrO/BcwCA9TKoekyCxTN91Kz1yWVLgkDRzZxlBtB6uMcpGG+wxyS0eUvzG4vfPuDcWqsvIToJDohkagXVgISUfmqFaXQbQGF5A36Ytj1QsBoJn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tly8Ztf1; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tly8Ztf1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790180763; x=1821716763;
  h=date:from:to:cc:subject:message-id;
  bh=kzc2h00GwDML2ZCtlQJC+CJ8GSndZ9p3sv90UAbzgHo=;
  b=Tly8Ztf1u0PmblRcASKXi7sVK0Z6UpPPjcWkN4wK4vuSdTNpZOk/q/TX
   uS4wfsd7QnK2dkYUopMYgGikR9PH8i4gmhezt7CVmGk4jCN5msL07WJUK
   LO/5paPfY/gjIIzg7vzszfNWwyAEL35m2dF0n3F/C6lMCoddE5W24PekS
   TtehZL/iCEDAcMAXuXPEaKluYrHSfOX3fSVpfT+B97qIVYZD0+ea2VWQ9
   syvlug0X1fXmlabtyH4r12gcbZ20w6N13go3uzR4ufwSKykrcp1fIYg7J
   Y9CmMFZrL1JGDRLCC2cuncztwDfT3BhZl1VViB+IdTgpHq3v4z4+8Tbj7
   w==;
X-CSE-ConnectionGUID: tI6u3MaLSBa88H4Wosenlw==
X-CSE-MsgGUID: Mdsdo0nTTGytNqO6BSByHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="108393703"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="108393703"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 09:26:02 -0700
X-CSE-ConnectionGUID: RQHtChMBQN2ZNgdmZVMklw==
X-CSE-MsgGUID: KkrbENCkQ2WYuBKmYx9t4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="272279180"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 23 Sep 2026 09:26:01 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9PnC-000000000k3-3mag;
	Wed, 23 Sep 2026 16:25:58 +0000
Date: Wed, 23 Sep 2026 18:25:47 +0200
From: kernel test robot <lkp@intel.com>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: Warning: drivers/counter/rz-mtu3-cnt.c:81 struct member
 'timer_mode' not described in 'rz_mtu3_cnt'
Message-ID: <202609231813.hV0YGq7k-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Cosmin-Tanislav/counter-rz-mtu3-cnt-put-runtime-PM-on-initialization-error-path/20260914-233600
head:   954d90b083946d6e70b731917c145a5125bed7c4
commit: ad62cd3a82a8b808df590cd7fc9417090171b1ef counter: rz-mtu3-cnt: cache function values
date:   9 days ago
config: parisc-randconfig-r2202-20260923 (https://download.01.org/0day-ci/archive/20260923/202609231813.hV0YGq7k-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609231813.hV0YGq7k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609231813.hV0YGq7k-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/counter/rz-mtu3-cnt.c:81 struct member 'ceiling' not described in 'rz_mtu3_cnt'
   Warning: drivers/counter/rz-mtu3-cnt.c:81 struct member 'count' not described in 'rz_mtu3_cnt'
>> Warning: drivers/counter/rz-mtu3-cnt.c:81 struct member 'timer_mode' not described in 'rz_mtu3_cnt'
   Warning: drivers/counter/rz-mtu3-cnt.c:81 Excess struct member 'clk' description in 'rz_mtu3_cnt'
   Warning: drivers/counter/rz-mtu3-cnt.c:81 Excess struct member 'mtu_16bit_max' description in 'rz_mtu3_cnt'
   Warning: drivers/counter/rz-mtu3-cnt.c:81 Excess struct member 'mtu_32bit_max' description in 'rz_mtu3_cnt'
   Warning: drivers/counter/rz-mtu3-cnt.c:81 struct member 'ceiling' not described in 'rz_mtu3_cnt'
   Warning: drivers/counter/rz-mtu3-cnt.c:81 struct member 'count' not described in 'rz_mtu3_cnt'
>> Warning: drivers/counter/rz-mtu3-cnt.c:81 struct member 'timer_mode' not described in 'rz_mtu3_cnt'
   Warning: drivers/counter/rz-mtu3-cnt.c:81 Excess struct member 'clk' description in 'rz_mtu3_cnt'
   Warning: drivers/counter/rz-mtu3-cnt.c:81 Excess struct member 'mtu_16bit_max' description in 'rz_mtu3_cnt'
   Warning: drivers/counter/rz-mtu3-cnt.c:81 Excess struct member 'mtu_32bit_max' description in 'rz_mtu3_cnt'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
