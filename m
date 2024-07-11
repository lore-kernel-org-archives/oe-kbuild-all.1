Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E9B8801
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 01:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720663142; cv=none; b=KByFr44dCZ95MbEeNoeVAu6c7Atsibq8VFD+DuKNM/SXVJGHgm6xeXJOzPxMeiIp7p0nlcWefZy6A9vLjbxBebKgldD8ow4QL46/4onIpZJy4I/XDmXj0xQMXb1s2/oO8eKXrrVdHm15Pvvu/HdyZim7PCBmrWyYejP1/tUrnSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720663142; c=relaxed/simple;
	bh=GkSwVbJLCroCOWwhk82aUKIdiGuXx1qGHLpRtOdhEzE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eaGTdruN4yG9IRksASrEeDttP/RNmvvgVeTqZHpjPHBXt9ArB+Z8491AqoQ/65UORFtT3Gi1rgLIt3sMqiGXL6DdaUm0Flcqr2H6CuMHRwV4r6KqWg6VSmmx4mSmAySufQwSPv51+47aBGoEENtxV/l0WTn6J6PZjkQS6CcuMkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dI7Zy/o5; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dI7Zy/o5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720663139; x=1752199139;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GkSwVbJLCroCOWwhk82aUKIdiGuXx1qGHLpRtOdhEzE=;
  b=dI7Zy/o5lpKMphB+4k4QKHoyn5dZuYQS3+IyTKKWy/JS0bNQFHPDRUgP
   DuRbAvJjwjuv6ndXd3mdAqYL6vheKbUBvxCVErOMFYO/DRkE44IznMNQi
   WrnuLCcDW0eOff80ces/um5+uJU5eJmSXFtEOA3W3yPQDMd0DypjJA3ei
   D9iRq8vSd5JIfHamytXXXUQtHu+09GZhWoldgj5ibK5lT20tUBIOUrGv7
   BoSmhyS53G50yPLS2DGDuLqO7Qz0m1UmvD4JFCUQ6rnJYhP3d0HCctLmW
   FyZd/ZT/Y+y6isv12qbza0Z+fP21BoyMXiaJ60W7fihLcRICsTBLA+411
   w==;
X-CSE-ConnectionGUID: gvWZVRxqSbSBgGIGbLhmPg==
X-CSE-MsgGUID: fmWeIsE8Q+W5jQdVFXmAzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="18229776"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="18229776"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 18:58:59 -0700
X-CSE-ConnectionGUID: 55g2xPBFR4u91vJwIQqjpw==
X-CSE-MsgGUID: KiVqo/BCTO6ZPYI4t57U4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="53226365"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Jul 2024 18:58:58 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRj5D-000Yc6-29;
	Thu, 11 Jul 2024 01:58:55 +0000
Date: Thu, 11 Jul 2024 09:58:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 24595/28418] fs/fuse/dir.c:846:1:
 warning: the frame size of 1384 bytes is larger than 1280 bytes
Message-ID: <202407110952.S0YD38FL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   2b49e96b31aab859640caa916af2a16cf41f27b4
commit: 622c1418102486df2d2fcbdbf8fd21acadb975ab [24595/28418] ANDROID: fuse-bpf: Align data structs for 32-bit kernels
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20240711/202407110952.S0YD38FL-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407110952.S0YD38FL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407110952.S0YD38FL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/fuse/dir.c: In function 'fuse_create_open':
>> fs/fuse/dir.c:846:1: warning: the frame size of 1384 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     846 | }
         | ^
   fs/fuse/dir.c: In function 'fuse_do_setattr':
   fs/fuse/dir.c:2128:1: warning: the frame size of 1472 bytes is larger than 1280 bytes [-Wframe-larger-than=]
    2128 | }
         | ^


vim +846 fs/fuse/dir.c

f5f4199c102aa6 Daniel Rosenberg 2021-12-02  749  
07e77dca8a1f17 Miklos Szeredi   2010-12-07  750  	forget = fuse_alloc_forget();
c8ccbe032feb12 Miklos Szeredi   2012-06-05  751  	err = -ENOMEM;
07e77dca8a1f17 Miklos Szeredi   2010-12-07  752  	if (!forget)
c8ccbe032feb12 Miklos Szeredi   2012-06-05  753  		goto out_err;
51eb01e73599ef Miklos Szeredi   2006-06-25  754  
ce1d5a491f0ee5 Miklos Szeredi   2006-04-10  755  	err = -ENOMEM;
fcee216beb9c15 Max Reitz        2020-05-06  756  	ff = fuse_file_alloc(fm);
fd72faac95d7e4 Miklos Szeredi   2005-11-07  757  	if (!ff)
7078187a795f86 Miklos Szeredi   2014-12-12  758  		goto out_put_forget_req;
fd72faac95d7e4 Miklos Szeredi   2005-11-07  759  
fcee216beb9c15 Max Reitz        2020-05-06  760  	if (!fm->fc->dont_mask)
e0a43ddcc08c34 Miklos Szeredi   2009-06-30  761  		mode &= ~current_umask();
e0a43ddcc08c34 Miklos Szeredi   2009-06-30  762  
fd72faac95d7e4 Miklos Szeredi   2005-11-07  763  	flags &= ~O_NOCTTY;
fd72faac95d7e4 Miklos Szeredi   2005-11-07  764  	memset(&inarg, 0, sizeof(inarg));
0e9663ee452ffc Miklos Szeredi   2007-10-18  765  	memset(&outentry, 0, sizeof(outentry));
fd72faac95d7e4 Miklos Szeredi   2005-11-07  766  	inarg.flags = flags;
fd72faac95d7e4 Miklos Szeredi   2005-11-07  767  	inarg.mode = mode;
e0a43ddcc08c34 Miklos Szeredi   2009-06-30  768  	inarg.umask = current_umask();
643a666a89c358 Vivek Goyal      2020-10-09  769  
d58366aab86854 Miklos Szeredi   2022-04-22  770  	if (fm->fc->handle_killpriv_v2 && trunc &&
643a666a89c358 Vivek Goyal      2020-10-09  771  	    !(flags & O_EXCL) && !capable(CAP_FSETID)) {
643a666a89c358 Vivek Goyal      2020-10-09  772  		inarg.open_flags |= FUSE_OPEN_KILL_SUIDGID;
643a666a89c358 Vivek Goyal      2020-10-09  773  	}
643a666a89c358 Vivek Goyal      2020-10-09  774  
d5b4854357f478 Miklos Szeredi   2019-09-10  775  	args.opcode = FUSE_CREATE;
d5b4854357f478 Miklos Szeredi   2019-09-10  776  	args.nodeid = get_node_id(dir);
d5b4854357f478 Miklos Szeredi   2019-09-10  777  	args.in_numargs = 2;
d5b4854357f478 Miklos Szeredi   2019-09-10  778  	args.in_args[0].size = sizeof(inarg);
d5b4854357f478 Miklos Szeredi   2019-09-10  779  	args.in_args[0].value = &inarg;
d5b4854357f478 Miklos Szeredi   2019-09-10  780  	args.in_args[1].size = entry->d_name.len + 1;
d5b4854357f478 Miklos Szeredi   2019-09-10  781  	args.in_args[1].value = entry->d_name.name;
d5b4854357f478 Miklos Szeredi   2019-09-10  782  	args.out_numargs = 2;
d5b4854357f478 Miklos Szeredi   2019-09-10  783  	args.out_args[0].size = sizeof(outentry);
d5b4854357f478 Miklos Szeredi   2019-09-10  784  	args.out_args[0].value = &outentry;
d5b4854357f478 Miklos Szeredi   2019-09-10  785  	args.out_args[1].size = sizeof(outopen);
d5b4854357f478 Miklos Szeredi   2019-09-10  786  	args.out_args[1].value = &outopen;
eb6c8ea051f8b5 Vivek Goyal      2021-11-11  787  
eb6c8ea051f8b5 Vivek Goyal      2021-11-11  788  	if (fm->fc->init_security) {
eb6c8ea051f8b5 Vivek Goyal      2021-11-11  789  		err = get_security_context(entry, mode, &security_ctx,
eb6c8ea051f8b5 Vivek Goyal      2021-11-11  790  					   &security_ctxlen);
eb6c8ea051f8b5 Vivek Goyal      2021-11-11  791  		if (err)
eb6c8ea051f8b5 Vivek Goyal      2021-11-11  792  			goto out_put_forget_req;
eb6c8ea051f8b5 Vivek Goyal      2021-11-11  793  
eb6c8ea051f8b5 Vivek Goyal      2021-11-11  794  		args.in_numargs = 3;
eb6c8ea051f8b5 Vivek Goyal      2021-11-11  795  		args.in_args[2].size = security_ctxlen;
eb6c8ea051f8b5 Vivek Goyal      2021-11-11  796  		args.in_args[2].value = security_ctx;
eb6c8ea051f8b5 Vivek Goyal      2021-11-11  797  	}
eb6c8ea051f8b5 Vivek Goyal      2021-11-11  798  
fcee216beb9c15 Max Reitz        2020-05-06  799  	err = fuse_simple_request(fm, &args);
eb6c8ea051f8b5 Vivek Goyal      2021-11-11  800  	kfree(security_ctx);
c8ccbe032feb12 Miklos Szeredi   2012-06-05  801  	if (err)
fd72faac95d7e4 Miklos Szeredi   2005-11-07  802  		goto out_free_ff;
fd72faac95d7e4 Miklos Szeredi   2005-11-07  803  
fd72faac95d7e4 Miklos Szeredi   2005-11-07  804  	err = -EIO;
eb59bd17d2fa6e Miklos Szeredi   2019-11-12  805  	if (!S_ISREG(outentry.attr.mode) || invalid_nodeid(outentry.nodeid) ||
eb59bd17d2fa6e Miklos Szeredi   2019-11-12  806  	    fuse_invalid_attr(&outentry.attr))
fd72faac95d7e4 Miklos Szeredi   2005-11-07  807  		goto out_free_ff;
fd72faac95d7e4 Miklos Szeredi   2005-11-07  808  
c7b7143c6342b8 Miklos Szeredi   2009-04-28  809  	ff->fh = outopen.fh;
c7b7143c6342b8 Miklos Szeredi   2009-04-28  810  	ff->nodeid = outentry.nodeid;
c7b7143c6342b8 Miklos Szeredi   2009-04-28  811  	ff->open_flags = outopen.open_flags;
abbb00d5ae3f6f Alessio Balsini  2021-01-25  812  	fuse_passthrough_setup(fc, ff, &outopen);
fd72faac95d7e4 Miklos Szeredi   2005-11-07  813  	inode = fuse_iget(dir->i_sb, outentry.nodeid, outentry.generation,
1fb69e7817296d Miklos Szeredi   2007-10-18  814  			  &outentry.attr, entry_attr_timeout(&outentry), 0);
fd72faac95d7e4 Miklos Szeredi   2005-11-07  815  	if (!inode) {
fd72faac95d7e4 Miklos Szeredi   2005-11-07  816  		flags &= ~(O_CREAT | O_EXCL | O_TRUNC);
ebf84d0c7220c7 Kirill Tkhai     2018-11-09  817  		fuse_sync_release(NULL, ff, flags);
fcee216beb9c15 Max Reitz        2020-05-06  818  		fuse_queue_forget(fm->fc, forget, outentry.nodeid, 1);
c8ccbe032feb12 Miklos Szeredi   2012-06-05  819  		err = -ENOMEM;
c8ccbe032feb12 Miklos Szeredi   2012-06-05  820  		goto out_err;
fd72faac95d7e4 Miklos Szeredi   2005-11-07  821  	}
07e77dca8a1f17 Miklos Szeredi   2010-12-07  822  	kfree(forget);
fd72faac95d7e4 Miklos Szeredi   2005-11-07  823  	d_instantiate(entry, inode);
1fb69e7817296d Miklos Szeredi   2007-10-18  824  	fuse_change_entry_timeout(entry, &outentry);
261aaba72fdba1 Miklos Szeredi   2018-10-01  825  	fuse_dir_changed(dir);
be12af3ef5e61e Al Viro          2018-06-08  826  	err = finish_open(file, entry, generic_file_open);
30d904947459cc Al Viro          2012-06-22  827  	if (err) {
ebf84d0c7220c7 Kirill Tkhai     2018-11-09  828  		fi = get_fuse_inode(inode);
ebf84d0c7220c7 Kirill Tkhai     2018-11-09  829  		fuse_sync_release(fi, ff, flags);
c8ccbe032feb12 Miklos Szeredi   2012-06-05  830  	} else {
267d84449f5234 Miklos Szeredi   2017-02-22  831  		file->private_data = ff;
c7b7143c6342b8 Miklos Szeredi   2009-04-28  832  		fuse_finish_open(inode, file);
d58366aab86854 Miklos Szeredi   2022-04-22  833  		if (fm->fc->atomic_o_trunc && trunc)
d58366aab86854 Miklos Szeredi   2022-04-22  834  			truncate_pagecache(inode, 0);
d58366aab86854 Miklos Szeredi   2022-04-22  835  		else if (!(ff->open_flags & FOPEN_KEEP_CACHE))
d58366aab86854 Miklos Szeredi   2022-04-22  836  			invalidate_inode_pages2(inode->i_mapping);
c8ccbe032feb12 Miklos Szeredi   2012-06-05  837  	}
d95852777bc8ba Al Viro          2012-06-22  838  	return err;
fd72faac95d7e4 Miklos Szeredi   2005-11-07  839  
fd72faac95d7e4 Miklos Szeredi   2005-11-07  840  out_free_ff:
fd72faac95d7e4 Miklos Szeredi   2005-11-07  841  	fuse_file_free(ff);
51eb01e73599ef Miklos Szeredi   2006-06-25  842  out_put_forget_req:
07e77dca8a1f17 Miklos Szeredi   2010-12-07  843  	kfree(forget);
c8ccbe032feb12 Miklos Szeredi   2012-06-05  844  out_err:
d95852777bc8ba Al Viro          2012-06-22  845  	return err;
c8ccbe032feb12 Miklos Szeredi   2012-06-05 @846  }
c8ccbe032feb12 Miklos Szeredi   2012-06-05  847  

:::::: The code at line 846 was first introduced by commit
:::::: c8ccbe032feb127a977c66865cb63d72d9a6e08b fuse: implement i_op->atomic_open()

:::::: TO: Miklos Szeredi <mszeredi@suse.cz>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
