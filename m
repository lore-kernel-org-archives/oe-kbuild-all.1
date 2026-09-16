Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11D529C328
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Sep 2026 08:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789548014; cv=none; b=IfSauYTqMI0qNPH5i61s0MY4SNP1WT3wk8V9kmpiECktxFgpx24mAikAgep19kVGlW13bu4kPwksnlXkbad9WciISVH2VW6Ol1UNWAgmEU7hXNsy4eMqgs0F3eLnVeZj7b5n2tTtK1nfrRfUXVymi1AcTRkUXD/PwPOgeyskpE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789548014; c=relaxed/simple;
	bh=u4tSUeaw/AC+boVFovo6S+gGQ96j/sqJ292VBDgTzBE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jq/6G+8qpDtIZL2nLXx5WMoIpU5wp0YnwdW+YocGEz2/qQB3KQ25c18pmurz1QVstdIEcxKp2fwJ0hwwPQXn1038kja4+kvC5SP9SwoABbY2jyKGa5hysfSdRFjHWu5Bhj1/4l5Yw+arBzH6gFJa3CAzt6DCwvikVhW6joTj7r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=beCtFLG8; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="beCtFLG8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789548011; x=1821084011;
  h=date:from:to:cc:subject:message-id;
  bh=u4tSUeaw/AC+boVFovo6S+gGQ96j/sqJ292VBDgTzBE=;
  b=beCtFLG85X+lI+UhVbtJ1M6vkeBp07fveUDbXi2EnzRuzJzvZZ1jwcJz
   KnE6I5mtJOh/3jNEHiFgyrLWHph+jC3q8YNfSl+OHpw3hbqpgWVwHFQoG
   Tct3DJRZaU9vvFjPs2pxRYN48RxeTOyoo1JmSmM71Q9+x0Lwu0SkFi68b
   Kp0rgIGTcoQ3LEPJEl2Q3eLUOEqQP7E2T7gNVi2Us22Pvrl2bgXXLDxY8
   FBGJsI08tY6VUKwas+jzegcKHBTcEFM5ci5jOz+unofC406RjrKh02Eqc
   QRSb5tYrExJu1gcKEQDE6kV+qLWHfA8ckQkcCtJBMV1F0kuUGx1WUyzf8
   A==;
X-CSE-ConnectionGUID: HIVxXNl4QGe2I8TAIQQjxg==
X-CSE-MsgGUID: v4+NtXWqQsezT7AC3UFl8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77480652"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77480652"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 01:40:11 -0700
X-CSE-ConnectionGUID: Qhf8B+31SnGBaNyfl5TsMQ==
X-CSE-MsgGUID: AFms/nhdR1S2iuAEYI0orw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="275235321"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Sep 2026 01:40:09 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6lBX-000000005jd-1aGW;
	Wed, 16 Sep 2026 08:40:07 +0000
Date: Wed, 16 Sep 2026 16:39:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 11/101]
 fs/bcachefs/vfs/ioctl.c:907:27: sparse: sparse: cast to non-scalar
Message-ID: <202609161633.giCUs5Ok-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   ca944a61e079450f82be88c91e349638c75cf4b6
commit: 39fe245ff806f1dcf1d02b034d35df86b8944ec2 [11/101] bcachefs: wire up error reporting in pread_raw ioctl
config: openrisc-randconfig-r112-20260915 (https://download.01.org/0day-ci/archive/20260916/202609161633.giCUs5Ok-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260916/202609161633.giCUs5Ok-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609161633.giCUs5Ok-lkp@intel.com/

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
