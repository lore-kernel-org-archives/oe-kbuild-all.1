Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C16139891F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Aug 2026 14:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788187994; cv=none; b=GvZWvVOBlRLyxN/B74wqNnersNPf+4Lxtlc08W/P9wiAmv8mIR9ZZkTRbdQzFZGjpxxjIYdxyLubQ89J4UxG+3mIhTSjNAUmYfpgNshexckZbhdD2Xt9XNObnIWyfdIdPsiWpQMye5VgrR8cN/cIoRIztUtsCc61yUy8Eer3hIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788187994; c=relaxed/simple;
	bh=gnqCyPvXkuu7Ii05gSKqTu2yvod+BBnWZtLS4SwT69s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gFMNvCUEG9Cj9tj3T0QA/eooI++IPNV/H0T+7Hyfo4UltXXnA7o2OUYBf55+9q3XRJd0HlA1soWv9OABLyUNtnndwxc9II0nosin6J0nxqgDeZFqeb+SKNRceGqVQjR1WOm5dOqZ+J+99GLO3E0JGX7SNTC3dt63a5gOfbXFzFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nbToKfkC; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nbToKfkC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788187993; x=1819723993;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gnqCyPvXkuu7Ii05gSKqTu2yvod+BBnWZtLS4SwT69s=;
  b=nbToKfkCNwPKBmRgSTjr2hUo1VgsiFF3GC2cxynIcqG3ImeEzBpWt1Jo
   Ah1P+F6HATLQ7BDaB4D8RjNRrJavMXAcWAAMJw7bbf2zlZO37pD7Dr/x/
   yj3b3MCM+NFs1+hjQiaPlPVfO0PfScps4ChIZEqH3G1syre65kSM5J2SY
   1vzpd4tDpPtQTZ3rjMQI20doBa8vOQThIdpNvXneRcyX8TacdckmYUzEv
   yUKyrLeaVX0l1Akd8TZYGNN6mygkJjXYQ60Zvm7SeonH5GOx8jQQYlFYe
   hEIN9F9noWPYuyMmsQE5nz7MsFhG+4FgbOHm6NUQ2YqoajSZC8Ie0hCWE
   w==;
X-CSE-ConnectionGUID: TxnXz0cRQKmTNxQIN7dNbQ==
X-CSE-MsgGUID: BnhfMu09TXi+gzUkfBf4JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="92464367"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="92464367"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 07:53:12 -0700
X-CSE-ConnectionGUID: uWl8pZnoTNCwymyN64iilg==
X-CSE-MsgGUID: I5a8gAvqSdaHCcOQ35R+lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="262692771"
Received: from lkp-server01.sh.intel.com (HELO 78edef60ff5d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 31 Aug 2026 07:53:10 -0700
Received: from kbuild by 78edef60ff5d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x13Nj-000000000lX-44xV;
	Mon, 31 Aug 2026 14:53:07 +0000
Date: Mon, 31 Aug 2026 22:52:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Martin =?utf-8?Q?Povi=C5=A1er"?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/070-audio 4/86] sound/soc/soc-ops.c:583:1:
 warning: the frame size of 1296 bytes is larger than 1280 bytes
Message-ID: <202608312223.Ekqfp1xz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   5b800acda8d7c7353e880b74d8bc8553956421c0
commit: 90924920e353b65e5ccc9a1b3c438c50107ddeb1 [4/86] ASoC: ops: Introduce 'soc_set_enum_kctl'
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260831/202608312223.Ekqfp1xz-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260831/202608312223.Ekqfp1xz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608312223.Ekqfp1xz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/soc-ops.c: In function 'soc_set_enum_kctl':
>> sound/soc/soc-ops.c:583:1: warning: the frame size of 1296 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     583 | }
         | ^


vim +583 sound/soc/soc-ops.c

   552	
   553	static int soc_set_enum_kctl(struct snd_kcontrol *kctl, const char *strval)
   554	{
   555		struct snd_ctl_elem_value value;
   556		struct snd_ctl_elem_info info;
   557		int sel, i, ret;
   558	
   559		ret = kctl->info(kctl, &info);
   560		if (ret < 0)
   561			return ret;
   562	
   563		if (info.type != SNDRV_CTL_ELEM_TYPE_ENUMERATED)
   564			return -EINVAL;
   565	
   566		for (sel = 0; sel < info.value.enumerated.items; sel++) {
   567			info.value.enumerated.item = sel;
   568			ret = kctl->info(kctl, &info);
   569			if (ret < 0)
   570				return ret;
   571	
   572			if (!strcmp(strval, info.value.enumerated.name))
   573				break;
   574		}
   575	
   576		if (sel == info.value.enumerated.items)
   577			return -EINVAL;
   578	
   579		for (i = 0; i < info.count; i++)
   580			value.value.enumerated.item[i] = sel;
   581	
   582		return kctl->put(kctl, &value);
 > 583	}
   584	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
