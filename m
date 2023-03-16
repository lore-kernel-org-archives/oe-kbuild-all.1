Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3197518F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Mar 2023 00:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678926676; x=1710462676;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=XyCiRTO5Xr6iXYvIFZpgQLT7/lRh/E7RSJ8iAo6DcR4=;
  b=dZXeLFU7ONl+BzBUFdTHkoz1qqQ0xK8alZRpiXnYZ3AAqIGIsO/w2Hrh
   O6X2QTdaKX5s/mljnGB1wVxpX4NaEBtyEOa/doACMfAkLj/MmYO0DU6ah
   sicE5Lxfnw3/vszH5NlxEpVm7Qn0WO2A8HFXf7axv3UHm0evxzAqf41jj
   jGUzMIH2um+NgCXyeFpHJJckN92h2D9rbcmaoVWdFmwPJ14ZiupDR/c+u
   PLHehDygg9IK4dZQ+DxDpWccR24pA8MeWHJceOi9zpi0rw3s2C37x97Bm
   U4LkUjk0fa6GzDXHwN7ow1FcGTzqHSM5A3gsMCho2kWg21uc46Qq07vpK
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="336540952"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="336540952"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 17:31:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="712126054"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="712126054"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 15 Mar 2023 17:31:14 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcbWT-00089X-1l;
	Thu, 16 Mar 2023 00:31:13 +0000
Date: Thu, 16 Mar 2023 08:30:59 +0800
From: kernel test robot <lkp@intel.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v8 3/3] ksmbd: fix racy issue from using ->d_parent and
 ->d_name
Message-ID: <202303160854.zjX0rhqS-lkp@intel.com>
References: <20230315223435.5139-4-linkinjeon@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230315223435.5139-4-linkinjeon@kernel.org>

Hi Namjae,

I love your patch! Perhaps something to improve:

[auto build test WARNING on vfs-idmapping/for-next]
[also build test WARNING on linus/master v6.3-rc2 next-20230315]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Namjae-Jeon/ksmbd-remove-internal-h-include/20230316-063731
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/idmapping.git for-next
patch link:    https://lore.kernel.org/r/20230315223435.5139-4-linkinjeon%40kernel.org
patch subject: [PATCH v8 3/3] ksmbd: fix racy issue from using ->d_parent and ->d_name
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230316/202303160854.zjX0rhqS-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/96a66748207926f3642ac4d24c7a591de22e3bad
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Namjae-Jeon/ksmbd-remove-internal-h-include/20230316-063731
        git checkout 96a66748207926f3642ac4d24c7a591de22e3bad
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303160854.zjX0rhqS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/ksmbd/vfs.c:54: warning: Function parameter or member 'parent' not described in 'ksmbd_vfs_lock_parent'
   fs/ksmbd/vfs.c:54: warning: Function parameter or member 'child' not described in 'ksmbd_vfs_lock_parent'
   fs/ksmbd/vfs.c:356: warning: Function parameter or member 'fp' not described in 'ksmbd_vfs_read'
   fs/ksmbd/vfs.c:356: warning: Excess function parameter 'fid' description in 'ksmbd_vfs_read'
   fs/ksmbd/vfs.c:472: warning: Function parameter or member 'fp' not described in 'ksmbd_vfs_write'
   fs/ksmbd/vfs.c:472: warning: Excess function parameter 'fid' description in 'ksmbd_vfs_write'
   fs/ksmbd/vfs.c:535: warning: Function parameter or member 'path' not described in 'ksmbd_vfs_getattr'
   fs/ksmbd/vfs.c:535: warning: Function parameter or member 'stat' not described in 'ksmbd_vfs_getattr'
   fs/ksmbd/vfs.c:535: warning: Excess function parameter 'work' description in 'ksmbd_vfs_getattr'
   fs/ksmbd/vfs.c:535: warning: Excess function parameter 'fid' description in 'ksmbd_vfs_getattr'
   fs/ksmbd/vfs.c:535: warning: Excess function parameter 'attrs' description in 'ksmbd_vfs_getattr'
   fs/ksmbd/vfs.c:552: warning: Function parameter or member 'p_id' not described in 'ksmbd_vfs_fsync'
   fs/ksmbd/vfs.c:575: warning: Function parameter or member 'work' not described in 'ksmbd_vfs_remove_file'
   fs/ksmbd/vfs.c:575: warning: Function parameter or member 'path' not described in 'ksmbd_vfs_remove_file'
   fs/ksmbd/vfs.c:575: warning: Excess function parameter 'name' description in 'ksmbd_vfs_remove_file'
   fs/ksmbd/vfs.c:613: warning: Function parameter or member 'work' not described in 'ksmbd_vfs_link'
   fs/ksmbd/vfs.c:779: warning: Function parameter or member 'fp' not described in 'ksmbd_vfs_truncate'
   fs/ksmbd/vfs.c:779: warning: Excess function parameter 'fid' description in 'ksmbd_vfs_truncate'
   fs/ksmbd/vfs.c:820: warning: Excess function parameter 'size' description in 'ksmbd_vfs_listxattr'
   fs/ksmbd/vfs.c:917: warning: Function parameter or member 'option' not described in 'ksmbd_vfs_set_fadvise'
   fs/ksmbd/vfs.c:917: warning: Excess function parameter 'options' description in 'ksmbd_vfs_set_fadvise'
   fs/ksmbd/vfs.c:1117: warning: Function parameter or member 'um' not described in 'ksmbd_vfs_lookup_in_dir'
   fs/ksmbd/vfs.c:1152: warning: Function parameter or member 'work' not described in 'ksmbd_vfs_kern_path_locked'
>> fs/ksmbd/vfs.c:1152: warning: expecting prototype for ksmbd_vfs_kern_path(). Prototype was for ksmbd_vfs_kern_path_locked() instead


vim +1152 fs/ksmbd/vfs.c

f44158485826c07 fs/cifsd/vfs.c Namjae Jeon   2021-03-16  1139  
f44158485826c07 fs/cifsd/vfs.c Namjae Jeon   2021-03-16  1140  /**
f44158485826c07 fs/cifsd/vfs.c Namjae Jeon   2021-03-16  1141   * ksmbd_vfs_kern_path() - lookup a file and get path info
265fd1991c1db85 fs/ksmbd/vfs.c Hyunchul Lee  2021-09-25  1142   * @name:	file path that is relative to share
f44158485826c07 fs/cifsd/vfs.c Namjae Jeon   2021-03-16  1143   * @flags:	lookup flags
f44158485826c07 fs/cifsd/vfs.c Namjae Jeon   2021-03-16  1144   * @path:	if lookup succeed, return path info
f44158485826c07 fs/cifsd/vfs.c Namjae Jeon   2021-03-16  1145   * @caseless:	caseless filename lookup
f44158485826c07 fs/cifsd/vfs.c Namjae Jeon   2021-03-16  1146   *
f44158485826c07 fs/cifsd/vfs.c Namjae Jeon   2021-03-16  1147   * Return:	0 on success, otherwise error
f44158485826c07 fs/cifsd/vfs.c Namjae Jeon   2021-03-16  1148   */
96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1149  int ksmbd_vfs_kern_path_locked(struct ksmbd_work *work, char *name,
96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1150  			       unsigned int flags, struct path *path,
96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1151  			       bool caseless)
f44158485826c07 fs/cifsd/vfs.c Namjae Jeon   2021-03-16 @1152  {
265fd1991c1db85 fs/ksmbd/vfs.c Hyunchul Lee  2021-09-25  1153  	struct ksmbd_share_config *share_conf = work->tcon->share_conf;
f44158485826c07 fs/cifsd/vfs.c Namjae Jeon   2021-03-16  1154  	int err;
96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1155  	struct path parent_path;
f44158485826c07 fs/cifsd/vfs.c Namjae Jeon   2021-03-16  1156  
96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1157  	err = ksmbd_vfs_path_lookup_locked(share_conf, name, flags, path);
f44158485826c07 fs/cifsd/vfs.c Namjae Jeon   2021-03-16  1158  	if (!err)
96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1159  		return err;
f44158485826c07 fs/cifsd/vfs.c Namjae Jeon   2021-03-16  1160  
f44158485826c07 fs/cifsd/vfs.c Namjae Jeon   2021-03-16  1161  	if (caseless) {
3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1162  		char *filepath;
3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1163  		size_t path_len, remain_len;
3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1164  
3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1165  		filepath = kstrdup(name, GFP_KERNEL);
3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1166  		if (!filepath)
3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1167  			return -ENOMEM;
3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1168  
3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1169  		path_len = strlen(filepath);
265fd1991c1db85 fs/ksmbd/vfs.c Hyunchul Lee  2021-09-25  1170  		remain_len = path_len;
3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1171  
96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1172  		parent_path = share_conf->vfs_path;
96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1173  		path_get(&parent_path);
f44158485826c07 fs/cifsd/vfs.c Namjae Jeon   2021-03-16  1174  
96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1175  		while (d_can_lookup(parent_path.dentry)) {
3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1176  			char *filename = filepath + path_len - remain_len;
3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1177  			char *next = strchrnul(filename, '/');
3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1178  			size_t filename_len = next - filename;
3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1179  			bool is_last = !next[0];
3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1180  
3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1181  			if (filename_len == 0)
3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1182  				break;
3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1183  
96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1184  			err = ksmbd_vfs_lookup_in_dir(&parent_path, filename,
dbab80e2071ad8c fs/ksmbd/vfs.c Atte Heikkilä 2022-09-28  1185  						      filename_len,
dbab80e2071ad8c fs/ksmbd/vfs.c Atte Heikkilä 2022-09-28  1186  						      work->conn->um);
265fd1991c1db85 fs/ksmbd/vfs.c Hyunchul Lee  2021-09-25  1187  			if (err)
96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1188  				goto out2;
f44158485826c07 fs/cifsd/vfs.c Namjae Jeon   2021-03-16  1189  
3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1190  			next[0] = '\0';
3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1191  
265fd1991c1db85 fs/ksmbd/vfs.c Hyunchul Lee  2021-09-25  1192  			err = vfs_path_lookup(share_conf->vfs_path.dentry,
265fd1991c1db85 fs/ksmbd/vfs.c Hyunchul Lee  2021-09-25  1193  					      share_conf->vfs_path.mnt,
265fd1991c1db85 fs/ksmbd/vfs.c Hyunchul Lee  2021-09-25  1194  					      filepath,
265fd1991c1db85 fs/ksmbd/vfs.c Hyunchul Lee  2021-09-25  1195  					      flags,
96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1196  					      path);
f44158485826c07 fs/cifsd/vfs.c Namjae Jeon   2021-03-16  1197  			if (err)
96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1198  				goto out2;
96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1199  			else if (is_last)
96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1200  				goto out1;
96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1201  			path_put(&parent_path);
96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1202  			parent_path = *path;
f44158485826c07 fs/cifsd/vfs.c Namjae Jeon   2021-03-16  1203  
3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1204  			next[0] = '/';
3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1205  			remain_len -= filename_len + 1;
3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1206  		}
3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1207  
3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1208  		err = -EINVAL;
96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1209  out2:
96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1210  		path_put(&parent_path);
96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1211  out1:
3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1212  		kfree(filepath);
3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1213  	}
96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1214  
96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1215  	if (!err) {
96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1216  		err = ksmbd_vfs_lock_parent(parent_path.dentry, path->dentry);
96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1217  		if (err)
96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1218  			dput(path->dentry);
96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1219  		path_put(&parent_path);
96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1220  	}
f44158485826c07 fs/cifsd/vfs.c Namjae Jeon   2021-03-16  1221  	return err;
f44158485826c07 fs/cifsd/vfs.c Namjae Jeon   2021-03-16  1222  }
f44158485826c07 fs/cifsd/vfs.c Namjae Jeon   2021-03-16  1223  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
