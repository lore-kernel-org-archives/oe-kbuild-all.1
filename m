Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793472110;
	b=aSIaS+z/KMdXqCEgI4lTCiYQOLA7ZlH5ZwIbt1HMSeJnmn4JBTFShjJOlGP7A9QyyFmc
	 JkCnD0Vs+J2h9NqDjS884PmK502qTvyArUS3h8+iLawZgy5+NBXr71x6NXG41T61ATN8U
	 KBO9qx74hzbz920xutBrQEMCqqwqZeLbk6qcE2eQ8dArBc0flhFD0d0dHENwQ8mWN2bWZ
	 DNd9wx7D4VQe2NwOEvwYZdiG/2jPyede71M/OTH6UNukFR1xfqSpIO+URL/tB3cJ+4OuG
	 PCTqHWVeSom7gThITUw/h40MGsxtJaSHkgvBZYGLAgQl5K1ILiON9VWHZP3mSlbOrLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793472110;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=7mdOVq5iOgAaTvoMVbT/vqPlLq4xs3L9/HXuKKUMxnY=;
	b=2/Bs5YdykBe0SH+v6jmjKzJNkyBGXhRK1WaW/Rj5n8cykO+MMcntXRkIuLOcCEfOmBFO
	 GRU7USt92SbuH5xiJzqDJvfXUlsk7wP84Eb63g/BYVNsQArEZR3N5qKdU52hoWFG9M3YZ
	 DvXUYNxMjiAk7WrRlwcw7bqhN0gLF1H+4q/N9ujV3xZW7iSRTa1DBoesPCoXp5/5lcXnJ
	 cnJSVjjEba6bazYIh5qy/ZhNLpzxClfQom4hWyv/+lVlHQKNNj3day9Tj3H4Pt8izbEyv
	 gfZ+AMSlrb7sRn3wuOSu/B7LFJtjtjramS4wjw4+ypAIT31GG1czckjBjJyUfpGc5rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ob7nCgNZ;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CA3606A31C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Oct 2026 18:41:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64CA3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ob7nCgNZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793472103; x=1825008103;
  h=date:from:to:cc:subject:message-id;
  bh=p/y3e9T42dufLMYaIPvULB+zvCZ34nSx7z97h/F/QUI=;
  b=Ob7nCgNZ/a0GwGkXRprWXn9lVpJC0ZgU/pMb7PS1Jyw2kkgEPvVZqA4a
   sI8TwWO1huTnxM4M1bhbTSko2Uk9IBT0YMzwe6cc3K3flujxTSgl7MOUb
   CZvJNBbwa6JpZzvpKvQSVkmDis6Qb6aRpHge3fF83qgVYAkcHYNRITzop
   KWlKz33nGKBjR2bbM27f/BAe61wUnXdnOmZk0eh8njv1kaEqZ8V7T5Ix3
   8X0nzcvCKT8d2Rr8SrtwYbt9IuUygu+qHWjf1+GSVtnv2u2OBS1fs7kEm
   FDxW7uF2uQMQVFIWzV9BHhlH7wGjyQ1/vc/CCK3vHJZxyI4VVmul+LhQg
   A==;
X-CSE-ConnectionGUID: 8SN7/69ESei+6bcBQTpk1g==
X-CSE-MsgGUID: 1sRnfvGLSo+KznfHgxJcGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11952"; a="2092585"
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="2092585"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 11:41:42 -0700
X-CSE-ConnectionGUID: POwwPQbpSx6DnzfyTU77Gw==
X-CSE-MsgGUID: qAqblqBDRGyGYNQmBfHU0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="7539740"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 31 Oct 2026 11:41:40 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNE1J-0000000065D-2BVO;
	Sat, 31 Oct 2026 18:41:37 +0000
Date: Sat, 31 Oct 2026 19:40:56 +0100
From: kernel test robot <lkp@intel.com>
To: Alex Markuze <amarkuze@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, ceph-devel@vger.kernel.org,
 Ilya Dryomov <idryomov@gmail.com>, Xiubo Li <xiubo.li@clyso.com>
Subject: [ceph-client:testing 35/47] fs/ceph/crypto.c:281:9: sparse:
 sparse: non size-preserving integer to pointer cast
Message-ID: <202610311938.WUDLdyhy-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/ceph/ceph-client.git testing
head:   3f007b9f327745c94aec312a28973b28f6a51fc4
commit: 88d679bc66688124f73a2e30617c12a14bb5aeff [35/47] ceph: convert remaining helper paths to BLOG logging
config: x86_64-randconfig-2300-20261031 (https://download.01.org/0day-ci/archive/20261031/202610311938.WUDLdyhy-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261031/202610311938.WUDLdyhy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610311938.WUDLdyhy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/ceph/crypto.c:281:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/crypto.c:498:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/crypto.c:498:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/crypto.c:509:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/crypto.c:509:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/crypto.c:610:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/crypto.c:610:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/crypto.c:619:9: sparse: sparse: non size-preserving integer to pointer cast

vim +281 fs/ceph/crypto.c

   214	
   215	int ceph_encode_encrypted_dname(struct inode *parent, char *buf, int elen)
   216	{
   217		struct ceph_client *cl = ceph_inode_to_client(parent);
   218		struct inode *dir = parent;
   219		char *p = buf;
   220		u32 len;
   221		int prefix_len = 0;
   222		int name_len = elen;
   223		int ret;
   224		u8 *cryptbuf = NULL;
   225	
   226		/* Handle the special case of snapshot names that start with '_' */
   227		if (ceph_snap(dir) == CEPH_SNAPDIR && *p == '_') {
   228			dir = parse_longname(parent, p, &name_len);
   229			if (IS_ERR(dir))
   230				return PTR_ERR(dir);
   231			p++; /* skip initial '_' */
   232			prefix_len = 1;
   233		}
   234	
   235		if (!fscrypt_has_encryption_key(dir))
   236			goto out;
   237	
   238		/*
   239		 * Convert cleartext d_name to ciphertext. If result is longer than
   240		 * CEPH_NOHASH_NAME_MAX, sha256 the remaining bytes
   241		 *
   242		 * See: fscrypt_setup_filename
   243		 */
   244		if (!fscrypt_fname_encrypted_size(dir, name_len, NAME_MAX, &len)) {
   245			elen = -ENAMETOOLONG;
   246			goto out;
   247		}
   248	
   249		/* Allocate a buffer appropriate to hold the result */
   250		cryptbuf = kmalloc(len > CEPH_NOHASH_NAME_MAX ? NAME_MAX : len,
   251				   GFP_KERNEL);
   252		if (!cryptbuf) {
   253			elen = -ENOMEM;
   254			goto out;
   255		}
   256	
   257		ret = fscrypt_fname_encrypt(dir,
   258					    &(struct qstr)QSTR_INIT(p, name_len),
   259					    cryptbuf, len);
   260		if (ret) {
   261			elen = ret;
   262			goto out;
   263		}
   264	
   265		/* hash the end if the name is long enough */
   266		if (len > CEPH_NOHASH_NAME_MAX) {
   267			u8 hash[SHA256_DIGEST_SIZE];
   268			u8 *extra = cryptbuf + CEPH_NOHASH_NAME_MAX;
   269	
   270			/*
   271			 * hash the extra bytes and overwrite crypttext beyond that
   272			 * point with it
   273			 */
   274			sha256(extra, len - CEPH_NOHASH_NAME_MAX, hash);
   275			memcpy(extra, hash, SHA256_DIGEST_SIZE);
   276			len = CEPH_NOHASH_NAME_MAX + SHA256_DIGEST_SIZE;
   277		}
   278	
   279		/* base64 encode the encrypted name */
   280		elen = base64_encode(cryptbuf, len, p, false, BASE64_IMAP);
 > 281		boutc_bounded(cl, "base64-encoded ciphertext name = %.*s\n",
   282			      (elen, BLOG_STR(p, elen)), (elen, (const char *)p));
   283	
   284		/* To understand the 240 limit, see CEPH_NOHASH_NAME_MAX comments */
   285		WARN_ON(elen > 240);
   286		if (elen > 240) {
   287			elen = -ENAMETOOLONG;
   288			goto out;
   289		}
   290	
   291		if (dir != parent) {
   292			int total_len;
   293			/* leading '_' is already there; append _<inum> */
   294			char suffix[CEPH_ENCRYPTED_SNAP_INO_SUFFIX_MAX];
   295	
   296			ret = snprintf(suffix, sizeof(suffix), "_%llu", dir->i_ino);
   297			total_len = prefix_len + elen + ret;
   298			if (total_len > NAME_MAX) {
   299				elen = -ENAMETOOLONG;
   300				goto out;
   301			}
   302	
   303			memcpy(p + elen, suffix, ret);
   304			/* Include the leading '_' skipped by p. */
   305			elen = total_len;
   306		}
   307	
   308	out:
   309		kfree(cryptbuf);
   310		if (dir != parent) {
   311			if ((inode_state_read_once(dir) & I_NEW))
   312				discard_new_inode(dir);
   313			else
   314				iput(dir);
   315		}
   316		return elen;
   317	}
   318	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
