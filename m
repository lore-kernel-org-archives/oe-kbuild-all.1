Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA07866DF9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Sep 2023 20:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696018743; x=1727554743;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4j2tEmrozJ/i6EzTIaUHQbIk29lJP+xElZm/hRTx2R8=;
  b=m8A9QKfVE+mXJlNC7sibB2yar/IJmZhNaimsi9e+hp8xtY8ThAtgxrLR
   Ou6ttswiaPe3fTmJD0Kvx447iuNYng1d8Oe9bPOi9WY8rEYDzPH/XJ1c6
   nP24/n7KwSfA2aZbSwNtxRoFw15EDKfBZ1Z31i8GZayS5COvbaLFRNMZ/
   fxQYgy04VX0mri9i/+icplb/APkxI/LPfh67E//LbFjQhREPimrJqX2SL
   0SKn2u9EJbbS8JVZGx2+5lNUbRd9KbWAzDzfdt6iO1Zv0YwHnwMuZde+x
   BFXBcJpvRGm4cUDg/xYKX80uWMhvbDckibtu8SV0Pb7a0P5bIhaJZrEBD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="446515251"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; 
   d="scan'208";a="446515251"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 11:45:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="865782493"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; 
   d="scan'208";a="865782493"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 29 Sep 2023 11:45:29 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmIUQ-0003A9-2x;
	Fri, 29 Sep 2023 18:45:26 +0000
Date: Sat, 30 Sep 2023 02:45:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 9947/28554] htmldocs:
 Documentation/output/videodev2.h.rst:6: WARNING: undefined label:
 v4l2-ctrl-type-area (if the link has no caption the label must precede a
 section header)
Message-ID: <202309300253.YpzAzh9M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ricardo,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   a1b9dbe5628adf6bc61b5bb150dd2fb2b286fda0
commit: 7875a06b12b6e9978bb9cd25493b3f32d1891491 [9947/28554] UPSTREAM: media: add V4L2_CTRL_TYPE_AREA control type
reproduce: (https://download.01.org/0day-ci/archive/20230930/202309300253.YpzAzh9M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309300253.YpzAzh9M-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-ctrl-type-area (if the link has no caption the label must precede a section header)

vim +6 Documentation/output/videodev2.h.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
