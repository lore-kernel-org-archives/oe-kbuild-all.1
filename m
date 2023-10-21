Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0822108
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 19:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="akGCepIp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697916503; x=1729452503;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ijecKiGvcCC/7Ta07ofvAhPFreTT79xIAlMSHsNvJOc=;
  b=akGCepIpmvNLVCZBd0TJtRgRW10NXWW63rWahi1amOKYDkUUlvW2aI8P
   JmdvtHv2xS2NjiR4dz4pcdCrvsuVecpyHq47mCdRB/tb5w9qdiHblN8yg
   0nCejUEUxTUMasspkMh4eM6MR5zcdmsIAsza8CU+Pibe4wOunshOjCDy6
   fJlt9y0atLTBGBCU7zKuv+aVMOYEWx9XIE/Zh8AussL+/THpRRSLSNTyc
   oiixEeoWlW96c26aHVURE2v/DxSZqLBmG9LwyGLeiATLh5qfPqhljNFfp
   L5nTWD02skaaL3N23/x8BKYYi4NKojJ14dWOSka+EVXISSDRIm73vodW9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="386466890"
X-IronPort-AV: E=Sophos;i="6.03,241,1694761200"; 
   d="scan'208";a="386466890"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 12:28:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="707533172"
X-IronPort-AV: E=Sophos;i="6.03,241,1694761200"; 
   d="scan'208";a="707533172"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 21 Oct 2023 12:28:21 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quHdz-0005BK-11;
	Sat, 21 Oct 2023 19:28:19 +0000
Date: Sun, 22 Oct 2023 03:28:15 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sound/speaker-safety 169/209] checkpatch: WARNING:
 Consider removing the code enclosed by this #if 0 and its #endif
Message-ID: <202310220339.ypjjhmUe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux sound/speaker-safety
head:   37f4315008c663a55629554adcfcae4e5d88fdc7
commit: fcda55ec19a54cb8d3a5956532c522d390d576a8 [169/209] ASoC: macaudio: Do not disable ISENSE/VSENSE switches on j314
reproduce: (https://download.01.org/0day-ci/archive/20231022/202310220339.ypjjhmUe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310220339.ypjjhmUe-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:IF_0: Consider removing the code enclosed by this #if 0 and its #endif
#22: FILE: sound/soc/apple/macaudio.c:927:
+#if 0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
