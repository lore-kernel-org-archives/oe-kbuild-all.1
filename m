Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17EA18950C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Aug 2024 08:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723106554; cv=none; b=cD6hQ+s91gysPSf32WQ71D7HHpV1eBsrLC2eSHxc2y1grceGIU/jVo5YW4CaUsXB3//rwwTHNeYK5ixqkLotV2clYEtrYxTUK/8+XQvlai/knBGaM7aKIHd1tGNIFtWbeJHEwTe7bNH+1rovH76opPO8NsMXOa5puA/+Eszt2yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723106554; c=relaxed/simple;
	bh=r9RNJViT7ami3h2d1K00ZrgIsi6u650kH+s/q4mI9LY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XBi1DYk/rV1mFRfizC5YF2rdwZLNI38lsM04+6PX8yN4evZ+YoE4xu1AHN1hwY5h5GRMSvomyaYNNafWNUrO3p7z/flo6UJvsC7aJZTw/CMBzP8AazYacMGHJTU3LAvgATsVKEoVsqAUmooii4kD2GjSDk2uTE3XKyWYknqqpoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jarWXBBx; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jarWXBBx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723106553; x=1754642553;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r9RNJViT7ami3h2d1K00ZrgIsi6u650kH+s/q4mI9LY=;
  b=jarWXBBx+AyzOc0HPUb1tWRBUAHRNHu3a1ftRseWWmxnLRPMsDVNQ49u
   L/kiJ4+MtIhivoDUvSOO9YcuT4I/67jEvuxPkUm/3R6UAk2JMij1mBBtY
   JNYrRvD0AHbcTmcqVf+x/4zF6pAMIuXqXNATl48WheDyNiZRNtkhXtM3c
   t+HhYC/yZjPU1cWKojBgb8a3T+iZwOO8fh+yS4p30H8g1dapM8c2z7c4q
   lWSyuO5WZgPqK1Sn7fJ8ugzjM5Ssmx08InhhtxgBCeXwa5KX1CWMCVGx+
   i51Csp/cow3lZlz1KZDoMhYxiA0jrwRpDjkwsuwlS9MVTNpHqM4tC+4S8
   w==;
X-CSE-ConnectionGUID: pxONpOe/SL+I0swuFLBE5w==
X-CSE-MsgGUID: jWeHGnLxQ1Ktc6JtP1XDgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="21361349"
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; 
   d="scan'208";a="21361349"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 01:42:32 -0700
X-CSE-ConnectionGUID: gImmUdZgRQuiK7bQKfLylg==
X-CSE-MsgGUID: eMsd/QLZRYOBGbvuh7D4SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; 
   d="scan'208";a="61989297"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 08 Aug 2024 01:42:31 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbyj6-00063S-2e;
	Thu, 08 Aug 2024 08:42:28 +0000
Date: Thu, 8 Aug 2024 16:41:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 429/444] drivers/pinctrl/pinmux.c:756:29:
 error: 'pinmux_select_write' undeclared here (not in a function); did you
 mean 'pinmux_select_fops'?
Message-ID: <202408081623.sWELQ9cz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   63ad9eea4ab41c8275895cba6ec9fce9fe81781c
commit: bebc8388fad49b751f668f46fa7574709d672700 [429/444] pinctrl: convert to read/write iterators
config: x86_64-randconfig-075-20240807 (https://download.01.org/0day-ci/archive/20240808/202408081623.sWELQ9cz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240808/202408081623.sWELQ9cz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408081623.sWELQ9cz-lkp@intel.com/

Note: the axboe-block/rw_iter HEAD 63ad9eea4ab41c8275895cba6ec9fce9fe81781c builds fine.
      It only hurts bisectability.

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/debugfs.h:16,
                    from drivers/pinctrl/pinmux.c:17:
>> drivers/pinctrl/pinmux.c:756:29: error: 'pinmux_select_write' undeclared here (not in a function); did you mean 'pinmux_select_fops'?
     756 | DEFINE_SHOW_STORE_ATTRIBUTE(pinmux_select);
         |                             ^~~~~~~~~~~~~
   include/linux/seq_file.h:230:27: note: in definition of macro 'DEFINE_SHOW_STORE_ATTRIBUTE'
     230 |         .write          = __name ## _write,                             \
         |                           ^~~~~~
>> drivers/pinctrl/pinmux.c:682:16: warning: 'pinmux_select_write_iter' defined but not used [-Wunused-function]
     682 | static ssize_t pinmux_select_write_iter(struct kiocb *iocb, struct iov_iter *from)
         |                ^~~~~~~~~~~~~~~~~~~~~~~~


vim +756 drivers/pinctrl/pinmux.c

2744e8afb3b763 Linus Walleij   2011-05-02  681  
bebc8388fad49b Jens Axboe      2024-08-02 @682  static ssize_t pinmux_select_write_iter(struct kiocb *iocb, struct iov_iter *from)
6199f6becc869d Drew Fustini    2021-03-01  683  {
bebc8388fad49b Jens Axboe      2024-08-02  684  	struct seq_file *sfile = iocb->ki_filp->private_data;
6199f6becc869d Drew Fustini    2021-03-01  685  	struct pinctrl_dev *pctldev = sfile->private;
6199f6becc869d Drew Fustini    2021-03-01  686  	const struct pinmux_ops *pmxops = pctldev->desc->pmxops;
bebc8388fad49b Jens Axboe      2024-08-02  687  	size_t len = iov_iter_count(from);
6199f6becc869d Drew Fustini    2021-03-01  688  	const char *const *groups;
6199f6becc869d Drew Fustini    2021-03-01  689  	char *buf, *gname, *fname;
6199f6becc869d Drew Fustini    2021-03-01  690  	unsigned int num_groups;
6199f6becc869d Drew Fustini    2021-03-01  691  	int fsel, gsel, ret;
6199f6becc869d Drew Fustini    2021-03-01  692  
bebc8388fad49b Jens Axboe      2024-08-02  693  	buf = iterdup_nul(from, len);
0d8675e1dfa625 Andy Shevchenko 2023-06-04  694  	if (IS_ERR(buf))
0d8675e1dfa625 Andy Shevchenko 2023-06-04  695  		return PTR_ERR(buf);
6199f6becc869d Drew Fustini    2021-03-01  696  
6199f6becc869d Drew Fustini    2021-03-01  697  	/* remove leading and trailing spaces of input buffer */
6199f6becc869d Drew Fustini    2021-03-01  698  	gname = strstrip(buf);
6199f6becc869d Drew Fustini    2021-03-01  699  	if (*gname == '\0') {
6199f6becc869d Drew Fustini    2021-03-01  700  		ret = -EINVAL;
6199f6becc869d Drew Fustini    2021-03-01  701  		goto exit_free_buf;
6199f6becc869d Drew Fustini    2021-03-01  702  	}
6199f6becc869d Drew Fustini    2021-03-01  703  
6199f6becc869d Drew Fustini    2021-03-01  704  	/* find a separator which is a spacelike character */
6199f6becc869d Drew Fustini    2021-03-01  705  	for (fname = gname; !isspace(*fname); fname++) {
6199f6becc869d Drew Fustini    2021-03-01  706  		if (*fname == '\0') {
6199f6becc869d Drew Fustini    2021-03-01  707  			ret = -EINVAL;
6199f6becc869d Drew Fustini    2021-03-01  708  			goto exit_free_buf;
6199f6becc869d Drew Fustini    2021-03-01  709  		}
6199f6becc869d Drew Fustini    2021-03-01  710  	}
6199f6becc869d Drew Fustini    2021-03-01  711  	*fname = '\0';
6199f6becc869d Drew Fustini    2021-03-01  712  
6199f6becc869d Drew Fustini    2021-03-01  713  	/* drop extra spaces between function and group names */
6199f6becc869d Drew Fustini    2021-03-01  714  	fname = skip_spaces(fname + 1);
6199f6becc869d Drew Fustini    2021-03-01  715  	if (*fname == '\0') {
6199f6becc869d Drew Fustini    2021-03-01  716  		ret = -EINVAL;
6199f6becc869d Drew Fustini    2021-03-01  717  		goto exit_free_buf;
6199f6becc869d Drew Fustini    2021-03-01  718  	}
6199f6becc869d Drew Fustini    2021-03-01  719  
6199f6becc869d Drew Fustini    2021-03-01  720  	ret = pinmux_func_name_to_selector(pctldev, fname);
6199f6becc869d Drew Fustini    2021-03-01  721  	if (ret < 0) {
6199f6becc869d Drew Fustini    2021-03-01  722  		dev_err(pctldev->dev, "invalid function %s in map table\n", fname);
6199f6becc869d Drew Fustini    2021-03-01  723  		goto exit_free_buf;
6199f6becc869d Drew Fustini    2021-03-01  724  	}
6199f6becc869d Drew Fustini    2021-03-01  725  	fsel = ret;
6199f6becc869d Drew Fustini    2021-03-01  726  
6199f6becc869d Drew Fustini    2021-03-01  727  	ret = pmxops->get_function_groups(pctldev, fsel, &groups, &num_groups);
6199f6becc869d Drew Fustini    2021-03-01  728  	if (ret) {
6199f6becc869d Drew Fustini    2021-03-01  729  		dev_err(pctldev->dev, "no groups for function %d (%s)", fsel, fname);
6199f6becc869d Drew Fustini    2021-03-01  730  		goto exit_free_buf;
6199f6becc869d Drew Fustini    2021-03-01  731  	}
6199f6becc869d Drew Fustini    2021-03-01  732  
6199f6becc869d Drew Fustini    2021-03-01  733  	ret = match_string(groups, num_groups, gname);
6199f6becc869d Drew Fustini    2021-03-01  734  	if (ret < 0) {
6199f6becc869d Drew Fustini    2021-03-01  735  		dev_err(pctldev->dev, "invalid group %s", gname);
6199f6becc869d Drew Fustini    2021-03-01  736  		goto exit_free_buf;
6199f6becc869d Drew Fustini    2021-03-01  737  	}
6199f6becc869d Drew Fustini    2021-03-01  738  
6199f6becc869d Drew Fustini    2021-03-01  739  	ret = pinctrl_get_group_selector(pctldev, gname);
091e81b8677961 Andy Shevchenko 2023-01-09  740  	if (ret < 0)
6199f6becc869d Drew Fustini    2021-03-01  741  		goto exit_free_buf;
6199f6becc869d Drew Fustini    2021-03-01  742  	gsel = ret;
6199f6becc869d Drew Fustini    2021-03-01  743  
6199f6becc869d Drew Fustini    2021-03-01  744  	ret = pmxops->set_mux(pctldev, fsel, gsel);
6199f6becc869d Drew Fustini    2021-03-01  745  	if (ret) {
6199f6becc869d Drew Fustini    2021-03-01  746  		dev_err(pctldev->dev, "set_mux() failed: %d", ret);
6199f6becc869d Drew Fustini    2021-03-01  747  		goto exit_free_buf;
6199f6becc869d Drew Fustini    2021-03-01  748  	}
6199f6becc869d Drew Fustini    2021-03-01  749  	ret = len;
6199f6becc869d Drew Fustini    2021-03-01  750  
6199f6becc869d Drew Fustini    2021-03-01  751  exit_free_buf:
6199f6becc869d Drew Fustini    2021-03-01  752  	kfree(buf);
6199f6becc869d Drew Fustini    2021-03-01  753  
6199f6becc869d Drew Fustini    2021-03-01  754  	return ret;
6199f6becc869d Drew Fustini    2021-03-01  755  }
932640c0f78947 Andy Shevchenko 2024-04-04 @756  DEFINE_SHOW_STORE_ATTRIBUTE(pinmux_select);
6199f6becc869d Drew Fustini    2021-03-01  757  

:::::: The code at line 756 was first introduced by commit
:::::: 932640c0f78947c59a6e9c743a17a355165d69d5 pinctrl: Use DEFINE_SHOW_STORE_ATTRIBUTE() helper for debugfs

:::::: TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
