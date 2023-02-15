Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45125CB8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Feb 2023 14:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676470217; x=1708006217;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G3sdtj1pQSPvE2n5vJfEhLp9Mxnj+g+GIASn56FMiyg=;
  b=a0x3oQMvWnQDfo1JAmVhhPjJJFoqSBcviJa/KWixNYLDtZ76al+ZwC7f
   e8yIAS5LNcKYZwiasFpchkcfRQbc+NXVdhzZI84SAbRHTe8z1dhru4EDT
   HffCRl6MmYR9anCfSRL8uLqqu2ZVwZTHbXTxsZNWZ4bOiPDnXLmbZRGMA
   7NvE6BOwdrTX7jyUrTjeK/duTbpM2GqnCV9D48swpthHDw7jAFVGNl2KV
   9AEQX9Of4/M8dicQtwGLcwpEQHWEaTjlssWmPTUR0K08CwWt9W6/a9cb1
   jyVo6NrDai9pa5ufqPmQiy4jXNgwVC3hIZMQkoYiSXwnKJB1+j91ZhTAR
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="329153318"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; 
   d="scan'208";a="329153318"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 06:07:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="619441321"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; 
   d="scan'208";a="619441321"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 15 Feb 2023 06:07:48 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSIRo-0009QV-0o;
	Wed, 15 Feb 2023 14:07:48 +0000
Date: Wed, 15 Feb 2023 22:07:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-trusty-5.10 1415/7892]
 fs/incfs/pseudo_files.c:682:48: sparse: sparse: non size-preserving integer
 to pointer cast
Message-ID: <202302152224.Or2ZrGgs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-trusty-5.10
head:   e88b0fcae6db893ef5f2a45ad70499e02ee01a4e
commit: 8334d69e65f6064aede4fb56fe15ae30630d5337 [1415/7892] ANDROID: Incremental fs: Separate pseudo-file code
config: i386-randconfig-s002 (https://download.01.org/0day-ci/archive/20230215/202302152224.Or2ZrGgs-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android12-trusty-5.10
        git checkout 8334d69e65f6064aede4fb56fe15ae30630d5337
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/md/ fs/incfs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302152224.Or2ZrGgs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/incfs/pseudo_files.c:885:25: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected unsigned long long [usertype] size @@     got restricted __le64 [addressable] [assigned] [usertype] size_attr_value @@
   fs/incfs/pseudo_files.c:885:25: sparse:     expected unsigned long long [usertype] size
   fs/incfs/pseudo_files.c:885:25: sparse:     got restricted __le64 [addressable] [assigned] [usertype] size_attr_value
   fs/incfs/pseudo_files.c:885:42: sparse: sparse: incorrect type in argument 5 (different base types) @@     expected unsigned long long [usertype] offset @@     got restricted __le64 [usertype] @@
   fs/incfs/pseudo_files.c:885:42: sparse:     expected unsigned long long [usertype] offset
   fs/incfs/pseudo_files.c:885:42: sparse:     got restricted __le64 [usertype]
>> fs/incfs/pseudo_files.c:682:48: sparse: sparse: non size-preserving integer to pointer cast

vim +682 fs/incfs/pseudo_files.c

   517	
   518	static long ioctl_create_file(struct mount_info *mi,
   519				struct incfs_new_file_args __user *usr_args)
   520	{
   521		struct incfs_new_file_args args;
   522		char *file_id_str = NULL;
   523		struct dentry *index_file_dentry = NULL;
   524		struct dentry *named_file_dentry = NULL;
   525		struct path parent_dir_path = {};
   526		struct inode *index_dir_inode = NULL;
   527		__le64 size_attr_value = 0;
   528		char *file_name = NULL;
   529		char *attr_value = NULL;
   530		int error = 0;
   531		bool locked = false;
   532	
   533		if (!mi || !mi->mi_index_dir) {
   534			error = -EFAULT;
   535			goto out;
   536		}
   537	
   538		if (copy_from_user(&args, usr_args, sizeof(args)) > 0) {
   539			error = -EFAULT;
   540			goto out;
   541		}
   542	
   543		file_name = strndup_user(u64_to_user_ptr(args.file_name), PATH_MAX);
   544		if (IS_ERR(file_name)) {
   545			error = PTR_ERR(file_name);
   546			file_name = NULL;
   547			goto out;
   548		}
   549	
   550		error = validate_name(file_name);
   551		if (error)
   552			goto out;
   553	
   554		file_id_str = file_id_to_str(args.file_id);
   555		if (!file_id_str) {
   556			error = -ENOMEM;
   557			goto out;
   558		}
   559	
   560		error = mutex_lock_interruptible(&mi->mi_dir_struct_mutex);
   561		if (error)
   562			goto out;
   563		locked = true;
   564	
   565		/* Find a directory to put the file into. */
   566		error = dir_relative_path_resolve(mi,
   567				u64_to_user_ptr(args.directory_path),
   568				&parent_dir_path);
   569		if (error)
   570			goto out;
   571	
   572		if (parent_dir_path.dentry == mi->mi_index_dir) {
   573			/* Can't create a file directly inside .index */
   574			error = -EBUSY;
   575			goto out;
   576		}
   577	
   578		/* Look up a dentry in the parent dir. It should be negative. */
   579		named_file_dentry = incfs_lookup_dentry(parent_dir_path.dentry,
   580						file_name);
   581		if (!named_file_dentry) {
   582			error = -EFAULT;
   583			goto out;
   584		}
   585		if (IS_ERR(named_file_dentry)) {
   586			error = PTR_ERR(named_file_dentry);
   587			named_file_dentry = NULL;
   588			goto out;
   589		}
   590		if (d_really_is_positive(named_file_dentry)) {
   591			/* File with this path already exists. */
   592			error = -EEXIST;
   593			goto out;
   594		}
   595		/* Look up a dentry in the .index dir. It should be negative. */
   596		index_file_dentry = incfs_lookup_dentry(mi->mi_index_dir, file_id_str);
   597		if (!index_file_dentry) {
   598			error = -EFAULT;
   599			goto out;
   600		}
   601		if (IS_ERR(index_file_dentry)) {
   602			error = PTR_ERR(index_file_dentry);
   603			index_file_dentry = NULL;
   604			goto out;
   605		}
   606		if (d_really_is_positive(index_file_dentry)) {
   607			/* File with this ID already exists in index. */
   608			error = -EEXIST;
   609			goto out;
   610		}
   611	
   612		/* Creating a file in the .index dir. */
   613		index_dir_inode = d_inode(mi->mi_index_dir);
   614		inode_lock_nested(index_dir_inode, I_MUTEX_PARENT);
   615		error = vfs_create(index_dir_inode, index_file_dentry, args.mode | 0222,
   616				   true);
   617		inode_unlock(index_dir_inode);
   618	
   619		if (error)
   620			goto out;
   621		if (!d_really_is_positive(index_file_dentry)) {
   622			error = -EINVAL;
   623			goto out;
   624		}
   625	
   626		error = chmod(index_file_dentry, args.mode | 0222);
   627		if (error) {
   628			pr_debug("incfs: chmod err: %d\n", error);
   629			goto delete_index_file;
   630		}
   631	
   632		/* Save the file's ID as an xattr for easy fetching in future. */
   633		error = vfs_setxattr(index_file_dentry, INCFS_XATTR_ID_NAME,
   634			file_id_str, strlen(file_id_str), XATTR_CREATE);
   635		if (error) {
   636			pr_debug("incfs: vfs_setxattr err:%d\n", error);
   637			goto delete_index_file;
   638		}
   639	
   640		/* Save the file's size as an xattr for easy fetching in future. */
   641		size_attr_value = cpu_to_le64(args.size);
   642		error = vfs_setxattr(index_file_dentry, INCFS_XATTR_SIZE_NAME,
   643			(char *)&size_attr_value, sizeof(size_attr_value),
   644			XATTR_CREATE);
   645		if (error) {
   646			pr_debug("incfs: vfs_setxattr err:%d\n", error);
   647			goto delete_index_file;
   648		}
   649	
   650		/* Save the file's attribute as an xattr */
   651		if (args.file_attr_len && args.file_attr) {
   652			if (args.file_attr_len > INCFS_MAX_FILE_ATTR_SIZE) {
   653				error = -E2BIG;
   654				goto delete_index_file;
   655			}
   656	
   657			attr_value = kmalloc(args.file_attr_len, GFP_NOFS);
   658			if (!attr_value) {
   659				error = -ENOMEM;
   660				goto delete_index_file;
   661			}
   662	
   663			if (copy_from_user(attr_value,
   664					u64_to_user_ptr(args.file_attr),
   665					args.file_attr_len) > 0) {
   666				error = -EFAULT;
   667				goto delete_index_file;
   668			}
   669	
   670			error = vfs_setxattr(index_file_dentry,
   671					INCFS_XATTR_METADATA_NAME,
   672					attr_value, args.file_attr_len,
   673					XATTR_CREATE);
   674	
   675			if (error)
   676				goto delete_index_file;
   677		}
   678	
   679		/* Initializing a newly created file. */
   680		error = init_new_file(mi, index_file_dentry, &args.file_id, args.size,
   681				      range(attr_value, args.file_attr_len),
 > 682				      (u8 __user *)args.signature_info,
   683				      args.signature_size);
   684		if (error)
   685			goto delete_index_file;
   686	
   687		/* Linking a file with its real name from the requested dir. */
   688		error = incfs_link(index_file_dentry, named_file_dentry);
   689	
   690		if (!error)
   691			goto out;
   692	
   693	delete_index_file:
   694		incfs_unlink(index_file_dentry);
   695	
   696	out:
   697		if (error)
   698			pr_debug("incfs: %s err:%d\n", __func__, error);
   699	
   700		kfree(file_id_str);
   701		kfree(file_name);
   702		kfree(attr_value);
   703		dput(named_file_dentry);
   704		dput(index_file_dentry);
   705		path_put(&parent_dir_path);
   706		if (locked)
   707			mutex_unlock(&mi->mi_dir_struct_mutex);
   708		return error;
   709	}
   710	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
