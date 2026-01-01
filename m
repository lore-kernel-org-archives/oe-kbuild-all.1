Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4787D2773C1
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jan 2026 10:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767265061; cv=none; b=RzhTFyHplPMsdFfcKyOY+mqwfhfGSI7tJuv/ochaPu8zVy+uA9TgDQR/KbC3mhvvRPv1piYeelhLq+GOiZ2FTpZS96/mWs6RZhJRy9wabDZ7OtfwS0L2ak05moGcB3bwG0Oz+YY2Jhu6IILSW8AuQcsSKE/SYnQa4QGSScF0xcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767265061; c=relaxed/simple;
	bh=4/Y/95A4yl+yo7KWDXJnZ1T8CoJjj/3FqJPs6m+nuk4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=h1TWnLoVXBEYQ+RyeNFb0p0cLE0euKA69vx/fBcthwfrct3n1K1gZuClVGGQe3hxZd5fmhlz3+I6N7Vfu6Hyu0aQuv117i74hnvzHom4b1DaX7JVXw2p8BIhdTQmkfQG6HEdZ/+RYP/FntPYYrFTLrH3hY9bJKoY9DyXQ54laPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fkdmIFgw; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fkdmIFgw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767265059; x=1798801059;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4/Y/95A4yl+yo7KWDXJnZ1T8CoJjj/3FqJPs6m+nuk4=;
  b=fkdmIFgwf3w3nB0h+pQllqBXInYc/wgCzbxGtQDtMCNSAl4vz6N+Q+mS
   FMoSZZWaTI+5D6T+B1nlbqFOUsg+KK4zIFLGI2+CHxqJUke2aKpLhselL
   2IJcCRDO6fCFFOWPZV48t0xdY1q7GDuxbKd66DhIM0HPikI0ppvfM06Nr
   5o0KukCJHeor03oi9eZhLfnsvaRqJnCHf7l2SH7fTZd1QXSCQJpRZYjzH
   SU64qw8EECnBmgxE2kSCjtrwAIuQWcQ7b3QoItaqys5jt/KKgujaN2/tU
   Fi23jhpv2egjd8fwdoexpePXoDVQmwLTQMe9eCP2vmlTAsuZjfypw7olM
   Q==;
X-CSE-ConnectionGUID: HVgfNp59SSabi62JHB7IoQ==
X-CSE-MsgGUID: p3pLsUTxR0mk/C7UPZ+r9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="71381562"
X-IronPort-AV: E=Sophos;i="6.21,194,1763452800"; 
   d="scan'208";a="71381562"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2026 02:57:39 -0800
X-CSE-ConnectionGUID: CYs+nNdMTwi6ObfoomlDjQ==
X-CSE-MsgGUID: F42/HKgqQ7a7ExSrZMrSiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,194,1763452800"; 
   d="scan'208";a="206664013"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 01 Jan 2026 02:57:37 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbGN5-000000001qD-0Rdc;
	Thu, 01 Jan 2026 10:57:35 +0000
Date: Thu, 01 Jan 2026 18:56:41 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-cached-prefix-godz 37/37]
 lib/dynamic_debug.c:1710:58: warning: left shift count >= width of type
Message-ID: <202601011817.iPamSk3Q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dd-cached-prefix-godz
head:   2597763afcfbb4385a1f14cba0e170ccd7a95e68
commit: 2597763afcfbb4385a1f14cba0e170ccd7a95e68 [37/37] dyndbg: optimized caching of dynamic prefixes
config: xtensa-xip_kc705_defconfig (https://download.01.org/0day-ci/archive/20260101/202601011817.iPamSk3Q-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260101/202601011817.iPamSk3Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601011817.iPamSk3Q-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/dynamic_debug.c: In function 'ddebug_prefix_key':
>> lib/dynamic_debug.c:1710:58: warning: left shift count >= width of type [-Wshift-count-overflow]
    1710 |                ((unsigned long)prefix_flags(desc->flags) << DDEBUG_PREFIX_KEY_FLAGS_SHIFT);
         |                                                          ^~


vim +1710 lib/dynamic_debug.c

  1706	
  1707	static unsigned long ddebug_prefix_key(const struct _ddebug *desc)
  1708	{
  1709		return ((unsigned long)desc & DDEBUG_PREFIX_KEY_ADDR_MASK) |
> 1710		       ((unsigned long)prefix_flags(desc->flags) << DDEBUG_PREFIX_KEY_FLAGS_SHIFT);
  1711	}
  1712	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
