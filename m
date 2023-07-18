Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A653E17CE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jul 2023 04:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689653660; x=1721189660;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kDZGQAg2zavLYonD6ecWraJIxrcVXY3ewfm9jQsuaMc=;
  b=Rc7nYC2rJL8KU4DyS9b4ZZeKPKeju5SDMAcfKZmibS6QwOE1n0Dnlys4
   J7FcwdjCFlCWCtUM/4/Kgm7SwpwxgYUsSAUg2mdW303e6wyvgEnWoA1i5
   YY0tfK+1/T17b45Z5xdbdQDp3rqjJznajbl3MXJILCCxtY8y0gO7ywGVJ
   Otn41hxyEjddqyCLHVMo21LyddGdUmvMKBJnva9H4RgOMhmNFW36IqXCg
   T6Iu0ZtchcV4DZADnJWTY5q7KXCsCjVjVpazeCgcTdWdRvfbBjtJBAZzI
   fo2NtpTFlYW0gMpf01Xyh0WakSdog7dntrBeprg/Hv5eBBe1XgWeUWDXA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="429864891"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; 
   d="scan'208";a="429864891"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 21:14:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="673770014"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; 
   d="scan'208";a="673770014"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 17 Jul 2023 21:14:18 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLc6M-0000Bp-0W;
	Tue, 18 Jul 2023 04:14:18 +0000
Date: Tue, 18 Jul 2023 12:14:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 9947/27788] htmldocs:
 Documentation/output/videodev2.h.rst:6: WARNING: undefined label:
 v4l2-ctrl-type-area (if the link has no caption the label must precede a
 section header)
Message-ID: <202307181216.KJrdVEuv-lkp@intel.com>
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
head:   14e059a4e07a4298d9cb041a9f5dd4b7e19a039b
commit: 7875a06b12b6e9978bb9cd25493b3f32d1891491 [9947/27788] UPSTREAM: media: add V4L2_CTRL_TYPE_AREA control type
reproduce: (https://download.01.org/0day-ci/archive/20230718/202307181216.KJrdVEuv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307181216.KJrdVEuv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-ctrl-type-area (if the link has no caption the label must precede a section header)

vim +6 Documentation/output/videodev2.h.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
