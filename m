Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA2511737
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Sep 2023 12:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695992397; x=1727528397;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1nKjcckU2/fUNIse7MyXfxQgTHsvL2qGDBAzXLJDEjc=;
  b=LxnDYehRFY33IT4837Lnm8mEeHpXYMfGKXlTNMmrP+JdkgN2vc6DQ3Wi
   o1Nox7ruG+g/U5L79HPo+u00s8Frm2sIaLJp5icA/3v0Z7y+cfkyiPfi3
   69juWJvgcLYky6wymC0zF+8i6s0ZJypW8WqqP56gMo1vVNDU05XHp+0Pi
   p8RWi3LJR9yTSlDyQWdlBlI5VJj6U42L5DfTzxPuJlUa0OubWmjrskq5D
   TeF78kqx9YIxJIuUlbg3qImL+eWaGvbn+v58ZtE8IxbwhzfwGhohGrbkC
   RE95PHoO6sZwI5/g+1ae11VyyyOsDBMHLSAI0dNekiSwDEoed+HKmJEMp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="361670542"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; 
   d="scan'208";a="361670542"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 05:59:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="785082594"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; 
   d="scan'208";a="785082594"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 29 Sep 2023 05:59:06 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmD5E-0002rt-2T;
	Fri, 29 Sep 2023 12:59:04 +0000
Date: Fri, 29 Sep 2023 20:58:25 +0800
From: kernel test robot <lkp@intel.com>
To: Rohit Visavalia <rohit.visavalia@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Vishal Sagar <vishal.sagar@xilinx.com>, linux-doc@vger.kernel.org
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 306/1370] htmldocs:
 Documentation/output/videodev2.h.rst:6: WARNING: undefined label:
 v4l2-pix-fmt-x403 (if the link has no caption the label must precede a
 section header)
Message-ID: <202309292034.zKKGoqzo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   a19da02cf5b44420ec6afb1eef348c21d9e8cda2
commit: 00ea8c0b88977daedb8118d93fbba1d1f48e9350 [306/1370] media: v4l: Support 3 planar YUV 444 10bpc pixel format in contiguous memory
reproduce: (https://download.01.org/0day-ci/archive/20230929/202309292034.zKKGoqzo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309292034.zKKGoqzo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-x403 (if the link has no caption the label must precede a section header)

vim +6 Documentation/output/videodev2.h.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
