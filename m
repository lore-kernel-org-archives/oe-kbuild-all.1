Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64A25B1EB
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Apr 2026 00:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775003218; cv=none; b=sOtIf7SZrE7HyZdjhMJJNIvxOu2hguL+VXH/cilXyx9iwyc8+i6eaeUo3VM+3zAqT5G8Rc6C2FRBGKSNzvUxdcZ/L96p7k1FPpy3ApFlQcFOOKa8ckbus7JEQT/ukoYJZdiRc++QAaLX3N8yCdHsdtP2ySAAOIn2cULjsJX9YY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775003218; c=relaxed/simple;
	bh=zEYJgFyJoX7bJJWfBCfy2tnwkAhrBUpGc6el5JSwmPc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i466l0h4784gZYhqSRfHmPJTTcYIrFRBmzjmnBnqxpJ1rHtLVa1p2Ys1WYspUZcTfDeosCG/OJjhojNeHxLmkEHWL6ZrKUFAqY/zHZMMA3V8y/JqfTr5ZbMmzA0gqm7bH8NX5e57iVhn43ro83P5KtEKsglCyC21tBGxjy1xInA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ArLi82dV; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ArLi82dV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775003217; x=1806539217;
  h=date:from:to:cc:subject:message-id;
  bh=zEYJgFyJoX7bJJWfBCfy2tnwkAhrBUpGc6el5JSwmPc=;
  b=ArLi82dV5BIOC8zYvao1ydDUN2BsAu9CJCtxNhhlT+s+Gy/bEeGEKXiz
   JwGrbXrj2AQ815zQ2TMnjPZNLmZVafjggLBvtjn5ucibA2WVP3KCkU7cQ
   aU3nptgRqJGZqrlJxY4bQtePsNjSf0mbflG8sJnE7VBXL+QF1yM/hD6RO
   yaGDsaDv98uHdFamFp0sDzQBHtK0c8tA//nO9q1JXsUob4rj36v7b+Jkm
   Nxzg9Pu9kzCpI4ci+0VK0FxMUxjY2G4N4J4QsykSMNN6u83ONAr4jgVuU
   A+vggMhSHC0pyHWGAx+WRM2M1U54MKBYRFGXWxRiFsYHsmC/nUITqtb0t
   Q==;
X-CSE-ConnectionGUID: Hjsnu7FDTbOx4j9a7WyYNA==
X-CSE-MsgGUID: SU+Gdik8T5i7Os6O7QFalw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="87108095"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="87108095"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 17:26:56 -0700
X-CSE-ConnectionGUID: cIg2SwGYRyO5V/09VxqinA==
X-CSE-MsgGUID: iT0KU1EmTcmdJEm10V4VjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="221667799"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 31 Mar 2026 17:26:55 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7jQ4-000000004TJ-38OU;
	Wed, 01 Apr 2026 00:26:52 +0000
Date: Wed, 01 Apr 2026 08:26:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10-2025-05 0/1]
 drivers/staging/android/debug_kinfo.c:164:34: warning: 'debug_kinfo_of_match'
 defined but not used
Message-ID: <202604010842.7leMbYuw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Jone,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.10-2025-05
head:   caa86441f12251704c5f34931d7508bb26b79ba1
commit: e7be908f88dbde1df94db83d6c7a23b117de0f36 [0/1] ANDROID: staging: add debug-kinfo driver
config: i386-randconfig-006-20260401 (https://download.01.org/0day-ci/archive/20260401/202604010842.7leMbYuw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604010842.7leMbYuw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604010842.7leMbYuw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/android/debug_kinfo.c:164:34: warning: 'debug_kinfo_of_match' defined but not used [-Wunused-const-variable=]
     164 | static const struct of_device_id debug_kinfo_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~


vim +/debug_kinfo_of_match +164 drivers/staging/android/debug_kinfo.c

   163	
 > 164	static const struct of_device_id debug_kinfo_of_match[] = {
   165		{ .compatible	= "google,debug-kinfo" },
   166		{},
   167	};
   168	MODULE_DEVICE_TABLE(of, debug_kinfo_of_match);
   169	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
