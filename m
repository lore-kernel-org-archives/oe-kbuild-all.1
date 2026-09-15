Received: from mta0.migadu.com (out-190.mta0.migadu.com [91.218.175.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB51E3C10B4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Sep 2026 19:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789498997; cv=none; b=uvQOU6gNrwdOO1l9j+1eFh9+e6of6jw+FvbO7CjV6g+392WMsOdHdI7MI1tsXa/pz5hAH0/9J07ISTIUPziajEGjYPCgn5E7yfObk0Tx5SvGgPlEO1MBOEJS9l6PCnsC3/8zoIP0qN/4+HtqRMHl55VH/q5FKOCGx5BzP/+ZmPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789498997; c=relaxed/simple;
	bh=Yhod0T3b4frzDpnc3FS3usFv0siaj8p60Cn3ix0vhFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VpeEy7xwQYmcGisDNP/hv0tkQOc2KoEBrrF9Jau5OHPP0OgrCTcweEHUg36UahEU9RQ0zfCP/VUDP+Psw1/3T4fYTfbaBtvtLgEAPCo14ehhvGpPm1RNRePYgXSVBWVZ3ZSXMww8YuyH5U1deXBLFjFcovBJ2ZZMTKZSGxwvo6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fI9nbzDs; arc=none smtp.client-ip=91.218.175.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fI9nbzDs"
X-Envelope-To: oe-kbuild-all@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=Yhod0T3b4frzDpnc3FS3usFv0siaj8p60Cn3ix0vhFw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789498992; v=1; x=1790103792;
 b=fI9nbzDsN3L2z08ESBAHEyxgvP+FhTCq08VLoELwUCfOrWapATH8b6YJW4x238d+yvqWdpN+
 uE4NyyypHG+ASxHIUouRL6uopmWyNYQtafy+6ahgYVMCteY6JJMDaGcmu5WmbG5rpW/aARIB+Ru
 0Ogo/lH1fI9FBNd9u0sJIyCM=
X-Envelope-To: oe-kbuild-all@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id c39734dff09effce;
	Tue, 15 Sep 2026 19:03:12 +0000
X-Mizu-Trace-ID: c39734dff09effce
X-Migadu-Flow: FLOW_OUT
Date: Tue, 15 Sep 2026 12:03:11 -0700
From: Shakeel Butt <shakeel.butt@linux.dev>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Christian Brauner <brauner@kernel.org>, 
	Will Deacon <will@kernel.org>
Subject: Re: [linux-next:master 4429/6545] fs/kernfs/dir.c:751:31: sparse:
 sparse: cast to non-scalar
Message-ID: <aqmVt6Me6XsgzqJA@linux.dev>
References: <202609152007.ZrNbQ8XS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202609152007.ZrNbQ8XS-lkp@intel.com>

+Will

On Tue, Sep 15, 2026 at 08:51:41PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   1a1de54f7369cd2b5bac0f265910e60ad3a6b4c3
> commit: 81bdc85b4c086502f4446a58eb5d25f29bb5e9f7 [4429/6545] kernfs: fix up the unlocked attribute reads on the creation paths
> config: alpha-randconfig-r121-20260915 (https://download.01.org/0day-ci/archive/20260915/202609152007.ZrNbQ8XS-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 8.5.0
> sparse: v0.6.5-rc1
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260915/202609152007.ZrNbQ8XS-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202609152007.ZrNbQ8XS-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
> >> fs/kernfs/dir.c:751:31: sparse: sparse: cast to non-scalar
> >> fs/kernfs/dir.c:751:31: sparse: sparse: cast from non-scalar
> 
> vim +751 fs/kernfs/dir.c
> 
>    731	
>    732	struct kernfs_node *kernfs_new_node(struct kernfs_node *parent,
>    733					    const char *name, umode_t mode,
>    734					    kuid_t uid, kgid_t gid,
>    735					    unsigned flags)
>    736	{
>    737		struct kernfs_node *kn;
>    738	
>    739		/*
>    740		 * The mode and the gid below are read unlocked on purpose: they feed
>    741		 * a node that does not exist yet, so nothing orders a racing chmod or
>    742		 * chown against this creation.
>    743		 */
>    744		if (READ_ONCE(parent->mode) & S_ISGID) {
>    745			/* this code block imitates inode_init_owner() for
>    746			 * kernfs
>    747			 */
>    748			struct kernfs_iattrs *attrs = READ_ONCE(parent->iattr);
>    749	
>    750			if (attrs)
>  > 751				gid = READ_ONCE(attrs->ia_gid);

This seems to be related to READ_ONCE() implementation of alpha. ISO C only
permits a cast to a scalar type but gcc/clang accept casting a struct to its own
type as an extension. It seems like sparse implements the standard rule. I think
we can ignore this (or sparse should handle it as gcc/clang).

>    752	
>    753			if (flags & KERNFS_DIR)
>    754				mode |= S_ISGID;
>    755		}
>    756	
>    757		kn = __kernfs_new_node(kernfs_root(parent), parent,
>    758				       name, mode, uid, gid, flags);
>    759		return kn;
>    760	}
>    761	
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
