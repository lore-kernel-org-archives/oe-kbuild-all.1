Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A4D155389
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 23:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765755655; cv=none; b=BF7PuYiWFsGFt2F+1Wyimr1XEUQLNqOQnPlAsk/PEShD5RsLee1LQ53cpaP5Sq8FcEhG18PfxU3IV6IWazBNqvwrJdIvFdOwRbeSG6UpxJftdsb1euTn/ZPxc9sK0NUAOGoSzz/bNMzpzz4n4jc+8UUAntdecS7o+xn9dAKO0SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765755655; c=relaxed/simple;
	bh=gl+a8gEY1MH8r0smdTsXPqlAoQCyLGiokxzitra78is=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j1pZTh7bjQDfhCKHn3+21K+AdRDvRRch188zUxmdTkVvktzAG5eN2q0v9ttS5m0qlOUxTBHfss9fvoz6oYwC+iOL7RxTVrVtqzhrryRNhftX2lWWzhRGutzzNWQ2wNzjRthPOWBQZ/039yhky509yl+7mtJY0pGJyuDwjJuWMEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BF+jNZeJ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BF+jNZeJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765755654; x=1797291654;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gl+a8gEY1MH8r0smdTsXPqlAoQCyLGiokxzitra78is=;
  b=BF+jNZeJGH+vLS7Wie0TZdw8l48HyMat2WgZOdQNlq30vzTEPi5iDcAT
   yGTc3tBM945MiDVMUvw4d6BYctoIQ90hU+osBmfAnrOEf8khsHc8QDTdj
   3sl850XF5byUtg93NLbdgKWFsppicJLTFzOrofsKRmlPZlcFzOVRJZ8aH
   K2/pS07oHz4AgkmKbVv6W5Gh6NpTJHX3yJWVOlS2OjVWYKu8/ay2bITeQ
   xvQZUDEkYzHc6XBjgjFoYvOYlDadYBC2LgUsXV93UkdnIkTjAgYlHFTHd
   +JvCqlcOy63gzK6+33Ku1/RneddXNCGXUeUxHGUWL4GsPiLzXF+l38vLJ
   A==;
X-CSE-ConnectionGUID: n6VWj6QgTcyaBuYHlCpRZw==
X-CSE-MsgGUID: 63EVIa7uSV+UZe4qhMKs0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="67816915"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="67816915"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 15:40:54 -0800
X-CSE-ConnectionGUID: tMzoLqK4SRuO9InJ/9iGkA==
X-CSE-MsgGUID: /qdnyQe9Sfq9as579NUe3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="202497745"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 14 Dec 2025 15:40:52 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUvhp-000000009Ur-2noU;
	Sun, 14 Dec 2025 23:40:49 +0000
Date: Mon, 15 Dec 2025 07:40:21 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 50/50]
 drivers/target/target_core_user.c:2123:6: warning: no previous prototype for
 'tcmu_ioctl_cmd_zerocopy'
Message-ID: <202512150721.OxoUPk5i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   7c285f40a964b427534f3dab33b104ee9cab6245
commit: a12a23b43065a58db184778afed42449267f5b09 [50/50] anolis: scsi: target: tcmu: Support zero copy
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251215/202512150721.OxoUPk5i-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512150721.OxoUPk5i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512150721.OxoUPk5i-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/target/target_core_user.c:2123:6: warning: no previous prototype for 'tcmu_ioctl_cmd_zerocopy' [-Wmissing-prototypes]
    2123 | long tcmu_ioctl_cmd_zerocopy(struct tcmu_dev *udev, unsigned long arg)
         |      ^~~~~~~~~~~~~~~~~~~~~~~


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
