Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF2C36C0B0
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Mar 2026 09:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772963348; cv=none; b=MojmC9+Xt2WkMZPvPwYtgNqSQ5duS1R6sUqPNyOXneUPvGMZt6GYvPG78nQ36Z3znl+dINTO2aubkwXiGpb65DMpA8xRowZkGQVGM/j23zJDOWY007CjN5cdpNknJhZFRXZ8tHEwVi4gA6/dYiyi6LAWyJwx4fQD40j93rVnKgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772963348; c=relaxed/simple;
	bh=bPUkJmdXKo8uBOEUYD7h0zhevbky6Yxzb/RDgOJgSEo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eMaLC75PBGFNSa08KNxaMGwyPU0vvomT9mjzj7ydfAja4B1xTlru9e80y0Y9qYzJNct06zo2x5PLMMsYETIYJX0erxHirE4VBkfLpGBzASmkQOQOE+NdmDZByBBJgG4HilKnTMeoLLM5NniNCB4KRW/tlA97Bb8UHokXGa3/GnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kCVVnloO; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kCVVnloO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772963345; x=1804499345;
  h=date:from:to:cc:subject:message-id;
  bh=bPUkJmdXKo8uBOEUYD7h0zhevbky6Yxzb/RDgOJgSEo=;
  b=kCVVnloOg4Sw5M0Z5nTfGkn7qAq8pjz4HkLL5K5V60BgllRYI0KJA6IO
   5jcIs0SJRnpXB0IuRA1HweSsb0gSKk+DsHJkxr0Gcwhx+1jhAnSWmwYse
   v8quD62Xn1IekY0I3eQO8xQ/9/dRK2HFm4oWG3llBf8Hp7J/Kz2NPhHrb
   SgbrVqD6m5DLl7lvE7zYiVC4fvFiaDJItCRSIPe1sT7c6GftoxpTwXFEb
   UTf1q8ZBlu4XDYjO2yu4Poj1POPy6Ie32r6utLqMIYDdYCBM2r9RZ0rcl
   oIvQEwXHuwZDnDwRDJfadLoICYqcWsU3bwr7w+ZopOB32xoixghRrqDJJ
   A==;
X-CSE-ConnectionGUID: 8aVoWjq7RjqhhQiaZtIodw==
X-CSE-MsgGUID: ZlXxFJTsRHC6204+TBImBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="61582732"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="61582732"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 01:49:04 -0800
X-CSE-ConnectionGUID: h10TkGJuQ22AqOtc3fPhnQ==
X-CSE-MsgGUID: Oc0VY7qsQruGSpibkU6+cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="257378225"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 Mar 2026 01:49:02 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzAks-0000000031B-398q;
	Sun, 08 Mar 2026 09:48:58 +0000
Date: Sun, 08 Mar 2026 17:48:30 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Xin Ji <xji@analogixsemi.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [linux-next:master 338/4591] ld.lld: error: undefined
 symbol: usb_role_switch_put
Message-ID: <202603081714.uBgurk4s-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
commit: f81455b2d3327a5685623e7db4050dbbe5513bc3 [338/4591] drm: bridge: anx7625: implement minimal Type-C support
config: powerpc64-randconfig-r063-20260307 (https://download.01.org/0day-ci/archive/20260308/202603081714.uBgurk4s-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260308/202603081714.uBgurk4s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603081714.uBgurk4s-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: usb_role_switch_put
   >>> referenced by anx7625.c
   >>>               drivers/gpu/drm/bridge/analogix/anx7625.o:(anx7625_i2c_remove) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: fwnode_usb_role_switch_get
   >>> referenced by anx7625.c
   >>>               drivers/gpu/drm/bridge/analogix/anx7625.o:(anx7625_typec_register) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: usb_role_switch_set_role
   >>> referenced by anx7625.c
   >>>               drivers/gpu/drm/bridge/analogix/anx7625.o:(anx7625_typec_set_status) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
