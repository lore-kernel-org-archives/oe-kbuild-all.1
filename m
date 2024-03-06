Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9435B1448E1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Mar 2024 18:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709748395; cv=none; b=l4joi9algASa8FRzuMp4wpY7+V2u8PEzoVw/bqgxBJXtVgmQaKXzDHhI5g6I2h30QNB3/5JBCpIOJkygEKWNcxQvups/qM3gMLxXJIoKePgVLz6r40RUP5WR0K7IEZ2eXdVfqvRDu9Cgu77UUyw75fcQIjNPUl51nbXvbdyfMH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709748395; c=relaxed/simple;
	bh=2dHbotJ4MXX9npO0L4rc/nztm3fCeSDfUmaQmpRQBMA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=drKnuuQ82k+zw4NV67zKWudyQ1JoeRoyZ6FjGazqWDQH0/d2WiaJG2tixDE73I/v8rX9Hd45XSuQuvW9/qzhik9gQaY8zwdkLWMJdMUemmXqBGCa+H0oLv/8d88fcpXn6L5nSJ6GY3btQiYovpVlXKFs1lUm0rD06svsVVMiS4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n5P1Nq1D; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n5P1Nq1D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709748393; x=1741284393;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2dHbotJ4MXX9npO0L4rc/nztm3fCeSDfUmaQmpRQBMA=;
  b=n5P1Nq1DVy+N3vYkZcQEZLW29+SD45q8S2AEVUcRny1RVip/CsjQwlOy
   XcmjyqSSilJyGEyg4YvdO04Tgy2KdBZQy4mGcotYDniVy6MHPx+ZVwlNV
   h1VCITU5T5/R9Gppnn9KE4aIlqwHSde3FSsGM5/USYnGlc0i0uQK0z+pG
   5nixZZCXssw9uPBgd5mn7bHgGzJUNfno+UrXQFdXXKTMgP3b6oTX+FJHK
   bZdNqNl9tEGuqngnajBoaZ1QhyBR7/N98w3zNM249BCkiuSXXgEj0mO8t
   VeRwqw8idEVPjxMtuD9PiCei8Sl/5gntXuS6EiniPZCz6zcQ4vlflWYLu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4529113"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="4529113"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 10:06:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="9703838"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 06 Mar 2024 10:06:30 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhveu-0004Rr-0c;
	Wed, 06 Mar 2024 18:06:28 +0000
Date: Thu, 7 Mar 2024 02:05:58 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 20/41] include/linux/kfifo.h:740:60: error:
 'DMA_MAPPING_ERROR' undeclared
Message-ID: <202403070126.NmSMrjIc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   ae68847cb7b2931e05cac969d0920beb7f40e7dc
commit: d4b6734160ab9e6ddd141d5551ccd1098f38191b [20/41] kfifo: add kfifo_dma_out_prepare_mapped()
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240307/202403070126.NmSMrjIc-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240307/202403070126.NmSMrjIc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403070126.NmSMrjIc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from samples/kfifo/dma-example.c:10:
   samples/kfifo/dma-example.c: In function 'example_init':
>> include/linux/kfifo.h:740:60: error: 'DMA_MAPPING_ERROR' undeclared (first use in this function)
     740 |         kfifo_dma_in_prepare_mapped(fifo, sgl, nents, len, DMA_MAPPING_ERROR)
         |                                                            ^~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:735:34: note: in definition of macro 'kfifo_dma_in_prepare_mapped'
     735 |                                  dma) : \
         |                                  ^~~
   samples/kfifo/dma-example.c:63:17: note: in expansion of macro 'kfifo_dma_in_prepare'
      63 |         nents = kfifo_dma_in_prepare(&fifo, sg, ARRAY_SIZE(sg), FIFO_SIZE);
         |                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:740:60: note: each undeclared identifier is reported only once for each function it appears in
     740 |         kfifo_dma_in_prepare_mapped(fifo, sgl, nents, len, DMA_MAPPING_ERROR)
         |                                                            ^~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:735:34: note: in definition of macro 'kfifo_dma_in_prepare_mapped'
     735 |                                  dma) : \
         |                                  ^~~
   samples/kfifo/dma-example.c:63:17: note: in expansion of macro 'kfifo_dma_in_prepare'
      63 |         nents = kfifo_dma_in_prepare(&fifo, sg, ARRAY_SIZE(sg), FIFO_SIZE);
         |                 ^~~~~~~~~~~~~~~~~~~~


vim +/DMA_MAPPING_ERROR +740 include/linux/kfifo.h

   738	
   739	#define kfifo_dma_in_prepare(fifo, sgl, nents, len) \
 > 740		kfifo_dma_in_prepare_mapped(fifo, sgl, nents, len, DMA_MAPPING_ERROR)
   741	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
