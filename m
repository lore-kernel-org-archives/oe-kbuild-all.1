Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDEC1A00D1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Oct 2024 17:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728667353; cv=none; b=UoBewE4gZ+LO0CTA1DqhOC1OcN9P60MaPOMHg5JgpYon6Obol3fFe3R1F1/qU6I3Q8mww+dYCZ3wOH/jDzIoBy+2cRTZBG1MhiZ4Y9zrU1AGgpC6m4qyzSi493XOwjzy354fGydJiDbynnyRCEaF6o/wgtWgABTgD5LJokX9zP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728667353; c=relaxed/simple;
	bh=ZRGn9ZMRubadPwwszlalSjPQIYZfwGqg6hKf0vj4NRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cOkBNDM5yg55qe2178CpXSZ61uX2N2qCb2DFV3WHSEQdK2h9+8UvdOjvpC9NeuXu89Ib3vRsCROqAynhLtKAvqnUYHDkHjCI62LkGqwi1ONHD1mpD0ZKiobBHk5Ix5PQF2n15kSSqkOrb8rndRE2wCSMW5Jq/i2AnXcxgQcZzjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I9LPxpsV; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I9LPxpsV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728667352; x=1760203352;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZRGn9ZMRubadPwwszlalSjPQIYZfwGqg6hKf0vj4NRg=;
  b=I9LPxpsVDLkwvErVph5tA7zzVV18XVTe8PKI999sec4+Kc9R6y/c0aQb
   GWYb6kJ36P5kRgE16k/eeJ5+4lg3La9y48OzzxObptHNUw9XUBIU9Lzv9
   pwUMorAY4NQgc0eeD4j6JF6873a5OZ1nP1a/x4jSse0XVmIosCG4hVCl6
   5oiDqoDP9kJE4aJcXWT8jkb8WeXz+7GMRqJuijXKHRLae3Z73yGUn5aP6
   il6jfpiGGZfwjtLTkLb054mOELqSqMHbszxC93e2Qd+LSCpocLGKCDu9r
   u/t7JFXqMF4CX3/MkN74e67Iioy9lMq8LT5vog/2/BNGZwO98yxwPm/hr
   A==;
X-CSE-ConnectionGUID: q2rLdBSuQb+hQwNZttmILA==
X-CSE-MsgGUID: aYmulUeIQNOnP/8X7JnLUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39201394"
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; 
   d="scan'208";a="39201394"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 10:22:31 -0700
X-CSE-ConnectionGUID: uxUXqIA+RZGaOsJi8QqXYg==
X-CSE-MsgGUID: FwlL115JQNuy5I2WyP8+cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; 
   d="scan'208";a="81584234"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Oct 2024 10:22:29 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szJLP-000CYt-0J;
	Fri, 11 Oct 2024 17:22:27 +0000
Date: Sat, 12 Oct 2024 01:21:54 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 1/3] fs: prepare for "explicit connectable" file
 handles
Message-ID: <202410112259.QfHlqgCD-lkp@intel.com>
References: <20241008152118.453724-2-amir73il@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008152118.453724-2-amir73il@gmail.com>

Hi Amir,

kernel test robot noticed the following build errors:

[auto build test ERROR on brauner-vfs/vfs.all]
[also build test ERROR on linus/master v6.12-rc2 next-20241011]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Amir-Goldstein/fs-prepare-for-explicit-connectable-file-handles/20241008-232246
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20241008152118.453724-2-amir73il%40gmail.com
patch subject: [PATCH v3 1/3] fs: prepare for "explicit connectable" file handles
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20241011/202410112259.QfHlqgCD-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241011/202410112259.QfHlqgCD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410112259.QfHlqgCD-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/exportfs/expfs.c: In function 'exportfs_decode_fh_raw':
>> fs/exportfs/expfs.c:447:24: error: returning 'int' from a function with return type 'struct dentry *' makes pointer from integer without a cast [-Wint-conversion]
     447 |                 return -EINVAL;
         |                        ^


vim +447 fs/exportfs/expfs.c

   434	
   435	struct dentry *
   436	exportfs_decode_fh_raw(struct vfsmount *mnt, struct fid *fid, int fh_len,
   437			       int fileid_type, unsigned int flags,
   438			       int (*acceptable)(void *, struct dentry *),
   439			       void *context)
   440	{
   441		const struct export_operations *nop = mnt->mnt_sb->s_export_op;
   442		struct dentry *result, *alias;
   443		char nbuf[NAME_MAX+1];
   444		int err;
   445	
   446		if (WARN_ON_ONCE(FILEID_USER_FLAGS(fileid_type)))
 > 447			return -EINVAL;
   448	
   449		/*
   450		 * Try to get any dentry for the given file handle from the filesystem.
   451		 */
   452		if (!exportfs_can_decode_fh(nop))
   453			return ERR_PTR(-ESTALE);
   454		result = nop->fh_to_dentry(mnt->mnt_sb, fid, fh_len, fileid_type);
   455		if (IS_ERR_OR_NULL(result))
   456			return result;
   457	
   458		if ((flags & EXPORT_FH_DIR_ONLY) && !d_is_dir(result)) {
   459			err = -ENOTDIR;
   460			goto err_result;
   461		}
   462	
   463		/*
   464		 * If no acceptance criteria was specified by caller, a disconnected
   465		 * dentry is also accepatable. Callers may use this mode to query if
   466		 * file handle is stale or to get a reference to an inode without
   467		 * risking the high overhead caused by directory reconnect.
   468		 */
   469		if (!acceptable)
   470			return result;
   471	
   472		if (d_is_dir(result)) {
   473			/*
   474			 * This request is for a directory.
   475			 *
   476			 * On the positive side there is only one dentry for each
   477			 * directory inode.  On the negative side this implies that we
   478			 * to ensure our dentry is connected all the way up to the
   479			 * filesystem root.
   480			 */
   481			if (result->d_flags & DCACHE_DISCONNECTED) {
   482				err = reconnect_path(mnt, result, nbuf);
   483				if (err)
   484					goto err_result;
   485			}
   486	
   487			if (!acceptable(context, result)) {
   488				err = -EACCES;
   489				goto err_result;
   490			}
   491	
   492			return result;
   493		} else {
   494			/*
   495			 * It's not a directory.  Life is a little more complicated.
   496			 */
   497			struct dentry *target_dir, *nresult;
   498	
   499			/*
   500			 * See if either the dentry we just got from the filesystem
   501			 * or any alias for it is acceptable.  This is always true
   502			 * if this filesystem is exported without the subtreecheck
   503			 * option.  If the filesystem is exported with the subtree
   504			 * check option there's a fair chance we need to look at
   505			 * the parent directory in the file handle and make sure
   506			 * it's connected to the filesystem root.
   507			 */
   508			alias = find_acceptable_alias(result, acceptable, context);
   509			if (alias)
   510				return alias;
   511	
   512			/*
   513			 * Try to extract a dentry for the parent directory from the
   514			 * file handle.  If this fails we'll have to give up.
   515			 */
   516			err = -ESTALE;
   517			if (!nop->fh_to_parent)
   518				goto err_result;
   519	
   520			target_dir = nop->fh_to_parent(mnt->mnt_sb, fid,
   521					fh_len, fileid_type);
   522			if (!target_dir)
   523				goto err_result;
   524			err = PTR_ERR(target_dir);
   525			if (IS_ERR(target_dir))
   526				goto err_result;
   527	
   528			/*
   529			 * And as usual we need to make sure the parent directory is
   530			 * connected to the filesystem root.  The VFS really doesn't
   531			 * like disconnected directories..
   532			 */
   533			err = reconnect_path(mnt, target_dir, nbuf);
   534			if (err) {
   535				dput(target_dir);
   536				goto err_result;
   537			}
   538	
   539			/*
   540			 * Now that we've got both a well-connected parent and a
   541			 * dentry for the inode we're after, make sure that our
   542			 * inode is actually connected to the parent.
   543			 */
   544			err = exportfs_get_name(mnt, target_dir, nbuf, result);
   545			if (err) {
   546				dput(target_dir);
   547				goto err_result;
   548			}
   549	
   550			inode_lock(target_dir->d_inode);
   551			nresult = lookup_one(mnt_idmap(mnt), nbuf,
   552					     target_dir, strlen(nbuf));
   553			if (!IS_ERR(nresult)) {
   554				if (unlikely(nresult->d_inode != result->d_inode)) {
   555					dput(nresult);
   556					nresult = ERR_PTR(-ESTALE);
   557				}
   558			}
   559			inode_unlock(target_dir->d_inode);
   560			/*
   561			 * At this point we are done with the parent, but it's pinned
   562			 * by the child dentry anyway.
   563			 */
   564			dput(target_dir);
   565	
   566			if (IS_ERR(nresult)) {
   567				err = PTR_ERR(nresult);
   568				goto err_result;
   569			}
   570			dput(result);
   571			result = nresult;
   572	
   573			/*
   574			 * And finally make sure the dentry is actually acceptable
   575			 * to NFSD.
   576			 */
   577			alias = find_acceptable_alias(result, acceptable, context);
   578			if (!alias) {
   579				err = -EACCES;
   580				goto err_result;
   581			}
   582	
   583			return alias;
   584		}
   585	
   586	 err_result:
   587		dput(result);
   588		return ERR_PTR(err);
   589	}
   590	EXPORT_SYMBOL_GPL(exportfs_decode_fh_raw);
   591	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
