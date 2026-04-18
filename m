Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BAA239E7D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Apr 2026 23:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776554632; cv=none; b=kPpjs6pCWRVyMCb03tCLBKSQ1vmYrgSt9kSUJmiGqN85xu/2emxXF7wMFB0GqbQrPUOaeuxTA1ZwvlGm0joTGeZ1zX9AZXvVP5o70LgnHl7+6yRXoEqEWTpmAmTMtOpAN+P+/ZtY6QYAYM+RZqjR2g3atdjGvL7GDPgNArV0Pg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776554632; c=relaxed/simple;
	bh=6e2lrapKaJyWzOp/obCbwSdRaa05a/yKtw8HPUGhob8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qwpv0b/aKR7QiOIL/Q8h7bh0aIMNJKNUq0Cdh8IvQFRrDDURCvuWHWLBoNMr5poIZaAE/Pc0bgMXo/JAz/sHZ2LSfjtS2gugP+mF9EGnQqYWi+GMUaZuroXjmIMIPqbLbx9GjxWNRz4qLFgmjtKuH3+BfSKgjqp709YcoUXcLG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LQRDOcxR; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LQRDOcxR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776554630; x=1808090630;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6e2lrapKaJyWzOp/obCbwSdRaa05a/yKtw8HPUGhob8=;
  b=LQRDOcxRE6QM71VvmRjBnreFDepEkXXhuEUtwwdfZWWAj50TlOITWkvt
   tmNiNOIH0WR8pHo63vtQbOhZpb1BGXy7PX0/TkSpjJOwWoIe7rUZ0wwkt
   xyBm8JGuJgSd5X97iEVEHel0uc1MT6PN/Kdni1eaJknPs86OwPXMPjeJm
   DuP25/lXTxVI8Vna/0/aqoa4zxOcIT7Ss6lNzligXAR0me46gUgzMZKSs
   SDrwLhFZSh2ABGzlJPTW/Yt49+63VPTj9Xnc2ZOHKXE3dL5UVa9si0P9W
   FHzcYeNxEMRTl36KCC55UUCJaoi/Rfft2aN4Qxz9c/oe13sRlV7qrRMuB
   w==;
X-CSE-ConnectionGUID: /CctWN8KS/KPHjj6ku2YBA==
X-CSE-MsgGUID: slgctdZLTmeerTZ9itivLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="100178893"
X-IronPort-AV: E=Sophos;i="6.23,187,1770624000"; 
   d="scan'208";a="100178893"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 16:23:50 -0700
X-CSE-ConnectionGUID: iLMqGpHUS9Kjdh5CByGLUw==
X-CSE-MsgGUID: pSTSQo5XTLaBWcsEKMIvDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,187,1770624000"; 
   d="scan'208";a="233119487"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Apr 2026 16:23:48 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wEF0r-000000001Y4-11mc;
	Sat, 18 Apr 2026 23:23:45 +0000
Date: Sun, 19 Apr 2026 07:23:33 +0800
From: kernel test robot <lkp@intel.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] xtensa: iss: bound command line construction in
 platform_setup()
Message-ID: <202604190738.DDzpg4Ro-lkp@intel.com>
References: <20260417074226.9295-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417074226.9295-1-pengpeng@iscas.ac.cn>

Hi Pengpeng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jcmvbkbc-xtensa/xtensa-for-next]
[also build test WARNING on linus/master v7.0 next-20260417]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pengpeng-Hou/xtensa-iss-bound-command-line-construction-in-platform_setup/20260417-224100
base:   https://github.com/jcmvbkbc/linux-xtensa xtensa-for-next
patch link:    https://lore.kernel.org/r/20260417074226.9295-1-pengpeng%40iscas.ac.cn
patch subject: [PATCH] xtensa: iss: bound command line construction in platform_setup()
config: xtensa-allnoconfig (https://download.01.org/0day-ci/archive/20260419/202604190738.DDzpg4Ro-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260419/202604190738.DDzpg4Ro-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604190738.DDzpg4Ro-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/xtensa/platforms/iss/setup.c: In function 'platform_setup':
>> arch/xtensa/platforms/iss/setup.c:75:54: warning: format '%s' expects argument of type 'char *', but argument 5 has type 'void *' [-Wformat=]
      75 |                                                  "%s%s", i > 1 ? " " : "",
         |                                                     ~^
         |                                                      |
         |                                                      char *
         |                                                     %p
      76 |                                                  argv[i]);
         |                                                  ~~~~~~~
         |                                                      |
         |                                                      void *


vim +75 arch/xtensa/platforms/iss/setup.c

    54	
    55	void __init platform_setup(char **p_cmdline)
    56	{
    57		static void *argv[COMMAND_LINE_SIZE / sizeof(void *)] __initdata;
    58		static char cmdline[COMMAND_LINE_SIZE] __initdata;
    59		int argc = simc_argc();
    60		int argv_size = simc_argv_size();
    61	
    62		if (argc > 1) {
    63			if (argv_size > sizeof(argv)) {
    64				pr_err("%s: command line too long: argv_size = %d\n",
    65				       __func__, argv_size);
    66			} else {
    67				int i, len = 0;
    68	
    69				cmdline[0] = 0;
    70				simc_argv((void *)argv);
    71	
    72				for (i = 1; i < argc; ++i) {
    73					len += scnprintf(cmdline + len,
    74							 COMMAND_LINE_SIZE - len,
  > 75							 "%s%s", i > 1 ? " " : "",

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
