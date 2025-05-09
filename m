Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA9121FF23
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 May 2025 08:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746780892; cv=none; b=rBNJzQvUsC5cmgENT6r43KoCoMsD6jgPEVbJ1Hz9GYU1jpNI0oSwE7x1c7N1QG9Ju8OGbVEu+sHRire82DMpZgRtzhCYFnhINrMr+4xe4HFnrBOhPWr+XqC51HnxOL2+AhrmD6TyjnKFzisyBdaiq5IZgxr/7duZuw3iLfMk7/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746780892; c=relaxed/simple;
	bh=uQDXA+7TSX572NRwNpyW3q5MtN4jdV55LZB/psVSFvs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z0mkrtuPlfUjtyo9ij9Q5+qx+NcYg6aezRkHQChhcPuJ6UHuwXhgWRGTEsjvouJVbWvgQyoa3DQQKlLCCex4f3mpKDzSYEhl8rO3XQxuy+MiXK7pLSjm41s3A+CF+w9khmKE92H2DIoiYelLGChPwwoiLyU7I8d1e6ZBHLq2/Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gujNNf7S; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gujNNf7S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746780890; x=1778316890;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uQDXA+7TSX572NRwNpyW3q5MtN4jdV55LZB/psVSFvs=;
  b=gujNNf7SHDeh02714dZd7xnEkOXSbpwxIOz50jxNxk4IyP4tbcOK40cT
   1Od+vxJiicerfOCgoUuQ0YpGZFqHETiyc1Ib63vkYtcY+5Xp1ndb+BP83
   yK8R2RzpXdAgJkw7D/AFXB0g73rQc8mGCZYQXjIIbGUiNlpfkrpVcxOME
   tNHpTdE6sfRwpNQsXVLIP0GjU295sfa8Qa/j9WVUiYjIZUmB54H4lCnAm
   DBTl4GnSbfEZfbpwmVqehHEL8j2J8XMFklNqmb+OnOq9fdmZy+dgYQWPk
   dHTozLGHJXufjGondj0UNwPPQkJvbHx2rEFVthIHBCAV4ob/8sEnnrQwv
   A==;
X-CSE-ConnectionGUID: Y+1ysVecQsO6PQ0rrFTyMw==
X-CSE-MsgGUID: kWiUZ4C0T1WYyVWEoaXIew==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="58817262"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="58817262"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 01:54:49 -0700
X-CSE-ConnectionGUID: RLDrsq9MRTaAjPJQJDoi+g==
X-CSE-MsgGUID: 3jzYtlyFS2mPvjzlw1I6bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="137493284"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 May 2025 01:54:48 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDJVF-000BqP-2j;
	Fri, 09 May 2025 08:54:45 +0000
Date: Fri, 9 May 2025 16:54:03 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/94]
 drivers/target/target_core_user.c:2123:6: warning: no previous prototype for
 function 'tcmu_ioctl_cmd_zerocopy'
Message-ID: <202505091646.ZufwXjYU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   3e44eae7361a463faa2cab260363678a02c089f5
commit: 0bfe9d4586c9e96a01af40b92912a917db5d690b [0/94] anolis: scsi: target: tcmu: Support zero copy
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250509/202505091646.ZufwXjYU-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.73.0 (cc66ad468 2023-10-03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505091646.ZufwXjYU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505091646.ZufwXjYU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/target/target_core_user.c:2123:6: warning: no previous prototype for function 'tcmu_ioctl_cmd_zerocopy' [-Wmissing-prototypes]
    2123 | long tcmu_ioctl_cmd_zerocopy(struct tcmu_dev *udev, unsigned long arg)
         |      ^
   drivers/target/target_core_user.c:2123:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2123 | long tcmu_ioctl_cmd_zerocopy(struct tcmu_dev *udev, unsigned long arg)
         | ^
         | static 
   1 warning generated.


vim +/tcmu_ioctl_cmd_zerocopy +2123 drivers/target/target_core_user.c

  2122	
> 2123	long tcmu_ioctl_cmd_zerocopy(struct tcmu_dev *udev, unsigned long arg)
  2124	{
  2125		struct tcmu_cmd *cmd;
  2126		struct se_cmd *se_cmd;
  2127		struct scatterlist *data_sg;
  2128		unsigned int data_nents;
  2129		struct tcmu_cmd_zerocopy zc;
  2130		struct iovec *iov, *tiov;
  2131		struct sg_page_iter sgiter;
  2132		struct mm_struct *mm = current->mm;
  2133		struct vm_area_struct *vma;
  2134		int i, ret = 0;
  2135	
  2136		if (copy_from_user(&zc, (struct tcmu_cmd_zerocopy __user *)arg, sizeof(zc)))
  2137			return -EFAULT;
  2138	
  2139		if (zc.iov_cnt <= 0)
  2140			return -EINVAL;
  2141	
  2142		iov = kmalloc_array(zc.iov_cnt, sizeof(struct iovec), GFP_KERNEL);
  2143		if (!iov)
  2144			return -ENOMEM;
  2145		if (copy_from_user(iov, zc.iov, sizeof(struct iovec) * zc.iov_cnt)) {
  2146			kfree(iov);
  2147			return -EFAULT;
  2148		}
  2149	
  2150		mutex_lock(&udev->cmdr_lock);
  2151		mmap_read_lock(mm);
  2152		cmd = xa_load(&udev->commands, zc.cmd_id);
  2153		if (!cmd) {
  2154			ret = -EINVAL;
  2155			kfree(iov);
  2156			pr_err("tcmu zero copy: cmd_id %d not found\n", zc.cmd_id);
  2157			goto out;
  2158		}
  2159		se_cmd = cmd->se_cmd;
  2160	
  2161		vma = find_vma(current->mm, (unsigned long)iov->iov_base);
  2162		if (!vma) {
  2163			ret = -EINVAL;
  2164			kfree(iov);
  2165			pr_err("tcmu zero copy: invalid iov_base\n");
  2166			goto out;
  2167		}
  2168		data_sg = se_cmd->t_data_sg;
  2169		data_nents = se_cmd->t_data_nents;
  2170		__sg_page_iter_start(&sgiter, data_sg, data_nents, 0);
  2171		tiov = iov;
  2172		for (i = 0; i < zc.iov_cnt; i++) {
  2173			ret = tcmu_zerocopy_one_seg(tiov, vma, &sgiter);
  2174			if (ret < 0) {
  2175				kfree(iov);
  2176				goto out;
  2177			}
  2178			tiov++;
  2179		}
  2180	
  2181		cmd->iov = iov;
  2182		cmd->iov_cnt = zc.iov_cnt;
  2183		cmd->vma_vm_mm = vma->vm_mm;
  2184		cmd->vma = vma;
  2185		mmgrab(cmd->vma_vm_mm);
  2186	out:
  2187		mmap_read_unlock(mm);
  2188		mutex_unlock(&udev->cmdr_lock);
  2189		return ret;
  2190	}
  2191	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
