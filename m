Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC73410EF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jun 2023 23:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687045616; x=1718581616;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zUXGzInG+p6zmp+m0hVUSCzrcz8HzgUdgqa42BiQ/eU=;
  b=AvGlA6RS0xN6mXI65hq/v5WYTyX8zH3yvSCRJLNU3xpsxrv4PEYcJq1N
   Fn4tw5FoUnc+vrG2XzRvrAhahjg5/f7MEc8EsySrtgUUFY5/yYz7duchD
   HjIahVWAr3TzXRrDEmKdKwbH6EBkBg6zzo+prMm7upo64/H2DBDBsrW1v
   EpPl278JHPHwyChD4KPbElfuFa+XpmpsH8EXS+4Ohu80tltr0uQVwlOpB
   tMV3Kt2pvpzW9C3uxO4skcajIhTyW/pVHl+85OJNzycNumDAs9o07k2vh
   /lGMl3WiTUt6NC62g4LKmMmVGJl2tkPM85qF9apr8b9lNOmMTLU+o/twR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="425378349"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="425378349"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 16:46:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="663580661"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="663580661"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 17 Jun 2023 16:46:54 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAfd8-0003DQ-08;
	Sat, 17 Jun 2023 23:46:54 +0000
Date: Sun, 18 Jun 2023 07:46:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jai Luthra <j-luthra@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Rahul T R <r-ravikumar@ti.com>
Subject: [ti:ti-rt-linux-6.1.y 48/107] htmldocs:
 Documentation/output/videodev2.h.rst:6: WARNING: undefined label:
 v4l2-pix-fmt-srggi10 (if the link has no caption the label must precede a
 section header)
Message-ID: <202306180707.yzPer9dT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y
head:   409b8947dd9ba2a864c41ec645317eb14c33c123
commit: c27f22b5cb192251598d68f09cc7e76b849a477a [48/107] media: v4l: Add 10-bit RGBIr formats
reproduce: (https://download.01.org/0day-ci/archive/20230618/202306180707.yzPer9dT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306180707.yzPer9dT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-srggi10 (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-sgrig10 (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-sbggi10 (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-sgbig10 (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-sgirg10 (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-siggr10 (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-sgibg10 (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-siggb10 (if the link has no caption the label must precede a section header)

vim +6 Documentation/output/videodev2.h.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
