Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF20061FCE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 17:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775841640; cv=none; b=FBhQyFcC5IuuC8KeiQJi9bK5W1oSdrcT/P6Ljze7OwB1RwKBTLHj68+AOIH1bTpSyS+giWaNX1ppcf9Yv56nSZoGhpbkKs6UH29k/AUdJAS1i5vHNCBVETp9v7r0PgtFlSvSF9S4z1gD1V7HFqScOijo4j/ik5HmSsseu2NEF7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775841640; c=relaxed/simple;
	bh=Z68azkjdpBUJGgGDqNPYOnFOEjcFpelpP19vR/EuiHA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=d9sbm4X76Ny4L4Q2F6fztX3iYP8MmeITAhVJYeYA/c6R3SPZNX0uaSCqJd/Dt89lNr1Z58sKLp6WUmfEr5P7HWnrADLeC4F0NMEWSqgXVY2GLh4W6k5mTPkrzNJbzCdXRlHNIBOEWeYzTSEIf9gOp9vXQyVDEGKHujPpOkYGfvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AJ0C0fMi; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AJ0C0fMi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775841638; x=1807377638;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=Z68azkjdpBUJGgGDqNPYOnFOEjcFpelpP19vR/EuiHA=;
  b=AJ0C0fMijtPFZRL3wJjviIyuNlwOICelek52q2xJMijdRY9aHKM0Jm8v
   xlYlZZou+xMX12vDZTt2TSGRY6UiaTLGUbUBTKjLpoMHoUQgAbNuQtRgd
   ug4Vqn+AndEZb94OpDnFz+3+DqzVJfJqY7Akf3PE0lTQeip0ZgIPUXccY
   5qwBk1UkDK8ci+vEbTHRxxjRKlD1AJZ4T9KN9aWpcBw/gDiRWCurhAicz
   zzrIAd9LyXmWS5VFdrHXZ5weDSJ7nBlWaksIfCendi8rp9ory1MFKAnmu
   QkwXx9NIXhp8jFCTu66Fh8vI+E0yIuYp2R+WQ5iZ56JGvsBTDfwpwtYjS
   Q==;
X-CSE-ConnectionGUID: cyMBv5asRdOE13ihjcE2pA==
X-CSE-MsgGUID: pTcQFYTvTzW1qaztaR6vGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="75905452"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="75905452"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 10:20:38 -0700
X-CSE-ConnectionGUID: uBCJ8jyuRoyHxBd5w8iioA==
X-CSE-MsgGUID: XKKOhIlBR0qPCIF61qzztQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="229060299"
Received: from schen9-mobl4.amr.corp.intel.com (HELO [10.125.109.71]) ([10.125.109.71])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 10:20:39 -0700
Message-ID: <9271745eebe68ffc03e0708d9a1c8c0cf25f4e62.camel@linux.intel.com>
Subject: Re: [peterz-queue:sched/cache 19/35] kernel/sched/fair.c:1551:51:
 sparse: sparse: incorrect type in initializer (different address spaces)
From: Tim Chen <tim.c.chen@linux.intel.com>
To: kernel test robot <lkp@intel.com>, "Peter Zijlstra (Intel)"
	 <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, Chen Yu <yu.c.chen@intel.com>
Date: Fri, 10 Apr 2026 10:20:37 -0700
In-Reply-To: <202604110049.kk5gTLLJ-lkp@intel.com>
References: <202604110049.kk5gTLLJ-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sat, 2026-04-11 at 00:35 +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git =
sched/cache
> head:   067a3135814334a8ea7241faef364cc48c6340bc
> commit: df0d98475954d655571979aa061ecb07d7e00392 [19/35] sched/cache: Int=
roduce infrastructure for cache-aware load balancing
> config: csky-randconfig-r112-20260410 (https://download.01.org/0day-ci/ar=
chive/20260411/202604110049.kk5gTLLJ-lkp@intel.com/config)
> compiler: csky-linux-gcc (GCC) 13.4.0
> sparse: v0.6.5-rc1
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260411/202604110049.kk5gTLLJ-lkp@intel.com/reproduce)
>=20
>   1538		if (p->flags & PF_EXITING)
>   1539			return;
>   1540=09
>   1541		if (!zalloc_cpumask_var(&cpus, GFP_KERNEL))
>   1542			return;
>   1543=09
>   1544		scoped_guard (cpus_read_lock) {
>   1545			guard(rcu)();
>   1546=09
>   1547			cpumask_copy(cpus, cpu_online_mask);
>   1548=09
>   1549			for_each_cpu(cpu, cpus) {
>   1550				/* XXX sched_cluster_active */
> > 1551				struct sched_domain *sd =3D per_cpu(sd_llc, cpu);


I think this line needs to be changed to
					struct sched_domain  *sd =3D rcu_dereference_all(per_cpu(sd_llc, cpu))=
;

Peter, do you want me to send a patch against this?

Tim

>   1552				unsigned long occ, m_occ =3D 0, a_occ =3D 0;
>   1553				int m_cpu =3D -1, i;
>   1554=09
