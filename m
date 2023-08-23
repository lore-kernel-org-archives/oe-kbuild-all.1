Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B568C200C8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 23:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692831849; x=1724367849;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=scTCPzmkqBUsoMeuFSJsUtVJHjDwkg+fn+eXtGnAdFw=;
  b=asEFQe6hRWvX3tJ0JHHSA+PKE2Te9IxvXcXcXTKGB8PrcOvtUa2aJCfp
   m2+yH/Ka7SC3Bj/iNQzCjxlWH+K5oNE846JTXCF9cABf+FPuMU/TPoKjr
   KmtF7OfWTbozplXcdOkYIg4ZUVEh+QpP3BOk1TQbNbeW5qMESd3v/Ps0w
   9l7vOkN0KhAARFpEJXvdmIMRvgUMJ6fjPOwRvvQDhSvMvcHkoh//AMcCG
   kvSRMbWvMhLvPZiEpe8mT8FCvuwaJ5mwspNcGxPo+5SrvZ8ZCdD2sexwR
   uNo98czPw483jTFj9wTblNrVI2CV9rzZa4zmdCTFKei7fPn+bTAMyQuBQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="359279258"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="359279258"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 16:04:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="739946355"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="739946355"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 23 Aug 2023 16:04:04 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYwtP-0001ZO-2V;
	Wed, 23 Aug 2023 23:04:03 +0000
Date: Thu, 24 Aug 2023 07:03:44 +0800
From: kernel test robot <lkp@intel.com>
To: "rasheed.hsueh" <rasheed.hsueh@lcfc.corp-partner.google.com>
Cc: oe-kbuild-all@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>
Subject: [hverkuil-media-tree:for-v6.7b 14/14]
 drivers/media/cec/platform/cros-ec/cros-ec-cec.c:297:59: warning: missing
 braces around initializer
Message-ID: <202308240758.VCiD5k3B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git for-v6.7b
head:   421366e7841cb29e7050575e0ec21c99028b7fea
commit: 421366e7841cb29e7050575e0ec21c99028b7fea [14/14] media: platform: cros-ec: Add Boxy to the match table
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20230824/202308240758.VCiD5k3B-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308240758.VCiD5k3B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308240758.VCiD5k3B-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/cec/platform/cros-ec/cros-ec-cec.c:297:59: warning: missing braces around initializer [-Wmissing-braces]
     297 | static const struct cec_dmi_match cec_dmi_match_table[] = {
         |                                                           ^
   ......
     319 |         { "Google", "Boxy", "0000:00:02.0", "Port D" },
         |                                             {        }
>> drivers/media/cec/platform/cros-ec/cros-ec-cec.c:297:59: warning: missing braces around initializer [-Wmissing-braces]
     297 | static const struct cec_dmi_match cec_dmi_match_table[] = {
         |                                                           ^
   ......
     319 |         { "Google", "Boxy", "0000:00:02.0", "Port D" },
         |                                             {        }


vim +297 drivers/media/cec/platform/cros-ec/cros-ec-cec.c

cd70de2d356ee6 drivers/media/platform/cros-ec-cec/cros-ec-cec.c Neil Armstrong   2018-07-04  296  
cd70de2d356ee6 drivers/media/platform/cros-ec-cec/cros-ec-cec.c Neil Armstrong   2018-07-04 @297  static const struct cec_dmi_match cec_dmi_match_table[] = {
cd70de2d356ee6 drivers/media/platform/cros-ec-cec/cros-ec-cec.c Neil Armstrong   2018-07-04  298  	/* Google Fizz */
30e1350175c343 drivers/media/cec/platform/cros-ec/cros-ec-cec.c Reka Norman      2023-08-14  299  	{ "Google", "Fizz", "0000:00:02.0", { "Port B" } },
97733180fafbeb drivers/media/cec/platform/cros-ec/cros-ec-cec.c Zhuohao Lee      2021-12-21  300  	/* Google Brask */
30e1350175c343 drivers/media/cec/platform/cros-ec/cros-ec-cec.c Reka Norman      2023-08-14  301  	{ "Google", "Brask", "0000:00:02.0", { "Port B" } },
a1a9b71ebd6582 drivers/media/cec/platform/cros-ec/cros-ec-cec.c Scott Chao       2022-05-20  302  	/* Google Moli */
30e1350175c343 drivers/media/cec/platform/cros-ec/cros-ec-cec.c Reka Norman      2023-08-14  303  	{ "Google", "Moli", "0000:00:02.0", { "Port B" } },
f5d48ba2cae20c drivers/media/cec/platform/cros-ec/cros-ec-cec.c Ajye Huang       2022-06-10  304  	/* Google Kinox */
30e1350175c343 drivers/media/cec/platform/cros-ec/cros-ec-cec.c Reka Norman      2023-08-14  305  	{ "Google", "Kinox", "0000:00:02.0", { "Port B" } },
594b6bdde2e783 drivers/media/cec/platform/cros-ec/cros-ec-cec.c Rory Liu         2022-09-06  306  	/* Google Kuldax */
30e1350175c343 drivers/media/cec/platform/cros-ec/cros-ec-cec.c Reka Norman      2023-08-14  307  	{ "Google", "Kuldax", "0000:00:02.0", { "Port B" } },
46ff24efe04ac9 drivers/media/cec/platform/cros-ec/cros-ec-cec.c Zoey Wu          2023-02-23  308  	/* Google Aurash */
30e1350175c343 drivers/media/cec/platform/cros-ec/cros-ec-cec.c Reka Norman      2023-08-14  309  	{ "Google", "Aurash", "0000:00:02.0", { "Port B" } },
6f8cdfdf1c2cc7 drivers/media/cec/platform/cros-ec/cros-ec-cec.c Kevin Chiu       2023-03-07  310  	/* Google Gladios */
30e1350175c343 drivers/media/cec/platform/cros-ec/cros-ec-cec.c Reka Norman      2023-08-14  311  	{ "Google", "Gladios", "0000:00:02.0", { "Port B" } },
6f8cdfdf1c2cc7 drivers/media/cec/platform/cros-ec/cros-ec-cec.c Kevin Chiu       2023-03-07  312  	/* Google Lisbon */
30e1350175c343 drivers/media/cec/platform/cros-ec/cros-ec-cec.c Reka Norman      2023-08-14  313  	{ "Google", "Lisbon", "0000:00:02.0", { "Port B" } },
f437892f1507d6 drivers/media/cec/platform/cros-ec/cros-ec-cec.c Reka Norman      2023-08-14  314  	/* Google Dibbi */
f437892f1507d6 drivers/media/cec/platform/cros-ec/cros-ec-cec.c Reka Norman      2023-08-14  315  	{ "Google", "Dibbi", "0000:00:02.0", { "Port D", "Port B" } },
635a0f2b093bea drivers/media/cec/platform/cros-ec/cros-ec-cec.c Stefan Adolfsson 2023-08-16  316  	/* Google Constitution */
635a0f2b093bea drivers/media/cec/platform/cros-ec/cros-ec-cec.c Stefan Adolfsson 2023-08-16  317  	{ "Google", "Constitution", "0000:00:02.0", { "Port B", "Port A" } },
421366e7841cb2 drivers/media/cec/platform/cros-ec/cros-ec-cec.c rasheed.hsueh    2023-08-18  318  	/* Google Boxy */
421366e7841cb2 drivers/media/cec/platform/cros-ec/cros-ec-cec.c rasheed.hsueh    2023-08-18  319  	{ "Google", "Boxy", "0000:00:02.0", "Port D" },
cd70de2d356ee6 drivers/media/platform/cros-ec-cec/cros-ec-cec.c Neil Armstrong   2018-07-04  320  };
cd70de2d356ee6 drivers/media/platform/cros-ec-cec/cros-ec-cec.c Neil Armstrong   2018-07-04  321  

:::::: The code at line 297 was first introduced by commit
:::::: cd70de2d356ee692477276bd5d6bc88c71a48733 media: platform: Add ChromeOS EC CEC driver

:::::: TO: Neil Armstrong <narmstrong@baylibre.com>
:::::: CC: Lee Jones <lee.jones@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
