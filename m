Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058D22882B6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Feb 2026 20:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771966722; cv=none; b=VuvZc0DdVTSszcAzL3LwqvKsVcGFTM5mBmwgH+qKhLhUB/++My2vw4EMLB1A6W4gAT3KKTExqKVMTww2Mx2hRmyIw6PXYY6fs4+Cd8s10cAjCbIg/jGOacuFekAYoRwZgwQ5TqgVNNnNCfCm3BZikWB8C0d+DM/MVEufoMBhJoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771966722; c=relaxed/simple;
	bh=IN3a9Jy+IKF8stfYbWaavU5ilhijPnODp/qEEXA0fNc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=r03UOkMU+HD7Ap0KbUKiSJ8kSQ1NFhGCh5VyD3DdS8iO+io/5H+XyWAqNCVxc/gHlefbo3c8K1Sl/xVijVcyWASbxROp/Of1vfo4SliWV3owFePapb5H9dRO3cdRfdm8lToJ8maDa0nuSPXnKbEkiR2ljQstRbIqCsHbuh6nEL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TftjoOWn; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TftjoOWn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771966720; x=1803502720;
  h=date:from:to:cc:subject:message-id;
  bh=IN3a9Jy+IKF8stfYbWaavU5ilhijPnODp/qEEXA0fNc=;
  b=TftjoOWnCRWJKcQrugkR8m4OJF31JAuYPUiFojQgRZ+yUPaTIOuTOj+7
   0Y58qHoqew3Yn7aXrHL6wbJgqmMkhKj0JMnIoxk0eVoLkgadVQ+BwNRs5
   HmjLxcIJOs33HIMEp1Tiqwy0Kyj+IVM65mr+4fYlz+ikMFXjMIyBmclHm
   fnoMMnta7bzwkxJtV/amZgIdOxjBGd69Y2Tu6ME1AOQs7VWzKd+MZN9Ez
   W/Z3rYRlMhbYce+PgqNsjuTPPn1yMVA60VBzgdo89hzN1QvnCbnpMlOED
   Zy4nrdt47MhPBcWkAPcfctXsprJ9p69rIrqG8bUV8HWu2XpqUccNdI81B
   A==;
X-CSE-ConnectionGUID: 7/IIMcfzQSiF3BqPKbFJIQ==
X-CSE-MsgGUID: +v+YuQaYQWG/WeARrirjEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="76830192"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="76830192"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 12:58:40 -0800
X-CSE-ConnectionGUID: UNBmh6XATaaUFOrZIqV6Vw==
X-CSE-MsgGUID: uApSTvr7R56IH4DRimf3DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="221019867"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 24 Feb 2026 12:58:38 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuzUJ-000000002SH-0L4a;
	Tue, 24 Feb 2026 20:58:35 +0000
Date: Wed, 25 Feb 2026 04:57:45 +0800
From: kernel test robot <lkp@intel.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
 "Pierre-Louis Bossart" <pierre-louis.bossart@linux.dev>
Subject: [broonie-ci:20260223_ckeepax_sdca_improvements 4/4]
 sound/soc/soc-ops.c:228:4: warning: variable 'val_mask' is uninitialized when
 used here
Message-ID: <202602250402.93S23s9p-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git 20260223_ckeepax_sdca_improvements
head:   250e23c899e7bfa104fd141ca221f13d4df28d6b
commit: 250e23c899e7bfa104fd141ca221f13d4df28d6b [4/4] ASoC: SDCA: Pull the Q7.8 volume helpers out of soc-ops
config: arm-randconfig-r073-20260225 (https://download.01.org/0day-ci/archive/20260225/202602250402.93S23s9p-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a109fbb6e184ec9bcce10615949f598f4c974a9)
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260225/202602250402.93S23s9p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602250402.93S23s9p-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/soc-ops.c:228:4: warning: variable 'val_mask' is uninitialized when used here [-Wuninitialized]
     228 |                         val_mask |= mask << mc->rshift;
         |                         ^~~~~~~~
   sound/soc/soc-ops.c:207:29: note: initialize the variable 'val_mask' to silence this warning
     207 |         unsigned int val1, val_mask;
         |                                    ^
         |                                     = 0
   1 warning generated.


vim +/val_mask +228 sound/soc/soc-ops.c

9dfcafe2037acc Charles Keepax 2025-03-18  201  
318e8794e05ca1 Charles Keepax 2025-03-18  202  static int soc_put_volsw(struct snd_kcontrol *kcontrol,
318e8794e05ca1 Charles Keepax 2025-03-18  203  			 struct snd_ctl_elem_value *ucontrol,
318e8794e05ca1 Charles Keepax 2025-03-18  204  			 struct soc_mixer_control *mc, int mask, int max)
318e8794e05ca1 Charles Keepax 2025-03-18  205  {
318e8794e05ca1 Charles Keepax 2025-03-18  206  	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
318e8794e05ca1 Charles Keepax 2025-03-18  207  	unsigned int val1, val_mask;
318e8794e05ca1 Charles Keepax 2025-03-18  208  	unsigned int val2 = 0;
318e8794e05ca1 Charles Keepax 2025-03-18  209  	bool double_r = false;
318e8794e05ca1 Charles Keepax 2025-03-18  210  	int ret;
318e8794e05ca1 Charles Keepax 2025-03-18  211  
318e8794e05ca1 Charles Keepax 2025-03-18  212  	ret = soc_mixer_valid_ctl(mc, ucontrol->value.integer.value[0], max);
318e8794e05ca1 Charles Keepax 2025-03-18  213  	if (ret)
318e8794e05ca1 Charles Keepax 2025-03-18  214  		return ret;
318e8794e05ca1 Charles Keepax 2025-03-18  215  
250e23c899e7bf Charles Keepax 2026-02-23  216  	val1 = soc_mixer_ctl_to_reg(mc, ucontrol->value.integer.value[0],
318e8794e05ca1 Charles Keepax 2025-03-18  217  				    mask, mc->shift, max);
318e8794e05ca1 Charles Keepax 2025-03-18  218  
318e8794e05ca1 Charles Keepax 2025-03-18  219  	if (snd_soc_volsw_is_stereo(mc)) {
318e8794e05ca1 Charles Keepax 2025-03-18  220  		ret = soc_mixer_valid_ctl(mc, ucontrol->value.integer.value[1], max);
318e8794e05ca1 Charles Keepax 2025-03-18  221  		if (ret)
318e8794e05ca1 Charles Keepax 2025-03-18  222  			return ret;
318e8794e05ca1 Charles Keepax 2025-03-18  223  
318e8794e05ca1 Charles Keepax 2025-03-18  224  		if (mc->reg == mc->rreg) {
250e23c899e7bf Charles Keepax 2026-02-23  225  			val1 |= soc_mixer_ctl_to_reg(mc,
250e23c899e7bf Charles Keepax 2026-02-23  226  						     ucontrol->value.integer.value[1],
250e23c899e7bf Charles Keepax 2026-02-23  227  						     mask, mc->rshift, max);
318e8794e05ca1 Charles Keepax 2025-03-18 @228  			val_mask |= mask << mc->rshift;
318e8794e05ca1 Charles Keepax 2025-03-18  229  		} else {
250e23c899e7bf Charles Keepax 2026-02-23  230  			val2 = soc_mixer_ctl_to_reg(mc,
250e23c899e7bf Charles Keepax 2026-02-23  231  						    ucontrol->value.integer.value[1],
250e23c899e7bf Charles Keepax 2026-02-23  232  						    mask, mc->shift, max);
318e8794e05ca1 Charles Keepax 2025-03-18  233  			double_r = true;
318e8794e05ca1 Charles Keepax 2025-03-18  234  		}
318e8794e05ca1 Charles Keepax 2025-03-18  235  	}
318e8794e05ca1 Charles Keepax 2025-03-18  236  
318e8794e05ca1 Charles Keepax 2025-03-18  237  	ret = snd_soc_component_update_bits(component, mc->reg, val_mask, val1);
318e8794e05ca1 Charles Keepax 2025-03-18  238  	if (ret < 0)
318e8794e05ca1 Charles Keepax 2025-03-18  239  		return ret;
318e8794e05ca1 Charles Keepax 2025-03-18  240  
318e8794e05ca1 Charles Keepax 2025-03-18  241  	if (double_r) {
318e8794e05ca1 Charles Keepax 2025-03-18  242  		int err = snd_soc_component_update_bits(component, mc->rreg,
318e8794e05ca1 Charles Keepax 2025-03-18  243  							val_mask, val2);
318e8794e05ca1 Charles Keepax 2025-03-18  244  		/* Don't drop change flag */
318e8794e05ca1 Charles Keepax 2025-03-18  245  		if (err)
318e8794e05ca1 Charles Keepax 2025-03-18  246  			return err;
318e8794e05ca1 Charles Keepax 2025-03-18  247  	}
318e8794e05ca1 Charles Keepax 2025-03-18  248  
318e8794e05ca1 Charles Keepax 2025-03-18  249  	return ret;
318e8794e05ca1 Charles Keepax 2025-03-18  250  }
318e8794e05ca1 Charles Keepax 2025-03-18  251  

:::::: The code at line 228 was first introduced by commit
:::::: 318e8794e05ca1879441a602e78c74f9d7e18309 ASoC: ops: Factor out common code from put callbacks

:::::: TO: Charles Keepax <ckeepax@opensource.cirrus.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
