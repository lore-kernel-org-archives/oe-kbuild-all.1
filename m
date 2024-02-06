Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33925676F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Feb 2024 02:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707184975; cv=none; b=p697MmYO8KKH50SdmoHBW8BRV+HPVv63KY0ZHgW6qcNMNDn5VjqnQUnA4swj4iSo49tyrG45e1mfP3FJAAG5z7TrVE0V0hWfAcwyKN5B9bTYvXGepbuW6umlHH4OGLTbmS/oFt6iClZ+67QA1AcZUCcMO2aKCkoufe73rl5DZWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707184975; c=relaxed/simple;
	bh=vt4BS6KouWEfSXWrYYea7MMh90TfLXpCSfGQWS57l9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TTe/ke0W6crK3MtUyUYPaFFgFPKmT7UGFnsRtZB0i2/t4yRkXKeZNGXZRkMKYkVt/0LZf6OBbl5ScEqGvYIe+hEYyjKYDKN3rHQqXzuDvjB8AsEADh2k1K1X7n1CtBg331oyGoAeuAIiTT9DPEs7G740PwzTMagQdyYKoZcmlis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lIl3M2Jz; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lIl3M2Jz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707184974; x=1738720974;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vt4BS6KouWEfSXWrYYea7MMh90TfLXpCSfGQWS57l9Y=;
  b=lIl3M2JzgIdbRay7mreFq2r8hdQmaVVItGnzX2gJA/2pJ6NfxtT7rZXT
   DBRYsPPR740/knQJcObRK6TME/nKW4wxOY+GmRReIPqRK1tjioITZiVFr
   Ts4ydiZYH5IUQVIE8DxYRBkjqHUjZIRLGaxYjNxiPLQX6uz+173LMWOsp
   lJdEIcf8y+AEbgNz8OiQq71hwxttnXuut9XeDW1srvOyR+Aed0SzMRisV
   DmV9GXgXm1YeYy51mfxF1cgTXFoLTZJRP8DN+dpZxVYB9uL9lI4DoaJjv
   IMRoLIlZEXr1wVF7f6k//JSY/cnwevQo1LeCAX6RX0ONZ4IG4K7pdDIYD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="4526583"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="4526583"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 18:02:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="1193014"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 05 Feb 2024 18:02:49 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXAnN-0000zk-1u;
	Tue, 06 Feb 2024 02:02:45 +0000
Date: Tue, 6 Feb 2024 10:01:50 +0800
From: kernel test robot <lkp@intel.com>
To: Shuo Liu <shuo.a.liu@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	Zhao Yakui <yakui.zhao@intel.com>, Yu Wang <yu1.wang@intel.com>
Subject: [intel-lts:4.19/android_s 2642/30000] drivers/vhm/vhm_irqfd.c:312:5:
 error: no previous prototype for function 'acrn_irqfd'
Message-ID: <202402060943.WNEOtbMh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   f2b228e8331cfde18e95b9fdeb61f16ae51d0c48
commit: ec90f0f653aaf764352919b6be231e81489b2a28 [2642/30000] vhm: add irqfd support for ACRN hypervisor service module
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20240206/202402060943.WNEOtbMh-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240206/202402060943.WNEOtbMh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402060943.WNEOtbMh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/vhm/vhm_irqfd.c:312:5: error: no previous prototype for function 'acrn_irqfd' [-Werror,-Wmissing-prototypes]
     312 | int acrn_irqfd(uint16_t vmid, struct acrn_irqfd *args)
         |     ^
   drivers/vhm/vhm_irqfd.c:312:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     312 | int acrn_irqfd(uint16_t vmid, struct acrn_irqfd *args)
         | ^
         | static 
>> drivers/vhm/vhm_irqfd.c:330:5: error: no previous prototype for function 'acrn_irqfd_init' [-Werror,-Wmissing-prototypes]
     330 | int acrn_irqfd_init(uint16_t vmid)
         |     ^
   drivers/vhm/vhm_irqfd.c:330:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     330 | int acrn_irqfd_init(uint16_t vmid)
         | ^
         | static 
>> drivers/vhm/vhm_irqfd.c:362:6: error: no previous prototype for function 'acrn_irqfd_deinit' [-Werror,-Wmissing-prototypes]
     362 | void acrn_irqfd_deinit(uint16_t vmid)
         |      ^
   drivers/vhm/vhm_irqfd.c:362:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     362 | void acrn_irqfd_deinit(uint16_t vmid)
         | ^
         | static 
   3 errors generated.


vim +/acrn_irqfd +312 drivers/vhm/vhm_irqfd.c

   311	
 > 312	int acrn_irqfd(uint16_t vmid, struct acrn_irqfd *args)
   313	{
   314		struct vhm_irqfd_info *info;
   315		int ret;
   316	
   317		info = get_irqfd_info_by_vm(vmid);
   318		if (!info)
   319			return -ENOENT;
   320	
   321		if (args->flags & ACRN_IRQFD_FLAG_DEASSIGN)
   322			ret = acrn_irqfd_deassign(info, args);
   323		else
   324			ret = acrn_irqfd_assign(info, args);
   325	
   326		put_irqfd_info(info);
   327		return ret;
   328	}
   329	
 > 330	int acrn_irqfd_init(uint16_t vmid)
   331	{
   332		struct vhm_irqfd_info *info;
   333	
   334		info = get_irqfd_info_by_vm(vmid);
   335		if (info) {
   336			put_irqfd_info(info);
   337			return -EEXIST;
   338		}
   339	
   340		info = kzalloc(sizeof(struct vhm_irqfd_info), GFP_KERNEL);
   341		if (!info)
   342			return -ENOMEM;
   343		info->vmid = vmid;
   344		info->refcnt = 1;
   345		INIT_LIST_HEAD(&info->irqfds);
   346		spin_lock_init(&info->irqfds_lock);
   347	
   348		info->wq = alloc_workqueue("acrn_irqfd-%d", 0, 0, vmid);
   349		if (!info->wq) {
   350			kfree(info);
   351			return -ENOMEM;
   352		}
   353	
   354		mutex_lock(&vhm_irqfds_mutex);
   355		list_add(&info->list, &vhm_irqfd_clients);
   356		mutex_unlock(&vhm_irqfds_mutex);
   357	
   358		pr_info("ACRN vhm irqfd init done!\n");
   359		return 0;
   360	}
   361	
 > 362	void acrn_irqfd_deinit(uint16_t vmid)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
