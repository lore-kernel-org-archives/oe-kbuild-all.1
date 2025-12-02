Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD902D238D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 18:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764699528; cv=none; b=Xzmsd/M5xSvtGT2gCPl5D+xHQfRFdHDyci3yKwX2p+GJY54R8fMiNGnFhZzBQw8ppgzfrCAMFvdggEH5QT8JYx4wDOJZk8y1B7yEFOvY707AUT0HmdiRhswjw7wk/amTL24C0l8qt/Eo4Bxru0/jNwcBP/EKnIxiRUwXYGs/B8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764699528; c=relaxed/simple;
	bh=IkqvJbfLMvph2ucNVsMTeyKWOgfZ5RXqUFYpdYQ00o4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Da/KtXTR5pBWJ5uORjEG/csu9hgGfhZGv3dBsLjmYVuQdl+FZz2jwT+UB0fsgjbxkbIaBk5itVMIaakqq5TxPfn3bxnJw33mh5hmeidVYa0HYBx6Xb/vnMJ6QIHsTvS5Zt9h6buxhUWrqSJcnye442daCTkafXQ4zLzC0YA+BVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VWPVgwHR; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VWPVgwHR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764699527; x=1796235527;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IkqvJbfLMvph2ucNVsMTeyKWOgfZ5RXqUFYpdYQ00o4=;
  b=VWPVgwHRv5Isk+EU/r79MXbyJM0KVFms2V3Q1k5eD6WUQbJWHy2RcGLG
   0SYoEYYygr6MY12zPOr3JOIjAFRGRRiIUnd2PhsDcyuiOBvGAH0+hLVUA
   E/JgWtrEowbeQTkKXGOYLH2iSEVtVRT7LFFmM8JwUmY38KRZCSPuUd3gX
   Fngi71xqi/GQBoknFN4Zvgz+lxR7nDaABBGX+a/RGlxbfsSHM3zJHL2dk
   3uLU9y7UxVTuZJR+aa89Sy2b0imPu3VzxiPr3KOQyNT/GMs/R1aEMf1DS
   eT3raWu9JR+Rfp4OUVqeLoDD+OgCNZSZdS31Zc7XJN8NzyyARnGsp2rxk
   Q==;
X-CSE-ConnectionGUID: +j8gRtJmRTW++9oVeG48Mg==
X-CSE-MsgGUID: JcaS23vUQXSfsZSrFiZXzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="92159371"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="92159371"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 10:18:46 -0800
X-CSE-ConnectionGUID: FK+CWkgGS/ykj1uel/Maaw==
X-CSE-MsgGUID: peUfg5TpTbCUNelznzwglA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="194867288"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 02 Dec 2025 10:18:44 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQUxW-00000000A6M-34xw;
	Tue, 02 Dec 2025 18:18:42 +0000
Date: Wed, 3 Dec 2025 02:17:57 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-xen 6/17] drivers/virtio/virtio_msg_ffa.c:503:9:
 error: implicit declaration of function 'virtio_device_freeze'; did you mean
 'virtio_device_reset_done'?
Message-ID: <202512030231.jdoM4Nzi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-xen
head:   dfff8a85dab8eb70bb63e757fb8fbfccf7a57293
commit: 508af9651baf4ee99fcbf4ede92df95569e5cd6b [6/17] virtio-msg: Add FF-A bus transport implementation
config: arm64-randconfig-r073-20251203 (https://download.01.org/0day-ci/archive/20251203/202512030231.jdoM4Nzi-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512030231.jdoM4Nzi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512030231.jdoM4Nzi-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/virtio/virtio_msg_ffa.c: In function 'virtio_msg_ffa_suspend':
>> drivers/virtio/virtio_msg_ffa.c:503:9: error: implicit declaration of function 'virtio_device_freeze'; did you mean 'virtio_device_reset_done'? [-Werror=implicit-function-declaration]
     503 |   ret = virtio_device_freeze(&vmfdev->vmdevs[index].vmdev.vdev);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         virtio_device_reset_done
   drivers/virtio/virtio_msg_ffa.c: In function 'virtio_msg_ffa_resume':
>> drivers/virtio/virtio_msg_ffa.c:517:9: error: implicit declaration of function 'virtio_device_restore'; did you mean 'virtio_device_reset_done'? [-Werror=implicit-function-declaration]
     517 |   ret = virtio_device_restore(&vmfdev->vmdevs[i].vmdev.vdev);
         |         ^~~~~~~~~~~~~~~~~~~~~
         |         virtio_device_reset_done
   cc1: some warnings being treated as errors


vim +503 drivers/virtio/virtio_msg_ffa.c

   495	
   496	static int __maybe_unused virtio_msg_ffa_suspend(struct device *dev)
   497	{
   498		struct virtio_msg_ffa_device *vmfdev = dev_get_drvdata(dev);
   499		int ret, i, index;
   500	
   501		for (i = 0; i < vmfdev->vmdev_count; i++) {
   502			index = vmfdev->vmdev_count - i - 1;
 > 503			ret = virtio_device_freeze(&vmfdev->vmdevs[index].vmdev.vdev);
   504			if (ret)
   505				return ret;
   506		}
   507	
   508		return 0;
   509	}
   510	
   511	static int __maybe_unused virtio_msg_ffa_resume(struct device *dev)
   512	{
   513		struct virtio_msg_ffa_device *vmfdev = dev_get_drvdata(dev);
   514		int ret, i;
   515	
   516		for (i = 0; i < vmfdev->vmdev_count; i++) {
 > 517			ret = virtio_device_restore(&vmfdev->vmdevs[i].vmdev.vdev);
   518			if (ret)
   519				return ret;
   520		}
   521	
   522		return 0;
   523	}
   524	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
