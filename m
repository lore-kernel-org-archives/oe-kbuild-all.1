Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F3A265CB9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Apr 2025 17:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745428537; cv=none; b=pMod93QWaGYel5U5uhYd4dhyegdb63gqT9g4xaftn0CLDEv556ZJLBsCSoTvoVsakgOzg0sE23QoRphiGTlEfrSeALFt4q3noVYjo/2D5QKk8JNZTSFhXZhkCGfYviLHLaLrNmseyfj5gHh2TA/HwnLVioCP0QVjgN1+yCvpnAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745428537; c=relaxed/simple;
	bh=CNpY2SAgUnS2pj6eC4ChfKIf6VRhDgm3Ttes4ta+9Oo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M2N4zY8/iwVCHIqJR7uG1poV8tuFCeBvPU3fPLXQeJJM+jSt9zy3aO9S4fMv5qm1YqqRKqWVCkHfGrTZy0CRs3oQGkekYVZMQ1IhscUx8gNWvs5lgQX4fwkOxeD4fJsT8Cmsvp7UpS04N3vpMbOZ9G7ZcTz+E8khoz+xQV6yToQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fPuDYmUN; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fPuDYmUN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745428535; x=1776964535;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CNpY2SAgUnS2pj6eC4ChfKIf6VRhDgm3Ttes4ta+9Oo=;
  b=fPuDYmUNw8kSBv0Pe59EOFfploUYn1AE6GbhEjPvRoWXFwHC52ov9uET
   1e2p6o8h2tKQSmRbOYL0sdXfebtSEVbJOGdeiJgT69HweWgYeKx2UY0sV
   dqTyeCpWCFJ1ub6Caaw5Yp8GJDSYQf9wj5nfIO58qkW+wktHs/j898Y6w
   sfzS3ckeuqBbtgtWvPDbdrx9zgWmwGe0aBcSE93uKboshyKnIUfBXwW4t
   ltKuilKRwcDEKicVVVuUheucoz7mBdJyR/ovMEa/YIwJvZrFKyU88VVAX
   658xHjlOutz62KZLkW6kpSLHRfzlI9Y7eE+JsJ3gABvdr01YCiTUBIfMs
   A==;
X-CSE-ConnectionGUID: 5iJ21pwST+Ow4pw+XlggbQ==
X-CSE-MsgGUID: b2h6SPxfR2+Eam/p4PDUbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="57677563"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="57677563"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 10:15:31 -0700
X-CSE-ConnectionGUID: tshOWGFpRi+Qb8mdzPjgFA==
X-CSE-MsgGUID: RwKePvHETf2bmaxBtNbdhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="137234671"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 23 Apr 2025 10:15:30 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7dh1-0003UV-0W;
	Wed, 23 Apr 2025 17:15:27 +0000
Date: Thu, 24 Apr 2025 01:14:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 0/1] init/main.c:251:6: sparse:
 sparse: symbol 'xbc_namebuf' was not declared. Should it be static?
Message-ID: <202504240116.IfC3HZIO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   986c38813dfff17c05f7e2f72992eda39fcb5278
commit: dca811b6c4342bf1b98b67e199b9b01d3b3c2166 [0/1] UPSTREAM: bootconfig: init: Allow admin to use bootconfig for kernel command line
config: i386-randconfig-061-20250423 (https://download.01.org/0day-ci/archive/20250424/202504240116.IfC3HZIO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250424/202504240116.IfC3HZIO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504240116.IfC3HZIO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> init/main.c:251:6: sparse: sparse: symbol 'xbc_namebuf' was not declared. Should it be static?
   init/main.c:327:5: sparse: sparse: symbol 'boot_config_checksum' was not declared. Should it be static?

vim +/xbc_namebuf +251 init/main.c

   250	
 > 251	char xbc_namebuf[XBC_KEYLEN_MAX] __initdata;
   252	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
