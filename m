Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F78A1383
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Feb 2023 08:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676967414; x=1708503414;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7VCVzcmXWabRsGAQmBprK2dI20+xIuFJ7vscCF4RNI0=;
  b=fC54kJNsVOG5tq/U5Nxl+bul2zJuwxr2tv0sTa58pQbISj9COlGa0w/5
   fRJhmo/gNYpIGff838pLDDwB6oArGj4z2i9U6MBjBa8RLeYburnT88+aY
   fU0D8g6VfG6BOI8aFF/bphkgAggSZj3+OzZnYkkPtKcecj965isR6FSov
   VHlQJaqmyXI+ew5hrn5VcvCpIhV6RNl1Qc4MZzvrPU6m8SfkErKJDZ8Or
   htbd0ekIutVpBHIOF0g1IsCVFv+kf7okwRntdplcrQwBgMA6T4fjwtE1p
   GsoOq51zx/3uA4COKzUPnKJOwpERYk3YRMEaheKvcAxGdZDEgD3ajpJz/
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="332580572"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="332580572"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 00:16:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="701921269"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="701921269"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 21 Feb 2023 00:16:52 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUNpT-000EZt-1p;
	Tue, 21 Feb 2023 08:16:51 +0000
Date: Tue, 21 Feb 2023 16:15:59 +0800
From: kernel test robot <lkp@intel.com>
To: Jai Luthra <j-luthra@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Rahul T R <r-ravikumar@ti.com>
Subject: [ti:ti-rt-linux-5.10.y-cicd 20965/22695] htmldocs:
 Documentation/output/videodev2.h.rst:6: WARNING: undefined label:
 v4l2-pix-fmt-srggi10 (if the link has no caption the label must precede a
 section header)
Message-ID: <202302211605.TPI865tC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jai,

FYI, the error/warning still remains.

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-5.10.y-cicd
head:   6051924999c0571e6f4fe813db135f05d4a8f0f5
commit: fa80761ddb51ee69efb493838865b1afd7b58afa [20965/22695] media: v4l: Add 10-bit RGBIr formats
reproduce:
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-5.10.y-cicd
        git checkout fa80761ddb51ee69efb493838865b1afd7b58afa
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302211605.TPI865tC-lkp@intel.com/

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
https://github.com/intel/lkp-tests
