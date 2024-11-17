Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C802915C0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Nov 2024 17:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731865385; cv=none; b=BYE5jRwfz8KWEqem58XwBFpGOGJCcfmOj6xuf2Cwwd8s+Fpxlve0Ctyyft7zJSrK5kZv87VL28ePrYUAQCGoyriqfdr0OiMUzwrOPgbWW8hQRFM3Ohkv8BwXPdFu2qxDqe3ILC9j4H/a7V0fUmr0Id4wC020+5QwLwJ/PF4yL+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731865385; c=relaxed/simple;
	bh=tlszz9IXYt1yRjxbwYuMZEFv3ffsD/TTMagf20s5lsA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JqPq2qUSxEba7NvVGGg0dwuQKVMrbMiTzu3Pk1BDTXFk6nx8MirjlQplaJeCU4Z9pwYxV8YlvvEx6gKPThTGtfdIg/UVqzghOUt7WYNL26R5aUR+VfnyOd9W9aQVY+nF2nPnM49AOj2W2BeQS+/EjpCNvoB/RNuSftPwBTn9PPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ao8VSw2F; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ao8VSw2F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731865383; x=1763401383;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tlszz9IXYt1yRjxbwYuMZEFv3ffsD/TTMagf20s5lsA=;
  b=ao8VSw2FyvQBVwIfzGSIapViuZvt+XcaxHBokd93oZ1hOE2bZ0q6tsrU
   zvt64el5tPcSJ6mbdp48yabnj8leoacmM5w8gjGLkjIARI+XmpeK3e4W3
   myur7vsWHbvP36PFa5N/aGega5DIxx6lFmxPv9RU7hoaFyo+bGqcZUiPe
   7dRdqo4d/66J4ww+nRIJiXox7BF5Q6RPWYOd0a63EBG3JJmdhUX1HG6do
   +Bh9qke7BVJgarkjaO08qRkJyADA05ORmBjE+kPo4zrInEISoegLXnrLS
   r6fR/rDoFkR0MHVMBJIh1TcoR7fHRydIlIQws9ZZzqnktdzZG4hSMDlN6
   A==;
X-CSE-ConnectionGUID: fkRb1vXmTqKSlSJ/IrE+5Q==
X-CSE-MsgGUID: q6zU7th0T1e8rRyFEFU6nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31199131"
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="31199131"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 09:43:03 -0800
X-CSE-ConnectionGUID: 5xtRn/dlSVCOWAL/M2DUTQ==
X-CSE-MsgGUID: L9UHKRPAQxqvz4TRo6zL6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="93857063"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Nov 2024 09:43:02 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCjIZ-0001yf-2k;
	Sun, 17 Nov 2024 17:42:59 +0000
Date: Mon, 18 Nov 2024 01:42:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 3/4] samples/vfs/mountinfo.c:142:33: warning:
 format specifies type 'unsigned long' but the argument has type 'uint64_t'
 (aka 'unsigned long long')
Message-ID: <202411180148.PJ9Z6Ra7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   c265569fa15d396830f1587af9f2c0321ab80434
commit: 896188dd738a68b11f1aa0041c014c8004157145 [3/4] samples: add a mountinfo program to demonstrate statmount()/listmount()
config: i386-randconfig-053-20241117 (https://download.01.org/0day-ci/archive/20241118/202411180148.PJ9Z6Ra7-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411180148.PJ9Z6Ra7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411180148.PJ9Z6Ra7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> samples/vfs/mountinfo.c:142:33: warning: format specifies type 'unsigned long' but the argument has type 'uint64_t' (aka 'unsigned long long') [-Wformat]
     142 |                 printf("0x%lx 0x%lx 0x%llx ", mnt_ns_id, mnt_id, buf->mnt_parent_id);
         |                           ~~~                 ^~~~~~~~~
         |                           %llx
   samples/vfs/mountinfo.c:142:44: warning: format specifies type 'unsigned long' but the argument has type 'uint64_t' (aka 'unsigned long long') [-Wformat]
     142 |                 printf("0x%lx 0x%lx 0x%llx ", mnt_ns_id, mnt_id, buf->mnt_parent_id);
         |                                 ~~~                      ^~~~~~
         |                                 %llx
   2 warnings generated.


vim +142 samples/vfs/mountinfo.c

   124	
   125	static int dump_mountinfo(uint64_t mnt_id, uint64_t mnt_ns_id)
   126	{
   127		int ret;
   128		struct statmount *buf = alloca(STATMOUNT_BUFSIZE);
   129		const uint64_t mask = STATMOUNT_SB_BASIC | STATMOUNT_MNT_BASIC |
   130					STATMOUNT_PROPAGATE_FROM | STATMOUNT_FS_TYPE |
   131					STATMOUNT_MNT_ROOT | STATMOUNT_MNT_POINT |
   132					STATMOUNT_MNT_OPTS | STATMOUNT_FS_SUBTYPE |
   133					STATMOUNT_SB_SOURCE;
   134	
   135		ret = statmount(mnt_id, mnt_ns_id, mask, buf, STATMOUNT_BUFSIZE, 0);
   136		if (ret < 0) {
   137			perror("statmount");
   138			return 1;
   139		}
   140	
   141		if (ext_format)
 > 142			printf("0x%lx 0x%lx 0x%llx ", mnt_ns_id, mnt_id, buf->mnt_parent_id);
   143	
   144		printf("%u %u %u:%u %s %s ", buf->mnt_id_old, buf->mnt_parent_id_old,
   145					   buf->sb_dev_major, buf->sb_dev_minor,
   146					   &buf->str[buf->mnt_root],
   147					   &buf->str[buf->mnt_point]);
   148		show_mnt_attrs(buf->mnt_attr);
   149		show_propagation(buf);
   150	
   151		printf(" - %s", &buf->str[buf->fs_type]);
   152		if (buf->mask & STATMOUNT_FS_SUBTYPE)
   153			printf(".%s", &buf->str[buf->fs_subtype]);
   154		if (buf->mask & STATMOUNT_SB_SOURCE)
   155			printf(" %s ", &buf->str[buf->sb_source]);
   156		else
   157			printf(" :none ");
   158	
   159		show_sb_flags(buf->sb_flags);
   160		if (buf->mask & STATMOUNT_MNT_OPTS)
   161			printf(",%s", &buf->str[buf->mnt_opts]);
   162		printf("\n");
   163		return 0;
   164	}
   165	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
