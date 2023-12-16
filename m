Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9EB3528B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Dec 2023 04:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cZcBdGZI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702700582; x=1734236582;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FR+E2VTSs6aHAjS10LHYJ8O5ptbXc+xcO2/G4fDoHSU=;
  b=cZcBdGZINVFn+Nw1AK34KaX70R9XAty7Er+wYcMbS53ECdSLQfHVo0tV
   CywPuOxgiii0TPZUO7GPI7GuTBeztsrZZG5NWEmF5EmxVz84C4pKdwHfo
   3oJqYiBHrZIlOzo4SGFgr0B+Pxr8s9Iy2sE2UzaARfmdjbv6NfEdXRRyj
   DRAY3Xsn19pJmz49h1kYZ0/biS1MBxhIzXilSbVaGWiHwUoPVKHN/r4do
   APFqrw/gmdeo24AAuEKIfj0ltff4w8oQYYbKA/NbZ6KZakvmWJ7SDBJUB
   z90rZ8xe7eTLhsO1hb4l4eL+OczdVJHdNZ+J5noF9spz6Neihig7GvCz/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="375511084"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="375511084"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 20:23:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="23069229"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 15 Dec 2023 20:23:01 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEMCY-00019W-2D;
	Sat, 16 Dec 2023 04:22:58 +0000
Date: Sat, 16 Dec 2023 12:22:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 12/12] htmldocs: Warning:
 scripts/checkpatch.pl references a file that doesn't exist:
 D/../Documentation/dev-tools/checkpatch.rst
Message-ID: <202312161247.HeW8SPgW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   5ae6be03f52d1e9ea2b821fd5805681b062ea8ca
commit: 5ae6be03f52d1e9ea2b821fd5805681b062ea8ca [12/12] ANDROID: Snapshot Mainline's version of checkpatch.pl
reproduce: (https://download.01.org/0day-ci/archive/20231216/202312161247.HeW8SPgW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312161247.HeW8SPgW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: scripts/checkpatch.pl references a file that doesn't exist: D/../Documentation/dev-tools/checkpatch.rst
>> Warning: scripts/checkpatch.pl references a file that doesn't exist: Documentation/devicetree/bindings/writing-schema.rst
>> Warning: scripts/checkpatch.pl references a file that doesn't exist: Documentation/core-api/asm-annotations.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
