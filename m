Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD4154648
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Aug 2024 19:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724701949; cv=none; b=lqDpAV6UQjejHbaZaCzC70nN2uG7X5uL6UPblmwHjwAon3Z/kkeNHNP3B3amGJIQNmNj+H9w3lmHGzgdKaNuOz/KNL+IA8/rZDz7gi36o9vACdgznLI6tINUVraWOHODN0LU0JjVK/ugW8KSUuOm202kpfTBMT89G3BPCE8xFi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724701949; c=relaxed/simple;
	bh=Ni8MDSVEKTTCX6GTQuE1zte/5QBiudCWFOB9KcqDgxs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hmcpBbSB/4zGfEuso0sW/9qZVmEnyRNIkAYw+70O8fCghFtq427WviAbVD6J7cuMKvuFzbaDuQsEJpODFoy591MLQjflThCtHHggZZUjD0VDqvmplOI2z+6bz+a4B/b4jR0qTTyu1mnoVWl1fYITBGMG75cQ5Sy4VmyUqXfDZ5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tk/DwQZX; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tk/DwQZX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724701947; x=1756237947;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ni8MDSVEKTTCX6GTQuE1zte/5QBiudCWFOB9KcqDgxs=;
  b=Tk/DwQZXpJ59JtWYpq/HHTfL2sLSg3iWH58iqNs79ryKGRZ6FIY4ifYz
   byb31AFTOCglz6G2w2yew4rU+NpHLUw8JoddwuQBB/75kV+CfRNYm4mh+
   eu/8JhgvnsjtA+YcA1VSRL6zJj/ar/02j9M8ik+OfDa05b9Jcxux/+3yx
   cV/g0wcR2NFgJ1eMUKM2CsaWZLPBC6af+aeobuJr1Od0+i55F9NedtwK0
   g+5XsWPpq3MHxhaZrAPZK9YR4gCkuX3ROH6eJsekYGHkDcgHlKHN4Vy56
   YOoFSPYeviOhVgtnofXmEpGaBquY2L83h7fSL6ZjNWAVMwl8NjAQzAbZ4
   g==;
X-CSE-ConnectionGUID: 15zyTzY8SMaho089TbF/6A==
X-CSE-MsgGUID: SGv1zRd2QMyt+ZMLkDqBXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="40617198"
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; 
   d="scan'208";a="40617198"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 12:52:26 -0700
X-CSE-ConnectionGUID: WlYvngIvRP2IIR6faW2iTA==
X-CSE-MsgGUID: Xm/IEsXPR9CWZLUkEVDPow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; 
   d="scan'208";a="62672190"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Aug 2024 12:52:26 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1siflH-000HY4-22;
	Mon, 26 Aug 2024 19:52:23 +0000
Date: Tue, 27 Aug 2024 03:52:13 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 8969/23560] fs/btrfs/.tmp_inode.o:
 warning: objtool: run_delalloc_nocow()+0x62c: unreachable instruction
Message-ID: <202408270310.2w8xfOVc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nikolay,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   cbbc4774e41c354f5b0f9fc7a9be442fcee74b3f
commit: c5bcfc0da15495ae5441f91a2572559e7e44142c [8969/23560] btrfs: Remove extent_io_ops::fill_delalloc
config: x86_64-buildonly-randconfig-004-20240825 (https://download.01.org/0day-ci/archive/20240827/202408270310.2w8xfOVc-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240827/202408270310.2w8xfOVc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408270310.2w8xfOVc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/btrfs/inode.c:8:
   In file included from include/linux/buffer_head.h:14:
   include/linux/pagemap.h:401:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     401 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:2776:16: warning: variable 'inode' set but not used [-Wunused-but-set-variable]
    2776 |         struct inode *inode;
         |                       ^
   fs/btrfs/inode.c:6727:6: warning: variable 'drop_on_err' set but not used [-Wunused-but-set-variable]
    6727 |         int drop_on_err = 0;
         |             ^
   3 warnings generated.
>> fs/btrfs/.tmp_inode.o: warning: objtool: run_delalloc_nocow()+0x62c: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
