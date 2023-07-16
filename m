Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3586B8F6A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jul 2023 20:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689540752; x=1721076752;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hrqfjnXQQ1sjTLZKufunDGO2NhW4LrySLlDBXrzjWz8=;
  b=j04aa0Mm9+9HZSPevWsry+CtalPeOQ1Lre0ZtH24DX5ZVtBrxR33uyOT
   k54b9oGDIsqVNBTUA79RCdTsz5ALwEyuWWUvH5IGyAvfufCLt05JdtgEl
   Terem/VgO9PlUn6dAOwJIKUz8U3VNYFdRIs8j9W9b3YVyYRMaSmG23Aee
   KOaZCX1onNx9S3kTF+SoE/fBp97bPsXvTgxBB7jVzYmIgi/moad3Shnc3
   6G16P3qMX4jS9M3FMFbzjhYo9voIC/7HwQHe4dpqwpu8+IfZED1+Kvg/G
   BcUCReHjst/hgIE1YTEvUWgz/NlyzWgN1ViIf3KcgKVJisbN5LavVWaTq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="431970271"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="431970271"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2023 13:52:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="896986571"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="896986571"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 16 Jul 2023 13:52:30 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qL8jF-0008zk-2H;
	Sun, 16 Jul 2023 20:52:29 +0000
Date: Mon, 17 Jul 2023 04:51:35 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:start-write-safe 3/9] fs/overlayfs/copy_up.c:317
 ovl_copy_up_file() warn: unsigned 'old_pos + this_len' is never less than
 zero.
Message-ID: <202307170429.X0xM5Ozr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux start-write-safe
head:   d76b75f83f5ddf7c5bc577abeed31fed21f31c9f
commit: b59002b2c67cbf150a6a52e68d54f0e29f0f3f13 [3/9] splice: move permission hook out of do_splice_direct()
config: x86_64-randconfig-m001-20230716 (https://download.01.org/0day-ci/archive/20230717/202307170429.X0xM5Ozr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230717/202307170429.X0xM5Ozr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307170429.X0xM5Ozr-lkp@intel.com/

New smatch warnings:
fs/overlayfs/copy_up.c:317 ovl_copy_up_file() warn: unsigned 'old_pos + this_len' is never less than zero.

Old smatch warnings:
fs/overlayfs/copy_up.c:466 ovl_set_origin() warn: variable dereferenced before check 'fh' (see line 465)

vim +317 fs/overlayfs/copy_up.c

   232	
   233	static int ovl_copy_up_file(struct ovl_fs *ofs, struct dentry *dentry,
   234				    struct file *new_file, loff_t len)
   235	{
   236		struct path datapath;
   237		struct file *old_file;
   238		loff_t old_pos = 0;
   239		loff_t new_pos = 0;
   240		loff_t cloned;
   241		loff_t data_pos = -1;
   242		loff_t hole_len;
   243		bool skip_hole = false;
   244		int error = 0;
   245	
   246		ovl_path_lowerdata(dentry, &datapath);
   247		if (WARN_ON_ONCE(datapath.dentry == NULL) ||
   248		    WARN_ON_ONCE(len < 0))
   249			return -EIO;
   250	
   251		old_file = ovl_path_open(&datapath, O_LARGEFILE | O_RDONLY);
   252		if (IS_ERR(old_file))
   253			return PTR_ERR(old_file);
   254	
   255		error = rw_verify_area(READ, old_file, &old_pos, len);
   256		if (error)
   257			goto out_fput;
   258	
   259		error = rw_verify_area(WRITE, new_file, &new_pos, len);
   260		if (error)
   261			goto out_fput;
   262	
   263		/* Try to use clone_file_range to clone up within the same fs */
   264		cloned = do_clone_file_range(old_file, 0, new_file, 0, len, 0);
   265		if (cloned == len)
   266			goto out_fput;
   267		/* Couldn't clone, so now we try to copy the data */
   268	
   269		/* Check if lower fs supports seek operation */
   270		if (old_file->f_mode & FMODE_LSEEK)
   271			skip_hole = true;
   272	
   273		while (len) {
   274			size_t this_len = OVL_COPY_UP_CHUNK_SIZE;
   275			long bytes;
   276	
   277			if (len < this_len)
   278				this_len = len;
   279	
   280			if (signal_pending_state(TASK_KILLABLE, current)) {
   281				error = -EINTR;
   282				break;
   283			}
   284	
   285			/*
   286			 * Fill zero for hole will cost unnecessary disk space
   287			 * and meanwhile slow down the copy-up speed, so we do
   288			 * an optimization for hole during copy-up, it relies
   289			 * on SEEK_DATA implementation in lower fs so if lower
   290			 * fs does not support it, copy-up will behave as before.
   291			 *
   292			 * Detail logic of hole detection as below:
   293			 * When we detect next data position is larger than current
   294			 * position we will skip that hole, otherwise we copy
   295			 * data in the size of OVL_COPY_UP_CHUNK_SIZE. Actually,
   296			 * it may not recognize all kind of holes and sometimes
   297			 * only skips partial of hole area. However, it will be
   298			 * enough for most of the use cases.
   299			 */
   300	
   301			if (skip_hole && data_pos < old_pos) {
   302				data_pos = vfs_llseek(old_file, old_pos, SEEK_DATA);
   303				if (data_pos > old_pos) {
   304					hole_len = data_pos - old_pos;
   305					len -= hole_len;
   306					old_pos = new_pos = data_pos;
   307					continue;
   308				} else if (data_pos == -ENXIO) {
   309					break;
   310				} else if (data_pos < 0) {
   311					skip_hole = false;
   312				}
   313			}
   314	
   315			if (WARN_ON_ONCE(old_pos != new_pos) ||
   316			    WARN_ON_ONCE(old_pos < 0) ||
 > 317			    WARN_ON_ONCE(old_pos + this_len < 0)) {
   318				error = -EIO;
   319				break;
   320			}
   321	
   322			bytes = do_splice_direct(old_file, &old_pos,
   323						 new_file, &new_pos,
   324						 this_len, SPLICE_F_MOVE);
   325			if (bytes <= 0) {
   326				error = bytes;
   327				break;
   328			}
   329			WARN_ON(old_pos != new_pos);
   330	
   331			len -= bytes;
   332		}
   333		if (!error && ovl_should_sync(ofs))
   334			error = vfs_fsync(new_file, 0);
   335	out_fput:
   336		fput(old_file);
   337		return error;
   338	}
   339	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
