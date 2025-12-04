Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6B748CFC
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Dec 2025 01:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764811425; cv=none; b=Hu7Hik34PMwCqEmlwsGfFJhQeNCLxYMGZvbMNZuWXqtOBW7AbRoEDKcvJStsDzNN0rXZERz56KyaSrwnxIYUCC4ZpPo7Tf3bGuG6DQoTZ23tWWJOFvkuHrt7GnlIVePOLbLlVk9DncDtY3FejSpYKqSpqERjzV0FrCRqWfvwr9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764811425; c=relaxed/simple;
	bh=+aobh0GhXFwYY2C4j+u7efBuZ7S0xmY/4kz9nweTUYE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PJ93QGX9e+28+ifZTuBTP6FtlkctiqUwvf5OT+F170e8YDnG4kWe9SY4nsvWdWf7H+rhHXV2Sv0pHZo4c2NS6u05dpEcDpf2GeXDdigj0EJveTAh4lo8RDtjjHAtMyeqn/u9zZ76fADtf9076c9rUcKma7BMRWy6b+99pY8+/9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ngAaM5Va; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ngAaM5Va"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764811425; x=1796347425;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+aobh0GhXFwYY2C4j+u7efBuZ7S0xmY/4kz9nweTUYE=;
  b=ngAaM5VaucILyBmPRvCKS4gXJQgL0U/D78vvdOAkBy7nUM0ApVeuKn2x
   Edopmiut9yhlHgEKTqwdBDo0LSthM73nHaQ33mn49xNO0DZea1CxV+O45
   5UGtNB7r32uwytaC33D9Mi8T5ft27CWrO9O/q7F6nfmWMSZyLQDHa2fwX
   OIavqnYYV1J+h741VpoARJk2TzQcKhJ83OveVNH7pfD4NhcElGNUqFxa2
   sOz8mEoTKuVBXD5OJPqhZxuJ4BXe7G1LUOw1Jz+Uzy2RgdhiSf16VRmN7
   MpfNchouls+YKWw6fQ7TqIHjIKGO+X/MCHtiaE/NkDPKqZHBMCdhWe96U
   w==;
X-CSE-ConnectionGUID: 75kLqSzeTSK1y5/8FaVLLA==
X-CSE-MsgGUID: 7ll2lCNBTP+mEip4YWzLmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66784430"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="66784430"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 17:23:44 -0800
X-CSE-ConnectionGUID: S9tL8XJVRYmXoAL1sGS4yA==
X-CSE-MsgGUID: 0Z2W1xy2RtK0ZIwpkhO1+Q==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 Dec 2025 17:23:42 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQy4K-00000000DLF-1QvB;
	Thu, 04 Dec 2025 01:23:40 +0000
Date: Thu, 4 Dec 2025 09:22:43 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-linux-6.18.y 94/124]
 sound/soc/codecs/lpass-wsa-macro.c:1243:25: warning: variable 'inp_max' is
 uninitialized when used here
Message-ID: <202512040905.bZGAIwKY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-linux-6.18.y
head:   c0e9c6b047b399273025aed39b851c94ce0463f4
commit: d3a841fb2856c589ab57c634ef54a679fe4c55d3 [94/124] ASoC: codecs: lpass-wsa-macro: use ports as the DAIs for playback
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20251204/202512040905.bZGAIwKY-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251204/202512040905.bZGAIwKY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512040905.bZGAIwKY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/lpass-wsa-macro.c:1243:25: warning: variable 'inp_max' is uninitialized when used here [-Wuninitialized]
    1243 |                 inp0_dai = inp0_sel < inp_max ? inp_to_dai[inp0_sel] : 0xff;
         |                                       ^~~~~~~
   sound/soc/codecs/lpass-wsa-macro.c:1225:16: note: initialize the variable 'inp_max' to silence this warning
    1225 |         u32 i, inp_max;
         |                       ^
         |                        = 0
   1 warning generated.


vim +/inp_max +1243 sound/soc/codecs/lpass-wsa-macro.c

  1220	
  1221	static int wsa_macro_get_active_channels(const struct snd_soc_dai *dai)
  1222	{
  1223		struct snd_soc_component *component = dai->component;
  1224		struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
  1225		u32 i, inp_max;
  1226		u16 int_mux_cfg0, int_mux_cfg1;
  1227		u8 inp0_sel, inp1_sel, inp2_sel, mix_inp_sel;
  1228		u8 inp0_dai, inp1_dai, inp2_dai, mix_inp_dai;
  1229		int active_ch_mask = 0;
  1230	
  1231		for (i = 0; i < NUM_INTERPOLATORS; i++) {
  1232			int_mux_cfg0 = CDC_WSA_RX_INP_MUX_RX_INT0_CFG0 + WSA_MACRO_MUX_CFG_OFFSET * i;
  1233			int_mux_cfg1 = CDC_WSA_RX_INP_MUX_RX_INT0_CFG1 + WSA_MACRO_MUX_CFG_OFFSET * i;
  1234			inp0_sel = snd_soc_component_read_field(component, int_mux_cfg0,
  1235								wsa->reg_layout->rx_intx_1_mix_inp0_sel_mask);
  1236			inp1_sel = snd_soc_component_read_field(component, int_mux_cfg0,
  1237								wsa->reg_layout->rx_intx_1_mix_inp1_sel_mask);
  1238			inp2_sel = snd_soc_component_read_field(component, int_mux_cfg1,
  1239								wsa->reg_layout->rx_intx_1_mix_inp2_sel_mask);
  1240			mix_inp_sel = snd_soc_component_read_field(component, int_mux_cfg1,
  1241								   wsa->reg_layout->rx_intx_2_sel_mask);
  1242			/* map to corresponding dai->id */
> 1243			inp0_dai = inp0_sel < inp_max ? inp_to_dai[inp0_sel] : 0xff;
  1244			inp1_dai = inp1_sel < inp_max ? inp_to_dai[inp1_sel] : 0xff;
  1245			inp2_dai = inp2_sel < inp_max ? inp_to_dai[inp2_sel] : 0xff;
  1246			mix_inp_dai = mix_inp_sel < inp_max ? inp_to_dai[mix_inp_sel] : 0xff;
  1247	
  1248			/* note: odd values of inp0_sel,etc. are RX0,RX2,etc. (always first channel of the dai) */
  1249			if (inp0_dai == dai->id) active_ch_mask |= (inp0_sel & 1) ? BIT(0) : BIT(1);
  1250			if (inp1_dai == dai->id) active_ch_mask |= (inp1_sel & 1) ? BIT(0) : BIT(1);
  1251			if (inp2_dai == dai->id) active_ch_mask |= (inp2_sel & 1) ? BIT(0) : BIT(1);
  1252			if (mix_inp_dai == dai->id) active_ch_mask |= (mix_inp_sel & 1) ? BIT(0) : BIT(1);
  1253		}
  1254		return active_ch_mask;
  1255	}
  1256	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
