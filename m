Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9F8156D8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 08:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gK/7Wxl9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697617888; x=1729153888;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NuAPbUELjVAv7bL8CkQq8NEiuP+be/VEm/6FrRrfMhY=;
  b=gK/7Wxl9Pvfjz2W15+19offK+M8WtmkF0BtWTv0/efnv2sbua/tA1eSf
   30JRQWU72k90AjTpaK6kXxSh4YhQZnDuYZoIisacAK+vgWnuRlbVn4Uxd
   60Y9f71WcxvwuPG2Nmib65qX7Ks0z7ycfuqA4RO+w66qx+EZ4lIvJXbCJ
   tU1hW15L+7vESp1NA5PF3K1KmjdZtyjCqTyBmJM1Sgz2oC7o3DU5qrniT
   FXO63iMG286s7q05K1iem3y4POyQ30IpeQLH6wwA/EB3+ML1IlSJOlT2p
   slD6e+j67kRId8y50gL9zTvPqZlZoqbtqvQwOJZpVD6Q7EXzSJ8NLbMRm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="385801402"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="385801402"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 01:31:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="791537279"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="791537279"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 18 Oct 2023 01:31:27 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qt1xc-00007o-2T;
	Wed, 18 Oct 2023 08:31:24 +0000
Date: Wed, 18 Oct 2023 16:30:51 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Walle <mwalle@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mtd:spi-nor/next 12/44] checkpatch: ERROR: space prohibited after
 that open parenthesis '('
Message-ID: <202310181614.88KFdbId-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-nor/next
head:   6823a8383420263bc061865027836755615a275f
commit: 95c6e3d26691d9144bfa3cdb95962bdb24d98905 [12/44] mtd: spi-nor: introduce (temporary) INFO0()
reproduce: (https://download.01.org/0day-ci/archive/20231018/202310181614.88KFdbId-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310181614.88KFdbId-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:SPACING: space prohibited after that open parenthesis '('
#73: FILE: drivers/mtd/spi-nor/micron-st.c:275:
+	{ "m25p05-nonjedec",  INFO0( 32 * 1024,   2) },

ERROR:SPACING: space prohibited after that open parenthesis '('
#74: FILE: drivers/mtd/spi-nor/micron-st.c:276:
+	{ "m25p10-nonjedec",  INFO0( 32 * 1024,   4) },

ERROR:SPACING: space prohibited after that open parenthesis '('
#75: FILE: drivers/mtd/spi-nor/micron-st.c:277:
+	{ "m25p20-nonjedec",  INFO0( 64 * 1024,   4) },

ERROR:SPACING: space prohibited after that open parenthesis '('
#76: FILE: drivers/mtd/spi-nor/micron-st.c:278:
+	{ "m25p40-nonjedec",  INFO0( 64 * 1024,   8) },

ERROR:SPACING: space prohibited after that open parenthesis '('
#77: FILE: drivers/mtd/spi-nor/micron-st.c:279:
+	{ "m25p80-nonjedec",  INFO0( 64 * 1024,  16) },

ERROR:SPACING: space prohibited after that open parenthesis '('
#78: FILE: drivers/mtd/spi-nor/micron-st.c:280:
+	{ "m25p16-nonjedec",  INFO0( 64 * 1024,  32) },

ERROR:SPACING: space prohibited after that open parenthesis '('
#79: FILE: drivers/mtd/spi-nor/micron-st.c:281:
+	{ "m25p32-nonjedec",  INFO0( 64 * 1024,  64) },

ERROR:SPACING: space prohibited after that open parenthesis '('
#80: FILE: drivers/mtd/spi-nor/micron-st.c:282:
+	{ "m25p64-nonjedec",  INFO0( 64 * 1024, 128) },

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
