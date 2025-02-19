Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C447223C393
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Feb 2025 20:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739997905; cv=none; b=dfILv734w0FCHYeh5l9GKVkJO0s4uAPCY5g/hY/5cioSIbXUo9NCrd8KAmIWrCBESSEmz3yqKSS+couQDDf6vncrGjWhCc9ibPttY7BhGrk2wWOWDybHVGkp92Gkt3IJ8+27qyjmBAG0XrOXhJLTlymQrVsxSus+Y5U7hMILCF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739997905; c=relaxed/simple;
	bh=dq4e9m6PdOExZSwIjs79M+yCDpLOLRm+I4LV6boAyXI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TRIFt36ToeekcNjsE5h+ivG86OyVCC2ZcLHWy6PANFEnoV1ZO5bhJnz3A3WhXMWm73Ih3zi3dve6Y3S8hnMWUQxRwTKSzLRZwCNi6BypxUCdEnWCw+rle3s98TYKH2h85rq76IngzqtBBdIeHOQQ+lmmpegBJF93lEbtKTMeUi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f1qY9d1n; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f1qY9d1n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739997903; x=1771533903;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dq4e9m6PdOExZSwIjs79M+yCDpLOLRm+I4LV6boAyXI=;
  b=f1qY9d1n+xLsuj6MV/BKv+vyNBnIQRi3SuDUqZG9+RTiq2lMcFgGOESc
   QXJhvKeIrlduY9Y33JX3v8eWSj/ApzK36DtakT/sN+1LILAzQYBk/uPMP
   ylQfivYCBbKYy0/XQkOXmI4NRp3zOTkHW6U+JywA0sZHIcXYyTgK/VXmA
   Y9SIzdPBCyn07ZuMCtIqRc9aLdBiyUy4sucZlYK7+5DZ4s/YV1qPc+Oqg
   8OU+lhvwRG/epTOXW0KQUQ9oy/j8xaXkHDzr9y3YZePiUanFQ+x/U2sEJ
   z6gCTyrx8a4qsaN1KF4UtFCwlGLCYD1C0gSEHqMUkPkYhZxTSxfTUvLRi
   Q==;
X-CSE-ConnectionGUID: EviWVIFFTJSaUmhsdezU6Q==
X-CSE-MsgGUID: /u9U34VSRbOpydhcX04GIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="51372137"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; 
   d="scan'208";a="51372137"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 12:45:02 -0800
X-CSE-ConnectionGUID: WcjlHBj8SYy8hGceEuo3Zg==
X-CSE-MsgGUID: YcJtKu4+RfuKW34uiJ9TVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; 
   d="scan'208";a="145667013"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 19 Feb 2025 12:45:00 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkqw8-0003SR-17;
	Wed, 19 Feb 2025 20:44:53 +0000
Date: Thu, 20 Feb 2025 04:44:29 +0800
From: kernel test robot <lkp@intel.com>
To: "Kim, Dongwon" <dongwon.kim@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	"Matuesz, Polrola" <mateuszx.potrola@intel.com>
Subject: [intel-lts:pr/59 1/1]
 drivers/dma-buf/hyper_dmabuf/hyper_dmabuf_ops.c:109:6: warning: variable
 'ret' set but not used
Message-ID: <202502200446.GRUPOcUM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/59
head:   19ae9bc73680fd6c1c95edb5b7e2aaa790e7f011
commit: 94c6728a425eabc9a9048abde83e6d3fcf3055cf [1/1] REVERTME [IOTG]: hyper_dmabuf: Introducing the hyper_dmabuf driver
config: sparc64-randconfig-002-20250218 (https://download.01.org/0day-ci/archive/20250220/202502200446.GRUPOcUM-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250220/202502200446.GRUPOcUM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502200446.GRUPOcUM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dma-buf/hyper_dmabuf/hyper_dmabuf_ops.c: In function 'hyper_dmabuf_ops_detach':
>> drivers/dma-buf/hyper_dmabuf/hyper_dmabuf_ops.c:109:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     int ret;
         ^~~
   drivers/dma-buf/hyper_dmabuf/hyper_dmabuf_ops.c: In function 'hyper_dmabuf_ops_map':
   drivers/dma-buf/hyper_dmabuf/hyper_dmabuf_ops.c:126:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     int ret;
         ^~~
   drivers/dma-buf/hyper_dmabuf/hyper_dmabuf_ops.c: In function 'hyper_dmabuf_ops_unmap':
   drivers/dma-buf/hyper_dmabuf/hyper_dmabuf_ops.c:172:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     int ret;
         ^~~
   drivers/dma-buf/hyper_dmabuf/hyper_dmabuf_ops.c: In function 'hyper_dmabuf_ops_release':
   drivers/dma-buf/hyper_dmabuf/hyper_dmabuf_ops.c:191:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     int ret;
         ^~~
   drivers/dma-buf/hyper_dmabuf/hyper_dmabuf_ops.c: In function 'hyper_dmabuf_ops_end_cpu_access':
   drivers/dma-buf/hyper_dmabuf/hyper_dmabuf_ops.c:252:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     int ret;
         ^~~
   drivers/dma-buf/hyper_dmabuf/hyper_dmabuf_ops.c: In function 'hyper_dmabuf_ops_kmap_atomic':
   drivers/dma-buf/hyper_dmabuf/hyper_dmabuf_ops.c:268:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     int ret;
         ^~~
   drivers/dma-buf/hyper_dmabuf/hyper_dmabuf_ops.c: In function 'hyper_dmabuf_ops_kunmap_atomic':
   drivers/dma-buf/hyper_dmabuf/hyper_dmabuf_ops.c:285:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     int ret;
         ^~~
   drivers/dma-buf/hyper_dmabuf/hyper_dmabuf_ops.c: In function 'hyper_dmabuf_ops_kmap':
   drivers/dma-buf/hyper_dmabuf/hyper_dmabuf_ops.c:298:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     int ret;
         ^~~
   drivers/dma-buf/hyper_dmabuf/hyper_dmabuf_ops.c: In function 'hyper_dmabuf_ops_kunmap':
   drivers/dma-buf/hyper_dmabuf/hyper_dmabuf_ops.c:315:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     int ret;
         ^~~
   drivers/dma-buf/hyper_dmabuf/hyper_dmabuf_ops.c: In function 'hyper_dmabuf_ops_vmap':
   drivers/dma-buf/hyper_dmabuf/hyper_dmabuf_ops.c:344:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     int ret;
         ^~~
   drivers/dma-buf/hyper_dmabuf/hyper_dmabuf_ops.c: In function 'hyper_dmabuf_ops_vunmap':
   drivers/dma-buf/hyper_dmabuf/hyper_dmabuf_ops.c:359:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     int ret;
         ^~~
--
   drivers/dma-buf/hyper_dmabuf/hyper_dmabuf_msg.c: In function 'cmd_process_work':
>> drivers/dma-buf/hyper_dmabuf/hyper_dmabuf_msg.c:127:6: warning: variable 'domid' set but not used [-Wunused-but-set-variable]
     int domid;
         ^~~~~


vim +/ret +109 drivers/dma-buf/hyper_dmabuf/hyper_dmabuf_ops.c

   104	
   105	static void hyper_dmabuf_ops_detach(struct dma_buf *dmabuf,
   106					    struct dma_buf_attachment *attach)
   107	{
   108		struct imported_sgt_info *imported;
 > 109		int ret;
   110	
   111		if (!attach->dmabuf->priv)
   112			return;
   113	
   114		imported = (struct imported_sgt_info *)attach->dmabuf->priv;
   115	
   116		ret = sync_request(imported->hid, HYPER_DMABUF_OPS_DETACH);
   117	}
   118	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
