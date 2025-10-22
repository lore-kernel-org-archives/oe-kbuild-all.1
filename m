Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6E722FE0A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Oct 2025 19:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761162793; cv=none; b=lvyCkLWm6zFU3qN5yWCnFKW7oFwcwmugq0FxiKW+yRO9ZjvqEx4VF8NRckQPAwY43Lkwo9PRtDppm+wa4uj+W3azIUm8LdpTCMGmGOVEO2XonPJZ62n3vJ6k/lAYjRHVRbNNDMxlPP5IE4yVFr7I6lpZjaUHHKe5EHdQzfc5iuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761162793; c=relaxed/simple;
	bh=NTkbVtPM8BSNxR1LOO9+EncUS/EKAJGMnbyUDqZtKQI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YhWRwahfseD4l4ymgYBmYA2AdpLgYk4IRRmkWcryRnJxdgiwD6Y3J7z1ptURCL6g7feJrghfS06cmxMYGOz9mcG75T55in19ng1KBycoCo+qFWEkkEgGwAtVA30teXPkFmHaATfG8uqR2BS1xVHUYiCNIjr9QU/+c+J4Bw4ijXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VBcit2vW; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VBcit2vW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761162792; x=1792698792;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NTkbVtPM8BSNxR1LOO9+EncUS/EKAJGMnbyUDqZtKQI=;
  b=VBcit2vWVpfMIHRK0lNR9qUYPQa/ZsxAI8Bk994I7QEw6FxIxdFdTEJa
   qanWpu5qqeNwjRJKndhuYQQCOMqK5vkMInXEnDzQzW7icLQxsvCLxA3XU
   GqlfBp1BoYsGm5iukELKfd4TqC9YkHgv06xD3U00XMSzSRf71whf8J4nR
   gthZSQVdcy8I+qbwgV58cMDU7xcPGaXUJnX5fypZ9Vx+7VEjS8dg6m/e8
   VW0OnaASbEGcnfTtZwhAxTfe4rRuJSrqd25cIgsz7uP9AjXFNHHbffne0
   ucZxrHgkZ/Xv9FnNNTTDc2vqSYarDWzZioNSaMwJfDcTXf/TTG1PhMYCU
   Q==;
X-CSE-ConnectionGUID: WMahj/9gSEyWS6R5oEwF/Q==
X-CSE-MsgGUID: mcG7oe1GQ2ajX7gyYLxApg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="85947286"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="85947286"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 12:53:11 -0700
X-CSE-ConnectionGUID: 8lgtQ/grRSyp+gVSwD9HIQ==
X-CSE-MsgGUID: 7mPDtl76QRmlB5YqikBEPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="184735333"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 22 Oct 2025 12:53:10 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBetP-000Cgn-2s;
	Wed, 22 Oct 2025 19:53:07 +0000
Date: Thu, 23 Oct 2025 03:52:41 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3029/3029]
 drivers/net/ethernet/huawei/bma/edma_drv/edma_queue.c:330:5: warning: no
 previous prototype for 'wait_done_dma_queue'
Message-ID: <202510230341.svqbkrke-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   490c39747983c9dbb0974244d1e74f1535394ba0
commit: 85502a982830072aff2efa8b65f75c240b4d6181 [3029/3029] Huawei iBMA: Added support for Hi1712 Chip
config: x86_64-randconfig-161-20251023 (https://download.01.org/0day-ci/archive/20251023/202510230341.svqbkrke-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510230341.svqbkrke-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510230341.svqbkrke-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/huawei/bma/edma_drv/edma_queue.c:330:5: warning: no previous prototype for 'wait_done_dma_queue' [-Wmissing-prototypes]
     330 | s32 wait_done_dma_queue(unsigned long timeout)
         |     ^~~~~~~~~~~~~~~~~~~


vim +/wait_done_dma_queue +330 drivers/net/ethernet/huawei/bma/edma_drv/edma_queue.c

   329	
 > 330	s32 wait_done_dma_queue(unsigned long timeout)
   331	{
   332		struct dma_ch_cq_s *p_cur_last_cq;
   333		struct dma_ch_cq_s *p_dma_cq;
   334		unsigned long end;
   335		u32 sq_tail;
   336		u32 sq_valid;
   337		u32 cq_tail;
   338		u32 cq_valid;
   339	
   340		p_dma_cq = (struct dma_ch_cq_s *)((&get_bma_dev()->edma_host)->edma_cq_addr);
   341		end = jiffies + timeout;
   342	
   343		while (time_before(jiffies, end)) {
   344			(void)get_dma_queue_sq_tail(&sq_tail);
   345			(void)get_dma_queue_cq_tail(&cq_tail);
   346	
   347			cq_valid = (cq_tail + CQ_DEPTH - 1) % (CQ_DEPTH);
   348			p_cur_last_cq = &p_dma_cq[cq_valid];
   349			sq_valid = (sq_tail + SQ_DEPTH - 1) % (SQ_DEPTH);
   350			BMA_LOG(DLOG_DEBUG,
   351				"sq_tail %d, cq_tail %d, cq_valid %d, sq_valid %d, p_cur_last_cq->sqhd %d\n",
   352				sq_tail, cq_tail, cq_valid, sq_valid, p_cur_last_cq->sqhd);
   353			if (p_cur_last_cq->sqhd == sq_valid) {
   354				set_dma_queue_cq_head(cq_valid);
   355				return 0;
   356			}
   357		}
   358	
   359		return -ETIMEDOUT;
   360	}
   361	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
