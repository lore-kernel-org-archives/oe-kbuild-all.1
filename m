Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D98200961
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Aug 2024 09:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724233407; cv=none; b=liPCqyHTH2LU7gtFRZoK1Ebuj0VWlEysIt0PMrVdfbnrASPfZYi/N5gH5hcy47POWauv5Fd5WyudLPTEfrHE8BtNZd0FurDvu30EcE38ESmxaDh54l+wyUb7+F/BCnIHZhwsXcr73n0tNs+inoc/gsyRwVymW7mXUC356BJJovM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724233407; c=relaxed/simple;
	bh=XZEuaqULdmrhmUlGTAOSBSFIRe9hIMuCKG4XgB/UVFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DmcwRgntXIvhqsx6stTe5eUY7Ssf+gRjT6WP6WeDdhdIhhPkfgYAjbZyKXrwN+cyi9iC0rFQoiAbjWa4GrmDWaqbVlXFmO7ChLuzPGwLuD/xzEy5+tEDofTe7Z+HJqowWIV9Oreg/ED8nKlTqqsMgW2cXGb3Pmh7wQvt/c6Bzzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dp/Mzy9s; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dp/Mzy9s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724233405; x=1755769405;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XZEuaqULdmrhmUlGTAOSBSFIRe9hIMuCKG4XgB/UVFE=;
  b=Dp/Mzy9sXC2oDiU0oYpdgxcIv2QvtW8+IYZit/QwxokJCl2ypdn68feX
   H6U+YqlA5nEk8mwRfodNQihMpcOXGWQ/NMncxwDY8ur/WvVhH7On2NaqP
   2l3L7JK2gmIwIqUt3r/of0u4JOcSrIIiAGHE8B6Vh0eEKpYHcoFL7tfZV
   OCUDnxRwvroskg+B4sLPMPCBVMWjqhgbmwyFFVqDoI3J/GuWbFdAqCb92
   0xyF6ceSb7l67zGaqMjji4W9hq9uTTsBDCwuip0EdIdC/MzoGSYlJTVfU
   vyRKQFkiTwuw89f+QzhmueHH3TbhG9oI6+gkbwVL/EoQapBcKNf2E3Ref
   w==;
X-CSE-ConnectionGUID: +VRVWWEYTJGhac5x+Nl4TQ==
X-CSE-MsgGUID: kmao+SjCTA206O4vhLWIFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22115413"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="22115413"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 02:43:25 -0700
X-CSE-ConnectionGUID: IB1aAqMVSPyasNNpvCfuDg==
X-CSE-MsgGUID: WV7zwc0zQOOtGs7v6z7aSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="65919298"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 Aug 2024 02:43:24 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sghs9-000BAg-16;
	Wed, 21 Aug 2024 09:43:21 +0000
Date: Wed, 21 Aug 2024 17:43:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC] mm, slub: avoid zeroing kmalloc redzone
Message-ID: <202408211729.djaqly5N-lkp@intel.com>
References: <20240819064115.385086-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819064115.385086-1-peng.fan@oss.nxp.com>

Hi Peng,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on next-20240819]
[also build test ERROR on v6.11-rc4]
[cannot apply to akpm-mm/mm-everything linus/master vbabka-slab/for-next v6.11-rc4 v6.11-rc3 v6.11-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Peng-Fan-OSS/mm-slub-avoid-zeroing-kmalloc-redzone/20240819-143423
base:   next-20240819
patch link:    https://lore.kernel.org/r/20240819064115.385086-1-peng.fan%40oss.nxp.com
patch subject: [RFC] mm, slub: avoid zeroing kmalloc redzone
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240821/202408211729.djaqly5N-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240821/202408211729.djaqly5N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408211729.djaqly5N-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/slub.c: In function 'slab_free_hook':
>> mm/slub.c:2292:29: error: implicit declaration of function 'get_orig_size' [-Wimplicit-function-declaration]
    2292 |                 orig_size = get_orig_size(s, x);
         |                             ^~~~~~~~~~~~~
>> mm/slub.c:2303:17: error: implicit declaration of function 'set_orig_size'; did you mean 'set_orig_insn'? [-Wimplicit-function-declaration]
    2303 |                 set_orig_size(s, x, orig_size);
         |                 ^~~~~~~~~~~~~
         |                 set_orig_insn


vim +/get_orig_size +2292 mm/slub.c

  2275	
  2276		/*
  2277		 * As memory initialization might be integrated into KASAN,
  2278		 * kasan_slab_free and initialization memset's must be
  2279		 * kept together to avoid discrepancies in behavior.
  2280		 *
  2281		 * The initialization memset's clear the object and the metadata,
  2282		 * but don't touch the SLAB redzone.
  2283		 *
  2284		 * The object's freepointer is also avoided if stored outside the
  2285		 * object.
  2286		 */
  2287		if (unlikely(init)) {
  2288			int rsize;
  2289			unsigned int inuse, orig_size;
  2290	
  2291			inuse = get_info_end(s);
> 2292			orig_size = get_orig_size(s, x);
  2293			if (!kasan_has_integrated_init())
  2294				memset(kasan_reset_tag(x), 0,
  2295				       s->object_size > orig_size ? orig_size : s->object_size);
  2296			rsize = (s->flags & SLAB_RED_ZONE) ? s->red_left_pad : 0;
  2297			memset((char *)kasan_reset_tag(x) + inuse, 0,
  2298			       s->size - inuse - rsize);
  2299			/*
  2300			 * Restore orig_size, otherwize kmalloc redzone overwritten
  2301			 * would be reported
  2302			 */
> 2303			set_orig_size(s, x, orig_size);
  2304	
  2305		}
  2306		/* KASAN might put x into memory quarantine, delaying its reuse. */
  2307		return !kasan_slab_free(s, x, init, still_accessible);
  2308	}
  2309	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
