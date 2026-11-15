Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794755886;
	b=vLqJXPRv/PhK71lQflhio387PquyIBub9fkEKpeGBWRtHC03ayA8zJ4dhgafD4p7hYsE
	 ucgNdytBahAaH7Ic8W2i2X0+EbVmDtKEEb5T7A6ZBOdXrI2zO3ubkgD7dxWrhijlbN36+
	 S/QcvHVziMicmXviHfNhn/Tx6pitAZRhNfC1qrGYdgZBA30JkC3fY/UhiY8RVkWOYlOP4
	 XPuyDH7ZubMfJxADu8U5Gom5ox0CZ0Wbdhd+JwU50/yb72Lc/Xh5uZaRZAa/C0Z1jxlhO
	 /UtcKCFk3Y5icWo4FX0Fpux+ijvnR2OdWxb/uTwHYGcM8BPdjo/qrUFgxERZ9rKuy3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794755886;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=eSaXgWhJv9BohitQoYJT3mQ1zGig318drobyrLKPtkE=;
	b=EoMtY0/ymjdE802WlHs6sT5fnyWVpT+2z8LD5xEi72mPjnlkVlyPafdwxce4c1QXiv01
	 jUjBU7eK2otj8i8ijruMPePBwODomtybVyFDlX7kYKrzd49hoom0NitJG7VwP/eM7e8bv
	 K3A8zMKHK5G2a2FdU8gVEEo3WxB7z2ydqciJYvWjggvN+6v7/sZBx+spgV5Iy6cj2h8Tg
	 sqtOw4p7MTWqKp36PXJfTbaZdcf5mhgQwOEflFmtX/V9nYVe5dPDOM80V+5JoqLqlXyyO
	 fVCaMj2imF+Y4AgLME2gNPwOQMseglQv96pXO+sP93sqXpMTXhzzLYKvdag9pztHwmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KoQfepqb;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AB5606A31E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Nov 2026 15:18:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4AB5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KoQfepqb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794755885; x=1826291885;
  h=date:from:to:cc:subject:message-id;
  bh=GezYodjnZC4+myitSnyZKg5vDWgWT1QXrGQamnsdzIo=;
  b=KoQfepqbj+KdBYXZFD1QEdoJGF4brOqehrm3RH68qtdz3Or4K314IHqN
   Wb+kFJG0MpOjnZ3f+NWOi9gs14u9QdrlqinClVkqXucQrX3+MT6R36mW2
   Bwl4CccONgYke1otmz+jqPrebdzm+q8/ETCn0pOd9zSebDw7bxsYKXw9T
   HUe84UJ8KdGuUmnyWqSfo6NyCYxzVriIE4PbjjoRQr3TF+5IY2irE9vUs
   jX8F8jKKkFmTmiNxgtIqNDAewNCXbQgapB8qgHk+OlUy7lnZ0lRd21V5F
   mQT5nA1WWhsLGvY9dcmfZVCAxAo6dmQX9AiFoRfVqUoPD6Pii1UgQGbfu
   w==;
X-CSE-ConnectionGUID: /heH0G6NR3G8edDi/v9mbw==
X-CSE-MsgGUID: PT6S3VBnQdqgM6n5E32OcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3391672"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3391672"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 07:18:05 -0800
X-CSE-ConnectionGUID: xrmdjkxkR16Dbzp4EeJziA==
X-CSE-MsgGUID: WfRWN3NHRFChsuJ0pRQryg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9416147"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 15 Nov 2026 07:18:02 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSbzT-000000002GW-2y2M;
	Sun, 15 Nov 2026 15:17:59 +0000
Date: Sun, 15 Nov 2026 16:17:03 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 3/3] kismet: WARNING: unmet
 direct dependencies detected for RESCTRL_FS_PSEUDO_LOCK when selected by
 X86_CPU_RESCTRL
Message-ID: <202611151614.qMcFb4IA-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   dc68b182b9f87e42548fb6ce886be612535b2116
commit: 6a17ffc470497d45d1824185813aecdb8fcf9062 [3/3] fs/resctrl: Add boiler plate for external resctrl code
config: x86_64-kismet-CONFIG_RESCTRL_FS_PSEUDO_LOCK-CONFIG_X86_CPU_RESCTRL-0-0 (https://download.01.org/0day-ci/archive/20261115/202611151614.qMcFb4IA-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20261115/202611151614.qMcFb4IA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611151614.qMcFb4IA-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for RESCTRL_FS_PSEUDO_LOCK when selected by X86_CPU_RESCTRL
   WARNING: unmet direct dependencies detected for RESCTRL_FS_PSEUDO_LOCK
     Depends on [n]: MISC_FILESYSTEMS [=n]
     Selected by [y]:
     - X86_CPU_RESCTRL [=y] && X86 [=y] && (CPU_SUP_INTEL [=y] || CPU_SUP_AMD [=y])
   
   WARNING: unmet direct dependencies detected for RESCTRL_FS
     Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
     Selected by [y]:
     - X86_CPU_RESCTRL [=y] && X86 [=y] && (CPU_SUP_INTEL [=y] || CPU_SUP_AMD [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
