Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C091F151C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Apr 2026 13:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776779102; cv=none; b=W87jxOXRPrtYYZPiOWYS4u4OcBiKeSiGkVovoK2ZhvV8c5Bup6No7un27cLjq3gj6HZ6RKo+qQVZlnRYIW6kDFgkLlak9XzPli6yebVyJlBUDBcDgkjYwgzeAdl8asn1ZxcxJ0kON5Vudss9C8fA2iuuebsrPzS3IQxBfYClNN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776779102; c=relaxed/simple;
	bh=/9ujnlMB3J0Y0o7eSSxalHKBaZn8A2UNRxgUhYtuW4s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LVlnG8SnVk5PVBJb+nP4Wu23qk2Ze2DcUq6/W/ifHBu9+2sYTalnSfMB5YuHUE5hr/vjk+Ow2acAR2T1ruIWLfmPWyxGoSf1ZyPmaACJOGjzJvKZelyh6V1fGvd7l73lnj10/79fjLUCobL5dWq2TWKDtAq1ccLBOEGHTJ+x16g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OzS2rClS; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OzS2rClS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776779101; x=1808315101;
  h=date:from:to:cc:subject:message-id;
  bh=/9ujnlMB3J0Y0o7eSSxalHKBaZn8A2UNRxgUhYtuW4s=;
  b=OzS2rClSupGK5vs97pUla5YzTz2X05mNMSGAZYqeHwWa2bFkajcx5CR6
   Ks2w5t1DzGS9E++h5vptalkRO0V6AeQHYyaGgf5LB4DppmRTGKJKrU0kK
   Mdf7yeB0jhsVdwUCedsS8OerzhEzTfDZlkJp+yinHLUyPJMQyZYXH9DkD
   PgvSiLkRyPidP80EGxnyi5RD8x9rNfBU6+Z5KtqJxnibtRMoWtg1YSfon
   Bf0ZlzwT20QnP2yFyIrsuedEEu7OZJNYYe7TmhTa0L7ExPufMwCaKDUpA
   x8DxcJSiJbDKWbKO5Ofu7BSeG9HxSGpXN1SDKGp6iNFcFlAO+sigDkdoe
   A==;
X-CSE-ConnectionGUID: dxe2tEK8SP2DaWuhpmv5Jg==
X-CSE-MsgGUID: j2xew65hTQG3UgBKDDMdEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77780140"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="77780140"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 06:45:00 -0700
X-CSE-ConnectionGUID: UgRmK0MjTGi1z7143rw+qw==
X-CSE-MsgGUID: aPWROe0sSs2BBtxkmg4DuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="231149618"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 21 Apr 2026 06:44:59 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFBPM-000000003Xc-1BR0;
	Tue, 21 Apr 2026 13:44:56 +0000
Date: Tue, 21 Apr 2026 21:44:55 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-04-20 127/127] Warning:
 sound/soc/soc-card.c:1213 function parameter 'card' not described in
 'snd_soc_register_card'
Message-ID: <202604212108.NE5Zjf1e-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-04-20
head:   c0eca3aad838fa892c00ca5d3141b136aac51b91
commit: eea8563b37ba784a0d7bf8f8439fbb2c5d2a78c5 [127/127] ASoC: soc-card: move snd_soc_[un]register_card() to soc-card.c
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260421/202604212108.NE5Zjf1e-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260421/202604212108.NE5Zjf1e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604212108.NE5Zjf1e-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: sound/soc/soc-card.c:1213 function parameter 'card' not described in 'snd_soc_register_card'
   Warning: sound/soc/soc-card.c:1251 function parameter 'card' not described in 'snd_soc_unregister_card'
>> Warning: sound/soc/soc-card.c:1213 function parameter 'card' not described in 'snd_soc_register_card'
   Warning: sound/soc/soc-card.c:1251 function parameter 'card' not described in 'snd_soc_unregister_card'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
