Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57EC6FC5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Sep 2024 20:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726692715; cv=none; b=aqZxBG0yVatBYljipcFqucszI2nSLzYmpjXuLYXMw/VnmjlAIvoWOREMWbXf2wlm2KS5hMtA9uLHx8hCNrLv7Fv6HVVQ/k803gvGtG08TbgV7sntKeOIeGA5RK/oid2pkNeymm5fNxvf3NWnkZRXYHjqh0iM8tUW9bDrOS1wkGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726692715; c=relaxed/simple;
	bh=ciWx36Djxu0lYYIeON6HuQkYxYG5S385Fyyai6H2bsU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GAump1mXw1CzTW8TJe73FkSUYSgy5vaIIXZWvyZgTLmTwX/z6SEUN9V3/Lxx3djBQSnXhwFIQdLYlonzULhN5WUQQB/JXfdtOLFl0lYZsQmk2cnV/pQ3O2lm5LqHar4y7bkRvAr4x06nHnOodAMn0gGR1aXsa+1S1b5n25l2/gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CoUitNK1; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CoUitNK1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726692713; x=1758228713;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ciWx36Djxu0lYYIeON6HuQkYxYG5S385Fyyai6H2bsU=;
  b=CoUitNK1SXg3lKEf7bDkOEf7vfD3KW0Tny/ygOYqKunYmUUS1G86Md0O
   72MnljQWggmdBwj64PBYEvhbKCdeFUd/DWu7tA+mBfCJ8Eb1JaRnoLKmu
   7NKvXaxF0oakL9JDlikPYessrcRymtrzV3NHcmZb8GsT3gGUV0dbVOd5D
   SFaWnV6RcQ7m1C8mVbp8yDtR9dtiQUm83aKjj3tYOo+LuQfJZuePLdiRz
   FquTb5X7HS8cs77ARwGOgswAc1FiZNBdSM1oFa2+HV/juPLMZiQhYjQ0t
   ralHwJCU2DJWTPL3ZZUfIczT/LYSMnvOr4dS6rVGWF+O2gvHQJzHnjl6C
   g==;
X-CSE-ConnectionGUID: U/pw7YwUSUq6QVGU5HSl8A==
X-CSE-MsgGUID: DoNDYOlAT6uQC0oDLyIrfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25152047"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; 
   d="scan'208";a="25152047"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 13:51:52 -0700
X-CSE-ConnectionGUID: Ph8kwTxoTG+f39+ayGEerA==
X-CSE-MsgGUID: OlaX8AcCS+uy6nfS0xIgew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; 
   d="scan'208";a="69703981"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 18 Sep 2024 13:51:51 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sr1eO-000Ccv-2a;
	Wed, 18 Sep 2024 20:51:48 +0000
Date: Thu, 19 Sep 2024 04:50:51 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-error-cleanup-2024-09-17 51/53]
 sound/soc/soc-core.c:64:28: warning: passing argument 1 of 'snd_soc_ret'
 discards 'const' qualifier from pointer target type
Message-ID: <202409190439.fhS0wSao-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-error-cleanup-2024-09-17
head:   6e744db4fc836ed345a41eec70b1318a5658e4d4
commit: 1fd953d9d0281b61757fd8286324e14170ffdb23 [51/53] ASoC: indicate error message on function, not caller (soc-core.c)
config: x86_64-rhel-8.3-kunit (https://download.01.org/0day-ci/archive/20240919/202409190439.fhS0wSao-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240919/202409190439.fhS0wSao-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409190439.fhS0wSao-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/soc-core.c: In function '_soc_core_ret':
>> sound/soc/soc-core.c:64:28: warning: passing argument 1 of 'snd_soc_ret' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
      64 |         return snd_soc_ret(dev, ret, "at %s()\n", func);
         |                            ^~~
   In file included from sound/soc/soc-core.c:38:
   include/sound/soc.h:542:32: note: expected 'struct device *' but argument is of type 'const struct device *'
     542 | int snd_soc_ret(struct device *dev, int ret, const char *fmt, ...);
         |                 ~~~~~~~~~~~~~~~^~~


vim +64 sound/soc/soc-core.c

    60	
    61	#define soc_core_ret(dev, ret) _soc_core_ret(dev, __func__, ret)
    62	static inline int _soc_core_ret(const struct device *dev, const char *func, int ret)
    63	{
  > 64		return snd_soc_ret(dev, ret, "at %s()\n", func);
    65	}
    66	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
