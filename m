Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC5B3F54C5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jun 2026 09:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782724292; cv=none; b=GMFLCvWHZjNRKRcSaLtSceh+PiCj1F0Vmx16EBhCkYgmkHbWiysSHF9bPcMB/v89Ke14xwO+D7Tmc2ApLvxGBIwyApuT6N9yNW+GvTXIGteOzm4oY2ZOPJZLwMOXJ7R7h8/Nv4XmfnyUTjFinpNFxEk0GpuJJFRYgRi6zmOkJjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782724292; c=relaxed/simple;
	bh=DDazMc3hj2WtkYSxoe/ZEStsgU7zx96z6X9BWz7peSU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rfOka2FRwZz9vIDuolx5OMzWxX2F3rkPii1bEb23dr8xJpC2DUQxjLJOkbC7vN7lyK2t8GjmLbdCMvvNOiZ391EeLvlZZZnFVvailfvMdiOfOdFUlF6i0DAoW5AMCN8fkmJ6m6eWI+9JvN/byGQ+AYuaeiez2GjiZ66kVs3Wg6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JqNeH22b; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JqNeH22b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782724290; x=1814260290;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DDazMc3hj2WtkYSxoe/ZEStsgU7zx96z6X9BWz7peSU=;
  b=JqNeH22bP2hkKWY4+lSK7i39fAKZpp5WY7dMRDzc62XGyUgZ/ybuLQ26
   EmjTcXcVrAhs3UJjrU9o+6zCkosBjcYFDO1KBAfaHGdT5mJXCwilvJqf1
   Z4DLLuM9hltFjhjJ5Cm8aLFnToQeDrZf1LTsEOWt1YrLnk0weO7kBN9jD
   MuJUlGKNbFxFT3LFWkE2vkn3m744DDSWmfUUyjNi4rFTHnd7Fq1EjT/B4
   nH4eywAYY1Z8a1aXi/b/trOU7BuCYFolr82BnNhy4cGYkmal2C9jp51u+
   A/cXTWjnB9M141IK3l1XHL0GRhYMmb6EI8aYXMosBjlNFvyUf/JbmqQpS
   w==;
X-CSE-ConnectionGUID: kPkJMpccTuafZAqItZLqdQ==
X-CSE-MsgGUID: /Nkbj3tGSI+EfSjBHdQ49w==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="93988820"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="93988820"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 02:11:30 -0700
X-CSE-ConnectionGUID: q7sb8rtcQdOzmWTlOtdK5w==
X-CSE-MsgGUID: GQgAkMt/QmKKyMQF30Qv1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="247923903"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 29 Jun 2026 02:11:28 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1we81C-000000007CX-3NGW;
	Mon, 29 Jun 2026 09:11:15 +0000
Date: Mon, 29 Jun 2026 17:10:44 +0800
From: kernel test robot <lkp@intel.com>
To: "Martin =?utf-8?Q?Povi=C5=A1er"?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/070-audio 4/80] sound/soc/soc-ops.c:579:1:
 warning: the frame size of 1296 bytes is larger than 1280 bytes
Message-ID: <202606291704.vQSMPhfZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   bc632c6dde685e651ff0b034a07dd6bc8b0f10a6
commit: c46f9e66100bfa95b2593f1df1b9e311ee170ec2 [4/80] ASoC: ops: Introduce 'soc_set_enum_kctl'
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260629/202606291704.vQSMPhfZ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260629/202606291704.vQSMPhfZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606291704.vQSMPhfZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/soc-ops.c: In function 'soc_set_enum_kctl':
>> sound/soc/soc-ops.c:579:1: warning: the frame size of 1296 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     579 | }
         | ^


vim +579 sound/soc/soc-ops.c

   548	
   549	static int soc_set_enum_kctl(struct snd_kcontrol *kctl, const char *strval)
   550	{
   551		struct snd_ctl_elem_value value;
   552		struct snd_ctl_elem_info info;
   553		int sel, i, ret;
   554	
   555		ret = kctl->info(kctl, &info);
   556		if (ret < 0)
   557			return ret;
   558	
   559		if (info.type != SNDRV_CTL_ELEM_TYPE_ENUMERATED)
   560			return -EINVAL;
   561	
   562		for (sel = 0; sel < info.value.enumerated.items; sel++) {
   563			info.value.enumerated.item = sel;
   564			ret = kctl->info(kctl, &info);
   565			if (ret < 0)
   566				return ret;
   567	
   568			if (!strcmp(strval, info.value.enumerated.name))
   569				break;
   570		}
   571	
   572		if (sel == info.value.enumerated.items)
   573			return -EINVAL;
   574	
   575		for (i = 0; i < info.count; i++)
   576			value.value.enumerated.item[i] = sel;
   577	
   578		return kctl->put(kctl, &value);
 > 579	}
   580	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
