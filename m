Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA8E30D1A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 22:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e4tNY1nw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697496524; x=1729032524;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GgG/KDA7OmWgTcOnoRfZwZEp7oHaE7QRfz8XpazpfW0=;
  b=e4tNY1nwnirLzjMZYJY+vYvsr/0ZddQph4fCalx/d+e1TVNwEjv0j9zf
   qgg4UPrgdlSJLdKqsKFTT8drpFUCcncx7XhO5q+UIJqLtapU8LvT8PBaq
   8useAxSt6DSP6qqI+KJefdZl1bZDF/SVWbwDnEGeW1Si6P6g4KpjFReSx
   L8IDRIk1cZZzNB0gtJgJL5tWsH8DkslrFZT3Cnb9NYEoYvXgk73R3I3gu
   CRhlaLZwXaeBdogfowJ7TjqaMlBxPwrObFTnlTm3J0Zi3WhvFBL2sp20z
   6P6I1XMvO58m3FSfY7wZ0YpSag6fkiQe7lLz0QxfwNdYlKokfCI7JZxg+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="370727522"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="370727522"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 15:48:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="1003118867"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="1003118867"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 16 Oct 2023 15:47:53 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsWNK-0008jP-3A;
	Mon, 16 Oct 2023 22:47:50 +0000
Date: Tue, 17 Oct 2023 06:46:58 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 3332/15768]
 ./usr/include/linux/imx_vpu.h:22:1: error: (this will be reported only once
 per input file)
Message-ID: <202310170631.Ssgh1hwG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   3f41fbe42851375d3d5996e4bf9e9809e6c79517
commit: b82c78d77f16b30cffdd304eb2c6c1a3ab4f68ba [3332/15768] arm64: imx8mx: vpu: add vsi v4l2 decoder and encoder
config: i386-randconfig-011-20231017 (https://download.01.org/0day-ci/archive/20231017/202310170631.Ssgh1hwG-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231017/202310170631.Ssgh1hwG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310170631.Ssgh1hwG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./usr/include/linux/imx_vpu.h:17:0,
                    from <command-line>:32:
   usr/include/linux/videodev2.h:2437:20: error: field 'timestamp' has incomplete type
     struct timespec   timestamp;
                       ^~~~~~~~~
   In file included from <command-line>:32:0:
   ./usr/include/linux/imx_vpu.h:22:1: error: C++ style comments are not allowed in ISO C90
    //ctrls & extension ctrls definitions
    ^
>> ./usr/include/linux/imx_vpu.h:22:1: error: (this will be reported only once per input file)
   ./usr/include/linux/imx_vpu.h:111:8: warning: extra tokens at end of #endif directive [-Wendif-labels]
    #endif //#ifndef __LINUX_IMX_VPU_H
           ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
