Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4411A27E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 15:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V8LZLSRO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697903055; x=1729439055;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SWjaaUFZlJfK77jO1ZUaJ0EvRevGpR7sJ4L+9nMAHKk=;
  b=V8LZLSROyquwFBUdAfFJiG4Ox9Nn2SpR7uInumPlw3/VD/ASjSfIATPe
   Bz2MWSWcyzemgQboehB4tK8nuySHkfA7kVNJEBv5Z328N4016TCMugJX9
   OI6uk5qnRdPHzW3BYq/UxtJAkaj+iyPrvXe7A8zh6/X8LVLsxjFD5i1wo
   ejz5nyOzH1ZvMGYYIO2TnrqUNC+ksuV5/ZrBeXNvzTpeo8IFo/wHX7blA
   hyqzbj9ChGMIcRTScofdsN6F1J2/q48gVMNiCKHtbFdr7AoNEE+1fusw/
   DmfRTLgMuDa852fJr5JPuoUE30leI+CxIDONn4uWFQdyfU8d+k4iHdOX2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="365981795"
X-IronPort-AV: E=Sophos;i="6.03,241,1694761200"; 
   d="scan'208";a="365981795"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 08:44:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,241,1694761200"; 
   d="scan'208";a="5383547"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 Oct 2023 08:43:00 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quE94-0004yH-1K;
	Sat, 21 Oct 2023 15:44:10 +0000
Date: Sat, 21 Oct 2023 23:43:37 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
	intel-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, andi.shyti@intel.com,
	jonathan.cavitt@intel.com, saurabhg.gupta@intel.com,
	nirmoy.das@intel.com
Subject: Re: [Intel-gfx] [PATCH dii-client 2/2] drm/i915: Use selective tlb
 invalidations where supported
Message-ID: <202310212325.rC9VhDGf-lkp@intel.com>
References: <20231010184423.2118908-4-jonathan.cavitt@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231010184423.2118908-4-jonathan.cavitt@intel.com>

Hi Jonathan,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Cavitt/drm-i915-Use-selective-tlb-invalidations-where-supported/20231011-034501
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20231010184423.2118908-4-jonathan.cavitt%40intel.com
patch subject: [Intel-gfx] [PATCH dii-client 2/2] drm/i915: Use selective tlb invalidations where supported
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231021/202310212325.rC9VhDGf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231021/202310212325.rC9VhDGf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310212325.rC9VhDGf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/i915_vma.c:1343:25: error: expected ';', ',' or ')' before 'u64'
    1343 |                         u64 start, u64 size)
         |                         ^~~


vim +1343 drivers/gpu/drm/i915/i915_vma.c

  1341	
  1342	void vma_invalidate_tlb(struct i915_address_space *vm, u32 *tlb
> 1343				u64 start, u64 size)
  1344	{
  1345		struct intel_gt *gt;
  1346		int id;
  1347	
  1348		if (!tlb)
  1349			return;
  1350	
  1351		/*
  1352		 * Before we release the pages that were bound by this vma, we
  1353		 * must invalidate all the TLBs that may still have a reference
  1354		 * back to our physical address. It only needs to be done once,
  1355		 * so after updating the PTE to point away from the pages, record
  1356		 * the most recent TLB invalidation seqno, and if we have not yet
  1357		 * flushed the TLBs upon release, perform a full invalidation.
  1358		 */
  1359		for_each_gt(gt, vm->i915, id) {
  1360			if (!intel_gt_invalidate_tlb_range(gt, start, size))
  1361				WRITE_ONCE(tlb[id],
  1362					   intel_gt_next_invalidate_tlb_full(gt));
  1363		}
  1364	}
  1365	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
