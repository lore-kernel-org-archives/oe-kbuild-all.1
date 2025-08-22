Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5400A2BF3CF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Aug 2025 18:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755888819; cv=none; b=Sw+4fFl0/+vMQzDQtNpIArLsysKW556InAjYd1m0WRJ35KGi2kNk062DOvtWtW8NrDtJuQcHsMep3TmqVX5+1BBRnBvXhb22k9Ijo4qzNJjU8PsHjcnfnYYAPaNVp1AAD0e/zliiwxqeLrJ+Fw12exq+cKPnxbLC6CBGq5q8Vv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755888819; c=relaxed/simple;
	bh=z2aCOG3wUlZbVpbMsEXEy7mEx2nvcvxPO4jwa1YZ6oQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D4VL6RC61KihAAGUuD+MLVnGZ/aL4yDPbPF2gdhSzRNi+yIuRie19GjMEqVclBeZd57Twp7FdQbOb3oSYxZMAOnWXyaCGP/uLCcFHkQD4Q5a/eHN1lR0Y++/GXnNXNaFzBVuSE+Q1uYUon7KjOtKtO+6Lp3A6E/h5kPjGyT5k90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QHssHnbf; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QHssHnbf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755888817; x=1787424817;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z2aCOG3wUlZbVpbMsEXEy7mEx2nvcvxPO4jwa1YZ6oQ=;
  b=QHssHnbf/0SbfPliYHgJtNL1gDxRzblZ8Vutl8G8hetK0bQ+rr4n4WxR
   idMmLLv49ck+WSyTAhe/CNQJSHvcq17iqY+FEWphfQF39ttYyHE8QRmkO
   6Z2QFbcr8hAKAnD2Gy5c2eIMhZ8DKae5g+tQXdxrB9h1hLW3Joirpg6DY
   3YluMTCQe5Zxd/YF67cghy/OVreCtQtOublS1Q4HtoA9n9A747jJedlWw
   knDvzSaX/0o+uB6XoE/+1tDhCVss084kLSsC4LJDtfhqZ0PRcFmGJ2L4n
   AcyL8jcOYhx23azYxsfaCRMQ2+jbJSkT17Q2nE3yusf1HLj0GHGteCtuZ
   A==;
X-CSE-ConnectionGUID: fuRc4LyNTgalCitnHXNPDg==
X-CSE-MsgGUID: clZEyeavSv6SCuTMYjbcxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58268100"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58268100"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 11:53:34 -0700
X-CSE-ConnectionGUID: PlX3gakbSVOki9WgC7wuNw==
X-CSE-MsgGUID: jTaoIKnKSAq9svx0FOO3tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="168281775"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 22 Aug 2025 11:53:33 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upWtH-000Leo-1L;
	Fri, 22 Aug 2025 18:53:31 +0000
Date: Sat, 23 Aug 2025 02:52:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 443/443]
 drivers/gpu/drm/bridge/ite-it61620.c:2248:62: warning: suggest parentheses
 around '+' in operand of '&'
Message-ID: <202508230215.WtcJ5vDy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   12cacc6855c36b7b2ce4a8f020b4a40a6433357b
commit: 53622d06c2bd037be82be10a96097648feabc9ad [443/443] CHROMIUM: drm/bridge: Add ITE IT61620 MIPI DSI to HDMI bridge driver
config: arm64-randconfig-004-20250823 (https://download.01.org/0day-ci/archive/20250823/202508230215.WtcJ5vDy-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250823/202508230215.WtcJ5vDy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508230215.WtcJ5vDy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/bridge/ite-it61620.c: In function 'it61620_config_audio':
>> drivers/gpu/drm/bridge/ite-it61620.c:2248:62: warning: suggest parentheses around '+' in operand of '&' [-Wparentheses]
    2248 |                                (~(config->sample_rate << 4)) & 0xF0 + 0x0B);
         |                                                              ^


vim +2248 drivers/gpu/drm/bridge/ite-it61620.c

  2217	
  2218	static void it61620_config_audio(struct it61620 *it61620)
  2219	{
  2220		struct it61620_audio *config = &it61620->audio_config;
  2221		struct drm_device *drm = it61620->drm;
  2222		u8 infoca, audsrc, chksum;
  2223		unsigned int i;
  2224	
  2225		drm_dbg(drm, "sample rate %d", config->sample_rate);
  2226		drm_dbg(drm, "sample width %d", config->sample_width);
  2227		drm_dbg(drm, "fmt %d", config->select);
  2228	
  2229		it61620_hdmi_reg_set(it61620, TX_REG_AUD_FMT, 0x7F,
  2230				     (config->word_length << 5) | config->audfmt);
  2231		if (config->select == SPDIF) {
  2232			it61620_hdmi_reg_write(it61620, TX_REG_AUD_FIFO1, 0x00);
  2233			it61620_hdmi_reg_write(it61620, TX_REG_AUD_FIFO2, 0x00);
  2234			it61620_hdmi_reg_set(it61620, TX_REG_AUD_SPDIF, 0x0F, 0x02);
  2235			it61620_hdmi_reg_write(it61620, TX_REG_AUD_CTRL, 0X01);
  2236		} else {
  2237			it61620_hdmi_reg_write(it61620, TX_REG_AUD_FIFO1, 0x10);
  2238			it61620_hdmi_reg_write(it61620, TX_REG_AUD_FIFO2, 0x32);
  2239			it61620_hdmi_reg_write(it61620, TX_REG_AUD_CTRL, 0X00);
  2240		}
  2241	
  2242		if (config->type == LPCM)
  2243			it61620_hdmi_reg_write(it61620, TX_REG_AUD_STS1, 0x00);
  2244		else
  2245			it61620_hdmi_reg_write(it61620, TX_REG_AUD_STS1, B_EN_AUD_NLPCM);
  2246		it61620_hdmi_reg_write(it61620, TX_REG_AUD_STS2, (config->sample_rate));
  2247		it61620_hdmi_reg_write(it61620, TX_REG_AUD_STS3,
> 2248				       (~(config->sample_rate << 4)) & 0xF0 + 0x0B);
  2249	
  2250		switch (config->channel_count) {
  2251		case 2:
  2252			infoca = 0x00;
  2253			audsrc = 0x01;
  2254			break;
  2255		case 3:
  2256			infoca = 0x01;
  2257			audsrc = 0x03;
  2258			break;
  2259		case 4:
  2260			infoca = 0x03;
  2261			audsrc = 0x03;
  2262			break;
  2263		case 5:
  2264			infoca = 0x07;
  2265			audsrc = 0x07;
  2266			break;
  2267		case 6:
  2268			infoca = 0x0B;
  2269			audsrc = 0x07;
  2270			break;
  2271		case 7:
  2272			infoca = 0x0F;
  2273			audsrc = 0x0f;
  2274			break;
  2275		case 8:
  2276			infoca = 0x13;
  2277			audsrc = 0x0f;
  2278			break;
  2279		default:
  2280			drm_dbg(drm,
  2281				"Error: Audio Channel Number Error !!!\n");
  2282			infoca = 0x00;
  2283			audsrc = 0x01;
  2284			break;
  2285		}
  2286	
  2287		it61620_hdmi_reg_write(it61620, TX_REG_AUDINFO_DB01,
  2288				       config->channel_count - 1);
  2289		it61620_hdmi_reg_write(it61620, TX_REG_AUDINFO_DB02, 0x00);
  2290	
  2291		it61620_hdmi_reg_write(it61620, TX_REG_AUDINFO_DB03, 0x00);
  2292		it61620_hdmi_reg_write(it61620, TX_REG_AUDINFO_DB04, infoca);
  2293		it61620_hdmi_reg_write(it61620, TX_REG_AUDINFO_DB05, 0x00);
  2294	
  2295		chksum = 0x84;
  2296		chksum += 0x01;
  2297		chksum += 0x0A;
  2298		for (i = TX_REG_AUDINFO_DB01; i <= TX_REG_AUDINFO_DB05; i++)
  2299			chksum += it61620_hdmi_reg_read(it61620, i);
  2300	
  2301		it61620_hdmi_reg_write(it61620, TX_REG_AUDINFO_DB06, 0x100 - chksum);
  2302	
  2303		it61620_hdmi_reg_write(it61620, TX_REG_AUDINFO_DB07, 0x00);
  2304		it61620_hdmi_reg_write(it61620, TX_REG_AUDINFO_DB08, 0x00);
  2305		it61620_hdmi_reg_write(it61620, TX_REG_AUDINFO_DB09, 0x00);
  2306		it61620_hdmi_reg_write(it61620, TX_REG_AUDINFO_DB10, 0x00);
  2307	
  2308		it61620_hdmi_reg_write(it61620, TX_REG_EN_AUDIO, audsrc);
  2309	
  2310		it61620_hdmi_audio_set_ncts(it61620);
  2311	
  2312		it61620_hdmi_enable_audio_infoframe(it61620);
  2313		it61620_hdmi_reg_set(it61620, TX_REG_LINK_CTRL0, B_EN_AUDIO_MUTE, 0x00);
  2314		it61620_hdmi_reg_set(it61620, TX_REG_RESET_2_CTRL, 0x01, 0x00);
  2315	}
  2316	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
