Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3991640A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 11:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M4UvR8kn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699615736; x=1731151736;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UAlGeMIA9Nyg+X2+IJaIV1Hk7ig7yo1589d+zKiyDsA=;
  b=M4UvR8knwG7Uyo3A/zmp5DZBBOxcVM1X0ZzhlQhSxEH6cVVdrPQYBJaD
   WJ5/QDGJdhclJkR7nTzNh+SmoSncZPbLKd6LWC7ciHE72CECLw2q+j9R5
   SU5DXP/C/XgjtSVxAX7r3nzpxEAghXSzSsERItmAfJ6oJ/owB+SZEUXuE
   3ElsLKaY4mpThZsTXwTe+IlcyBdfuKt6QX36cOhJutLqb1uWTa8E8i/1A
   btJUR6eh13SML37AlvSWmASnFerYSjciQ4frRCuJO6dvDKKBA4oM8p9TE
   YdjAnyFgIBS5pZt1cW9WfF2IzXgtCYsZ6D4kr8sx56cFqCkhBZ9OtwuMk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="389977095"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="389977095"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 03:28:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="763737649"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="763737649"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 10 Nov 2023 03:28:54 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1Pgy-0009ZR-10;
	Fri, 10 Nov 2023 11:28:52 +0000
Date: Fri, 10 Nov 2023 19:28:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 3089/27787] fs/incfs/vfs.c:1307:37:
 sparse: sparse: non size-preserving integer to pointer cast
Message-ID: <202311101937.nxT0nTGm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   d43ac48de222318c621dccb5b140e46676779736
commit: 383f53ee186a22c3d04cc6809e3b5e13bc2b571d [3089/27787] ANDROID: Incremental fs: Remove unneeded compatibility typedef
config: i386-randconfig-061-20231110 (https://download.01.org/0day-ci/archive/20231110/202311101937.nxT0nTGm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311101937.nxT0nTGm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311101937.nxT0nTGm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/incfs/vfs.c:1307:37: sparse: sparse: non size-preserving integer to pointer cast
>> fs/incfs/vfs.c:2054:23: sparse: sparse: cast truncates bits from constant value (5346434e49 becomes 46434e49)

vim +1307 fs/incfs/vfs.c

1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1138  
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1139  static long ioctl_create_file(struct mount_info *mi,
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1140  			struct incfs_new_file_args __user *usr_args)
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1141  {
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1142  	struct incfs_new_file_args args;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1143  	char *file_id_str = NULL;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1144  	struct dentry *index_file_dentry = NULL;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1145  	struct dentry *named_file_dentry = NULL;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1146  	struct path parent_dir_path = {};
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1147  	struct inode *index_dir_inode = NULL;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1148  	__le64 size_attr_value = 0;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1149  	char *file_name = NULL;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1150  	char *attr_value = NULL;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1151  	int error = 0;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1152  	bool locked = false;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1153  
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1154  	if (!mi || !mi->mi_index_dir) {
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1155  		error = -EFAULT;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1156  		goto out;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1157  	}
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1158  	if (!access_ok(usr_args, sizeof(args))) {
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1159  		error = -EFAULT;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1160  		goto out;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1161  	}
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1162  	if (copy_from_user(&args, usr_args, sizeof(args)) > 0) {
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1163  		error = -EFAULT;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1164  		goto out;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1165  	}
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1166  
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1167  	file_name = strndup_user(u64_to_user_ptr(args.file_name), PATH_MAX);
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1168  	if (IS_ERR(file_name)) {
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1169  		error = PTR_ERR(file_name);
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1170  		file_name = NULL;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1171  		goto out;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1172  	}
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1173  
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1174  	error = validate_name(file_name);
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1175  	if (error)
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1176  		goto out;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1177  
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1178  	file_id_str = file_id_to_str(args.file_id);
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1179  	if (!file_id_str) {
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1180  		error = -ENOMEM;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1181  		goto out;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1182  	}
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1183  
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1184  	error = mutex_lock_interruptible(&mi->mi_dir_struct_mutex);
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1185  	if (error)
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1186  		goto out;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1187  	locked = true;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1188  
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1189  	/* Find a directory to put the file into. */
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1190  	error = dir_relative_path_resolve(mi,
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1191  			u64_to_user_ptr(args.directory_path),
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1192  			&parent_dir_path);
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1193  	if (error)
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1194  		goto out;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1195  
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1196  	if (parent_dir_path.dentry == mi->mi_index_dir) {
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1197  		/* Can't create a file directly inside .index */
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1198  		error = -EBUSY;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1199  		goto out;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1200  	}
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1201  
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1202  	/* Look up a dentry in the parent dir. It should be negative. */
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1203  	named_file_dentry = incfs_lookup_dentry(parent_dir_path.dentry,
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1204  					file_name);
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1205  	if (!named_file_dentry) {
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1206  		error = -EFAULT;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1207  		goto out;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1208  	}
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1209  	if (IS_ERR(named_file_dentry)) {
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1210  		error = PTR_ERR(named_file_dentry);
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1211  		named_file_dentry = NULL;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1212  		goto out;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1213  	}
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1214  	if (d_really_is_positive(named_file_dentry)) {
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1215  		/* File with this path already exists. */
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1216  		error = -EEXIST;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1217  		goto out;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1218  	}
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1219  	/* Look up a dentry in the .index dir. It should be negative. */
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1220  	index_file_dentry = incfs_lookup_dentry(mi->mi_index_dir, file_id_str);
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1221  	if (!index_file_dentry) {
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1222  		error = -EFAULT;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1223  		goto out;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1224  	}
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1225  	if (IS_ERR(index_file_dentry)) {
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1226  		error = PTR_ERR(index_file_dentry);
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1227  		index_file_dentry = NULL;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1228  		goto out;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1229  	}
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1230  	if (d_really_is_positive(index_file_dentry)) {
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1231  		/* File with this ID already exists in index. */
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1232  		error = -EEXIST;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1233  		goto out;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1234  	}
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1235  
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1236  	/* Creating a file in the .index dir. */
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1237  	index_dir_inode = d_inode(mi->mi_index_dir);
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1238  	inode_lock_nested(index_dir_inode, I_MUTEX_PARENT);
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1239  	error = vfs_create(index_dir_inode, index_file_dentry,
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1240  			args.mode, true);
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1241  	inode_unlock(index_dir_inode);
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1242  
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1243  	if (error)
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1244  		goto out;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1245  	if (!d_really_is_positive(index_file_dentry)) {
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1246  		error = -EINVAL;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1247  		goto out;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1248  	}
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1249  
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1250  	/* Save the file's ID as an xattr for easy fetching in future. */
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1251  	error = vfs_setxattr(index_file_dentry, INCFS_XATTR_ID_NAME,
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1252  		file_id_str, strlen(file_id_str), XATTR_CREATE);
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1253  	if (error) {
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1254  		pr_debug("incfs: vfs_setxattr err:%d\n", error);
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1255  		goto delete_index_file;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1256  	}
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1257  
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1258  	/* Save the file's size as an xattr for easy fetching in future. */
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1259  	size_attr_value = cpu_to_le64(args.size);
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1260  	error = vfs_setxattr(index_file_dentry, INCFS_XATTR_SIZE_NAME,
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1261  		(char *)&size_attr_value, sizeof(size_attr_value),
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1262  		XATTR_CREATE);
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1263  	if (error) {
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1264  		pr_debug("incfs: vfs_setxattr err:%d\n", error);
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1265  		goto delete_index_file;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1266  	}
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1267  
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1268  	/* Save the file's attrubute as an xattr */
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1269  	if (args.file_attr_len && args.file_attr) {
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1270  		if (args.file_attr_len > INCFS_MAX_FILE_ATTR_SIZE) {
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1271  			error = -E2BIG;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1272  			goto delete_index_file;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1273  		}
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1274  
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1275  		attr_value = kmalloc(args.file_attr_len, GFP_NOFS);
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1276  		if (!attr_value) {
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1277  			error = -ENOMEM;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1278  			goto delete_index_file;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1279  		}
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1280  
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1281  		if (!access_ok(u64_to_user_ptr(args.file_attr),
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1282  			       args.file_attr_len)) {
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1283  			error = -EFAULT;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1284  			goto delete_index_file;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1285  		}
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1286  
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1287  		if (copy_from_user(attr_value,
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1288  				u64_to_user_ptr(args.file_attr),
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1289  				args.file_attr_len) > 0) {
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1290  			error = -EFAULT;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1291  			goto delete_index_file;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1292  		}
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1293  
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1294  		error = vfs_setxattr(index_file_dentry,
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1295  				INCFS_XATTR_METADATA_NAME,
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1296  				attr_value, args.file_attr_len,
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1297  				XATTR_CREATE);
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1298  
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1299  		if (error)
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1300  			goto delete_index_file;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1301  	}
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1302  
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1303  	/* Initializing a newly created file. */
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1304  	error = init_new_file(mi, index_file_dentry, &args.file_id, args.size,
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1305  			range(attr_value, args.file_attr_len),
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1306  			(struct incfs_file_signature_info __user *)
1be052b20ba04b6 Eugene Zemtsov 2019-11-18 @1307  				args.signature_info);
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1308  	if (error)
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1309  		goto delete_index_file;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1310  
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1311  	/* Linking a file with it's real name from the requested dir. */
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1312  	error = incfs_link(index_file_dentry, named_file_dentry);
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1313  
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1314  	if (!error)
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1315  		goto out;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1316  
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1317  delete_index_file:
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1318  	incfs_unlink(index_file_dentry);
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1319  
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1320  out:
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1321  	if (error)
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1322  		pr_debug("incfs: %s err:%d\n", __func__, error);
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1323  
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1324  	kfree(file_id_str);
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1325  	kfree(file_name);
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1326  	kfree(attr_value);
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1327  	dput(named_file_dentry);
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1328  	dput(index_file_dentry);
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1329  	path_put(&parent_dir_path);
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1330  	if (locked)
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1331  		mutex_unlock(&mi->mi_dir_struct_mutex);
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1332  	return error;
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1333  }
1be052b20ba04b6 Eugene Zemtsov 2019-11-18  1334  

:::::: The code at line 1307 was first introduced by commit
:::::: 1be052b20ba04b635cf87bcff80de5314697953e ANDROID: Initial commit of Incremental FS

:::::: TO: Eugene Zemtsov <ezemtsov@google.com>
:::::: CC: Paul Lawrence <paullawrence@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
