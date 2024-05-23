Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255D346AF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 May 2024 11:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716462272; cv=none; b=ma4tckW6Y6J1OW1M4HavnrP0sg7UjRx7i2lBWcD37hv91BBEF6g1ZwQELmbwHqq9nvYLwjXhgeXGSzKGVQ2snkqb7mljzyBfOQs7HjcjBPZ126wetqH+Kt7pSHV0ClPhbSXk5PCekjQ7CoCe+NjGL/mwKbCBzyN3GsDkZHVoLR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716462272; c=relaxed/simple;
	bh=to595yDYFDbGhZM+ILCQO2t+/EhiEo6a7r+4dmzpCN4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JDnU+tiBC1D8R52ypTEkERamCALICseNB8W739eIQgA4CkVo526okahAS8mQ03NADy1wdTiU4OUm3zNILTJ8Yfv0jY0+two0+R0e84vxFDu7QBoOAgHMYTe9V3zv5ovJdPxjHvD8OmwqPhnH6xKZ2lSn/pizKkuWH2iIWa/Ihec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YHAwOkBg; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YHAwOkBg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716462271; x=1747998271;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=to595yDYFDbGhZM+ILCQO2t+/EhiEo6a7r+4dmzpCN4=;
  b=YHAwOkBg+w3DUoXOdkj6uxoF8a531RXLDx+IsNKh2OrDErF3MfNjfJe/
   v75u9KtF0vJpsTrq2qbG2YnbmRcXUOq1jOC/gHzUlildmvVh6Fw4yhYa0
   JwucfX77Md2nrevEOj+1Zl/ev0g1qP8xd+jrW2FDz+2dO72bhbUoRXfrw
   T7Z6Y/3BUnEXeZtwl+H4rbQfaLY4XIPYTZ9ecfXbXpOcCM7BqQseB+lHD
   2SD37bKfxHGVzQbuXxVpfLA8dD8sP1ZOruaHd879zKrkFSu5rMykF2r03
   zrT6jzkc54tzNi/ZNgUFa8UwpMQ2aJh1BH/6LEf0aqSOuXUfsEql3bLDz
   Q==;
X-CSE-ConnectionGUID: G2bBRQr/Rxa/wEs6F/knSQ==
X-CSE-MsgGUID: if+G4QyJQOOP3taKo4srrQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="12621688"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; 
   d="scan'208";a="12621688"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 04:04:31 -0700
X-CSE-ConnectionGUID: i3jhEVVtSQihCIQaIp+ZzA==
X-CSE-MsgGUID: k2Z9YQ3KRza8eqro8EuLwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; 
   d="scan'208";a="64843357"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 23 May 2024 04:04:29 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sA6FG-0002lZ-0R;
	Thu, 23 May 2024 11:04:26 +0000
Date: Thu, 23 May 2024 19:03:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-classmap-fix-8d 15/36] lib/dynamic_debug.c:1203:27: error:
 dereferencing pointer to incomplete type 'const struct module'
Message-ID: <202405231852.zKSJfBSQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-classmap-fix-8d
head:   07a74c0e1fe9c389f87ba0cd56d5178c3e87103c
commit: 1bc89a95b93be7bf897ed23bb5903ba2c901b9b6 [15/36] dyndbg-API: fix DECLARE_DYNDBG_CLASSMAP
config: x86_64-buildonly-randconfig-002-20240523 (https://download.01.org/0day-ci/archive/20240523/202405231852.zKSJfBSQ-lkp@intel.com/config)
compiler: gcc-8 (Ubuntu 8.4.0-3ubuntu2) 8.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240523/202405231852.zKSJfBSQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405231852.zKSJfBSQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/dynamic_debug.c: In function 'ddebug_apply_params':
   lib/dynamic_debug.c:1197:18: warning: extra tokens at end of #ifdef directive
    #ifdef IS_ENABLED(CONFIG_MODULES)
                     ^
>> lib/dynamic_debug.c:1203:27: error: dereferencing pointer to incomplete type 'const struct module'
      for (i = 0, kp = cm->mod->kp; i < cm->mod->num_kp; i++, kp++)
                              ^~


vim +1203 lib/dynamic_debug.c

  1193	
  1194	static void ddebug_apply_params(const struct ddebug_class_map *cm, const char *modnm)
  1195	{
  1196		const struct kernel_param *kp;
  1197	#ifdef IS_ENABLED(CONFIG_MODULES)
  1198		int i;
  1199	
  1200		if (cm->mod) {
  1201			vpr_cm_info(cm, "loaded class:");
  1202			/* ifdef protects the cm->mod->kp deref */
> 1203			for (i = 0, kp = cm->mod->kp; i < cm->mod->num_kp; i++, kp++)
  1204				ddebug_match_apply_kparam(kp, cm, modnm);
  1205		}
  1206	#endif
  1207		if (!cm->mod) {
  1208			vpr_cm_info(cm, "builtin class:");
  1209			for (kp = __start___param; kp < __stop___param; kp++)
  1210				ddebug_match_apply_kparam(kp, cm, modnm);
  1211		}
  1212	}
  1213	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
