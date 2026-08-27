Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82C9299922
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Aug 2026 16:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787847229; cv=none; b=JzMs8MXXxJKn2f8kPicpS8ZGs2pL7EsZ/p9vw/TnDhJ7OrCEKup6/4ijB5dGfGHSbP9bbw5FmK1VhgfnwIIbrmud0PMH5Cnh8YyL8IjypJI8QphRhBR0sOT50on3n/ZvOoqRZ/BCPDSpAXzHVGLZFQt4ia7kqMmqfB3+rIbg2TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787847229; c=relaxed/simple;
	bh=iEEfrVHf7NcjUkCDt0Khh5d9njPNFfitcZhIXLSkUFY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bsv78wqll/Wp+8wNo0zkskO+g4HkzJo3mg6ajqzP/P4kUNcbZ+e0vsEGalBJKuInRYsBJpka0F5u8Nynh/KzbGwtHnuMec1um8pWKl/XJCQR2Yn0LAaZuIgWYNJeYVmfuKmYFL4uZeXSMTiJfE+3CKdpFUrm7PlKpbTDNzJYLAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a3H1YIMz; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a3H1YIMz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787847228; x=1819383228;
  h=date:from:to:cc:subject:message-id;
  bh=iEEfrVHf7NcjUkCDt0Khh5d9njPNFfitcZhIXLSkUFY=;
  b=a3H1YIMzcQYzWEBeyEg36XPqC48i9GbvGsdzhA5pBT0r6vczvYzWv3HN
   G+LD5RzDaTlZUZavSUe3NVJPQ5bt5kbrr9B6i/6T78wCAHATQGxTfeE+t
   xqTt1Mt0TyFLc5b9DhdsrGwMCMzatKPN4HEe8DbDWHfIgrB8UZTQYCOos
   DDnBOYI1J0H8KA0HcOG4wg2p406YIHPtHOni/pbhCQVefog3eizr4T7qP
   lTMH6X50dtOOfvUKipWiHWQ+C6X8lMBYh6AqCDbyFilSypJOYwpMwHmKx
   sQSPkeYnGyz1m6elGgpuX0c8xNDWV/9Tr4RodDAQrhOuUd0B/kMUFTWTv
   g==;
X-CSE-ConnectionGUID: 00hhco3FQIi6QktVDUvJgQ==
X-CSE-MsgGUID: kx7AU4wpTMmeCzSlJr6AUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="105726691"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="105726691"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 09:13:47 -0700
X-CSE-ConnectionGUID: dKAW61u/RRCkhOkP5pPqaw==
X-CSE-MsgGUID: 7bDhIyk1QOSkwhkQo0WTrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="267943246"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 27 Aug 2026 09:13:47 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzcjY-000000000ov-17J8;
	Thu, 27 Aug 2026 16:13:44 +0000
Date: Thu, 27 Aug 2026 18:13:21 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 6/6] kismet: WARNING: unmet
 direct dependencies detected for ACPI_THERMAL_LIB when selected by
 GKI_HIDDEN_X86_CONFIGS
Message-ID: <202608271858.mUSrzvzl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   3b090ab3bf57f3728e7cd0cca1e5e0461d9a79a9
commit: 4bb372791d1e195cad530dce5005509564c27cc7 [6/6] ANDROID: GKI: x86: Enable ACPI thermal lib as x86 hidden
config: x86_64-kismet-CONFIG_ACPI_THERMAL_LIB-CONFIG_GKI_HIDDEN_X86_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20260827/202608271858.mUSrzvzl-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260827/202608271858.mUSrzvzl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608271858.mUSrzvzl-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ACPI_THERMAL_LIB when selected by GKI_HIDDEN_X86_CONFIGS
   WARNING: unmet direct dependencies detected for PHYLINK
     Depends on [n]: NETDEVICES [=n]
     Selected by [y]:
     - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for INTEL_TCC
     Depends on [n]: THERMAL [=n] && (X86 [=y] || X86_INTEL_QUARK [=n] || COMPILE_TEST [=y]) && X86 [=y]
     Selected by [y]:
     - GKI_HIDDEN_X86_CONFIGS [=y] && X86 [=y]
   
   WARNING: unmet direct dependencies detected for ACPI_THERMAL_LIB
     Depends on [n]: ACPI [=y] && THERMAL [=n]
     Selected by [y]:
     - GKI_HIDDEN_X86_CONFIGS [=y] && X86 [=y] && ACPI [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
