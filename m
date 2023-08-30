Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9226AA2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 18:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693420524; x=1724956524;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j9BJz0V47CUrE31aFDThaUJbURnyLcj7Mwg4S09eFnU=;
  b=US0DK4h374Cn8hIQGRKQttju4Rd7xysMQ4uxLHC7GdGts2wPwK1Q2U3T
   lS6uS8JBRZ9Tys/yKxNGaChN7BADHqTlZQLIQA42nDYWGdRHiCymYs4HI
   LzTEfUlTdoNkZGjSlHV26AoD5HA6K/7ZAXQepbct3WoAqzrw36P7gImSD
   f/s3EXFP9bm9AfERijv6ndqsb8oV2RGFi05NhE819yaA4cYjJ7EbP8nKU
   QfNQC+y1NaERAkQmQOBq0K+faO5EPmrgaeF8iZAF5jZwzKdD9c9F3jLQh
   0sQ1cWwB/C/VmtR4s3E8ehtxMdawJs8nYqe6LfkkkKE2ndyr1OhKdBlR+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="374633482"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="374633482"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 11:35:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="882846907"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 30 Aug 2023 11:35:27 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbQ2D-000A7U-0k;
	Wed, 30 Aug 2023 18:35:21 +0000
Date: Thu, 31 Aug 2023 02:34:17 +0800
From: kernel test robot <lkp@intel.com>
To: Apurva Nandan <a-nandan@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Jai Luthra <j-luthra@ti.com>
Subject: [ti:ti-rt-linux-6.1.y 69/107] drivers/media/i2c/imx390.c:864:34:
 warning: 'imx390_dt_id' defined but not used
Message-ID: <202308310254.KOeHa6JM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y
head:   dd944f14304d2ce6d26c9cdc3d2d2d6d373a322c
commit: 13b5770e2922ba2468a542463b6019a91bf9b29b [69/107] media: i2c: add Sony IMX390 driver
config: sh-randconfig-r005-20230831 (https://download.01.org/0day-ci/archive/20230831/202308310254.KOeHa6JM-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308310254.KOeHa6JM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308310254.KOeHa6JM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/imx390.c:864:34: warning: 'imx390_dt_id' defined but not used [-Wunused-const-variable=]
     864 | static const struct of_device_id imx390_dt_id[] = {
         |                                  ^~~~~~~~~~~~


vim +/imx390_dt_id +864 drivers/media/i2c/imx390.c

   863	
 > 864	static const struct of_device_id imx390_dt_id[] = {
   865		{ .compatible = "sony,imx390" },
   866		{ /* sentinel */ }
   867	};
   868	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
