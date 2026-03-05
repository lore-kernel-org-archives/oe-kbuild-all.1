Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798653314BF
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 09:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772702990; cv=none; b=tYMhy9p0V5o6hw7hmSjclmxK2v4NsRl1qhTGj+CtkbVhTeoUegb2NEWPKbxBjPLfen0K+MpQP+mLrNWBEZkXNsUmN5qDaR4vkUVQjpl2OISKQv3I8tGwkXaiTsCeeyrfgp5HlpUkMv2j6CULVDmRtIRqE//HRf3XNi82DV5zBSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772702990; c=relaxed/simple;
	bh=N9sXOBoTWgQKudwcJBZjeZWGoJgvejxlsaLCol4fg3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rj+SieSpWmVhwfhpIZcHSdpOhT/rd/09Xg/jlNL6VIk3REvSteYSzEZK/xiGUw66Qalzr44EE7DApCAmy5IOL4zW3OgVfUzLOpNP7BRa7PC+ELm4suhV6JBjOLmrd1t5zLleGvRlVT/GeSGOV2XV8vsvKIyqZ8zZvg9E4gm7W0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hp/E8rkC; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hp/E8rkC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772702989; x=1804238989;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N9sXOBoTWgQKudwcJBZjeZWGoJgvejxlsaLCol4fg3s=;
  b=Hp/E8rkC+l85RloF3ORIP2EmsZi47IoEHIgtqX/4Uzm32PFqRwSxcSLM
   LFj7G0Te7yPSQyRvpEVY+xxmk6uayZeRbSp1QK4S3VpkyDOol8f7aQXux
   yYY5Oc1/B2UyOjih71UUUxaR1tOZ/HJPA27k1NvliLkPlLlRPfZNJCg6N
   Dz4DIJTHdroSIMdgQqze62qwJkkHdkTeqYVqq7gzE1hnbkKNsS+yblq2+
   W1Vj9bukWOfnSizOGtLqc0vfGOLNudcc4gtkedTc+h+dTAeXu1hvghk0C
   s8sHclPUCCI498+mtwz6mdvJOhQPW4u5kqmW9WttlbG4UQea3ItTiV/Kg
   A==;
X-CSE-ConnectionGUID: Neh4eKJrTRKg2sXmjUwyLw==
X-CSE-MsgGUID: C9tso8nIS4ia6gjAXlaAsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="77655248"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; 
   d="scan'208";a="77655248"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 01:29:49 -0800
X-CSE-ConnectionGUID: pioHOlYERfm3eicoQfYz9w==
X-CSE-MsgGUID: Hy0m9MfUT9q5ZieRYt+iug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; 
   d="scan'208";a="249088615"
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Mar 2026 01:29:45 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vy51Z-000000000Pu-27Q4;
	Thu, 05 Mar 2026 09:29:41 +0000
Date: Thu, 5 Mar 2026 17:29:22 +0800
From: kernel test robot <lkp@intel.com>
To: Praveen Kumar Kannoju <praveen.kannoju@oracle.com>, saeedm@nvidia.com,
	leon@kernel.org, tariqt@nvidia.com, mbloch@nvidia.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, rama.nichanamatlu@oracle.com,
	manjunath.b.patil@oracle.com, anand.a.khoje@oracle.com,
	Praveen Kumar Kannoju <praveen.kannoju@oracle.com>
Subject: Re: [PATCH] net/mlx5: poll mlx5 eq during irq migration
Message-ID: <202603051743.ceus9qzu-lkp@intel.com>
References: <20260304161704.910564-1-praveen.kannoju@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304161704.910564-1-praveen.kannoju@oracle.com>

Hi Praveen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]
[also build test WARNING on net/main linus/master v7.0-rc2 next-20260304]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Praveen-Kumar-Kannoju/net-mlx5-poll-mlx5-eq-during-irq-migration/20260305-003505
base:   net-next/main
patch link:    https://lore.kernel.org/r/20260304161704.910564-1-praveen.kannoju%40oracle.com
patch subject: [PATCH] net/mlx5: poll mlx5 eq during irq migration
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260305/202603051743.ceus9qzu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603051743.ceus9qzu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603051743.ceus9qzu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/mellanox/mlx5/core/eq.c:958:6: warning: no previous prototype for 'mlx5_eq_reap_irq_notify' [-Wmissing-prototypes]
     958 | void mlx5_eq_reap_irq_notify(struct irq_affinity_notify *notify, const cpumask_t *mask)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mellanox/mlx5/core/eq.c:978:6: warning: no previous prototype for 'mlx5_eq_reap_irq_release' [-Wmissing-prototypes]
     978 | void mlx5_eq_reap_irq_release(struct kref *ref) {}
         |      ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/mlx5_eq_reap_irq_notify +958 drivers/net/ethernet/mellanox/mlx5/core/eq.c

   957	
 > 958	void mlx5_eq_reap_irq_notify(struct irq_affinity_notify *notify, const cpumask_t *mask)
   959	{
   960		u32 eqe_count;
   961		struct mlx5_eq_comp *eq = container_of(notify, struct mlx5_eq_comp, notify);
   962	
   963		if (mlx5_reap_eq_irq_aff_change) {
   964			mlx5_core_warn(eq->core.dev, "irqn = 0x%x migration notified, EQ 0x%x: Cons = 0x%x\n",
   965				       eq->core.irqn, eq->core.eqn, eq->core.cons_index);
   966	
   967			while (!rtnl_trylock())
   968				msleep(20);
   969	
   970			eqe_count = mlx5_eq_poll_irq_disabled(eq);
   971			if (eqe_count)
   972				mlx5_core_warn(eq->core.dev, "Recovered %d eqes on EQ 0x%x\n",
   973					       eqe_count, eq->core.eqn);
   974			rtnl_unlock();
   975		}
   976	}
   977	
 > 978	void mlx5_eq_reap_irq_release(struct kref *ref) {}
   979	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
