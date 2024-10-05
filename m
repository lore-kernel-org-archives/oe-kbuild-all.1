Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275D7158853
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 17:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728147985; cv=none; b=tXY2C8TmQ/A2kAUGofU4XhQXlqid6tykH68miPEbsY2ao1KoAOAtXtvkUvvm3uU5z/ExKyQlPwYmhyY2irpnP8NjtpMSz2Pf9xTE4J6+6AWKtxI5t0uVrQF/RLiTnvfDxK1x1xnrc8XWKcpCkWQa4ayR8FVVl4SzeLgfpgzvvVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728147985; c=relaxed/simple;
	bh=L7u/bQ4GqyFfTj0kEffWR1tLHeuNriBHYsr7W0/6+aQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LN+ZD3kNePt0YG69nQkW/IRcqrJSVwdRcQryBR2U9TLp8kRzcj2UPjLvfMc2nDxc0smVjqF+yeKQ/7JRXpFoDAznbEcilwz+7APEKTzwOX5sxbB7VSLbzWBi7P+TjOBrV+45abuKRPZE+xbCs/WXLlJ60Z3edKIa1oqdd/WdyQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oBkWplU/; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oBkWplU/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728147983; x=1759683983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L7u/bQ4GqyFfTj0kEffWR1tLHeuNriBHYsr7W0/6+aQ=;
  b=oBkWplU/euaQy0R015jrM1hkXEUeG34+yKo3UYhBdJbSiOJ6y4YZXQwZ
   hIksT4yCnsPAEDJresNXSqzCUJ4Zc2q1HITJOnj5M1PYrnDN2kJGn9C3w
   hp/jkoMkFqGBlEUDNgJ6Qq51sDFdHw4wq7CksQE5q0+EuuPeQW4nDXv06
   8nymavH40wj/RKlIHbAsXhrKbdg9l1jH/FyltGgIy61O/FqDXrqyKxpYU
   D15e3QyL4a84iUrFKg26I1anh8R6nEShfiYdH1WyWgykZ/jy0Cd80FEXC
   u3KzzlO1pHSyoCyl9NyGHKzJBnWq0lnWRzZ5sQW/A5h77BiJiNvK2LtCw
   w==;
X-CSE-ConnectionGUID: xySM3L1ZSEWXNNJ55RIBNg==
X-CSE-MsgGUID: De3h2bgrSPSOcwOaX0+aNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11216"; a="49879096"
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; 
   d="scan'208";a="49879096"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 10:06:21 -0700
X-CSE-ConnectionGUID: Wctom/kqQCqAuj7/BwxnQg==
X-CSE-MsgGUID: qA+vn54qQqiqMnqmf4tfEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; 
   d="scan'208";a="75146422"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Oct 2024 10:06:19 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sx8ET-0003BY-1p;
	Sat, 05 Oct 2024 17:06:17 +0000
Date: Sun, 6 Oct 2024 01:05:19 +0800
From: kernel test robot <lkp@intel.com>
To: Vishal Sagar <vishal.sagar@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS_2024.1_update 394/1001]
 drivers/media/platform/xilinx/xilinx-csi2rxss.c:717: warning: Function
 parameter or member 'sd_state' not described in 'xcsi2rxss_init_cfg'
Message-ID: <202410060057.UMVI9RQ5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS_2024.1_update
head:   5365c13a86998da06d845c918f849b30b8735538
commit: 102ab7d8fbe33ab13b0dad6f8d3766ed6f62a1df [394/1001] v4l: xilinx: xcsi2rxss: Fix warnings for NULL_RETURNS
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20241006/202410060057.UMVI9RQ5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241006/202410060057.UMVI9RQ5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410060057.UMVI9RQ5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/xilinx/xilinx-csi2rxss.c:717: warning: Function parameter or member 'sd_state' not described in 'xcsi2rxss_init_cfg'
>> drivers/media/platform/xilinx/xilinx-csi2rxss.c:717: warning: Excess function parameter 'cfg' description in 'xcsi2rxss_init_cfg'
>> drivers/media/platform/xilinx/xilinx-csi2rxss.c:745: warning: Function parameter or member 'sd_state' not described in 'xcsi2rxss_get_format'
>> drivers/media/platform/xilinx/xilinx-csi2rxss.c:745: warning: Excess function parameter 'cfg' description in 'xcsi2rxss_get_format'
>> drivers/media/platform/xilinx/xilinx-csi2rxss.c:783: warning: Function parameter or member 'sd_state' not described in 'xcsi2rxss_set_format'
>> drivers/media/platform/xilinx/xilinx-csi2rxss.c:783: warning: Excess function parameter 'cfg' description in 'xcsi2rxss_set_format'


vim +717 drivers/media/platform/xilinx/xilinx-csi2rxss.c

ba5bf51acf0075 Vishal Sagar     2020-05-27  704  
ba5bf51acf0075 Vishal Sagar     2020-05-27  705  /**
ba5bf51acf0075 Vishal Sagar     2020-05-27  706   * xcsi2rxss_init_cfg - Initialise the pad format config to default
ba5bf51acf0075 Vishal Sagar     2020-05-27  707   * @sd: Pointer to V4L2 Sub device structure
102ab7d8fbe33a Vishal Sagar     2021-04-29  708   * @cfg: Pointer to sub device pad information structure
ba5bf51acf0075 Vishal Sagar     2020-05-27  709   *
ba5bf51acf0075 Vishal Sagar     2020-05-27  710   * This function is used to initialize the pad format with the default
ba5bf51acf0075 Vishal Sagar     2020-05-27  711   * values.
ba5bf51acf0075 Vishal Sagar     2020-05-27  712   *
ba5bf51acf0075 Vishal Sagar     2020-05-27  713   * Return: 0 on success
ba5bf51acf0075 Vishal Sagar     2020-05-27  714   */
ba5bf51acf0075 Vishal Sagar     2020-05-27  715  static int xcsi2rxss_init_cfg(struct v4l2_subdev *sd,
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  716  			      struct v4l2_subdev_state *sd_state)
ba5bf51acf0075 Vishal Sagar     2020-05-27 @717  {
ba5bf51acf0075 Vishal Sagar     2020-05-27  718  	struct xcsi2rxss_state *xcsi2rxss = to_xcsi2rxssstate(sd);
ba5bf51acf0075 Vishal Sagar     2020-05-27  719  	struct v4l2_mbus_framefmt *format;
ba5bf51acf0075 Vishal Sagar     2020-05-27  720  	unsigned int i;
ba5bf51acf0075 Vishal Sagar     2020-05-27  721  
ba5bf51acf0075 Vishal Sagar     2020-05-27  722  	mutex_lock(&xcsi2rxss->lock);
ba5bf51acf0075 Vishal Sagar     2020-05-27  723  	for (i = 0; i < XCSI_MEDIA_PADS; i++) {
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  724  		format = v4l2_subdev_get_try_format(sd, sd_state, i);
ba5bf51acf0075 Vishal Sagar     2020-05-27  725  		*format = xcsi2rxss->default_format;
ba5bf51acf0075 Vishal Sagar     2020-05-27  726  	}
ba5bf51acf0075 Vishal Sagar     2020-05-27  727  	mutex_unlock(&xcsi2rxss->lock);
ba5bf51acf0075 Vishal Sagar     2020-05-27  728  
ba5bf51acf0075 Vishal Sagar     2020-05-27  729  	return 0;
ba5bf51acf0075 Vishal Sagar     2020-05-27  730  }
ba5bf51acf0075 Vishal Sagar     2020-05-27  731  
ba5bf51acf0075 Vishal Sagar     2020-05-27  732  /**
ba5bf51acf0075 Vishal Sagar     2020-05-27  733   * xcsi2rxss_get_format - Get the pad format
ba5bf51acf0075 Vishal Sagar     2020-05-27  734   * @sd: Pointer to V4L2 Sub device structure
102ab7d8fbe33a Vishal Sagar     2021-04-29  735   * @cfg: Pointer to sub device pad information structure
ba5bf51acf0075 Vishal Sagar     2020-05-27  736   * @fmt: Pointer to pad level media bus format
ba5bf51acf0075 Vishal Sagar     2020-05-27  737   *
ba5bf51acf0075 Vishal Sagar     2020-05-27  738   * This function is used to get the pad format information.
ba5bf51acf0075 Vishal Sagar     2020-05-27  739   *
ba5bf51acf0075 Vishal Sagar     2020-05-27  740   * Return: 0 on success
ba5bf51acf0075 Vishal Sagar     2020-05-27  741   */
ba5bf51acf0075 Vishal Sagar     2020-05-27  742  static int xcsi2rxss_get_format(struct v4l2_subdev *sd,
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  743  				struct v4l2_subdev_state *sd_state,
ba5bf51acf0075 Vishal Sagar     2020-05-27  744  				struct v4l2_subdev_format *fmt)
ba5bf51acf0075 Vishal Sagar     2020-05-27 @745  {
ba5bf51acf0075 Vishal Sagar     2020-05-27  746  	struct xcsi2rxss_state *xcsi2rxss = to_xcsi2rxssstate(sd);
102ab7d8fbe33a Vishal Sagar     2021-04-29  747  	struct v4l2_mbus_framefmt *get_fmt;
102ab7d8fbe33a Vishal Sagar     2021-04-29  748  	int ret = 0;
ba5bf51acf0075 Vishal Sagar     2020-05-27  749  
ba5bf51acf0075 Vishal Sagar     2020-05-27  750  	mutex_lock(&xcsi2rxss->lock);
102ab7d8fbe33a Vishal Sagar     2021-04-29  751  
102ab7d8fbe33a Vishal Sagar     2021-04-29  752  	get_fmt = __xcsi2rxss_get_pad_format(xcsi2rxss, sd_state, fmt->pad,
ba5bf51acf0075 Vishal Sagar     2020-05-27  753  					     fmt->which);
102ab7d8fbe33a Vishal Sagar     2021-04-29  754  	if (!get_fmt) {
102ab7d8fbe33a Vishal Sagar     2021-04-29  755  		ret = -EINVAL;
102ab7d8fbe33a Vishal Sagar     2021-04-29  756  		goto unlock_get_format;
102ab7d8fbe33a Vishal Sagar     2021-04-29  757  	}
102ab7d8fbe33a Vishal Sagar     2021-04-29  758  
102ab7d8fbe33a Vishal Sagar     2021-04-29  759  	fmt->format = *get_fmt;
102ab7d8fbe33a Vishal Sagar     2021-04-29  760  
102ab7d8fbe33a Vishal Sagar     2021-04-29  761  unlock_get_format:
ba5bf51acf0075 Vishal Sagar     2020-05-27  762  	mutex_unlock(&xcsi2rxss->lock);
ba5bf51acf0075 Vishal Sagar     2020-05-27  763  
102ab7d8fbe33a Vishal Sagar     2021-04-29  764  	return ret;
ba5bf51acf0075 Vishal Sagar     2020-05-27  765  }
ba5bf51acf0075 Vishal Sagar     2020-05-27  766  
ba5bf51acf0075 Vishal Sagar     2020-05-27  767  /**
ba5bf51acf0075 Vishal Sagar     2020-05-27  768   * xcsi2rxss_set_format - This is used to set the pad format
ba5bf51acf0075 Vishal Sagar     2020-05-27  769   * @sd: Pointer to V4L2 Sub device structure
102ab7d8fbe33a Vishal Sagar     2021-04-29  770   * @cfg: Pointer to sub device pad information structure
ba5bf51acf0075 Vishal Sagar     2020-05-27  771   * @fmt: Pointer to pad level media bus format
ba5bf51acf0075 Vishal Sagar     2020-05-27  772   *
ba5bf51acf0075 Vishal Sagar     2020-05-27  773   * This function is used to set the pad format. Since the pad format is fixed
ba5bf51acf0075 Vishal Sagar     2020-05-27  774   * in hardware, it can't be modified on run time. So when a format set is
ba5bf51acf0075 Vishal Sagar     2020-05-27  775   * requested by application, all parameters except the format type is saved
ba5bf51acf0075 Vishal Sagar     2020-05-27  776   * for the pad and the original pad format is sent back to the application.
ba5bf51acf0075 Vishal Sagar     2020-05-27  777   *
ba5bf51acf0075 Vishal Sagar     2020-05-27  778   * Return: 0 on success
ba5bf51acf0075 Vishal Sagar     2020-05-27  779   */
ba5bf51acf0075 Vishal Sagar     2020-05-27  780  static int xcsi2rxss_set_format(struct v4l2_subdev *sd,
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  781  				struct v4l2_subdev_state *sd_state,
ba5bf51acf0075 Vishal Sagar     2020-05-27  782  				struct v4l2_subdev_format *fmt)
ba5bf51acf0075 Vishal Sagar     2020-05-27 @783  {
ba5bf51acf0075 Vishal Sagar     2020-05-27  784  	struct xcsi2rxss_state *xcsi2rxss = to_xcsi2rxssstate(sd);
ba5bf51acf0075 Vishal Sagar     2020-05-27  785  	struct v4l2_mbus_framefmt *__format;
ba5bf51acf0075 Vishal Sagar     2020-05-27  786  	u32 dt;
102ab7d8fbe33a Vishal Sagar     2021-04-29  787  	int ret = 0;
ba5bf51acf0075 Vishal Sagar     2020-05-27  788  
ba5bf51acf0075 Vishal Sagar     2020-05-27  789  	mutex_lock(&xcsi2rxss->lock);
ba5bf51acf0075 Vishal Sagar     2020-05-27  790  
ba5bf51acf0075 Vishal Sagar     2020-05-27  791  	/*
ba5bf51acf0075 Vishal Sagar     2020-05-27  792  	 * Only the format->code parameter matters for CSI as the
ba5bf51acf0075 Vishal Sagar     2020-05-27  793  	 * CSI format cannot be changed at runtime.
ba5bf51acf0075 Vishal Sagar     2020-05-27  794  	 * Ensure that format to set is copied to over to CSI pad format
ba5bf51acf0075 Vishal Sagar     2020-05-27  795  	 */
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  796  	__format = __xcsi2rxss_get_pad_format(xcsi2rxss, sd_state,
ba5bf51acf0075 Vishal Sagar     2020-05-27  797  					      fmt->pad, fmt->which);
102ab7d8fbe33a Vishal Sagar     2021-04-29  798  	if (!__format) {
102ab7d8fbe33a Vishal Sagar     2021-04-29  799  		ret = -EINVAL;
102ab7d8fbe33a Vishal Sagar     2021-04-29  800  		goto unlock_set_format;
102ab7d8fbe33a Vishal Sagar     2021-04-29  801  	}
ba5bf51acf0075 Vishal Sagar     2020-05-27  802  
ba5bf51acf0075 Vishal Sagar     2020-05-27  803  	/* only sink pad format can be updated */
ba5bf51acf0075 Vishal Sagar     2020-05-27  804  	if (fmt->pad == XVIP_PAD_SOURCE) {
ba5bf51acf0075 Vishal Sagar     2020-05-27  805  		fmt->format = *__format;
102ab7d8fbe33a Vishal Sagar     2021-04-29  806  		goto unlock_set_format;
ba5bf51acf0075 Vishal Sagar     2020-05-27  807  	}
ba5bf51acf0075 Vishal Sagar     2020-05-27  808  
ba5bf51acf0075 Vishal Sagar     2020-05-27  809  	/*
ba5bf51acf0075 Vishal Sagar     2020-05-27  810  	 * RAW8 is supported in all datatypes. So if requested media bus format
ba5bf51acf0075 Vishal Sagar     2020-05-27  811  	 * is of RAW8 type, then allow to be set. In case core is configured to
ba5bf51acf0075 Vishal Sagar     2020-05-27  812  	 * other RAW, YUV422 8/10 or RGB888, set appropriate media bus format.
ba5bf51acf0075 Vishal Sagar     2020-05-27  813  	 */
ba5bf51acf0075 Vishal Sagar     2020-05-27  814  	dt = xcsi2rxss_get_dt(fmt->format.code);
2b891d3980f6c2 Laurent Pinchart 2022-01-23  815  	if (dt != xcsi2rxss->datatype && dt != MIPI_CSI2_DT_RAW8) {
ba5bf51acf0075 Vishal Sagar     2020-05-27  816  		dev_dbg(xcsi2rxss->dev, "Unsupported media bus format");
ba5bf51acf0075 Vishal Sagar     2020-05-27  817  		/* set the default format for the data type */
ba5bf51acf0075 Vishal Sagar     2020-05-27  818  		fmt->format.code = xcsi2rxss_get_nth_mbus(xcsi2rxss->datatype,
ba5bf51acf0075 Vishal Sagar     2020-05-27  819  							  0);
ba5bf51acf0075 Vishal Sagar     2020-05-27  820  	}
ba5bf51acf0075 Vishal Sagar     2020-05-27  821  
ba5bf51acf0075 Vishal Sagar     2020-05-27  822  	*__format = fmt->format;
102ab7d8fbe33a Vishal Sagar     2021-04-29  823  
102ab7d8fbe33a Vishal Sagar     2021-04-29  824  unlock_set_format:
ba5bf51acf0075 Vishal Sagar     2020-05-27  825  	mutex_unlock(&xcsi2rxss->lock);
ba5bf51acf0075 Vishal Sagar     2020-05-27  826  
102ab7d8fbe33a Vishal Sagar     2021-04-29  827  	return ret;
ba5bf51acf0075 Vishal Sagar     2020-05-27  828  }
ba5bf51acf0075 Vishal Sagar     2020-05-27  829  

:::::: The code at line 717 was first introduced by commit
:::::: ba5bf51acf0075b193878a56ea3741982391da9c media: v4l: xilinx: Add Xilinx MIPI CSI-2 Rx Subsystem driver

:::::: TO: Vishal Sagar <vishal.sagar@xilinx.com>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
