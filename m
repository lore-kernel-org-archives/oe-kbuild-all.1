Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375351DC9A3
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 May 2025 10:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746096236; cv=none; b=BkZ1soYE83DeYRKmjlllAlk+hU2DHFY78rm32miJ2oeLtRUiEsP0St/2BsYixg8BcmThVndYe+Yol0EvMoT4mGBYZ5b+UkD778/FfIf68w/3QfZBvBQmBAUwRyEeAPTBNE8jWXoybag+jnwE80eLpGVLNHcK0gvGHJ6GZM1PCSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746096236; c=relaxed/simple;
	bh=RTIn05W/GtDHSTWDFooGE31tIGmZSdJytnDHyP/r/8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PGegFSS8TS9bAOQWLIhlxWoAf4FC112aSa5t10YNwZ4fm6sB4K8ePDHGmJxub+SH/zqpfsKSFZsYExo41hKqcJxLz6LFEn/zc7WgTHdmZQU/PPaRlHchgJMccTxzwJmYeo/yRlL6wyMfg7PPaVqRU7v8FO06q/yrshKTZfBO3hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ezB5LhNe; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ezB5LhNe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746096235; x=1777632235;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RTIn05W/GtDHSTWDFooGE31tIGmZSdJytnDHyP/r/8g=;
  b=ezB5LhNeEhy1WbjfpZhQk/HSRq1C71Nt7PcJY5B0C+86ovpRx2syx8xV
   0hiKpMxV9x2ktEn2nv4pbUwZavUtEojOCKo4TrrDQyfvyrI1F8rZ+ViWi
   NHi0E36/orWi0y1j0MPsZaVDl3xvSPe4hFAOhCYuKN9p1vQxgO/1zk1kL
   Ev1uO4Dzw2e9+Nn8Bu1xBZV9+VAVraKnlQ7yOeop9jE2R4qaUxcawo9F3
   cojs2E4FKq++65aqANOUuJ3r9igkanaLTIE7LKt4NE+i2F9cK0I0BPeI0
   sz9PbKnzMzQ+yeI8ox+ucquw7iVsftP4CkJDx2rz0evuOw0EsUb1VMZsZ
   Q==;
X-CSE-ConnectionGUID: 24iwGba7QhmOloCYt+uSxQ==
X-CSE-MsgGUID: WVPdqtj0SCieA+1dZQwzXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="47905862"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="47905862"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 03:43:55 -0700
X-CSE-ConnectionGUID: aNT8OLNsSMOv7fvqPLZdlA==
X-CSE-MsgGUID: RQ5IbqbbTDijirMCsPAeog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="138369009"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 01 May 2025 03:43:53 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAROR-00046z-0E;
	Thu, 01 May 2025 10:43:51 +0000
Date: Thu, 1 May 2025 18:43:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6 07/10] ref_tracker: add a way to create a symlink to
 the ref_tracker_dir debugfs file
Message-ID: <202505011822.GnoqN2Oi-lkp@intel.com>
References: <20250430-reftrack-dbgfs-v6-7-867c29aff03a@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-reftrack-dbgfs-v6-7-867c29aff03a@kernel.org>

Hi Jeff,

kernel test robot noticed the following build errors:

[auto build test ERROR on 5bc1018675ec28a8a60d83b378d8c3991faa5a27]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeff-Layton/ref_tracker-don-t-use-pK-in-pr_ostream-output/20250430-230944
base:   5bc1018675ec28a8a60d83b378d8c3991faa5a27
patch link:    https://lore.kernel.org/r/20250430-reftrack-dbgfs-v6-7-867c29aff03a%40kernel.org
patch subject: [PATCH v6 07/10] ref_tracker: add a way to create a symlink to the ref_tracker_dir debugfs file
config: arc-randconfig-002-20250501 (https://download.01.org/0day-ci/archive/20250501/202505011822.GnoqN2Oi-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250501/202505011822.GnoqN2Oi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505011822.GnoqN2Oi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/net/net_trackers.h:4,
                    from include/net/net_namespace.h:40,
                    from include/linux/netdevice.h:38,
                    from include/linux/if_vlan.h:10,
                    from include/linux/filter.h:21,
                    from include/linux/bpf_verifier.h:9,
                    from kernel/bpf/../../tools/lib/bpf/relo_core.c:8,
                    from kernel/bpf/relo_core.c:2:
>> include/linux/ref_tracker.h:123:20: error: redefinition of 'ref_tracker_dir_symlink'
     123 | static inline void ref_tracker_dir_symlink(struct ref_tracker_dir *dir, const char *fmt, ...)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ref_tracker.h:86:20: note: previous definition of 'ref_tracker_dir_symlink' with type 'void(struct ref_tracker_dir *, const char *, ...)'
      86 | static inline void ref_tracker_dir_symlink(struct ref_tracker_dir *dir, const char *fmt, ...)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/net/net_trackers.h:4,
                    from include/net/net_namespace.h:40,
                    from include/linux/netdevice.h:38,
                    from include/net/sock.h:46,
                    from include/linux/bpf-cgroup.h:11,
                    from kernel/bpf/helpers.c:6:
>> include/linux/ref_tracker.h:123:20: error: redefinition of 'ref_tracker_dir_symlink'
     123 | static inline void ref_tracker_dir_symlink(struct ref_tracker_dir *dir, const char *fmt, ...)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ref_tracker.h:86:20: note: previous definition of 'ref_tracker_dir_symlink' with type 'void(struct ref_tracker_dir *, const char *, ...)'
      86 | static inline void ref_tracker_dir_symlink(struct ref_tracker_dir *dir, const char *fmt, ...)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c: In function '____bpf_snprintf':
   kernel/bpf/helpers.c:1065:9: warning: function '____bpf_snprintf' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1065 |         err = bstr_printf(str, str_size, fmt, data.bin_args);
         |         ^~~


vim +/ref_tracker_dir_symlink +123 include/linux/ref_tracker.h

   122	
 > 123	static inline void ref_tracker_dir_symlink(struct ref_tracker_dir *dir, const char *fmt, ...)
   124	{
   125	}
   126	#endif
   127	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
