Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5388D31A60
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 May 2024 11:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716118515; cv=none; b=EgsaErTL8qplsxdkE6tGwaYSBf5q0HKUPtzjW/FKowNtR+u97BfSgSWyAUnGMa+gpvewga/Tj3C0nYNceFa9NuF+ZFJ+Y9uPoNgHy3Y8l5BSbbBAfUctfiXLfMudZqKDIEDqYg6pS/akXt1G74rXkq5l5hbbw4/oFcxfjTYvw94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716118515; c=relaxed/simple;
	bh=isaENKlZ4Dah/OxcrVqJYrYbUtnL+lzE100loLpjCUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o3AlJ9VGET1T/ldcS4sF7Z/TVWc6hK6XZ8bGf5FtUJ/0FoUovqCsSg1A2Q7SioOKNeeqMUmGps0s2qK7lV/OCLoAL5tHry4aHrnpyVaM+932Mkki9TWs+Dsvlp1tnGAnYY7tv4eTqREcswQ8C/JqORMWK/Fm2CrcZ/87FPVgacI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V7O9wOXK; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V7O9wOXK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716118513; x=1747654513;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=isaENKlZ4Dah/OxcrVqJYrYbUtnL+lzE100loLpjCUQ=;
  b=V7O9wOXKLVAq0HgsTR35evRJQGu4gw73kpXqPVuk8esvmvy4Ot5fVNBp
   SAoASDYt6E7gZdqG6SYuHUyjbpt+owIx/Tr/Kk9LoqcG9m5sEEHOBUtNH
   PDzG0B9apSioEAI0FgO+JAzRoRaUXh6NFZdPnIVvv+xBGez3hgeozhrEm
   ea2m9wm/1109Fahpg+TazXtyq2JiBVk54f6L5EAdjk7hhk6hqv5FgjWH4
   80GzOzerd2CyU+k/tEYaZ2W74GZws6nids6qJY6WV2381KpM11Lzowzw5
   0m3yTA+ZTtfqCOf863cxmBL/5ms5bX0/xruT7YhmWyAcI4S4kyLZtcQcp
   A==;
X-CSE-ConnectionGUID: gZvEYj/ATNS+enr10dSi8w==
X-CSE-MsgGUID: GIbY3IgGTUSi+6+pAn9Oeg==
X-IronPort-AV: E=McAfee;i="6600,9927,11076"; a="12471165"
X-IronPort-AV: E=Sophos;i="6.08,172,1712646000"; 
   d="scan'208";a="12471165"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2024 04:35:13 -0700
X-CSE-ConnectionGUID: e+Fvgo46RiiKvLpMd/vxEA==
X-CSE-MsgGUID: 8Vz8LuzuRQOvbwnqMjcXGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,172,1712646000"; 
   d="scan'208";a="36829411"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 19 May 2024 04:35:09 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8eol-0003QC-0d;
	Sun, 19 May 2024 11:35:07 +0000
Date: Sun, 19 May 2024 19:34:53 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Ilya Dryomov <idryomov@gmail.com>, Xiubo Li <xiubli@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	ceph-devel@vger.kernel.org
Subject: Re: [PATCH 1/2 net-next] libceph: Use sruct_size() in
 ceph_create_snap_context()
Message-ID: <202405191909.7qhhefnu-lkp@intel.com>
References: <5b7c72bdb52703bbfa5511ed500aed4babde1308.1716109606.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b7c72bdb52703bbfa5511ed500aed4babde1308.1716109606.git.christophe.jaillet@wanadoo.fr>

Hi Christophe,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Christophe-JAILLET/libceph-Use-__counted_by-in-struct-ceph_snap_context/20240519-172142
base:   net-next/main
patch link:    https://lore.kernel.org/r/5b7c72bdb52703bbfa5511ed500aed4babde1308.1716109606.git.christophe.jaillet%40wanadoo.fr
patch subject: [PATCH 1/2 net-next] libceph: Use sruct_size() in ceph_create_snap_context()
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240519/202405191909.7qhhefnu-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240519/202405191909.7qhhefnu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405191909.7qhhefnu-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/ceph/snapshot.c: In function 'ceph_create_snap_context':
>> net/ceph/snapshot.c:32:25: error: implicit declaration of function 'sruct_size'; did you mean 'struct_size'? [-Werror=implicit-function-declaration]
      32 |         snapc = kzalloc(sruct_size(snapc, snaps, snap_count), gfp_flags);
         |                         ^~~~~~~~~~
         |                         struct_size
>> net/ceph/snapshot.c:32:43: error: 'snaps' undeclared (first use in this function); did you mean 'snapc'?
      32 |         snapc = kzalloc(sruct_size(snapc, snaps, snap_count), gfp_flags);
         |                                           ^~~~~
         |                                           snapc
   net/ceph/snapshot.c:32:43: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors


vim +32 net/ceph/snapshot.c

    11	
    12	/*
    13	 * Ceph snapshot contexts are reference counted objects, and the
    14	 * returned structure holds a single reference.  Acquire additional
    15	 * references with ceph_get_snap_context(), and release them with
    16	 * ceph_put_snap_context().  When the reference count reaches zero
    17	 * the entire structure is freed.
    18	 */
    19	
    20	/*
    21	 * Create a new ceph snapshot context large enough to hold the
    22	 * indicated number of snapshot ids (which can be 0).  Caller has
    23	 * to fill in snapc->seq and snapc->snaps[0..snap_count-1].
    24	 *
    25	 * Returns a null pointer if an error occurs.
    26	 */
    27	struct ceph_snap_context *ceph_create_snap_context(u32 snap_count,
    28							gfp_t gfp_flags)
    29	{
    30		struct ceph_snap_context *snapc;
    31	
  > 32		snapc = kzalloc(sruct_size(snapc, snaps, snap_count), gfp_flags);
    33		if (!snapc)
    34			return NULL;
    35	
    36		refcount_set(&snapc->nref, 1);
    37		snapc->num_snaps = snap_count;
    38	
    39		return snapc;
    40	}
    41	EXPORT_SYMBOL(ceph_create_snap_context);
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
