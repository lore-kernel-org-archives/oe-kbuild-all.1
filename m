Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CFF3CF51
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jul 2024 07:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721116716; cv=none; b=ib1xh3i6sFSpUX/T+hMo1ZJ9ChvdJe9UfAPkmgVPYPOXHZsZflCL2UyhdFjiM01kPCBRKIDHj0/9xTKnf49Nm06Z5BaQTV9SlYUcq3oZV3NONkr/JOQZEp99hX7lkLwomXqToZi4xWEhpoPTWT8JZ0ckY12zNgss5jOW4q3oxek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721116716; c=relaxed/simple;
	bh=6tGT5Zmjn/dsXBAZPS2/x0Fz4+0lYKHzR3tMMbJD78Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CQuq8y8ciFSCYLdtev0TZhyWwLcg8kBU8z+ZLP2dDzEBOZr2SRaAasrUCX7AbGos9PkEsFqhx5c7SaHQfZWHQDgTOfua0x2Mrmuu6W977CrER4+7ywG/dtvW9xnFB3kNBuBeziaonEVV7dJ3VcOJVNfXaaM8MMsD5b/nnebOW7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Loi/eY8F; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Loi/eY8F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721116714; x=1752652714;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6tGT5Zmjn/dsXBAZPS2/x0Fz4+0lYKHzR3tMMbJD78Y=;
  b=Loi/eY8FcX5lSQ6niCiCOsTRNN5WUbey9kDoTWFbOOe6EiHqFSkJNWVK
   R/nYmPEy+GTc2tG7ciXpmJmPRhKA3dZEu6DuJ0Trpm2ZcuChULKD8fpec
   2zdnqHzPCMcz4eEXUq471bBYsrifzxtjQErmxfi9u/AFhiwbdDlAWIXfq
   QUWwMd+GjsKqilBYQ/Lw2cRKfS78t/Dox9YUgrGbMU+Dq04qcClGZyOrZ
   fv5uXlN05ymy5ebA1tmbz4nhpX1AjR4MbQ4hdyMforaDhJuDc7oyGtDLi
   jlDU9pbyLwPMJBeUrHwoQi65qIYx4ILbMammmcfJqfli7Wxb8eDor7gx8
   g==;
X-CSE-ConnectionGUID: kuQW9gKFS6+zYC5WaUq0Bg==
X-CSE-MsgGUID: SlGU4LAiQkKiTT2YrBDiCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="18650636"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="18650636"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 00:58:33 -0700
X-CSE-ConnectionGUID: JXhgeccuShqf8JAzs6T8pQ==
X-CSE-MsgGUID: gpCDl+m8TcGcoDzyJ2/CJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="73149224"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 Jul 2024 00:58:32 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTd4v-000f1q-1y;
	Tue, 16 Jul 2024 07:58:29 +0000
Date: Tue, 16 Jul 2024 15:58:06 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 122/124] fs/bcachefs/sysfs.c:821:28:
 warning: unused variable 'mi'
Message-ID: <202407161524.mbCqj5hy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   2fc273317ecc241cda80c3aaa098e47f2ec86b5e
commit: 4a7a003763f594fcb798c13b4644521083f885b3 [122/124] bcachefs: Opt_durability can now be set via bch2_opt_set_sb()
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240716/202407161524.mbCqj5hy-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240716/202407161524.mbCqj5hy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407161524.mbCqj5hy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/sysfs.c: In function 'bch2_dev_store_inner':
>> fs/bcachefs/sysfs.c:821:28: warning: unused variable 'mi' [-Wunused-variable]
     821 |         struct bch_member *mi;
         |                            ^~


vim +/mi +821 fs/bcachefs/sysfs.c

1c6fdbd8f2465d Kent Overstreet 2017-03-16  816  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  817  STORE(bch2_dev)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  818  {
1c6fdbd8f2465d Kent Overstreet 2017-03-16  819  	struct bch_dev *ca = container_of(kobj, struct bch_dev, kobj);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  820  	struct bch_fs *c = ca->fs;
1c6fdbd8f2465d Kent Overstreet 2017-03-16 @821  	struct bch_member *mi;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  822  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  823  	if (attr == &sysfs_discard) {
1c6fdbd8f2465d Kent Overstreet 2017-03-16  824  		bool v = strtoul_or_return(buf);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  825  
ec1c4f5388a1eb Kent Overstreet 2024-07-15  826  		bch2_opt_set_sb(c, ca, bch2_opt_table + Opt_discard, v);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  827  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  828  
597c6d17b18e2d Daniel Hill     2022-05-25  829  	if (attr == &sysfs_durability) {
597c6d17b18e2d Daniel Hill     2022-05-25  830  		u64 v = strtoul_or_return(buf);
597c6d17b18e2d Daniel Hill     2022-05-25  831  
4a7a003763f594 Kent Overstreet 2024-07-15  832  		bch2_opt_set_sb(c, ca, bch2_opt_table + Opt_durability, v);
597c6d17b18e2d Daniel Hill     2022-05-25  833  	}
597c6d17b18e2d Daniel Hill     2022-05-25  834  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  835  	if (attr == &sysfs_label) {
1c6fdbd8f2465d Kent Overstreet 2017-03-16  836  		char *tmp;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  837  		int ret;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  838  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  839  		tmp = kstrdup(buf, GFP_KERNEL);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  840  		if (!tmp)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  841  			return -ENOMEM;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  842  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  843  		ret = bch2_dev_group_set(c, ca, strim(tmp));
1c6fdbd8f2465d Kent Overstreet 2017-03-16  844  		kfree(tmp);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  845  		if (ret)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  846  			return ret;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  847  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  848  
94119eeb02d114 Kent Overstreet 2023-10-25  849  	if (attr == &sysfs_io_errors_reset)
94119eeb02d114 Kent Overstreet 2023-10-25  850  		bch2_dev_errors_reset(ca);
94119eeb02d114 Kent Overstreet 2023-10-25  851  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  852  	return size;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  853  }
1c6fdbd8f2465d Kent Overstreet 2017-03-16  854  SYSFS_OPS(bch2_dev);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  855  

:::::: The code at line 821 was first introduced by commit
:::::: 1c6fdbd8f2465ddfb73a01ec620cbf3d14044e1a bcachefs: Initial commit

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
