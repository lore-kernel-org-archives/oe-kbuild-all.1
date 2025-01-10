Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8850F2063FE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jan 2025 19:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736537759; cv=none; b=tJlGN5UHK4d6b6sT75SMb3AxljfOS+Z0T4PDoEly1ND81mjqcLbhP0vdww2A7C0mIIkrZ7SFLkTPB4DOc5HjXvnCgOAvrpe2Uoe9Q86gl6kpQo0bmpQB5y6xyfxOdK3xh7K83YUnsLYSCqevLFD3DGTjjKxTbzUjnBB0Z3dk6YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736537759; c=relaxed/simple;
	bh=y1XHznbj5/DljzJRt/gSQ59UKJkgQCQajzqkjsC0Stw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pSwSrQAfAkuY46YgVJZfOnEvbMh93e/Kxz2j9wp1+gfoaJAsx5F5QrZlSU7U81ArY/vtDMTO2z7GisIfJgLCBsslrgKLdd4Dq0V1l1BlShQiF+8YGD5EJPWvk3RMmalSaWkn7eyg7V1yNxcDQ+Tn7hEc8Le3eqk4qLu7zV73f+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FosOcqYc; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FosOcqYc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736537757; x=1768073757;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y1XHznbj5/DljzJRt/gSQ59UKJkgQCQajzqkjsC0Stw=;
  b=FosOcqYcXE15d+rFs2tjBfmnslw7YTt9HEBRsMZ0l5Nqm7PaBU+hSdG1
   gid0D80d69YCh0ktu/7Jfg5NxxpZrERFS0HG1Gu+ZkoXntaZwMOZ4HMma
   cb3S6ygas3au69JXPK+dMFWsIPSfyEbro/74H/u29XFac75ov9kkiyAmw
   kxRjTudkvQraQqduSXR5BdK5o9PTTDmEC/+WoQfYpx5FzAE8Ur9nS0CQO
   66H15PbxJruRNPeGeHgZkm37aapMX+5TYXjnSRIlgt8FSg2ozmpQFC9fI
   MA0KBaC4V19Q980RbMKIhqxi96viXxhVqYZZ4NZLMWQm6Pj0L4LgbqKUj
   Q==;
X-CSE-ConnectionGUID: wkE2XuOcQauY1fvtp/g4hQ==
X-CSE-MsgGUID: dYA0wwz2T9GAKnmgvvEiQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="48256970"
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="48256970"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 11:35:57 -0800
X-CSE-ConnectionGUID: 8ZDfH7PORJyrEOpGIljs9g==
X-CSE-MsgGUID: 3qzbClENR/2UBCivErrmNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="134653768"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Jan 2025 11:35:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWKnQ-000Jg1-17;
	Fri, 10 Jan 2025 19:35:52 +0000
Date: Sat, 11 Jan 2025 03:35:48 +0800
From: kernel test robot <lkp@intel.com>
To: Kaushal Kumar <kaushal.kumar@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Venkat Praveen Kancharlapalli <venkat.praveen.kancharlapalli@amd.com>,
	Vishal Sagar <vishal.sagar@amd.com>
Subject: [xilinx-xlnx:lkp_test 281/504]
 drivers/media/platform/xilinx/xilinx-isppipeline.c:202:36: error: implicit
 declaration of function 'FIELD_GET'
Message-ID: <202501110341.K20gVGSG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: 6726d1a1a60f8495a4efe8d028b58a00a248c190 [281/504] media: xilinx: Add for ISP pipeline driver
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20250111/202501110341.K20gVGSG-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501110341.K20gVGSG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501110341.K20gVGSG-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/xilinx/xilinx-isppipeline.c: In function 'xisp_set_gamma_common':
>> drivers/media/platform/xilinx/xilinx-isppipeline.c:202:36: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     202 | #define XGET_BIT(bitmask, reg)    (FIELD_GET(BIT(bitmask), (reg)))
         |                                    ^~~~~~~~~
   drivers/media/platform/xilinx/xilinx-isppipeline.c:872:30: note: in expansion of macro 'XGET_BIT'
     872 |         bool gamma_enabled = XGET_BIT(XISP_GAMMA_INDEX, xisp->module_en);
         |                              ^~~~~~~~
   drivers/media/platform/xilinx/xilinx-isppipeline.c: In function 'xisp_s_ctrl':
>> drivers/media/platform/xilinx/xilinx-isppipeline.c:1028:39: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
    1028 |                                      (FIELD_PREP(GENMASK(XISP_UPPER_WORD_MSB,
         |                                       ^~~~~~~~~~
   drivers/media/platform/xilinx/xilinx-isppipeline.c:212:65: note: in definition of macro 'XISP_SET_CFG'
     212 |                                 xvip_write(&xisp->xvip, (REG), (VAL)); \
         |                                                                 ^~~


vim +/FIELD_GET +202 drivers/media/platform/xilinx/xilinx-isppipeline.c

   193	
   194	#define XISP_RESET_DEASSERT		(0)
   195	#define XISP_RESET_ASSERT		(1)
   196	#define XISP_START			BIT(0)
   197	#define XISP_AUTO_RESTART		BIT(7)
   198	#define XISP_STREAM_ON			(XISP_AUTO_RESTART | XISP_START)
   199	#define XILINX_ISP_VERSION_1					BIT(0)
   200	#define XILINX_ISP_VERSION_2					BIT(1)
   201	#define XISP_AEC_THRESHOLD_DEFAULT	(20)
 > 202	#define XGET_BIT(bitmask, reg)    (FIELD_GET(BIT(bitmask), (reg)))
   203	#define XISP_SET_CFG(INDEX, REG, VAL)	\
   204		do {	\
   205			u32 _index = (INDEX); \
   206			bool en = XGET_BIT(_index, xisp->module_en); \
   207			bool byp_en = XGET_BIT(_index, xisp->module_bypass_en); \
   208			bool byp = XGET_BIT(_index, xisp->module_bypass); \
   209			\
   210			if (en)	\
   211				if (!byp_en || !(byp_en && byp)) \
   212					xvip_write(&xisp->xvip, (REG), (VAL)); \
   213		} while (0)
   214	#define XISP_BLC_MULTIPLICATION_FACTOR_MAX	(0x80000000UL)
   215	#define XISP_BLC_MULTIPLICATION_FACTOR_DEFALUT	(65535)
   216	#define XISP_BLC_BLACK_LEVEL_DEFALUT		(32)
   217	#define XISP_AWB_THRESHOLD_DEFAULT		(512)
   218	#define XISP_RED_GAIN_DEFALUT			(100)
   219	#define XISP_BLUE_GAIN_DEFALUT			(350)
   220	#define XISP_GREEN_GAIN_DEFALUT			(200)
   221	#define XISP_RED_GAMMA_MAX			(40)
   222	#define XISP_RED_GAMMA_DEFALUT			(20)
   223	#define XISP_GREEN_GAMMA_MAX			(40)
   224	#define XISP_GREEN_GAMMA_DEFALUT		(15)
   225	#define XISP_BLUE_GAMMA_MAX			(40)
   226	#define XISP_BLUE_GAMMA_DEFALUT			(20)
   227	#define XISP_HDR_ALPHA_MAX			(256)
   228	#define XISP_HDR_ALPHA_DEFALUT			(5)
   229	#define XISP_HDR_OPTICAL_BLACK_VALUE_MAX	(256)
   230	#define XISP_HDR_OPTICAL_BLACK_VALUE_DEFALUT	(0)
   231	#define XISP_HDR_INTERSEC_MAX			(4000000UL)
   232	#define XISP_HDR_INTERSEC_DEFALUT		(1386290UL)
   233	#define XISP_HDR_RHO_MAX			(65536)
   234	#define XISP_HDR_RHO_DEFALUT			(512)
   235	#define XISP_SELECT_DECOMPAND_MAX		(2)
   236	#define XISP_SELECT_DECOMPAND_DEFALUT		(0)
   237	#define XISP_GTM_C1_DEFALUT			(128)
   238	#define XISP_GTM_C2_DEFALUT			(128)
   239	#define XISP_CLAHE_CLIP_DEFALUT			(3)
   240	#define XISP_CLAHE_TILES_Y_DEFALUT		(4)
   241	#define XISP_CLAHE_TILES_X_DEFALUT		(4)
   242	#define XISP_LTM_BLOCK_HEIGHT_DEFALUT		(8)
   243	#define XISP_LTM_BLOCK_WIDTH_DEFALUT		(8)
   244	#define XISP_3DLUT_DIM_MAX			(0x80000000UL)
   245	#define XISP_3DLUT_DIM_DEFALUT			(107811UL)
   246	#define XISP_MONO_LUMA_GAIN_DEFALUT		(128)
   247	#define XISP_MONO_GAMMA_MAX			(40)
   248	#define XISP_MONO_GAMMA_DEFALUT			(20)
   249	#define XISP_UPPER_WORD_MSB			(31)
   250	#define XISP_UPPER_WORD_LSB			(16)
   251	#define XISP_MAX_INTENSITY			(10 * (XISP_W_B_SIZE - 1))
   252	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
