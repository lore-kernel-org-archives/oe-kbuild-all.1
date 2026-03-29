Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3AC1DE2D8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Mar 2026 02:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774751716; cv=none; b=e9VitEK9aOBS556WGFNHuOYqp2OUtU+riMjTPN5ar/Xt8vTFZNBnAhqwdAyJ3KMxhQl6CS8jArH9KXgbNLbuIa/WpUXR0UVmfOAKphqmhoybWAWwYNbG5eSNrOCWbyae1F1ImNLYdjWA1p2zZzsarQUkNiDwnIM01/ha96Hnnv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774751716; c=relaxed/simple;
	bh=9Ac+RSLBl3qky9OwUZcUwRRdxwp3gQ2XnjjcUvvUvmU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XqkJb7sg9sDI+nOaBMHoIM5JeYfMVonxKF21w+CvhFvfpN/P2AG/gSQ0QVqAtjUmYcw+1uKsuq/ippOe8uXoUF4aoC9Dd1qOF+ShCGir3DilpRk9GdsEZExT5m4UI9J1K4IaQXK2gpjop381KIl/gWz5s+fmgYJjpXiyplagiK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h6RGL9T8; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h6RGL9T8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774751715; x=1806287715;
  h=date:from:to:cc:subject:message-id;
  bh=9Ac+RSLBl3qky9OwUZcUwRRdxwp3gQ2XnjjcUvvUvmU=;
  b=h6RGL9T8PqLlG+p++2gY4P4S9Et5j27bFxNBMJJ/l753JxmZa1IZjXCw
   kedgF2+Ae5yjAuD/6GubwpyfWcMuJmPQ+WQjJs7Xh43I1U6/8EsRvmrRA
   ul8wEXuf16IM6S5WOXtzRbx72yc3t5s60/c6fOJI7zh/VAJPtE3ZUQzyH
   1GzQ9TkbtgOZbdrSSZo9qsarSeMXq3rlnWWO0dwizfNK62Ui49pF8tkPj
   h3FG6A6XhxNNqeHysG54BiHrYL/rg1pw5NRvH9lqKLXTjdd7j2EJM5rIH
   MTA+bRJRhaGBPxW6229I5M247OX8FQa3IexSIecCY8V2BCN1dvL65Oqiv
   g==;
X-CSE-ConnectionGUID: S+cMYfgBTdGJVZmrrvc8sA==
X-CSE-MsgGUID: GB8nynnpQIm80KfTotW4aQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="75844510"
X-IronPort-AV: E=Sophos;i="6.23,147,1770624000"; 
   d="scan'208";a="75844510"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 19:35:12 -0700
X-CSE-ConnectionGUID: x3HKWqNxS/i/bfpAQLqJ9w==
X-CSE-MsgGUID: /nARMqSfRli6iV78q6y0vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,147,1770624000"; 
   d="scan'208";a="227311345"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 28 Mar 2026 19:35:11 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6fzZ-000000007nz-0UyO;
	Sun, 29 Mar 2026 02:35:09 +0000
Date: Sun, 29 Mar 2026 04:34:55 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 12/12]
 progs/hid_bpf_helpers.h:114:31: error: declaration of 'struct bpf_wq' will
 not be visible outside of this function
Message-ID: <202603290453.fNVfrWWe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   f913cf91bd605dfe1c02404e4ed46d65b9a40169
commit: 662100c8e61044374da90c4088c255e43e63ed04 [12/12] Merge 88264981f208 ("Merge tag 'sched_ext-for-6.12' of git://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext") into android-mainline
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260329/202603290453.fNVfrWWe-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260329/202603290453.fNVfrWWe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603290453.fNVfrWWe-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from progs/hid.c:3:
>> progs/hid_bpf_helpers.h:114:31: error: declaration of 'struct bpf_wq' will not be visible outside of this function [-Werror,-Wvisibility]
     114 | extern int bpf_wq_init(struct bpf_wq *wq, void *p__map, unsigned int flags) __weak __ksym;
         |                               ^
   progs/hid_bpf_helpers.h:115:32: error: declaration of 'struct bpf_wq' will not be visible outside of this function [-Werror,-Wvisibility]
     115 | extern int bpf_wq_start(struct bpf_wq *wq, unsigned int flags) __weak __ksym;
         |                                ^
   progs/hid_bpf_helpers.h:116:44: error: declaration of 'struct bpf_wq' will not be visible outside of this function [-Werror,-Wvisibility]
     116 | extern int bpf_wq_set_callback_impl(struct bpf_wq *wq,
         |                                            ^
>> progs/hid.c:448:16: error: field has incomplete type 'struct bpf_wq'
     448 |         struct bpf_wq work;
         |                       ^
   progs/hid.c:448:9: note: forward declaration of 'struct bpf_wq'
     448 |         struct bpf_wq work;
         |                ^
>> progs/hid.c:487:18: error: incompatible pointer types passing 'struct bpf_wq *' to parameter of type 'struct bpf_wq *' [-Wincompatible-pointer-types]
     487 |         if (bpf_wq_init(wq, &hmap, 0) != 0)
         |                         ^~
   progs/hid_bpf_helpers.h:114:39: note: passing argument to parameter 'wq' here
     114 | extern int bpf_wq_init(struct bpf_wq *wq, void *p__map, unsigned int flags) __weak __ksym;
         |                                       ^
   progs/hid.c:490:26: error: incompatible pointer types passing 'struct bpf_wq *' to parameter of type 'struct bpf_wq *' [-Wincompatible-pointer-types]
     490 |         if (bpf_wq_set_callback(wq, wq_cb_sleepable, 0))
         |                                 ^~
   progs/hid_bpf_helpers.h:116:52: note: passing argument to parameter 'wq' here
     116 | extern int bpf_wq_set_callback_impl(struct bpf_wq *wq,
         |                                                    ^
   progs/hid.c:493:19: error: incompatible pointer types passing 'struct bpf_wq *' to parameter of type 'struct bpf_wq *' [-Wincompatible-pointer-types]
     493 |         if (bpf_wq_start(wq, 0))
         |                          ^~
   progs/hid_bpf_helpers.h:115:40: note: passing argument to parameter 'wq' here
     115 | extern int bpf_wq_start(struct bpf_wq *wq, unsigned int flags) __weak __ksym;
         |                                        ^
   progs/hid.c:503:24: error: incomplete definition of type 'struct hid_device'
     503 |         int hid = hid_ctx->hid->id;
         |                   ~~~~~~~~~~~~^
   progs/hid_bpf_helpers.h:56:9: note: forward declaration of 'struct hid_device'
      56 |         struct hid_device *hid;
         |                ^
   8 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
