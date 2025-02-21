Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D621D7E50
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Feb 2025 18:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740163628; cv=none; b=JXKz51YDe78LYAXM2SqgAa2DZUMM0m5/Jkyb2c8M+xPp0EmFD6tD4PFZHoXcG8lxFEf7QB6nlQuEnjVR6VW9GhpR7tPJeSBULNqrwMChR4m6cqb3VJlZSvSttacHAwXYM5HddN8je1FDyLQ02E1iNBDzOEun5jKIuf5J1y5Lw7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740163628; c=relaxed/simple;
	bh=hpnxjWGbK2D6Ia9a7XActmJvFpTyQO/BbtMRgPBLFdU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y1AY/B261dTAsiu7ipO/aXktU1OwT5jMKIm7a9BkXiC4zLnNVf6Jr0gTFHTNS0DKninZaH+R/QdMimwRNUuDqNlDvFVbf16B6cO7nB4sm+yrSh8TA08SDR/YWVUKUNBLF2UGrH/MTcylkdJoOdowPSOcpk55GlK4dGlev4NGWCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bJOF6c8L; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bJOF6c8L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740163626; x=1771699626;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hpnxjWGbK2D6Ia9a7XActmJvFpTyQO/BbtMRgPBLFdU=;
  b=bJOF6c8LogS3WProchPKYgHzpE7GD4IS+MxGjJaEVN0yw0L1U9chJTvu
   3YPgyQ3Wq+nHiYkRIG+eemU/d9EzNP+dLIsBERP8djCcn4XlqsiCHM1PZ
   rW9L9v/zKhex7AjmhT5Mw1PZnc0WTlZx0Wr91dsEV5C4InUzDiEhqlg07
   2wGbwgm+SU1upvXuZETYopLMS6lF62WfiNuy4+kJqlxOS/wOQ4bGLDiD7
   CUIg0UVSoGouJOAAI3KUKyYKDhyBFjb8zDEHO+jZVHDOPdac9/3+9jEpH
   QSpu/4UsdqmEed1/YMdSixTuBi7C6QxvNwN90FZfJGUDRf91fVckjgfXd
   A==;
X-CSE-ConnectionGUID: D5fY2qFxRiOu5sfUWDkL9A==
X-CSE-MsgGUID: MvoWliTPRm6atEWqLWGalQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="28591499"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="28591499"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 10:47:06 -0800
X-CSE-ConnectionGUID: TtOp6EOlRGqkkDqA2jdzzg==
X-CSE-MsgGUID: 69IHfxjeRxC1MjGmxJ829g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="115644538"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 21 Feb 2025 10:47:04 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlY3C-0005t1-0I;
	Fri, 21 Feb 2025 18:47:02 +0000
Date: Sat, 22 Feb 2025 02:46:35 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 4334/5524] kismet: WARNING: unmet direct
 dependencies detected for SND_SOC_SOF_AMD_COMMON when selected by
 SND_SOC_SOF_AMD_ACP70
Message-ID: <202502220221.8zujYTrK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d4b0fd87ff0d4338b259dc79b2b3c6f7e70e8afa
commit: f120cf33d2325fd95d063eccbff2e86ffc7f493a [4334/5524] ASoC: SOF: amd: Use AMD_NODE
config: um-kismet-CONFIG_SND_SOC_SOF_AMD_COMMON-CONFIG_SND_SOC_SOF_AMD_ACP70-0-0 (https://download.01.org/0day-ci/archive/20250222/202502220221.8zujYTrK-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250222/202502220221.8zujYTrK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502220221.8zujYTrK-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SND_SOC_SOF_AMD_COMMON when selected by SND_SOC_SOF_AMD_ACP70
   WARNING: unmet direct dependencies detected for SND_SOC_SOF_AMD_COMMON
     Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && SND_SOC_SOF_TOPLEVEL [=y] && SND_SOC_SOF_AMD_TOPLEVEL [=y] && AMD_NODE
     Selected by [y]:
     - SND_SOC_SOF_AMD_ACP63 [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && SND_SOC_SOF_TOPLEVEL [=y] && SND_SOC_SOF_AMD_TOPLEVEL [=y] && SND_SOC_SOF_PCI [=y]
     - SND_SOC_SOF_AMD_ACP70 [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && SND_SOC_SOF_TOPLEVEL [=y] && SND_SOC_SOF_AMD_TOPLEVEL [=y] && SND_SOC_SOF_PCI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
