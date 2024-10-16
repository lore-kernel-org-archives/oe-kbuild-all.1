Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F1A2206E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Oct 2024 03:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729049733; cv=none; b=l/qaA4N7LcOpqXFGB4VRzG1jeYlvKlrRu88bZU1wPhUrkKM+Wskb74NflaIMHEqO0fOc/sc53JHego54U7WDDISC26W3i82TGJyHKrdAPW+VNp+hiz/iK7APlR+Nenl4Ri31QwtrUZUIbz8AX+pmLEqtB9T1TpG19/3zNa79yRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729049733; c=relaxed/simple;
	bh=lRZaGJbQDicWQpWUynLr7ao72JaL5UWoNXavA8buJ24=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ps7YNelRPFpxKLGON8VLkpRdRKrXm6o7+7iwDMnvs8HFLuU1Kyki7DIaxqbOkZt9egZKW4Z7LBLYdimR2p7SMjeVtl/Z8KUcKCydK+7HWYCdO/f993uvg96o7/YERLzEdbWq5PQ1EOwQrnz640NcamHIj9rZgOoaeTDrQQZchy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kiF6k2yA; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kiF6k2yA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729049732; x=1760585732;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lRZaGJbQDicWQpWUynLr7ao72JaL5UWoNXavA8buJ24=;
  b=kiF6k2yATn8M3nInQEOcfup8jMXX94hx16G6iah1YYlCWMkq+S+HlUTV
   u9SQ5GqmcoTAXjy45jQnmGWNQS8SJ7lRivz5tJ/IlpVKQMfU+MXajHzAq
   E726B7uhimWQvO4O1xUZEWAExEsyFByGMlH73B+0WZHhBdf3vmPwFQPTU
   RzkQM2UqCTFLnHueJ3KxbCiDXHltXCr4YRS81A5OvdKk0QTa0JLGL1f/+
   E1lvVQNBCJ7Relx1P+BN6SwjqUGhPDTzLko50zqrv5LodxnxhvoeuqOMU
   YvaMRfW4t2swO502ficsPBz849LL6gEVFL7Az1nlBMZQPfyNDYLH9+iNF
   w==;
X-CSE-ConnectionGUID: X+S/CIaDQdaJYEZOsPTzvg==
X-CSE-MsgGUID: iBbYY92XQD68cDru2Kfx5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28623769"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28623769"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 20:35:31 -0700
X-CSE-ConnectionGUID: FvFniU/rToW2r6C5LS+zVw==
X-CSE-MsgGUID: o80agM7FQxupmnNgHPBApg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; 
   d="scan'208";a="78163933"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 Oct 2024 20:35:30 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0uoq-000KED-0A;
	Wed, 16 Oct 2024 03:35:28 +0000
Date: Wed, 16 Oct 2024 11:34:42 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:cpumask_next_wrap6 1/14] include/linux/objpool.h:173:13:
 error: variable 'start' set but not used
Message-ID: <202410161107.LxW4AYPO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux cpumask_next_wrap6
head:   6088c779ec288831ae562a401799bcd2fb6d1bea
commit: e6612c6b35959a3057b2b0f87e691e4eb33d6d64 [1/14] objpool: rework objpool_pop()
config: x86_64-randconfig-006-20241016 (https://download.01.org/0day-ci/archive/20241016/202410161107.LxW4AYPO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241016/202410161107.LxW4AYPO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410161107.LxW4AYPO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kprobes.h:29,
                    from include/linux/kgdb.h:19,
                    from include/drm/drm_util.h:36,
                    from include/drm/drm_connector.h:32,
                    from include/drm/drm_modes.h:33,
                    from include/drm/drm_crtc.h:32,
                    from include/drm/drm_atomic.h:31,
                    from include/drm/drm_bridge.h:30,
                    from drivers/gpu/drm/drm_encoder.c:25:
   include/linux/objpool.h: In function 'objpool_pop':
>> include/linux/objpool.h:173:13: error: variable 'start' set but not used [-Werror=unused-but-set-variable]
     173 |         int start, cpu;
         |             ^~~~~
   cc1: all warnings being treated as errors


vim +/start +173 include/linux/objpool.h

   162	
   163	/**
   164	 * objpool_pop() - allocate an object from objpool
   165	 * @pool: object pool
   166	 *
   167	 * return value: object ptr or NULL if failed
   168	 */
   169	static inline void *objpool_pop(struct objpool_head *pool)
   170	{
   171		void *obj = NULL;
   172		unsigned long flags;
 > 173		int start, cpu;
   174	
   175		/* disable local irq to avoid preemption & interruption */
   176		raw_local_irq_save(flags);
   177	
   178		start = raw_smp_processor_id();
   179		for_each_possible_cpu_wrap(cpu, start) {
   180			obj = __objpool_try_get_slot(pool, cpu);
   181			if (obj)
   182				break;
   183		}
   184		raw_local_irq_restore(flags);
   185	
   186		return obj;
   187	}
   188	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
