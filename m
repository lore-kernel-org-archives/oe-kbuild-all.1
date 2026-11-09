Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794207120;
	b=H9fHobPMvMDI3nTB29inNqqmVWopuCq0qqjOMlZI1xQDL2XJoOwI9LgPh5YsZO7DQ0TB
	 7gqmize4GT5fSHo/a/CsGigB2saEFuW5oPw+Y0Rtq86bKr7MBfbcntY8vXjZP3VqLwWuw
	 F/vgDr9jyjaLOw2ep2aWPailwqMhPAzEOtytgCNvcsVQzcYugdst1TPjSuBmA6mp+tsKw
	 FMRCigGUlBKLcEkAatpXOP9eDCeozFRvEFn9r2MC/JE2TUZwrX+NgbyKBCOnEQhNerdtC
	 VL5bM7caPwAGDv6I0t/h88BkucB+nr5SP8lCKq5ebkgkwFFCioCipCutDfBXcZmir9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794207120;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=Nd29jFUjnI/PxUFSqjE01oydI5qXZXWNefrvt0QE1og=;
	b=vbEiNXklUOBP7PAH+HvEqDQIdaxKVNf1rUQyP00gB3I84k3gTb+SbTCJrZwq4vdIx9mz
	 STh4eVDePDc0YhYsXdeuTbgLDDn/KMBynmUKuEUWMmESAoMgaikmnDkyhO7urbHPYkwbd
	 NfO+VujqBO4PLgl9T1+l84ujQpLjs3Cw1bECA8jVETxn4H+Ez4xENQSbd6IYhTXqf4/bv
	 fpHlXiCq+J7YEEnzahZrqPYzGUS74/L38RsrPQWtue2tzBRNMup+dh10pjq2uKxbFNZ+C
	 VSu1HN6bTxxqOK0kxkeo8a7RXnk3iXwN16aw9HqTvJw7PExYJLiG4BNQ4RLg6jAjwwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FANBNj9k;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB4E606A31C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Nov 2026 06:51:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EB4E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FANBNj9k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794207117; x=1825743117;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KoRKkqwZBYlBKAMHoNh2Y6J0f7KxkFK1KhITzy4BLuA=;
  b=FANBNj9kP/vbE373Tt2HiSFJfnFA71CCHivRyyw1nUvwtJsKdqTIkpOl
   02j/qHoxJ7oR1LGEXgvElxBUmVTIjTcbxFR+IMaEGxTGd59NQyzGCLOqO
   GQgtDW3WWDWsvBZVfZdspU637r6Xl+AdF+M8fZ6TYANYqJitFWjhobzV2
   Yw7ceG+wX72MAo9roHkMD79pS1Wa45/1R/6yVx7WxcUgq6HwFgAuhE0YH
   S1mvSaGhGTFMAGxuQUhxIMTPfu2KyaHPooCZ3XunkYpWYKHSu9hoaz69u
   +2MzknbolKYhcvqaFcQW+fm6kvoDBz1KD2pmg420W2kNniRXwPZcpk1T/
   A==;
X-CSE-ConnectionGUID: iIuarlLTQRmIN5/Q9mGlIQ==
X-CSE-MsgGUID: sqlnvYQ/RnetbCa2egYUjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2919201"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2919201"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 22:51:56 -0800
X-CSE-ConnectionGUID: jZXojD9KQIe6OkQmhDZgRQ==
X-CSE-MsgGUID: KldjQUQ6S+msOOiVyRti9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="9549766"
Received: from igk-lkp-server01.igk.intel.com (HELO 1db0d17a343c) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 08 Nov 2026 22:51:56 -0800
Received: from kbuild by 1db0d17a343c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQJEN-000000000FP-2GV6;
	Mon, 09 Nov 2026 06:51:51 +0000
Date: Mon, 09 Nov 2026 07:51:25 +0100
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dyndbg-maple-clean 47/50]
 sparc-linux-ld:./arch/sparc/kernel/vmlinux.lds:1: syntax error
Message-ID: <202611090739.XDOV2VCe-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dyndbg-maple-clean
head:   5f7782a41d4ca319992609b6589a592f87e83006
commit: af718ee6a3256d73ee276d2c2bbbae9df0da6bfb [47/50] dyndbg: Save _ddebug_site fields into a maple-tree
config: sparc-randconfig-2001-20261109 (https://download.01.org/0day-ci/archive/20261109/202611090739.XDOV2VCe-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611090739.XDOV2VCe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611090739.XDOV2VCe-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc-linux-ld:./arch/sparc/kernel/vmlinux.lds:1: ignoring invalid character `#' in expression
>> sparc-linux-ld:./arch/sparc/kernel/vmlinux.lds:1: syntax error

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
