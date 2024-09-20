Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912E043155
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Sep 2024 06:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726812744; cv=none; b=hB+TaIC/yXRoEN7C/Ns8E5vMnk22Yg2sfEEwv5kxiGdk3G6SjCaSmyseKNfTRGt8W8H/tY8U2akfQviqTk5EzhbnGLzt11yp4wFRcAtaEokLvQYdwT/Bod6nF9qoewE7zaasSirD4Kv/a1E2p9EEUJRvaXPrRzExVoSvWGcxOfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726812744; c=relaxed/simple;
	bh=XNkWTq0jlQkUjXgJF27RglEX9ekRD5Zd+nyHSaEiVH4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=drdWa57R2sF17UIhxfot3UfAYIxbU1HTNnEmgUsTCjTniIr2stoxOh8OTgvwFVParDxHZn4Ld1eyQCMy7GbFJpdFEk5HpACrJ9eXUllXqm1iTxg5kptZUuoD+Sn9kUchLinXDbS7YYTb9zmKm4Zoqcr0zbO8XxmkB5u/LxQE+G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OdlCPV8D; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OdlCPV8D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726812743; x=1758348743;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XNkWTq0jlQkUjXgJF27RglEX9ekRD5Zd+nyHSaEiVH4=;
  b=OdlCPV8DE3v2arjfRYEPQUNGpzXM8MPJUt7/8GbWYTl/f8rUtoX2jrRz
   kvx/6/yZ/0bx+5KocxSLCcgfqL5/ClseicLwN/EoxzXpbidWxLb2z0Lbc
   2tPgvJd8i4J9OI8+c+lsBjqWinamElBK00TPlKybMWdmX8CI67xVq8U1p
   pv/6BELgnIMc5rQe6C1i3CNGLKDm9p8gHXd5RPqdPkiLPerPsYkNj+U7m
   SewrYKEYY7vWSNxGo6Ml4ZI79p0WheM+XN2z1z3TXxnPSw+wmPMJJ5o4Q
   07qLhFUiNLcqHL/R5ca+4OuBx+bRmKpnlfUWM/XdqoUHKGg6ErbaazXoq
   Q==;
X-CSE-ConnectionGUID: 2xQUG/oWSQOic2wMo+bxww==
X-CSE-MsgGUID: 4ep74+xoR6OCZumlkvGCeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25957315"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; 
   d="scan'208";a="25957315"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 23:12:23 -0700
X-CSE-ConnectionGUID: DghkLjCrSLOwocOtqWk3Pw==
X-CSE-MsgGUID: i2k8j7h4QVCI5zYL7zgzwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; 
   d="scan'208";a="74720102"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 19 Sep 2024 23:12:20 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srWsM-000E1U-0g;
	Fri, 20 Sep 2024 06:12:18 +0000
Date: Fri, 20 Sep 2024 14:11:53 +0800
From: kernel test robot <lkp@intel.com>
To: Prasanth Babu Mantena <p-mantena@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: [ti:ti-linux-6.1.y-wip 20/90]
 drivers/media/platform/chips-media/wave5/wave5-helper.c:223:6: warning:
 variable 'ret' is used uninitialized whenever 'if' condition is false
Message-ID: <202409201402.lB4XVDAy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Prasanth,

FYI, the error/warning still remains.

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.1.y-wip
head:   c1c2f1971fbf6ddad93a8c94314fe8221e7aa6be
commit: 1bb45095919cd3307dd7729168754a3212b7a119 [20/90] arm64: media: wave5: Add Support for frequency points
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240920/202409201402.lB4XVDAy-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240920/202409201402.lB4XVDAy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409201402.lB4XVDAy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/chips-media/wave5/wave5-helper.c:223:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     223 |         if (acq_freq != inst->dev->opp_freq) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/chips-media/wave5/wave5-helper.c:231:9: note: uninitialized use occurs here
     231 |         return ret;
         |                ^~~
   drivers/media/platform/chips-media/wave5/wave5-helper.c:223:2: note: remove the 'if' if its condition is always true
     223 |         if (acq_freq != inst->dev->opp_freq) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/chips-media/wave5/wave5-helper.c:206:9: note: initialize the variable 'ret' to silence this warning
     206 |         int ret;
         |                ^
         |                 = 0
   drivers/media/platform/chips-media/wave5/wave5-helper.c:248:28: warning: variable 'req_freq' set but not used [-Wunused-but-set-variable]
     248 |         unsigned long pixel_rate, req_freq;
         |                                   ^
   2 warnings generated.


vim +223 drivers/media/platform/chips-media/wave5/wave5-helper.c

   201	
   202	int wave5_set_dev_clk(struct vpu_instance *inst)
   203	{
   204		struct dev_pm_opp *opp;
   205		unsigned long calc_pixel_rate, req_freq, acq_freq, pixel_rate;
   206		int ret;
   207	
   208		pixel_rate = inst->dev->opp_pixel_rate;
   209		calc_pixel_rate = pixel_rate*(uint)(MAX_OP_HZ);
   210		req_freq = (calc_pixel_rate / MAX_PIXEL_RATE) + 1;
   211		opp = dev_pm_opp_find_freq_ceil(inst->dev->dev, &req_freq);
   212		if (IS_ERR(opp)) {
   213			opp = dev_pm_opp_find_freq_floor(inst->dev->dev, &req_freq);
   214			if (IS_ERR(opp)) {
   215				dev_err(inst->dev->dev, "Failed to get floor value\n");
   216				return -EINVAL;
   217			}
   218	
   219		}
   220	
   221		dev_pm_opp_put(opp);
   222		acq_freq = dev_pm_opp_get_freq(opp);
 > 223		if (acq_freq != inst->dev->opp_freq) {
   224			inst->dev->opp_freq = acq_freq;
   225			ret = dev_pm_opp_set_rate(inst->dev->dev, acq_freq);
   226			if (ret) {
   227				dev_err(inst->dev->dev, "Error setting the clock");
   228				return ret;
   229			}
   230		}
   231		return ret;
   232	}
   233	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
