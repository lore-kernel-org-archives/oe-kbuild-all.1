Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515D13FDB
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Oct 2023 05:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OwYPqaKc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696569686; x=1728105686;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=6oK3KE9EI56/h46GKyd4eIFg3iFx98QpjRUAjdgOJ6U=;
  b=OwYPqaKcsj7REUKFdl3iIGwj+8yuJ0L6Jmdu7CHKiQxhqc0R24s9jFqS
   a3Ivh0d0vdjiSHjw76kTVIZH628508dTtFlNyaM0ZyNMpSBPLyWL3/CRr
   Ynf9+mWwOV1UJVvlJnP54IFpA1A59VA7DqN1qVgxklHAPnCMgsOCYvXIM
   81wc+Gh8PdVsqwSRTXSmXvJebIet9YzUZk8gEdoQbd1s8skOnRmvMlaZ+
   ZEbZ9igAEyWFKN4B+JGTH5GQ/V6jew8N3JsUtVL6JvbF4muwaCPTg8bDP
   I80CiBEquUyf2X4pKCTvdVtSMrNZATjH4YpBV26++SdQCCRi4NYSYIZ8H
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="363958906"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="363958906"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 22:21:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="787263450"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="787263450"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 05 Oct 2023 22:21:23 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qodH3-000MI0-0v;
	Fri, 06 Oct 2023 05:21:19 +0000
Date: Fri, 6 Oct 2023 13:20:33 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/030-misc 22/25] error: Found argument
 '--blocklist-type' which wasn't expected, or isn't valid in this context
Message-ID: <202310061325.vpov9CNz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Hector,

FYI, the error/warning still remains.

tree:   https://github.com/AsahiLinux/linux bits/030-misc
head:   f7be86af81952da85fb582282543ff60e076bc80
commit: 2dc7e1e94502d46de601eee15011c47b19883df8 [22/25] rust: Fix for new =
bindgen
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231=
006/202310061325.vpov9CNz-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8d=
fdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20231006/202310061325.vpov9CNz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310061325.vpov9CNz-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

>> error: Found argument '--blocklist-type' which wasn't expected, or isn't=
 valid in this context
   Did you mean =1B[32m--=1B[0m=1B[32mblacklist-type=1B[0m?

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
