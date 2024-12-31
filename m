Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6AA8462
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Dec 2024 00:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735605369; cv=none; b=IgjmyFy8UnJRncKLdXA+Hkm4BAJFiY4k1wOKY7QCNPF6UgMg1dkTsbHMzYzP75LoHJFLbAmTom9SOarHREvsTf5fYqkoiFzteMZ9Mus22j+An8cgc84HzQ3Hb4BPQmLvU53UC3sdHKI2HCfxp6X6JfVA/vR9pyyD64zKtH8Xa/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735605369; c=relaxed/simple;
	bh=GxtCBD9gCQBDq9AvpM0svG3WinlLhiATDPlI35SqkXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cPQPX7yRRdM985lszX+h8XyamD594mqVCzdfg69qbXXAetdnmukYN/0BkNiy+FqBgDorTDbAKIlLlzxQ5cT7hWUzI8W4ZLCjTHMbbzf+vDqlCDtnjGak62jcIHAgb6/ioANB8Ybp67DdWgfE7ifZibvz4xyntEKKmYyemm1HrTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wrnkl2gm; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wrnkl2gm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735605367; x=1767141367;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GxtCBD9gCQBDq9AvpM0svG3WinlLhiATDPlI35SqkXM=;
  b=Wrnkl2gm67TTs+rgu8RipI1YT5OPu3ur7qFD8y43izL0W0xIjKwErmbJ
   gOfG/nGY+Li/WXTmQj7S66na/Wu5mvbGPtmLaUm1KHBlfA0DVdQoqM0Ph
   upAPo7oJexnSc7nQj9CjUC14+fVBTqZm3OXKxImMvTUVCPX/mYUrX5MKc
   4JMRKOcRr+5ziBqt6uA9Bs0n3n2COKJJevd7XSpEP+5xCEX4/+3+P7qzZ
   L9lyL2A7EJO0Tyjs3T1DeOL2/lqRCDj8mhi0uLwk977XwfkECTymBBBgS
   Bu0XGdJOpW6sNouoPAYStPEb+bgk1xwq76NIPgFPt6/NS5RugOUMvdQJm
   w==;
X-CSE-ConnectionGUID: y0eCCW8hShSGGm7/nYLxaA==
X-CSE-MsgGUID: fqkzdV1iToCrtEh+2lqDJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="36031919"
X-IronPort-AV: E=Sophos;i="6.12,277,1728975600"; 
   d="scan'208";a="36031919"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 16:36:06 -0800
X-CSE-ConnectionGUID: Yqpw8wxhTCGj5/2thEyTog==
X-CSE-MsgGUID: J0dYWiU7SJehWZ09OKq40g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,277,1728975600"; 
   d="scan'208";a="105899620"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 30 Dec 2024 16:36:05 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSQEt-0006Ux-0c;
	Tue, 31 Dec 2024 00:36:03 +0000
Date: Tue, 31 Dec 2024 08:35:27 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tursulin@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 05/14] drm/sched: Move run queue related code into a
 separate file
Message-ID: <202412310801.fR4rGSTm-lkp@intel.com>
References: <20241230165259.95855-6-tursulin@igalia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241230165259.95855-6-tursulin@igalia.com>

Hi Tvrtko,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-exynos/exynos-drm-next]
[also build test WARNING on linus/master v6.13-rc5 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tvrtko-Ursulin/drm-sched-Delete-unused-update_job_credits/20241231-011327
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20241230165259.95855-6-tursulin%40igalia.com
patch subject: [RFC 05/14] drm/sched: Move run queue related code into a separate file
config: s390-randconfig-001-20241231 (https://download.01.org/0day-ci/archive/20241231/202412310801.fR4rGSTm-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241231/202412310801.fR4rGSTm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412310801.fR4rGSTm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/scheduler/sched_rq.c:83: warning: Function parameter or struct member 'ts' not described in 'drm_sched_rq_add_entity'


vim +83 drivers/gpu/drm/scheduler/sched_rq.c

    68	
    69	/**
    70	 * drm_sched_rq_add_entity - add an entity
    71	 *
    72	 * @rq: scheduler run queue
    73	 * @entity: scheduler entity
    74	 *
    75	 * Adds a scheduler entity to the run queue.
    76	 *
    77	 * Returns a DRM scheduler pre-selected to handle this entity.
    78	 */
    79	struct drm_gpu_scheduler *
    80	drm_sched_rq_add_entity(struct drm_sched_rq *rq,
    81				struct drm_sched_entity *entity,
    82				ktime_t ts)
  > 83	{
    84		struct drm_gpu_scheduler *sched;
    85	
    86		if (entity->stopped) {
    87			DRM_ERROR("Trying to push to a killed entity\n");
    88			return NULL;
    89		}
    90	
    91		spin_lock(&entity->lock);
    92		spin_lock(&rq->lock);
    93	
    94		sched = rq->sched;
    95		atomic_inc(sched->score);
    96	
    97		if (!list_empty(&entity->list))
    98			list_add_tail(&entity->list, &rq->entities);
    99	
   100		if (drm_sched_policy == DRM_SCHED_POLICY_RR)
   101			ts = drm_sched_rq_get_rr_deadline(rq);
   102	
   103		if (!RB_EMPTY_NODE(&entity->rb_tree_node))
   104			__drm_sched_rq_remove_fifo_locked(entity, rq);
   105		__drm_sched_rq_add_fifo_locked(entity, rq, ts);
   106	
   107		spin_unlock(&rq->lock);
   108		spin_unlock(&entity->lock);
   109	
   110		return sched;
   111	}
   112	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
