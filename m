Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C02D2D63F8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 15:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765641397; cv=none; b=vBUbyEdY9erXBe0Ah0ogzq2gmmaejW7nWmIWrB5yTpBaEuMl8hQBwX/IIs7YVB0R4b7shFWgMU9Q9ZTcLmQlN7BeDUkoRl03NDt1qMMf7H5EhuHgjDgXYhtBWyK3MxJAc0eFGUC5DXQ+QwGFyR3t1ckmd7GMtREHMf5U29w/fYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765641397; c=relaxed/simple;
	bh=VoqgFwCc37O2/cPffN3rTqbah8mOD+dk8NqTt2VCKcY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mbGW2TIeKRA3ym4rmF5k73uX0aR/IUSCoVRMH2ck2JYzgmuIYhNuPPswFISrHwUfyFuwqMetMA0CxePu8u56QiTSEyISxSG3I9U+rzrPmGU8bL6xF01nmhTiAby0NY6MrMS6LnP4+46aWWI+E9sv2tzn0MqatiY1HG3tluPLFc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NpISt3VX; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NpISt3VX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765641395; x=1797177395;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VoqgFwCc37O2/cPffN3rTqbah8mOD+dk8NqTt2VCKcY=;
  b=NpISt3VXkk+nFhIH1xYe0E+tq7sBuwD4HAW6E0AqLc192J5Zsmrp2PiB
   aV70EDUROr/q+peJYAfK7ZX3TlolPhn0ug1rjjOT/f2jjpzGwANMiUioe
   CI5LFKlblEL6b2n1/Kq1d8bndNTzvaugtNxTaTSAZNkuDd/4X15Y0FPgJ
   tmCR4NsQOu/KXdHYzZRvclOOgkfuq1skGtWfMpgpHng0hBs775hBJ2mJ4
   OElOwbwYyH3ossmlGsCsdlckQ2YjgMAoyOFOAK4p+G6pds3AqqG8zC1Io
   02q40cvKBhC9h4LRdF2m0hqonoumze3wzXO8E7oAv4SOUJeX/od0/wJ9u
   A==;
X-CSE-ConnectionGUID: zGrBqRM+RIS0BY5E++VqUg==
X-CSE-MsgGUID: wdDb43cJRr2mPwZ81wMY0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="85207985"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="85207985"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 07:56:33 -0800
X-CSE-ConnectionGUID: i6PHSff8SfCBMyuEQcfUEw==
X-CSE-MsgGUID: D6h80VJ+SPO30ZIvCeh9HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="228390921"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 13 Dec 2025 07:56:33 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vURyw-0000000027Q-2ptT;
	Sat, 13 Dec 2025 15:56:30 +0000
Date: Sat, 13 Dec 2025 16:55:52 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 40/40] kernel/sched/pelt.c:477:5:
 warning: no previous prototype for 'sched_pelt_multiplier'
Message-ID: <202512131625.G5ETe1y9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   ebacb5ab3a1e5bf8dc788a29244f0e68d00a5bd6
commit: 0baa11384bf87212556a5cdce26a471ccadd11c7 [40/40] FROMLIST: sched/pelt: Introduce PELT multiplier
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251213/202512131625.G5ETe1y9-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131625.G5ETe1y9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131625.G5ETe1y9-lkp@intel.com/

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
