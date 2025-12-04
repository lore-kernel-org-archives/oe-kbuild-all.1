Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B8421CFE0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Dec 2025 14:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764858375; cv=none; b=Vw5vul3sfyLA/l9EWXkWHHD6VX6L/Erwei+TfFBN7KZTaL7ODIgPmlvkf2e1x+Tpg38iB/GtOR1HC87MPVml2JxJo8VSPTppE6rKFTAx9kt3wo4Pr1zNE/rXQInuxnCFzfa4jCsFZRyKtvitEb13vT1TJ9LOIeXiWdTdj5tTQ3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764858375; c=relaxed/simple;
	bh=waUGSfd2GhXUvl2mpQhOpHJTQRCiJIG4/glzWRHgn2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lw4CaJ2IiUfvNqTo3QdbnfMEeDrKBE88QBHt8FQFcAUziYLqQyrCfokFEnXSZVE93aomnj/xJ4OrOUnq03UA9kq+D9rH/THrVlKZqhNXy9dCbCexwVYKlUOCHFFA2URcODUtpuVvw397/IPpf0EFHRwN7PgHZRYkBVOBBUTsWfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=czo381oX; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="czo381oX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764858373; x=1796394373;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=waUGSfd2GhXUvl2mpQhOpHJTQRCiJIG4/glzWRHgn2g=;
  b=czo381oXeamR65ZVL1LMdiKRAsYpyfTHq80SPhAHrBojaWxbRC53P2cz
   TB6qdhZ0txWxjch0esjFOhzjY1XJu62oUBeptgBk8ScLPfk/Vp+sRilsO
   4u/4lwX0EAu8e/1bbS4m+9TfR7S+hypPltzOYwee62ws9euRG72sqqGtn
   ZakuqBotjDyWoYzfuMHhqN6Q2fYBAYFuHpXGyjngnxP9p7T5shw+3EAqn
   Qq60gBhXZ5uNiMG0YQuvHHI9aNkV45GiyR5Im1ylJABlWG6uWplk9U7J7
   otmEJqY43sCWaY2oE9jpI6+eXdJpegn/T2wVOkF00etUuZzleeoJKtKMN
   A==;
X-CSE-ConnectionGUID: k8/UazQVTYKrLm936wbqjw==
X-CSE-MsgGUID: KTmcQBd4SlKxk9Bcv6HIpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="77558254"
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; 
   d="scan'208";a="77558254"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 06:26:13 -0800
X-CSE-ConnectionGUID: HnQtEMdmS2yc29RCnRJjSg==
X-CSE-MsgGUID: hrU6657JSx+8+Obd1zJSkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; 
   d="scan'208";a="225665772"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Dec 2025 06:26:12 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRAHZ-00000000DrR-1FsL;
	Thu, 04 Dec 2025 14:26:09 +0000
Date: Thu, 4 Dec 2025 22:26:05 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 1/4] tpm2-sessions: fix out of range indexing in
 name_size
Message-ID: <202512042217.poWaYyYq-lkp@intel.com>
References: <20251202202643.107108-2-jarkko@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202202643.107108-2-jarkko@kernel.org>

Hi Jarkko,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20251202]
[also build test WARNING on v6.18]
[cannot apply to char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.18 v6.18-rc7 v6.18-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jarkko-Sakkinen/tpm2-sessions-fix-out-of-range-indexing-in-name_size/20251203-042945
base:   next-20251202
patch link:    https://lore.kernel.org/r/20251202202643.107108-2-jarkko%40kernel.org
patch subject: [PATCH v2 1/4] tpm2-sessions: fix out of range indexing in name_size
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251204/202512042217.poWaYyYq-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251204/202512042217.poWaYyYq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512042217.poWaYyYq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:31,
                    from arch/x86/include/asm/bug.h:193,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/barrier.h:5,
                    from include/linux/list.h:11,
                    from include/linux/module.h:12,
                    from drivers/char/tpm/tpm.h:21,
                    from drivers/char/tpm/tpm2-sessions.c:66:
   drivers/char/tpm/tpm2-sessions.c: In function 'name_size':
>> include/linux/kern_levels.h:5:25: warning: unknown conversion type character '\x0a' in format [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:484:25: note: in definition of macro 'printk_index_wrap'
     484 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:565:9: note: in expansion of macro 'printk'
     565 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:565:16: note: in expansion of macro 'KERN_WARNING'
     565 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~~~
   drivers/char/tpm/tpm2-sessions.c:161:17: note: in expansion of macro 'pr_warn'
     161 |                 pr_warn("tpm: invalid name algorithm: 0x%04\n", hash_alg);
         |                 ^~~~~~~
>> include/linux/kern_levels.h:5:25: warning: too many arguments for format [-Wformat-extra-args]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:484:25: note: in definition of macro 'printk_index_wrap'
     484 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:565:9: note: in expansion of macro 'printk'
     565 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:565:16: note: in expansion of macro 'KERN_WARNING'
     565 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~~~
   drivers/char/tpm/tpm2-sessions.c:161:17: note: in expansion of macro 'pr_warn'
     161 |                 pr_warn("tpm: invalid name algorithm: 0x%04\n", hash_alg);
         |                 ^~~~~~~


vim +5 include/linux/kern_levels.h

314ba3520e513a7 Joe Perches 2012-07-30  4  
04d2c8c83d0e3ac Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3ac Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3ac Joe Perches 2012-07-30  7  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
