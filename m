Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9CCD53C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 20:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NB27/8z1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697143347; x=1728679347;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iXbl7kywZS7Z5LwYONeIYaHTMO8mrD/mJGSeoczr8/E=;
  b=NB27/8z1vZ7aAFz3C8WwdPPEfhkNhwfSGY3t448DSkD1+am0X5/W85Kg
   UzW+jFgDsPSJaobDRywPpxGmPVHdvuObNtdJYS3y0/S3kh7GLJBKAqBw3
   OfFccIdYVgDYzdDPefBsq2blE7dGeHc6XKOG9SKOBajZSmFwmblGkjKZG
   kAJaJwI8PuazAnMlyfqQpjL71GX6ets8kh2YyNkj4wLlSY90ZstLdZyEy
   gRFKrXhtvo0P5RgG2XrXfioNVyHFtsZMuAH9Y5q5DGz2a2rVMvE5q+N2M
   0JcQ5O+tPXbm9e4g5QkSsHjMWjuUp+q/ummSbAMasmSCTGlBm7d09MBOK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="375385854"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="375385854"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 13:42:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="824755408"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="824755408"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 12 Oct 2023 13:42:05 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qr2VP-0003rd-2N;
	Thu, 12 Oct 2023 20:42:03 +0000
Date: Fri, 13 Oct 2023 04:41:32 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sound/speaker-safety 175/196] checkpatch: WARNING: else
 is not generally useful after a break or return
Message-ID: <202310130413.n3uzPBzq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux sound/speaker-safety
head:   899711ed1c90b438d31e322d1b0638b328435963
commit: de02b1c16afa8ed1c1e414b2bdcd23066cb3a015 [175/196] ASoC: macaudio: Sense improvements
reproduce: (https://download.01.org/0day-ci/archive/20231013/202310130413.n3uzPBzq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310130413.n3uzPBzq-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:UNNECESSARY_ELSE: else is not generally useful after a break or return
#54: FILE: sound/soc/apple/macaudio.c:506:
+			return 0;
+		} else {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
