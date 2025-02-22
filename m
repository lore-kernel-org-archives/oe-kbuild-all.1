Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1E71F4E3B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Feb 2025 12:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740227835; cv=none; b=JtQ8dUr4v4yh/Phq/adOGltgTYh+xuDq9Hc6osJ/CC6v6F0iJebUmaeblRm2q/ACyWgnm/1QjYPV1REApc20WO+biFDvD+HyquYP9hcFg9CAehpSt+bFw0CjOHNgeWbCwEQOmp7n+4rk4WVQ86NF4XtqY+5fI7NMS0lhrQhSXps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740227835; c=relaxed/simple;
	bh=hBYi3l3qY5o6nNs7qQDorH8lsPUuhDPY7sp5HOFcl5E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a8vhQOlSwz/BtBhdt5yMo4bQadTyTol2WXsD+ngkCxsnQHdLR1Q0Ls8j69I2yI2beEBNtyAAPf90JupZiB8SzPOapJG891x6zhFbSSsBERdcKzqBNyKMl9bef/UNiFS2OcbXMjWRevaPGXrjS7AISnlAJEQMM9V3Jj5w0kEJDUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aGqtpJfk; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aGqtpJfk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740227834; x=1771763834;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hBYi3l3qY5o6nNs7qQDorH8lsPUuhDPY7sp5HOFcl5E=;
  b=aGqtpJfkoNLNcPO5FHFoQmuR1riMzzaruNaQeecvMg2ESz0+TPvK4N3t
   TpAmm1mItF+v1Vo4qoEDjLJ9ZrLH87yRv/eEoYhzmMslTgZGVs0uOr5WE
   Ds5gd0x/P6VLb6aLbgRftv3wmUI2PwpSowV6VDsh2hTRdM+gXt8QrJ4xq
   bTddLNKXoHaIID5hGOwa6Phw+6B5/tHzLVDIf86z1byIuyhAuWBQpwt7l
   YwSV5Esb1I0yDVt/gi/AIuSon7SFO2J09gAzqqOy163xywOEsF60U/tqO
   qdNYxf9esvQJ2DTc1SuwikkU+nUJG1Bgzm5aZljej7A+NeiCS0cioptti
   Q==;
X-CSE-ConnectionGUID: Y8jIlGE5Smiy7EEaaSgM2w==
X-CSE-MsgGUID: zyM04ZHFSy6Qh9d+II3YUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11353"; a="51664977"
X-IronPort-AV: E=Sophos;i="6.13,307,1732608000"; 
   d="scan'208";a="51664977"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 04:37:13 -0800
X-CSE-ConnectionGUID: ESE1e2yRSAWXwCiqE84Iwg==
X-CSE-MsgGUID: f48qpgY+T+ama5NFP03CLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,307,1732608000"; 
   d="scan'208";a="115327384"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 22 Feb 2025 04:37:12 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlokl-0006Yw-1e;
	Sat, 22 Feb 2025 12:37:08 +0000
Date: Sat, 22 Feb 2025 20:36:51 +0800
From: kernel test robot <lkp@intel.com>
To: Gao Xiang <hsiangkao@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev, Xiang Gao <xiang@kernel.org>
Subject: [xiang:erofs/48bits 5/6] fs/erofs/super.c:316:33: sparse: sparse:
 cast to restricted __le16
Message-ID: <202502222035.o4rRiXPL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/linux.git erofs/48bits
head:   33ed55d3d1e69f86cf8e4b9fd140fcec8ac3e8c5
commit: 433d1d6f9f560a3d250b0e7cdca92c9428725a4f [5/6] erofs: implement 48-bit block addressing
config: loongarch-randconfig-r131-20250221 (https://download.01.org/0day-ci/archive/20250222/202502222035.o4rRiXPL-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250222/202502222035.o4rRiXPL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502222035.o4rRiXPL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/erofs/super.c:316:33: sparse: sparse: cast to restricted __le16
>> fs/erofs/super.c:316:33: sparse: sparse: cast from restricted __le64

vim +316 fs/erofs/super.c

   249	
   250	static int erofs_read_superblock(struct super_block *sb)
   251	{
   252		struct erofs_sb_info *sbi = EROFS_SB(sb);
   253		struct erofs_buf buf = __EROFS_BUF_INITIALIZER;
   254		struct erofs_super_block *dsb;
   255		void *data;
   256		int ret;
   257	
   258		data = erofs_read_metabuf(&buf, sb, 0, true);
   259		if (IS_ERR(data)) {
   260			erofs_err(sb, "cannot read erofs superblock");
   261			return PTR_ERR(data);
   262		}
   263	
   264		dsb = (struct erofs_super_block *)(data + EROFS_SUPER_OFFSET);
   265		ret = -EINVAL;
   266		if (le32_to_cpu(dsb->magic) != EROFS_SUPER_MAGIC_V1) {
   267			erofs_err(sb, "cannot find valid erofs superblock");
   268			goto out;
   269		}
   270	
   271		sbi->blkszbits = dsb->blkszbits;
   272		if (sbi->blkszbits < 9 || sbi->blkszbits > PAGE_SHIFT) {
   273			erofs_err(sb, "blkszbits %u isn't supported", sbi->blkszbits);
   274			goto out;
   275		}
   276		if (dsb->dirblkbits) {
   277			erofs_err(sb, "dirblkbits %u isn't supported", dsb->dirblkbits);
   278			goto out;
   279		}
   280	
   281		sbi->feature_compat = le32_to_cpu(dsb->feature_compat);
   282		if (erofs_sb_has_sb_chksum(sbi)) {
   283			ret = erofs_superblock_csum_verify(sb, data);
   284			if (ret)
   285				goto out;
   286		}
   287	
   288		ret = -EINVAL;
   289		sbi->feature_incompat = le32_to_cpu(dsb->feature_incompat);
   290		if (sbi->feature_incompat & ~EROFS_ALL_FEATURE_INCOMPAT) {
   291			erofs_err(sb, "unidentified incompatible feature %x, please upgrade kernel",
   292				  sbi->feature_incompat & ~EROFS_ALL_FEATURE_INCOMPAT);
   293			goto out;
   294		}
   295	
   296		sbi->sb_size = 128 + dsb->sb_extslots * EROFS_SB_EXTSLOT_SIZE;
   297		if (sbi->sb_size > PAGE_SIZE - EROFS_SUPER_OFFSET) {
   298			erofs_err(sb, "invalid sb_extslots %u (more than a fs block)",
   299				  sbi->sb_size);
   300			goto out;
   301		}
   302		sbi->dif0.blocks = le32_to_cpu(dsb->blocks_lo);
   303		sbi->meta_blkaddr = le32_to_cpu(dsb->meta_blkaddr);
   304	#ifdef CONFIG_EROFS_FS_XATTR
   305		sbi->xattr_blkaddr = le32_to_cpu(dsb->xattr_blkaddr);
   306		sbi->xattr_prefix_start = le32_to_cpu(dsb->xattr_prefix_start);
   307		sbi->xattr_prefix_count = dsb->xattr_prefix_count;
   308		sbi->xattr_filter_reserved = dsb->xattr_filter_reserved;
   309	#endif
   310		sbi->islotbits = ilog2(sizeof(struct erofs_inode_compact));
   311		if (erofs_sb_has_48bit(sbi) && dsb->rootnid_8b) {
   312			if (!erofs_sb_has_48bit(sbi)) {
   313				ret = -EOPNOTSUPP;
   314				goto out;
   315			}
 > 316			sbi->root_nid = le16_to_cpu(dsb->rootnid_8b);
   317			sbi->dif0.blocks = (sbi->dif0.blocks << 32) |
   318					le16_to_cpu(dsb->rb.blocks_hi);
   319		} else {
   320			sbi->root_nid = le16_to_cpu(dsb->rb.rootnid_2b);
   321		}
   322		sbi->packed_nid = le64_to_cpu(dsb->packed_nid);
   323		sbi->inos = le64_to_cpu(dsb->inos);
   324	
   325		sbi->epoch = (s64)le64_to_cpu(dsb->epoch);
   326		sbi->build_time = le32_to_cpu(dsb->build_time);
   327		sbi->fixed_nsec = le32_to_cpu(dsb->fixed_nsec);
   328		super_set_uuid(sb, (void *)dsb->uuid, sizeof(dsb->uuid));
   329	
   330		ret = strscpy(sbi->volume_name, dsb->volume_name,
   331			      sizeof(dsb->volume_name));
   332		if (ret < 0) {	/* -E2BIG */
   333			erofs_err(sb, "bad volume name without NIL terminator");
   334			ret = -EFSCORRUPTED;
   335			goto out;
   336		}
   337	
   338		/* parse on-disk compression configurations */
   339		ret = z_erofs_parse_cfgs(sb, dsb);
   340		if (ret < 0)
   341			goto out;
   342	
   343		/* handle multiple devices */
   344		ret = erofs_scan_devices(sb, dsb);
   345	
   346		if (erofs_is_fscache_mode(sb))
   347			erofs_info(sb, "[deprecated] fscache-based on-demand read feature in use. Use at your own risk!");
   348	out:
   349		erofs_put_metabuf(&buf);
   350		return ret;
   351	}
   352	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
