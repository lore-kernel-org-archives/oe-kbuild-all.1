Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B91E1E7666
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 11:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727869219; cv=none; b=UZeqcTTfEQ6futzmdKxqvbUF8/DO6k0+Yni1BNIp1Wvrk9Wsp5VYib+NNTEP8VUwYm/e9DE21v6gfkisOQO6jTZR5/6jMxug/5WLJRULnhI18acrE2DhHNPE2EySu6O6c4o8QW4kTQ5GPK/bC3DoeoEMR8H3ZyZIRbHixD1yFHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727869219; c=relaxed/simple;
	bh=auqDkehBTf1OQZVXFZ37dW3EuxDXFoJMYE7ECZapY20=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qvqnn5cNvG4fNi9XiJqyNUHOhngZSo6vPH9t9bJvmehR1j4CLtdi1b/fDb4I20hxf/c3g8ZwJ2++M2Lu3AQ3cTwsAOvfB9A0yyYaB23Z4K5sKTBHgun2hIKQoAuCviJArs33csYKXxkyE4AbCokyM1Q32aW0Cu71t0fsB+ISw08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qv0tb3IW; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qv0tb3IW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727869218; x=1759405218;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=auqDkehBTf1OQZVXFZ37dW3EuxDXFoJMYE7ECZapY20=;
  b=Qv0tb3IWHnbylxUwXoyHLBuH8iPg2wOVYfczcmZ8SQVBX7GaZv+SDZWl
   ELrFXURnIsRBL4EATMp81OlrJuEj4Ysh5q8HIhNxnpU7GVlyOyyefLZ/J
   Unfq4OizEYOAecKi6bjOc5kFj26PEu1ugCssjjWKBrLnJa6z16EX1D65z
   gjWAKEXQ0FM2ZdlAxdOLdNaMuNcipBDMfi88gc1Japf4b6TFO8oU+b2ny
   xY+nhMd3VGUXQqYI2z1/EcwPp9eKWVCiFPe+VN31F29lHV6SXWm+S10gz
   lA99EB9Biaiym0qnCa03EOwXWolG2jjzHkdBK4MvisYbEkjvU4K8fBVVB
   A==;
X-CSE-ConnectionGUID: 5OENG2cHTta6btiWl1RjCg==
X-CSE-MsgGUID: mOY1Hvk8RGm/zwGaUGnp/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="37695872"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="37695872"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 04:40:17 -0700
X-CSE-ConnectionGUID: 2DRTz5pCS1GZ75qjPllZ3w==
X-CSE-MsgGUID: AMxmrgSESRymrL/UBBQrag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="74212115"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 02 Oct 2024 04:40:15 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svxiH-000Rz3-0T;
	Wed, 02 Oct 2024 11:40:13 +0000
Date: Wed, 2 Oct 2024 19:39:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [linux-next:master 1413/2025]
 drivers/gpu/drm/i915/gvt/aperture_gm.c:326:9: sparse: sparse: Using plain
 integer as NULL pointer
Message-ID: <202410021951.KfCEVbgG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fe21733536749bb1b31c9c84e0b8d2ab8d82ce13
commit: 2edc6a75f26c112d90ca67ff412ba79622069818 [1413/2025] drm/i915: switch intel_wakeref_t underlying type to struct ref_tracker *
config: x86_64-randconfig-r122-20241002 (https://download.01.org/0day-ci/archive/20241002/202410021951.KfCEVbgG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410021951.KfCEVbgG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410021951.KfCEVbgG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/gvt/aperture_gm.c:326:9: sparse: sparse: Using plain integer as NULL pointer
--
>> drivers/gpu/drm/i915/gvt/scheduler.c:1756:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/i915/gvt/scheduler.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +326 drivers/gpu/drm/i915/gvt/aperture_gm.c

28a60dee2ce602 Zhi Wang     2016-09-02  313  
d22a48bf7302ef Changbin Du  2017-01-13  314  /**
d22a48bf7302ef Changbin Du  2017-01-13  315   * intel_vgpu_reset_resource - reset resource state owned by a vGPU
d22a48bf7302ef Changbin Du  2017-01-13  316   * @vgpu: a vGPU
d22a48bf7302ef Changbin Du  2017-01-13  317   *
d22a48bf7302ef Changbin Du  2017-01-13  318   * This function is used to reset resource state owned by a vGPU.
d22a48bf7302ef Changbin Du  2017-01-13  319   *
d22a48bf7302ef Changbin Du  2017-01-13  320   */
d22a48bf7302ef Changbin Du  2017-01-13  321  void intel_vgpu_reset_resource(struct intel_vgpu *vgpu)
d22a48bf7302ef Changbin Du  2017-01-13  322  {
a61ac1e75105a0 Chris Wilson 2020-03-06  323  	struct intel_gvt *gvt = vgpu->gvt;
a61ac1e75105a0 Chris Wilson 2020-03-06  324  	intel_wakeref_t wakeref;
d22a48bf7302ef Changbin Du  2017-01-13  325  
a61ac1e75105a0 Chris Wilson 2020-03-06 @326  	with_intel_runtime_pm(gvt->gt->uncore->rpm, wakeref)
d22a48bf7302ef Changbin Du  2017-01-13  327  		_clear_vgpu_fence(vgpu);
d22a48bf7302ef Changbin Du  2017-01-13  328  }
d22a48bf7302ef Changbin Du  2017-01-13  329  

:::::: The code at line 326 was first introduced by commit
:::::: a61ac1e75105a077ec1efd6923ae3c619f862304 drm/i915/gvt: Wean gvt off using dev_priv

:::::: TO: Chris Wilson <chris@chris-wilson.co.uk>
:::::: CC: Zhenyu Wang <zhenyuw@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
