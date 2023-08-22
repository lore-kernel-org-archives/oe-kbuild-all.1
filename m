Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8A16FCB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 07:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692689382; x=1724225382;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ohum3HgR4A6S1KRF5nc3k+rmwZ28BqoywMXV0IExtvw=;
  b=YqDqDX5KqXkEi9nozjXh1KcvgVRQe7oC43GV1TmfC+/XU9B3ccBzk8CM
   7El+I3hTPRtKICTpVh3mNFCtBc83jTQEb+4uGvsHokaB0Wzqk5Fj2f8sZ
   6E0qYRRYU6ePoK1jfi77PNQJ4+K2EblqHWTOhv2DGsHJLEnXFGtjHbhmY
   msruOuvICKRRA563KBWllsXai6YfjANrbFRDrarUkbAB5g5nRvc5+4/iQ
   bp8OnmNvGRJc6QRN4Sx/kJhhE3ufVlpMW4rVTuEnuqUcoZu7InNf+5sic
   htyj7NBL3kTn/RmjQHiZiPPSRExQxG/zkKH0kVqjEzRvJ3OuAaxNWxsAv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="373777850"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="373777850"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 00:28:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="806182313"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="806182313"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2023 00:28:03 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYLnx-0001Vs-1k;
	Tue, 22 Aug 2023 07:27:58 +0000
Date: Tue, 22 Aug 2023 15:27:24 +0800
From: kernel test robot <lkp@intel.com>
To: Tony Lindgren <tony@atomide.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [linux-stable-rc:linux-4.19.y 6826/6829]
 drivers/bus/ti-sysc.c:982:15: error: implicit declaration of function
 'sysc_read_sysconfig'
Message-ID: <202308221531.rpG2Hk0q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.19.y
head:   29f196d64edee575367dbe1930b34e98f1a985d3
commit: f1f94310e05a57f1968ecb070625bba1066c84d0 [6826/6829] bus: ti-sysc: Flush posted write on enable before reset
config: arm-randconfig-001-20230822 (https://download.01.org/0day-ci/archive/20230822/202308221531.rpG2Hk0q-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308221531.rpG2Hk0q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308221531.rpG2Hk0q-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/bus/ti-sysc.c: In function 'sysc_reset':
>> drivers/bus/ti-sysc.c:982:15: error: implicit declaration of function 'sysc_read_sysconfig' [-Werror=implicit-function-declaration]
     982 |         val = sysc_read_sysconfig(ddata);
         |               ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/sysc_read_sysconfig +982 drivers/bus/ti-sysc.c

   959	
   960	static int sysc_reset(struct sysc *ddata)
   961	{
   962		int offset = ddata->offsets[SYSC_SYSCONFIG];
   963		int val;
   964	
   965		if (ddata->legacy_mode || offset < 0 ||
   966		    ddata->cfg.quirks & SYSC_QUIRK_NO_RESET_ON_INIT)
   967			return 0;
   968	
   969		/*
   970		 * Currently only support reset status in sysstatus.
   971		 * Warn and return error in all other cases
   972		 */
   973		if (!ddata->cfg.syss_mask) {
   974			dev_err(ddata->dev, "No ti,syss-mask. Reset failed\n");
   975			return -EINVAL;
   976		}
   977	
   978		val = sysc_read(ddata, offset);
   979		val |= (0x1 << ddata->cap->regbits->srst_shift);
   980		sysc_write(ddata, offset, val);
   981		/* Flush posted write */
 > 982		val = sysc_read_sysconfig(ddata);
   983	
   984		/* Poll on reset status */
   985		offset = ddata->offsets[SYSC_SYSSTATUS];
   986	
   987		return readl_poll_timeout(ddata->module_va + offset, val,
   988					  (val & ddata->cfg.syss_mask) == 0x0,
   989					  100, MAX_MODULE_SOFTRESET_WAIT);
   990	}
   991	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
