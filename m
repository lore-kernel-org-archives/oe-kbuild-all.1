Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379C114008
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 14:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689775991; x=1721311991;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MboUnlj8rDGUkkE6TwFcXBs8/qnuILvnMchSY52DWkk=;
  b=n0s8Bo0AYt3WEIxaj2/gPCwbu5Ml5cZoGfMp7uJc8p1QYuWgLruXOTLa
   tdrVJAmFBujVqBgbHxFmFw3PmvJXzE8fE9WgXT9IYHmciRn48xmVr9q1s
   eAnHD9V8H3LNbI5fgNte/qAvKoKwkglGtp/IvpKhvR5jqWo2kXQTkAKf0
   mi4sMRM2eI/gZtMQOFkXpxhOO7F/ndYG5FW4blN67AlWfI4gstqQrlRMi
   FUHj/Rtupa8cMuEDoB84b5Aiqh+Lxpc6bEPk3AYp+SvKYa1NOzaXvH/hF
   fhFNAKEZ0lrXK6TG1K/3uM4OfvmepFrInRQxs/TUKsnlEsVE9eeyjuCgd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="366518481"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="366518481"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 07:13:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="759202079"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="759202079"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 19 Jul 2023 07:13:09 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qM7vQ-00050z-2L;
	Wed, 19 Jul 2023 14:13:08 +0000
Date: Wed, 19 Jul 2023 22:12:08 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.0.x-imx 96/12467]
 drivers/soc/imx/secvio/imx-secvio-audit.c:11:5: warning: no previous
 prototype for 'report_to_audit_notify'
Message-ID: <202307192222.vKLzgxiQ-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc 6.1-2.0.x-imx
head:   791ee62ff569635e685d84c09b2179f002c4e0bf
commit: cd9683884471cc5198c0d1ca3098a52606f89c44 [96/12467] SSI-87: soc: imx: secvio: Report to audit FW all security violations
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230719/202307192222.vKLzgxiQ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307192222.vKLzgxiQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307192222.vKLzgxiQ-lkp@intel.com/

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
