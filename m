Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B261874
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Nov 2023 20:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KtwtRRZP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700426309; x=1731962309;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3g/kBa9qBFW72dGUC38j4pWfQ0874xlG4OhFWH/ATow=;
  b=KtwtRRZPcMtvdvIEfcvCL9q4yQarDXopTAfDP6e4uM9omI67cm3LpfOV
   UCQlIvQ+LT4kpnLhNMIRE5cj/wgXI3BSTJSpjKJa8XeLDN4p12yzTqLLT
   lkjIDXMR5PE0G2jFGzzLggFiXrQcJcOAsnHvibjgK3B6+j6zTbDVAUlaZ
   mp7+GWPnuXT+g/3UxUVmx5rUUzonoOrXyNhCB9WRt6JzH4dp+rD7WEmmR
   KhHTXIsIqK1OsCE1Apz9Hg1N/ySDUQ8322UQyldj1w2bVezEh0PgEnZJC
   iAUVqdRWFEjSkLfSSCXMVbTTI786GTuVNXUMrqBqs9SoTDpSBhGUoWTlK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="376555381"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="376555381"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 12:38:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="7511239"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 19 Nov 2023 12:38:27 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4oYi-0005W1-2Y;
	Sun, 19 Nov 2023 20:38:24 +0000
Date: Mon, 20 Nov 2023 04:37:31 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: drivers/macintosh/windfarm_lm75_sensor.c:70:21: sparse: sparse: cast
 to restricted __le16
Message-ID: <202311200432.ia1Xs5Jj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   037266a5f7239ead1530266f7d7af153d2a867fa
commit: 748ea32d2dbd813d3bd958117bde5191182f909a macintosh: windfarm: Use unsigned type for 1-bit bitfields
date:   9 months ago
config: powerpc64-randconfig-r121-20231119 (https://download.01.org/0day-ci/archive/20231120/202311200432.ia1Xs5Jj-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231120/202311200432.ia1Xs5Jj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311200432.ia1Xs5Jj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/macintosh/windfarm_lm75_sensor.c:70:21: sparse: sparse: cast to restricted __le16

vim +70 drivers/macintosh/windfarm_lm75_sensor.c

75722d3992f573 Benjamin Herrenschmidt 2005-11-07  42  
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  43  static int wf_lm75_get(struct wf_sensor *sr, s32 *value)
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  44  {
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  45  	struct wf_lm75_sensor *lm = wf_to_lm75(sr);
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  46  	s32 data;
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  47  
351ca3e3119792 Jean Delvare           2009-06-15  48  	if (lm->i2c == NULL)
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  49  		return -ENODEV;
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  50  
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  51  	/* Init chip if necessary */
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  52  	if (!lm->inited) {
351ca3e3119792 Jean Delvare           2009-06-15  53  		u8 cfg_new, cfg = (u8)i2c_smbus_read_byte_data(lm->i2c, 1);
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  54  
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  55  		DBG("wf_lm75: Initializing %s, cfg was: %02x\n",
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  56  		    sr->name, cfg);
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  57  
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  58  		/* clear shutdown bit, keep other settings as left by
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  59  		 * the firmware for now
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  60  		 */
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  61  		cfg_new = cfg & ~0x01;
351ca3e3119792 Jean Delvare           2009-06-15  62  		i2c_smbus_write_byte_data(lm->i2c, 1, cfg_new);
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  63  		lm->inited = 1;
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  64  
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  65  		/* If we just powered it up, let's wait 200 ms */
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  66  		msleep(200);
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  67  	}
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  68  
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  69  	/* Read temperature register */
351ca3e3119792 Jean Delvare           2009-06-15 @70  	data = (s32)le16_to_cpu(i2c_smbus_read_word_data(lm->i2c, 0));
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  71  	data <<= 8;
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  72  	*value = data;
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  73  
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  74  	return 0;
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  75  }
75722d3992f573 Benjamin Herrenschmidt 2005-11-07  76  

:::::: The code at line 70 was first introduced by commit
:::::: 351ca3e31197929535418f5affc761cd9fb07428 windfarm: Convert to new-style i2c drivers

:::::: TO: Jean Delvare <khali@linux-fr.org>
:::::: CC: Jean Delvare <khali@linux-fr.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
