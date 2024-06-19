Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22A713E039
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jun 2024 17:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718818596; cv=none; b=GPZw4+NwdmnCU338IW8Z8bv1GPgebtNdZAHMPezOu7m3MJLr7PplQLekLzetFl6+SKMtSJ07TAv3lqTqmAzyFVyPOwAkVbUIBWZECb7wO1QE7k6i/0x0zxQfXvCF757pJEJO5Yz2HaKkCpotGrbJYNHciyc8l5JHWH7AxyMX85k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718818596; c=relaxed/simple;
	bh=zgt07h4k1p5iqNs85Q8uYf74j4269Ei2ithnyES1fXI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t9se7Dh+Hh6gjQpYYW6ElMjOk0rMzRaccxXtwDOBMFlvPgxyFve4HF/SIjWEZ9wVd1WT8MuFDuGjJ4W/ydseEbM/6hOgKATigm9BSc/z3HC/qdzOJqmjpvJ090uL6LDE8/nNndOZdJyorfafkeAXJZRJYd49Te+UhysVRwNTZPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LTqGigpQ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LTqGigpQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718818594; x=1750354594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zgt07h4k1p5iqNs85Q8uYf74j4269Ei2ithnyES1fXI=;
  b=LTqGigpQJ5pBRUp2Vt7kB5jj9CTJet/fhnamUlUQA/X3zZhxQh3tI+hp
   /DMWfNWGASKstVmFH7+AuvTlo95u5JB0Z0w+WGDNAW2VMSf4b97Y1IkfI
   HzHy3DcaAiXsvahqa5N2h9HhPkVG96CtlUYWq4+nBtU1yepGlhe+1Dscl
   XpvuypDDgBltrA6I71Es5FPiGRFDp97G7VLqxXm8DW2No0Cm36X3mfFl4
   UMfraNWhl8ADKxivdfHdcAv9UMpOdU5jozb0svdF8N+xIr+NQsTyy+w5g
   y5Y+6SC63l1z2qZ6BIgX6n55CfE7k/xISo4xMM2XsWNUt+jEeUrCYAj9O
   Q==;
X-CSE-ConnectionGUID: HZLdZAmDSUmuCGfbZhZOhw==
X-CSE-MsgGUID: a8rqzrZ7SZqHcI91+qeI7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="26408172"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="26408172"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 10:36:34 -0700
X-CSE-ConnectionGUID: vkXIUdV/TPerQkciRpVi7A==
X-CSE-MsgGUID: KT/fmG9SQ2uxm7auvBvQkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="42683258"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 19 Jun 2024 10:36:33 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJzEU-0006p2-35;
	Wed, 19 Jun 2024 17:36:30 +0000
Date: Thu, 20 Jun 2024 01:36:10 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [plbossart-sound:sdw/power-up-all-links 5/5]
 drivers/soundwire/intel_ace2x.c:150:6: warning: variable 'ret' is used
 uninitialized whenever 'if' condition is false
Message-ID: <202406200102.evyuf0TR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound sdw/power-up-all-links
head:   e217e91a2b35ae24464f985c4066597a3bf841b6
commit: 81326c8d060fffd191a6b2185057f229f064164a [5/5] soundwire: intel_ace2x: power-up/down all links at the same time
config: i386-buildonly-randconfig-002-20240619 (https://download.01.org/0day-ci/archive/20240620/202406200102.evyuf0TR-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240620/202406200102.evyuf0TR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406200102.evyuf0TR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soundwire/intel_ace2x.c:150:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     150 |         if (!*shim_mask) {
         |             ^~~~~~~~~~~
   drivers/soundwire/intel_ace2x.c:191:9: note: uninitialized use occurs here
     191 |         return ret;
         |                ^~~
   drivers/soundwire/intel_ace2x.c:150:2: note: remove the 'if' if its condition is always true
     150 |         if (!*shim_mask) {
         |         ^~~~~~~~~~~~~~~~
   drivers/soundwire/intel_ace2x.c:133:9: note: initialize the variable 'ret' to silence this warning
     133 |         int ret;
         |                ^
         |                 = 0
   drivers/soundwire/intel_ace2x.c:206:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     206 |         if (!*shim_mask) {
         |             ^~~~~~~~~~~
   drivers/soundwire/intel_ace2x.c:223:9: note: uninitialized use occurs here
     223 |         return ret;
         |                ^~~
   drivers/soundwire/intel_ace2x.c:206:2: note: remove the 'if' if its condition is always true
     206 |         if (!*shim_mask) {
         |         ^~~~~~~~~~~~~~~~
   drivers/soundwire/intel_ace2x.c:198:9: note: initialize the variable 'ret' to silence this warning
     198 |         int ret;
         |                ^
         |                 = 0
   2 warnings generated.


vim +150 drivers/soundwire/intel_ace2x.c

   124	
   125	static int intel_link_power_up(struct sdw_intel *sdw)
   126	{
   127		struct sdw_bus *bus = &sdw->cdns.bus;
   128		struct sdw_master_prop *prop = &bus->prop;
   129		u32 *shim_mask = sdw->link_res->shim_mask;
   130		unsigned int link_id = sdw->instance;
   131		u32 clock_source;
   132		u32 syncprd;
   133		int ret;
   134	
   135		if (prop->mclk_freq % 6000000) {
   136			if (prop->mclk_freq % 2400000) {
   137				syncprd = SDW_SHIM_SYNC_SYNCPRD_VAL_24_576;
   138				clock_source = SDW_SHIM2_MLCS_CARDINAL_CLK;
   139			} else {
   140				syncprd = SDW_SHIM_SYNC_SYNCPRD_VAL_38_4;
   141				clock_source = SDW_SHIM2_MLCS_XTAL_CLK;
   142			}
   143		} else {
   144			syncprd = SDW_SHIM_SYNC_SYNCPRD_VAL_96;
   145			clock_source = SDW_SHIM2_MLCS_AUDIO_PLL_CLK;
   146		}
   147	
   148		mutex_lock(sdw->link_res->shim_lock);
   149	
 > 150		if (!*shim_mask) {
   151			dev_dbg(sdw->cdns.dev, "powering up all links\n");
   152	
   153			ret = hdac_bus_eml_sdw_power_up_unlocked(sdw->link_res->hbus, sdw->link_res->link_mask);
   154			if (ret < 0) {
   155				dev_err(sdw->cdns.dev, "%s: hdac_bus_eml_sdw_power_up failed: %d\n",
   156					__func__, ret);
   157				goto out;
   158			}
   159	
   160			intel_shim_vs_set_clock_source(sdw, clock_source);
   161	
   162			/* we first need to program the SyncPRD/CPU registers */
   163			dev_dbg(sdw->cdns.dev, "first link up, programming SYNCPRD\n");
   164	
   165			ret =  hdac_bus_eml_sdw_set_syncprd_unlocked(sdw->link_res->hbus, syncprd);
   166			if (ret < 0) {
   167				dev_err(sdw->cdns.dev, "%s: hdac_bus_eml_sdw_set_syncprd failed: %d\n",
   168					__func__, ret);
   169				goto out;
   170			}
   171	
   172			/* SYNCPU will change once link is active */
   173			ret =  hdac_bus_eml_sdw_wait_syncpu_unlocked(sdw->link_res->hbus);
   174			if (ret < 0) {
   175				dev_err(sdw->cdns.dev, "%s: hdac_bus_eml_sdw_wait_syncpu failed: %d\n",
   176					__func__, ret);
   177				goto out;
   178			}
   179	
   180		}
   181	
   182		*shim_mask |= BIT(link_id);
   183	
   184		sdw->cdns.link_up = true;
   185	
   186		intel_shim_vs_init(sdw);
   187	
   188	out:
   189		mutex_unlock(sdw->link_res->shim_lock);
   190	
   191		return ret;
   192	}
   193	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
