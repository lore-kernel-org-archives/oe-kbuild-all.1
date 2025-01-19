Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA071DFE0F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Jan 2025 23:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737330314; cv=none; b=H8XIsPFz78EImdtx6myqUxHBPYQU6lSg07ZMkGF0BkXT6Y+wIUtyEglRar7y3/y0+V/h5h0ns9tLpYgWFRxukqD9RGnh4x9pxtPKRjWwRHkvoNLDy3dG3C3qFxYrjCbD5lBrGYEKT2vbUGhC/FWtb4LfMFjpt87fXa4S+KYU4lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737330314; c=relaxed/simple;
	bh=JNfZWhTRpHVW++84dW2shA0NMLzwS//XO21kc4HHLnk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P6WeXioPlgcvnVL1ULvqG3EYJQQ2RXgUOpBI8AJr4oTnbSrAghoTZOF/HUKn9c3eEL0vYLqMrjiHozP99tJgGSHxRclkk2n449PSBpaYHKr8kPpDQ36+OymW8c81cTm2mnABX6LZHWyaS0Dtp1UnOxITbdXMjwJlM5115ouEpGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mqij0KH3; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mqij0KH3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737330313; x=1768866313;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JNfZWhTRpHVW++84dW2shA0NMLzwS//XO21kc4HHLnk=;
  b=Mqij0KH30jhwVT9kOiWG/4wV5mzGdQyNUQJ0xhHco6Id7nABEc0Nd88J
   dkH8ooFbOUpItkdqPXwVdakwv2SrdGCaiqWgn4A8E91cbh/6HzlQOY0GY
   WlV/05B1Wz4j+BgKknL1VwU4P2xid7Eq/z9tTGnZC5TKaW7m2/iEK/CDz
   c7+4mSux8iccuICPZb62zTFOP1sgZg2+0Jvb/dqfX4hTuUwdvtWMYk4ur
   71Ab8IJK45a7Ea5FOCJ1j6j9ePRQKjk+AT0R5lXx47rDPWCxkSMpvfppJ
   DAu/ymAq7z72bqzs4AOn07WEsY89quzpsopqp2vZtphm6HgetztGxl51O
   w==;
X-CSE-ConnectionGUID: jmhor9J8TXumC/M6BmZwVg==
X-CSE-MsgGUID: m7zqHg5QTraOhIzdQ5g8sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="55239289"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="55239289"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 15:45:12 -0800
X-CSE-ConnectionGUID: teRunndYTYqKSp+iLUOhKA==
X-CSE-MsgGUID: hnCvUepEShO9kzSfT4QIpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="106904205"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 19 Jan 2025 15:45:11 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZeya-000Vx7-26;
	Sun, 19 Jan 2025 23:45:08 +0000
Date: Mon, 20 Jan 2025 07:45:07 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>
Subject: drivers/clk/clk-renesas-pcie.c:178:31: warning: '%d' directive
 output may be truncated writing between 1 and 4 bytes into a region of size
 2
Message-ID: <202501200756.HycDH8wZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9528d418de4d83c7ada69314ddd8d4427b1f703a
commit: cd9a5c97dfdaeb9c8ac02e14d7ccbd445e8b5265 clk: rs9: Replace model check with bitshift from chip data
date:   1 year, 1 month ago
config: s390-randconfig-r111-20250120 (https://download.01.org/0day-ci/archive/20250120/202501200756.HycDH8wZ-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250120/202501200756.HycDH8wZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501200756.HycDH8wZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clk/clk-renesas-pcie.c: In function 'rs9_probe':
>> drivers/clk/clk-renesas-pcie.c:178:31: warning: '%d' directive output may be truncated writing between 1 and 4 bytes into a region of size 2 [-Wformat-truncation=]
     178 |         snprintf(name, 5, "DIF%d", idx);
         |                               ^~
   In function 'rs9_get_output_config',
       inlined from 'rs9_probe' at drivers/clk/clk-renesas-pcie.c:305:9:
   drivers/clk/clk-renesas-pcie.c:178:27: note: directive argument in the range [-250, 63]
     178 |         snprintf(name, 5, "DIF%d", idx);
         |                           ^~~~~~~
   drivers/clk/clk-renesas-pcie.c:178:9: note: 'snprintf' output between 5 and 8 bytes into a destination of size 5
     178 |         snprintf(name, 5, "DIF%d", idx);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +178 drivers/clk/clk-renesas-pcie.c

603df193ec5174 Alexander Stein 2023-03-10  165  
892e0ddea1aa6f Marek Vasut     2022-02-26  166  static int rs9_get_output_config(struct rs9_driver_data *rs9, int idx)
892e0ddea1aa6f Marek Vasut     2022-02-26  167  {
892e0ddea1aa6f Marek Vasut     2022-02-26  168  	struct i2c_client *client = rs9->client;
603df193ec5174 Alexander Stein 2023-03-10  169  	u8 dif = rs9_calc_dif(rs9, idx);
892e0ddea1aa6f Marek Vasut     2022-02-26  170  	unsigned char name[5] = "DIF0";
892e0ddea1aa6f Marek Vasut     2022-02-26  171  	struct device_node *np;
892e0ddea1aa6f Marek Vasut     2022-02-26  172  	int ret;
892e0ddea1aa6f Marek Vasut     2022-02-26  173  	u32 sr;
892e0ddea1aa6f Marek Vasut     2022-02-26  174  
892e0ddea1aa6f Marek Vasut     2022-02-26  175  	/* Set defaults */
603df193ec5174 Alexander Stein 2023-03-10  176  	rs9->clk_dif_sr |= dif;
892e0ddea1aa6f Marek Vasut     2022-02-26  177  
892e0ddea1aa6f Marek Vasut     2022-02-26 @178  	snprintf(name, 5, "DIF%d", idx);
892e0ddea1aa6f Marek Vasut     2022-02-26  179  	np = of_get_child_by_name(client->dev.of_node, name);
892e0ddea1aa6f Marek Vasut     2022-02-26  180  	if (!np)
892e0ddea1aa6f Marek Vasut     2022-02-26  181  		return 0;
892e0ddea1aa6f Marek Vasut     2022-02-26  182  
892e0ddea1aa6f Marek Vasut     2022-02-26  183  	/* Output clock slew rate */
892e0ddea1aa6f Marek Vasut     2022-02-26  184  	ret = of_property_read_u32(np, "renesas,slew-rate", &sr);
892e0ddea1aa6f Marek Vasut     2022-02-26  185  	of_node_put(np);
892e0ddea1aa6f Marek Vasut     2022-02-26  186  	if (!ret) {
892e0ddea1aa6f Marek Vasut     2022-02-26  187  		if (sr == 2000000) {		/* 2V/ns */
603df193ec5174 Alexander Stein 2023-03-10  188  			rs9->clk_dif_sr &= ~dif;
892e0ddea1aa6f Marek Vasut     2022-02-26  189  		} else if (sr == 3000000) {	/* 3V/ns (default) */
603df193ec5174 Alexander Stein 2023-03-10  190  			rs9->clk_dif_sr |= dif;
892e0ddea1aa6f Marek Vasut     2022-02-26  191  		} else
892e0ddea1aa6f Marek Vasut     2022-02-26  192  			ret = dev_err_probe(&client->dev, -EINVAL,
892e0ddea1aa6f Marek Vasut     2022-02-26  193  					    "Invalid renesas,slew-rate value\n");
892e0ddea1aa6f Marek Vasut     2022-02-26  194  	}
892e0ddea1aa6f Marek Vasut     2022-02-26  195  
892e0ddea1aa6f Marek Vasut     2022-02-26  196  	return ret;
892e0ddea1aa6f Marek Vasut     2022-02-26  197  }
892e0ddea1aa6f Marek Vasut     2022-02-26  198  

:::::: The code at line 178 was first introduced by commit
:::::: 892e0ddea1aa6f70b68cb2dd8e16bf271e20e72f clk: rs9: Add Renesas 9-series PCIe clock generator driver

:::::: TO: Marek Vasut <marex@denx.de>
:::::: CC: Stephen Boyd <sboyd@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
