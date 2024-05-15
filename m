Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B444315ADA8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 May 2024 20:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715803328; cv=none; b=CrGplRuOgF51R6c4KC4dkZF4BXYks+lTQEEq2tfMjpVayZr2HDWCLmIhTkgWXsc+1hd2TVHssltGyNFtIHhKMDvXiJ4rKyL6/prPWioPofYwnY6aTetwf+8+6jBh58p46z6u6s3jRk48x0DZqM3MIAgFmLUjWqSIIBJzHS3ypOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715803328; c=relaxed/simple;
	bh=jqxCNeCCjM/iGO5ZCOZTl9cqiso3X0upbcKfN4d/LKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NOKaS9Q/C23p1W4OGHPte4gPGCntiXtUpd6pdgURAC4Oga/Hcwyers8KazNOZxHVhr7EwVlaGvKXof3XWoGBi5bs+wShgW6qKdxp2kpZ5wo/LgbBMfCkUlClEYuTA61LV1DOCcwU4fR7E7ilFhJE/0vG6n8VBs7Z/dGOmXB9EJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P0z8yT+N; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P0z8yT+N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715803326; x=1747339326;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jqxCNeCCjM/iGO5ZCOZTl9cqiso3X0upbcKfN4d/LKQ=;
  b=P0z8yT+NB9k4vYzuQ7WzVy8U3XAjNKN8T89OEi8zUrBPNgG3byaR47Tv
   0D6AlTqO72/iTz9nntZnx6yPX8mdKcv4EyfeDwQZDGYBLfWsz+5R/tW7E
   8Ls3+7dJ/ULWxo+c73hvpxJIBT9N06RjTkD4+TXb5RbXWS4fa+lQjXgUb
   a0qKQ9azLt2HbLkcmZs5E0CzDNlcnlW/Y8RsfT4HKTm8j4+shwZxxtFwO
   Lz3ac5XLbX2LqEfxVqZUyDOBEXolmEVrg68i2eqGH2gw1etBBAQeMaN0q
   tNFDklKZ6PTUmAnWwTi47Qs+O+T1fOBDW276KBmRBAna+a+lT9ORC2Dif
   A==;
X-CSE-ConnectionGUID: uuwAEwu9Tmi3ZDfD2oOiZQ==
X-CSE-MsgGUID: ehbnD9EtSX2g9EfN/0Smow==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="15657477"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; 
   d="scan'208";a="15657477"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2024 13:02:04 -0700
X-CSE-ConnectionGUID: hflt9eN9RBGwsGFf4vV97w==
X-CSE-MsgGUID: iDk/M6KXTu+RjHTL0WeKhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; 
   d="scan'208";a="31172727"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 May 2024 13:02:03 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7Kp6-000DDb-1w;
	Wed, 15 May 2024 20:02:00 +0000
Date: Thu, 16 May 2024 04:01:50 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:ovl_revalidate_uppermost 1/1] fs/overlayfs/super.c:107:20:
 warning: unused variable 'oe'
Message-ID: <202405160338.Kh64lICH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux ovl_revalidate_uppermost
head:   466ebfeaeac146315489f7b7471887e31144cf4f
commit: 466ebfeaeac146315489f7b7471887e31144cf4f [1/1] ovl: only revalidate the uppermost real dentry in the stack
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240516/202405160338.Kh64lICH-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d3455f4ddd16811401fa153298fadd2f59f6914e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240516/202405160338.Kh64lICH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405160338.Kh64lICH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/overlayfs/super.c:10:
   In file included from include/linux/xattr.h:18:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/overlayfs/super.c:107:20: warning: unused variable 'oe' [-Wunused-variable]
     107 |         struct ovl_entry *oe;
         |                           ^~
>> fs/overlayfs/super.c:108:19: warning: unused variable 'lowerstack' [-Wunused-variable]
     108 |         struct ovl_path *lowerstack;
         |                          ^~~~~~~~~~
>> fs/overlayfs/super.c:111:15: warning: unused variable 'i' [-Wunused-variable]
     111 |         unsigned int i;
         |                      ^
>> fs/overlayfs/super.c:112:6: warning: unused variable 'ret' [-Wunused-variable]
     112 |         int ret = 1;
         |             ^~~
   5 warnings generated.


vim +/oe +107 fs/overlayfs/super.c

e9be9d5e76e3487 Miklos Szeredi    2014-10-24  @10  #include <linux/xattr.h>
e9be9d5e76e3487 Miklos Szeredi    2014-10-24   11  #include <linux/mount.h>
e9be9d5e76e3487 Miklos Szeredi    2014-10-24   12  #include <linux/parser.h>
e9be9d5e76e3487 Miklos Szeredi    2014-10-24   13  #include <linux/module.h>
cc2596392af3b14 Andy Whitcroft    2014-10-24   14  #include <linux/statfs.h>
f45827e84186af1 Erez Zadok        2014-10-24   15  #include <linux/seq_file.h>
d837a49bd57f1ec Miklos Szeredi    2016-07-29   16  #include <linux/posix_acl_xattr.h>
e487d889b7e3e8e Amir Goldstein    2017-11-07   17  #include <linux/exportfs.h>
2b1a77461f1602f Miklos Szeredi    2022-09-24   18  #include <linux/file.h>
1784fbc2ed9c888 Christian Brauner 2023-06-16   19  #include <linux/fs_context.h>
dcb399de1e404f4 Amir Goldstein    2023-05-25   20  #include <linux/fs_parser.h>
e9be9d5e76e3487 Miklos Szeredi    2014-10-24   21  #include "overlayfs.h"
7fb7998b599a2e1 Christian Brauner 2023-06-26   22  #include "params.h"
e9be9d5e76e3487 Miklos Szeredi    2014-10-24   23  
e9be9d5e76e3487 Miklos Szeredi    2014-10-24   24  MODULE_AUTHOR("Miklos Szeredi <miklos@szeredi.hu>");
e9be9d5e76e3487 Miklos Szeredi    2014-10-24   25  MODULE_DESCRIPTION("Overlay filesystem");
e9be9d5e76e3487 Miklos Szeredi    2014-10-24   26  MODULE_LICENSE("GPL");
e9be9d5e76e3487 Miklos Szeredi    2014-10-24   27  
e9be9d5e76e3487 Miklos Szeredi    2014-10-24   28  
e9be9d5e76e3487 Miklos Szeredi    2014-10-24   29  struct ovl_dir_cache;
e9be9d5e76e3487 Miklos Szeredi    2014-10-24   30  
11b3f8ae7081607 Amir Goldstein    2024-02-02   31  static struct dentry *ovl_d_real(struct dentry *dentry, enum d_real_type type)
d101a125954eae1 Miklos Szeredi    2016-03-26   32  {
11b3f8ae7081607 Amir Goldstein    2024-02-02   33  	struct dentry *upper, *lower;
184996e92e86c4a Alexander Larsson 2023-06-21   34  	int err;
d101a125954eae1 Miklos Szeredi    2016-03-26   35  
11b3f8ae7081607 Amir Goldstein    2024-02-02   36  	switch (type) {
11b3f8ae7081607 Amir Goldstein    2024-02-02   37  	case D_REAL_DATA:
11b3f8ae7081607 Amir Goldstein    2024-02-02   38  	case D_REAL_METADATA:
11b3f8ae7081607 Amir Goldstein    2024-02-02   39  		break;
11b3f8ae7081607 Amir Goldstein    2024-02-02   40  	default:
def3ae83da02f87 Amir Goldstein    2023-10-09   41  		goto bug;
11b3f8ae7081607 Amir Goldstein    2024-02-02   42  	}
e8c985bace1351c Miklos Szeredi    2018-07-18   43  
ca4c8a3a800039c Miklos Szeredi    2016-12-16   44  	if (!d_is_reg(dentry)) {
def3ae83da02f87 Amir Goldstein    2023-10-09   45  		/* d_real_inode() is only relevant for regular files */
d101a125954eae1 Miklos Szeredi    2016-03-26   46  		return dentry;
d101a125954eae1 Miklos Szeredi    2016-03-26   47  	}
d101a125954eae1 Miklos Szeredi    2016-03-26   48  
11b3f8ae7081607 Amir Goldstein    2024-02-02   49  	upper = ovl_dentry_upper(dentry);
11b3f8ae7081607 Amir Goldstein    2024-02-02   50  	if (upper && (type == D_REAL_METADATA ||
11b3f8ae7081607 Amir Goldstein    2024-02-02   51  		      ovl_has_upperdata(d_inode(dentry))))
11b3f8ae7081607 Amir Goldstein    2024-02-02   52  		return upper;
d101a125954eae1 Miklos Szeredi    2016-03-26   53  
11b3f8ae7081607 Amir Goldstein    2024-02-02   54  	if (type == D_REAL_METADATA) {
11b3f8ae7081607 Amir Goldstein    2024-02-02   55  		lower = ovl_dentry_lower(dentry);
11b3f8ae7081607 Amir Goldstein    2024-02-02   56  		goto real_lower;
11b3f8ae7081607 Amir Goldstein    2024-02-02   57  	}
2c3d73589adc6d3 Vivek Goyal       2018-05-11   58  
416656447864ef0 Amir Goldstein    2023-04-02   59  	/*
11b3f8ae7081607 Amir Goldstein    2024-02-02   60  	 * Best effort lazy lookup of lowerdata for D_REAL_DATA case to return
416656447864ef0 Amir Goldstein    2023-04-02   61  	 * the real lowerdata dentry.  The only current caller of d_real() with
11b3f8ae7081607 Amir Goldstein    2024-02-02   62  	 * D_REAL_DATA is d_real_inode() from trace_uprobe and this caller is
416656447864ef0 Amir Goldstein    2023-04-02   63  	 * likely going to be followed reading from the file, before placing
416656447864ef0 Amir Goldstein    2023-04-02   64  	 * uprobes on offset within the file, so lowerdata should be available
416656447864ef0 Amir Goldstein    2023-04-02   65  	 * when setting the uprobe.
416656447864ef0 Amir Goldstein    2023-04-02   66  	 */
184996e92e86c4a Alexander Larsson 2023-06-21   67  	err = ovl_verify_lowerdata(dentry);
184996e92e86c4a Alexander Larsson 2023-06-21   68  	if (err)
184996e92e86c4a Alexander Larsson 2023-06-21   69  		goto bug;
cef4cbff06fbc3b Miklos Szeredi    2020-11-12   70  	lower = ovl_dentry_lowerdata(dentry);
cef4cbff06fbc3b Miklos Szeredi    2020-11-12   71  	if (!lower)
d101a125954eae1 Miklos Szeredi    2016-03-26   72  		goto bug;
d101a125954eae1 Miklos Szeredi    2016-03-26   73  
11b3f8ae7081607 Amir Goldstein    2024-02-02   74  real_lower:
11b3f8ae7081607 Amir Goldstein    2024-02-02   75  	/* Handle recursion into stacked lower fs */
11b3f8ae7081607 Amir Goldstein    2024-02-02   76  	return d_real(lower, type);
c4fcfc1619ea43a Miklos Szeredi    2016-11-29   77  
d101a125954eae1 Miklos Szeredi    2016-03-26   78  bug:
11b3f8ae7081607 Amir Goldstein    2024-02-02   79  	WARN(1, "%s(%pd4, %d): real dentry not found\n", __func__, dentry, type);
d101a125954eae1 Miklos Szeredi    2016-03-26   80  	return dentry;
d101a125954eae1 Miklos Szeredi    2016-03-26   81  }
d101a125954eae1 Miklos Szeredi    2016-03-26   82  
3bb7df928a7dca0 Miklos Szeredi    2020-03-17   83  static int ovl_revalidate_real(struct dentry *d, unsigned int flags, bool weak)
7c03b5d45b8eebf Miklos Szeredi    2015-06-22   84  {
7c03b5d45b8eebf Miklos Szeredi    2015-06-22   85  	int ret = 1;
7c03b5d45b8eebf Miklos Szeredi    2015-06-22   86  
416656447864ef0 Amir Goldstein    2023-04-02   87  	if (!d)
416656447864ef0 Amir Goldstein    2023-04-02   88  		return 1;
416656447864ef0 Amir Goldstein    2023-04-02   89  
3bb7df928a7dca0 Miklos Szeredi    2020-03-17   90  	if (weak) {
3bb7df928a7dca0 Miklos Szeredi    2020-03-17   91  		if (d->d_flags & DCACHE_OP_WEAK_REVALIDATE)
3bb7df928a7dca0 Miklos Szeredi    2020-03-17   92  			ret =  d->d_op->d_weak_revalidate(d, flags);
3bb7df928a7dca0 Miklos Szeredi    2020-03-17   93  	} else if (d->d_flags & DCACHE_OP_REVALIDATE) {
7c03b5d45b8eebf Miklos Szeredi    2015-06-22   94  		ret = d->d_op->d_revalidate(d, flags);
7c03b5d45b8eebf Miklos Szeredi    2015-06-22   95  		if (!ret) {
7c03b5d45b8eebf Miklos Szeredi    2015-06-22   96  			if (!(flags & LOOKUP_RCU))
7c03b5d45b8eebf Miklos Szeredi    2015-06-22   97  				d_invalidate(d);
3bb7df928a7dca0 Miklos Szeredi    2020-03-17   98  			ret = -ESTALE;
7c03b5d45b8eebf Miklos Szeredi    2015-06-22   99  		}
7c03b5d45b8eebf Miklos Szeredi    2015-06-22  100  	}
3bb7df928a7dca0 Miklos Szeredi    2020-03-17  101  	return ret;
7c03b5d45b8eebf Miklos Szeredi    2015-06-22  102  }
7c03b5d45b8eebf Miklos Szeredi    2015-06-22  103  
3bb7df928a7dca0 Miklos Szeredi    2020-03-17  104  static int ovl_dentry_revalidate_common(struct dentry *dentry,
3bb7df928a7dca0 Miklos Szeredi    2020-03-17  105  					unsigned int flags, bool weak)
7c03b5d45b8eebf Miklos Szeredi    2015-06-22  106  {
c54719c92aa3129 Al Viro           2023-10-02 @107  	struct ovl_entry *oe;
c54719c92aa3129 Al Viro           2023-10-02 @108  	struct ovl_path *lowerstack;
672e4268b2863d7 Chen Zhongjin     2022-11-28  109  	struct inode *inode = d_inode_rcu(dentry);
466ebfeaeac1463 Amir Goldstein    2024-05-14  110  	struct dentry *real;
7c03b5d45b8eebf Miklos Szeredi    2015-06-22 @111  	unsigned int i;
7c03b5d45b8eebf Miklos Szeredi    2015-06-22 @112  	int ret = 1;
7c03b5d45b8eebf Miklos Szeredi    2015-06-22  113  
672e4268b2863d7 Chen Zhongjin     2022-11-28  114  	/* Careful in RCU mode */
672e4268b2863d7 Chen Zhongjin     2022-11-28  115  	if (!inode)
672e4268b2863d7 Chen Zhongjin     2022-11-28  116  		return -ECHILD;
672e4268b2863d7 Chen Zhongjin     2022-11-28  117  
466ebfeaeac1463 Amir Goldstein    2024-05-14  118  	/*
466ebfeaeac1463 Amir Goldstein    2024-05-14  119  	 * We only revalidate the upper most parent/name are still the same
466ebfeaeac1463 Amir Goldstein    2024-05-14  120  	 * as the overlay parent/name when this can be verified.
466ebfeaeac1463 Amir Goldstein    2024-05-14  121  	 * We do not revalidate hardlinks because overlay dentry stack may
466ebfeaeac1463 Amir Goldstein    2024-05-14  122  	 * have been composed from and stored a different parent/name.
466ebfeaeac1463 Amir Goldstein    2024-05-14  123  	 */
466ebfeaeac1463 Amir Goldstein    2024-05-14  124  	real = ovl_dentry_real(dentry);
466ebfeaeac1463 Amir Goldstein    2024-05-14  125  	if (!d_is_dir(real) && d_inode(real)->i_nlink != 1)
466ebfeaeac1463 Amir Goldstein    2024-05-14  126  		return 1;
5522c9c7cbd2ab4 Amir Goldstein    2023-04-03  127  
466ebfeaeac1463 Amir Goldstein    2024-05-14  128  	return ovl_revalidate_real(real, flags, weak);
7c03b5d45b8eebf Miklos Szeredi    2015-06-22  129  }
7c03b5d45b8eebf Miklos Szeredi    2015-06-22  130  

:::::: The code at line 107 was first introduced by commit
:::::: c54719c92aa3129f330cce81b88cf34f1627f756 ovl: fetch inode once in ovl_dentry_revalidate_common()

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Amir Goldstein <amir73il@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
