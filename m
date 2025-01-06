Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E21A1DD0DC
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 13:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736169539; cv=none; b=lqJ1pj6MhSRvLXUqsT9EMqqbhWTUjSYbtmcVog5n40IXp42INDul98pdLU2HZokXujGyj5+dFenLNd2TiKc9iX/PkPfYaa5tkGhoADGWWiP22O7p/UoKlfkXkNzyodcE7iNmCVCiiyd79oXK519bTiZGsiWt4+hrN1VJybTsnlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736169539; c=relaxed/simple;
	bh=fNWTmvyy2221dBcANAJ0xx9GgueiVW5HZCmMo0NGDSI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XDDl5gkX9SQq1BCJ2/goenCR0K+SuZ/ReJkX0p1a8tm1XnjX1XTSVJajGKYugdATxtv+SNSYmh5mTrSNWr01NJTsjl+aLlbv3yzDzKn4xenkjeHO35acannsA1HTbnQOUaAirNBOnSGqwfUkf6JqTl3I4YSjGJ6QkxD03r+bcXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eXHiNNSe; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eXHiNNSe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736169538; x=1767705538;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fNWTmvyy2221dBcANAJ0xx9GgueiVW5HZCmMo0NGDSI=;
  b=eXHiNNSefdWZJGl/Yy7MIHjS753/Z6Uw8q5y2+vU3LNJA4H9Q15eHgW6
   Rup9X/Az5erjA3Sq+SGlcJw12VCkKAr3H7c1eTifEEmU74DDiZ1VPT6fx
   Mk9h0vqD3hs4NaqLcxRb7AT5FGltxW9cXESsglqWyLG9gg+VuWBIM52AO
   vWz8nJ2L+7wXuP3Mf4KF59TYqU3T5k2ZIwgPX46xhiA/8Ff2jnhCP0RcC
   BmrsUTCwCn6m6EZh3LyKZ3u+KhnJSICvyvuDPtv3L5IHLaWIfFF8dIgeF
   hpir+VdDsX8WZaVHpM/r9hxoEXcfnxAk8jyl8sQ7ZsLCApn7KUxC9c0Om
   w==;
X-CSE-ConnectionGUID: jVkQiPoITnSqtus7p0qE4w==
X-CSE-MsgGUID: F6bQT1TGTjS3CeDIhvy/eQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="36475034"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="36475034"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 05:18:57 -0800
X-CSE-ConnectionGUID: kC3YcrChSOuwySCu+jHerQ==
X-CSE-MsgGUID: G0rJITgMSHafy4thmKV30Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="102959407"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 06 Jan 2025 05:18:56 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUn0P-000Ce3-1L;
	Mon, 06 Jan 2025 13:18:53 +0000
Date: Mon, 6 Jan 2025 21:18:27 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 17942/25291] include/linux/dma-buf.h:674:13:
 warning: 'is_dma_buf_pages_file' defined but not used
Message-ID: <202501062134.KsFhXawU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   272d9bd3d7e15bb1ad1efac12d9921350f961339
commit: 1c695af68d78558bc947ef97a6e722432de2916d [17942/25291] net: add netdev_rxq_alloc_page and skb->devmem
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250106/202501062134.KsFhXawU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250106/202501062134.KsFhXawU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501062134.KsFhXawU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/netdevice.h:51,
                    from include/net/sock.h:46,
                    from lib/kobject_uevent.c:28:
>> include/linux/dma-buf.h:674:13: warning: 'is_dma_buf_pages_file' defined but not used [-Wunused-function]
     674 | static bool is_dma_buf_pages_file(struct file *file)
         |             ^~~~~~~~~~~~~~~~~~~~~
--
   lib/vsprintf.c: In function 'va_format':
   lib/vsprintf.c:1713:9: warning: function 'va_format' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1713 |         buf += vsnprintf(buf, end > buf ? end - buf : 0, va_fmt->fmt, va);
         |         ^~~
   In file included from include/linux/netdevice.h:51,
                    from include/net/sock.h:46,
                    from include/linux/tcp.h:19,
                    from include/linux/ipv6.h:91,
                    from include/net/addrconf.h:52,
                    from lib/vsprintf.c:40:
   include/linux/dma-buf.h: At top level:
>> include/linux/dma-buf.h:674:13: warning: 'is_dma_buf_pages_file' defined but not used [-Wunused-function]
     674 | static bool is_dma_buf_pages_file(struct file *file)
         |             ^~~~~~~~~~~~~~~~~~~~~


vim +/is_dma_buf_pages_file +674 include/linux/dma-buf.h

515f6947829b16 Mina Almasry 2023-05-24  673  
515f6947829b16 Mina Almasry 2023-05-24 @674  static bool is_dma_buf_pages_file(struct file *file)
515f6947829b16 Mina Almasry 2023-05-24  675  {
515f6947829b16 Mina Almasry 2023-05-24  676  	return false;
515f6947829b16 Mina Almasry 2023-05-24  677  }
515f6947829b16 Mina Almasry 2023-05-24  678  #endif
515f6947829b16 Mina Almasry 2023-05-24  679  

:::::: The code at line 674 was first introduced by commit
:::::: 515f6947829b1645b8bb22dae8555631f0c708e1 dma-buf: create struct pages backing a dma-buf

:::::: TO: Mina Almasry <almasrymina@google.com>
:::::: CC: root <root@bytedance.localdomain>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
