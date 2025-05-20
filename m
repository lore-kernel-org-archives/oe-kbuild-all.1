Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922E221516E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 May 2025 21:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747776819; cv=none; b=WOYsJu08389LJgSwfXkk8t11MtpjfXUFAh0UpfkjN6/4nHGUdBb/2Ijt7kkIzAQlH4jvwHKfXHIyKc+XFXRK+oXuW6xjBPBCs8q0m0WMqdcg/bTw5GsMoR4FkNVW+iJ2jcm80mIOAs/OufLZHSv4xTzNxXIo6Xtza0vx/g2u/Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747776819; c=relaxed/simple;
	bh=3/PQtUS1P7ZRkgQpCu/8pOamFofB1EJCJ9AI9HGTcGw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pUAxTNlHnCFXb+zVO6KWCMbvD1e6Me9ORs5+w8ktOrwB+Ehe1sxPOmn8LU8YILNTdFCfM36xnYTIxv9JxBRgmPJ63MUFS5Wlwk7ACHQqmy/HjHdBrqU1jfgZdKBJW/XJAbWjbcd4Jcrj27QFVWnejiVIPHx2AVwY/HV0E1/B70c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OlulMgDu; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OlulMgDu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747776818; x=1779312818;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3/PQtUS1P7ZRkgQpCu/8pOamFofB1EJCJ9AI9HGTcGw=;
  b=OlulMgDusNmJOWX86XBJ4HGn6i4gCivFs8QmsQfDJyqI9lCoRl45vPmk
   pmKwdJoNEmJYT7+/bhOlUmy2VmnMqpAdWGZWii1L/pkKseNVbYx+pf4F0
   /BE8t0Gd+0GvziEZAGx+XvnT69bjXXzKhr45A3E4GdAJCtNbax75Qwb6Q
   CRui+0r7/uiQfnw3Jec0MiJusE0JN8IkEhT7goJwBKou3PL2aX3/XSfQ9
   oKsIpnqzhry/32ASp/fSgv4kW9hLGvaHDAb4HzmqpfWB2ZeM+ZQKk+h4Z
   VK7NF7KgOn+FvsnlXZspYK8mbxeHz4ooU9W5RBrqH3HW7V7Z6TCdLUI8L
   A==;
X-CSE-ConnectionGUID: YXitSQeNTzWlfhM+kT2ezA==
X-CSE-MsgGUID: Fmej6nPDTD6AIumKbNEuYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49886542"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49886542"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 14:33:37 -0700
X-CSE-ConnectionGUID: ZAZqewDUSIywdOb1O/0EPQ==
X-CSE-MsgGUID: O0AKkZxyRh2MUK8WEoAcow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="143811828"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 May 2025 14:33:35 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHUab-000NaS-0Q;
	Tue, 20 May 2025 21:33:33 +0000
Date: Wed, 21 May 2025 05:32:49 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>,
	Jann Horn <jannh@google.com>
Subject: [brauner-vfs:vfs.all 147/164] coredump.c:undefined reference to
 `sock_from_file'
Message-ID: <202505210501.fUplwjgn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
head:   5ddcb20f33155f900b7e42a09b412362cdb24529
commit: 997e88a74ed66cae9377f7095c5072a70fd70d4b [147/164] coredump: add coredump socket
config: powerpc-randconfig-002-20250521 (https://download.01.org/0day-ci/archive/20250521/202505210501.fUplwjgn-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505210501.fUplwjgn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505210501.fUplwjgn-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: fs/coredump.o: in function `do_coredump':
>> coredump.c:(.text+0x16a4): undefined reference to `sock_from_file'
   powerpc-linux-ld: coredump.c:(.text+0x16b4): undefined reference to `sock_from_file'
>> powerpc-linux-ld: coredump.c:(.text+0x16bc): undefined reference to `kernel_sock_shutdown'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
   Selected by [y]:
   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=y] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
