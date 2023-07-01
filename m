Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4799C3C17
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Jul 2023 07:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688194923; x=1719730923;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b2tdZDijpkNbhOaoKT4z5wlvbzHwp1PIa7BELo0bGqo=;
  b=cW5aC7RfcLq5wNGSf9vGrsDNe1mj1RNwLV+9+64XhpKcE/weZLS/x6Ih
   DctYXn0leWd3Yo8oq/CKHLl1AJwoBmexMfktaY6QV3LQ7F8sRTLFBl1uo
   tm1tOAY0kcXRTaXdoZbHa/kvxgyOSb9YEIxklGvYpvQf0TTma4fU4VoSw
   a9UTb2qBKuofek/TVgZgFkoFoDlWrlyduqoJ10hK/XzTd0I958H2mcQ1u
   oo4/yR3GgyNB5xgIpzFS7SOplbUF63OsQR4OTwdCb8uMwwPXB4ZJic657
   abf9JPiWaF/QI44ElftEJxF5gvvJ/wZO3CNdBZDbR+6vVMqYlKkPOQ/aB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="360040595"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="360040595"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2023 00:02:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="783313192"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="783313192"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 01 Jul 2023 00:02:01 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFUcJ-000Fn3-31;
	Sat, 01 Jul 2023 07:01:59 +0000
Date: Sat, 1 Jul 2023 15:01:42 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [sailus-media-tree:metadata 7/7] htmldocs:
 Documentation/output/videodev2.h.rst:6: WARNING: undefined label:
 v4l2-fmt-flag-meta-line-based (if the link has no caption the label must
 precede a section header)
Message-ID: <202307011445.xI9djX6d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   acd95717f9d98767ad03e91b1b171352f9bcbaf9
commit: 028cb656529e4cd7e40b21b97b078d5fb7809eed [7/7] media: v4l: Support line-based metadata capture
reproduce: (https://download.01.org/0day-ci/archive/20230701/202307011445.xI9djX6d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307011445.xI9djX6d-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-fmt-flag-meta-line-based (if the link has no caption the label must precede a section header)

vim +6 Documentation/output/videodev2.h.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
