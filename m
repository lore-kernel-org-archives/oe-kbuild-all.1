Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345274315D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Nov 2023 19:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LhUBmVaB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700249955; x=1731785955;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cxz4Xaj1IOahQuZbCn4lsL89rB9lM3XwSgHxfC9bHhs=;
  b=LhUBmVaB7nPCpFV0WuiHu8UNCkWdK57EqLsAZVx7tZ2XCa+StT3Hkmyb
   wJ597EQOeGxnL9xwQ+P1h1JwdLrb8WDJ2S5r8OYtRXnUdA3EVjCNNp9y9
   VElLNkRs5876HzVyn3srXe6RPtotB6LS0e6f8LPi5ARfrYbSNg9Be0POD
   bHdc5VPlDKnatHqStsLMaqGIUty6fqKl+wqROrc6ZR/3wVQPIPvX8hNNh
   dGH4EOWRzDJqcfrJIwVzrdkXIVHide0sLVid9YTFootJJOyIpyjb/6GP0
   dgpQf0TfFcGjOFQLYqZUwyMi4FO7JpGTro5giKLH2fgCPUIBq2jGwvYy+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="371535967"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="371535967"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 11:39:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="1013026095"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="1013026095"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 17 Nov 2023 11:39:12 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r44gI-00034p-2I;
	Fri, 17 Nov 2023 19:39:10 +0000
Date: Sat, 18 Nov 2023 03:35:45 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hverkuil-media-tree:fraction_bits 1/3]
 drivers/media/v4l2-core/v4l2-ctrls-core.c:269:25: error: 'const struct
 v4l2_ctrl' has no member named 'fraction_bits'
Message-ID: <202311180358.3Jqd10Pe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git fraction_bits
head:   4eb67a5410cf98ca3636ddca34c61ad48f1ea0ae
commit: d1108d470aed7dd4d6f25f5e165915cb54e7211d [1/3] wip
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231118/202311180358.3Jqd10Pe-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231118/202311180358.3Jqd10Pe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311180358.3Jqd10Pe-lkp@intel.com/

Note: the hverkuil-media-tree/fraction_bits HEAD 4eb67a5410cf98ca3636ddca34c61ad48f1ea0ae builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   drivers/media/v4l2-core/v4l2-ctrls-core.c: In function 'v4l2_ctrl_type_op_log':
>> drivers/media/v4l2-core/v4l2-ctrls-core.c:269:25: error: 'const struct v4l2_ctrl' has no member named 'fraction_bits'
     269 |                 if (ctrl->fraction_bits) {
         |                         ^~
   In file included from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from drivers/media/v4l2-core/v4l2-ctrls-core.c:9:
   drivers/media/v4l2-core/v4l2-ctrls-core.c:270:62: error: 'const struct v4l2_ctrl' has no member named 'fraction_bits'
     270 |                         pr_cont("%d", *ptr.p_s32 / (1 << ctrl->fraction_bits));
         |                                                              ^~
   include/linux/printk.h:427:33: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:540:9: note: in expansion of macro 'printk'
     540 |         printk(KERN_CONT fmt, ##__VA_ARGS__)
         |         ^~~~~~
   drivers/media/v4l2-core/v4l2-ctrls-core.c:270:25: note: in expansion of macro 'pr_cont'
     270 |                         pr_cont("%d", *ptr.p_s32 / (1 << ctrl->fraction_bits));
         |                         ^~~~~~~
   drivers/media/v4l2-core/v4l2-ctrls-core.c:294:25: error: 'const struct v4l2_ctrl' has no member named 'fraction_bits'
     294 |                 if (ctrl->fraction_bits)
         |                         ^~
   drivers/media/v4l2-core/v4l2-ctrls-core.c:295:71: error: 'const struct v4l2_ctrl' has no member named 'fraction_bits'
     295 |                         pr_cont("%u.%03u", (unsigned)*ptr.p_u8 >> ctrl->fraction_bits,
         |                                                                       ^~
   include/linux/printk.h:427:33: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:540:9: note: in expansion of macro 'printk'
     540 |         printk(KERN_CONT fmt, ##__VA_ARGS__)
         |         ^~~~~~
   drivers/media/v4l2-core/v4l2-ctrls-core.c:295:25: note: in expansion of macro 'pr_cont'
     295 |                         pr_cont("%u.%03u", (unsigned)*ptr.p_u8 >> ctrl->fraction_bits,
         |                         ^~~~~~~
   drivers/media/v4l2-core/v4l2-ctrls-core.c:296:67: error: 'const struct v4l2_ctrl' has no member named 'fraction_bits'
     296 |                                 (unsigned)*ptr.p_u8 & ((1U << ctrl->fraction_bits) - 1));
         |                                                                   ^~
   include/linux/printk.h:427:33: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:540:9: note: in expansion of macro 'printk'
     540 |         printk(KERN_CONT fmt, ##__VA_ARGS__)
         |         ^~~~~~
   drivers/media/v4l2-core/v4l2-ctrls-core.c:295:25: note: in expansion of macro 'pr_cont'
     295 |                         pr_cont("%u.%03u", (unsigned)*ptr.p_u8 >> ctrl->fraction_bits,
         |                         ^~~~~~~
   drivers/media/v4l2-core/v4l2-ctrls-core.c:301:25: error: 'const struct v4l2_ctrl' has no member named 'fraction_bits'
     301 |                 if (ctrl->fraction_bits)
         |                         ^~
   drivers/media/v4l2-core/v4l2-ctrls-core.c:302:72: error: 'const struct v4l2_ctrl' has no member named 'fraction_bits'
     302 |                         pr_cont("%u.%05u", (unsigned)*ptr.p_u16 >> ctrl->fraction_bits,
         |                                                                        ^~
   include/linux/printk.h:427:33: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:540:9: note: in expansion of macro 'printk'
     540 |         printk(KERN_CONT fmt, ##__VA_ARGS__)
         |         ^~~~~~
   drivers/media/v4l2-core/v4l2-ctrls-core.c:302:25: note: in expansion of macro 'pr_cont'
     302 |                         pr_cont("%u.%05u", (unsigned)*ptr.p_u16 >> ctrl->fraction_bits,
         |                         ^~~~~~~
   drivers/media/v4l2-core/v4l2-ctrls-core.c:303:68: error: 'const struct v4l2_ctrl' has no member named 'fraction_bits'
     303 |                                 (unsigned)*ptr.p_u16 & ((1U << ctrl->fraction_bits) - 1));
         |                                                                    ^~
   include/linux/printk.h:427:33: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:540:9: note: in expansion of macro 'printk'
     540 |         printk(KERN_CONT fmt, ##__VA_ARGS__)
         |         ^~~~~~
   drivers/media/v4l2-core/v4l2-ctrls-core.c:302:25: note: in expansion of macro 'pr_cont'
     302 |                         pr_cont("%u.%05u", (unsigned)*ptr.p_u16 >> ctrl->fraction_bits,
         |                         ^~~~~~~
   drivers/media/v4l2-core/v4l2-ctrls-core.c:308:25: error: 'const struct v4l2_ctrl' has no member named 'fraction_bits'
     308 |                 if (ctrl->fraction_bits)
         |                         ^~
   drivers/media/v4l2-core/v4l2-ctrls-core.c:309:72: error: 'const struct v4l2_ctrl' has no member named 'fraction_bits'
     309 |                         pr_cont("%u.%09u", (unsigned)*ptr.p_u32 >> ctrl->fraction_bits,
         |                                                                        ^~
   include/linux/printk.h:427:33: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:540:9: note: in expansion of macro 'printk'
     540 |         printk(KERN_CONT fmt, ##__VA_ARGS__)
         |         ^~~~~~
   drivers/media/v4l2-core/v4l2-ctrls-core.c:309:25: note: in expansion of macro 'pr_cont'
     309 |                         pr_cont("%u.%09u", (unsigned)*ptr.p_u32 >> ctrl->fraction_bits,
         |                         ^~~~~~~
   drivers/media/v4l2-core/v4l2-ctrls-core.c:310:68: error: 'const struct v4l2_ctrl' has no member named 'fraction_bits'
     310 |                                 (unsigned)*ptr.p_u32 & ((1U << ctrl->fraction_bits) - 1));
         |                                                                    ^~
   include/linux/printk.h:427:33: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:540:9: note: in expansion of macro 'printk'
     540 |         printk(KERN_CONT fmt, ##__VA_ARGS__)
         |         ^~~~~~
   drivers/media/v4l2-core/v4l2-ctrls-core.c:309:25: note: in expansion of macro 'pr_cont'
     309 |                         pr_cont("%u.%09u", (unsigned)*ptr.p_u32 >> ctrl->fraction_bits,


vim +269 drivers/media/v4l2-core/v4l2-ctrls-core.c

   254	
   255	void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
   256	{
   257		union v4l2_ctrl_ptr ptr = ctrl->p_cur;
   258	
   259		if (ctrl->is_array) {
   260			unsigned i;
   261	
   262			for (i = 0; i < ctrl->nr_of_dims; i++)
   263				pr_cont("[%u]", ctrl->dims[i]);
   264			pr_cont(" ");
   265		}
   266	
   267		switch (ctrl->type) {
   268		case V4L2_CTRL_TYPE_INTEGER:
 > 269			if (ctrl->fraction_bits) {
   270				pr_cont("%d", *ptr.p_s32 / (1 << ctrl->fraction_bits));
   271			} else {
   272				pr_cont("%d", *ptr.p_s32);
   273			}
   274			break;
   275		case V4L2_CTRL_TYPE_BOOLEAN:
   276			pr_cont("%s", *ptr.p_s32 ? "true" : "false");
   277			break;
   278		case V4L2_CTRL_TYPE_MENU:
   279			pr_cont("%s", ctrl->qmenu[*ptr.p_s32]);
   280			break;
   281		case V4L2_CTRL_TYPE_INTEGER_MENU:
   282			pr_cont("%lld", ctrl->qmenu_int[*ptr.p_s32]);
   283			break;
   284		case V4L2_CTRL_TYPE_BITMASK:
   285			pr_cont("0x%08x", *ptr.p_s32);
   286			break;
   287		case V4L2_CTRL_TYPE_INTEGER64:
   288			pr_cont("%lld", *ptr.p_s64);
   289			break;
   290		case V4L2_CTRL_TYPE_STRING:
   291			pr_cont("%s", ptr.p_char);
   292			break;
   293		case V4L2_CTRL_TYPE_U8:
   294			if (ctrl->fraction_bits)
   295				pr_cont("%u.%03u", (unsigned)*ptr.p_u8 >> ctrl->fraction_bits,
   296					(unsigned)*ptr.p_u8 & ((1U << ctrl->fraction_bits) - 1));
   297			else
   298				pr_cont("%u", (unsigned)*ptr.p_u8);
   299			break;
   300		case V4L2_CTRL_TYPE_U16:
   301			if (ctrl->fraction_bits)
   302				pr_cont("%u.%05u", (unsigned)*ptr.p_u16 >> ctrl->fraction_bits,
   303					(unsigned)*ptr.p_u16 & ((1U << ctrl->fraction_bits) - 1));
   304			else
   305				pr_cont("%u", (unsigned)*ptr.p_u16);
   306			break;
   307		case V4L2_CTRL_TYPE_U32:
   308			if (ctrl->fraction_bits)
   309				pr_cont("%u.%09u", (unsigned)*ptr.p_u32 >> ctrl->fraction_bits,
   310					(unsigned)*ptr.p_u32 & ((1U << ctrl->fraction_bits) - 1));
   311			else
   312				pr_cont("%u", (unsigned)*ptr.p_u32);
   313			break;
   314		case V4L2_CTRL_TYPE_H264_SPS:
   315			pr_cont("H264_SPS");
   316			break;
   317		case V4L2_CTRL_TYPE_H264_PPS:
   318			pr_cont("H264_PPS");
   319			break;
   320		case V4L2_CTRL_TYPE_H264_SCALING_MATRIX:
   321			pr_cont("H264_SCALING_MATRIX");
   322			break;
   323		case V4L2_CTRL_TYPE_H264_SLICE_PARAMS:
   324			pr_cont("H264_SLICE_PARAMS");
   325			break;
   326		case V4L2_CTRL_TYPE_H264_DECODE_PARAMS:
   327			pr_cont("H264_DECODE_PARAMS");
   328			break;
   329		case V4L2_CTRL_TYPE_H264_PRED_WEIGHTS:
   330			pr_cont("H264_PRED_WEIGHTS");
   331			break;
   332		case V4L2_CTRL_TYPE_FWHT_PARAMS:
   333			pr_cont("FWHT_PARAMS");
   334			break;
   335		case V4L2_CTRL_TYPE_VP8_FRAME:
   336			pr_cont("VP8_FRAME");
   337			break;
   338		case V4L2_CTRL_TYPE_HDR10_CLL_INFO:
   339			pr_cont("HDR10_CLL_INFO");
   340			break;
   341		case V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY:
   342			pr_cont("HDR10_MASTERING_DISPLAY");
   343			break;
   344		case V4L2_CTRL_TYPE_MPEG2_QUANTISATION:
   345			pr_cont("MPEG2_QUANTISATION");
   346			break;
   347		case V4L2_CTRL_TYPE_MPEG2_SEQUENCE:
   348			pr_cont("MPEG2_SEQUENCE");
   349			break;
   350		case V4L2_CTRL_TYPE_MPEG2_PICTURE:
   351			pr_cont("MPEG2_PICTURE");
   352			break;
   353		case V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR:
   354			pr_cont("VP9_COMPRESSED_HDR");
   355			break;
   356		case V4L2_CTRL_TYPE_VP9_FRAME:
   357			pr_cont("VP9_FRAME");
   358			break;
   359		case V4L2_CTRL_TYPE_HEVC_SPS:
   360			pr_cont("HEVC_SPS");
   361			break;
   362		case V4L2_CTRL_TYPE_HEVC_PPS:
   363			pr_cont("HEVC_PPS");
   364			break;
   365		case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
   366			pr_cont("HEVC_SLICE_PARAMS");
   367			break;
   368		case V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX:
   369			pr_cont("HEVC_SCALING_MATRIX");
   370			break;
   371		case V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS:
   372			pr_cont("HEVC_DECODE_PARAMS");
   373			break;
   374		case V4L2_CTRL_TYPE_AV1_SEQUENCE:
   375			pr_cont("AV1_SEQUENCE");
   376			break;
   377		case V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY:
   378			pr_cont("AV1_TILE_GROUP_ENTRY");
   379			break;
   380		case V4L2_CTRL_TYPE_AV1_FRAME:
   381			pr_cont("AV1_FRAME");
   382			break;
   383		case V4L2_CTRL_TYPE_AV1_FILM_GRAIN:
   384			pr_cont("AV1_FILM_GRAIN");
   385			break;
   386	
   387		default:
   388			pr_cont("unknown type %d", ctrl->type);
   389			break;
   390		}
   391	}
   392	EXPORT_SYMBOL(v4l2_ctrl_type_op_log);
   393	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
