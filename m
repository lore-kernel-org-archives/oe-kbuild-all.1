Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B701EB5FE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Feb 2025 18:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740680012; cv=none; b=baHv5GAvfD9eZDBK/IVlukTcbSZlqgSEOAt+lc90krxbpdwsk8EfrgpxtVjcuTbYJT7GCa4zN3SAM83hWFSuUGx34l6EW+a/k+t210HR2See9nwZ+2TxXWgBkkNS0fsL7XHHZBSuKAIcd84FnY4PpMf/CUetTbrpZuzNkm5lDQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740680012; c=relaxed/simple;
	bh=QlXXwL4Cne7mY+l4WALue5VAdtwKKRkOpSkYNrP01TI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F0mp+Z5xrXizbSVwbkDO4l0rLC4GTXjpo1PShCbP9oP0MHcLw3x9PuzPKzLyiI5qgpFvIpm/i+qNdG0VHwODi3z6kWVV1v8SvxtEiGoYtZjqCia/z85UI88XQ84xDMZ45w7BsuoAhoIhJMWtVgkxCpH/kAxiLA+h7ztHjKDxKvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IZVGV2pi; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IZVGV2pi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740680011; x=1772216011;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QlXXwL4Cne7mY+l4WALue5VAdtwKKRkOpSkYNrP01TI=;
  b=IZVGV2piyVJfYGqFBnuigKlS52WRONS0eHVsiIBHlYT4TZor2vat9vmo
   an5QuDeeDGL8XE84XTt+EHzaxXxpadXVEBzqIJchnJ3orgGPZyA/OTvoQ
   1fZg/uQSxQVoXmep6VWY77CjMPBMp0EeQfh/BJzaN3i6Ax6sq+uBeejpz
   NUyVSToW77YrFmjcBXxOkvcXNhtAf07KDpnVBwHE8gQO7LhJkWFPvFa29
   DzgNmXDub4Asut2XQckJO1KrzpGPoGny72+WRKYexiZBVLIDprltF3mHV
   bllv3yi7w/eSAY8LsAAm4jctUefJVxd6rQzI/1eDV9FTpjIFCFjdQZmAt
   A==;
X-CSE-ConnectionGUID: ZRuhz7QpThiHjpq4MyWEsQ==
X-CSE-MsgGUID: bI5Sv2XMRZmAJYmetS4IYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="40764600"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="40764600"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 10:13:30 -0800
X-CSE-ConnectionGUID: SfVEVNz/TOeNk0kruWT6eg==
X-CSE-MsgGUID: GiNlKUWMTt61/3bxn0+LXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="148024994"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 27 Feb 2025 10:13:29 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tniNv-000DpE-1d;
	Thu, 27 Feb 2025 18:13:25 +0000
Date: Fri, 28 Feb 2025 02:12:31 +0800
From: kernel test robot <lkp@intel.com>
To: NeilBrown <neilb@suse.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>
Subject: [brauner-github:vfs-6.15.async.dir 6/10] fs/ceph/dir.c:1102:9:
 error: unknown type name 'struc'; did you mean 'struct'?
Message-ID: <202502280254.VkcARdWy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git vfs-6.15.async.dir
head:   d49e14c16a69c5a3989c32142b986cb863c1debe
commit: 948ec6393e44f70bc315498b0137605cfc041477 [6/10] ceph: return the correct dentry on mkdir
config: sparc-randconfig-002-20250227 (https://download.01.org/0day-ci/archive/20250228/202502280254.VkcARdWy-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502280254.VkcARdWy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502280254.VkcARdWy-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/ceph/dir.c: In function 'ceph_mkdir':
>> fs/ceph/dir.c:1102:9: error: unknown type name 'struc'; did you mean 'struct'?
    1102 |         struc dentry *ret;
         |         ^~~~~
         |         struct
>> fs/ceph/dir.c:1102:22: error: expected '=', ',', ';', 'asm' or '__attribute__' before '*' token
    1102 |         struc dentry *ret;
         |                      ^
>> fs/ceph/dir.c:1120:17: error: 'ret' undeclared (first use in this function); did you mean 'req'?
    1120 |                 ret = ERR_PTR(-EROFS);
         |                 ^~~
         |                 req
   fs/ceph/dir.c:1120:17: note: each undeclared identifier is reported only once for each function it appears in
   fs/ceph/dir.c:1185:1: warning: control reaches end of non-void function [-Wreturn-type]
    1185 | }
         | ^


vim +1102 fs/ceph/dir.c

  1094	
  1095	static struct dentry *ceph_mkdir(struct mnt_idmap *idmap, struct inode *dir,
  1096					 struct dentry *dentry, umode_t mode)
  1097	{
  1098		struct ceph_mds_client *mdsc = ceph_sb_to_mdsc(dir->i_sb);
  1099		struct ceph_client *cl = mdsc->fsc->client;
  1100		struct ceph_mds_request *req;
  1101		struct ceph_acl_sec_ctx as_ctx = {};
> 1102		struc dentry *ret;
  1103		int err;
  1104		int op;
  1105	
  1106		err = ceph_wait_on_conflict_unlink(dentry);
  1107		if (err)
  1108			return ERR_PTR(err);
  1109	
  1110		if (ceph_snap(dir) == CEPH_SNAPDIR) {
  1111			/* mkdir .snap/foo is a MKSNAP */
  1112			op = CEPH_MDS_OP_MKSNAP;
  1113			doutc(cl, "mksnap %llx.%llx/'%pd' dentry %p\n",
  1114			      ceph_vinop(dir), dentry, dentry);
  1115		} else if (ceph_snap(dir) == CEPH_NOSNAP) {
  1116			doutc(cl, "mkdir %llx.%llx/'%pd' dentry %p mode 0%ho\n",
  1117			      ceph_vinop(dir), dentry, dentry, mode);
  1118			op = CEPH_MDS_OP_MKDIR;
  1119		} else {
> 1120			ret = ERR_PTR(-EROFS);
  1121			goto out;
  1122		}
  1123	
  1124		if (op == CEPH_MDS_OP_MKDIR &&
  1125		    ceph_quota_is_max_files_exceeded(dir)) {
  1126			ret = ERR_PTR(-EDQUOT);
  1127			goto out;
  1128		}
  1129		if ((op == CEPH_MDS_OP_MKSNAP) && IS_ENCRYPTED(dir) &&
  1130		    !fscrypt_has_encryption_key(dir)) {
  1131			ret = ERR_PTR(-ENOKEY);
  1132			goto out;
  1133		}
  1134	
  1135	
  1136		req = ceph_mdsc_create_request(mdsc, op, USE_AUTH_MDS);
  1137		if (IS_ERR(req)) {
  1138			ret = ERR_CAST(req);
  1139			goto out;
  1140		}
  1141	
  1142		mode |= S_IFDIR;
  1143		req->r_new_inode = ceph_new_inode(dir, dentry, &mode, &as_ctx);
  1144		if (IS_ERR(req->r_new_inode)) {
  1145			ret = ERR_CAST(req->r_new_inode);
  1146			req->r_new_inode = NULL;
  1147			goto out_req;
  1148		}
  1149	
  1150		req->r_dentry = dget(dentry);
  1151		req->r_num_caps = 2;
  1152		req->r_parent = dir;
  1153		ihold(dir);
  1154		set_bit(CEPH_MDS_R_PARENT_LOCKED, &req->r_req_flags);
  1155		if (op == CEPH_MDS_OP_MKDIR)
  1156			req->r_mnt_idmap = mnt_idmap_get(idmap);
  1157		req->r_args.mkdir.mode = cpu_to_le32(mode);
  1158		req->r_dentry_drop = CEPH_CAP_FILE_SHARED | CEPH_CAP_AUTH_EXCL |
  1159				     CEPH_CAP_XATTR_EXCL;
  1160		req->r_dentry_unless = CEPH_CAP_FILE_EXCL;
  1161	
  1162		ceph_as_ctx_to_req(req, &as_ctx);
  1163	
  1164		err = ceph_mdsc_do_request(mdsc, dir, req);
  1165		if (!err &&
  1166		    !req->r_reply_info.head->is_target &&
  1167		    !req->r_reply_info.head->is_dentry)
  1168			err = ceph_handle_notrace_create(dir, dentry);
  1169		ret = ERR_PTR(err);
  1170	out_req:
  1171		if (!IS_ERR(ret) && req->r_dentry != dentry)
  1172			/* Some other dentry was spliced in */
  1173			ret = dget(req->r_dentry);
  1174		ceph_mdsc_put_request(req);
  1175	out:
  1176		if (!IS_ERR(ret)) {
  1177			if (ret)
  1178				dentry = ret;
  1179			ceph_init_inode_acls(d_inode(dentry), &as_ctx);
  1180		} else {
  1181			d_drop(dentry);
  1182		}
  1183		ceph_release_acl_sec_ctx(&as_ctx);
  1184		return ret;
  1185	}
  1186	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
