Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B365427453
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Oct 2025 05:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761282544; cv=none; b=JRxMXtHsab7Mb9M37SO08oxoWm2Z1m7+M4VajD8962F9JYlDBMNbAiUTUnIkbmc49l5DCzQuYdA32JU/D3PI3dv/JHRUCxcaMHtoDGSppZYGWiGflv56Av9bFgwUSu6WBfM0KoDLONlIoJHtcpx6BeW7u1gJCQQfanJ+tD5TzAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761282544; c=relaxed/simple;
	bh=iASo06Y3gzmCmUAQ72Jn9dJ2CX0Dz17u4CkmHOTK4Ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TV3tVErBGeJl/69p2Ewl611bDyP01ywSZNpTqhe/SQWr1cnuQ5R3CwknjvJMmCPGgEHs2E5dO/LiTP9vnh9XVykxK5xltva2XsSAwBEacD2OgkVLI3lylcoOZ9bpeiz1QTtBBV7ogstSMlNlC7oK/RWdScteObJr5VA4AUybUhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aLvdTJ9v; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aLvdTJ9v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761282543; x=1792818543;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iASo06Y3gzmCmUAQ72Jn9dJ2CX0Dz17u4CkmHOTK4Ng=;
  b=aLvdTJ9vTV85//kMV52yaOaKqAUgFoa3+fC3xj89f+EgbT9Vp23keWgf
   Ak7I2zFRSYcZ6YE0T0SO0rSZFF4Hd6Frx0nTnV4j28vYPnlGHWV7ai8yO
   GQouNopflH1QazFORPttWN1qPDeLtE4ojrrYH1+2zJSQMWHHgOjA1IcqC
   c4MqDOE++MzF6iziDRWwN+MRbPDy7k1/Mo6PCNvqZssLzzS6GLC0tMOxW
   r9nOObYR/vKvWfzKNktV9lNKAyC+RDb4UFsbWEqqFZUjFf2Ae6LJP51CT
   Id2Gc3YEWV1Zz47TYu+nQEntks8KmPH86nmyNRYTrKXNDLvhZc6bED9A6
   Q==;
X-CSE-ConnectionGUID: LyyChLuiTuO92MSndxR+xg==
X-CSE-MsgGUID: d5f5ZDG4RSOP8AV03YnSow==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66078032"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="66078032"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 22:09:02 -0700
X-CSE-ConnectionGUID: pXamyZwLQ3iX5+Dd14qcrw==
X-CSE-MsgGUID: +DF8+VTURcGsb8s9cWPP5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="184411895"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 23 Oct 2025 22:09:01 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCA2b-000ECX-1U;
	Fri, 24 Oct 2025 05:08:42 +0000
Date: Fri, 24 Oct 2025 13:07:57 +0800
From: kernel test robot <lkp@intel.com>
To: Hongbo Li <lihongbo22@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v7 4/7] erofs: introduce the page cache share feature
Message-ID: <202510241244.lndKTL3v-lkp@intel.com>
References: <20251021104815.70662-5-lihongbo22@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021104815.70662-5-lihongbo22@huawei.com>

Hi Hongbo,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on xiang-erofs/dev-test]
[also build test WARNING on xiang-erofs/dev xiang-erofs/fixes linus/master v6.18-rc2 next-20251023]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hongbo-Li/erofs-move-struct-erofs_anon_fs_type-to-super-c/20251021-192154
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev-test
patch link:    https://lore.kernel.org/r/20251021104815.70662-5-lihongbo22%40huawei.com
patch subject: [PATCH RFC v7 4/7] erofs: introduce the page cache share feature
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20251024/202510241244.lndKTL3v-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project e1ae12640102fd2b05bc567243580f90acb1135f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251024/202510241244.lndKTL3v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510241244.lndKTL3v-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/erofs/ishare.c:117:46: warning: variable 'hash' is uninitialized when used here [-Wuninitialized]
     117 |                      ishare_vlen + strlen(sbi->domain_id), hash);
         |                                                            ^~~~
   fs/erofs/ishare.c:90:20: note: initialize the variable 'hash' to silence this warning
      90 |         unsigned long hash;
         |                           ^
         |                            = 0
   1 warning generated.


vim +/hash +117 fs/erofs/ishare.c

    78	
    79	bool erofs_ishare_fill_inode(struct inode *inode)
    80	{
    81		struct erofs_inode *vi = EROFS_I(inode);
    82		struct erofs_sb_info *sbi = EROFS_SB(inode->i_sb);
    83		struct inode *idedup;
    84		/*
    85		 * fingerprint layout:
    86		 * fingerprint length + fingerprint content (xattr_value + domain_id)
    87		 */
    88		char *ishare_key = sbi->ishare_key, *fingerprint;
    89		ssize_t ishare_vlen;
    90		unsigned long hash;
    91		int key_idx;
    92	
    93		if (!sbi->domain_id || !ishare_key)
    94			return false;
    95	
    96		key_idx = sbi->ishare_key_idx;
    97		ishare_vlen = erofs_getxattr(inode, key_idx, ishare_key, NULL, 0);
    98		if (ishare_vlen <= 0 || ishare_vlen > (1 << sbi->blkszbits))
    99			return false;
   100	
   101		fingerprint = kmalloc(sizeof(ssize_t) + ishare_vlen +
   102				      strlen(sbi->domain_id), GFP_KERNEL);
   103		if (!fingerprint)
   104			return false;
   105	
   106		*(ssize_t *)fingerprint = ishare_vlen + strlen(sbi->domain_id);
   107		if (ishare_vlen != erofs_getxattr(inode, key_idx, ishare_key,
   108						  fingerprint + sizeof(ssize_t),
   109						  ishare_vlen)) {
   110			kfree(fingerprint);
   111			return false;
   112		}
   113	
   114		memcpy(fingerprint + sizeof(ssize_t) + ishare_vlen,
   115		       sbi->domain_id, strlen(sbi->domain_id));
   116		hash = xxh32(fingerprint + sizeof(ssize_t),
 > 117			     ishare_vlen + strlen(sbi->domain_id), hash);
   118		idedup = iget5_locked(erofs_ishare_mnt->mnt_sb, hash,
   119				      erofs_ishare_iget5_eq, erofs_ishare_iget5_set,
   120				      fingerprint);
   121		if (!idedup) {
   122			kfree(fingerprint);
   123			return false;
   124		}
   125	
   126		INIT_LIST_HEAD(&vi->backing_link);
   127		vi->ishare = idedup;
   128		spin_lock(&EROFS_I(idedup)->lock);
   129		list_add(&vi->backing_link, &EROFS_I(idedup)->backing_head);
   130		spin_unlock(&EROFS_I(idedup)->lock);
   131	
   132		if (!(idedup->i_state & I_NEW)) {
   133			kfree(fingerprint);
   134			return true;
   135		}
   136	
   137		if (erofs_inode_is_data_compressed(vi->datalayout))
   138			idedup->i_mapping->a_ops = &z_erofs_aops;
   139		else
   140			idedup->i_mapping->a_ops = &erofs_aops;
   141		idedup->i_mode = vi->vfs_inode.i_mode;
   142		i_size_write(idedup, vi->vfs_inode.i_size);
   143		unlock_new_inode(idedup);
   144		return true;
   145	}
   146	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
