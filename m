Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3AC118CC13
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Feb 2026 00:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771029841; cv=none; b=Eu4zLt1FTxPR2kA0REkuBz8/AWa79uKhZtaCWUcl2xzYlCxGQKWs5/j1ZO6cLRYrVFVne3gVde/C61MZBWL8Ai7Bd76w5L/BRk84rDaOgnJq+1yTQk8a+2pmSrfooFSUHyKSE+wHvhBRXY4/sW2lThEMtm7nYWUVYQwx4aK7wf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771029841; c=relaxed/simple;
	bh=H5UlmA8YN7GMS7vMKE2MATt+W16o/yEUsITrjvnEni4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=D1farGF7yLgbylAXuiPz7z36xFuCFSz8r7YixRJc6VboDznR/uLw0+pj/e+9QC6Byg7i8+EV76t8t6ZH6KxdosiP7RGXMjt3aC2a4OJsMekAQMNEW7W2BJJ/zO050LCK/yHGJ7t2Hmx+MqkQRmN0k8OObz/qQbM97Fpa/HEnenY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R/Su1yaa; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R/Su1yaa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771029839; x=1802565839;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H5UlmA8YN7GMS7vMKE2MATt+W16o/yEUsITrjvnEni4=;
  b=R/Su1yaa0DckpwLjMrbsMJUDUSy5TzmSl+uxu1FxqEtubS3WCIVi4LeB
   YsOysX8FmOSYzS5bNGVLDKvXPf5hkv3fULTh01GWEIM6ZIFRhdSXA5TsI
   Zndj/kXJd6cO8udK86f3+0fTNOCEnn/PNqh0naEJFYrPsGSETtkX3H1UW
   A4fN9po6ppkwgZStKyxTDtwcOiivEkQWRhoh7OHa/2XZXywNY01E4GA1s
   MvD/tfuau2SQcCZnXIScPbkVnY/NZemrhPRwDVYUWIZt4HDU5bOyqUkQZ
   +CEIERv3v7bfSRJgS8nnIoK727RkvJVRuue6hifkvDWxaodf2X2TQO6nF
   Q==;
X-CSE-ConnectionGUID: 87XlzFMrQ4aYmxLE6URp7Q==
X-CSE-MsgGUID: eTwNTkdHSf2qybaEM4x6Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="76067708"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="76067708"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 16:43:58 -0800
X-CSE-ConnectionGUID: 1weQVFk4TxSrbRwOakpdXQ==
X-CSE-MsgGUID: 9Cb0n0IjRHOKM+wjNxNxKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="213165931"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Feb 2026 16:43:56 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vr3lK-00000000vzU-1las;
	Sat, 14 Feb 2026 00:43:54 +0000
Date: Sat, 14 Feb 2026 08:43:23 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-compat-checkflags 5/7]
 s390-linux-ld:./arch/s390/kernel/vmlinux.lds:12: undefined symbol
 `TEXT_OFFSET' referenced in expression
Message-ID: <202602140812.fAgR3zpd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-compat-checkflags
head:   f3f3c2f9cf8c8793e126868a6f934bd8c333ccfa
commit: 3348250fad3005f91f96ab4967e4589c9e234235 [5/7] s390: Trim includes in linker scripts
config: s390-randconfig-r071-20260214 (https://download.01.org/0day-ci/archive/20260214/202602140812.fAgR3zpd-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.3.0
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602140812.fAgR3zpd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602140812.fAgR3zpd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> s390-linux-ld:./arch/s390/kernel/vmlinux.lds:12: undefined symbol `TEXT_OFFSET' referenced in expression

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
