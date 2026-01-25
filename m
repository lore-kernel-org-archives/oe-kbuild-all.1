Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7191DF25C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jan 2026 11:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769341144; cv=none; b=DTs3xHh+UgNSZ8pf8kSMT9AaVzxyl8t8anrHOzfbCRnsydfsKorfh4Ls4F+mXofgnmYxZ3HqUP7TP/NqWVWjf18e5o3q0GTS89kUW/yh/nVSzNp8xKmKkQoXSCAjCVA7A9nYaqi/0mSrRdLpj/p2wD9tZ7o+Qs0CYaMMY5ZFCkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769341144; c=relaxed/simple;
	bh=hppzs4PtZ2RcfRfzmw9atgN7SnYMpxJ97jpXf49BNWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VdJ3C9HrUtkO64XIlGfqqnRcmjJISJ36wkgHJXuH7jD+8V1/3sBP3AWu/UjKw8Qr7tXvgN+CJsacNXzFLgqOnTLvS6RQ2n36j9nNYuvLoxQXS+myzPT2HIaeVk2VhJ/yzmMah/id/TOM3exMGR03n4BL+djH8eZukCS2Y5DEMMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PQFX09Wc; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PQFX09Wc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769341142; x=1800877142;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hppzs4PtZ2RcfRfzmw9atgN7SnYMpxJ97jpXf49BNWo=;
  b=PQFX09WcznY1OfF7yWrqq+ZNCeWltYLbuYHjqOmCAfoF3Xn/uDJ37fBs
   P4Cf4UccyZ0IqnOsMqvbO3i/XwIj3ImFwbYdxogpxxYvBWySwifX6Uwyc
   /a1jQHR4Erq008AzZZO0oK2ZGBqWQlIW5VEOxjF7fAe0KcJJjK/THGUD4
   UrEeuBttdqQDlersiPG6P4JiZwEJmjde9oRFrWYX+ruRGdWwrpNXsN8uy
   t1nTJAvKR9JKPA58o0hkkvQ7i9sAn7Kq/vKDdV2blgFJheuPpqpOtLedM
   AkKo2DZH3CyCpzR4AqaK7P0qWQR23Jn52UBlpy03CJAG/Mdbv7Ab/qctr
   A==;
X-CSE-ConnectionGUID: JRg0SWFrRfqS0EFHqZhTiw==
X-CSE-MsgGUID: DEbPfr6WQZmTX5G1BU/iTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="70440638"
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="70440638"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 03:39:01 -0800
X-CSE-ConnectionGUID: /+rfgwwQR0CxzdgKvzq/iw==
X-CSE-MsgGUID: kVf5B5QiT262qek9NjF/hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="212298969"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 25 Jan 2026 03:39:00 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjySI-00000000VyQ-0mnj;
	Sun, 25 Jan 2026 11:38:58 +0000
Date: Sun, 25 Jan 2026 19:38:34 +0800
From: kernel test robot <lkp@intel.com>
To: Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v1 09/11] media: platform: Add NXP Neoisp Image Signal
 Processor
Message-ID: <202601251949.tfmL0ZqH-lkp@intel.com>
References: <20260123080938.3367348-10-antoine.bouyer@nxp.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123080938.3367348-10-antoine.bouyer@nxp.com>

Hi Antoine,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on linus/master v6.19-rc6 next-20260123]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Antoine-Bouyer/media-uapi-v4l2-isp-Add-v4l2-ISP-extensible-statistics-definitions/20260123-161422
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20260123080938.3367348-10-antoine.bouyer%40nxp.com
patch subject: [RFC v1 09/11] media: platform: Add NXP Neoisp Image Signal Processor
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260125/202601251949.tfmL0ZqH-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260125/202601251949.tfmL0ZqH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601251949.tfmL0ZqH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/nxp/neoisp/neoisp_ctx.c: In function 'neoisp_ctx_update_buf_addr':
>> drivers/media/platform/nxp/neoisp/neoisp_ctx.c:1841:20: warning: variable 'height' set but not used [-Wunused-but-set-variable]
    1841 |         u32 width, height, ibpp, inp0_stride, inp1_stride;
         |                    ^~~~~~
>> drivers/media/platform/nxp/neoisp/neoisp_ctx.c:1841:13: warning: variable 'width' set but not used [-Wunused-but-set-variable]
    1841 |         u32 width, height, ibpp, inp0_stride, inp1_stride;
         |             ^~~~~


vim +/height +1841 drivers/media/platform/nxp/neoisp/neoisp_ctx.c

  1828	
  1829	/*
  1830	 * Set pipe conf volatile settings (i.e. buffer addresses)
  1831	 */
  1832	void neoisp_ctx_update_buf_addr(struct neoisp_dev_s *neoispd)
  1833	{
  1834		struct neoisp_job_s *job = &neoispd->queued_job;
  1835		struct neoisp_pipe_conf_s *cfg = &job->node_group->context->hw.pipe_conf.common;
  1836		struct neoisp_buffer_s *buf_inp0 = job->buf[NEOISP_INPUT0_NODE];
  1837		struct neoisp_buffer_s *buf_inp1 = job->buf[NEOISP_INPUT1_NODE];
  1838		struct neoisp_buffer_s *buf_out = job->buf[NEOISP_FRAME_NODE];
  1839		struct neoisp_buffer_s *buf_ir = job->buf[NEOISP_IR_NODE];
  1840		struct neoisp_node_s *nd;
> 1841		u32 width, height, ibpp, inp0_stride, inp1_stride;
  1842		dma_addr_t inp0_addr, inp1_addr;
  1843	
  1844		/* Input0 specific */
  1845		nd = &job->node_group->node[NEOISP_INPUT0_NODE];
  1846		width = nd->crop.width;
  1847		height = nd->crop.height;
  1848		ibpp = (nd->neoisp_format->bit_depth + 7) / 8;
  1849		inp0_stride = nd->format.fmt.pix_mp.plane_fmt[0].bytesperline;
  1850	
  1851		/* Input0 - Take crop into account if any */
  1852		inp0_addr = get_addr(buf_inp0, 0) + (nd->crop.left * ibpp) + (nd->crop.top * inp0_stride);
  1853	
  1854		/* Input 1 specific */
  1855		nd = &job->node_group->node[NEOISP_INPUT1_NODE];
  1856		ibpp = (nd->neoisp_format->bit_depth + 7) / 8;
  1857		inp1_stride = nd->format.fmt.pix_mp.plane_fmt[0].bytesperline;
  1858	
  1859		/* Input1 - Take crop into account if any */
  1860		inp1_addr = get_addr(buf_inp1, 0) + (nd->crop.left * ibpp) + (nd->crop.top * inp1_stride);
  1861	
  1862		cfg->img0_in_addr =
  1863			NEO_PIPE_CONF_ADDR_SET(inp0_addr);
  1864	
  1865		/* Handle hdr inputs */
  1866		nd = &job->node_group->node[NEOISP_INPUT1_NODE];
  1867		if (neoisp_node_link_is_enabled(nd)) {
  1868			cfg->img1_in_addr =
  1869				NEO_PIPE_CONF_ADDR_SET(inp1_addr);
  1870		}
  1871	
  1872		nd = &job->node_group->node[NEOISP_FRAME_NODE];
  1873		if (neoisp_node_link_is_enabled(nd)) {
  1874			/* Planar/multiplanar output image addresses */
  1875			switch (nd->format.fmt.pix_mp.pixelformat) {
  1876			case V4L2_PIX_FMT_GREY:
  1877			case V4L2_PIX_FMT_Y10:
  1878			case V4L2_PIX_FMT_Y12:
  1879			case V4L2_PIX_FMT_Y16:
  1880			case V4L2_PIX_FMT_Y16_BE:
  1881				/* Monochrome formats: only output channel 0 is used */
  1882				cfg->outch0_addr =
  1883					NEO_PIPE_CONF_ADDR_SET(get_addr(buf_out, 0));
  1884				break;
  1885			case V4L2_PIX_FMT_NV12:
  1886			case V4L2_PIX_FMT_NV21:
  1887			case V4L2_PIX_FMT_NV16:
  1888			case V4L2_PIX_FMT_NV61:
  1889				/* Semi-Planar formats: both output channels are used */
  1890				cfg->outch0_addr =
  1891					NEO_PIPE_CONF_ADDR_SET(get_addr(buf_out, 0));
  1892				cfg->outch1_addr =
  1893					NEO_PIPE_CONF_ADDR_SET(get_addr(buf_out, 1));
  1894				break;
  1895			default:
  1896				/* Interleaved formats: only output channel 1 is used */
  1897				cfg->outch1_addr =
  1898					NEO_PIPE_CONF_ADDR_SET(get_addr(buf_out, 0));
  1899				break;
  1900			}
  1901		}
  1902	
  1903		nd = &job->node_group->node[NEOISP_IR_NODE];
  1904		if (neoisp_node_link_is_enabled(nd))
  1905			cfg->outir_addr =
  1906				NEO_PIPE_CONF_ADDR_SET(get_addr(buf_ir, 0));
  1907	}
  1908	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
