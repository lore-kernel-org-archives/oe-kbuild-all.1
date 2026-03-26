Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9C5340DB8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Mar 2026 06:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774506083; cv=none; b=Ln1vfbQeaqTvhBwGJD609sqvV1KyVk2/PicSdT1I357F3muHukZvQTiZzQ7Xtl7ZOZlpX1MfeoEQiUSAQ+VjLeNRPZUyh3OLO0jnoNgPes7kQPqGSGq2yKv5tldpb3q38E1rCoEVp/00pNQd/eC3E7KtRXmSKBUsqSyByD6vKXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774506083; c=relaxed/simple;
	bh=Xdb7E5gJeERKWgGbYqtsiDImH9FW2G88gGlh5UFc+xk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=okCUAEp+Hs2Dq2oxJW/egKQahzywON7iaPuIMsQ0KzSGEWU+6FYi0LsDB09JT+NGwZ0nwF8VN7MaczwP2rOLW4Gov5sCN1SeUyuiQtDDRLuF/hWhdhApdL7sSUmp9G0lCf15Ovx6PwFW4x4mfWB9UUrIMUDK/mlzz8BD+Zpn/ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O8dLN1DG; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O8dLN1DG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774506082; x=1806042082;
  h=date:from:to:cc:subject:message-id;
  bh=Xdb7E5gJeERKWgGbYqtsiDImH9FW2G88gGlh5UFc+xk=;
  b=O8dLN1DGR3AaZlpXdyuF/ipdAr+exMAJbn8iDQJydWg7WYIibR3j9EC1
   fc+bi+Ok+Sd0Iht8du6x+S052nMBTWAGDWCwJ6PYt1gTboZf/SWWO8YBO
   LFGuSUyQlXuVr5GhJg5es/Dupd38aHj7Ftizk/XhimnRJDPhvTk73VOlT
   C4Y/j0mToy26OMooysjiqvVUHfaGc7KZa1wbdmC4ItDApQ/N1Ewf8U5gM
   iFnrbKf6N88pnOcMfdt7+mQ908sA5AQP0Uebi8tEZ4dy7kC0HU7jjyFCw
   y0qYjKsDeLVulJlJcNHx6Qk84WT4Mhs56uE7vRbgk6B/teV9I/YlBZ0vK
   Q==;
X-CSE-ConnectionGUID: ozlhVg9GQoedJ6pyIO9a3w==
X-CSE-MsgGUID: D3XgsVVvS7GiEILMx0+13A==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75439394"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="75439394"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 23:21:20 -0700
X-CSE-ConnectionGUID: cD0IKNt8Rd+Cw80E3FWgVA==
X-CSE-MsgGUID: 1cTkfxE+SxyZsSAC4yfBkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="229366597"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 25 Mar 2026 23:21:19 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5e5j-000000008Kr-3LDQ;
	Thu, 26 Mar 2026 06:21:15 +0000
Date: Thu, 26 Mar 2026 14:20:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 15/26] fs/nfsd/filecache.c:778:undefined
 reference to `nfsd_handle_dir_event'
Message-ID: <202603261431.yhKRJxUv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   996759a25534ab4a7e986fe0153659e93c1611ec
commit: 0f5a8e88ca922de5284bcbf63b64b120b5a58947 [15/26] nfsd: add notification handlers for dir events
config: arm-keystone_defconfig (https://download.01.org/0day-ci/archive/20260326/202603261431.yhKRJxUv-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603261431.yhKRJxUv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603261431.yhKRJxUv-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: fs/nfsd/filecache.o: in function `nfsd_dir_fsnotify_handle_event':
>> fs/nfsd/filecache.c:778:(.text+0x110): undefined reference to `nfsd_handle_dir_event'


vim +778 fs/nfsd/filecache.c

   771	
   772	static int
   773	nfsd_dir_fsnotify_handle_event(struct fsnotify_group *group, u32 mask,
   774				       const void *data, int data_type, struct inode *dir,
   775				       const struct qstr *name, u32 cookie,
   776				       struct fsnotify_iter_info *iter_info)
   777	{
 > 778		return nfsd_handle_dir_event(mask, dir, data, data_type, name);
   779	}
   780	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
