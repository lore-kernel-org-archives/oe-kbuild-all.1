Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300E32F21
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 22:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676327500; x=1707863500;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0A55qNw5CK3qtXblWpzo2/JMgjc+NrM1185M9ypjNGY=;
  b=nqCo/F0/Z5g+dAS8faVMy4OpzZj8YW+edEtJizq69Z78nzWELwlYjYft
   4WG0LMKNse2a82VqPxneOt4p/qvxrqfhnD/p2WkfXzmnwrjfAFAtSMTFG
   R0PzzsJ9eEWeR6zdkTuZ0I6yvpMiSy+BKNZT25fWo0RRAFi9w2IDBJTqv
   vvmmpmR9A8Kf4kOh44hrKlampCeJLvfKoE2U25kLxhM8fzbI+hyPC22LS
   hSt3f77hvLq+jozPSdi1X6bzXuZutRxkU6XKdJYk3ax+iJ93x4isRURFD
   7S6orArelaOp6pME25d4hNLNw1zU5hJJqas658H9gBJFBNBdYubt3MkCj
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="331019942"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="331019942"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 14:31:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="732650848"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="732650848"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 13 Feb 2023 14:31:37 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRhMH-00083B-0r;
	Mon, 13 Feb 2023 22:31:37 +0000
Date: Tue, 14 Feb 2023 06:31:29 +0800
From: kernel test robot <lkp@intel.com>
To: Rohit Visavalia <rohit.visavalia@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, Michal Simek <monstr@monstr.eu>,
	Devarsh Thakkar <devarsh.thakkar@xilinx.com>,
	Vishal Sagar <vishal.sagar@xilinx.com>, linux-doc@vger.kernel.org
Subject: [pinchartl-media:muxed/2022.2/base 379/740] htmldocs:
 Documentation/output/videodev2.h.rst:6: WARNING: undefined label:
 v4l2-pix-fmt-yuv444p (if the link has no caption the label must precede a
 section header)
Message-ID: <202302140644.eDQ9OziI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rohit,

FYI, the error/warning still remains.

tree:   git://linuxtv.org/pinchartl/media.git muxed/2022.2/base
head:   e26621179c3b1834a1bb17e9a38e47238ac63bf5
commit: 1d0aa998d1cfa9ca6f660f00578ce11f93ab6a42 [379/740] media: v4l: Support 3 planar YUV444P 8bpc pixel format in contiguous memory
reproduce:
        git remote add pinchartl-media git://linuxtv.org/pinchartl/media.git
        git fetch --no-tags pinchartl-media muxed/2022.2/base
        git checkout 1d0aa998d1cfa9ca6f660f00578ce11f93ab6a42
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302140644.eDQ9OziI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-yuv444p (if the link has no caption the label must precede a section header)

vim +6 Documentation/output/videodev2.h.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
