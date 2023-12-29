Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFC21426F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Dec 2023 21:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gOB9WpIv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703883829; x=1735419829;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uyHUxWJBb9FlkDrw/lWEVTx5EKzfYideq7z/4tSzAcY=;
  b=gOB9WpIvE7ryZ1Ze2k2KbeDEqwiMDF79egjjPn3Ck5+Wup+fvdQVBprC
   RVkzvOdBpJExwaX1fVKkN4CZHWwh0HkMGxgO4RaYKCy2grnSk7aIV1jRs
   w1XCfV0YXc1euszFGHiNMmEtn9y1hH6vQBALits4MraE7U7Be40vAU+f+
   2DBK5QNOTIZZ1aDnn8GlMvMWtpMneJDBpljmEFVry//j4t/dfbZBFD+L/
   obd4FQVsAiqvWCRWYi8ZrVW1VzJskg1MSCLXM8CZu3dsqrTMZcUZt0OZq
   zensz7TIm2hGt77ZF9dneKEeBlpsNIp/hxGpKCXZY5cGQ4b1n/6r1BYCc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="427843415"
X-IronPort-AV: E=Sophos;i="6.04,316,1695711600"; 
   d="scan'208";a="427843415"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2023 13:03:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,316,1695711600"; 
   d="scan'208";a="20633976"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 29 Dec 2023 13:03:46 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJK19-000Hoh-2f;
	Fri, 29 Dec 2023 21:03:43 +0000
Date: Sat, 30 Dec 2023 05:03:29 +0800
From: kernel test robot <lkp@intel.com>
To: Pranavi Somisetty <pranavi.somisetty@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Harini Katakam <harini.katakam@xilinx.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1 637/1369]
 drivers/staging/xilinx-tsn/xilinx_tsn_ptp_clock.c:46:16: error: implicit
 declaration of function 'in_be32'
Message-ID: <202312300557.Qn7tX7PE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Pranavi,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1
head:   cc7310fda242b85900cc805b028f2f21d1d8f210
commit: 03252b346d787210f709c33dc420d2e1bcb0f10a [637/1369] staging: net: xilinx: add Xilinx TSN driver
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20231230/202312300557.Qn7tX7PE-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231230/202312300557.Qn7tX7PE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312300557.Qn7tX7PE-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/staging/xilinx-tsn/xilinx_tsn_ptp_clock.c: In function 'xlnx_tod_read':
>> drivers/staging/xilinx-tsn/xilinx_tsn_ptp_clock.c:46:16: error: implicit declaration of function 'in_be32' [-Werror=implicit-function-declaration]
      46 |         nsec = in_be32(timer->baseaddr + XTIMER1588_CURRENT_RTC_NS);
         |                ^~~~~~~
   drivers/staging/xilinx-tsn/xilinx_tsn_ptp_clock.c: In function 'xlnx_rtc_offset_write':
>> drivers/staging/xilinx-tsn/xilinx_tsn_ptp_clock.c:58:9: error: implicit declaration of function 'out_be32' [-Werror=implicit-function-declaration]
      58 |         out_be32((timer->baseaddr + XTIMER1588_RTC_OFFSET_SEC_H), 0);
         |         ^~~~~~~~
   cc1: some warnings being treated as errors


vim +/in_be32 +46 drivers/staging/xilinx-tsn/xilinx_tsn_ptp_clock.c

    41	
    42	static void xlnx_tod_read(struct xlnx_ptp_timer *timer, struct timespec64 *ts)
    43	{
    44		u32 sec, nsec;
    45	
  > 46		nsec = in_be32(timer->baseaddr + XTIMER1588_CURRENT_RTC_NS);
    47		sec = in_be32(timer->baseaddr + XTIMER1588_CURRENT_RTC_SEC_L);
    48	
    49		ts->tv_sec = sec;
    50		ts->tv_nsec = nsec;
    51	}
    52	
    53	static void xlnx_rtc_offset_write(struct xlnx_ptp_timer *timer,
    54					  const struct timespec64 *ts)
    55	{
    56		pr_debug("%s: sec: %lld nsec: %ld\n", __func__, ts->tv_sec, ts->tv_nsec);
    57	
  > 58		out_be32((timer->baseaddr + XTIMER1588_RTC_OFFSET_SEC_H), 0);
    59		out_be32((timer->baseaddr + XTIMER1588_RTC_OFFSET_SEC_L),
    60			 (ts->tv_sec));
    61		out_be32((timer->baseaddr + XTIMER1588_RTC_OFFSET_NS), ts->tv_nsec);
    62	}
    63	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
