Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CC141C2F6
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jul 2026 12:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783513894; cv=none; b=BNiKvOghnenzqvKfG1ne05Wa2osklko6HB8nrL4/2M3fVvRKEWNc1nX2l1tjhYqNnECstCNqHuw636+Mg60GctxAWF/lMKhq6bw95lnQE9v8pAEfHzqu/Fl/pe4FJnJr0tSPqoYaGZDbeXCaDa8rIzCfmBwF4LSgp8TArJpoyJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783513894; c=relaxed/simple;
	bh=deuCwL5Ow+owTPShyzqoX7oEbBMeqVuKz5idArWfVpE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RdLYZtjbtNaj/4DbmJWmp0IHKwhKl9l3bPysqo+qv9YZ+5WJK3zQyYKbg+clYHkh3emZAZ02oftLBQgdJjri+mXz6iTmt6ZjeC3oNMPeHjP2twpzdyRmu6L4cebHW7I3GNJy4ulqgEl1RB865WBoTNVC1C4gN5JdIM3aEXooseA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G0JPqbSG; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G0JPqbSG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783513893; x=1815049893;
  h=date:from:to:cc:subject:message-id;
  bh=deuCwL5Ow+owTPShyzqoX7oEbBMeqVuKz5idArWfVpE=;
  b=G0JPqbSGss1fUQuuZFJx9Kgpdc3miCByoMq+ZidamLFt5/zivSuYF9qV
   5xOd4i2uZftDtFv08rwPYtcCZ+xHJKuCHQS6oPk3P9J9WKbL7JT9MI2W5
   8Lme0Fl+5KAJloJCF+aTeyexoI2M2/h6HXk1Cow3Zl+lpsL0aq2EvKIyp
   S2gG2XTxMR2DIxgVrGiDl4RTlpPKAzvDbWQU2OGkKfuWaycTh3j1C5xGl
   W12lraSNBwUXcFDW86za1iNdttcAvtU8wkTKm0/DG8SKYa61sluJ0ZH1m
   4qwHFDOC47texkCqbKSoR2ebOoifLMdtzueteXDI3Rn2uQIF8fUeo8Pot
   w==;
X-CSE-ConnectionGUID: bKO/6fVZQFyLMSepZsjNfw==
X-CSE-MsgGUID: 6Wv7Hv4rT+yke83HawSC8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="109717934"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="109717934"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 05:31:30 -0700
X-CSE-ConnectionGUID: 3SeK4rUuQfO/KLLg5yqiew==
X-CSE-MsgGUID: 6nPKmtMRS2uRLIboSCM+qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="253785107"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 08 Jul 2026 05:31:28 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whRQw-00000000GMV-1jqG;
	Wed, 08 Jul 2026 12:31:23 +0000
Date: Wed, 08 Jul 2026 20:30:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 166/166]
 kernel/sched/pelt.c:477:5: warning: no previous prototype for
 'sched_pelt_multiplier'
Message-ID: <202607082043.tRnOIwKJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Jing-Ting,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   7b80053b707666e258e504127dd1bf5ac555f5e1
commit: 0baa11384bf87212556a5cdce26a471ccadd11c7 [166/166] FROMLIST: sched/pelt: Introduce PELT multiplier
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260708/202607082043.tRnOIwKJ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260708/202607082043.tRnOIwKJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607082043.tRnOIwKJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:49:
>> kernel/sched/pelt.c:477:5: warning: no previous prototype for 'sched_pelt_multiplier' [-Wmissing-prototypes]
     477 | int sched_pelt_multiplier(struct ctl_table *table, int write, void *buffer,
         |     ^~~~~~~~~~~~~~~~~~~~~


vim +/sched_pelt_multiplier +477 kernel/sched/pelt.c

   476	
 > 477	int sched_pelt_multiplier(struct ctl_table *table, int write, void *buffer,
   478				  size_t *lenp, loff_t *ppos)
   479	{
   480		static DEFINE_MUTEX(mutex);
   481		unsigned int old;
   482		int ret;
   483	
   484		mutex_lock(&mutex);
   485		old = sysctl_sched_pelt_multiplier;
   486		ret = proc_dointvec(table, write, buffer, lenp, ppos);
   487		if (ret)
   488			goto undo;
   489		if (!write)
   490			goto done;
   491	
   492		switch (sysctl_sched_pelt_multiplier)  {
   493		case 1:
   494			fallthrough;
   495		case 2:
   496			fallthrough;
   497		case 4:
   498			WRITE_ONCE(sched_pelt_lshift,
   499				   sysctl_sched_pelt_multiplier >> 1);
   500			goto done;
   501		default:
   502			ret = -EINVAL;
   503		}
   504	
   505	undo:
   506		sysctl_sched_pelt_multiplier = old;
   507	done:
   508		mutex_unlock(&mutex);
   509	
   510		return ret;
   511	}
   512	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
