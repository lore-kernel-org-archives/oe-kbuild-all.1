Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8B88F64
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 14:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692714903; x=1724250903;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8hEQ0b0pYitgrfBfPQiWZoUpuepMDtlghhgYroBLaBg=;
  b=ldZRSVi+wxfA6RFQucTChrQ3C52tq0J3ify946DhUwwuUIo/sNuJHsl6
   hsufjAiDDG7EGKRBDbywLJlV0OBtJrJTKKrsBvMwC79Uoe483NDjY0GgB
   xZtN5Bxmhs1AqJVnTnQ1bT1vPKk85Ku+3q8bQ3whu1E2ihO7tX7NQTx4J
   md+rf0iqX9BxDnE6u4Cn+jYhYCC0b9HWQ4gNcAFoN4V1yqumkPQmkuE30
   jsHp4M2B1GQYoGPe5TOBVtxnl3T8rvE2F9jg86+X64yeUXmbVI9RtkqUu
   bwEvxo4juAUp402Bm3jzVMuFX2DEf3EQmJwjul95K5UYGcZkERmLVtIN1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="437819088"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="437819088"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 07:35:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="801698694"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="801698694"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 22 Aug 2023 07:35:00 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYSTE-0000Fc-0M;
	Tue, 22 Aug 2023 14:35:00 +0000
Date: Tue, 22 Aug 2023 22:34:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 9947/28543] htmldocs:
 Documentation/output/videodev2.h.rst:6: WARNING: undefined label:
 v4l2-ctrl-type-area (if the link has no caption the label must precede a
 section header)
Message-ID: <202308222255.kGDdqKXw-lkp@intel.com>
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
head:   a14f43f0b97d279d50029fba7442bb4cd393089d
commit: 7875a06b12b6e9978bb9cd25493b3f32d1891491 [9947/28543] UPSTREAM: media: add V4L2_CTRL_TYPE_AREA control type
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308222255.kGDdqKXw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308222255.kGDdqKXw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-ctrl-type-area (if the link has no caption the label must precede a section header)

vim +6 Documentation/output/videodev2.h.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
