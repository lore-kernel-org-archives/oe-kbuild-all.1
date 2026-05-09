Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F811364931
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 May 2026 22:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778366557; cv=none; b=ElzrKQ6DQy8tGQLy4caEavSTx2WxbF/oBEOA43pa1UMDgZ7/MDAKd7SstxuaoCBA0jtV0zf6awE8NnXqeWK/W3UyJ5neufYSEIOR7LkkVcC5LiY3JtLoYnDS7GkojpthpW3EFjiiR5QaE0RjQARRU6GnYwmcajpeTgjqvLoM0mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778366557; c=relaxed/simple;
	bh=k45s27QwKqOH9aRtchBoIv+YFEzqpqu9Cn4SUhPysC8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NVSgvN2feY/Y/yvnoClO+s0ktMBxqUeragCrI7xVKUUk82vPSms3/vb8Ys2BAwNpJqzSGrGZ1FMuLeqXGXo60qzLe3cfVmr48096/M5Rg0a2VYjMcX+yLLcP/b3sTePkfz1MDmS9jdgQYwNm0D6riQk0i2R+dwzAEBLF0zn4eYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jg6+nvJt; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jg6+nvJt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778366555; x=1809902555;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k45s27QwKqOH9aRtchBoIv+YFEzqpqu9Cn4SUhPysC8=;
  b=jg6+nvJtUMgaFHA73IQ0XI9IzA1Zw2zNTEcPdiwBuZEjDhWSWyh3/xvO
   vHKoj4bnZW2PoV9CoAxdvZAbzuy1mokhdMPMAFqsbUwDa+K/NpRovgfyG
   xcxzikwZa1sU/MNOLuLx+O2qMNaUf1HV175q1NtmolfPBSFCE+LKSVcar
   oUG7TS4vGxt9vDje+1IbSQoM2/wx/Qu1CmeZdH4GEd6UKVn7RlkpBceJS
   vHyuR75yCoPLKPHfGv+LsM+Rr8hgT8aMyh8xUpKzAqyC64MjiBtrh94Jg
   BjjqYySgV1+9HZz0RPtgiE4rzzA2WbgYkA6/ntL4kcSAPsTYBAZT4ks+w
   g==;
X-CSE-ConnectionGUID: 5eVQzOzmQOmf7hIzFiyPDA==
X-CSE-MsgGUID: xCvvv07rRnK1dDo8QCAI8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="79407611"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="79407611"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 15:42:34 -0700
X-CSE-ConnectionGUID: TrVAVcdyTCuEcnV9HimY5Q==
X-CSE-MsgGUID: LNEyIgSNSVSJBZOqEgrPrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="242049605"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 May 2026 15:42:33 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLqNT-000000001UN-045E;
	Sat, 09 May 2026 22:42:31 +0000
Date: Sun, 10 May 2026 06:42:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Martin =?utf-8?Q?Povi=C5=A1er"?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/070-audio 4/82] sound/soc/soc-ops.c:621:1:
 warning: the frame size of 1296 bytes is larger than 1280 bytes
Message-ID: <202605100621.WoY9lXyO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   c3a3c710ac278eaea0704b5ad1e1793212652919
commit: e6ee1a585ceadf0d5d908738f8989115e65d6a1c [4/82] ASoC: ops: Introduce 'soc_set_enum_kctl'
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260510/202605100621.WoY9lXyO-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605100621.WoY9lXyO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605100621.WoY9lXyO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/soc-ops.c: In function 'soc_set_enum_kctl':
>> sound/soc/soc-ops.c:621:1: warning: the frame size of 1296 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     621 | }
         | ^


vim +621 sound/soc/soc-ops.c

   590	
   591	static int soc_set_enum_kctl(struct snd_kcontrol *kctl, const char *strval)
   592	{
   593		struct snd_ctl_elem_value value;
   594		struct snd_ctl_elem_info info;
   595		int sel, i, ret;
   596	
   597		ret = kctl->info(kctl, &info);
   598		if (ret < 0)
   599			return ret;
   600	
   601		if (info.type != SNDRV_CTL_ELEM_TYPE_ENUMERATED)
   602			return -EINVAL;
   603	
   604		for (sel = 0; sel < info.value.enumerated.items; sel++) {
   605			info.value.enumerated.item = sel;
   606			ret = kctl->info(kctl, &info);
   607			if (ret < 0)
   608				return ret;
   609	
   610			if (!strcmp(strval, info.value.enumerated.name))
   611				break;
   612		}
   613	
   614		if (sel == info.value.enumerated.items)
   615			return -EINVAL;
   616	
   617		for (i = 0; i < info.count; i++)
   618			value.value.enumerated.item[i] = sel;
   619	
   620		return kctl->put(kctl, &value);
 > 621	}
   622	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
