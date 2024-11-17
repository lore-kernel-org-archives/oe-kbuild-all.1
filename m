Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA7C8F7D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Nov 2024 00:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731803067; cv=none; b=VAj2Rf9D6q5wziqZUT5til4V0MWkwiP3h9BP2X5d2zEC176Y0fKutFDHm5rSkZYVtalASTPfdldng7GX6toshBA4ZSa/uzKDTwXhQiSOeUr/7phcSUWDKg510P7zbBDopeNQu0zlaIvhqYtdeQnsq+biXDO0jvrxc6sUD/08Q8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731803067; c=relaxed/simple;
	bh=Gh+XmsJ5eWXuf3DY0ydaCNnLfS712j0AO0ch1NjRvK4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kRMHu9dpi4Gw2AVuoCo5rIQ7dfbeutbIurRzsp2znRMri6ZjhyymugzwMW2r6VMCrTkbLOVxqIxNysdbzv4KeUJTsQl17JDQUgySgV+GeGUxb06DLwVTCrOc+zlrFbzFvRGv/nCFYfSdNJhxyjUrh2lv5+RsnRYTYD1egmkKmfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RhXUlfDw; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RhXUlfDw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731803065; x=1763339065;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gh+XmsJ5eWXuf3DY0ydaCNnLfS712j0AO0ch1NjRvK4=;
  b=RhXUlfDw+AU+AIIhmm5r9yzrvuQjM2HooJbg7PzJbweqxd2rSDyO9y/y
   5d4VjexucvxsxwsvD6XgwUgWQe8qP6iiQmNC8t8C7rpEU2t/ESOskW9W7
   xeEDjulKeE1kWSTLSFPNC7nfCvLYoad+xfPVSQbEBu8R6rP7lrNFiD2Lz
   OxES5pkkRJ77QKp9os0P5fnHja8W4VsedwgzMVTHhkSIttSmlVzQcLKpK
   8AGvx9AuWEvL8qlSZjl68As95zKwsr3wbzet8dqrcqeqs+0VMXLBbLMUg
   3iO5NIHe+61/2rkdjWEkmd1TWeSNGJ8MgJjo2Hu8olMkmEK5m17jSrarE
   w==;
X-CSE-ConnectionGUID: +EMwb8hmTkOmz0l2ZggxeQ==
X-CSE-MsgGUID: +tVrfmBLSOKlk4UmBYAZ7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="49215970"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="49215970"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 16:24:25 -0800
X-CSE-ConnectionGUID: NlOQrBWXS2iRrm5jWX7qwg==
X-CSE-MsgGUID: IANBsbLJTr+mQ1oYCx4gnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="88883651"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Nov 2024 16:24:23 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCT5Q-0001BV-32;
	Sun, 17 Nov 2024 00:24:20 +0000
Date: Sun, 17 Nov 2024 08:23:45 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Yejian <zhengyejian1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1474/1474] kernel/module/strict_rwx.c:36:6:
 warning: no previous prototype for function 'module_disable_ro'
Message-ID: <202411170813.ebFeHSuu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zheng,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   7c547c6bbe6b6a9cedf63d7cdadb2529404df633
commit: c8783f92771c891518257c9deb22cd91d4e1a212 [1474/1474] livepatch/core: Revert module_enable_ro and module_disable_ro
config: arm64-randconfig-003-20241117 (https://download.01.org/0day-ci/archive/20241117/202411170813.ebFeHSuu-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411170813.ebFeHSuu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411170813.ebFeHSuu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/module/strict_rwx.c:36:6: warning: no previous prototype for function 'module_disable_ro' [-Wmissing-prototypes]
   void module_disable_ro(const struct module *mod)
        ^
   kernel/module/strict_rwx.c:36:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void module_disable_ro(const struct module *mod)
   ^
   static 
   1 warning generated.


vim +/module_disable_ro +36 kernel/module/strict_rwx.c

    34	
    35	#ifdef CONFIG_LIVEPATCH_WO_FTRACE
  > 36	void module_disable_ro(const struct module *mod)
    37	{
    38		if (!IS_ENABLED(CONFIG_STRICT_MODULE_RWX))
    39			return;
    40	#ifdef CONFIG_STRICT_MODULE_RWX
    41		if (!rodata_enabled)
    42			return;
    43	#endif
    44	
    45		module_set_memory(mod, MOD_TEXT, set_memory_rw);
    46		module_set_memory(mod, MOD_INIT_TEXT, set_memory_rw);
    47		module_set_memory(mod, MOD_RODATA, set_memory_rw);
    48		module_set_memory(mod, MOD_INIT_RODATA, set_memory_rw);
    49	}
    50	#endif /* CONFIG_LIVEPATCH_WO_FTRACE */
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
