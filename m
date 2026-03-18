Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D9419CC28
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Mar 2026 02:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773800475; cv=none; b=CoHzU3daGQZypbt69D+Mvh+OixDuN5/1XyfIDufcUTGgl3Iq2wx46Sau0mqc85UjEnmkTPGxbA5k8l+6zniVbti77Mv3X+8hLX+rh8ZOGsbSqQm/Mhcl8xncFgUrYUL7xAxqrFFDzbDfZI0V39mXUjLOd++TO5Sv1VpHvzf4wp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773800475; c=relaxed/simple;
	bh=qOCS+lV9PWBGM1uzC95xNuRI/2dhl88yLSWEzADLO3A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uDy+851quKq7vbZFS8pbKVQ8e10eLAkXkMxWZGeV4RGOEIWc8liBJwDZVKL+w/qnZqd7FAW8sn4V8mXNbO5RpNvrLgajPmLsDdzXfKI+Mlli0uIlQ/sdsE+iu0aJFl8YQcbpfhwhyB7Q222+z4rr1BboONH5wxTaxayi2QWvNL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dAVRJqk/; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dAVRJqk/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773800473; x=1805336473;
  h=date:from:to:cc:subject:message-id;
  bh=qOCS+lV9PWBGM1uzC95xNuRI/2dhl88yLSWEzADLO3A=;
  b=dAVRJqk/CXGLmJSNEgG+CHBpXUNeaikdoJ/HDSPVywr2Kp2iwedSCLpd
   yPS4suVEJuILpZ7eI+/8HrRHYYth0oZeavETv1Q/HqCe9+Fl+hdUG9dq1
   q3lBAkFm5N4nVHJ2oCwRuseJ+uudUe7AmhqYOEQYMZtHRKrbWRQaqOIRX
   P/qlYUk4yszNvJXOYrG3+eeMvnhkiqtbKR5txl2GSqaLfHmBjB57/uwxl
   7ozMoyfyAL/QSUecfeBTVcRLBxNA99kYTdfy5D4889qs8SkCTqvZ+J1M8
   LQx93eH84HVWJZMnyCCROaavI/paa4weA5iVzKEQC6anQUZpFpWOb9QVG
   A==;
X-CSE-ConnectionGUID: ix16mE/2QdCc+plkXxdDuQ==
X-CSE-MsgGUID: ugyKNNp5QdKxdDq1/MS1gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="77458089"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="77458089"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 19:21:13 -0700
X-CSE-ConnectionGUID: 3Db+oidYR12TJ6CJkreogw==
X-CSE-MsgGUID: a9n4QgR7QkWk8Qd6fI4B0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="218084119"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Mar 2026 19:21:11 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2gWy-000000002M5-3DKR;
	Wed, 18 Mar 2026 02:21:08 +0000
Date: Wed, 18 Mar 2026 10:20:41 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:new_tests 25/25] ERROR: modpost:
 "__bitmap_weighted_or" [lib/test_bitmap.ko] undefined!
Message-ID: <202603181020.rI9W3WaG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/norov/linux new_tests
head:   7402f5cc9265ac58854a5e28fa0305bda6f459ab
commit: 7402f5cc9265ac58854a5e28fa0305bda6f459ab [25/25] bitmap: add test_zero_nbits()
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260318/202603181020.rI9W3WaG-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603181020.rI9W3WaG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603181020.rI9W3WaG-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__bitmap_weighted_or" [lib/test_bitmap.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
