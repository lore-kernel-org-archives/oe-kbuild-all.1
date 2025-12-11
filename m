Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FC5205E3B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 19:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765480125; cv=none; b=OX0akwKmwcdAb9XA1scLGPzGyrvT1BBtPOpYhfCwE4hEzfEJU/uMcwX4yHHhit5g3NcDKSWfFNh1rG4Co+yOhimsv1V4UDRgSEQislznJ7l73RDDWXwsyJgudzl/SBjxuEacSGDo6xQiswZQ5DwBTsleerXt07TzZIVWfyDxYXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765480125; c=relaxed/simple;
	bh=iouRopf0nbgTJRkrG8Ev6E2nicULEDhUWUZ17QtsV+E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oKuLFFG/T9pmv1uxhvVAHjx7CwMtZCbSsnRpjScTzKOvMmXHuQm5rxw445M83Vxt3crx+2huu+CG+9DG7q9tA1jHBxyGrytJVISNlk0tq+jNjARn1h9qbEmr2rU1V5PmyyTS48hPadvr0mLUOgq0dP8zGdJFV5KVtNCOJRQjWAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c6ZcHe1T; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c6ZcHe1T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765480124; x=1797016124;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iouRopf0nbgTJRkrG8Ev6E2nicULEDhUWUZ17QtsV+E=;
  b=c6ZcHe1TNF5u/QUPKQr98IKriYytmplEGpCDYHWs/Iu4G1KuAs8plH01
   4BVudZOlkRlVQae3/IBvAKpCnqOkY7e4t3AkLlTqyR6f/PdaU8zA6VMcY
   DhOd7S7sIq2DLtk1/iCH46ql4UIFJBY8yR9/8duSHRq1zh1Jy4tod01dm
   dQGpaHla+RPRYhSTUuK2LxCPbEgVgiZiXiycOqatxYkD3ICLVmX8vH2jz
   R8vEkBMPjWKGaEtqHqygGODoY4d4wixNx6Ycmt0Ovnd9nEE400eAEpQgR
   nKkP5LX/PycmLh3t3b+NJcqPD8tKU3+/te9sNmy3YlNeNOD3cW3ektXTW
   A==;
X-CSE-ConnectionGUID: K62O3wEuRCyjBBUrlbTV2Q==
X-CSE-MsgGUID: cDX1icZySjurNiodCznI9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78935237"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="78935237"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 11:08:43 -0800
X-CSE-ConnectionGUID: OeGSUtRwTvaqvfw+5BC2+g==
X-CSE-MsgGUID: AZ2buaZJR1+u+JUJzsAKNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="196164309"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Dec 2025 11:08:42 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTm1n-000000004zl-3VNO;
	Thu, 11 Dec 2025 19:08:39 +0000
Date: Fri, 12 Dec 2025 03:08:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 40/40] fs/fuse/dir.c:845:1:
 warning: the frame size of 1376 bytes is larger than 1280 bytes
Message-ID: <202512120236.5R0dhrtN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   dd79c421671d7417fa9ad8465ca823298cd5fa14
commit: 523bfe85392c3996b9c84bb964ee0df3a50a91a3 [40/40] ANDROID: fuse-bpf: Align data structs for 32-bit kernels
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20251212/202512120236.5R0dhrtN-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512120236.5R0dhrtN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512120236.5R0dhrtN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/fuse/dir.c: In function 'fuse_create_open':
>> fs/fuse/dir.c:845:1: warning: the frame size of 1376 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     845 | }
         | ^
   fs/fuse/dir.c: In function 'fuse_do_setattr':
   fs/fuse/dir.c:2133:1: warning: the frame size of 1464 bytes is larger than 1280 bytes [-Wframe-larger-than=]
    2133 | }
         | ^


vim +845 fs/fuse/dir.c

57f3ff96489919 Daniel Rosenberg 2021-12-02  748  
07e77dca8a1f17 Miklos Szeredi   2010-12-07  749  	forget = fuse_alloc_forget();
c8ccbe032feb12 Miklos Szeredi   2012-06-05  750  	err = -ENOMEM;
07e77dca8a1f17 Miklos Szeredi   2010-12-07  751  	if (!forget)
c8ccbe032feb12 Miklos Szeredi   2012-06-05  752  		goto out_err;
51eb01e73599ef Miklos Szeredi   2006-06-25  753  
ce1d5a491f0ee5 Miklos Szeredi   2006-04-10  754  	err = -ENOMEM;
fcee216beb9c15 Max Reitz        2020-05-06  755  	ff = fuse_file_alloc(fm);
fd72faac95d7e4 Miklos Szeredi   2005-11-07  756  	if (!ff)
7078187a795f86 Miklos Szeredi   2014-12-12  757  		goto out_put_forget_req;
fd72faac95d7e4 Miklos Szeredi   2005-11-07  758  
fcee216beb9c15 Max Reitz        2020-05-06  759  	if (!fm->fc->dont_mask)
e0a43ddcc08c34 Miklos Szeredi   2009-06-30  760  		mode &= ~current_umask();
e0a43ddcc08c34 Miklos Szeredi   2009-06-30  761  
fd72faac95d7e4 Miklos Szeredi   2005-11-07  762  	flags &= ~O_NOCTTY;
fd72faac95d7e4 Miklos Szeredi   2005-11-07  763  	memset(&inarg, 0, sizeof(inarg));
0e9663ee452ffc Miklos Szeredi   2007-10-18  764  	memset(&outentry, 0, sizeof(outentry));
fd72faac95d7e4 Miklos Szeredi   2005-11-07  765  	inarg.flags = flags;
fd72faac95d7e4 Miklos Szeredi   2005-11-07  766  	inarg.mode = mode;
e0a43ddcc08c34 Miklos Szeredi   2009-06-30  767  	inarg.umask = current_umask();
643a666a89c358 Vivek Goyal      2020-10-09  768  
2fdbb8dd01556e Miklos Szeredi   2022-04-22  769  	if (fm->fc->handle_killpriv_v2 && trunc &&
643a666a89c358 Vivek Goyal      2020-10-09  770  	    !(flags & O_EXCL) && !capable(CAP_FSETID)) {
643a666a89c358 Vivek Goyal      2020-10-09  771  		inarg.open_flags |= FUSE_OPEN_KILL_SUIDGID;
643a666a89c358 Vivek Goyal      2020-10-09  772  	}
643a666a89c358 Vivek Goyal      2020-10-09  773  
7d37539037c2fc Miklos Szeredi   2022-09-24  774  	args.opcode = opcode;
d5b4854357f478 Miklos Szeredi   2019-09-10  775  	args.nodeid = get_node_id(dir);
d5b4854357f478 Miklos Szeredi   2019-09-10  776  	args.in_numargs = 2;
d5b4854357f478 Miklos Szeredi   2019-09-10  777  	args.in_args[0].size = sizeof(inarg);
d5b4854357f478 Miklos Szeredi   2019-09-10  778  	args.in_args[0].value = &inarg;
d5b4854357f478 Miklos Szeredi   2019-09-10  779  	args.in_args[1].size = entry->d_name.len + 1;
d5b4854357f478 Miklos Szeredi   2019-09-10  780  	args.in_args[1].value = entry->d_name.name;
d5b4854357f478 Miklos Szeredi   2019-09-10  781  	args.out_numargs = 2;
d5b4854357f478 Miklos Szeredi   2019-09-10  782  	args.out_args[0].size = sizeof(outentry);
d5b4854357f478 Miklos Szeredi   2019-09-10  783  	args.out_args[0].value = &outentry;
d5b4854357f478 Miklos Szeredi   2019-09-10  784  	args.out_args[1].size = sizeof(outopen);
d5b4854357f478 Miklos Szeredi   2019-09-10  785  	args.out_args[1].value = &outopen;
3e2b6fdbdc9ab5 Vivek Goyal      2021-11-11  786  
3e2b6fdbdc9ab5 Vivek Goyal      2021-11-11  787  	if (fm->fc->init_security) {
3e2b6fdbdc9ab5 Vivek Goyal      2021-11-11  788  		err = get_security_context(entry, mode, &security_ctx,
3e2b6fdbdc9ab5 Vivek Goyal      2021-11-11  789  					   &security_ctxlen);
3e2b6fdbdc9ab5 Vivek Goyal      2021-11-11  790  		if (err)
3e2b6fdbdc9ab5 Vivek Goyal      2021-11-11  791  			goto out_put_forget_req;
3e2b6fdbdc9ab5 Vivek Goyal      2021-11-11  792  
3e2b6fdbdc9ab5 Vivek Goyal      2021-11-11  793  		args.in_numargs = 3;
3e2b6fdbdc9ab5 Vivek Goyal      2021-11-11  794  		args.in_args[2].size = security_ctxlen;
3e2b6fdbdc9ab5 Vivek Goyal      2021-11-11  795  		args.in_args[2].value = security_ctx;
3e2b6fdbdc9ab5 Vivek Goyal      2021-11-11  796  	}
3e2b6fdbdc9ab5 Vivek Goyal      2021-11-11  797  
fcee216beb9c15 Max Reitz        2020-05-06  798  	err = fuse_simple_request(fm, &args);
3e2b6fdbdc9ab5 Vivek Goyal      2021-11-11  799  	kfree(security_ctx);
c8ccbe032feb12 Miklos Szeredi   2012-06-05  800  	if (err)
fd72faac95d7e4 Miklos Szeredi   2005-11-07  801  		goto out_free_ff;
fd72faac95d7e4 Miklos Szeredi   2005-11-07  802  
fd72faac95d7e4 Miklos Szeredi   2005-11-07  803  	err = -EIO;
eb59bd17d2fa6e Miklos Szeredi   2019-11-12  804  	if (!S_ISREG(outentry.attr.mode) || invalid_nodeid(outentry.nodeid) ||
eb59bd17d2fa6e Miklos Szeredi   2019-11-12  805  	    fuse_invalid_attr(&outentry.attr))
fd72faac95d7e4 Miklos Szeredi   2005-11-07  806  		goto out_free_ff;
fd72faac95d7e4 Miklos Szeredi   2005-11-07  807  
c7b7143c6342b8 Miklos Szeredi   2009-04-28  808  	ff->fh = outopen.fh;
c7b7143c6342b8 Miklos Szeredi   2009-04-28  809  	ff->nodeid = outentry.nodeid;
c7b7143c6342b8 Miklos Szeredi   2009-04-28  810  	ff->open_flags = outopen.open_flags;
abbb00d5ae3f6f Alessio Balsini  2021-01-25  811  	fuse_passthrough_setup(fc, ff, &outopen);
fd72faac95d7e4 Miklos Szeredi   2005-11-07  812  	inode = fuse_iget(dir->i_sb, outentry.nodeid, outentry.generation,
1fb69e7817296d Miklos Szeredi   2007-10-18  813  			  &outentry.attr, entry_attr_timeout(&outentry), 0);
fd72faac95d7e4 Miklos Szeredi   2005-11-07  814  	if (!inode) {
fd72faac95d7e4 Miklos Szeredi   2005-11-07  815  		flags &= ~(O_CREAT | O_EXCL | O_TRUNC);
ebf84d0c7220c7 Kirill Tkhai     2018-11-09  816  		fuse_sync_release(NULL, ff, flags);
fcee216beb9c15 Max Reitz        2020-05-06  817  		fuse_queue_forget(fm->fc, forget, outentry.nodeid, 1);
c8ccbe032feb12 Miklos Szeredi   2012-06-05  818  		err = -ENOMEM;
c8ccbe032feb12 Miklos Szeredi   2012-06-05  819  		goto out_err;
fd72faac95d7e4 Miklos Szeredi   2005-11-07  820  	}
07e77dca8a1f17 Miklos Szeredi   2010-12-07  821  	kfree(forget);
fd72faac95d7e4 Miklos Szeredi   2005-11-07  822  	d_instantiate(entry, inode);
1fb69e7817296d Miklos Szeredi   2007-10-18  823  	fuse_change_entry_timeout(entry, &outentry);
261aaba72fdba1 Miklos Szeredi   2018-10-01  824  	fuse_dir_changed(dir);
be12af3ef5e61e Al Viro          2018-06-08  825  	err = finish_open(file, entry, generic_file_open);
30d904947459cc Al Viro          2012-06-22  826  	if (err) {
ebf84d0c7220c7 Kirill Tkhai     2018-11-09  827  		fi = get_fuse_inode(inode);
ebf84d0c7220c7 Kirill Tkhai     2018-11-09  828  		fuse_sync_release(fi, ff, flags);
c8ccbe032feb12 Miklos Szeredi   2012-06-05  829  	} else {
267d84449f5234 Miklos Szeredi   2017-02-22  830  		file->private_data = ff;
c7b7143c6342b8 Miklos Szeredi   2009-04-28  831  		fuse_finish_open(inode, file);
2fdbb8dd01556e Miklos Szeredi   2022-04-22  832  		if (fm->fc->atomic_o_trunc && trunc)
2fdbb8dd01556e Miklos Szeredi   2022-04-22  833  			truncate_pagecache(inode, 0);
2fdbb8dd01556e Miklos Szeredi   2022-04-22  834  		else if (!(ff->open_flags & FOPEN_KEEP_CACHE))
2fdbb8dd01556e Miklos Szeredi   2022-04-22  835  			invalidate_inode_pages2(inode->i_mapping);
c8ccbe032feb12 Miklos Szeredi   2012-06-05  836  	}
d95852777bc8ba Al Viro          2012-06-22  837  	return err;
fd72faac95d7e4 Miklos Szeredi   2005-11-07  838  
fd72faac95d7e4 Miklos Szeredi   2005-11-07  839  out_free_ff:
fd72faac95d7e4 Miklos Szeredi   2005-11-07  840  	fuse_file_free(ff);
51eb01e73599ef Miklos Szeredi   2006-06-25  841  out_put_forget_req:
07e77dca8a1f17 Miklos Szeredi   2010-12-07  842  	kfree(forget);
c8ccbe032feb12 Miklos Szeredi   2012-06-05  843  out_err:
d95852777bc8ba Al Viro          2012-06-22  844  	return err;
c8ccbe032feb12 Miklos Szeredi   2012-06-05 @845  }
c8ccbe032feb12 Miklos Szeredi   2012-06-05  846  

:::::: The code at line 845 was first introduced by commit
:::::: c8ccbe032feb127a977c66865cb63d72d9a6e08b fuse: implement i_op->atomic_open()

:::::: TO: Miklos Szeredi <mszeredi@suse.cz>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
