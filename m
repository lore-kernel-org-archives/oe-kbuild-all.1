Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF99DF43
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Mar 2024 05:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710478980; cv=none; b=b8+HRABF4CBQQfQ2xsXOutB9c4pxUBaMzRpFYqNFj+LllR0nHPdR3a7+PtN4WSbDjaXZM2nPn7GLiVr9ZpNa71+yxsCWZ+Z9QrVpo1epKfXudk+unD3pok4zZhVz8dPlemS+wXYnDyN0AiwrBaxrsXE1OC4t6TPMfrTpIrL3M5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710478980; c=relaxed/simple;
	bh=Gi51KnxU0P7CWa/j2M5+Q0AnT+82RFOI244nCITTTNo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BqfdrV0K/ItElWi3/GKFT9pngPE9LDNybyiJHc+PL6GLw2J9NmUj1ZP0DZrfzSWuBat0hnPLv3dyfCKtwTTUKjgG490T/HJ2AHK3m1CfKU49CaAy04uWTKoPbZGf0ySUaavpl3ZnwhE/zBhwn2G7WE2fUtvCH9CmL168wzGX1TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fBsEToLD; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fBsEToLD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710478978; x=1742014978;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gi51KnxU0P7CWa/j2M5+Q0AnT+82RFOI244nCITTTNo=;
  b=fBsEToLDeyhQbZk2+W0Cuf6bqUOOEMdK4Rok+A9lGTrWLmG2qKmEv3UE
   Olgda9KMISvfn9R+H+0BRfkisBUqM517GbRgoLEi85eXm37br0GEGemC8
   Irnu9Ptjc/ovjwyoJZmdvTehUQEeRkbeaEfgK1WsRz/OfeStHQCFKNSD6
   rP1iuATC+WpMZUB8g5u87boK418ZzJu/ldBwTfpZDQ+i0K/1Lh70cg+6C
   3jXwsaQ7bTevqGhbCEjTgPB/IjX5O2KSy89689GRbHH/YbrEqp5IqM+Cl
   YGVm4q2P69JxKrZPX69NVzzOEbcC8KHch7g6j9X8GEVBwKi9sGnYMI3aC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5935603"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="5935603"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 22:02:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="12505969"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Mar 2024 22:02:56 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkziY-000E7p-1Z;
	Fri, 15 Mar 2024 05:02:54 +0000
Date: Fri, 15 Mar 2024 13:02:44 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, fanyizhen1995 <en_0015767@163.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 24723/30000]
 drivers/ub/urma/ubcore/ubcore_umem.c:227:21: warning: no previous prototype
 for 'ubcore_umem_get'
Message-ID: <202403151200.4Ra2tgj2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   32bb7b0a7c87769858fbb9d60574b830383c28f7
commit: f6206cf05e28a7f455850a4e2de8162890f50073 [24723/30000] ub: add memory map api in ubcore
config: arm64-randconfig-003-20240312 (https://download.01.org/0day-ci/archive/20240315/202403151200.4Ra2tgj2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240315/202403151200.4Ra2tgj2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403151200.4Ra2tgj2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/urma/ubcore/ubcore_umem.c:227:21: warning: no previous prototype for 'ubcore_umem_get' [-Wmissing-prototypes]
     227 | struct ubcore_umem *ubcore_umem_get(struct ubcore_device *dev, uint64_t va, uint64_t len,
         |                     ^~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_umem.c:245:6: warning: no previous prototype for 'ubcore_umem_release' [-Wmissing-prototypes]
     245 | void ubcore_umem_release(struct ubcore_umem *umem)
         |      ^~~~~~~~~~~~~~~~~~~


vim +/ubcore_umem_get +227 drivers/ub/urma/ubcore/ubcore_umem.c

   226	
 > 227	struct ubcore_umem *ubcore_umem_get(struct ubcore_device *dev, uint64_t va, uint64_t len,
   228					    union ubcore_umem_flag flag)
   229	{
   230		struct page **page_list;
   231		int ret;
   232	
   233		ret = umem_verify_input(dev, va, len, flag);
   234		if (ret < 0)
   235			return ERR_PTR(ret);
   236	
   237		page_list = (struct page **)__get_free_page(GFP_KERNEL);
   238		if (page_list == 0)
   239			return ERR_PTR(-ENOMEM);
   240	
   241		return ubcore_get_target_umem(dev, va, len, flag, page_list);
   242	}
   243	EXPORT_SYMBOL(ubcore_umem_get);
   244	
 > 245	void ubcore_umem_release(struct ubcore_umem *umem)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
