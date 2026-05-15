Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5516D3EE1C0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 May 2026 23:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778889600; cv=none; b=d+7wZyaYpKChuqcV9uvINeqI+P2/2jxThQjJ3VJletfogi7Ur3FhxCHLe+WcQr0QdE5DcSfnWm8GtEwVlMqDg1fNUrQQ0OVEzVtLfVQn0lxi13g1DH+apxCqMozkjhWai/IZsUZPxWBwboO4az0jmVsLn0EgHraXvleiaDybHe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778889600; c=relaxed/simple;
	bh=JGC+HpUmb1kJNU5/9gyRaTEWISKzdV3VKQjwNTl9saI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aquRpa/ikOINl1xsGlZuZsnqWO/5GRJkwd8IzblCGn2SOqDf5ZZj0HTJjGHXgAuEyR4z3py+Sc8+D83H9D8CnQ44CZe03lBQkIbgQc8HTvkKdLUV2ccC0Z2INaUbeRXSR/F8OVhsxN2aDUvnBZgI5K5iUxk1jqqhxb6NuZyVfyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NMRh9toj; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NMRh9toj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778889598; x=1810425598;
  h=date:from:to:cc:subject:message-id;
  bh=JGC+HpUmb1kJNU5/9gyRaTEWISKzdV3VKQjwNTl9saI=;
  b=NMRh9tojq4ujocTMCYA+Rf3USIkV1tHY2S5SGRnL0Ni8tmULcWOl2W1l
   TcDlMFxBEEQAPJj84bORZuPy8zIVoHVj8qFTxYZGoXtINpCOs8xoBHlnT
   YDpBopl5F7iTY+kDLVURioFE4uCA8AAymdR1jbyOmGQZfeWmrjHEdFw5B
   L8Dsp7agcP+LiY1CSSEzuFElTWSFk8tigAeBRMD4SoH3gV90cwAy2HjJs
   UnZUzK72TFb2pMysNja4XBtbtxt8wLsi0usfVFSAz3pHbC0g9csidxpxP
   6uFso1v5sErVN2zQadN84TK/oS893a5eXTAGeYKfRwPowxGZeMHPXUN6O
   A==;
X-CSE-ConnectionGUID: fHb2ryDSR7+Hl2f+DgxCsQ==
X-CSE-MsgGUID: Uky/mfhxTsOtXY5f4hF3lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="90546432"
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="90546432"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 16:59:58 -0700
X-CSE-ConnectionGUID: k7kyKCzSQYOmeJK+58Tkhw==
X-CSE-MsgGUID: PvKIcw1zT6SWRmX8cDsSrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="232442136"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 15 May 2026 16:59:56 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wO2Re-000000000Fv-0ozz;
	Fri, 15 May 2026 23:59:54 +0000
Date: Sat, 16 May 2026 07:59:13 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 11/101]
 fs/bcachefs/vfs/ioctl.c:907:27: sparse: sparse: cast to non-scalar
Message-ID: <202605160707.JD8cgCci-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   ca944a61e079450f82be88c91e349638c75cf4b6
commit: 39fe245ff806f1dcf1d02b034d35df86b8944ec2 [11/101] bcachefs: wire up error reporting in pread_raw ioctl
config: sh-randconfig-r123-20260514 (https://download.01.org/0day-ci/archive/20260516/202605160707.JD8cgCci-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605160707.JD8cgCci-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605160707.JD8cgCci-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/bcachefs/vfs/ioctl.c:907:27: sparse: sparse: cast to non-scalar
>> fs/bcachefs/vfs/ioctl.c:907:27: sparse: sparse: cast from non-scalar

vim +907 fs/bcachefs/vfs/ioctl.c

   868	
   869	static long bch2_ioc_pread_raw(struct file *file,
   870				       struct bch_inode_info *inode,
   871				       struct bch_ioctl_pread_raw __user *uarg)
   872	{
   873		struct bch_ioctl_pread_raw arg;
   874	
   875		if (copy_from_user(&arg, uarg, sizeof(arg)))
   876			return -EFAULT;
   877		if (arg.flags & ~BCH_PREAD_RAW_no_poison_check)
   878			return -EINVAL;
   879		if (arg.err.pad)
   880			return -EINVAL;
   881		if (!arg.len)
   882			return 0;
   883		if (!(file->f_flags & O_DIRECT))
   884			return -EINVAL;
   885		if (!inode_owner_or_capable(file_mnt_idmap(file), &inode->v))
   886			return -EPERM;
   887	
   888		loff_t pos = arg.offset;
   889		int ret = rw_verify_area(READ, file, &pos, arg.len);
   890		if (ret)
   891			return ret;
   892	
   893		struct iov_iter iter;
   894		import_ubuf(ITER_DEST, (void __user *)(unsigned long)arg.buf, arg.len, &iter);
   895	
   896		struct kiocb kiocb;
   897		init_sync_kiocb(&kiocb, file);
   898		kiocb.ki_pos = arg.offset;
   899	
   900		enum bch_read_flags read_flags = 0;
   901		if (arg.flags & BCH_PREAD_RAW_no_poison_check)
   902			read_flags |= BCH_READ_no_poison_check;
   903	
   904		struct bch_read_err_report err_report;
   905		mutex_init(&err_report.lock);
   906		err_report.errors = 0;
 > 907		err_report.msg = (struct printbuf) PRINTBUF;
   908	
   909		ret = bch2_direct_IO_read(&kiocb, &iter, read_flags, &err_report);
   910	
   911		if (copy_to_user(&uarg->errors, &err_report.errors, sizeof(err_report.errors)))
   912			ret = -EFAULT;
   913	
   914		int err = bch2_copy_ioctl_err_msg(&arg.err, &err_report.msg, ret < 0 ? ret : 0);
   915		if (err && !ret)
   916			ret = err;
   917	
   918		printbuf_exit(&err_report.msg);
   919		return ret;
   920	}
   921	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
