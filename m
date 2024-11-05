Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6942A1CB9E6
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Nov 2024 20:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730839138; cv=none; b=gyIgR5qLlrgjEgivYVBmM2zBjnpAZ1astzCLu0CjXVoAa56cqV9KWQgvRmgatqURSlZV79AY55G8aJOotkiMb8TeCuUBaj0cu24jejuhZ+U1LKk4ZtxMnGAPrVyKTkbp2IQ16NTQ/2qb2U+GDo7r4g55Sv2+u7pGLWVwBLPoxa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730839138; c=relaxed/simple;
	bh=PZvaUkIxQZnImz7NOqALrks9yamG0FyG7p8d71xem9w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=euN2fjDaFtuQ9/dT2MB00viSx9JzUvJedIfyrj8Br415mBaa3UkMkk4m45b587M/1rPJbgH2nvbLGOkvLalLio6/mCy4W5nD66xE/4JLdLDgIqg1yp68awl75/YXYgei6gZuF631rMsK+h1DtbXsjuFXZEeaRadynnMwUDLN80M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gJlwQ/Ur; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gJlwQ/Ur"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730839137; x=1762375137;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PZvaUkIxQZnImz7NOqALrks9yamG0FyG7p8d71xem9w=;
  b=gJlwQ/Ur/IjqDkQQZCBaszRrEqlBNMgPJ+ZvciuPG86SlgbkxRRn3hWm
   lOkr+gwaCvDk0RlnawW2e1PYn2ChPuSJEltNYZIUg0xkI+HftGmUutJZV
   iK85C4w2Mg148WH7+5K5DAO7vLyrhKTOu/BFdAuplrms7A7VmYhb7qcMR
   WZpAUXUlQseNj08dNgSioNL7INCPW/ob7tQQ9g29c/d9r6End2KmP1vLI
   rANxqDc0uueqboD3OLy7TL2wrOAWpRlWIM8UiHyig2TO8tWbckvxpRFhd
   zTn50ZssnLMA6pbU0DH69Uwaau7zzCb0vEODI8o9wrmt9KudR3I0TvGux
   A==;
X-CSE-ConnectionGUID: xFO3mM8mQ+m/6uJ9lWvzfQ==
X-CSE-MsgGUID: aMUURfBCRZmNNGC8hsPc1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34305916"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34305916"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 12:38:56 -0800
X-CSE-ConnectionGUID: qimvifYwQWi8+l4Sp8b98w==
X-CSE-MsgGUID: PSwmcwZ2Rv6/2cDa1uG5vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="88114919"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 Nov 2024 12:38:47 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8QK5-000mRK-0k;
	Tue, 05 Nov 2024 20:38:45 +0000
Date: Wed, 6 Nov 2024 04:38:00 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 38/39] ERROR: modpost: "nfsd_handle_dir_event"
 [fs/nfsd/nfsd.ko] undefined!
Message-ID: <202411060438.Me8Dye1p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   fcdfaef0f912fdab052bdc87ed835684f2427070
commit: be6d179c2e0ca9158a505aae689e92e02cfa84c5 [38/39] nfsd: add notification handlers for dir events
config: m68k-mvme147_defconfig (https://download.01.org/0day-ci/archive/20241106/202411060438.Me8Dye1p-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411060438.Me8Dye1p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411060438.Me8Dye1p-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in lib/asn1_decoder.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/slub_kunit.o
>> ERROR: modpost: "nfsd_handle_dir_event" [fs/nfsd/nfsd.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
