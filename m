Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BA8CA4B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Aug 2023 19:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692040370; x=1723576370;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KV4ijDd60O8GOvHsldkXLcTkS9rJnFy3Z+QzX2vRclA=;
  b=m3spo+80Kgd0/an+aO7P6crQixbgyPaHvl0lLFohNlD3jU0zuN7iRfbi
   6KqwMlnPIpveHb2CzuKHPSr5PyRR+cx8N8js+RNfdMiSuZZwI86uY4l0m
   gzNOhY+db5AyLsgC0dMQqDbJqpyTmG+Ldp2K/FA6R2drsX/VA5RMJntFO
   jLS+Xgp3U2eBtKCArF+14oVjJg1YEMayj+44tgPDrXP5RTDvODbkK6SJC
   S+8Csz3tYi21+EuilLkcRV20GEafm2Rft5ddUhqe1dJadqo+eXDgr0fr7
   F25yKRlbd3kLf7ubd5ibOtLDYwc8BKBa+kpKFnRTAt1wwtMfwBv74jCS7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="372112805"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="372112805"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 12:12:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="803555389"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="803555389"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 14 Aug 2023 12:12:48 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVczb-0000Mp-0t;
	Mon, 14 Aug 2023 19:12:44 +0000
Date: Tue, 15 Aug 2023 03:12:36 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [hverkuil-media-tree:for-v6.6l 18/18] htmldocs: Warning:
 Documentation/translations/zh_CN/video4linux/v4l2-framework.txt references a
 file that doesn't exist: Documentation/driver-api/media/v4l2-videobuf.rst
Message-ID: <202308150317.Z8jOOWgM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git for-v6.6l
head:   7408f9f1c272ca820c9f4c7c677ca8fde26779bf
commit: 7408f9f1c272ca820c9f4c7c677ca8fde26779bf [18/18] media: remove the old videobuf framework
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308150317.Z8jOOWgM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308150317.Z8jOOWgM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/translations/zh_CN/video4linux/v4l2-framework.txt references a file that doesn't exist: Documentation/driver-api/media/v4l2-videobuf.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
