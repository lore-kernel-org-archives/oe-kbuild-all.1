Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAF0149C78
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 May 2024 03:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715311126; cv=none; b=Q0ISXYBeeoEJNayq7zV5zjcV3a2JaQjhnsUtW7c5f3qBK9D3Rik754LWDkawgda868FcbbY+DGYEBqmhf6p008ywRDWzkhodgn/XpUgmPREas6Mt7TAREmGxBUwxqeShg+VYPtXlkgEcNSDDUyJn1EJT8iB6zdzzBENQ74zYq+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715311126; c=relaxed/simple;
	bh=2Hkh+D7A3+9I+g4VTqamE95LKjpsbW4LEEh7Fg9xnnI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PkdoM6wEEPy77i2zdPMPNsd33PzkPSS9mO3w/pecjfVDrzZoSH1uAtxAnKsmXoxl6BI8g6vLibQyItiodziH4QwTEJq9awN6IFS0IXNCbPCRuffUjlQtJe4ZykvaHarWk/0MER0F9TgtXzrNEqJa7XjeC8gzJdI9FuMpB39KQug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EU8lI10h; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EU8lI10h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715311125; x=1746847125;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2Hkh+D7A3+9I+g4VTqamE95LKjpsbW4LEEh7Fg9xnnI=;
  b=EU8lI10hw3AsF5B5EoG4ga+UmX9YdFaPtjtrExf6nt62qlpKSiMCtyqJ
   9uj1398fJDW9SfFVclypwOTUYAMbPvilIa8K1uRVCfskaVTcltn1d/gYC
   1omWUuSxbsT6OdC/jog1W9cxUjNXNrhCfYbW5UwBv+wfh9BNbqi7maodX
   MgJe+LQx3wlw9Y9GtzzfC2/YDwKT2lIs7DDkFGs5ljWTInKvOZg+SDBN+
   YXmVnofbVzTinjv7F41qDcvv1X5RuDC38tx2aUtCKLC9SbRoTVE84lQiA
   KZO5Gf4SSkgkPGPl+DLNlj4gDnwGjPTtPJ+3bFtrEUZkqPCdri3W+b/aJ
   g==;
X-CSE-ConnectionGUID: JLqg75QbQDefpdpG6PGmSg==
X-CSE-MsgGUID: 9NS0nRsfTMem9SrCWQjtsg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11121688"
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; 
   d="scan'208";a="11121688"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 20:18:45 -0700
X-CSE-ConnectionGUID: xLrYM4QnT1WKip2fyTuP4A==
X-CSE-MsgGUID: weAUcQU4QFWhqH9+hhKERg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; 
   d="scan'208";a="30015495"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 May 2024 20:18:43 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5GmO-0005fN-1q;
	Fri, 10 May 2024 03:18:40 +0000
Date: Fri, 10 May 2024 11:17:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 99/104]
 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw.c:178:38:
 error: cast to pointer from integer of different size
Message-ID: <202405101121.bZVN9oK0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   cb75f24663df84986d5056df93e821564be6d886
commit: 3d4651aa212e1a671e15a4a8411b748bb70a8585 [99/104] CHROMIUM: media: platform: mediatek: isp: isp_7x camsys driver migration
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20240510/202405101121.bZVN9oK0-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240510/202405101121.bZVN9oK0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405101121.bZVN9oK0-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw.c: In function 'mtk_cam_raw_res_copy_fmt_from_user':
>> drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw.c:178:38: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
     178 |         bytes = copy_from_user(dest, (void __user *)res_user->sink_fmt,
         |                                      ^
   drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw.c: In function 'mtk_cam_raw_res_copy_fmt_to_user':
   drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw.c:198:30: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
     198 |         bytes = copy_to_user((void __user *)res_user->sink_fmt, src, sizeof(*src));
         |                              ^
   drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw.c: In function 'mtk_cam_raw_get_ctrl':
   drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw.c:227:64: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
     227 |                                                                (struct v4l2_mbus_framefmt *)
         |                                                                ^
   drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw.c: In function 'mtk_raw_fmt_get_res':
   drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw.c:2577:20: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
    2577 |         user_ptr = (void *)addr;
         |                    ^
   cc1: all warnings being treated as errors
--
   drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-debug.c: In function 'mtk_cam_exception_work':
>> drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-debug.c:881:42: error: '%s' directive output may be truncated writing up to 63 bytes into a region of size 41 [-Werror=format-truncation=]
     881 |         snprintf(title_desc, 48, "Camsys:%s", dbg_work->desc);
         |                                          ^~
   drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-debug.c:881:9: note: 'snprintf' output between 8 and 71 bytes into a destination of size 48
     881 |         snprintf(title_desc, 48, "Camsys:%s", dbg_work->desc);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-debug.c:882:53: error: '%s' directive output may be truncated writing up to 63 bytes into a region of size between 0 and 33 [-Werror=format-truncation=]
     882 |         snprintf(warn_desc, 48, "%s:ctx(%d):req(%d):%s",
         |                                                     ^~
   drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-debug.c:882:9: note: 'snprintf' output between 16 and 125 bytes into a destination of size 48
     882 |         snprintf(warn_desc, 48, "%s:ctx(%d):req(%d):%s",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     883 |                  req->req.debug_str, ctx->stream_id, s_data->frame_seq_no,
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     884 |                  dbg_work->desc);
         |                  ~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +178 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw.c

   157	
   158	static bool mtk_cam_raw_resource_calc(struct mtk_cam_device *cam,
   159					      struct mtk_cam_resource_config *res,
   160					      s64 pixel_rate, int res_plan, int in_w,
   161					      int in_h, int *out_w, int *out_h);
   162	
   163	static int mtk_cam_raw_res_copy_fmt_from_user(struct mtk_raw_pipeline *pipeline,
   164						      struct mtk_cam_resource *res_user,
   165						      struct v4l2_mbus_framefmt *dest)
   166	{
   167		long bytes;
   168		struct device *dev = pipeline->raw->devs[pipeline->id];
   169	
   170		if (!res_user->sink_fmt) {
   171			dev_err(dev,
   172				"%s:pipe(%d): sink_fmt can't be NULL for res ctrl\n",
   173				__func__, pipeline->id);
   174	
   175			return -EINVAL;
   176		}
   177	
 > 178		bytes = copy_from_user(dest, (void __user *)res_user->sink_fmt,
   179				       sizeof(*dest));
   180		if (bytes) {
   181			dev_err(dev,
   182				"%s:pipe(%d): copy_from_user on sink_fmt failed (%ld)\n",
   183				__func__, pipeline->id, bytes);
   184			return -EINVAL;
   185		}
   186	
   187		return 0;
   188	}
   189	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
