Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E574729415
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Jan 2025 04:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737262076; cv=none; b=qh3XUxVohmVyyfFwdfwo6r4q/bD3b07rOIeJPpxTEkdnwmIGiA1kfVQ33vM5OLlFdDQt1R9GkCW0Pt+26yoqZVWEgR6u2A4pC71IkamnRz8hLiON97CKAxe/EfwqTuIfTSqEOiJTLjRAAb4xcmmyUIjwEHT7JnEkfG6UF0+Kda8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737262076; c=relaxed/simple;
	bh=ENLqwJrrfgvnk9Uysjp86ORTfUsFH5KTSlUm3Muh2+o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LzzbVucxJz44+yYwq/V7izoqMMFW1QKOq5j4zGWU/0YOPS6Fj3Ef0eAeT0trorxkf/iRJHpqW3NghmICGvOIXbjBNzxgIAkIK6M3XfOZf5Xe7BOa4B2hCAbY9cgS7f+CTpM5b/Cu+G64f/0YDOHRHSW61BUIIsNd82z9zf2ymCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Btoy797s; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Btoy797s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737262074; x=1768798074;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ENLqwJrrfgvnk9Uysjp86ORTfUsFH5KTSlUm3Muh2+o=;
  b=Btoy797s/rzk0wa+oodBd5pjdTN6yNc1Fg1id2VqaoovJqXnnx+t8m4B
   6KIT8FG3aF1jQYpp2fEw8qEvvqREwWSxGDM8TL1y3hrJG6arY6JRR75bG
   8+t/MJSxpj6iI91cK5N/H3Ky8EbThhQLuKG8jXntvJ1Yf2AhCKWRx7FVt
   +9e4gtaD7EWT5ik3k28oWYs5pkSPP7lgc41K6fS2YiWqRBgk8khxvVemJ
   iH9ilZEQpVNPTjviV1TisOZj0mefwA02gTNR1bVXhMMajQ2mvZ9zAXLrG
   TOUNGFSr/yK7f7rh4obzoAHzVcnp+2SqMdGSIJiL0QREjLbjasQNPPrsk
   A==;
X-CSE-ConnectionGUID: cLe3YG6/SX69RmvTEJwR8Q==
X-CSE-MsgGUID: gBPFy0XTSiWirUDdePXsfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="36927904"
X-IronPort-AV: E=Sophos;i="6.13,216,1732608000"; 
   d="scan'208";a="36927904"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 20:47:53 -0800
X-CSE-ConnectionGUID: kr5KolyLRNu3FTCaIGEv6A==
X-CSE-MsgGUID: X3iZY8mOR46Ns/mDBArNCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,216,1732608000"; 
   d="scan'208";a="106715085"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Jan 2025 20:47:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZNDv-000V6x-3C;
	Sun, 19 Jan 2025 04:47:47 +0000
Date: Sun, 19 Jan 2025 12:47:20 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	lin.x.wang@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 2441/2441]
 drivers/iommu/intel/debugfs.c:591:13: error: implicit declaration of
 function 'copy_from_user'; did you mean 'copy_from_user_page'?
Message-ID: <202501191234.OsnJf3br-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   f1811f6442501fe34d2339158aed4f85a64f0398
commit: c673edd0f89b25f0f785bc1a4216604a45679d3d [2441/2441] x86/pkru: Remove useless include
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250119/202501191234.OsnJf3br-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250119/202501191234.OsnJf3br-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501191234.OsnJf3br-lkp@intel.com/

Note: the opencloudos/linux-5.4/lts/5.4.119-20.0009.spr HEAD f1811f6442501fe34d2339158aed4f85a64f0398 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:6,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:12,
                    from arch/x86/include/asm/preempt.h:7,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:51,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/debugfs.h:15,
                    from drivers/iommu/intel/debugfs.c:11:
   include/linux/instrumentation.h:8: warning: "instrumentation_begin" redefined
       8 | #define instrumentation_begin() ({                                      \
         | 
   In file included from include/linux/export.h:42,
                    from include/linux/linkage.h:7,
                    from include/linux/fs.h:5:
   include/linux/compiler.h:139: note: this is the location of the previous definition
     139 | #define instrumentation_begin() ({                                      \
         | 
   drivers/iommu/intel/debugfs.c: In function 'dmar_perf_latency_write':
>> drivers/iommu/intel/debugfs.c:591:13: error: implicit declaration of function 'copy_from_user'; did you mean 'copy_from_user_page'? [-Werror=implicit-function-declaration]
     591 |         if (copy_from_user(&buf, ubuf, cnt))
         |             ^~~~~~~~~~~~~~
         |             copy_from_user_page
   cc1: some warnings being treated as errors


vim +591 drivers/iommu/intel/debugfs.c

c4a45045c239ac Lu Baolu 2021-06-10  578  
c4a45045c239ac Lu Baolu 2021-06-10  579  static ssize_t dmar_perf_latency_write(struct file *filp,
c4a45045c239ac Lu Baolu 2021-06-10  580  				       const char __user *ubuf,
c4a45045c239ac Lu Baolu 2021-06-10  581  				       size_t cnt, loff_t *ppos)
c4a45045c239ac Lu Baolu 2021-06-10  582  {
c4a45045c239ac Lu Baolu 2021-06-10  583  	struct dmar_drhd_unit *drhd;
c4a45045c239ac Lu Baolu 2021-06-10  584  	struct intel_iommu *iommu;
c4a45045c239ac Lu Baolu 2021-06-10  585  	int counting;
c4a45045c239ac Lu Baolu 2021-06-10  586  	char buf[64];
c4a45045c239ac Lu Baolu 2021-06-10  587  
c4a45045c239ac Lu Baolu 2021-06-10  588  	if (cnt > 63)
c4a45045c239ac Lu Baolu 2021-06-10  589  		cnt = 63;
c4a45045c239ac Lu Baolu 2021-06-10  590  
c4a45045c239ac Lu Baolu 2021-06-10 @591  	if (copy_from_user(&buf, ubuf, cnt))
c4a45045c239ac Lu Baolu 2021-06-10  592  		return -EFAULT;
c4a45045c239ac Lu Baolu 2021-06-10  593  
c4a45045c239ac Lu Baolu 2021-06-10  594  	buf[cnt] = 0;
c4a45045c239ac Lu Baolu 2021-06-10  595  
c4a45045c239ac Lu Baolu 2021-06-10  596  	if (kstrtoint(buf, 0, &counting))
c4a45045c239ac Lu Baolu 2021-06-10  597  		return -EINVAL;
c4a45045c239ac Lu Baolu 2021-06-10  598  
c4a45045c239ac Lu Baolu 2021-06-10  599  	switch (counting) {
c4a45045c239ac Lu Baolu 2021-06-10  600  	case 0:
c4a45045c239ac Lu Baolu 2021-06-10  601  		rcu_read_lock();
c4a45045c239ac Lu Baolu 2021-06-10  602  		for_each_active_iommu(iommu, drhd) {
c4a45045c239ac Lu Baolu 2021-06-10  603  			dmar_latency_disable(iommu, DMAR_LATENCY_INV_IOTLB);
c4a45045c239ac Lu Baolu 2021-06-10  604  			dmar_latency_disable(iommu, DMAR_LATENCY_INV_DEVTLB);
c4a45045c239ac Lu Baolu 2021-06-10  605  			dmar_latency_disable(iommu, DMAR_LATENCY_INV_IEC);
c4a45045c239ac Lu Baolu 2021-06-10  606  			dmar_latency_disable(iommu, DMAR_LATENCY_PRQ);
c4a45045c239ac Lu Baolu 2021-06-10  607  		}
c4a45045c239ac Lu Baolu 2021-06-10  608  		rcu_read_unlock();
c4a45045c239ac Lu Baolu 2021-06-10  609  		break;
c4a45045c239ac Lu Baolu 2021-06-10  610  	case 1:
c4a45045c239ac Lu Baolu 2021-06-10  611  		rcu_read_lock();
c4a45045c239ac Lu Baolu 2021-06-10  612  		for_each_active_iommu(iommu, drhd)
c4a45045c239ac Lu Baolu 2021-06-10  613  			dmar_latency_enable(iommu, DMAR_LATENCY_INV_IOTLB);
c4a45045c239ac Lu Baolu 2021-06-10  614  		rcu_read_unlock();
c4a45045c239ac Lu Baolu 2021-06-10  615  		break;
c4a45045c239ac Lu Baolu 2021-06-10  616  	case 2:
c4a45045c239ac Lu Baolu 2021-06-10  617  		rcu_read_lock();
c4a45045c239ac Lu Baolu 2021-06-10  618  		for_each_active_iommu(iommu, drhd)
c4a45045c239ac Lu Baolu 2021-06-10  619  			dmar_latency_enable(iommu, DMAR_LATENCY_INV_DEVTLB);
c4a45045c239ac Lu Baolu 2021-06-10  620  		rcu_read_unlock();
c4a45045c239ac Lu Baolu 2021-06-10  621  		break;
c4a45045c239ac Lu Baolu 2021-06-10  622  	case 3:
c4a45045c239ac Lu Baolu 2021-06-10  623  		rcu_read_lock();
c4a45045c239ac Lu Baolu 2021-06-10  624  		for_each_active_iommu(iommu, drhd)
c4a45045c239ac Lu Baolu 2021-06-10  625  			dmar_latency_enable(iommu, DMAR_LATENCY_INV_IEC);
c4a45045c239ac Lu Baolu 2021-06-10  626  		rcu_read_unlock();
c4a45045c239ac Lu Baolu 2021-06-10  627  		break;
c4a45045c239ac Lu Baolu 2021-06-10  628  	case 4:
c4a45045c239ac Lu Baolu 2021-06-10  629  		rcu_read_lock();
c4a45045c239ac Lu Baolu 2021-06-10  630  		for_each_active_iommu(iommu, drhd)
c4a45045c239ac Lu Baolu 2021-06-10  631  			dmar_latency_enable(iommu, DMAR_LATENCY_PRQ);
c4a45045c239ac Lu Baolu 2021-06-10  632  		rcu_read_unlock();
c4a45045c239ac Lu Baolu 2021-06-10  633  		break;
c4a45045c239ac Lu Baolu 2021-06-10  634  	default:
c4a45045c239ac Lu Baolu 2021-06-10  635  		return -EINVAL;
c4a45045c239ac Lu Baolu 2021-06-10  636  	}
c4a45045c239ac Lu Baolu 2021-06-10  637  
c4a45045c239ac Lu Baolu 2021-06-10  638  	*ppos += cnt;
c4a45045c239ac Lu Baolu 2021-06-10  639  	return cnt;
c4a45045c239ac Lu Baolu 2021-06-10  640  }
c4a45045c239ac Lu Baolu 2021-06-10  641  

:::::: The code at line 591 was first introduced by commit
:::::: c4a45045c239acae7673408f03e3a9cd67dbfc48 iommu/vt-d: Expose latency monitor data through debugfs

:::::: TO: Lu Baolu <baolu.lu@linux.intel.com>
:::::: CC: Jianping Liu <frankjpliu@tencent.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
