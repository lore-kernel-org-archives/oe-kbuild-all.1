Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26E82D322E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Oct 2025 19:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760471576; cv=none; b=YayPzXWhioCe5jDYiuw76/h6BHROqudZ/3kAeftIuUcDpQ5Pcawbn0OInnKK2vqbqeuC4yoB8JqqSTdR98+B/83cudXCuPrNmL8oJQEnVONNiIPK0+/f2duYpzZZpi7W3XuQWmCwRJvMyG+iw0y/6uEjLNW2Rgo9S2Mrvq1tSyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760471576; c=relaxed/simple;
	bh=rzfRhGYtB9+07+KIleA/pC/Rmz/MdAcry5BnbPOg3gc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bSzol4LS3un5vaUxeuOVOiWIdErkCz6H3wftwC5bM1BRpUYb2Jn5DjtOe+Jc2I1MZJ9rx/D7OOgKAGDgo8YOkDrHafAhy3FnX+9Jz75RxRqzJJEgdUcCUyVxf88fG02iPHaMNU3a2wOOggv+2UtLUqTVkgvD70jTf4xVuhobLjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iQYtG76m; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iQYtG76m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760471575; x=1792007575;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=rzfRhGYtB9+07+KIleA/pC/Rmz/MdAcry5BnbPOg3gc=;
  b=iQYtG76m9nGmfm4uM1Si/726EXe0LLPe3/XCgcw/8ecCccP2zdEtoZZo
   GpA6YPj0zdtlRLoFdyvOC7T//RRMeYYz/TdGiMeZQuROTBkHCS2u9W2AL
   +b99gsqyNSeYylYlcXOzO3jXDrPQ6s1m10k6qXJpeb/CE5rRUynGz3Ziw
   tD55O6MV45nTpPN5SxLf/q6HwXUSDwRRKdt52KMFFiAeEvOdm/F2q8w/f
   xap4oS8j1bwSJELOQtospnT2GpOsFRKcEiwZlAEeR8xNHVz+s349emLEn
   xbxfwek0FfBWX+ywg1Kwy22M+gV/If7Bv6TcAvzh3FQoaR/h1t2gEhqxB
   g==;
X-CSE-ConnectionGUID: kTZGQ4BnRCSobAFu9mdhhw==
X-CSE-MsgGUID: KJ3h8Nn9RS+3jO6S9kCTwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="61674060"
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; 
   d="scan'208";a="61674060"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 12:52:54 -0700
X-CSE-ConnectionGUID: tzykBlOERqWuyPxqP+fbug==
X-CSE-MsgGUID: uYV0pt26TDOiaqHireXxdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; 
   d="scan'208";a="181976781"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 14 Oct 2025 12:52:53 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8l4k-00038p-29;
	Tue, 14 Oct 2025 19:52:50 +0000
Date: Wed, 15 Oct 2025 03:52:47 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/1] ovl: Use fsid as unique identifier for trusted
 origin
Message-ID: <202510150318.j2kBtJYC-lkp@intel.com>
References: <20251014015707.129013-2-andrealmeid@igalia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251014015707.129013-2-andrealmeid@igalia.com>

Hi André,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on brauner-vfs/vfs.all]
[also build test ERROR on linus/master v6.18-rc1 next-20251014]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andr-Almeida/ovl-Use-fsid-as-unique-identifier-for-trusted-origin/20251014-100119
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20251014015707.129013-2-andrealmeid%40igalia.com
patch subject: [RFC PATCH 1/1] ovl: Use fsid as unique identifier for trusted origin
config: s390-randconfig-001-20251015 (https://download.01.org/0day-ci/archive/20251015/202510150318.j2kBtJYC-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251015/202510150318.j2kBtJYC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510150318.j2kBtJYC-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/overlayfs/copy_up.c: In function 'ovl_encode_real_fh':
>> fs/overlayfs/copy_up.c:431:16: error: assignment to expression with array type
     431 |         uuid.b = ks.f_fsid;
         |                ^
>> fs/overlayfs/copy_up.c:470:31: error: invalid type argument of unary '*' (have 'uuid_t')
     470 |                 fh->fb.uuid = *uuid;
         |                               ^~~~~


vim +431 fs/overlayfs/copy_up.c

   418	
   419	struct ovl_fh *ovl_encode_real_fh(struct ovl_fs *ofs, struct inode *realinode,
   420					  bool is_upper)
   421	{
   422		struct ovl_fh *fh;
   423		int fh_type, dwords;
   424		int buflen = MAX_HANDLE_SZ;
   425		uuid_t uuid;
   426		struct kstatfs ks;
   427		int err;
   428	
   429		// RFC: dentry can't be NULL, uuid needs a type cast
   430		realinode->i_sb->s_op->statfs(NULL, &ks);
 > 431		uuid.b = ks.f_fsid;
   432	
   433		/* Make sure the real fid stays 32bit aligned */
   434		BUILD_BUG_ON(OVL_FH_FID_OFFSET % 4);
   435		BUILD_BUG_ON(MAX_HANDLE_SZ + OVL_FH_FID_OFFSET > 255);
   436	
   437		fh = kzalloc(buflen + OVL_FH_FID_OFFSET, GFP_KERNEL);
   438		if (!fh)
   439			return ERR_PTR(-ENOMEM);
   440	
   441		/*
   442		 * We encode a non-connectable file handle for non-dir, because we
   443		 * only need to find the lower inode number and we don't want to pay
   444		 * the price or reconnecting the dentry.
   445		 */
   446		dwords = buflen >> 2;
   447		fh_type = exportfs_encode_inode_fh(realinode, (void *)fh->fb.fid,
   448						   &dwords, NULL, 0);
   449		buflen = (dwords << 2);
   450	
   451		err = -EIO;
   452		if (fh_type < 0 || fh_type == FILEID_INVALID ||
   453		    WARN_ON(buflen > MAX_HANDLE_SZ))
   454			goto out_err;
   455	
   456		fh->fb.version = OVL_FH_VERSION;
   457		fh->fb.magic = OVL_FH_MAGIC;
   458		fh->fb.type = fh_type;
   459		fh->fb.flags = OVL_FH_FLAG_CPU_ENDIAN;
   460		/*
   461		 * When we will want to decode an overlay dentry from this handle
   462		 * and all layers are on the same fs, if we get a disconncted real
   463		 * dentry when we decode fid, the only way to tell if we should assign
   464		 * it to upperdentry or to lowerstack is by checking this flag.
   465		 */
   466		if (is_upper)
   467			fh->fb.flags |= OVL_FH_FLAG_PATH_UPPER;
   468		fh->fb.len = sizeof(fh->fb) + buflen;
   469		if (ovl_origin_uuid(ofs))
 > 470			fh->fb.uuid = *uuid;
   471	
   472		return fh;
   473	
   474	out_err:
   475		kfree(fh);
   476		return ERR_PTR(err);
   477	}
   478	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
