Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F46360
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 00:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EPKmp4g7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697156120; x=1728692120;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zwE4I5a7scaFKjxAyZAlvN8QBuyPeC6VvUHKzkVcXnQ=;
  b=EPKmp4g7eiguk7ImxZx0pd7Ptel2oPayw6gLWUxM6i7CjSgG2O2DifDg
   zYtJA4nulwdn3wmHslaP593jDEnq/qmuKcHYyxCwAXEd3Bu/hZoHQjDZ/
   N/zzRGckP3H0JLdTVeGad5Y7e/wckxel6HiPzDgb/IRs4IT4hV5Gajd5y
   goeP/pu26J00G6awV97kmihtlSmqc7vFKx6QIa5v4In55K0rikRjYC54/
   N1LoR9qn5oFEGJbWxjRrd7v+YqgQNIk2aPLKclXLz2jG79CnKrGKauJTD
   HCMs3k+z4ccM8ZjAftEycgNgxJlOGLQblHthN8RA8ddbZaGL/yu/TNrmX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="387925654"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="387925654"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 17:15:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="1001717720"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="1001717720"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 12 Oct 2023 17:15:17 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qr5pj-00046h-0d;
	Fri, 13 Oct 2023 00:15:15 +0000
Date: Fri, 13 Oct 2023 08:14:16 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 96/15768]
 drivers/soc/imx/secvio/imx-secvio-audit.c:11:5: warning: no previous
 prototype for 'report_to_audit_notify'
Message-ID: <202310130851.YAnTL5tV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Franck,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   3f41fbe42851375d3d5996e4bf9e9809e6c79517
commit: cd9683884471cc5198c0d1ca3098a52606f89c44 [96/15768] SSI-87: soc: imx: secvio: Report to audit FW all security violations
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20231013/202310130851.YAnTL5tV-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310130851.YAnTL5tV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310130851.YAnTL5tV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/imx/secvio/imx-secvio-audit.c:11:5: warning: no previous prototype for 'report_to_audit_notify' [-Wmissing-prototypes]
      11 | int report_to_audit_notify(struct notifier_block *nb, unsigned long status,
         |     ^~~~~~~~~~~~~~~~~~~~~~


vim +/report_to_audit_notify +11 drivers/soc/imx/secvio/imx-secvio-audit.c

    10	
  > 11	int report_to_audit_notify(struct notifier_block *nb, unsigned long status,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
