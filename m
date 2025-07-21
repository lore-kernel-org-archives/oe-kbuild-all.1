Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3964318DF8D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Jul 2025 03:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753068626; cv=none; b=M8B7dfyPkBKJwv4T/0z44kc+tsLCVi+2FqT80zJj8d3KUEbyXyje7x8Rlj8brN3CP/5dMA0q+Yx8uX32OEbOhv7E3K8Hzp/+2/MpxqmTmw7qMIxZDR91ly0nwE+tmf1VobxhSOPXsCHvao+OkCncOk9gLb+UZTlJEM7Iw2u3xgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753068626; c=relaxed/simple;
	bh=G8lQxYWHLP25FgRAiXjdMOCnCBL1PHiiZsUQsmUuozA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TplE2I9mEPXv9MfYjT8gUxHU/jN0l8tQ/i/m+uQChJZW86fSWO61+AUA1N4rNA7UMCSaj6G4SF4XbjIU3zmgOjpUA1QpgAUFcRGJjW/Eh9oWmm4WZOfmi0jogNRT99UKde/n9pJxDrnvlXV2Wadz5J5OmWCwYa8LiQInueZQ07c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JUuM5Aa3; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JUuM5Aa3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753068625; x=1784604625;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G8lQxYWHLP25FgRAiXjdMOCnCBL1PHiiZsUQsmUuozA=;
  b=JUuM5Aa3itkHvhiARioxjOQh39sC0YrTdy+eopJHeitb8Fs4/bzY5psu
   7alK7b05+AhgvkvDeSUYpL0n06VD/8XevZCtOfpFOEHrKi02LdHwioe0L
   Ij2b+B52apjhihxs+2VGX6VapnKZNAUgZKvdnsyy/wp/G/QmUnz97ROSF
   hX8n+IS62Yn+Fx17JqATL0/w3PIKa+rN+3Th1p0EqCApX99di0wC2nMB8
   ZbxpXzqjLuSSTFITt4o5HLSlxsdp3Rejx5I7nZ87CwCqziDOhBKsxZQ3g
   n4bcub5KId2/J2+rvv0V/DODRuE/j0QP+eoZi8O/Z9UB9k5+bGGXHgYaV
   g==;
X-CSE-ConnectionGUID: 3NJXW8XsS8aUMOXBJlnY3w==
X-CSE-MsgGUID: JiBgdQNRQE2UO73SU+BDBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11498"; a="55155740"
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; 
   d="scan'208";a="55155740"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2025 20:30:25 -0700
X-CSE-ConnectionGUID: C9YXkVK+RgeNhLjkBvbRqQ==
X-CSE-MsgGUID: kp+JN0xRSFONb0jdzecJJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; 
   d="scan'208";a="158776399"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Jul 2025 20:30:24 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udhEL-000GRd-2K;
	Mon, 21 Jul 2025 03:30:21 +0000
Date: Mon, 21 Jul 2025 11:29:56 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:next 26/26] vmlinux.o: warning: objtool:
 asm_fred_entry_from_kvm+0x59: call without frame pointer save/setup
Message-ID: <202507211121.Bn6asJRr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git next
head:   108ac086b6c6c026729618b37ad6587927981e1f
commit: 108ac086b6c6c026729618b37ad6587927981e1f [26/26] x86/entry/fred: Add UNWIND_HINT_IRET_REGS to FRED stack frame
config: x86_64-buildonly-randconfig-003-20250721 (https://download.01.org/0day-ci/archive/20250721/202507211121.Bn6asJRr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250721/202507211121.Bn6asJRr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507211121.Bn6asJRr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: asm_fred_entry_from_kvm+0x59: call without frame pointer save/setup

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
