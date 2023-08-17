Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CF41549E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 16:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692289223; x=1723825223;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9Zybj5Tc+uGM+YKHjM3lt3KbLa7PQOH2rBxWt+QQQik=;
  b=j2LjRBp4/X1mj2Mg8n4WqgcNLG6CF5df9nAQYPxFap6W38ZQUMryPGfz
   TVl+cTe18TKpAa9F1KRpWOkNCtUd4KbUX+SFSGqe0fX6Gi+a1oP13zX2z
   +C1nvlOIH5lzB2Vw4Udl+XD9FJvCgvGGcJoZMce2EgtMO71wTFu5WRQfi
   SpPbp2tcgCH29TiYuyaoE0UuPHcPxfasO+SRiMtLi2f417LQeBDvux4ZR
   1GVa4kqiRz7OhZRgbhpsy+UBh15PnjC8nmd5OaWTwcwYXAjmDyGBD8qYn
   1EnzHTmP3/FL5x06PqkxuFK+JkFu+G8tPmqizLna/QEYCRRWWVgsFmQb0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="371760723"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="371760723"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 09:19:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="878295693"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 17 Aug 2023 09:19:33 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWfia-0001Jd-2s;
	Thu, 17 Aug 2023 16:19:28 +0000
Date: Fri, 18 Aug 2023 00:18:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 2/2]
 drivers/usb/common/usb-conn-gpio.c:55: warning: Function parameter or member
 'initial_detection' not described in 'usb_conn_info_vendor'
Message-ID: <202308180044.43yLApP8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   b9b42d6732eadcfa713c54e0c6e3d98741a08432
commit: e77972189dd10a39cbaf3803ed62183681642c2b [2/2] BACKPORT: FROMGIT: usb: common: usb-conn-gpio: Prevent bailing out if initial role is none
config: i386-randconfig-i052-20230817 (https://download.01.org/0day-ci/archive/20230818/202308180044.43yLApP8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308180044.43yLApP8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308180044.43yLApP8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/common/usb-conn-gpio.c:55: warning: Function parameter or member 'initial_detection' not described in 'usb_conn_info_vendor'


vim +55 drivers/usb/common/usb-conn-gpio.c

    46	
    47	/**
    48	 * struct usb_conn_info_vendor - contains parameters without modifying the format of usb_conn_info
    49	 * @info: contains usb_conn_info structure reference
    50	 * initial_detection: bool to check if it's initial detection after probe
    51	 */
    52	struct usb_conn_info_vendor {
    53		struct usb_conn_info info;
    54		bool initial_detection;
  > 55	};
    56	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
