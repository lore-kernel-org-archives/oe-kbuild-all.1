Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB561581F2
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Oct 2024 15:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728055467; cv=none; b=dkSCvFGvnDmuu/Ny+6fLEgnsCMKTAZkhqpzKRhaWPUAw2g67uDPirHVPXNtW8oSXJdCRcBMfyhhDveLcPfDDlS9P/TH+V3Ef0PrRK8HVUbyWKbkoTx5cS3Gy05K7COPjKcWSOawM/mpV2Fntt0dMMldJwnQLRtRx0/ESFWHBMXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728055467; c=relaxed/simple;
	bh=HkfMd8N2GEj+2I+fP9s2rzpEou+nHJLMC6DbqSmcxUA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cZqtbQCJh1o3Sm9vFzhQWEbmlEk1dCYBBlqFg4QMznE51BlqqIL2r+JzLeyidkyVpmegrCaogUjSyFdzDHPQg90GqmeC/nHT98JIJgP1t+Lg73kXWVL3KB12k7+7ekmQ62WpVmqtApnzN/nWsYvEgfqP9AJot75WUqV+kE10/b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lqDjXsYI; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lqDjXsYI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728055466; x=1759591466;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HkfMd8N2GEj+2I+fP9s2rzpEou+nHJLMC6DbqSmcxUA=;
  b=lqDjXsYIPad005b9XpT6AT0w6l3VQ3FeMohMAav03l/nYqsS4tv4TCMe
   nZQSgQGeRgzEx1Wfx1pL17k0J+6EgKsqIl/ZSVOw+dYhC2vpdFAWE1DpX
   WwMsb2QnHLlJddTVc/2GOpuObfc/ShcoZCP1aDAoOTY7FHD8RlUMoLYFz
   aOlz+VYD/zUyUJjW0PdcC83Y1tU+t6RHPZEqygQggkV6Nl/jNJGta5dop
   eCQFqJ6Q1sI0F40zlD83zf2OCt4V5tECCy8owLREtq7y6+ORwngOPhJgp
   p9bZpgZH07BXSCvbFXNgnC6wUXNvKym2vUp9Sy4gRB2LCnPEGHsLeFsEh
   A==;
X-CSE-ConnectionGUID: okBwm28TTBqb4tkmOOPSvg==
X-CSE-MsgGUID: x5F/QBtZR/CULRdpfxa9WQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="27162904"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="27162904"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 08:24:25 -0700
X-CSE-ConnectionGUID: dbb/+6h0RE2e6k43dBNz4g==
X-CSE-MsgGUID: Z2Y7sY0AR2iXP0HN0wX/3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="79307892"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Oct 2024 08:24:24 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swkAI-0001pQ-0s;
	Fri, 04 Oct 2024 15:24:22 +0000
Date: Fri, 4 Oct 2024 23:24:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 11/447] drivers/pinctrl/pinmux.c:753:29: error:
 'pinmux_select_write_iter' undeclared here (not in a function); did you mean
 'pinmux_select_write'?
Message-ID: <202410042355.HfLbFyDb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jens,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   072b44165bc3d4d6e6de6962a9b00c5d0256a555
commit: 4ab4d5b30b2338778770677923b6e48ef809228d [11/447] seq_file: switch to using ->read_iter()
config: x86_64-randconfig-123-20241004 (https://download.01.org/0day-ci/archive/20241004/202410042355.HfLbFyDb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410042355.HfLbFyDb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410042355.HfLbFyDb-lkp@intel.com/

Note: the axboe-block/rw_iter HEAD 072b44165bc3d4d6e6de6962a9b00c5d0256a555 builds fine.
      It only hurts bisectability.

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/debugfs.h:16,
                    from drivers/pinctrl/pinmux.c:17:
>> drivers/pinctrl/pinmux.c:753:29: error: 'pinmux_select_write_iter' undeclared here (not in a function); did you mean 'pinmux_select_write'?
     753 | DEFINE_SHOW_STORE_ATTRIBUTE(pinmux_select);
         |                             ^~~~~~~~~~~~~
   include/linux/seq_file.h:230:27: note: in definition of macro 'DEFINE_SHOW_STORE_ATTRIBUTE'
     230 |         .write_iter     = __name ## _write_iter,                        \
         |                           ^~~~~~
>> drivers/pinctrl/pinmux.c:679:16: warning: 'pinmux_select_write' defined but not used [-Wunused-function]
     679 | static ssize_t pinmux_select_write(struct file *file, const char __user *user_buf,
         |                ^~~~~~~~~~~~~~~~~~~


vim +753 drivers/pinctrl/pinmux.c

2744e8afb3b763 Linus Walleij   2011-05-02  678  
932640c0f78947 Andy Shevchenko 2024-04-04 @679  static ssize_t pinmux_select_write(struct file *file, const char __user *user_buf,
6199f6becc869d Drew Fustini    2021-03-01  680  				   size_t len, loff_t *ppos)
6199f6becc869d Drew Fustini    2021-03-01  681  {
6199f6becc869d Drew Fustini    2021-03-01  682  	struct seq_file *sfile = file->private_data;
6199f6becc869d Drew Fustini    2021-03-01  683  	struct pinctrl_dev *pctldev = sfile->private;
6199f6becc869d Drew Fustini    2021-03-01  684  	const struct pinmux_ops *pmxops = pctldev->desc->pmxops;
6199f6becc869d Drew Fustini    2021-03-01  685  	const char *const *groups;
6199f6becc869d Drew Fustini    2021-03-01  686  	char *buf, *gname, *fname;
6199f6becc869d Drew Fustini    2021-03-01  687  	unsigned int num_groups;
6199f6becc869d Drew Fustini    2021-03-01  688  	int fsel, gsel, ret;
6199f6becc869d Drew Fustini    2021-03-01  689  
0d8675e1dfa625 Andy Shevchenko 2023-06-04  690  	buf = memdup_user_nul(user_buf, len);
0d8675e1dfa625 Andy Shevchenko 2023-06-04  691  	if (IS_ERR(buf))
0d8675e1dfa625 Andy Shevchenko 2023-06-04  692  		return PTR_ERR(buf);
6199f6becc869d Drew Fustini    2021-03-01  693  
6199f6becc869d Drew Fustini    2021-03-01  694  	/* remove leading and trailing spaces of input buffer */
6199f6becc869d Drew Fustini    2021-03-01  695  	gname = strstrip(buf);
6199f6becc869d Drew Fustini    2021-03-01  696  	if (*gname == '\0') {
6199f6becc869d Drew Fustini    2021-03-01  697  		ret = -EINVAL;
6199f6becc869d Drew Fustini    2021-03-01  698  		goto exit_free_buf;
6199f6becc869d Drew Fustini    2021-03-01  699  	}
6199f6becc869d Drew Fustini    2021-03-01  700  
6199f6becc869d Drew Fustini    2021-03-01  701  	/* find a separator which is a spacelike character */
6199f6becc869d Drew Fustini    2021-03-01  702  	for (fname = gname; !isspace(*fname); fname++) {
6199f6becc869d Drew Fustini    2021-03-01  703  		if (*fname == '\0') {
6199f6becc869d Drew Fustini    2021-03-01  704  			ret = -EINVAL;
6199f6becc869d Drew Fustini    2021-03-01  705  			goto exit_free_buf;
6199f6becc869d Drew Fustini    2021-03-01  706  		}
6199f6becc869d Drew Fustini    2021-03-01  707  	}
6199f6becc869d Drew Fustini    2021-03-01  708  	*fname = '\0';
6199f6becc869d Drew Fustini    2021-03-01  709  
6199f6becc869d Drew Fustini    2021-03-01  710  	/* drop extra spaces between function and group names */
6199f6becc869d Drew Fustini    2021-03-01  711  	fname = skip_spaces(fname + 1);
6199f6becc869d Drew Fustini    2021-03-01  712  	if (*fname == '\0') {
6199f6becc869d Drew Fustini    2021-03-01  713  		ret = -EINVAL;
6199f6becc869d Drew Fustini    2021-03-01  714  		goto exit_free_buf;
6199f6becc869d Drew Fustini    2021-03-01  715  	}
6199f6becc869d Drew Fustini    2021-03-01  716  
6199f6becc869d Drew Fustini    2021-03-01  717  	ret = pinmux_func_name_to_selector(pctldev, fname);
6199f6becc869d Drew Fustini    2021-03-01  718  	if (ret < 0) {
6199f6becc869d Drew Fustini    2021-03-01  719  		dev_err(pctldev->dev, "invalid function %s in map table\n", fname);
6199f6becc869d Drew Fustini    2021-03-01  720  		goto exit_free_buf;
6199f6becc869d Drew Fustini    2021-03-01  721  	}
6199f6becc869d Drew Fustini    2021-03-01  722  	fsel = ret;
6199f6becc869d Drew Fustini    2021-03-01  723  
6199f6becc869d Drew Fustini    2021-03-01  724  	ret = pmxops->get_function_groups(pctldev, fsel, &groups, &num_groups);
6199f6becc869d Drew Fustini    2021-03-01  725  	if (ret) {
6199f6becc869d Drew Fustini    2021-03-01  726  		dev_err(pctldev->dev, "no groups for function %d (%s)", fsel, fname);
6199f6becc869d Drew Fustini    2021-03-01  727  		goto exit_free_buf;
6199f6becc869d Drew Fustini    2021-03-01  728  	}
6199f6becc869d Drew Fustini    2021-03-01  729  
6199f6becc869d Drew Fustini    2021-03-01  730  	ret = match_string(groups, num_groups, gname);
6199f6becc869d Drew Fustini    2021-03-01  731  	if (ret < 0) {
6199f6becc869d Drew Fustini    2021-03-01  732  		dev_err(pctldev->dev, "invalid group %s", gname);
6199f6becc869d Drew Fustini    2021-03-01  733  		goto exit_free_buf;
6199f6becc869d Drew Fustini    2021-03-01  734  	}
6199f6becc869d Drew Fustini    2021-03-01  735  
6199f6becc869d Drew Fustini    2021-03-01  736  	ret = pinctrl_get_group_selector(pctldev, gname);
091e81b8677961 Andy Shevchenko 2023-01-09  737  	if (ret < 0)
6199f6becc869d Drew Fustini    2021-03-01  738  		goto exit_free_buf;
6199f6becc869d Drew Fustini    2021-03-01  739  	gsel = ret;
6199f6becc869d Drew Fustini    2021-03-01  740  
6199f6becc869d Drew Fustini    2021-03-01  741  	ret = pmxops->set_mux(pctldev, fsel, gsel);
6199f6becc869d Drew Fustini    2021-03-01  742  	if (ret) {
6199f6becc869d Drew Fustini    2021-03-01  743  		dev_err(pctldev->dev, "set_mux() failed: %d", ret);
6199f6becc869d Drew Fustini    2021-03-01  744  		goto exit_free_buf;
6199f6becc869d Drew Fustini    2021-03-01  745  	}
6199f6becc869d Drew Fustini    2021-03-01  746  	ret = len;
6199f6becc869d Drew Fustini    2021-03-01  747  
6199f6becc869d Drew Fustini    2021-03-01  748  exit_free_buf:
6199f6becc869d Drew Fustini    2021-03-01  749  	kfree(buf);
6199f6becc869d Drew Fustini    2021-03-01  750  
6199f6becc869d Drew Fustini    2021-03-01  751  	return ret;
6199f6becc869d Drew Fustini    2021-03-01  752  }
932640c0f78947 Andy Shevchenko 2024-04-04 @753  DEFINE_SHOW_STORE_ATTRIBUTE(pinmux_select);
6199f6becc869d Drew Fustini    2021-03-01  754  

:::::: The code at line 753 was first introduced by commit
:::::: 932640c0f78947c59a6e9c743a17a355165d69d5 pinctrl: Use DEFINE_SHOW_STORE_ATTRIBUTE() helper for debugfs

:::::: TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
