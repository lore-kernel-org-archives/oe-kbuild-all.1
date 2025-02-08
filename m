Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC84241C9D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 17:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739035958; cv=none; b=Rbjv7ag0T14ocBliowZ+ob2omtwdnGbecMXzFqRzI+niP7h9+lwRvNVtJ2Jm4TVI00A+TtXvaHVPpd55OJciM0qeJTVXdgWMp3i+2m7kKkSvlmLcC5/6gEZb+Yd5d5nUaBVfDICkaltLiT28ctmoz7uZPhMKDreh/snesZtjk7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739035958; c=relaxed/simple;
	bh=lxw9meEwMbCqVQ2bzm0/3F0ariB539eDVwY6/t4KCqc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bXYcUINjYKA8/w81QWzfYDu8fTdKhmV0nuh8/5U/DqNO2AF9kgKAr1ZAZiTIA1bYdpxmHgBYecUfs+D/H5PJhKIIM8CE1zi0q2/TEWuzVcXnQA19Sd8D6UCnjZqsFZEwHZApmafOe77yk2VlqFLEkZxlU+woU/Bn+8Xzhhxw5E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lh5lnqB1; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lh5lnqB1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739035956; x=1770571956;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lxw9meEwMbCqVQ2bzm0/3F0ariB539eDVwY6/t4KCqc=;
  b=lh5lnqB1GRp0a2vk7hWAy9j4HD8j28WJAfW+CTDQDLDAtF+I4Ub/NiBp
   CBZMzezlKUgEcx1blszWLMM14ptAYR9W149ZN6JzOwzK8mYQCkjNOUIAU
   U08fw6uU3ebSVhrmR5g3IvM5acSa+BMsWcp3+lvyh0l7YJh9PUoCTxsR2
   AJ0PBFGM5Qt+TgSCqWTomd2WVJYPJzkE+BBZHI8NJPH/b3Es6S4fj125d
   oD4ZGnLNoGEg59w1SaTBPdpOEMKsjuxPYa9S3Sw4hy5TsZnsUbABllAfr
   86kb+tztcVL7t4ZdWqNbDuWhU0GOB44k8pUuKH4nhV8QZU4PgL3G4ptVi
   Q==;
X-CSE-ConnectionGUID: I6zggGGJTmCsarTHRFjUsQ==
X-CSE-MsgGUID: yxL1GNKLQpKx+jMufJiLwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="43583995"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="43583995"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 09:32:36 -0800
X-CSE-ConnectionGUID: 4sf1Y9eMTNKxxLz7X7R3Gw==
X-CSE-MsgGUID: 9RorDhdkTHyP2JEarMMp9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="116745400"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 08 Feb 2025 09:32:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgogy-0010Qd-13;
	Sat, 08 Feb 2025 17:32:32 +0000
Date: Sun, 9 Feb 2025 01:31:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1418/1418] mm/maccess.c:64:6: warning:
 no previous prototype for '__probe_user_read'
Message-ID: <202502090137.3KkiIJ8x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   cc7cb040bd0afe96f1da94c9f21eda5a986510a5
commit: 5c5bac1227aee80ee106ec07b32c981558049304 [1418/1418] uaccess: Add non-pagefault user-space read functions
config: x86_64-buildonly-randconfig-001-20250207 (https://download.01.org/0day-ci/archive/20250209/202502090137.3KkiIJ8x-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502090137.3KkiIJ8x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502090137.3KkiIJ8x-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/maccess.c:64:6: warning: no previous prototype for '__probe_user_read' [-Wmissing-prototypes]
      64 | long __probe_user_read(void *dst, const void __user *src, size_t size)
         |      ^~~~~~~~~~~~~~~~~


vim +/__probe_user_read +64 mm/maccess.c

    50	
    51	/**
    52	 * probe_user_read(): safely attempt to read from a user-space location
    53	 * @dst: pointer to the buffer that shall take the data
    54	 * @src: address to read from. This must be a user address.
    55	 * @size: size of the data chunk
    56	 *
    57	 * Safely read from user address @src to the buffer at @dst. If a kernel fault
    58	 * happens, handle that and return -EFAULT.
    59	 */
    60	
    61	long __weak probe_user_read(void *dst, const void __user *src, size_t size)
    62	    __attribute__((alias("__probe_user_read")));
    63	
  > 64	long __probe_user_read(void *dst, const void __user *src, size_t size)
    65	{
    66		long ret = -EFAULT;
    67		mm_segment_t old_fs = get_fs();
    68	
    69		set_fs(USER_DS);
    70		if (access_ok(src, size))
    71			ret = probe_read_common(dst, src, size);
    72		set_fs(old_fs);
    73	
    74		return ret;
    75	}
    76	EXPORT_SYMBOL_GPL(probe_user_read);
    77	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
