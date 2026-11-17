Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794895686;
	b=igRr1dcQ96fKahYRShdSRkQa6st4gaeeFS/dKnV6PstzwLQ7K9nQCu3w9fmKGvX6RFrP
	 lqz+knwDkJDwmzGxY5RQgFHomFym1SC2kYtLRNiUgU14vxckJYr/Y0a/lMsi+v8Nz3oAP
	 9mA/TeWHn8QRYrtCX6tf7Tg7oLj1a2+ldHd16JGvX3elPKFONSdJ4taEAzgd2pB6wsBow
	 voev//vlK0165ah0RPlfhQOedjZ67/f6yai3QyXOcy3LVthqQtxmB03i9ERkHRNf0xiwK
	 0+A1CfK24f0SzTlGLu45PUdNKxNbsrVVmSo7l9sT7y93QkwLhqqnyXwTRz0aEhYsiDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794895686;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=iHmMeb9CQS5ee+r3BwbpkSCNOhoJDI8Lrg4z786Ur3s=;
	b=PuTEO42TUxe86a4SH5WqTHvpJDXBDQrhJbt3OD6xzakuY51nxGz64QnmD+/O/TbuNjr5
	 0VAAUtkGmhagVS8hFJNyeE1gQLS5BWFscDWkQEejQegjkjBvfGqA7/WG7Y/xccvZmriPz
	 p1DFMyIN+tuA4BgHRPIja9TvbB6TUe7ufCJC3IWTLoZgzbOnlDzds40R5/1t6gKUmelW5
	 OqoJERtn8bmDL76i6eoA41m8dmhpdxFnn1bZ5OgIho0GEx9KlC3vWSL0V//18gpwGkXpa
	 o8WF3rMG1Sr2Mu6Y08w75n0mY8QXg5dDb1PHn8zkWyPmDuK79QplU3+9mPDTC1jnjMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ls0qfN44;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF8B606A31C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Nov 2026 06:08:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBF8B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ls0qfN44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794895686; x=1826431686;
  h=date:from:to:cc:subject:message-id;
  bh=XHf6n3G3PTu1nx6HsIT9wrHNoFhVDvnqoZC8M7B3qPk=;
  b=Ls0qfN44niYKyUHCiexmXfYdR7c0qMTX2reei7eDPKY8I4njcLvr0ywJ
   JoQXDbqPX6PnC3JKLvVpZTqt2wq8mWlrkqObSZ9dWAFI8drjTeztMyjXR
   RQQcA9yaj4MLsafEFNUs9fbAAI+4KrIQY9pQqNSoXjfVBAfas2fE/mwmK
   X6TuGVlfEUQWwPzbL7SH/R7trL4O0jKzFSCnvcaF6Mirxf2YVfJdOd6WS
   BfNa3NfMPkn7mOeNEkdEDAVvOOtWoTBsmAqRpKfGLlNz4aasNpLrvMB0a
   aGpaSXVuURA1L/FmtgCqfqCZA0P5RFyUEqVuZcaTO7PN8Z2MQIH2HJtH6
   w==;
X-CSE-ConnectionGUID: p/iZy0pBTJ27vdZTuITCxg==
X-CSE-MsgGUID: t7/tg1GcR7+ndZGXA6vGnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3650600"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3650600"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 22:08:06 -0800
X-CSE-ConnectionGUID: IUiNqerCR6C/jutIABBQmg==
X-CSE-MsgGUID: Abi1xfv/QwG5xetZqOEFGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9675225"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 16 Nov 2026 22:08:04 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTCMH-000000002zK-3tN3;
	Tue, 17 Nov 2026 06:07:57 +0000
Date: Tue, 17 Nov 2026 07:07:38 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15-2025-10 1/1]
 kernel/gki_module.c:31:6: warning: no previous prototype for function
 'gki_is_module_unprotected_symbol'
Message-ID: <202611170650.ODKTqCqC-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Ramji,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-5.15-2025-10
head:   f320c8310447d620f4caf1708c90df93e8e4a88f
commit: e7451150cb701de01d6b836c496e1bd012d885cd [1/1] ANDROID: GKI: Add module load time symbol protection
config: arm-randconfig-r2102-20261117 (https://download.01.org/0day-ci/archive/20261117/202611170650.ODKTqCqC-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 7864c0736a8a09670dfbfc513f1e9649799f2486)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/202611170650.ODKTqCqC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611170650.ODKTqCqC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:80:
   include/linux/compiler-clang.h:24:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      24 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:370:9: note: previous definition is here
     370 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> kernel/gki_module.c:31:6: warning: no previous prototype for function 'gki_is_module_unprotected_symbol' [-Wmissing-prototypes]
      31 | bool gki_is_module_unprotected_symbol(const char *name)
         |      ^
   kernel/gki_module.c:31:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      31 | bool gki_is_module_unprotected_symbol(const char *name)
         | ^
         | static 
   2 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]


vim +/gki_is_module_unprotected_symbol +31 kernel/gki_module.c

    25	
    26	/**
    27	 * gki_is_module_unprotected_symbol - Is a symbol unprotected for unsigned module?
    28	 *
    29	 * @name:	Symbol being checked in list of unprotected symbols
    30	 */
  > 31	bool gki_is_module_unprotected_symbol(const char *name)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
