Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEB81A8403
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Mar 2025 17:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741456162; cv=none; b=JxbASw99RM2udZkHvj8ERxBM/cMIgj8fWCvcuHAGHuMqGXmSYzDvwtDH+zGeXfhztPkfFFO+U4HGCowWi45JhP1Gqc184qlZlAb3tywaBpgwQY15MiK06gJxZKyjw8V2VQ5vs4zv3GHRBsbYYHTuH9rTi6mzJdaHrEaVJj8HgCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741456162; c=relaxed/simple;
	bh=Ypi6Aw7wwo4D6Jf4Yrikw9csNybbxJJdQALqB124PCM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L4+8LldacKOVbno0lWKeyKuePzXfftMEBy2KBODH+LZ7N2Gwsifr0tfQTQFbsp8UNqBPnb1dFeRTaE62zre69EwA1bmocChAqLoDu5tHfoMlmZreGym2GEoSeX2sjctAwfSZ3SkGRLVE/J4gZdMmv7nLVcS00Ioa04VrwzD03es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dTtb+M7q; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dTtb+M7q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741456160; x=1772992160;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ypi6Aw7wwo4D6Jf4Yrikw9csNybbxJJdQALqB124PCM=;
  b=dTtb+M7q6eT+sq/LUDqB264EjfA2l8PY+67eQYT3KNdjikLUpqG7IbO+
   fS8Rm/Qn6WamtkHnqYG8W1jRsZX3XtFLqT0rhyWofC4Yh1X9Dys7fuzrB
   TWvKqa3PFDCRUw2rjKHE+LoGs8W3QVNlMflhBKEoujeUZc1RHYwi0BKzV
   AfeViNCIMeTi6HD3xWLGg9WJgzJxZcbV5qgjWhSmRLBAydtlLggvREjri
   goQ6d3siS5FHxVYlY6wHmIQi9siGkygNidski4+jr+79e3LRIflauyHdm
   Y8GMYASA9A2yC2ZYcsKNjjsjo2wtTDiiiYrOg1PHGUNFXU1nPYl1WNnsu
   g==;
X-CSE-ConnectionGUID: uxpNMmtfSe27iohHCD8ktA==
X-CSE-MsgGUID: I9IzETA1QIGrPxUjT6N71A==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="42368917"
X-IronPort-AV: E=Sophos;i="6.14,232,1736841600"; 
   d="scan'208";a="42368917"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 09:49:19 -0800
X-CSE-ConnectionGUID: gwABnO51ThGJlsWHgufNYA==
X-CSE-MsgGUID: aPTlnjheTDuSpFq15SMMzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,232,1736841600"; 
   d="scan'208";a="124677978"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 08 Mar 2025 09:49:17 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqyIV-00029Z-2L;
	Sat, 08 Mar 2025 17:49:15 +0000
Date: Sun, 9 Mar 2025 01:48:18 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:nfsd-tracepoints 8/9] fs/nfsd/nfsproc.c:295:9: error:
 implicit declaration of function 'trace_nfsd_proc_create'; did you mean
 'nfsd_proc_create'?
Message-ID: <202503090147.Fh1mdmij-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git nfsd-tracepoints
head:   7162c90c3e04a073c111a5821e529377ce2ab43f
commit: f1681c62918a99afaf3528b5332aa647740eb818 [8/9] nfsd: add tracepoints around nfsd_create events
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250309/202503090147.Fh1mdmij-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250309/202503090147.Fh1mdmij-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503090147.Fh1mdmij-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/nfsd/nfsproc.c: In function 'nfsd_proc_create':
>> fs/nfsd/nfsproc.c:295:9: error: implicit declaration of function 'trace_nfsd_proc_create'; did you mean 'nfsd_proc_create'? [-Wimplicit-function-declaration]
     295 |         trace_nfsd_proc_create(rqstp, dirfhp, S_IFREG, argp->name, argp->len);
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         nfsd_proc_create
   fs/nfsd/nfsproc.c: In function 'nfsd_proc_mkdir':
>> fs/nfsd/nfsproc.c:550:9: error: implicit declaration of function 'trace_nfsd_proc_mkdir'; did you mean 'nfsd_proc_mkdir'? [-Wimplicit-function-declaration]
     550 |         trace_nfsd_proc_mkdir(rqstp, &argp->fh, S_IFDIR, argp->name, argp->len);
         |         ^~~~~~~~~~~~~~~~~~~~~
         |         nfsd_proc_mkdir


vim +295 fs/nfsd/nfsproc.c

   271	
   272	/*
   273	 * CREATE processing is complicated. The keyword here is `overloaded.'
   274	 * The parent directory is kept locked between the check for existence
   275	 * and the actual create() call in compliance with VFS protocols.
   276	 * N.B. After this call _both_ argp->fh and resp->fh need an fh_put
   277	 */
   278	static __be32
   279	nfsd_proc_create(struct svc_rqst *rqstp)
   280	{
   281		struct nfsd_createargs *argp = rqstp->rq_argp;
   282		struct nfsd_diropres *resp = rqstp->rq_resp;
   283		svc_fh		*dirfhp = &argp->fh;
   284		svc_fh		*newfhp = &resp->fh;
   285		struct iattr	*attr = &argp->attrs;
   286		struct nfsd_attrs attrs = {
   287			.na_iattr	= attr,
   288		};
   289		struct inode	*inode;
   290		struct dentry	*dchild;
   291		int		type, mode;
   292		int		hosterr;
   293		dev_t		rdev = 0, wanted = new_decode_dev(attr->ia_size);
   294	
 > 295		trace_nfsd_proc_create(rqstp, dirfhp, S_IFREG, argp->name, argp->len);
   296	
   297		/* First verify the parent file handle */
   298		resp->status = fh_verify(rqstp, dirfhp, S_IFDIR, NFSD_MAY_EXEC);
   299		if (resp->status != nfs_ok)
   300			goto done; /* must fh_put dirfhp even on error */
   301	
   302		/* Check for NFSD_MAY_WRITE in nfsd_create if necessary */
   303	
   304		resp->status = nfserr_exist;
   305		if (isdotent(argp->name, argp->len))
   306			goto done;
   307		hosterr = fh_want_write(dirfhp);
   308		if (hosterr) {
   309			resp->status = nfserrno(hosterr);
   310			goto done;
   311		}
   312	
   313		inode_lock_nested(dirfhp->fh_dentry->d_inode, I_MUTEX_PARENT);
   314		dchild = lookup_one_len(argp->name, dirfhp->fh_dentry, argp->len);
   315		if (IS_ERR(dchild)) {
   316			resp->status = nfserrno(PTR_ERR(dchild));
   317			goto out_unlock;
   318		}
   319		fh_init(newfhp, NFS_FHSIZE);
   320		resp->status = fh_compose(newfhp, dirfhp->fh_export, dchild, dirfhp);
   321		if (!resp->status && d_really_is_negative(dchild))
   322			resp->status = nfserr_noent;
   323		dput(dchild);
   324		if (resp->status) {
   325			if (resp->status != nfserr_noent)
   326				goto out_unlock;
   327			/*
   328			 * If the new file handle wasn't verified, we can't tell
   329			 * whether the file exists or not. Time to bail ...
   330			 */
   331			resp->status = nfserr_acces;
   332			if (!newfhp->fh_dentry) {
   333				printk(KERN_WARNING 
   334					"nfsd_proc_create: file handle not verified\n");
   335				goto out_unlock;
   336			}
   337		}
   338	
   339		inode = d_inode(newfhp->fh_dentry);
   340	
   341		/* Unfudge the mode bits */
   342		if (attr->ia_valid & ATTR_MODE) {
   343			type = attr->ia_mode & S_IFMT;
   344			mode = attr->ia_mode & ~S_IFMT;
   345			if (!type) {
   346				/* no type, so if target exists, assume same as that,
   347				 * else assume a file */
   348				if (inode) {
   349					type = inode->i_mode & S_IFMT;
   350					switch(type) {
   351					case S_IFCHR:
   352					case S_IFBLK:
   353						/* reserve rdev for later checking */
   354						rdev = inode->i_rdev;
   355						attr->ia_valid |= ATTR_SIZE;
   356	
   357						fallthrough;
   358					case S_IFIFO:
   359						/* this is probably a permission check..
   360						 * at least IRIX implements perm checking on
   361						 *   echo thing > device-special-file-or-pipe
   362						 * by doing a CREATE with type==0
   363						 */
   364						resp->status = nfsd_permission(
   365							&rqstp->rq_cred,
   366							newfhp->fh_export,
   367							newfhp->fh_dentry,
   368							NFSD_MAY_WRITE|NFSD_MAY_LOCAL_ACCESS);
   369						if (resp->status && resp->status != nfserr_rofs)
   370							goto out_unlock;
   371					}
   372				} else
   373					type = S_IFREG;
   374			}
   375		} else if (inode) {
   376			type = inode->i_mode & S_IFMT;
   377			mode = inode->i_mode & ~S_IFMT;
   378		} else {
   379			type = S_IFREG;
   380			mode = 0;	/* ??? */
   381		}
   382	
   383		attr->ia_valid |= ATTR_MODE;
   384		attr->ia_mode = mode;
   385	
   386		/* Special treatment for non-regular files according to the
   387		 * gospel of sun micro
   388		 */
   389		if (type != S_IFREG) {
   390			if (type != S_IFBLK && type != S_IFCHR) {
   391				rdev = 0;
   392			} else if (type == S_IFCHR && !(attr->ia_valid & ATTR_SIZE)) {
   393				/* If you think you've seen the worst, grok this. */
   394				type = S_IFIFO;
   395			} else {
   396				/* Okay, char or block special */
   397				if (!rdev)
   398					rdev = wanted;
   399			}
   400	
   401			/* we've used the SIZE information, so discard it */
   402			attr->ia_valid &= ~ATTR_SIZE;
   403	
   404			/* Make sure the type and device matches */
   405			resp->status = nfserr_exist;
   406			if (inode && inode_wrong_type(inode, type))
   407				goto out_unlock;
   408		}
   409	
   410		resp->status = nfs_ok;
   411		if (!inode) {
   412			/* File doesn't exist. Create it and set attrs */
   413			resp->status = nfsd_create_locked(rqstp, dirfhp, &attrs, type,
   414							  rdev, newfhp);
   415		} else if (type == S_IFREG) {
   416			dprintk("nfsd:   existing %s, valid=%x, size=%ld\n",
   417				argp->name, attr->ia_valid, (long) attr->ia_size);
   418			/* File already exists. We ignore all attributes except
   419			 * size, so that creat() behaves exactly like
   420			 * open(..., O_CREAT|O_TRUNC|O_WRONLY).
   421			 */
   422			attr->ia_valid &= ATTR_SIZE;
   423			if (attr->ia_valid)
   424				resp->status = nfsd_setattr(rqstp, newfhp, &attrs,
   425							    NULL);
   426		}
   427	
   428	out_unlock:
   429		inode_unlock(dirfhp->fh_dentry->d_inode);
   430		fh_drop_write(dirfhp);
   431	done:
   432		fh_put(dirfhp);
   433		if (resp->status != nfs_ok)
   434			goto out;
   435		resp->status = fh_getattr(&resp->fh, &resp->stat);
   436	out:
   437		resp->status = nfsd_map_status(resp->status);
   438		return rpc_success;
   439	}
   440	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
