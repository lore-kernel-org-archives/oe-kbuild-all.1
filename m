Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7971F1CF7D5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Jan 2026 14:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769436479; cv=none; b=G69o2KSdH/vSEoib4Ktg2YiQkmVkC63Y0yaV1Lkg6kKHricZxluE5E/jqPHCI8gi2Nv3n9Bq0asNaBWogc0De9qc2jFx2spDZsFSo0tori/c6/QDjwORBxYfvz7Lz3ZQeFX1jdnaalBFjOQtFI2U/OFwxyG5kpCqZ8VoXOhTIKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769436479; c=relaxed/simple;
	bh=WgZhqburwJXfSnO9FAvCh2UJKSg6moYZxg9UTVJ0mVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dCCc/UQPoL4NryRN8i+iLHj6NGSYcBtJg5vmbWhrvHuSUQzyiV9DYTfd3e/WAkUbkDHBvaLxqfDEH/q7LQtDejAcksM/UbNezANLwr3IPl+47HC8OwJqwUhCBh8eljigvjgWAEJIpSqbeBjLVZrVcH5L01pyJB0zGWeWhmFqlDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BlsqBqCK; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BlsqBqCK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769436477; x=1800972477;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=WgZhqburwJXfSnO9FAvCh2UJKSg6moYZxg9UTVJ0mVc=;
  b=BlsqBqCKgWJSiOgwfXucNFnYSuJqe4QgU1yY4CpWjm+zkFIbTTBoGlRx
   d0akG5Qw4LCS1igBn9uPPjfRT9Dx7/c+0VCiJigZnmB83npoQs8aAzHdJ
   j88s40awrwE8E6sCIcqCadZVhP2WFmyOrekfk7lC7/aWe00ogdDBpfH6J
   YLoGDo/D4l5zyN24lxTFyxENPH1WtdfNZVRZRI/GfMsDWmtiTTztbWtqX
   eDRasSXB8YrSRTgVgfV4V5PkoHWdL/Pg56QC8re0EH4J+L+xjj8rSB2Nm
   6S0iYsaLninXhugNONA3VcrZJ/575vm280Bn0b29+8Sx0uAZum8ReyN8Z
   A==;
X-CSE-ConnectionGUID: MfoZxxc5SNuCJuuQXpvPZg==
X-CSE-MsgGUID: 97TW1NsvSj2bvhV7HAWG7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70579622"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="70579622"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 06:07:57 -0800
X-CSE-ConnectionGUID: bt3jTQ2rRJ+b/17QZMrRDA==
X-CSE-MsgGUID: EYt16mIYQoOQmElucEeS3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="207288300"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 26 Jan 2026 06:07:53 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkNFu-00000000XNK-3v5w;
	Mon, 26 Jan 2026 14:07:50 +0000
Date: Mon, 26 Jan 2026 22:07:19 +0800
From: kernel test robot <lkp@intel.com>
To: Tomasz =?utf-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>,
	alexander.deucher@amd.com, harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: oe-kbuild-all@lists.linux.dev, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, siqueira@igalia.com,
	dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
	bernhard.berger@gmail.com, michel.daenzer@mailbox.org,
	daniel@fooishbar.org
Subject: Re: [PATCH v2 16/19] drm/amd/display: Add parameter to control ALLM
 behavior
Message-ID: <202601262244.EnQPfewn-lkp@intel.com>
References: <20260125183914.459228-17-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260125183914.459228-17-tomasz.pakula.oficjalny@gmail.com>

Hi Tomasz,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20260123]
[cannot apply to drm-misc/drm-misc-next v6.19-rc6 v6.19-rc5 v6.19-rc4 linus/master v6.19-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tomasz-Paku-a/drm-amd-display-Return-if-DisplayID-not-found-in-parse_amd_vsdb/20260126-024258
base:   next-20260123
patch link:    https://lore.kernel.org/r/20260125183914.459228-17-tomasz.pakula.oficjalny%40gmail.com
patch subject: [PATCH v2 16/19] drm/amd/display: Add parameter to control ALLM behavior
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260126/202601262244.EnQPfewn-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260126/202601262244.EnQPfewn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601262244.EnQPfewn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:1129:7: error: expected '=', ',', ';', 'asm' or '__attribute__' before ':' token
    1129 |  * DOC: hdmi_hpd_debounce_delay_ms (uint)
         |       ^


vim +1129 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c

a96a787d6de732 Alex Deucher  2025-02-18  1127  
ee725b1d954d29 Tomasz Pakuła 2026-01-25  1128  /** */
6a681cd9034587 Ivan Lipski   2026-01-13 @1129   * DOC: hdmi_hpd_debounce_delay_ms (uint)
6a681cd9034587 Ivan Lipski   2026-01-13  1130   * HDMI HPD disconnect debounce delay in milliseconds.
6a681cd9034587 Ivan Lipski   2026-01-13  1131   *
6a681cd9034587 Ivan Lipski   2026-01-13  1132   * Used to filter short disconnect->reconnect HPD toggles some HDMI sinks
6a681cd9034587 Ivan Lipski   2026-01-13  1133   * generate while entering/leaving power save. Set to 0 to disable by default.
6a681cd9034587 Ivan Lipski   2026-01-13  1134   */
6a681cd9034587 Ivan Lipski   2026-01-13  1135  MODULE_PARM_DESC(hdmi_hpd_debounce_delay_ms, "HDMI HPD disconnect debounce delay in milliseconds (0 to disable (by default), 1500 is common)");
6a681cd9034587 Ivan Lipski   2026-01-13  1136  module_param_named(hdmi_hpd_debounce_delay_ms, amdgpu_hdmi_hpd_debounce_delay_ms, uint, 0644);
6a681cd9034587 Ivan Lipski   2026-01-13  1137  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
