Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF0C145B27
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 07:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731914724; cv=none; b=JuZQnALN9lfUNwNZejcGHFja0PT2TYtCH9/nSdYbMtSMaQ+2SuvOJX/BPBV+m/VGPgwasO3I8ZWIhVjxYFkGUda1CsNKd2f3qhqnuqIZMrGQieLODhrbusGrn3NhePqVPFTESd5jXra0LgG9fY2Odmv+GRcdxXpGSqYXO1vIU3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731914724; c=relaxed/simple;
	bh=BCFto1DvbNNsjKpRwZBm962X6ETc4d9ENZwYMXxw0Jo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u0rs4DInF0UWHqmlnGGmYzy6p/PJItXv2JB/kGiBm6YOUnwXHkYzbbNEpl4m2Pegp05IGX+tuF4RmVUQy/VmhTlOumoXC5HGZ2lAUC+20mlU5aUyYvT5EdOrQgbK/KZ0Vekh9MPcF1JGDBfRHG3G2hYjLis/WNQvqui7zV3vdDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YgQdjg1h; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YgQdjg1h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731914722; x=1763450722;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BCFto1DvbNNsjKpRwZBm962X6ETc4d9ENZwYMXxw0Jo=;
  b=YgQdjg1hAz3qJ1EyWuKFPDDwrTo0Ehbo674wdTqFst+iXupITfMqWHTw
   2yEmZHDie5WyipURyjDEP37yGetVwn0wEpYcK38Ae4+A3nfitr2PvYPz6
   rQxXj36ctSvT3/r1Qpzm/UvNzezY5bbvC59EWYn8XsNB2j8NMY37tw8Iv
   X4scKMtpXE5nz9MoIk892O6r5RDgmd40yE2wvHpJlL55digu5iv+tPJEf
   uskX7Sc1IbKivqFMarkWYwk8xYcfypW90b5VBpQUc2RD7Nm+XhFEGx3ie
   8EAVPdD7LWtaQpH20YLP8fSOVyej2BsvgiuuorUNSGRDvlZfE3I48ww7N
   Q==;
X-CSE-ConnectionGUID: KMIih8fVQ4O5JHPEvl/P7A==
X-CSE-MsgGUID: E7Xtj127TOuZrp0I1hHTJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31707369"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="31707369"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 23:25:22 -0800
X-CSE-ConnectionGUID: V04v+crjRiWYDgI//R4VLw==
X-CSE-MsgGUID: EG5PLKP6TP6jQNcFDs3QUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="89926456"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 17 Nov 2024 23:25:21 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCw8M-0002Jl-29;
	Mon, 18 Nov 2024 07:25:18 +0000
Date: Mon, 18 Nov 2024 15:24:33 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?unknown-8bit?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/070-audio 16/119] sound/soc/apple/macaudio.c:778:1:
 sparse: sparse: symbol 'macaudio_spk_mux_enum' was not declared. Should it
 be static?
Message-ID: <202411181554.7psJh4WU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   a89c7c8788b938f7b52c6ca56449de45e92a056e
commit: 19a2b533a8813a6a3f8368f4198977afc2049339 [16/119] ASoC: apple: Add macaudio machine driver
config: sparc64-randconfig-r122-20241118 (https://download.01.org/0day-ci/archive/20241118/202411181554.7psJh4WU-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241118/202411181554.7psJh4WU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411181554.7psJh4WU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/apple/macaudio.c:778:1: sparse: sparse: symbol 'macaudio_spk_mux_enum' was not declared. Should it be static?
>> sound/soc/apple/macaudio.c:788:1: sparse: sparse: symbol 'macaudio_hp_mux_enum' was not declared. Should it be static?
   sound/soc/apple/macaudio.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false

vim +/macaudio_spk_mux_enum +778 sound/soc/apple/macaudio.c

   777	
 > 778	SOC_ENUM_SINGLE_VIRT_DECL(macaudio_spk_mux_enum, macaudio_spk_mux_texts);
   779	
   780	static const struct snd_kcontrol_new macaudio_spk_mux =
   781		SOC_DAPM_ENUM("Speaker Playback Mux", macaudio_spk_mux_enum);
   782	
   783	static const char * const macaudio_hp_mux_texts[] = {
   784		"Primary",
   785		"Secondary"
   786	};
   787	
 > 788	SOC_ENUM_SINGLE_VIRT_DECL(macaudio_hp_mux_enum, macaudio_hp_mux_texts);
   789	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
