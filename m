Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB4B6AD7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 May 2024 16:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716395892; cv=none; b=PXcVpcnBVre/b9Qv3QvASpQ4fIpKx/D4yeb8FjwTjPci2c8gfd9aRUEannbxTPLQRC/48VKf80J7Ljc/Epw3Pf4dWOjjvWXcVpkiW8eDOBLfteP1XyftDqwOJTjXVKUtqKW+ml/niVqyQCzWiiIrTbH3tqFWxmiHO2J3KeeEyAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716395892; c=relaxed/simple;
	bh=S1u2/vyD0PzAWoNIctJL/i8Za3eL/UwUFoThoTmwFtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dQx8D2Xz4oAQSedD/c8VRONVocbQAq7Y1e8FDS2kk1ekULlWP2GMfdB1VWpyjU9WzV2QS1ItT9okPlm9cj7dgfuH2PtjTtAs9oV7FwcGG7noz8/2omQQj5aD7PRItJzZOnECtcNoKJ/RrLarIYs3fi80vBI6ppRAejnKMwVMcm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VL7GoGfG; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VL7GoGfG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716395890; x=1747931890;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S1u2/vyD0PzAWoNIctJL/i8Za3eL/UwUFoThoTmwFtQ=;
  b=VL7GoGfGPSPOpjw3zKZCjdeaCRcDUHvoVzxHQfXbVbfnj6fCPNWL8yBw
   TiING9IZHhseB1B8RH7vUr+6VkWVBwkujzxBDoQomZmHyja5DUZ1+Zsnm
   jhT3WpqmUn5NIvHmdFjqtgpZWemMetG+5cJE7zyoaRsZXHssOE7FaL5/N
   +nyJCIvB6ABy06190aN3EqPnq6JjHrn6HDJpmUSjQugup80P3ups4goqB
   7mdA9LxJbUXncGz0mB0MXuLeYp21Z6PlvAC68Z4/rxBknMeLcpy93FGlJ
   s/Sudel19XBDvvgF8eAdSXT8LtRgu3vZ6NwYsv2JGrCYjvFyWnxG7iBLE
   w==;
X-CSE-ConnectionGUID: 7lG7zuvGQbeBqzWaiMMMjQ==
X-CSE-MsgGUID: wRwPJC6PRCSqszGmeO5R7g==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="35175894"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="35175894"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 09:38:10 -0700
X-CSE-ConnectionGUID: HruLvYcITGmgL0Oks3QjHA==
X-CSE-MsgGUID: kUuFxigtT0ayKeuaT6iD9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="56592648"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 22 May 2024 09:38:09 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9oyd-0001l3-06;
	Wed, 22 May 2024 16:38:07 +0000
Date: Thu, 23 May 2024 00:38:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-classmap-fix-8d 15/36] lib/dynamic_debug.c:1202:28: error:
 incomplete definition of type 'struct module'
Message-ID: <202405230018.cfDp0UI1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-classmap-fix-8d
head:   2352bebbccad8392205c384daaee21f2d9f23d8b
commit: afcb89e9541581d45c1619217f94aa8f80d19649 [15/36] dyndbg-API: fix DECLARE_DYNDBG_CLASSMAP
config: i386-buildonly-randconfig-002-20240522 (https://download.01.org/0day-ci/archive/20240523/202405230018.cfDp0UI1-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240523/202405230018.cfDp0UI1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405230018.cfDp0UI1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/dynamic_debug.c:1202:28: error: incomplete definition of type 'struct module'
    1202 |                         for (i = 0, kp = cm->mod->kp; i < cm->mod->num_kp; i++, kp++)
         |                                          ~~~~~~~^
   arch/x86/include/asm/alternative.h:108:8: note: forward declaration of 'struct module'
     108 | struct module;
         |        ^
   lib/dynamic_debug.c:1202:45: error: incomplete definition of type 'struct module'
    1202 |                         for (i = 0, kp = cm->mod->kp; i < cm->mod->num_kp; i++, kp++)
         |                                                           ~~~~~~~^
   arch/x86/include/asm/alternative.h:108:8: note: forward declaration of 'struct module'
     108 | struct module;
         |        ^
   2 errors generated.


vim +1202 lib/dynamic_debug.c

  1193	
  1194	static void ddebug_apply_params(const struct ddebug_class_map *cm, const char *modnm)
  1195	{
  1196		const struct kernel_param *kp;
  1197		int i;
  1198	
  1199		if (IS_ENABLED(CONFIG_MODULES)) {
  1200			if (cm->mod) {
  1201				vpr_cm_info(cm, "loaded class:");
> 1202				for (i = 0, kp = cm->mod->kp; i < cm->mod->num_kp; i++, kp++)
  1203					ddebug_match_apply_kparam(kp, cm, modnm);
  1204			}
  1205		}
  1206		if (!cm->mod) {
  1207			vpr_cm_info(cm, "builtin class:");
  1208			for (kp = __start___param; kp < __stop___param; kp++)
  1209				ddebug_match_apply_kparam(kp, cm, modnm);
  1210		}
  1211	}
  1212	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
