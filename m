Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CF224E4A8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Sep 2025 06:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759129013; cv=none; b=t93SPgPHEM1kbx17JCxwvUCPANY3ePlfKdlX4K2sTkFvIWV0J5TblRK8JeuiDjwIWJh9QeBQD643gcQ77IPiW+O/FM1Tu0x8nhOHdPKRnKeaFc3q/ZJa82uvTY9epGBgk89GsNKE6ailQr1zHW2GWSX2/ODKvfkzR1AWlczBFVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759129013; c=relaxed/simple;
	bh=rm/afh3BNnfwao7DpBQl9ir8D8h8Zat2nt5T1IgOhdY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jrJqxm41+F4e8bDVO3r0MAXNWHKcJ4JHd/GxmIT1bC8KS3nh5jMJaDmzQmy6rZQmHw7e2NphYhLKuv+HNtc4iPwBv2qnBl9LrOP5pnXgSx7CyltuLFr75tWFiol/XDER12jjQ2y8zWTjy2gWofkHv97Z/JSoL1tUTB6G7t4/87Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PQY2KnLb; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PQY2KnLb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759129011; x=1790665011;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rm/afh3BNnfwao7DpBQl9ir8D8h8Zat2nt5T1IgOhdY=;
  b=PQY2KnLb6+wAfKBhLpxGL3qRHJdGLuPFL1UqKELc/DVbY8JO1fPBoXg3
   x5LrpB0ag+PyytH3HQ3KFBPAovl1x7R24Lw/CGpm05z40dww+aqyKdyvM
   JzSAY65hizznOee8js9suglptphaKFCxnwBPKbsCeONt+wWEC/2WJP2Li
   Y54+DmUEhYKOLPz98WeR+X/F/DfW9uwFJUKIDZzpSmM3eYVoCtSRr8wsF
   W43ltHBtCS2S3toU3w8DR9TBihSPA0Z+vgEqcfCCxoseD3WZdsxi0/7vq
   wWu6yyXkXYLgNwv2y+fdXSLpchsOLv7+wBFoSV+ciAo6XLnU2Kfopb7Ez
   Q==;
X-CSE-ConnectionGUID: yVDxFGpFQ360TZhi441/+A==
X-CSE-MsgGUID: WPsBxWJ7Q5KX4NVoX4c5GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="60398759"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; 
   d="scan'208";a="60398759"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2025 23:56:50 -0700
X-CSE-ConnectionGUID: HRYulK3LSuiIhBkIOTPDdA==
X-CSE-MsgGUID: fiHkMXNaTpiQFCqkrA8uOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; 
   d="scan'208";a="182145455"
Received: from lkp-server02.sh.intel.com (HELO 62862f778ede) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 28 Sep 2025 23:56:49 -0700
Received: from kbuild by 62862f778ede with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v37oO-00003d-2p;
	Mon, 29 Sep 2025 06:56:43 +0000
Date: Mon, 29 Sep 2025 14:54:30 +0800
From: kernel test robot <lkp@intel.com>
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rmk-arm:clearfog 2/182]
 drivers/net/dsa/mv88e6xxx/mv88e6xxx_debugfs.c:52:12: warning:
 '_mv88e6xxx_pvt_read' defined but not used
Message-ID: <202509291421.oZKKL46D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Russell,

First bad commit (maybe != root cause):

tree:   git://git.armlinux.org.uk/~rmk/linux-arm clearfog
head:   1f6f372057f2880dd5190f76f8ee87b4214795cb
commit: 8f0a83bcc51930dfcddfb423fe181e3fdfa9206c [2/182] net: dsa: mv88e6xxx: debugfs hacks to fix the compile
config: s390-randconfig-001-20250929 (https://download.01.org/0day-ci/archive/20250929/202509291421.oZKKL46D-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250929/202509291421.oZKKL46D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509291421.oZKKL46D-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/dsa/mv88e6xxx/chip.c:3961:
>> drivers/net/dsa/mv88e6xxx/mv88e6xxx_debugfs.c:52:12: warning: '_mv88e6xxx_pvt_read' defined but not used [-Wunused-function]
      52 | static int _mv88e6xxx_pvt_read(struct mv88e6xxx_chip *chip, int src_dev,
         |            ^~~~~~~~~~~~~~~~~~~


vim +/_mv88e6xxx_pvt_read +52 drivers/net/dsa/mv88e6xxx/mv88e6xxx_debugfs.c

d9bd0c54ccf6e1 Vivien Didelot 2015-10-22  51  
d9bd0c54ccf6e1 Vivien Didelot 2015-10-22 @52  static int _mv88e6xxx_pvt_read(struct mv88e6xxx_chip *chip, int src_dev,
d9bd0c54ccf6e1 Vivien Didelot 2015-10-22  53  			       int src_port, u16 *data)
d9bd0c54ccf6e1 Vivien Didelot 2015-10-22  54  {
d9bd0c54ccf6e1 Vivien Didelot 2015-10-22  55  	int ret;
d9bd0c54ccf6e1 Vivien Didelot 2015-10-22  56  
d9bd0c54ccf6e1 Vivien Didelot 2015-10-22  57  	ret = _mv88e6xxx_pvt_wait(chip);
d9bd0c54ccf6e1 Vivien Didelot 2015-10-22  58  	if (ret < 0)
d9bd0c54ccf6e1 Vivien Didelot 2015-10-22  59  		return ret;
d9bd0c54ccf6e1 Vivien Didelot 2015-10-22  60  
d9bd0c54ccf6e1 Vivien Didelot 2015-10-22  61  	ret = _mv88e6xxx_pvt_cmd(chip, src_dev, src_port,
d9bd0c54ccf6e1 Vivien Didelot 2015-10-22  62  				GLOBAL2_PVT_ADDR_OP_READ);
d9bd0c54ccf6e1 Vivien Didelot 2015-10-22  63  	if (ret < 0)
d9bd0c54ccf6e1 Vivien Didelot 2015-10-22  64  		return ret;
d9bd0c54ccf6e1 Vivien Didelot 2015-10-22  65  
d9bd0c54ccf6e1 Vivien Didelot 2015-10-22  66  	return mv88e6xxx_g2_read(chip, GLOBAL2_PVT_DATA, data);
d9bd0c54ccf6e1 Vivien Didelot 2015-10-22  67  }
d9bd0c54ccf6e1 Vivien Didelot 2015-10-22  68  

:::::: The code at line 52 was first introduced by commit
:::::: d9bd0c54ccf6e1a7e181271f1e7770a00961324f net: dsa: mv88e6xxx: add debugfs interface

:::::: TO: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
:::::: CC: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
