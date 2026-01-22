Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701AA30AAB8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 01:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769046332; cv=none; b=aJDIGz8oycV6/gZobllbikMbwRFC57ck9OP47gRvk6KbC9AReeIp4Q21f4aK83uY2CXso05ozDX9a5BGyySmxKHhBWEz3pHEDL9zZhTigQ+5jTVwMtP68+8gyZ7Fs3Juyb9obiK4l32V1kScDpeI8CNwbmjkY1BskVJug9uZUcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769046332; c=relaxed/simple;
	bh=MarIfSOD6YNmERZZkeLAaUzHAHkjkbeLViVecmLVxJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gwtKrLTl7IeuwZrrEOHLq+bIJDVToswiy3/BSMHQdoly80siWHc85sh4QQSCO20WFYWQ5GZSCt7e2TppoSZmTmKBJ2Et3e3mCQyEe3zWCBc8JVpwlw+rnnOyKWKgvPnDkGdknwFSJBN8r2R53Ne1Ph4nvCshInc8WxnE2nqCDS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VHLro23q; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VHLro23q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769046330; x=1800582330;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MarIfSOD6YNmERZZkeLAaUzHAHkjkbeLViVecmLVxJQ=;
  b=VHLro23qGUimXd5TGH8kafa5JptalaG56LHqlZYYosRBFL4i4L+qGzgK
   xqSnVK0wnFOZK4vEN8rerPoghwRrtxq9FeYh2ecHU2D6/KdofB/jjB3fE
   WjyK5p0KaVNazZ+v/uHJgkUxZ7IN5xIe0wR+T/x2IZrkBSjRQjzcBv2dv
   VY4UnNpTANjli2oDt6yB8qZe8FkMfXCNXVBKmuCejcFGw/PTneAY2wBon
   oAwidLUV66cjW0vtqdmzUi4rweg8WcN3CurvtA73jfsE1ojWv/wwHce+W
   80KD+zoCbFMW7+bv20CSIq11q4FbSrNNW/bOYOffTUaCbHKQlp0KxHcHC
   A==;
X-CSE-ConnectionGUID: R8wGCx7bRi+54wcVrDY1Ig==
X-CSE-MsgGUID: mFnPXT71SWSjbUMTIGPNTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="87860990"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="87860990"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 17:45:30 -0800
X-CSE-ConnectionGUID: T/8U7MkXSZKG7nxnwrlUjg==
X-CSE-MsgGUID: Qfpkgs07SXeGIMYty5lt/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="206927059"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 21 Jan 2026 17:45:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vijlD-00000000SHN-3Yb2;
	Thu, 22 Jan 2026 01:45:23 +0000
Date: Thu, 22 Jan 2026 09:44:37 +0800
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	maple-tree@lists.infradead.org, linux-kernel@vger.kernel.org,
	Suren Baghdasaryan <surenb@google.com>,
	Matthew Wilcox <willy@infradead.org>,
	Sidhartha Kumar <sidhartha.kumar@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Alice Ryhl <aliceryhl@google.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Kujau <lists@nerdbynature.de>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: Re: [PATCH v2 17/29] maple_tree: Start using maple copy node for
 destination
Message-ID: <202601220811.ac3t5OuP-lkp@intel.com>
References: <20260121164526.2093265-18-Liam.Howlett@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121164526.2093265-18-Liam.Howlett@oracle.com>

Hi Liam,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on next-20260121]
[cannot apply to akpm-mm/mm-nonmm-unstable soc/for-next linus/master v6.19-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Liam-R-Howlett/maple_tree-Fix-mas_dup_alloc-sparse-warning/20260122-023746
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260121164526.2093265-18-Liam.Howlett%40oracle.com
patch subject: [PATCH v2 17/29] maple_tree: Start using maple copy node for destination
config: sparc-randconfig-002-20260122 (https://download.01.org/0day-ci/archive/20260122/202601220811.ac3t5OuP-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601220811.ac3t5OuP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601220811.ac3t5OuP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./arch/sparc/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:380,
                    from include/linux/array_size.h:5,
                    from include/linux/kernel.h:16,
                    from include/linux/maple_tree.h:11,
                    from lib/maple_tree.c:56:
   lib/maple_tree.c: In function 'cp_dst_to_slots':
>> include/linux/rcupdate.h:555:36: error: dereferencing pointer to incomplete type 'struct maple_enode'
    #define RCU_INITIALIZER(v) (typeof(*(v)) __force __rcu *)(v)
                                       ^~~~
   include/asm-generic/rwonce.h:55:33: note: in definition of macro '__WRITE_ONCE'
     *(volatile typeof(x) *)&(x) = (val);    \
                                    ^~~
   include/linux/rcupdate.h:1046:3: note: in expansion of macro 'WRITE_ONCE'
      WRITE_ONCE(p, RCU_INITIALIZER(v)); \
      ^~~~~~~~~~
   include/linux/rcupdate.h:1046:17: note: in expansion of macro 'RCU_INITIALIZER'
      WRITE_ONCE(p, RCU_INITIALIZER(v)); \
                    ^~~~~~~~~~~~~~~
   lib/maple_tree.c:3155:3: note: in expansion of macro 'RCU_INIT_POINTER'
      RCU_INIT_POINTER(cp->slot[d], mt_mk_node(mn, mt));
      ^~~~~~~~~~~~~~~~


vim +555 include/linux/rcupdate.h

ca5ecddfa8fcbd Paul E. McKenney 2010-04-28  550  
462225ae47d717 Paul E. McKenney 2013-11-11  551  /**
462225ae47d717 Paul E. McKenney 2013-11-11  552   * RCU_INITIALIZER() - statically initialize an RCU-protected global variable
462225ae47d717 Paul E. McKenney 2013-11-11  553   * @v: The value to statically initialize with.
462225ae47d717 Paul E. McKenney 2013-11-11  554   */
462225ae47d717 Paul E. McKenney 2013-11-11 @555  #define RCU_INITIALIZER(v) (typeof(*(v)) __force __rcu *)(v)
462225ae47d717 Paul E. McKenney 2013-11-11  556  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
