Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6B22744F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 May 2026 13:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779543200; cv=none; b=jxlwZMgXvi9FbUpqOEAaiaK0XDIildz89aopwkvIhpz59JNxDtzX/mNHyyyt/JSH3nyXrPBh8mv5J4H8aU0qISbdZb6xdGnn65NDHKOVfyBL0f8+vuMot306CkkgZqo6YhyMwMukB3cWzLEjSnnxWzpk571pokdKb/g00clW+F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779543200; c=relaxed/simple;
	bh=2KWzcw/n50DOClgXX2xg88iDngFPaLZGTGAo2ISfWys=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Pm3xJO6qqIQA+7h0XC8//IsnkpBXrbDHjVRQGHMnxf7ol5s5bwHdpy+3MLbaCcPvMSBb18dperkVCba2yAIQLa/aPb76i75hePQvN3Ica1n4Se7QxsGe07a6wVOUgOW1FQ+3AiPo9YCorDkHfrkC7DNwi7D+TUSw1kMLjPqrjPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XNb/Hg6G; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XNb/Hg6G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779543200; x=1811079200;
  h=date:from:to:cc:subject:message-id;
  bh=2KWzcw/n50DOClgXX2xg88iDngFPaLZGTGAo2ISfWys=;
  b=XNb/Hg6GjH9srcKRQQQQM7TsW2YM996IIPW75KZI9L6JsIenP326M0PN
   xyGhrQyq9QMbFHMKsgZLaNPXm1rEFtAMEm3GlTCTicb3drkPJWiawAs9J
   LXeEwHMnHL8BRk2AotqgUdjRjYzliX3+53JRA+T/oAhIGwTknIlvBBmfZ
   mIie5FgcHEGNBl+OnqTTNKhqB+YG/DkPQJdP+s3T/KACx6LMdiZDRMaMT
   tcWTIcTAE5BrKzC73JGULoQbt0Mc03Y0IkWn7dzOQCrp93AZnf4iE/Gr9
   OdEDuXavQ/82oUYne6DKXeGUvKYQ+OeoRLv6HaU0c3hpvdeA1WYFbTl2S
   g==;
X-CSE-ConnectionGUID: weoFu1X7SsKr5Mg4cLsHsA==
X-CSE-MsgGUID: 7nJgTqxOR/mV/1HlyF4m2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="105908082"
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="105908082"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 06:33:19 -0700
X-CSE-ConnectionGUID: 18rPwedISXi9XBvRwTsBbw==
X-CSE-MsgGUID: dakluYFeSpGUVBiRneGPCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="246243493"
Received: from lkp-server01.sh.intel.com (HELO cef7325a8999) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 May 2026 06:33:17 -0700
Received: from kbuild by cef7325a8999 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQmTb-00000000051-0Cnf;
	Sat, 23 May 2026 13:33:15 +0000
Date: Sat, 23 May 2026 21:33:08 +0800
From: kernel test robot <lkp@intel.com>
To: "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 11/1130]
 usr/include/linux/atmapi.h:29:32: error: '__u64ptr' undeclared here (not in a
 function)
Message-ID: <202605232156.R9qnKAMC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: d7248704a9e61a04dbe3289ba19e99273d16504e [11/1130] cheri: UAPI: Make sure we can store a user pointer in atm_kptr_t
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20260523/202605232156.R9qnKAMC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260523/202605232156.R9qnKAMC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605232156.R9qnKAMC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./usr/include/linux/atm_nicstar.h:22,
                    from <command-line>:
>> usr/include/linux/atmapi.h:29:32: error: '__u64ptr' undeclared here (not in a function)
      29 |         unsigned char _[sizeof(__u64ptr)];
         |                                ^~~~~~~~
>> usr/include/linux/atmapi.h:30:41: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'atm_kptr_t'
      30 | } __ATM_API_ALIGN __CHERI_POINTER_ALIGN atm_kptr_t;
         |                                         ^~~~~~~~~~
--
   In file included from ./usr/include/linux/atm_tcp.h:11,
                    from <command-line>:
>> usr/include/linux/atmapi.h:29:32: error: '__u64ptr' undeclared here (not in a function)
      29 |         unsigned char _[sizeof(__u64ptr)];
         |                                ^~~~~~~~
>> usr/include/linux/atmapi.h:30:41: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'atm_kptr_t'
      30 | } __ATM_API_ALIGN __CHERI_POINTER_ALIGN atm_kptr_t;
         |                                         ^~~~~~~~~~
>> ./usr/include/linux/atm_tcp.h:38:9: error: unknown type name 'atm_kptr_t'
      38 |         atm_kptr_t vcc;         /* both directions */
         |         ^~~~~~~~~~
--
   In file included from ./usr/include/linux/atmsvc.h:10,
                    from <command-line>:
>> usr/include/linux/atmapi.h:29:32: error: '__u64ptr' undeclared here (not in a function)
      29 |         unsigned char _[sizeof(__u64ptr)];
         |                                ^~~~~~~~
>> usr/include/linux/atmapi.h:30:41: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'atm_kptr_t'
      30 | } __ATM_API_ALIGN __CHERI_POINTER_ALIGN atm_kptr_t;
         |                                         ^~~~~~~~~~
>> ./usr/include/linux/atmsvc.h:25:9: error: unknown type name 'atm_kptr_t'
      25 |         atm_kptr_t vcc;
         |         ^~~~~~~~~~
   ./usr/include/linux/atmsvc.h:26:9: error: unknown type name 'atm_kptr_t'
      26 |         atm_kptr_t listen_vcc;          /* indicate */
         |         ^~~~~~~~~~
--
   In file included from <command-line>:
>> ./usr/include/linux/atmapi.h:29:32: error: '__u64ptr' undeclared here (not in a function)
      29 |         unsigned char _[sizeof(__u64ptr)];
         |                                ^~~~~~~~
>> ./usr/include/linux/atmapi.h:30:41: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'atm_kptr_t'
      30 | } __ATM_API_ALIGN __CHERI_POINTER_ALIGN atm_kptr_t;
         |                                         ^~~~~~~~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
