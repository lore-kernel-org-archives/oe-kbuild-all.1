Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131153BBC1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Sep 2024 03:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727667230; cv=none; b=nB8p+uCOB+V0sOOEMjXzLiBq4nx59zqPC745vn3thz/hwcRMRzhLzadfG/rafW1jxbFWBA8HX7DlOWjMcirGjy55sF9FD/b78KtcJaxTQ8FlgfAFFkgDprmZcRvELskmGDLe9W4l5Lhud4e7nGjjCDwnsfjLFS3OWxd/7QYPtUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727667230; c=relaxed/simple;
	bh=/EhgcihdbO7KAMWo1kJ6xl6i7PCE8SDzjdxGVn7McVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nUtdolmJnG87uwISewr9hwtwvaaePb/L52RPjfQTPRnlXWjle0IGU8ODzJSlyVjLzokEFvmYpHxdy5J2NPrU4uu91eeLXszIzLxpMidsW+l8F03I21Afmx1gYzjyKacKzbJDopKfUnMu2h2IBmYfbYfcJXyc7nfpsHKXXJuHBlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iXOOXF3Q; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iXOOXF3Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727667229; x=1759203229;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/EhgcihdbO7KAMWo1kJ6xl6i7PCE8SDzjdxGVn7McVQ=;
  b=iXOOXF3Q/ipRRVDsgg94lANMHbo2rGbPwZt6T5VupP1I441+dIE64QRV
   22WNBjUFiJUiGgUMpH/jT+JJq/lr8wa7XEx40UYWSsRKZbXqBotI9Pjcw
   aI1gbZdJpdZ8nBm3mL1br/A/dxXgn5eHeECEq4jMBHxSX2joA2yPEFt4U
   NlQzDHik2e0K7ZTiK8x6IDE3rofki63kiucmsO5Jcv0XCexArVreBFpr6
   Uk1UK9vvWvCVuD0lZGrMRWgrsEyNsfsbvZVmWD4MJmBAbicMK1xIpqj2q
   y9W4NFR3NDN9fkGQ2yrCa9BWpIYTfTmJDjcxONFp0vqp6CxCnqAi7V4pm
   g==;
X-CSE-ConnectionGUID: wdAHfu96TuGIGtIMqgT3ig==
X-CSE-MsgGUID: m5WQQAoUTpCmZ5/jSXeaMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="26832948"
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="26832948"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 20:33:47 -0700
X-CSE-ConnectionGUID: nDZmhUulTSyttEOsC0dehQ==
X-CSE-MsgGUID: x48+36+lQBu0lA8ZXm9cQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="73205738"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 Sep 2024 20:33:46 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sv7AN-000P06-15;
	Mon, 30 Sep 2024 03:33:43 +0000
Date: Mon, 30 Sep 2024 11:33:32 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: fs/bcachefs/super.c:712:35-36: Unneeded semicolon
Message-ID: <202409301117.WU3PIi28-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9852d85ec9d492ebef56dc5f229416c925758edc
commit: 1c6fdbd8f2465ddfb73a01ec620cbf3d14044e1a bcachefs: Initial commit
date:   11 months ago
config: arc-randconfig-r061-20240930 (https://download.01.org/0day-ci/archive/20240930/202409301117.WU3PIi28-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409301117.WU3PIi28-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/super.c:712:35-36: Unneeded semicolon

vim +712 fs/bcachefs/super.c

   642	
   643	const char *bch2_fs_start(struct bch_fs *c)
   644	{
   645		const char *err = "cannot allocate memory";
   646		struct bch_sb_field_members *mi;
   647		struct bch_dev *ca;
   648		time64_t now = ktime_get_seconds();
   649		unsigned i;
   650		int ret = -EINVAL;
   651	
   652		mutex_lock(&c->state_lock);
   653	
   654		BUG_ON(c->state != BCH_FS_STARTING);
   655	
   656		mutex_lock(&c->sb_lock);
   657	
   658		for_each_online_member(ca, c, i)
   659			bch2_sb_from_fs(c, ca);
   660	
   661		mi = bch2_sb_get_members(c->disk_sb.sb);
   662		for_each_online_member(ca, c, i)
   663			mi->members[ca->dev_idx].last_mount = cpu_to_le64(now);
   664	
   665		mutex_unlock(&c->sb_lock);
   666	
   667		for_each_rw_member(ca, c, i)
   668			bch2_dev_allocator_add(c, ca);
   669		bch2_recalc_capacity(c);
   670	
   671		ret = BCH_SB_INITIALIZED(c->disk_sb.sb)
   672			? bch2_fs_recovery(c)
   673			: bch2_fs_initialize(c);
   674		if (ret)
   675			goto err;
   676	
   677		err = "dynamic fault";
   678		if (bch2_fs_init_fault("fs_start"))
   679			goto err;
   680	
   681		if (c->opts.read_only) {
   682			bch2_fs_read_only(c);
   683		} else {
   684			err = bch2_fs_read_write(c);
   685			if (err)
   686				goto err;
   687		}
   688	
   689		set_bit(BCH_FS_STARTED, &c->flags);
   690	
   691		err = NULL;
   692	out:
   693		mutex_unlock(&c->state_lock);
   694		return err;
   695	err:
   696		switch (ret) {
   697		case BCH_FSCK_ERRORS_NOT_FIXED:
   698			bch_err(c, "filesystem contains errors: please report this to the developers");
   699			pr_cont("mount with -o fix_errors to repair\n");
   700			err = "fsck error";
   701			break;
   702		case BCH_FSCK_REPAIR_UNIMPLEMENTED:
   703			bch_err(c, "filesystem contains errors: please report this to the developers");
   704			pr_cont("repair unimplemented: inform the developers so that it can be added\n");
   705			err = "fsck error";
   706			break;
   707		case BCH_FSCK_REPAIR_IMPOSSIBLE:
   708			bch_err(c, "filesystem contains errors, but repair impossible");
   709			err = "fsck error";
   710			break;
   711		case BCH_FSCK_UNKNOWN_VERSION:
 > 712			err = "unknown metadata version";;
   713			break;
   714		case -ENOMEM:
   715			err = "cannot allocate memory";
   716			break;
   717		case -EIO:
   718			err = "IO error";
   719			break;
   720		}
   721	
   722		BUG_ON(!err);
   723		set_bit(BCH_FS_ERROR, &c->flags);
   724		goto out;
   725	}
   726	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
