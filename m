Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDD33588B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Dec 2023 18:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lEWZaZHO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702664299; x=1734200299;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rd0SF5jjfaQ/6h3w16iGKHaM23dfILksOsdY0t3iAao=;
  b=lEWZaZHOGgEBUhjv/EwW/ig+cKXJkisvQhMIrEos+hqMnpMRBbKYk9Su
   0vzgjjfhr8/YfwSKrJvWzqeSIyRCAOdFEpMp2i5oSHoPyt9G5bULdKr2m
   taqgJUpYd0eOTXvKjwivMKfACd8LT/Q7dk/V0emntmeW+Ceb/Af+dbtFC
   ivuE+vs8qoLa6Mx8axHlSAN7uM/FzNYt7X3heoVGCgdvp1vqrPPoVM2id
   uJxwktpe06wyRQlMmRAbWR3ejwmCdIOf+2SEaAxMNGLZcgUO0+ovwo/V2
   wf/DWzwP9rVHbQDr59Eu930EW/DsyoMkUn0eIHlrdDrcFM+NUhBozenU9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="399146941"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="399146941"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 10:18:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="22936310"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 15 Dec 2023 10:18:16 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEClJ-0000au-2X;
	Fri, 15 Dec 2023 18:18:13 +0000
Date: Sat, 16 Dec 2023 02:17:39 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Justin Stitt <justinstitt@google.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: scripts/kernel-doc: drivers/mailbox/zynqmp-ipi-mailbox.c:112:
 warning: Excess struct member 'ipi_mboxes' description in 'zynqmp_ipi_pdata'
Message-ID: <202312160211.TeTlhMq0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3f7168591ebf7bbdb91797d02b1afaf00a4289b1
commit: c5225cd073c65a6d7e8e311ec0114792a671982a mailbox: zynqmp: Annotate struct zynqmp_ipi_pdata with __counted_by
date:   10 weeks ago
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20231216/202312160211.TeTlhMq0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231216/202312160211.TeTlhMq0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312160211.TeTlhMq0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   scripts/kernel-doc: drivers/mailbox/zynqmp-ipi-mailbox.c:92: warning: Excess struct member 'irq' description in 'zynqmp_ipi_mbox'
   scripts/kernel-doc: drivers/mailbox/zynqmp-ipi-mailbox.c:92: warning: Excess struct member 'irq' description in 'zynqmp_ipi_mbox'
>> scripts/kernel-doc: drivers/mailbox/zynqmp-ipi-mailbox.c:112: warning: Excess struct member 'ipi_mboxes' description in 'zynqmp_ipi_pdata'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
