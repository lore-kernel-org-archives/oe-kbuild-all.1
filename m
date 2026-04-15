Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7B221CC4F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Apr 2026 00:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776212183; cv=none; b=uPqRf/6etnOjHssw6OJx576/572ec7yJkYkvRgUhdXfaPVI911lLRQ9A1PCOm5WBpId5c4cNrIWrcqpKB3jqUpVz4mf44YrjB8jP5S2xFX9OCNk5a1Wc7EKd6b9ZtrWWc7ZJW1waMgRuqphwl69gufbJXAMpq4jq+w+feh5/Alo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776212183; c=relaxed/simple;
	bh=T9I4CAvzcAy7p/ikbqdYjFML5XGX/G2KsRRMOnoPVtU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LD0zgIQ0SRV0dv2POfonNBKsyAL5Eq3nFrsU51uAYfFQ3C9SXpRHWeTbdfdrB7iXJsGjq53dDinnAGXQzizPxU5ETjmFkh4BA+UNKwJVrVg0WEfM50jLkN1XsBlsj3J4uRAIo+Y9hlRuy5+v9cw6eCc1lEyw9uIrH+vtSY/cZ8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E5cEv8p6; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E5cEv8p6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776212182; x=1807748182;
  h=date:from:to:cc:subject:message-id;
  bh=T9I4CAvzcAy7p/ikbqdYjFML5XGX/G2KsRRMOnoPVtU=;
  b=E5cEv8p6jXhnvnQ/J5PlzP+oOBT6jQ6x1eK/6atIS3DFwJThshaP9wQf
   I4Bx3KzviyEV7Hn2kAsausTDI5mju4vQmOIEBBif6Gv11I7b0/S+EgSR5
   nwGcyTJiGcU6cO1AjFsaTiRmSV84QvePHZwxMQoz5CH1jdtzx21REUlb4
   rZryrrnvHeM2YCx+Bv5gxHBwgSFrNFftR3wUS9dMCkiN4LrufSXmuzPOt
   j1NjbrJd+0chY4wmWoVEeRjNIaSa8RD/wIydYPIxJYE+W4dKvm1lI54a2
   CsT7DolAm9Uq315BCJOTkVjc7FhFhTL6V7H0WZDVu49SfAOcPbW5fXmLs
   w==;
X-CSE-ConnectionGUID: 2FMH8/J6STOK2GTxoLEFjg==
X-CSE-MsgGUID: kzIvxImTQWK2gN8ArzaIIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="64724197"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="64724197"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 17:16:21 -0700
X-CSE-ConnectionGUID: VUfOlycvTrK1PYVVfhsJXg==
X-CSE-MsgGUID: LkFXAjH6SkC1MWahAxlzyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="230478263"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Apr 2026 17:16:20 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCnvV-00000000209-1nIM;
	Wed, 15 Apr 2026 00:16:17 +0000
Date: Wed, 15 Apr 2026 08:16:07 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Nam Cao <namcao@linutronix.de>,
 Juri Lelli <juri.lelli@redhat.com>
Subject: [linux-next:master 9401/13789]
 kernel/trace/rv/monitors/deadline/deadline.h:115:46: sparse: sparse:
 incorrect type in argument 1 (different address spaces)
Message-ID: <202604150820.Ny143u6X-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e6efabc0afca02efa263aba533f35d90117ab283
commit: b133207deb72609ad4da40c4d50128a5e150677b [9401/13789] rv: Add nomiss deadline monitor
config: um-randconfig-r134-20260415 (https://download.01.org/0day-ci/archive/20260415/202604150820.Ny143u6X-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260415/202604150820.Ny143u6X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604150820.Ny143u6X-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/trace/rv/monitors/nomiss/nomiss.c: note: in included file:
>> kernel/trace/rv/monitors/deadline/deadline.h:115:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *dst @@     got struct sched_attr [noderef] __user * @@
   kernel/trace/rv/monitors/deadline/deadline.h:115:46: sparse:     expected void *dst
   kernel/trace/rv/monitors/deadline/deadline.h:115:46: sparse:     got struct sched_attr [noderef] __user *
>> kernel/trace/rv/monitors/deadline/deadline.h:118:21: sparse: sparse: dereference of noderef expression
   kernel/trace/rv/monitors/deadline/deadline.h:120:30: sparse: sparse: dereference of noderef expression

vim +115 kernel/trace/rv/monitors/deadline/deadline.h

    94	
    95	static inline int extract_params(struct pt_regs *regs, long id, pid_t *pid_out)
    96	{
    97		size_t size = offsetofend(struct sched_attr, sched_flags);
    98		struct sched_attr __user *uattr, attr;
    99		int new_policy = -1, ret;
   100		unsigned long args[6];
   101	
   102		switch (id) {
   103		case __NR_sched_setscheduler:
   104			syscall_get_arguments(current, regs, args);
   105			*pid_out = args[0];
   106			new_policy = args[1];
   107			break;
   108		case __NR_sched_setattr:
   109			syscall_get_arguments(current, regs, args);
   110			*pid_out = args[0];
   111			uattr = (struct sched_attr __user *)args[1];
   112			/*
   113			 * Just copy up to sched_flags, we are not interested after that
   114			 */
 > 115			ret = copy_struct_from_user(&attr, size, uattr, size);
   116			if (ret)
   117				return ret;
 > 118			if (attr.sched_flags & SCHED_FLAG_KEEP_POLICY)
   119				return -EINVAL;
   120			new_policy = attr.sched_policy;
   121			break;
   122		default:
   123			return -EINVAL;
   124		}
   125	
   126		return new_policy & ~SCHED_RESET_ON_FORK;
   127	}
   128	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
