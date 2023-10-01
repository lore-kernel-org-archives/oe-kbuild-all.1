Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58B280C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Oct 2023 04:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696133555; x=1727669555;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xpbH+j9a3b9+/+p54DH1yPPzhsXk2uDAC5+bnO8bjwI=;
  b=nbhPLDnvWzaJksss8moSk8fM4z4ffWBhUSRiFS8U/lbtBc+D9yDWwRNX
   7XGpBxV+lPpJhSym8kJJoMWKyrDB5VkEfOnkQ0SQgxjK7ZBZZu3/494Sd
   Bwxf9EOxogZYNnkTFtcD1WhEVVozhy5XbqLLTOunw5lp2jYC84JlEjhE2
   yIwhaiROgTWoNhocdsHmAf4VTASOJ04OC8FFdbh5cQEFhKXOvmR0dAuxq
   iEH0AJ1iewtD9pDTZX6SREw7iYtyepPn1KHBgDrDFkpoBv4pKLnYOt4UE
   KUOCRNzFlPzC2hjgUxouebyWVof4mhCWR+KDKIQXllap89IvIClwT4gs8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="1082489"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="1082489"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2023 21:12:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="779635671"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="779635671"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 30 Sep 2023 21:12:32 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmnok-0004jZ-06;
	Sun, 01 Oct 2023 04:12:30 +0000
Date: Sun, 1 Oct 2023 12:12:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:amtime 89/89] fs/ntfs3/inode.c:176:49: error: 'struct
 inode' has no member named 'i_mtime'; did you mean '__i_mtime'?
Message-ID: <202310011243.kwNeNxnY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jeff,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git amtime
head:   d3f5e7afc35dce37213dc35f1d329f078d689834
commit: d3f5e7afc35dce37213dc35f1d329f078d689834 [89/89] fs: rename inode i_atime and i_mtime fields
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20231001/202310011243.kwNeNxnY-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231001/202310011243.kwNeNxnY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310011243.kwNeNxnY-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/ntfs3/inode.c: In function 'ntfs_read_mft':
>> fs/ntfs3/inode.c:176:49: error: 'struct inode' has no member named 'i_mtime'; did you mean '__i_mtime'?
     176 |                 nt2kernel(std5->m_time, &inode->i_mtime);
         |                                                 ^~~~~~~
         |                                                 __i_mtime
   fs/ntfs3/inode.c: In function 'ntfs_create_inode':
   fs/ntfs3/inode.c:1666:1: error: version control conflict marker in file
    1666 | <<<<<<< HEAD
         | ^~~~~~~
   fs/ntfs3/inode.c:1669:14: error: 'struct inode' has no member named 'i_mtime'; did you mean '__i_mtime'?
    1669 |         dir->i_mtime = inode_set_ctime_to_ts(dir, ni->i_crtime);
         |              ^~~~~~~
         |              __i_mtime
   fs/ntfs3/inode.c:1670:1: error: version control conflict marker in file
    1670 | =======
         | ^~~~~~~
   fs/ntfs3/inode.c:1674:1: error: version control conflict marker in file
    1674 | >>>>>>> c93949aae9cd (fs: convert core infrastructure to new {a,m}time accessors)
         | ^~~~~~~


vim +176 fs/ntfs3/inode.c

82cae269cfa953 Konstantin Komarov 2021-08-13   19  
82cae269cfa953 Konstantin Komarov 2021-08-13   20  /*
e8b8e97f91b80f Kari Argillander   2021-08-03   21   * ntfs_read_mft - Read record and parses MFT.
82cae269cfa953 Konstantin Komarov 2021-08-13   22   */
82cae269cfa953 Konstantin Komarov 2021-08-13   23  static struct inode *ntfs_read_mft(struct inode *inode,
82cae269cfa953 Konstantin Komarov 2021-08-13   24  				   const struct cpu_str *name,
82cae269cfa953 Konstantin Komarov 2021-08-13   25  				   const struct MFT_REF *ref)
82cae269cfa953 Konstantin Komarov 2021-08-13   26  {
82cae269cfa953 Konstantin Komarov 2021-08-13   27  	int err = 0;
82cae269cfa953 Konstantin Komarov 2021-08-13   28  	struct ntfs_inode *ni = ntfs_i(inode);
82cae269cfa953 Konstantin Komarov 2021-08-13   29  	struct super_block *sb = inode->i_sb;
82cae269cfa953 Konstantin Komarov 2021-08-13   30  	struct ntfs_sb_info *sbi = sb->s_fs_info;
82cae269cfa953 Konstantin Komarov 2021-08-13   31  	mode_t mode = 0;
82cae269cfa953 Konstantin Komarov 2021-08-13   32  	struct ATTR_STD_INFO5 *std5 = NULL;
82cae269cfa953 Konstantin Komarov 2021-08-13   33  	struct ATTR_LIST_ENTRY *le;
82cae269cfa953 Konstantin Komarov 2021-08-13   34  	struct ATTRIB *attr;
82cae269cfa953 Konstantin Komarov 2021-08-13   35  	bool is_match = false;
82cae269cfa953 Konstantin Komarov 2021-08-13   36  	bool is_root = false;
82cae269cfa953 Konstantin Komarov 2021-08-13   37  	bool is_dir;
82cae269cfa953 Konstantin Komarov 2021-08-13   38  	unsigned long ino = inode->i_ino;
82cae269cfa953 Konstantin Komarov 2021-08-13   39  	u32 rp_fa = 0, asize, t32;
82cae269cfa953 Konstantin Komarov 2021-08-13   40  	u16 roff, rsize, names = 0;
82cae269cfa953 Konstantin Komarov 2021-08-13   41  	const struct ATTR_FILE_NAME *fname = NULL;
82cae269cfa953 Konstantin Komarov 2021-08-13   42  	const struct INDEX_ROOT *root;
82cae269cfa953 Konstantin Komarov 2021-08-13   43  	struct REPARSE_DATA_BUFFER rp; // 0x18 bytes
82cae269cfa953 Konstantin Komarov 2021-08-13   44  	u64 t64;
82cae269cfa953 Konstantin Komarov 2021-08-13   45  	struct MFT_REC *rec;
82cae269cfa953 Konstantin Komarov 2021-08-13   46  	struct runs_tree *run;
25ddea97858e02 Jeff Layton        2023-09-29   47  	struct timespec64 ts;
82cae269cfa953 Konstantin Komarov 2021-08-13   48  
82cae269cfa953 Konstantin Komarov 2021-08-13   49  	inode->i_op = NULL;
82cae269cfa953 Konstantin Komarov 2021-08-13   50  	/* Setup 'uid' and 'gid' */
564c97bdfa39c7 Kari Argillander   2021-09-07   51  	inode->i_uid = sbi->options->fs_uid;
564c97bdfa39c7 Kari Argillander   2021-09-07   52  	inode->i_gid = sbi->options->fs_gid;
82cae269cfa953 Konstantin Komarov 2021-08-13   53  
82cae269cfa953 Konstantin Komarov 2021-08-13   54  	err = mi_init(&ni->mi, sbi, ino);
82cae269cfa953 Konstantin Komarov 2021-08-13   55  	if (err)
82cae269cfa953 Konstantin Komarov 2021-08-13   56  		goto out;
82cae269cfa953 Konstantin Komarov 2021-08-13   57  
82cae269cfa953 Konstantin Komarov 2021-08-13   58  	if (!sbi->mft.ni && ino == MFT_REC_MFT && !sb->s_root) {
82cae269cfa953 Konstantin Komarov 2021-08-13   59  		t64 = sbi->mft.lbo >> sbi->cluster_bits;
82cae269cfa953 Konstantin Komarov 2021-08-13   60  		t32 = bytes_to_cluster(sbi, MFT_REC_VOL * sbi->record_size);
82cae269cfa953 Konstantin Komarov 2021-08-13   61  		sbi->mft.ni = ni;
82cae269cfa953 Konstantin Komarov 2021-08-13   62  		init_rwsem(&ni->file.run_lock);
82cae269cfa953 Konstantin Komarov 2021-08-13   63  
82cae269cfa953 Konstantin Komarov 2021-08-13   64  		if (!run_add_entry(&ni->file.run, 0, t64, t32, true)) {
82cae269cfa953 Konstantin Komarov 2021-08-13   65  			err = -ENOMEM;
82cae269cfa953 Konstantin Komarov 2021-08-13   66  			goto out;
82cae269cfa953 Konstantin Komarov 2021-08-13   67  		}
82cae269cfa953 Konstantin Komarov 2021-08-13   68  	}
82cae269cfa953 Konstantin Komarov 2021-08-13   69  
82cae269cfa953 Konstantin Komarov 2021-08-13   70  	err = mi_read(&ni->mi, ino == MFT_REC_MFT);
82cae269cfa953 Konstantin Komarov 2021-08-13   71  
82cae269cfa953 Konstantin Komarov 2021-08-13   72  	if (err)
82cae269cfa953 Konstantin Komarov 2021-08-13   73  		goto out;
82cae269cfa953 Konstantin Komarov 2021-08-13   74  
82cae269cfa953 Konstantin Komarov 2021-08-13   75  	rec = ni->mi.mrec;
82cae269cfa953 Konstantin Komarov 2021-08-13   76  
82cae269cfa953 Konstantin Komarov 2021-08-13   77  	if (sbi->flags & NTFS_FLAGS_LOG_REPLAYING) {
82cae269cfa953 Konstantin Komarov 2021-08-13   78  		;
82cae269cfa953 Konstantin Komarov 2021-08-13   79  	} else if (ref->seq != rec->seq) {
82cae269cfa953 Konstantin Komarov 2021-08-13   80  		err = -EINVAL;
82cae269cfa953 Konstantin Komarov 2021-08-13   81  		ntfs_err(sb, "MFT: r=%lx, expect seq=%x instead of %x!", ino,
82cae269cfa953 Konstantin Komarov 2021-08-13   82  			 le16_to_cpu(ref->seq), le16_to_cpu(rec->seq));
82cae269cfa953 Konstantin Komarov 2021-08-13   83  		goto out;
82cae269cfa953 Konstantin Komarov 2021-08-13   84  	} else if (!is_rec_inuse(rec)) {
0e8235d28f3a0e Konstantin Komarov 2022-10-10   85  		err = -ESTALE;
82cae269cfa953 Konstantin Komarov 2021-08-13   86  		ntfs_err(sb, "Inode r=%x is not in use!", (u32)ino);
82cae269cfa953 Konstantin Komarov 2021-08-13   87  		goto out;
82cae269cfa953 Konstantin Komarov 2021-08-13   88  	}
82cae269cfa953 Konstantin Komarov 2021-08-13   89  
82cae269cfa953 Konstantin Komarov 2021-08-13   90  	if (le32_to_cpu(rec->total) != sbi->record_size) {
d3624466b56dd5 Konstantin Komarov 2021-08-31   91  		/* Bad inode? */
82cae269cfa953 Konstantin Komarov 2021-08-13   92  		err = -EINVAL;
82cae269cfa953 Konstantin Komarov 2021-08-13   93  		goto out;
82cae269cfa953 Konstantin Komarov 2021-08-13   94  	}
82cae269cfa953 Konstantin Komarov 2021-08-13   95  
0e8235d28f3a0e Konstantin Komarov 2022-10-10   96  	if (!is_rec_base(rec)) {
0e8235d28f3a0e Konstantin Komarov 2022-10-10   97  		err = -EINVAL;
0e8235d28f3a0e Konstantin Komarov 2022-10-10   98  		goto out;
0e8235d28f3a0e Konstantin Komarov 2022-10-10   99  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  100  
e8b8e97f91b80f Kari Argillander   2021-08-03  101  	/* Record should contain $I30 root. */
82cae269cfa953 Konstantin Komarov 2021-08-13  102  	is_dir = rec->flags & RECORD_FLAG_DIR;
82cae269cfa953 Konstantin Komarov 2021-08-13  103  
98bea253aa28ad Edward Lo          2022-11-05  104  	/* MFT_REC_MFT is not a dir */
98bea253aa28ad Edward Lo          2022-11-05  105  	if (is_dir && ino == MFT_REC_MFT) {
98bea253aa28ad Edward Lo          2022-11-05  106  		err = -EINVAL;
98bea253aa28ad Edward Lo          2022-11-05  107  		goto out;
98bea253aa28ad Edward Lo          2022-11-05  108  	}
98bea253aa28ad Edward Lo          2022-11-05  109  
82cae269cfa953 Konstantin Komarov 2021-08-13  110  	inode->i_generation = le16_to_cpu(rec->seq);
82cae269cfa953 Konstantin Komarov 2021-08-13  111  
e8b8e97f91b80f Kari Argillander   2021-08-03  112  	/* Enumerate all struct Attributes MFT. */
82cae269cfa953 Konstantin Komarov 2021-08-13  113  	le = NULL;
82cae269cfa953 Konstantin Komarov 2021-08-13  114  	attr = NULL;
82cae269cfa953 Konstantin Komarov 2021-08-13  115  
82cae269cfa953 Konstantin Komarov 2021-08-13  116  	/*
e8b8e97f91b80f Kari Argillander   2021-08-03  117  	 * To reduce tab pressure use goto instead of
82cae269cfa953 Konstantin Komarov 2021-08-13  118  	 * while( (attr = ni_enum_attr_ex(ni, attr, &le, NULL) ))
82cae269cfa953 Konstantin Komarov 2021-08-13  119  	 */
82cae269cfa953 Konstantin Komarov 2021-08-13  120  next_attr:
82cae269cfa953 Konstantin Komarov 2021-08-13  121  	run = NULL;
82cae269cfa953 Konstantin Komarov 2021-08-13  122  	err = -EINVAL;
82cae269cfa953 Konstantin Komarov 2021-08-13  123  	attr = ni_enum_attr_ex(ni, attr, &le, NULL);
82cae269cfa953 Konstantin Komarov 2021-08-13  124  	if (!attr)
82cae269cfa953 Konstantin Komarov 2021-08-13  125  		goto end_enum;
82cae269cfa953 Konstantin Komarov 2021-08-13  126  
82cae269cfa953 Konstantin Komarov 2021-08-13  127  	if (le && le->vcn) {
e8b8e97f91b80f Kari Argillander   2021-08-03  128  		/* This is non primary attribute segment. Ignore if not MFT. */
82cae269cfa953 Konstantin Komarov 2021-08-13  129  		if (ino != MFT_REC_MFT || attr->type != ATTR_DATA)
82cae269cfa953 Konstantin Komarov 2021-08-13  130  			goto next_attr;
82cae269cfa953 Konstantin Komarov 2021-08-13  131  
82cae269cfa953 Konstantin Komarov 2021-08-13  132  		run = &ni->file.run;
82cae269cfa953 Konstantin Komarov 2021-08-13  133  		asize = le32_to_cpu(attr->size);
82cae269cfa953 Konstantin Komarov 2021-08-13  134  		goto attr_unpack_run;
82cae269cfa953 Konstantin Komarov 2021-08-13  135  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  136  
82cae269cfa953 Konstantin Komarov 2021-08-13  137  	roff = attr->non_res ? 0 : le16_to_cpu(attr->res.data_off);
82cae269cfa953 Konstantin Komarov 2021-08-13  138  	rsize = attr->non_res ? 0 : le32_to_cpu(attr->res.data_size);
82cae269cfa953 Konstantin Komarov 2021-08-13  139  	asize = le32_to_cpu(attr->size);
82cae269cfa953 Konstantin Komarov 2021-08-13  140  
0addfb1c2281b5 Konstantin Komarov 2022-12-29  141  	/*
0addfb1c2281b5 Konstantin Komarov 2022-12-29  142  	 * Really this check was done in 'ni_enum_attr_ex' -> ... 'mi_enum_attr'.
0addfb1c2281b5 Konstantin Komarov 2022-12-29  143  	 * There not critical to check this case again
0addfb1c2281b5 Konstantin Komarov 2022-12-29  144  	 */
0addfb1c2281b5 Konstantin Komarov 2022-12-29  145  	if (attr->name_len &&
0addfb1c2281b5 Konstantin Komarov 2022-12-29  146  	    sizeof(short) * attr->name_len + le16_to_cpu(attr->name_off) >
0addfb1c2281b5 Konstantin Komarov 2022-12-29  147  		    asize)
4f1dc7d9756e66 Edward Lo          2022-09-09  148  		goto out;
4f1dc7d9756e66 Edward Lo          2022-09-09  149  
019d22eb0eb707 Abdun Nihaal       2022-10-04  150  	if (attr->non_res) {
019d22eb0eb707 Abdun Nihaal       2022-10-04  151  		t64 = le64_to_cpu(attr->nres.alloc_size);
019d22eb0eb707 Abdun Nihaal       2022-10-04  152  		if (le64_to_cpu(attr->nres.data_size) > t64 ||
019d22eb0eb707 Abdun Nihaal       2022-10-04  153  		    le64_to_cpu(attr->nres.valid_size) > t64)
019d22eb0eb707 Abdun Nihaal       2022-10-04  154  			goto out;
019d22eb0eb707 Abdun Nihaal       2022-10-04  155  	}
019d22eb0eb707 Abdun Nihaal       2022-10-04  156  
82cae269cfa953 Konstantin Komarov 2021-08-13  157  	switch (attr->type) {
82cae269cfa953 Konstantin Komarov 2021-08-13  158  	case ATTR_STD:
82cae269cfa953 Konstantin Komarov 2021-08-13  159  		if (attr->non_res ||
82cae269cfa953 Konstantin Komarov 2021-08-13  160  		    asize < sizeof(struct ATTR_STD_INFO) + roff ||
82cae269cfa953 Konstantin Komarov 2021-08-13  161  		    rsize < sizeof(struct ATTR_STD_INFO))
82cae269cfa953 Konstantin Komarov 2021-08-13  162  			goto out;
82cae269cfa953 Konstantin Komarov 2021-08-13  163  
82cae269cfa953 Konstantin Komarov 2021-08-13  164  		if (std5)
82cae269cfa953 Konstantin Komarov 2021-08-13  165  			goto next_attr;
82cae269cfa953 Konstantin Komarov 2021-08-13  166  
82cae269cfa953 Konstantin Komarov 2021-08-13  167  		std5 = Add2Ptr(attr, roff);
82cae269cfa953 Konstantin Komarov 2021-08-13  168  
82cae269cfa953 Konstantin Komarov 2021-08-13  169  #ifdef STATX_BTIME
82cae269cfa953 Konstantin Komarov 2021-08-13  170  		nt2kernel(std5->cr_time, &ni->i_crtime);
82cae269cfa953 Konstantin Komarov 2021-08-13  171  #endif
25ddea97858e02 Jeff Layton        2023-09-29  172  		nt2kernel(std5->a_time, &ts);
25ddea97858e02 Jeff Layton        2023-09-29  173  		inode_set_atime_to_ts(inode, ts);
25ddea97858e02 Jeff Layton        2023-09-29  174  		nt2kernel(std5->c_time, &ts);
25ddea97858e02 Jeff Layton        2023-09-29  175  		inode_set_ctime_to_ts(inode, ts);
82cae269cfa953 Konstantin Komarov 2021-08-13 @176  		nt2kernel(std5->m_time, &inode->i_mtime);
25ddea97858e02 Jeff Layton        2023-09-29  177  		inode_set_mtime_to_ts(inode, ts);
82cae269cfa953 Konstantin Komarov 2021-08-13  178  
82cae269cfa953 Konstantin Komarov 2021-08-13  179  		ni->std_fa = std5->fa;
82cae269cfa953 Konstantin Komarov 2021-08-13  180  
82cae269cfa953 Konstantin Komarov 2021-08-13  181  		if (asize >= sizeof(struct ATTR_STD_INFO5) + roff &&
82cae269cfa953 Konstantin Komarov 2021-08-13  182  		    rsize >= sizeof(struct ATTR_STD_INFO5))
82cae269cfa953 Konstantin Komarov 2021-08-13  183  			ni->std_security_id = std5->security_id;
82cae269cfa953 Konstantin Komarov 2021-08-13  184  		goto next_attr;
82cae269cfa953 Konstantin Komarov 2021-08-13  185  
82cae269cfa953 Konstantin Komarov 2021-08-13  186  	case ATTR_LIST:
82cae269cfa953 Konstantin Komarov 2021-08-13  187  		if (attr->name_len || le || ino == MFT_REC_LOG)
82cae269cfa953 Konstantin Komarov 2021-08-13  188  			goto out;
82cae269cfa953 Konstantin Komarov 2021-08-13  189  
82cae269cfa953 Konstantin Komarov 2021-08-13  190  		err = ntfs_load_attr_list(ni, attr);
82cae269cfa953 Konstantin Komarov 2021-08-13  191  		if (err)
82cae269cfa953 Konstantin Komarov 2021-08-13  192  			goto out;
82cae269cfa953 Konstantin Komarov 2021-08-13  193  
82cae269cfa953 Konstantin Komarov 2021-08-13  194  		le = NULL;
82cae269cfa953 Konstantin Komarov 2021-08-13  195  		attr = NULL;
82cae269cfa953 Konstantin Komarov 2021-08-13  196  		goto next_attr;
82cae269cfa953 Konstantin Komarov 2021-08-13  197  
82cae269cfa953 Konstantin Komarov 2021-08-13  198  	case ATTR_NAME:
82cae269cfa953 Konstantin Komarov 2021-08-13  199  		if (attr->non_res || asize < SIZEOF_ATTRIBUTE_FILENAME + roff ||
82cae269cfa953 Konstantin Komarov 2021-08-13  200  		    rsize < SIZEOF_ATTRIBUTE_FILENAME)
82cae269cfa953 Konstantin Komarov 2021-08-13  201  			goto out;
82cae269cfa953 Konstantin Komarov 2021-08-13  202  
82cae269cfa953 Konstantin Komarov 2021-08-13  203  		fname = Add2Ptr(attr, roff);
82cae269cfa953 Konstantin Komarov 2021-08-13  204  		if (fname->type == FILE_NAME_DOS)
82cae269cfa953 Konstantin Komarov 2021-08-13  205  			goto next_attr;
82cae269cfa953 Konstantin Komarov 2021-08-13  206  
82cae269cfa953 Konstantin Komarov 2021-08-13  207  		names += 1;
82cae269cfa953 Konstantin Komarov 2021-08-13  208  		if (name && name->len == fname->name_len &&
82cae269cfa953 Konstantin Komarov 2021-08-13  209  		    !ntfs_cmp_names_cpu(name, (struct le_str *)&fname->name_len,
82cae269cfa953 Konstantin Komarov 2021-08-13  210  					NULL, false))
82cae269cfa953 Konstantin Komarov 2021-08-13  211  			is_match = true;
82cae269cfa953 Konstantin Komarov 2021-08-13  212  
82cae269cfa953 Konstantin Komarov 2021-08-13  213  		goto next_attr;
82cae269cfa953 Konstantin Komarov 2021-08-13  214  
82cae269cfa953 Konstantin Komarov 2021-08-13  215  	case ATTR_DATA:
82cae269cfa953 Konstantin Komarov 2021-08-13  216  		if (is_dir) {
e8b8e97f91b80f Kari Argillander   2021-08-03  217  			/* Ignore data attribute in dir record. */
82cae269cfa953 Konstantin Komarov 2021-08-13  218  			goto next_attr;
82cae269cfa953 Konstantin Komarov 2021-08-13  219  		}
82cae269cfa953 Konstantin Komarov 2021-08-13  220  
82cae269cfa953 Konstantin Komarov 2021-08-13  221  		if (ino == MFT_REC_BADCLUST && !attr->non_res)
82cae269cfa953 Konstantin Komarov 2021-08-13  222  			goto next_attr;
82cae269cfa953 Konstantin Komarov 2021-08-13  223  
82cae269cfa953 Konstantin Komarov 2021-08-13  224  		if (attr->name_len &&
82cae269cfa953 Konstantin Komarov 2021-08-13  225  		    ((ino != MFT_REC_BADCLUST || !attr->non_res ||
82cae269cfa953 Konstantin Komarov 2021-08-13  226  		      attr->name_len != ARRAY_SIZE(BAD_NAME) ||
82cae269cfa953 Konstantin Komarov 2021-08-13  227  		      memcmp(attr_name(attr), BAD_NAME, sizeof(BAD_NAME))) &&
82cae269cfa953 Konstantin Komarov 2021-08-13  228  		     (ino != MFT_REC_SECURE || !attr->non_res ||
82cae269cfa953 Konstantin Komarov 2021-08-13  229  		      attr->name_len != ARRAY_SIZE(SDS_NAME) ||
82cae269cfa953 Konstantin Komarov 2021-08-13  230  		      memcmp(attr_name(attr), SDS_NAME, sizeof(SDS_NAME))))) {
e8b8e97f91b80f Kari Argillander   2021-08-03  231  			/* File contains stream attribute. Ignore it. */
82cae269cfa953 Konstantin Komarov 2021-08-13  232  			goto next_attr;
82cae269cfa953 Konstantin Komarov 2021-08-13  233  		}
82cae269cfa953 Konstantin Komarov 2021-08-13  234  
82cae269cfa953 Konstantin Komarov 2021-08-13  235  		if (is_attr_sparsed(attr))
82cae269cfa953 Konstantin Komarov 2021-08-13  236  			ni->std_fa |= FILE_ATTRIBUTE_SPARSE_FILE;
82cae269cfa953 Konstantin Komarov 2021-08-13  237  		else
82cae269cfa953 Konstantin Komarov 2021-08-13  238  			ni->std_fa &= ~FILE_ATTRIBUTE_SPARSE_FILE;
82cae269cfa953 Konstantin Komarov 2021-08-13  239  
82cae269cfa953 Konstantin Komarov 2021-08-13  240  		if (is_attr_compressed(attr))
82cae269cfa953 Konstantin Komarov 2021-08-13  241  			ni->std_fa |= FILE_ATTRIBUTE_COMPRESSED;
82cae269cfa953 Konstantin Komarov 2021-08-13  242  		else
82cae269cfa953 Konstantin Komarov 2021-08-13  243  			ni->std_fa &= ~FILE_ATTRIBUTE_COMPRESSED;
82cae269cfa953 Konstantin Komarov 2021-08-13  244  
82cae269cfa953 Konstantin Komarov 2021-08-13  245  		if (is_attr_encrypted(attr))
82cae269cfa953 Konstantin Komarov 2021-08-13  246  			ni->std_fa |= FILE_ATTRIBUTE_ENCRYPTED;
82cae269cfa953 Konstantin Komarov 2021-08-13  247  		else
82cae269cfa953 Konstantin Komarov 2021-08-13  248  			ni->std_fa &= ~FILE_ATTRIBUTE_ENCRYPTED;
82cae269cfa953 Konstantin Komarov 2021-08-13  249  
82cae269cfa953 Konstantin Komarov 2021-08-13  250  		if (!attr->non_res) {
82cae269cfa953 Konstantin Komarov 2021-08-13  251  			ni->i_valid = inode->i_size = rsize;
82cae269cfa953 Konstantin Komarov 2021-08-13  252  			inode_set_bytes(inode, rsize);
82cae269cfa953 Konstantin Komarov 2021-08-13  253  		}
82cae269cfa953 Konstantin Komarov 2021-08-13  254  
564c97bdfa39c7 Kari Argillander   2021-09-07  255  		mode = S_IFREG | (0777 & sbi->options->fs_fmask_inv);
82cae269cfa953 Konstantin Komarov 2021-08-13  256  
82cae269cfa953 Konstantin Komarov 2021-08-13  257  		if (!attr->non_res) {
82cae269cfa953 Konstantin Komarov 2021-08-13  258  			ni->ni_flags |= NI_FLAG_RESIDENT;
82cae269cfa953 Konstantin Komarov 2021-08-13  259  			goto next_attr;
82cae269cfa953 Konstantin Komarov 2021-08-13  260  		}
82cae269cfa953 Konstantin Komarov 2021-08-13  261  
82cae269cfa953 Konstantin Komarov 2021-08-13  262  		inode_set_bytes(inode, attr_ondisk_size(attr));
82cae269cfa953 Konstantin Komarov 2021-08-13  263  
82cae269cfa953 Konstantin Komarov 2021-08-13  264  		ni->i_valid = le64_to_cpu(attr->nres.valid_size);
82cae269cfa953 Konstantin Komarov 2021-08-13  265  		inode->i_size = le64_to_cpu(attr->nres.data_size);
82cae269cfa953 Konstantin Komarov 2021-08-13  266  		if (!attr->nres.alloc_size)
82cae269cfa953 Konstantin Komarov 2021-08-13  267  			goto next_attr;
82cae269cfa953 Konstantin Komarov 2021-08-13  268  
96de65a9413e04 Konstantin Komarov 2023-01-17  269  		run = ino == MFT_REC_BITMAP ? &sbi->used.bitmap.run :
96de65a9413e04 Konstantin Komarov 2023-01-17  270  					      &ni->file.run;
82cae269cfa953 Konstantin Komarov 2021-08-13  271  		break;
82cae269cfa953 Konstantin Komarov 2021-08-13  272  
82cae269cfa953 Konstantin Komarov 2021-08-13  273  	case ATTR_ROOT:
82cae269cfa953 Konstantin Komarov 2021-08-13  274  		if (attr->non_res)
82cae269cfa953 Konstantin Komarov 2021-08-13  275  			goto out;
82cae269cfa953 Konstantin Komarov 2021-08-13  276  
82cae269cfa953 Konstantin Komarov 2021-08-13  277  		root = Add2Ptr(attr, roff);
82cae269cfa953 Konstantin Komarov 2021-08-13  278  
82cae269cfa953 Konstantin Komarov 2021-08-13  279  		if (attr->name_len != ARRAY_SIZE(I30_NAME) ||
82cae269cfa953 Konstantin Komarov 2021-08-13  280  		    memcmp(attr_name(attr), I30_NAME, sizeof(I30_NAME)))
82cae269cfa953 Konstantin Komarov 2021-08-13  281  			goto next_attr;
82cae269cfa953 Konstantin Komarov 2021-08-13  282  
82cae269cfa953 Konstantin Komarov 2021-08-13  283  		if (root->type != ATTR_NAME ||
82cae269cfa953 Konstantin Komarov 2021-08-13  284  		    root->rule != NTFS_COLLATION_TYPE_FILENAME)
82cae269cfa953 Konstantin Komarov 2021-08-13  285  			goto out;
82cae269cfa953 Konstantin Komarov 2021-08-13  286  
82cae269cfa953 Konstantin Komarov 2021-08-13  287  		if (!is_dir)
82cae269cfa953 Konstantin Komarov 2021-08-13  288  			goto next_attr;
82cae269cfa953 Konstantin Komarov 2021-08-13  289  
bfa434c60157c9 Chen Zhongjin      2022-11-22  290  		is_root = true;
82cae269cfa953 Konstantin Komarov 2021-08-13  291  		ni->ni_flags |= NI_FLAG_DIR;
82cae269cfa953 Konstantin Komarov 2021-08-13  292  
82cae269cfa953 Konstantin Komarov 2021-08-13  293  		err = indx_init(&ni->dir, sbi, attr, INDEX_MUTEX_I30);
82cae269cfa953 Konstantin Komarov 2021-08-13  294  		if (err)
82cae269cfa953 Konstantin Komarov 2021-08-13  295  			goto out;
82cae269cfa953 Konstantin Komarov 2021-08-13  296  
96de65a9413e04 Konstantin Komarov 2023-01-17  297  		mode = sb->s_root ?
96de65a9413e04 Konstantin Komarov 2023-01-17  298  			       (S_IFDIR | (0777 & sbi->options->fs_dmask_inv)) :
96de65a9413e04 Konstantin Komarov 2023-01-17  299  			       (S_IFDIR | 0777);
82cae269cfa953 Konstantin Komarov 2021-08-13  300  		goto next_attr;
82cae269cfa953 Konstantin Komarov 2021-08-13  301  
82cae269cfa953 Konstantin Komarov 2021-08-13  302  	case ATTR_ALLOC:
82cae269cfa953 Konstantin Komarov 2021-08-13  303  		if (!is_root || attr->name_len != ARRAY_SIZE(I30_NAME) ||
82cae269cfa953 Konstantin Komarov 2021-08-13  304  		    memcmp(attr_name(attr), I30_NAME, sizeof(I30_NAME)))
82cae269cfa953 Konstantin Komarov 2021-08-13  305  			goto next_attr;
82cae269cfa953 Konstantin Komarov 2021-08-13  306  
82cae269cfa953 Konstantin Komarov 2021-08-13  307  		inode->i_size = le64_to_cpu(attr->nres.data_size);
82cae269cfa953 Konstantin Komarov 2021-08-13  308  		ni->i_valid = le64_to_cpu(attr->nres.valid_size);
82cae269cfa953 Konstantin Komarov 2021-08-13  309  		inode_set_bytes(inode, le64_to_cpu(attr->nres.alloc_size));
82cae269cfa953 Konstantin Komarov 2021-08-13  310  
82cae269cfa953 Konstantin Komarov 2021-08-13  311  		run = &ni->dir.alloc_run;
82cae269cfa953 Konstantin Komarov 2021-08-13  312  		break;
82cae269cfa953 Konstantin Komarov 2021-08-13  313  
82cae269cfa953 Konstantin Komarov 2021-08-13  314  	case ATTR_BITMAP:
82cae269cfa953 Konstantin Komarov 2021-08-13  315  		if (ino == MFT_REC_MFT) {
82cae269cfa953 Konstantin Komarov 2021-08-13  316  			if (!attr->non_res)
82cae269cfa953 Konstantin Komarov 2021-08-13  317  				goto out;
82cae269cfa953 Konstantin Komarov 2021-08-13  318  #ifndef CONFIG_NTFS3_64BIT_CLUSTER
82cae269cfa953 Konstantin Komarov 2021-08-13  319  			/* 0x20000000 = 2^32 / 8 */
82cae269cfa953 Konstantin Komarov 2021-08-13  320  			if (le64_to_cpu(attr->nres.alloc_size) >= 0x20000000)
82cae269cfa953 Konstantin Komarov 2021-08-13  321  				goto out;
82cae269cfa953 Konstantin Komarov 2021-08-13  322  #endif
82cae269cfa953 Konstantin Komarov 2021-08-13  323  			run = &sbi->mft.bitmap.run;
82cae269cfa953 Konstantin Komarov 2021-08-13  324  			break;
82cae269cfa953 Konstantin Komarov 2021-08-13  325  		} else if (is_dir && attr->name_len == ARRAY_SIZE(I30_NAME) &&
82cae269cfa953 Konstantin Komarov 2021-08-13  326  			   !memcmp(attr_name(attr), I30_NAME,
82cae269cfa953 Konstantin Komarov 2021-08-13  327  				   sizeof(I30_NAME)) &&
82cae269cfa953 Konstantin Komarov 2021-08-13  328  			   attr->non_res) {
82cae269cfa953 Konstantin Komarov 2021-08-13  329  			run = &ni->dir.bitmap_run;
82cae269cfa953 Konstantin Komarov 2021-08-13  330  			break;
82cae269cfa953 Konstantin Komarov 2021-08-13  331  		}
82cae269cfa953 Konstantin Komarov 2021-08-13  332  		goto next_attr;
82cae269cfa953 Konstantin Komarov 2021-08-13  333  
82cae269cfa953 Konstantin Komarov 2021-08-13  334  	case ATTR_REPARSE:
82cae269cfa953 Konstantin Komarov 2021-08-13  335  		if (attr->name_len)
82cae269cfa953 Konstantin Komarov 2021-08-13  336  			goto next_attr;
82cae269cfa953 Konstantin Komarov 2021-08-13  337  
82cae269cfa953 Konstantin Komarov 2021-08-13  338  		rp_fa = ni_parse_reparse(ni, attr, &rp);
82cae269cfa953 Konstantin Komarov 2021-08-13  339  		switch (rp_fa) {
82cae269cfa953 Konstantin Komarov 2021-08-13  340  		case REPARSE_LINK:
22b05f1ac0332c Konstantin Komarov 2021-10-05  341  			/*
22b05f1ac0332c Konstantin Komarov 2021-10-05  342  			 * Normal symlink.
22b05f1ac0332c Konstantin Komarov 2021-10-05  343  			 * Assume one unicode symbol == one utf8.
22b05f1ac0332c Konstantin Komarov 2021-10-05  344  			 */
22b05f1ac0332c Konstantin Komarov 2021-10-05  345  			inode->i_size = le16_to_cpu(rp.SymbolicLinkReparseBuffer
22b05f1ac0332c Konstantin Komarov 2021-10-05  346  							    .PrintNameLength) /
22b05f1ac0332c Konstantin Komarov 2021-10-05  347  					sizeof(u16);
82cae269cfa953 Konstantin Komarov 2021-08-13  348  
82cae269cfa953 Konstantin Komarov 2021-08-13  349  			ni->i_valid = inode->i_size;
82cae269cfa953 Konstantin Komarov 2021-08-13  350  
e8b8e97f91b80f Kari Argillander   2021-08-03  351  			/* Clear directory bit. */
82cae269cfa953 Konstantin Komarov 2021-08-13  352  			if (ni->ni_flags & NI_FLAG_DIR) {
82cae269cfa953 Konstantin Komarov 2021-08-13  353  				indx_clear(&ni->dir);
82cae269cfa953 Konstantin Komarov 2021-08-13  354  				memset(&ni->dir, 0, sizeof(ni->dir));
82cae269cfa953 Konstantin Komarov 2021-08-13  355  				ni->ni_flags &= ~NI_FLAG_DIR;
82cae269cfa953 Konstantin Komarov 2021-08-13  356  			} else {
82cae269cfa953 Konstantin Komarov 2021-08-13  357  				run_close(&ni->file.run);
82cae269cfa953 Konstantin Komarov 2021-08-13  358  			}
82cae269cfa953 Konstantin Komarov 2021-08-13  359  			mode = S_IFLNK | 0777;
82cae269cfa953 Konstantin Komarov 2021-08-13  360  			is_dir = false;
82cae269cfa953 Konstantin Komarov 2021-08-13  361  			if (attr->non_res) {
82cae269cfa953 Konstantin Komarov 2021-08-13  362  				run = &ni->file.run;
e8b8e97f91b80f Kari Argillander   2021-08-03  363  				goto attr_unpack_run; // Double break.
82cae269cfa953 Konstantin Komarov 2021-08-13  364  			}
82cae269cfa953 Konstantin Komarov 2021-08-13  365  			break;
82cae269cfa953 Konstantin Komarov 2021-08-13  366  
82cae269cfa953 Konstantin Komarov 2021-08-13  367  		case REPARSE_COMPRESSED:
82cae269cfa953 Konstantin Komarov 2021-08-13  368  			break;
82cae269cfa953 Konstantin Komarov 2021-08-13  369  
82cae269cfa953 Konstantin Komarov 2021-08-13  370  		case REPARSE_DEDUPLICATED:
82cae269cfa953 Konstantin Komarov 2021-08-13  371  			break;
82cae269cfa953 Konstantin Komarov 2021-08-13  372  		}
82cae269cfa953 Konstantin Komarov 2021-08-13  373  		goto next_attr;
82cae269cfa953 Konstantin Komarov 2021-08-13  374  
82cae269cfa953 Konstantin Komarov 2021-08-13  375  	case ATTR_EA_INFO:
82cae269cfa953 Konstantin Komarov 2021-08-13  376  		if (!attr->name_len &&
82cae269cfa953 Konstantin Komarov 2021-08-13  377  		    resident_data_ex(attr, sizeof(struct EA_INFO))) {
82cae269cfa953 Konstantin Komarov 2021-08-13  378  			ni->ni_flags |= NI_FLAG_EA;
82cae269cfa953 Konstantin Komarov 2021-08-13  379  			/*
82cae269cfa953 Konstantin Komarov 2021-08-13  380  			 * ntfs_get_wsl_perm updates inode->i_uid, inode->i_gid, inode->i_mode
82cae269cfa953 Konstantin Komarov 2021-08-13  381  			 */
82cae269cfa953 Konstantin Komarov 2021-08-13  382  			inode->i_mode = mode;
82cae269cfa953 Konstantin Komarov 2021-08-13  383  			ntfs_get_wsl_perm(inode);
82cae269cfa953 Konstantin Komarov 2021-08-13  384  			mode = inode->i_mode;
82cae269cfa953 Konstantin Komarov 2021-08-13  385  		}
82cae269cfa953 Konstantin Komarov 2021-08-13  386  		goto next_attr;
82cae269cfa953 Konstantin Komarov 2021-08-13  387  
82cae269cfa953 Konstantin Komarov 2021-08-13  388  	default:
82cae269cfa953 Konstantin Komarov 2021-08-13  389  		goto next_attr;
82cae269cfa953 Konstantin Komarov 2021-08-13  390  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  391  
82cae269cfa953 Konstantin Komarov 2021-08-13  392  attr_unpack_run:
82cae269cfa953 Konstantin Komarov 2021-08-13  393  	roff = le16_to_cpu(attr->nres.run_off);
82cae269cfa953 Konstantin Komarov 2021-08-13  394  
6db620863f8528 Edward Lo          2022-08-06  395  	if (roff > asize) {
6db620863f8528 Edward Lo          2022-08-06  396  		err = -EINVAL;
6db620863f8528 Edward Lo          2022-08-06  397  		goto out;
6db620863f8528 Edward Lo          2022-08-06  398  	}
6db620863f8528 Edward Lo          2022-08-06  399  
82cae269cfa953 Konstantin Komarov 2021-08-13  400  	t64 = le64_to_cpu(attr->nres.svcn);
887bfc546097fb Hawkins Jiawei     2022-09-23  401  
82cae269cfa953 Konstantin Komarov 2021-08-13  402  	err = run_unpack_ex(run, sbi, ino, t64, le64_to_cpu(attr->nres.evcn),
82cae269cfa953 Konstantin Komarov 2021-08-13  403  			    t64, Add2Ptr(attr, roff), asize - roff);
82cae269cfa953 Konstantin Komarov 2021-08-13  404  	if (err < 0)
82cae269cfa953 Konstantin Komarov 2021-08-13  405  		goto out;
82cae269cfa953 Konstantin Komarov 2021-08-13  406  	err = 0;
82cae269cfa953 Konstantin Komarov 2021-08-13  407  	goto next_attr;
82cae269cfa953 Konstantin Komarov 2021-08-13  408  
82cae269cfa953 Konstantin Komarov 2021-08-13  409  end_enum:
82cae269cfa953 Konstantin Komarov 2021-08-13  410  
82cae269cfa953 Konstantin Komarov 2021-08-13  411  	if (!std5)
82cae269cfa953 Konstantin Komarov 2021-08-13  412  		goto out;
82cae269cfa953 Konstantin Komarov 2021-08-13  413  
82cae269cfa953 Konstantin Komarov 2021-08-13  414  	if (!is_match && name) {
e8b8e97f91b80f Kari Argillander   2021-08-03  415  		/* Reuse rec as buffer for ascii name. */
82cae269cfa953 Konstantin Komarov 2021-08-13  416  		err = -ENOENT;
82cae269cfa953 Konstantin Komarov 2021-08-13  417  		goto out;
82cae269cfa953 Konstantin Komarov 2021-08-13  418  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  419  
82cae269cfa953 Konstantin Komarov 2021-08-13  420  	if (std5->fa & FILE_ATTRIBUTE_READONLY)
82cae269cfa953 Konstantin Komarov 2021-08-13  421  		mode &= ~0222;
82cae269cfa953 Konstantin Komarov 2021-08-13  422  
82cae269cfa953 Konstantin Komarov 2021-08-13  423  	if (!names) {
82cae269cfa953 Konstantin Komarov 2021-08-13  424  		err = -EINVAL;
82cae269cfa953 Konstantin Komarov 2021-08-13  425  		goto out;
82cae269cfa953 Konstantin Komarov 2021-08-13  426  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  427  
78ab59fee07f22 Konstantin Komarov 2021-08-31  428  	if (names != le16_to_cpu(rec->hard_links)) {
78ab59fee07f22 Konstantin Komarov 2021-08-31  429  		/* Correct minor error on the fly. Do not mark inode as dirty. */
78ab59fee07f22 Konstantin Komarov 2021-08-31  430  		rec->hard_links = cpu_to_le16(names);
78ab59fee07f22 Konstantin Komarov 2021-08-31  431  		ni->mi.dirty = true;
78ab59fee07f22 Konstantin Komarov 2021-08-31  432  	}
78ab59fee07f22 Konstantin Komarov 2021-08-31  433  
82cae269cfa953 Konstantin Komarov 2021-08-13  434  	set_nlink(inode, names);
82cae269cfa953 Konstantin Komarov 2021-08-13  435  
82cae269cfa953 Konstantin Komarov 2021-08-13  436  	if (S_ISDIR(mode)) {
82cae269cfa953 Konstantin Komarov 2021-08-13  437  		ni->std_fa |= FILE_ATTRIBUTE_DIRECTORY;
82cae269cfa953 Konstantin Komarov 2021-08-13  438  
82cae269cfa953 Konstantin Komarov 2021-08-13  439  		/*
e8b8e97f91b80f Kari Argillander   2021-08-03  440  		 * Dot and dot-dot should be included in count but was not
82cae269cfa953 Konstantin Komarov 2021-08-13  441  		 * included in enumeration.
e8b8e97f91b80f Kari Argillander   2021-08-03  442  		 * Usually a hard links to directories are disabled.
82cae269cfa953 Konstantin Komarov 2021-08-13  443  		 */
82cae269cfa953 Konstantin Komarov 2021-08-13  444  		inode->i_op = &ntfs_dir_inode_operations;
82cae269cfa953 Konstantin Komarov 2021-08-13  445  		inode->i_fop = &ntfs_dir_operations;
82cae269cfa953 Konstantin Komarov 2021-08-13  446  		ni->i_valid = 0;
82cae269cfa953 Konstantin Komarov 2021-08-13  447  	} else if (S_ISLNK(mode)) {
82cae269cfa953 Konstantin Komarov 2021-08-13  448  		ni->std_fa &= ~FILE_ATTRIBUTE_DIRECTORY;
82cae269cfa953 Konstantin Komarov 2021-08-13  449  		inode->i_op = &ntfs_link_inode_operations;
82cae269cfa953 Konstantin Komarov 2021-08-13  450  		inode->i_fop = NULL;
22b05f1ac0332c Konstantin Komarov 2021-10-05  451  		inode_nohighmem(inode);
82cae269cfa953 Konstantin Komarov 2021-08-13  452  	} else if (S_ISREG(mode)) {
82cae269cfa953 Konstantin Komarov 2021-08-13  453  		ni->std_fa &= ~FILE_ATTRIBUTE_DIRECTORY;
82cae269cfa953 Konstantin Komarov 2021-08-13  454  		inode->i_op = &ntfs_file_inode_operations;
82cae269cfa953 Konstantin Komarov 2021-08-13  455  		inode->i_fop = &ntfs_file_operations;
96de65a9413e04 Konstantin Komarov 2023-01-17  456  		inode->i_mapping->a_ops = is_compressed(ni) ? &ntfs_aops_cmpr :
96de65a9413e04 Konstantin Komarov 2023-01-17  457  							      &ntfs_aops;
82cae269cfa953 Konstantin Komarov 2021-08-13  458  		if (ino != MFT_REC_MFT)
82cae269cfa953 Konstantin Komarov 2021-08-13  459  			init_rwsem(&ni->file.run_lock);
82cae269cfa953 Konstantin Komarov 2021-08-13  460  	} else if (S_ISCHR(mode) || S_ISBLK(mode) || S_ISFIFO(mode) ||
82cae269cfa953 Konstantin Komarov 2021-08-13  461  		   S_ISSOCK(mode)) {
82cae269cfa953 Konstantin Komarov 2021-08-13  462  		inode->i_op = &ntfs_special_inode_operations;
82cae269cfa953 Konstantin Komarov 2021-08-13  463  		init_special_inode(inode, mode, inode->i_rdev);
82cae269cfa953 Konstantin Komarov 2021-08-13  464  	} else if (fname && fname->home.low == cpu_to_le32(MFT_REC_EXTEND) &&
82cae269cfa953 Konstantin Komarov 2021-08-13  465  		   fname->home.seq == cpu_to_le16(MFT_REC_EXTEND)) {
e8b8e97f91b80f Kari Argillander   2021-08-03  466  		/* Records in $Extend are not a files or general directories. */
37a530bfe56ca9 Konstantin Komarov 2022-05-26  467  		inode->i_op = &ntfs_file_inode_operations;
82cae269cfa953 Konstantin Komarov 2021-08-13  468  	} else {
82cae269cfa953 Konstantin Komarov 2021-08-13  469  		err = -EINVAL;
82cae269cfa953 Konstantin Komarov 2021-08-13  470  		goto out;
82cae269cfa953 Konstantin Komarov 2021-08-13  471  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  472  
564c97bdfa39c7 Kari Argillander   2021-09-07  473  	if ((sbi->options->sys_immutable &&
82cae269cfa953 Konstantin Komarov 2021-08-13  474  	     (std5->fa & FILE_ATTRIBUTE_SYSTEM)) &&
82cae269cfa953 Konstantin Komarov 2021-08-13  475  	    !S_ISFIFO(mode) && !S_ISSOCK(mode) && !S_ISLNK(mode)) {
82cae269cfa953 Konstantin Komarov 2021-08-13  476  		inode->i_flags |= S_IMMUTABLE;
82cae269cfa953 Konstantin Komarov 2021-08-13  477  	} else {
82cae269cfa953 Konstantin Komarov 2021-08-13  478  		inode->i_flags &= ~S_IMMUTABLE;
82cae269cfa953 Konstantin Komarov 2021-08-13  479  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  480  
82cae269cfa953 Konstantin Komarov 2021-08-13  481  	inode->i_mode = mode;
82cae269cfa953 Konstantin Komarov 2021-08-13  482  	if (!(ni->ni_flags & NI_FLAG_EA)) {
e8b8e97f91b80f Kari Argillander   2021-08-03  483  		/* If no xattr then no security (stored in xattr). */
82cae269cfa953 Konstantin Komarov 2021-08-13  484  		inode->i_flags |= S_NOSEC;
82cae269cfa953 Konstantin Komarov 2021-08-13  485  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  486  
82cae269cfa953 Konstantin Komarov 2021-08-13  487  	if (ino == MFT_REC_MFT && !sb->s_root)
82cae269cfa953 Konstantin Komarov 2021-08-13  488  		sbi->mft.ni = NULL;
82cae269cfa953 Konstantin Komarov 2021-08-13  489  
82cae269cfa953 Konstantin Komarov 2021-08-13  490  	unlock_new_inode(inode);
82cae269cfa953 Konstantin Komarov 2021-08-13  491  
82cae269cfa953 Konstantin Komarov 2021-08-13  492  	return inode;
82cae269cfa953 Konstantin Komarov 2021-08-13  493  
82cae269cfa953 Konstantin Komarov 2021-08-13  494  out:
82cae269cfa953 Konstantin Komarov 2021-08-13  495  	if (ino == MFT_REC_MFT && !sb->s_root)
82cae269cfa953 Konstantin Komarov 2021-08-13  496  		sbi->mft.ni = NULL;
82cae269cfa953 Konstantin Komarov 2021-08-13  497  
82cae269cfa953 Konstantin Komarov 2021-08-13  498  	iget_failed(inode);
82cae269cfa953 Konstantin Komarov 2021-08-13  499  	return ERR_PTR(err);
82cae269cfa953 Konstantin Komarov 2021-08-13  500  }
82cae269cfa953 Konstantin Komarov 2021-08-13  501  

:::::: The code at line 176 was first introduced by commit
:::::: 82cae269cfa953032fbb8980a7d554d60fb00b17 fs/ntfs3: Add initialization of super block

:::::: TO: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
:::::: CC: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
