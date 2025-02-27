Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C231B21B5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Feb 2025 16:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740673986; cv=none; b=AP9daFY8PXhsvemvDV7edoYtdspTryYA9wBympYSwqnpLLFG3Z4V+WjG38/ZQD4Jl0IgfoVDEmFh5OxXAScGMlPKBKlM+Fm441Lvk+EgJdxiSq/SNE/6fGDF3DX3yw57G9CIKNU1rLG1kJbxOwX6PlxSa4IcshqLKLqT/LqdHsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740673986; c=relaxed/simple;
	bh=QWOzSb+Yxjj9bHHrPUM8SyqpYbjXZvDZV6miJe78K54=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ag2SJRnSpxPK1HORRn7q5vVB3aE+h733xisqlN9DKNNm6hMjK5nL0B+pH+qb7wvrWLiBQ1TCTI2AQM9vu5V7gulQKS88xqOH7vjMdclZ7c0VW1gjJ+9CX9jbSDT28sM1H1ZrcTwp1IV8FhHksD8XMNIIdy6IgY5YqjXpZr58SlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hdetr70+; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hdetr70+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740673983; x=1772209983;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=QWOzSb+Yxjj9bHHrPUM8SyqpYbjXZvDZV6miJe78K54=;
  b=hdetr70+/Bphi6SNMY8b52yG3vNvP9JyzLmF+6a8EszI9midHGlKgnHS
   RmicIQ0wSP10nz3zkSSieFGeQCJ6ExOw3sjO7kTUmmUvnMk1kXBq1V7Yn
   ko3VCXlHKLHlodlnp2nB1w4OlBHZEKazauAJfovnW1SAthmnGAB/ehiDM
   KBrOuMSMgj7UgXDzojJiQgJqo6o5+uxDNYFOc1zgFstX38ELnN0nC/hEi
   K3B4WKo2C605xE9GigyTOIZ1JTcseJfBzGAfDcrItHnZ38OzbQfHvAvQb
   y3LD/vpHzVLyb7gR07QRModq0ec5HWAS9C3mTJXLwGwWbwlhSPr549G0d
   w==;
X-CSE-ConnectionGUID: /o982B0JRUCUnK/rh3q7mg==
X-CSE-MsgGUID: jFIMI7H5Suio2jlqD8JF8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="52985957"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="52985957"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 08:33:01 -0800
X-CSE-ConnectionGUID: BK3XHG6tQlW6UJm30HrvGQ==
X-CSE-MsgGUID: vgxV1Wk3Q16CB++knC3THg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="140303909"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 27 Feb 2025 08:33:00 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tngoj-000Dhw-2u;
	Thu, 27 Feb 2025 16:32:57 +0000
Date: Fri, 28 Feb 2025 00:32:27 +0800
From: kernel test robot <lkp@intel.com>
To: NeilBrown <neilb@suse.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>
Subject: [brauner-github:vfs-6.15.async.dir 6/10] fs/ceph/dir.c:1185:1:
 warning: control reaches end of non-void function
Message-ID: <202502280004.d0szdJwF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/brauner/linux.git vfs-6.15.async.dir
head:   d49e14c16a69c5a3989c32142b986cb863c1debe
commit: 948ec6393e44f70bc315498b0137605cfc041477 [6/10] ceph: return the correct dentry on mkdir
config: sparc-randconfig-002-20250227 (https://download.01.org/0day-ci/archive/20250228/202502280004.d0szdJwF-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502280004.d0szdJwF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502280004.d0szdJwF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/ceph/dir.c: In function 'ceph_mkdir':
   fs/ceph/dir.c:1102:9: error: unknown type name 'struc'; did you mean 'struct'?
    1102 |         struc dentry *ret;
         |         ^~~~~
         |         struct
   fs/ceph/dir.c:1102:22: error: expected '=', ',', ';', 'asm' or '__attribute__' before '*' token
    1102 |         struc dentry *ret;
         |                      ^
   fs/ceph/dir.c:1120:17: error: 'ret' undeclared (first use in this function); did you mean 'req'?
    1120 |                 ret = ERR_PTR(-EROFS);
         |                 ^~~
         |                 req
   fs/ceph/dir.c:1120:17: note: each undeclared identifier is reported only once for each function it appears in
>> fs/ceph/dir.c:1185:1: warning: control reaches end of non-void function [-Wreturn-type]
    1185 | }
         | ^


vim +1185 fs/ceph/dir.c

2817b000b02c5f Sage Weil         2009-10-06  1094  
10a5b48c3eeb26 NeilBrown         2025-02-27  1095  static struct dentry *ceph_mkdir(struct mnt_idmap *idmap, struct inode *dir,
549c7297717c32 Christian Brauner 2021-01-21  1096  				 struct dentry *dentry, umode_t mode)
2817b000b02c5f Sage Weil         2009-10-06  1097  {
2678da88f4b449 Xiubo Li          2020-09-03  1098  	struct ceph_mds_client *mdsc = ceph_sb_to_mdsc(dir->i_sb);
38d46409c4639a Xiubo Li          2023-06-12  1099  	struct ceph_client *cl = mdsc->fsc->client;
2817b000b02c5f Sage Weil         2009-10-06  1100  	struct ceph_mds_request *req;
5c31e92dffb94c Yan, Zheng        2019-05-26  1101  	struct ceph_acl_sec_ctx as_ctx = {};
948ec6393e44f7 NeilBrown         2025-02-27  1102  	struc dentry *ret;
4868e537fa867f Xiubo Li          2022-05-10  1103  	int err;
2817b000b02c5f Sage Weil         2009-10-06  1104  	int op;
2817b000b02c5f Sage Weil         2009-10-06  1105  
4868e537fa867f Xiubo Li          2022-05-10  1106  	err = ceph_wait_on_conflict_unlink(dentry);
4868e537fa867f Xiubo Li          2022-05-10  1107  	if (err)
10a5b48c3eeb26 NeilBrown         2025-02-27  1108  		return ERR_PTR(err);
4868e537fa867f Xiubo Li          2022-05-10  1109  
2817b000b02c5f Sage Weil         2009-10-06  1110  	if (ceph_snap(dir) == CEPH_SNAPDIR) {
2817b000b02c5f Sage Weil         2009-10-06  1111  		/* mkdir .snap/foo is a MKSNAP */
2817b000b02c5f Sage Weil         2009-10-06  1112  		op = CEPH_MDS_OP_MKSNAP;
38d46409c4639a Xiubo Li          2023-06-12  1113  		doutc(cl, "mksnap %llx.%llx/'%pd' dentry %p\n",
38d46409c4639a Xiubo Li          2023-06-12  1114  		      ceph_vinop(dir), dentry, dentry);
2817b000b02c5f Sage Weil         2009-10-06  1115  	} else if (ceph_snap(dir) == CEPH_NOSNAP) {
38d46409c4639a Xiubo Li          2023-06-12  1116  		doutc(cl, "mkdir %llx.%llx/'%pd' dentry %p mode 0%ho\n",
38d46409c4639a Xiubo Li          2023-06-12  1117  		      ceph_vinop(dir), dentry, dentry, mode);
2817b000b02c5f Sage Weil         2009-10-06  1118  		op = CEPH_MDS_OP_MKDIR;
2817b000b02c5f Sage Weil         2009-10-06  1119  	} else {
948ec6393e44f7 NeilBrown         2025-02-27  1120  		ret = ERR_PTR(-EROFS);
2817b000b02c5f Sage Weil         2009-10-06  1121  		goto out;
2817b000b02c5f Sage Weil         2009-10-06  1122  	}
b1ee94aa593abd Yan, Zheng        2014-09-16  1123  
2596366907f872 Yan, Zheng        2018-01-12  1124  	if (op == CEPH_MDS_OP_MKDIR &&
2596366907f872 Yan, Zheng        2018-01-12  1125  	    ceph_quota_is_max_files_exceeded(dir)) {
948ec6393e44f7 NeilBrown         2025-02-27  1126  		ret = ERR_PTR(-EDQUOT);
b7a2921765cf79 Luis Henriques    2018-01-05  1127  		goto out;
b7a2921765cf79 Luis Henriques    2018-01-05  1128  	}
abd4fc775857cd Luís Henriques    2022-08-25  1129  	if ((op == CEPH_MDS_OP_MKSNAP) && IS_ENCRYPTED(dir) &&
abd4fc775857cd Luís Henriques    2022-08-25  1130  	    !fscrypt_has_encryption_key(dir)) {
948ec6393e44f7 NeilBrown         2025-02-27  1131  		ret = ERR_PTR(-ENOKEY);
abd4fc775857cd Luís Henriques    2022-08-25  1132  		goto out;
abd4fc775857cd Luís Henriques    2022-08-25  1133  	}
b7a2921765cf79 Luis Henriques    2018-01-05  1134  
b1ee94aa593abd Yan, Zheng        2014-09-16  1135  
2817b000b02c5f Sage Weil         2009-10-06  1136  	req = ceph_mdsc_create_request(mdsc, op, USE_AUTH_MDS);
2817b000b02c5f Sage Weil         2009-10-06  1137  	if (IS_ERR(req)) {
948ec6393e44f7 NeilBrown         2025-02-27  1138  		ret = ERR_CAST(req);
2817b000b02c5f Sage Weil         2009-10-06  1139  		goto out;
2817b000b02c5f Sage Weil         2009-10-06  1140  	}
2817b000b02c5f Sage Weil         2009-10-06  1141  
ec9595c080c6f0 Jeff Layton       2020-08-26  1142  	mode |= S_IFDIR;
ec9595c080c6f0 Jeff Layton       2020-08-26  1143  	req->r_new_inode = ceph_new_inode(dir, dentry, &mode, &as_ctx);
ec9595c080c6f0 Jeff Layton       2020-08-26  1144  	if (IS_ERR(req->r_new_inode)) {
948ec6393e44f7 NeilBrown         2025-02-27  1145  		ret = ERR_CAST(req->r_new_inode);
ec9595c080c6f0 Jeff Layton       2020-08-26  1146  		req->r_new_inode = NULL;
ec9595c080c6f0 Jeff Layton       2020-08-26  1147  		goto out_req;
ec9595c080c6f0 Jeff Layton       2020-08-26  1148  	}
ec9595c080c6f0 Jeff Layton       2020-08-26  1149  
2817b000b02c5f Sage Weil         2009-10-06  1150  	req->r_dentry = dget(dentry);
2817b000b02c5f Sage Weil         2009-10-06  1151  	req->r_num_caps = 2;
3dd69aabcef3d8 Jeff Layton       2017-01-31  1152  	req->r_parent = dir;
4c18347238ab5a Jeff Layton       2021-06-18  1153  	ihold(dir);
3dd69aabcef3d8 Jeff Layton       2017-01-31  1154  	set_bit(CEPH_MDS_R_PARENT_LOCKED, &req->r_req_flags);
09838f1bfd40f4 Christian Brauner 2023-08-07  1155  	if (op == CEPH_MDS_OP_MKDIR)
09838f1bfd40f4 Christian Brauner 2023-08-07  1156  		req->r_mnt_idmap = mnt_idmap_get(idmap);
2817b000b02c5f Sage Weil         2009-10-06  1157  	req->r_args.mkdir.mode = cpu_to_le32(mode);
d9d00f71ab5a2b Xiubo Li          2023-06-05  1158  	req->r_dentry_drop = CEPH_CAP_FILE_SHARED | CEPH_CAP_AUTH_EXCL |
d9d00f71ab5a2b Xiubo Li          2023-06-05  1159  			     CEPH_CAP_XATTR_EXCL;
2817b000b02c5f Sage Weil         2009-10-06  1160  	req->r_dentry_unless = CEPH_CAP_FILE_EXCL;
ec9595c080c6f0 Jeff Layton       2020-08-26  1161  
ec9595c080c6f0 Jeff Layton       2020-08-26  1162  	ceph_as_ctx_to_req(req, &as_ctx);
ec9595c080c6f0 Jeff Layton       2020-08-26  1163  
2817b000b02c5f Sage Weil         2009-10-06  1164  	err = ceph_mdsc_do_request(mdsc, dir, req);
275dd19ea4e84c Yan, Zheng        2014-12-10  1165  	if (!err &&
275dd19ea4e84c Yan, Zheng        2014-12-10  1166  	    !req->r_reply_info.head->is_target &&
275dd19ea4e84c Yan, Zheng        2014-12-10  1167  	    !req->r_reply_info.head->is_dentry)
2817b000b02c5f Sage Weil         2009-10-06  1168  		err = ceph_handle_notrace_create(dir, dentry);
948ec6393e44f7 NeilBrown         2025-02-27  1169  	ret = ERR_PTR(err);
ec9595c080c6f0 Jeff Layton       2020-08-26  1170  out_req:
948ec6393e44f7 NeilBrown         2025-02-27  1171  	if (!IS_ERR(ret) && req->r_dentry != dentry)
948ec6393e44f7 NeilBrown         2025-02-27  1172  		/* Some other dentry was spliced in */
948ec6393e44f7 NeilBrown         2025-02-27  1173  		ret = dget(req->r_dentry);
2817b000b02c5f Sage Weil         2009-10-06  1174  	ceph_mdsc_put_request(req);
2817b000b02c5f Sage Weil         2009-10-06  1175  out:
948ec6393e44f7 NeilBrown         2025-02-27  1176  	if (!IS_ERR(ret)) {
948ec6393e44f7 NeilBrown         2025-02-27  1177  		if (ret)
948ec6393e44f7 NeilBrown         2025-02-27  1178  			dentry = ret;
5c31e92dffb94c Yan, Zheng        2019-05-26  1179  		ceph_init_inode_acls(d_inode(dentry), &as_ctx);
948ec6393e44f7 NeilBrown         2025-02-27  1180  	} else {
2817b000b02c5f Sage Weil         2009-10-06  1181  		d_drop(dentry);
948ec6393e44f7 NeilBrown         2025-02-27  1182  	}
5c31e92dffb94c Yan, Zheng        2019-05-26  1183  	ceph_release_acl_sec_ctx(&as_ctx);
948ec6393e44f7 NeilBrown         2025-02-27  1184  	return ret;
2817b000b02c5f Sage Weil         2009-10-06 @1185  }
2817b000b02c5f Sage Weil         2009-10-06  1186  

:::::: The code at line 1185 was first introduced by commit
:::::: 2817b000b02c5f0c05af67c01fb2684e1381d6ef ceph: directory operations

:::::: TO: Sage Weil <sage@newdream.net>
:::::: CC: Sage Weil <sage@newdream.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
