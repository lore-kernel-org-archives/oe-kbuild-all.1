Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ABC13D9E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Mar 2024 05:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711172992; cv=none; b=iQ2SsEYT9fro6QAtX7GIQnK4J/q9Q1U/DOZoDPKi4RQVpMz4X0DhtzXqYJpOvib6X5jqrzd0CL8cV89fwh0wx19wvNguPSOfiuNp0RmEEbhLt7KHjOT0Aqie0QrmMad0WuTeUEn1dJ+e9sutG84j3LepEZeRvFYj5Dnp3ECuuuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711172992; c=relaxed/simple;
	bh=CjcifOb+Lu5sNhzw+SNH2x4UqiCrQDHatq9HSIxcxQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bl+7NCiUYoGi2mjCnT5Qy7r69ZpSedwryaTAJU3uy7gLP4T0e+Bp3Mhv918OU++gxThot3iKWyjpYRWFuXlsZ+mnsqzdhPszThobq3oiqU7nm72JDAqWPKZTzeHnhsAemYQEmV4vadUPbtQDcAaf9zjyxJ2ph4YStW1G2w/bih0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T4tsgT8X; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T4tsgT8X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711172990; x=1742708990;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CjcifOb+Lu5sNhzw+SNH2x4UqiCrQDHatq9HSIxcxQI=;
  b=T4tsgT8XMhny/53bYpK++3EUFQ5Dc8Zgw886h5CLu/arKl1bd7xSButM
   c0Pk2HNTSGdA40dRYe28oo8zDpBXZnFBOm9QTRrzDtYJl8CJeOvjs/Hk/
   Hox7G92N5ebiJ83dMUuY4Dj7Ud8XVBrZumQi+trpqSd3iyYFTGrt4h5JI
   818JLXcsbhgVut0oipf0oG76inT4+e5DuMo3erNamXh2UAqSjdymdtgaU
   mXnR/Ucs9XmOd5ah2SXynPjxFmEPk9OEqdo+H5Kj5GGNe/++PnsYFLjZQ
   Pf5FBPDi5a++S4Op7kmyiCfXwcZoMZ2mc6dhlbNmnFL27Mo0FaH6/ggnL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="10007204"
X-IronPort-AV: E=Sophos;i="6.07,148,1708416000"; 
   d="scan'208";a="10007204"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 22:49:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,148,1708416000"; 
   d="scan'208";a="15558101"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 22 Mar 2024 22:49:48 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnuGH-000KuF-27;
	Sat, 23 Mar 2024 05:49:45 +0000
Date: Sat, 23 Mar 2024 13:49:30 +0800
From: kernel test robot <lkp@intel.com>
To: Kanchan Joshi <joshi.k@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/4] io_uring/rw: support read/write with metadata
Message-ID: <202403231321.ipY2foxo-lkp@intel.com>
References: <20240322185023.131697-3-joshi.k@samsung.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240322185023.131697-3-joshi.k@samsung.com>

Hi Kanchan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 6f0974eccbf78baead1735722c4f1ee3eb9422cd]

url:    https://github.com/intel-lab-lkp/linux/commits/Kanchan-Joshi/io_uring-rw-Get-rid-of-flags-field-in-struct-io_rw/20240323-025900
base:   6f0974eccbf78baead1735722c4f1ee3eb9422cd
patch link:    https://lore.kernel.org/r/20240322185023.131697-3-joshi.k%40samsung.com
patch subject: [RFC PATCH 2/4] io_uring/rw: support read/write with metadata
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240323/202403231321.ipY2foxo-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240323/202403231321.ipY2foxo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403231321.ipY2foxo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/bitops.h:7,
                    from include/linux/kernel.h:23,
                    from io_uring/rw.c:2:
   io_uring/rw.c: In function 'io_rw_meta':
>> io_uring/rw.c:1160:50: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1160 |         void __user *meta_addr = u64_to_user_ptr((u64)rw->kiocb.private);
         |                                                  ^
   include/linux/typecheck.h:11:16: note: in definition of macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                ^
   io_uring/rw.c:1160:34: note: in expansion of macro 'u64_to_user_ptr'
    1160 |         void __user *meta_addr = u64_to_user_ptr((u64)rw->kiocb.private);
         |                                  ^~~~~~~~~~~~~~~
>> io_uring/rw.c:1160:50: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1160 |         void __user *meta_addr = u64_to_user_ptr((u64)rw->kiocb.private);
         |                                                  ^
   include/linux/kernel.h:59:36: note: in definition of macro 'u64_to_user_ptr'
      59 |         (void __user *)(uintptr_t)(x);  \
         |                                    ^


vim +1160 io_uring/rw.c

  1156	
  1157	int io_rw_meta(struct io_kiocb *req, unsigned int issue_flags)
  1158	{
  1159		struct io_rw *rw = io_kiocb_to_cmd(req, struct io_rw);
> 1160		void __user *meta_addr = u64_to_user_ptr((u64)rw->kiocb.private);
  1161		struct io_rw_state_meta __sm, *sm = &__sm;
  1162		struct kiocb *kiocb = &rw->kiocb;
  1163		int ret;
  1164	
  1165		if (!(req->file->f_flags & O_DIRECT))
  1166			return -EOPNOTSUPP;
  1167		/* prepare iter for meta-buffer */
  1168		if (!req_has_async_data(req)) {
  1169			ret = import_ubuf(ITER_SOURCE, meta_addr, rw->meta_len, &sm->iter_meta);
  1170			iov_iter_save_state(&sm->iter_meta, &sm->iter_state_meta);
  1171			if (unlikely(ret < 0))
  1172				return ret;
  1173		} else {
  1174			struct io_async_rw *io = req->async_data;
  1175	
  1176			sm = &io->s_meta;
  1177			iov_iter_restore(&sm->iter_meta, &sm->iter_state_meta);
  1178		}
  1179		/* Store iter for meta-buf in private, will be used later*/
  1180		kiocb->private = sm;
  1181		if (req->opcode == IORING_OP_READ_META) {
  1182			ret = __io_read(req, issue_flags);
  1183			if (ret >= 0)
  1184				return kiocb_done(req, ret, issue_flags);
  1185		} else {
  1186			ret = io_write(req, issue_flags);
  1187		}
  1188		if (ret == -EAGAIN)
  1189			kiocb->private = meta_addr;
  1190		return ret;
  1191	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
