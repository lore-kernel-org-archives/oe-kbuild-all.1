Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81674642
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Feb 2023 22:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676759122; x=1708295122;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6bjEBtZlDehScpFksaK932hw0Ke8nPInwrTLonFyYcQ=;
  b=Tvk0yC2Xpd5eMUuAKG3MJh7uraxgeCVJvipgTJK/WwC1lG55rlx0Q4/W
   cnmfDRKJiWD0NrIprKnkqkGR0DWbnoiQafNOpwIquvlSduLeZabrcKBKs
   yNwQQH9PdKFv+7n9lwyzQfG0zkZzJxZWsRzimQuF/lbxGWIyXMIhOwO2u
   ONZyDp9H48gMgNdvKe2kCOG8eWcVWm/bcrSf8eDBLZhCFJWmUyyLZXkNK
   7tjv8UyUSBmJiL958H6F+BVYNMtAYnEZoTId2uG8wVkin/blKwtWaq1dn
   RXs7qZjsytmKclCjHrnU7zFVR76ykoW1mP6PMSk9ilDEkeReJRqQqnkUl
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="333568396"
X-IronPort-AV: E=Sophos;i="5.97,309,1669104000"; 
   d="scan'208";a="333568396"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2023 14:25:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="672975372"
X-IronPort-AV: E=Sophos;i="5.97,309,1669104000"; 
   d="scan'208";a="672975372"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 18 Feb 2023 14:25:21 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTVdr-000CoH-2b;
	Sat, 18 Feb 2023 22:25:15 +0000
Date: Sun, 19 Feb 2023 06:24:51 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [omap-audio:peter/linux-next-wip 14/49]
 sound/soc/soc-utils.c:243:34: warning: 'soc_dummy_ids' defined but not used
Message-ID: <202302190620.ryU6ZS0Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/omap-audio/linux-audio peter/linux-next-wip
head:   fafc4699b23203f885cef070f38bab20cb3840d5
commit: 719fb66af43bd0a82073d5fddfcfb95846cfe574 [14/49] ASoC: soc-utils: HACK: DT binding for snd-soc-dummy
config: x86_64-randconfig-a004 (https://download.01.org/0day-ci/archive/20230219/202302190620.ryU6ZS0Y-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/omap-audio/linux-audio/commit/719fb66af43bd0a82073d5fddfcfb95846cfe574
        git remote add omap-audio https://github.com/omap-audio/linux-audio
        git fetch --no-tags omap-audio peter/linux-next-wip
        git checkout 719fb66af43bd0a82073d5fddfcfb95846cfe574
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash sound/soc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302190620.ryU6ZS0Y-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/soc-utils.c:243:34: warning: 'soc_dummy_ids' defined but not used [-Wunused-const-variable=]
     243 | static const struct of_device_id soc_dummy_ids[] = {
         |                                  ^~~~~~~~~~~~~


vim +/soc_dummy_ids +243 sound/soc/soc-utils.c

   242	
 > 243	static const struct of_device_id soc_dummy_ids[] = {
   244		{ .compatible = "linux,snd-soc-dummy", },
   245		{ }
   246	};
   247	MODULE_DEVICE_TABLE(of, soc_dummy_ids);
   248	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
