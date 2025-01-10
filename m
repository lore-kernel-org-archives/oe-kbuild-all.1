Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EAB1A23B0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jan 2025 21:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736544253; cv=none; b=pwycs5RL18uyrgxJ2trtjsvo0nyTqgEjWx4Hbn9rypBP6Vec0VXC2RBXCSht2l0hmcE5iqd22AKeLeBRy3M0kW4nkVVQMORnqeIcUxXm69DL010YgCV8lFfJSyktyf8Yo4lA2OQHudcRZO+mfPEPjVHPkTGQtnZKOo0MA0TJyX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736544253; c=relaxed/simple;
	bh=u3uCEKB2hEMLb9qmBehdk1NrgVFbQ/ABpuqv7fni/1o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KzPvn4moH+IvJ3JeX2BOS1r6v89ZU2L8Apv+1IBC91wpFzzvf0HBS+3GnDMPhGwzZBVv6LnB80vs/0DQGG4816rMOsW1sdESyERtvSh64ZKBMdf+NPguxa+NJvWD8GiSBbU6r7Edl8RE2I9BeHuuM5NtjcuTmMzXEJ+FcPGNU9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PqM3O0df; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PqM3O0df"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736544251; x=1768080251;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u3uCEKB2hEMLb9qmBehdk1NrgVFbQ/ABpuqv7fni/1o=;
  b=PqM3O0dfRDoIgXWEMLzqQ+eh8l87hPfkAAY/5YieYlh+tCkBbByeCeaF
   32u6fbL+v4aweSfm8IZ9lOObJowCJIT8r42V+2qpRosOJTOEo2Ku20CL8
   k/vNC83C0CgnD4Wddlf48Mbvxvzq+NN4ARPJWGHnXCueGq+rZ9CHSWiO1
   NR8VPLymAm+lDUgTAStZxFxU3Leqxx9RojTAvi7vlxpaoK5v8S+3bv+Rw
   jVN/UTZfK8WxHdDOkwwF6WEI7jA9wLscbVvpydwYeAeTHmcm3gYV0/scS
   WZQGo6eiTRGRd2Oq2GSDz2Zmh/smVRNUBAF/QsRFgrnDcZJZabKn3ElH7
   A==;
X-CSE-ConnectionGUID: e2Dpf9uFQtKgSkKyeboe+w==
X-CSE-MsgGUID: IGGC5NgfT9aVajJFKTKf1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="24458689"
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="24458689"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 13:24:11 -0800
X-CSE-ConnectionGUID: hn9gn/xeTwGoKmMWusqUdA==
X-CSE-MsgGUID: YY8ATLEHRPCsVvQPMXtkZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="134677234"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Jan 2025 13:24:09 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWMUA-000Jkz-2j;
	Fri, 10 Jan 2025 21:24:06 +0000
Date: Sat, 11 Jan 2025 05:23:53 +0800
From: kernel test robot <lkp@intel.com>
To: Saurabh Sengar <saurabh.singh@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:lkp_test 196/504]
 drivers/gpu/drm/xlnx/xlnx_mixer.c:360: warning: Excess struct member
 'vid_fmt' description in 'xlnx_mix_layer_data'
Message-ID: <202501110552.F65vrtu9-lkp@intel.com>
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
commit: 770fded1d319c14802870279b6e8734a3bfddd8d [196/504] drm: xlnx: mixer: Initial video mixer driver
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250111/202501110552.F65vrtu9-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501110552.F65vrtu9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501110552.F65vrtu9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xlnx/xlnx_mixer.c:360: warning: Excess struct member 'vid_fmt' description in 'xlnx_mix_layer_data'
>> drivers/gpu/drm/xlnx/xlnx_mixer.c:360: warning: Excess struct member 'can_alpha' description in 'xlnx_mix_layer_data'
>> drivers/gpu/drm/xlnx/xlnx_mixer.c:360: warning: Excess struct member 'can_scale' description in 'xlnx_mix_layer_data'
>> drivers/gpu/drm/xlnx/xlnx_mixer.c:360: warning: Excess struct member 'is_streaming' description in 'xlnx_mix_layer_data'
>> drivers/gpu/drm/xlnx/xlnx_mixer.c:360: warning: Excess struct member 'max_width' description in 'xlnx_mix_layer_data'
>> drivers/gpu/drm/xlnx/xlnx_mixer.c:360: warning: Excess struct member 'max_height' description in 'xlnx_mix_layer_data'
>> drivers/gpu/drm/xlnx/xlnx_mixer.c:360: warning: Excess struct member 'min_width' description in 'xlnx_mix_layer_data'
>> drivers/gpu/drm/xlnx/xlnx_mixer.c:360: warning: Excess struct member 'min_height' description in 'xlnx_mix_layer_data'
>> drivers/gpu/drm/xlnx/xlnx_mixer.c:360: warning: Excess struct member 'buff_addr' description in 'xlnx_mix_layer_data'
>> drivers/gpu/drm/xlnx/xlnx_mixer.c:360: warning: Excess struct member 'x_pos' description in 'xlnx_mix_layer_data'
>> drivers/gpu/drm/xlnx/xlnx_mixer.c:360: warning: Excess struct member 'y_pos' description in 'xlnx_mix_layer_data'
>> drivers/gpu/drm/xlnx/xlnx_mixer.c:360: warning: Excess struct member 'width' description in 'xlnx_mix_layer_data'
>> drivers/gpu/drm/xlnx/xlnx_mixer.c:360: warning: Excess struct member 'height' description in 'xlnx_mix_layer_data'
>> drivers/gpu/drm/xlnx/xlnx_mixer.c:360: warning: Excess struct member 'stride' description in 'xlnx_mix_layer_data'
>> drivers/gpu/drm/xlnx/xlnx_mixer.c:360: warning: Excess struct member 'alpha' description in 'xlnx_mix_layer_data'
>> drivers/gpu/drm/xlnx/xlnx_mixer.c:360: warning: Excess struct member 'is_active' description in 'xlnx_mix_layer_data'
>> drivers/gpu/drm/xlnx/xlnx_mixer.c:360: warning: Excess struct member 'scale_fact' description in 'xlnx_mix_layer_data'


vim +360 drivers/gpu/drm/xlnx/xlnx_mixer.c

   296	
   297	/**
   298	 * struct xlnx_mix_layer_data - Describes the hardware configuration of a given
   299	 * mixer layer
   300	 * @hw_config: struct specifying the IP hardware constraints for this layer
   301	 * @vid_fmt: DRM format for this layer
   302	 * @can_alpha: Indicates that layer alpha is enabled for this layer
   303	 * @can_scale: Indicates that layer scaling is enabled for this layer
   304	 * @is_streaming: Indicates layer is not using mixer DMA but streaming from
   305	 *  external DMA
   306	 * @max_width: Max possible pixel width
   307	 * @max_height: Max possible pixel height
   308	 * @min_width: Min possible pixel width
   309	 * @min_height: Min possible pixel height
   310	 * @layer_regs: struct containing current cached register values
   311	 * @buff_addr: Current physical address of image buffer
   312	 * @x_pos: Current CRTC x offset
   313	 * @y_pos: Current CRTC y offset
   314	 * @width: Current width in pixels
   315	 * @height: Current hight in pixels
   316	 * @stride: Current stride (when Mixer is performing DMA)
   317	 * @alpha: Current alpha setting
   318	 * @is_active: Logical flag indicating layer in use.  If false, calls to
   319	 *  enable layer will be ignored.
   320	 * @scale_fact: Current scaling factor applied to layer
   321	 * @id: The logical layer id identifies which layer this struct describes
   322	 *  (e.g. 0 = master, 1-15 = overlay).
   323	 *
   324	 * All mixer layers are reprsented by an instance of this struct:
   325	 * output streaming, overlay, logo.
   326	 * Current layer-specific register state is stored in the layer_regs struct.
   327	 * The hardware configuration is stored in struct hw_config.
   328	 *
   329	 * Note:
   330	 * Some properties of the logo layer are unique and not described in this
   331	 * struct.  Those properites are part of the xlnx_mix struct as global
   332	 * properties.
   333	 */
   334	struct xlnx_mix_layer_data {
   335		struct {
   336			u32     vid_fmt;
   337			bool    can_alpha;
   338			bool    can_scale;
   339			bool    is_streaming;
   340			u32     max_width;
   341			u32     max_height;
   342			u32     min_width;
   343			u32     min_height;
   344		} hw_config;
   345	
   346		struct {
   347			u64     buff_addr1;
   348			u64     buff_addr2;
   349			u32     x_pos;
   350			u32     y_pos;
   351			u32     width;
   352			u32     height;
   353			u32     stride;
   354			u32     alpha;
   355			bool	is_active;
   356			u32	scale_fact;
   357		} layer_regs;
   358	
   359		enum xlnx_mix_layer_id id;
 > 360	};
   361	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
