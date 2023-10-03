Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9E43C682
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Oct 2023 18:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696356842; x=1727892842;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7shGVbwufDi255xhsow5N8N9PYMPZlgDzXRDaKd6OxA=;
  b=lFworFV+NaOyKbK3Qk+WPbIG/lP+1thue1TgGSfSK3XQ/i599u5xat/O
   o50r3FeHSUtOd5NA2nFKI3Wv177Si50g5csXS1kcJkHEf7VIDJQJNnkSu
   1Ma2qFXT/w5pg15oABmyMZDbtNcqRYjStOJHDDHZG7QhDebUD0e+YrIQM
   62OoCVpKN/1ezrCAoX/RbKhnhL3zEoRYTXrTmjijejRxYP13JJ7aZFwGN
   PVJfR7WHRDD7APqVSTCiCDoBQl/pdQMEgpCh/XEI4FQQ5k8w0FQJbM4K3
   81MBLmgEPtjb1j9esvtvpC1SuSVWApZZ7ofe6Uy5dAs9V4KZhy2F4899H
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="447116014"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; 
   d="scan'208";a="447116014"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 11:13:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="744601519"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; 
   d="scan'208";a="744601519"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 03 Oct 2023 11:13:55 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnju5-000898-24;
	Tue, 03 Oct 2023 18:13:53 +0000
Date: Wed, 4 Oct 2023 02:13:30 +0800
From: kernel test robot <lkp@intel.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v5 08/11] media: uapi: Add audio rate controls support
Message-ID: <202310040137.exfru77p-lkp@intel.com>
References: <1695891619-32393-9-git-send-email-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1695891619-32393-9-git-send-email-shengjiu.wang@nxp.com>

Hi Shengjiu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[also build test WARNING on broonie-sound/for-next tiwai-sound/for-next tiwai-sound/for-linus linus/master v6.6-rc4 next-20231003]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shengjiu-Wang/ASoC-fsl_asrc-define-functions-for-memory-to-memory-usage/20230928-173903
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/1695891619-32393-9-git-send-email-shengjiu.wang%40nxp.com
patch subject: [RFC PATCH v5 08/11] media: uapi: Add audio rate controls support
reproduce: (https://download.01.org/0day-ci/archive/20231004/202310040137.exfru77p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310040137.exfru77p-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./include/media/v4l2-ctrls.h:95: warning: Function parameter or member 'p_asrc_rate' not described in 'v4l2_ctrl_ptr'

vim +95 ./include/media/v4l2-ctrls.h

0996517cf8eade Hans Verkuil          2010-08-01  27  
8c2721d57a4bac Mauro Carvalho Chehab 2015-08-22  28  /**
8c2721d57a4bac Mauro Carvalho Chehab 2015-08-22  29   * union v4l2_ctrl_ptr - A pointer to a control value.
0176077a813933 Hans Verkuil          2014-04-27  30   * @p_s32:			Pointer to a 32-bit signed value.
0176077a813933 Hans Verkuil          2014-04-27  31   * @p_s64:			Pointer to a 64-bit signed value.
dda4a4d5ea2455 Hans Verkuil          2014-06-10  32   * @p_u8:			Pointer to a 8-bit unsigned value.
dda4a4d5ea2455 Hans Verkuil          2014-06-10  33   * @p_u16:			Pointer to a 16-bit unsigned value.
811c508104d092 Hans Verkuil          2014-07-21  34   * @p_u32:			Pointer to a 32-bit unsigned value.
0176077a813933 Hans Verkuil          2014-04-27  35   * @p_char:			Pointer to a string.
f329e21e9dadc5 Ezequiel Garcia       2021-04-29  36   * @p_mpeg2_sequence:		Pointer to a MPEG2 sequence structure.
f329e21e9dadc5 Ezequiel Garcia       2021-04-29  37   * @p_mpeg2_picture:		Pointer to a MPEG2 picture structure.
118f3e1562f2b1 Ezequiel Garcia       2021-04-29  38   * @p_mpeg2_quantisation:	Pointer to a MPEG2 quantisation data structure.
2495f39ce1fa02 Dafna Hirschfeld      2019-03-06  39   * @p_fwht_params:		Pointer to a FWHT stateless parameters structure.
1f0545d3ed1df3 Pawel Osciak          2019-05-24  40   * @p_h264_sps:			Pointer to a struct v4l2_ctrl_h264_sps.
1f0545d3ed1df3 Pawel Osciak          2019-05-24  41   * @p_h264_pps:			Pointer to a struct v4l2_ctrl_h264_pps.
1f0545d3ed1df3 Pawel Osciak          2019-05-24  42   * @p_h264_scaling_matrix:	Pointer to a struct v4l2_ctrl_h264_scaling_matrix.
1f0545d3ed1df3 Pawel Osciak          2019-05-24  43   * @p_h264_slice_params:	Pointer to a struct v4l2_ctrl_h264_slice_params.
1f0545d3ed1df3 Pawel Osciak          2019-05-24  44   * @p_h264_decode_params:	Pointer to a struct v4l2_ctrl_h264_decode_params.
eb44c6c9c236b1 Ezequiel Garcia       2020-08-25  45   * @p_h264_pred_weights:	Pointer to a struct v4l2_ctrl_h264_pred_weights.
d04c114e806f93 Ezequiel Garcia       2021-03-04  46   * @p_vp8_frame:		Pointer to a VP8 frame params structure.
b88dbe38dca824 Andrzej Pietrasiewicz 2021-11-16  47   * @p_vp9_compressed_hdr_probs:	Pointer to a VP9 frame compressed header probs structure.
b88dbe38dca824 Andrzej Pietrasiewicz 2021-11-16  48   * @p_vp9_frame:		Pointer to a VP9 frame params structure.
256fa3920874b0 Paul Kocialkowski     2019-10-22  49   * @p_hevc_sps:			Pointer to an HEVC sequence parameter set structure.
256fa3920874b0 Paul Kocialkowski     2019-10-22  50   * @p_hevc_pps:			Pointer to an HEVC picture parameter set structure.
256fa3920874b0 Paul Kocialkowski     2019-10-22  51   * @p_hevc_slice_params:	Pointer to an HEVC slice parameters structure.
1ad0de78e7944e Stanimir Varbanov     2021-01-19  52   * @p_hdr10_cll:		Pointer to an HDR10 Content Light Level structure.
1ad0de78e7944e Stanimir Varbanov     2021-01-19  53   * @p_hdr10_mastering:		Pointer to an HDR10 Mastering Display structure.
d1dc49370f8371 Ricardo Ribalda       2019-10-07  54   * @p_area:			Pointer to an area.
9de30f579980b4 Daniel Almeida        2023-03-06  55   * @p_av1_sequence:		Pointer to an AV1 sequence structure.
9de30f579980b4 Daniel Almeida        2023-03-06  56   * @p_av1_tile_group_entry:	Pointer to an AV1 tile group entry structure.
9de30f579980b4 Daniel Almeida        2023-03-06  57   * @p_av1_frame:		Pointer to an AV1 frame structure.
9de30f579980b4 Daniel Almeida        2023-03-06  58   * @p_av1_film_grain:		Pointer to an AV1 film grain structure.
0176077a813933 Hans Verkuil          2014-04-27  59   * @p:				Pointer to a compound value.
f1bd5eae7de76e Ricardo Ribalda       2019-11-04  60   * @p_const:			Pointer to a constant compound value.
0176077a813933 Hans Verkuil          2014-04-27  61   */
0176077a813933 Hans Verkuil          2014-04-27  62  union v4l2_ctrl_ptr {
0176077a813933 Hans Verkuil          2014-04-27  63  	s32 *p_s32;
0176077a813933 Hans Verkuil          2014-04-27  64  	s64 *p_s64;
dda4a4d5ea2455 Hans Verkuil          2014-06-10  65  	u8 *p_u8;
dda4a4d5ea2455 Hans Verkuil          2014-06-10  66  	u16 *p_u16;
811c508104d092 Hans Verkuil          2014-07-21  67  	u32 *p_u32;
0176077a813933 Hans Verkuil          2014-04-27  68  	char *p_char;
f329e21e9dadc5 Ezequiel Garcia       2021-04-29  69  	struct v4l2_ctrl_mpeg2_sequence *p_mpeg2_sequence;
f329e21e9dadc5 Ezequiel Garcia       2021-04-29  70  	struct v4l2_ctrl_mpeg2_picture *p_mpeg2_picture;
118f3e1562f2b1 Ezequiel Garcia       2021-04-29  71  	struct v4l2_ctrl_mpeg2_quantisation *p_mpeg2_quantisation;
2495f39ce1fa02 Dafna Hirschfeld      2019-03-06  72  	struct v4l2_ctrl_fwht_params *p_fwht_params;
1f0545d3ed1df3 Pawel Osciak          2019-05-24  73  	struct v4l2_ctrl_h264_sps *p_h264_sps;
1f0545d3ed1df3 Pawel Osciak          2019-05-24  74  	struct v4l2_ctrl_h264_pps *p_h264_pps;
1f0545d3ed1df3 Pawel Osciak          2019-05-24  75  	struct v4l2_ctrl_h264_scaling_matrix *p_h264_scaling_matrix;
1f0545d3ed1df3 Pawel Osciak          2019-05-24  76  	struct v4l2_ctrl_h264_slice_params *p_h264_slice_params;
1f0545d3ed1df3 Pawel Osciak          2019-05-24  77  	struct v4l2_ctrl_h264_decode_params *p_h264_decode_params;
eb44c6c9c236b1 Ezequiel Garcia       2020-08-25  78  	struct v4l2_ctrl_h264_pred_weights *p_h264_pred_weights;
d04c114e806f93 Ezequiel Garcia       2021-03-04  79  	struct v4l2_ctrl_vp8_frame *p_vp8_frame;
256fa3920874b0 Paul Kocialkowski     2019-10-22  80  	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
256fa3920874b0 Paul Kocialkowski     2019-10-22  81  	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
256fa3920874b0 Paul Kocialkowski     2019-10-22  82  	struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
b88dbe38dca824 Andrzej Pietrasiewicz 2021-11-16  83  	struct v4l2_ctrl_vp9_compressed_hdr *p_vp9_compressed_hdr_probs;
b88dbe38dca824 Andrzej Pietrasiewicz 2021-11-16  84  	struct v4l2_ctrl_vp9_frame *p_vp9_frame;
1ad0de78e7944e Stanimir Varbanov     2021-01-19  85  	struct v4l2_ctrl_hdr10_cll_info *p_hdr10_cll;
1ad0de78e7944e Stanimir Varbanov     2021-01-19  86  	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
d1dc49370f8371 Ricardo Ribalda       2019-10-07  87  	struct v4l2_area *p_area;
9de30f579980b4 Daniel Almeida        2023-03-06  88  	struct v4l2_ctrl_av1_sequence *p_av1_sequence;
9de30f579980b4 Daniel Almeida        2023-03-06  89  	struct v4l2_ctrl_av1_tile_group_entry *p_av1_tile_group_entry;
9de30f579980b4 Daniel Almeida        2023-03-06  90  	struct v4l2_ctrl_av1_frame *p_av1_frame;
9de30f579980b4 Daniel Almeida        2023-03-06  91  	struct v4l2_ctrl_av1_film_grain *p_av1_film_grain;
2bf2cfa52a38a1 Shengjiu Wang         2023-09-28  92  	struct v4l2_ctrl_asrc_rate *p_asrc_rate;
0176077a813933 Hans Verkuil          2014-04-27  93  	void *p;
f1bd5eae7de76e Ricardo Ribalda       2019-11-04  94  	const void *p_const;
0176077a813933 Hans Verkuil          2014-04-27 @95  };
0176077a813933 Hans Verkuil          2014-04-27  96  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
