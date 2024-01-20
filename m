Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1C93D7F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jan 2024 09:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705743221; cv=none; b=gLMwitJ76msBl82y5uGpvNvOFbeQRphFwp8WWj1MtJKOMCQgXWtE6ExQkPm4prpJ61hxEbI4QutFruTD+FDkf2LTNO2Y/jnu4SneVpU1x44QCGn0wnsmzwu22ptHAKCv5iR2xr3WEazZfzw4SVaaOE5QTRSO7914WsYm8cmJ3x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705743221; c=relaxed/simple;
	bh=kxJ2VUIOwmQEt8l73NnPyZLUZ7bLKbUCixUtYIgbY4g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jgljUqjyukcmQjLX6CmnfyF6XhGsPwcge6Hmfz2nz/OGsekVGMMO25BGkKRBN2m3ulccTf4qCmIeYyBfL2NyKd14ZGvn7NKdo5v+L4c/bk6FQK99G17Zi/Ns/Ah7D66KaPkPK30YMurMXSw/KlV/kAbcR5NT3xh2cojPv0/i8B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DdvrmB9O; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DdvrmB9O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705743219; x=1737279219;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kxJ2VUIOwmQEt8l73NnPyZLUZ7bLKbUCixUtYIgbY4g=;
  b=DdvrmB9OpJduJSyu14XIYr8KGOXqDGLhqfUnvmTCfkxZMPKBQf72W2Gl
   U6eqdZGiUk1u0+bbjuPCvExmWseQXtfdSoqt5nV8MiWjMOkyjrx33h7Ex
   rGkVZRrm3tNSEYC6pldQVZevXDwf3Q16v5WunauU1OSko/ka9bQBCmnlo
   XJnnW1mXycpmPgQDRWCHoBpojLZyF3cTWOeufO0dFGMU7mNG3z4bhXXDx
   l9ulO8iqzHzMvr/lUHPQujPd5lp9DirIELTaA8O3tZvSzNJmRGqMNf7/3
   8YqTf3IOuXaUSnTYp2ZGSRX/BCzmvxD497KKN6Jg/X961s+onLTvAT8lW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="8325976"
X-IronPort-AV: E=Sophos;i="6.05,207,1701158400"; 
   d="scan'208";a="8325976"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2024 01:33:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="788554685"
X-IronPort-AV: E=Sophos;i="6.05,207,1701158400"; 
   d="scan'208";a="788554685"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 20 Jan 2024 01:33:34 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rR7jI-0004xU-1X;
	Sat, 20 Jan 2024 09:33:32 +0000
Date: Sat, 20 Jan 2024 17:32:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 5626/30000]
 drivers/usb/typec/tcpm/tcpm.o: warning: objtool: run_state_machine()+0x370a:
 unreachable instruction
Message-ID: <202401201734.bET8TMg9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   0e2836ce690b97127589efde0178ebc0d6a918e4
commit: f694171a837e4dcc03b8e865c973dc3216961233 [5626/30000] ANDROID: usb: typec: tcpm: vendor hook for timer adjustments
config: x86_64-randconfig-013-20240120 (https://download.01.org/0day-ci/archive/20240120/202401201734.bET8TMg9-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401201734.bET8TMg9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401201734.bET8TMg9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/typec/tcpm/tcpm.o: warning: objtool: run_state_machine()+0x370a: unreachable instruction

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=m] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
