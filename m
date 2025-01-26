Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8455911CAF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Jan 2025 11:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737891268; cv=none; b=It++6HWbaPagfczeknGYqKng3ApC59IHailtoBDV0+xLRxUqWcEEbaRs2h9ElbqQ3j0eWuLsh2MDZu+z6SpjLDKgXSe+E8PcgU4sp4z49M95Vf/j32KHg6S8niBadwtpRPOqRDL8BugRFm96HDH+Zg8i99475zIV8hp3hbjZkzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737891268; c=relaxed/simple;
	bh=kCT5mf8av1PSFOa3bipKZ2QglmBBUPylWbzei21ELvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PMljOHAVqyUqe1MBEmQ91mhpEspVgqBABA3u1jZY3Ihcp2RrtdEOWBeApB/zdaQcAR1zSvQbeu3TF1htXwPoeg8MenTfFhGMDTAfX42up0/EidBrPuOOcUqW/+Y7m4yIbWbZoBUHCJaAbPIsfT9npX4iy+DaOvpwD7gXhGMeIIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CaAs9DVr; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CaAs9DVr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737891266; x=1769427266;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kCT5mf8av1PSFOa3bipKZ2QglmBBUPylWbzei21ELvQ=;
  b=CaAs9DVrY4fVzULN5hAPPzr4R5oUR94Q46UGHv8omlBVwVhBzR2GCIuI
   b8ywDhT31mKJiZIF6WTMZ6Qd0x8BodaT++vMlUHocGvvxI/8VpUlWpeAK
   JXL9Vdf4ShG85oRG5+IccuMPrIGQKbgFUeEQT/1kZ9WKzhS5+54SDbiW7
   kvdfEWwNoUg/cXjQPlh3BTGTIQ/zI0ip+jWkNppfyhjfjjKPTXMDBxoWD
   xuV072CXviELYROukVb14chW+H9t6gPQlHBf/w8pM2RXFBin7MHRYkTw2
   E0uD/f4jilb8df88qwIs1ByLmqHpzBRx8OPFyLeSWo62ahvHGk/6Lwyki
   A==;
X-CSE-ConnectionGUID: XIiHrOETRTKYAOBIeDpHBg==
X-CSE-MsgGUID: PiHXs5gARsqMNSZP1Tqc5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11326"; a="38071130"
X-IronPort-AV: E=Sophos;i="6.13,236,1732608000"; 
   d="scan'208";a="38071130"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2025 03:34:26 -0800
X-CSE-ConnectionGUID: JsjI6n7WTyKX0ImJ9LqoHw==
X-CSE-MsgGUID: AY0A5OZBTPm0laefK05WBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,236,1732608000"; 
   d="scan'208";a="108165630"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 26 Jan 2025 03:34:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tc0uE-000fJP-2V;
	Sun, 26 Jan 2025 11:34:22 +0000
Date: Sun, 26 Jan 2025 19:33:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 2/2]
 drivers/gpu/drm/bridge/tc358768.c:906:2-3: Unneeded semicolon
Message-ID: <202501261914.SzcLEuL4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   49bd830ea5e30f59495e703aae18331882b76760
commit: a07e6484f915dd85a94532c41d0c582c00d10ead [2/2] drm/bridge: tc358768: Add atomic_get_input_bus_fmts() implementation
config: i386-randconfig-r054-20250126 (https://download.01.org/0day-ci/archive/20250126/202501261914.SzcLEuL4-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501261914.SzcLEuL4-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/bridge/tc358768.c:906:2-3: Unneeded semicolon

vim +906 drivers/gpu/drm/bridge/tc358768.c

   876	
   877	static u32 *
   878	tc358768_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
   879					   struct drm_bridge_state *bridge_state,
   880					   struct drm_crtc_state *crtc_state,
   881					   struct drm_connector_state *conn_state,
   882					   u32 output_fmt,
   883					   unsigned int *num_input_fmts)
   884	{
   885		struct tc358768_priv *priv = bridge_to_tc358768(bridge);
   886		u32 *input_fmts;
   887	
   888		*num_input_fmts = 0;
   889	
   890		input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts),
   891				     GFP_KERNEL);
   892		if (!input_fmts)
   893			return NULL;
   894	
   895		switch (priv->pd_lines) {
   896		case 16:
   897			input_fmts[0] = MEDIA_BUS_FMT_RGB565_1X16;
   898			break;
   899		case 18:
   900			input_fmts[0] = MEDIA_BUS_FMT_RGB666_1X18;
   901			break;
   902		default:
   903		case 24:
   904			input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
   905			break;
 > 906		};
   907	
   908		*num_input_fmts = MAX_INPUT_SEL_FORMATS;
   909	
   910		return input_fmts;
   911	}
   912	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
