Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D6E1917D0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Mar 2025 09:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741253792; cv=none; b=M/EZw4u1GnqwMS1uXC0oJf0c7Dx6Di5TmFCEP+WB7YbF0Fus39S5xEfZPXnwGHCE4rx6WLjMOniHjIOqroVCTQqnstRH8R/R2RzkY/pmCy/+y/psspse1ck5jvLlQ4Rr6es1WOIgN9uJOeOFRbsjHFHZWKiIRRV5GzDD7kiPRDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741253792; c=relaxed/simple;
	bh=uMcWJXnwgnYSsVinZD/hjaB8UQYCVwUpP9ZVUIKkIY4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YpAhZI1OrCYfDgybUeGGZIZft7bebn83SqXOhdTvzcQ5xG0jD0FUQ6O9ZbZopDjh5o+htlrsf+R9FzIGkomRMD9gPJIlDEhffPCxfBRt93XD+/f72INvxmWrLKnP1zr39Rmu8nMSE/jvtriTY0ZSijHYxOoHh/UqXNXS1LMOhJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tso9imYy; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tso9imYy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741253790; x=1772789790;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uMcWJXnwgnYSsVinZD/hjaB8UQYCVwUpP9ZVUIKkIY4=;
  b=Tso9imYyCoinRqhkm2B75cENWWJwB78fZ/X2KaY3jgGlHRwpsNop9KG0
   itwod1EY1sidty3C+rAS5TBHb9UEsnSh7WFOUQ65Uei8OEjXIDAWTYxRb
   2L7bzw6DNArtoArISKJGmULuAK+rD9EogouvRM2fdH3HGijn/4ccuhkTJ
   cMs+oQQVXNaTvyAHNYWRYq1qELzcxkoFihDmJbA1PucNam5AT2i3xO5wP
   iaCi2UxjG9NvzScjwtmImsYOeoD81DhHiZlGuqp6WqRqw0dl+hg7kZclL
   uY/0e94k7BsFS7dzKLfp7+JJGxq/bDIU390H8HMZpCJXGfgTgLHj/la33
   Q==;
X-CSE-ConnectionGUID: RVUoP0RSS6CjhhlHL8UHMQ==
X-CSE-MsgGUID: fl5GJxgFSnKDxw4c1aDwdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="46024908"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="46024908"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 01:36:30 -0800
X-CSE-ConnectionGUID: gM2kupLGQwq/vZwhZgYW1w==
X-CSE-MsgGUID: mbGLVEhKSd6QVKIo5eYcEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="123988804"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 06 Mar 2025 01:36:28 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tq7eT-000Mqh-2V;
	Thu, 06 Mar 2025 09:36:25 +0000
Date: Thu, 6 Mar 2025 17:35:36 +0800
From: kernel test robot <lkp@intel.com>
To: Etienne Carriere <etienne.carriere@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Olivier Masse <olivier.masse@nxp.com>
Subject: [jens-wiklander-tee:testing/tuxbuild 6/10]
 drivers/tee/tee_shm.c:59:25: warning: variable 'parent_shm' set but not used
Message-ID: <202503061727.sjuwCOU4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   http://git.linaro.org/people/jens.wiklander/linux-tee testing/tuxbuild
head:   f4198d1f9ee51430ec81d02bb21f769cb6fd14c1
commit: 7d422f0ad0cc5ec96dae3175fe051d79aa735d16 [6/10] tee: new ioctl to a register tee_shm from a dmabuf file descriptor
config: csky-randconfig-002-20250305 (https://download.01.org/0day-ci/archive/20250306/202503061727.sjuwCOU4-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503061727.sjuwCOU4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503061727.sjuwCOU4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/tee/tee_shm.c: In function 'tee_shm_release':
>> drivers/tee/tee_shm.c:59:25: warning: variable 'parent_shm' set but not used [-Wunused-but-set-variable]
      59 |         struct tee_shm *parent_shm = NULL;
         |                         ^~~~~~~~~~


vim +/parent_shm +59 drivers/tee/tee_shm.c

    56	
    57	static void tee_shm_release(struct tee_device *teedev, struct tee_shm *shm)
    58	{
  > 59		struct tee_shm *parent_shm = NULL;
    60		void *p = shm;
    61	
    62		if (shm->flags & TEE_SHM_DMA_BUF) {
    63			struct tee_shm_dmabuf_ref *ref;
    64	
    65			ref = container_of(shm, struct tee_shm_dmabuf_ref, shm);
    66			parent_shm = ref->parent_shm;
    67			p = ref;
    68			if (ref->attach) {
    69				dma_buf_unmap_attachment(ref->attach, ref->sgt,
    70							 DMA_BIDIRECTIONAL);
    71	
    72				dma_buf_detach(ref->dmabuf, ref->attach);
    73			}
    74			dma_buf_put(ref->dmabuf);
    75		} else if (shm->flags & TEE_SHM_POOL) {
    76			teedev->pool->ops->free(teedev->pool, shm);
    77		} else if (shm->flags & TEE_SHM_DYNAMIC) {
    78			int rc = teedev->desc->ops->shm_unregister(shm->ctx, shm);
    79	
    80			if (rc)
    81				dev_err(teedev->dev.parent,
    82					"unregister shm %p failed: %d", shm, rc);
    83	
    84			release_registered_pages(shm);
    85		}
    86	
    87		if (shm->ctx)
    88			teedev_ctx_put(shm->ctx);
    89	
    90		kfree(p);
    91	
    92		tee_device_put(teedev);
    93	}
    94	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
