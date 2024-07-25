Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A286D58222
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jul 2024 20:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721940985; cv=none; b=AiWRtW/AMYF0lBsj34Pii+Y+05SheSCd2hk2u1dYOE4yp0EovumR1MXJ+TUDsOfQtfIhHt0zqA7yw7SSEZtjyZMwU0KdZuRwEUcIYU0KpgoBznG2J6YAIO+g0zfLdQi46Y2oMRfu0Rjnp3tlDPkZSelEwJ7j781LUceTFM/w4WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721940985; c=relaxed/simple;
	bh=UytL1fmBns/wcQhgqNcjBWVbfkeeLxkQjkdztV1ENWM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JZaDsvx6WIvLSi3qrzI3xBNpry0BSinvYGpdl+8dYnmQDyZhxuOOT+6AILe48rePJKNUrJkUvcCmoZd9nhn1hSIWsOErJubTo085fcM1D/4A4tpZs5TzWB93ITLVrE5uUpXK4/0Nq+UhsuTaSJy2dk5vMPJhtqGyfuGgORphTcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bzMuFF8A; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bzMuFF8A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721940984; x=1753476984;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UytL1fmBns/wcQhgqNcjBWVbfkeeLxkQjkdztV1ENWM=;
  b=bzMuFF8ApNVx/CSsLv7eCOCUhq+rex2AfVJxX0D2VOJk+BAdrvR9z3Jb
   iiZUW0py0Pf658pA29pY20ADdhWNgvVleyWfdpzHZfoS+CXdLA7F8Gb/A
   TGQF02iwjpNBV9IoZB2/nqhM3+Ps1bgYirY3gDzeI3QRoLetD5uRmhsP4
   DOpg/ygpK2Vh1+SqrKz3sUzBl8n1V7qj9KDnXEgmRJ50M6jTTHXNnxQEs
   aCtuUIXd7IlHrpVpG9yMAkR1Y2xVmWcpEJkOGK3MtD3ckihIWgrMGuKqX
   lJLKdztzDQbIxdt+gH4GsOaxAqVXvzsU74eLZM2641wzNNLP+xTWWEB/E
   g==;
X-CSE-ConnectionGUID: TJc1z0zKT0Sob3/QrnHbyw==
X-CSE-MsgGUID: 8VflGuUFS7KL5O7j27UZ/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="19850608"
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; 
   d="scan'208";a="19850608"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2024 13:56:23 -0700
X-CSE-ConnectionGUID: aZC90JDfS36xkmkPEm3Vww==
X-CSE-MsgGUID: R9LtnAvzT/6ujxz6LmDycw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; 
   d="scan'208";a="52968246"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 25 Jul 2024 13:56:21 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sX5Vb-000oRs-2a;
	Thu, 25 Jul 2024 20:56:19 +0000
Date: Fri, 26 Jul 2024 04:55:39 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:kthread/affinity 12/20] kernel/kthread.c:813:13:
 warning: variable 'ret' set but not used
Message-ID: <202407260454.HIWDsAaO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git kthread/affinity
head:   b6dba5dc36864037925f32fc2dbf82d4a88ab3bb
commit: 37ab5b6089828d98171bfbfbaecd69d58cfae518 [12/20] kthread: Implement preferred affinity
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240726/202407260454.HIWDsAaO-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240726/202407260454.HIWDsAaO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407260454.HIWDsAaO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/kthread.c: In function 'kthread_affine_preferred':
>> kernel/kthread.c:813:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     813 |         int ret;
         |             ^~~


vim +/ret +813 kernel/kthread.c

   807	
   808	int kthread_affine_preferred(struct task_struct *p, const struct cpumask *mask)
   809	{
   810		struct kthread *kthread = to_kthread(p);
   811		cpumask_var_t affinity;
   812		unsigned long flags;
 > 813		int ret;
   814	
   815		if (!wait_task_inactive(p, TASK_UNINTERRUPTIBLE) || kthread->started) {
   816			WARN_ON(1);
   817			return -EINVAL;
   818		}
   819	
   820		if (!zalloc_cpumask_var(&affinity, GFP_KERNEL))
   821			return -ENOMEM;
   822	
   823		kthread->preferred_affinity = kzalloc(sizeof(struct cpumask), GFP_KERNEL);
   824		if (!kthread->preferred_affinity) {
   825			ret = -ENOMEM;
   826			goto out;
   827		}
   828	
   829		mutex_lock(&kthreads_hotplug_lock);
   830		cpumask_copy(kthread->preferred_affinity, mask);
   831		list_add_tail(&kthread->hotplug_node, &kthreads_hotplug);
   832		kthread_fetch_affinity(kthread, affinity);
   833	
   834		/* It's safe because the task is inactive. */
   835		raw_spin_lock_irqsave(&p->pi_lock, flags);
   836		do_set_cpus_allowed(p, mask);
   837		raw_spin_unlock_irqrestore(&p->pi_lock, flags);
   838	
   839		mutex_unlock(&kthreads_hotplug_lock);
   840	out:
   841		free_cpumask_var(affinity);
   842	
   843		return 0;
   844	}
   845	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
