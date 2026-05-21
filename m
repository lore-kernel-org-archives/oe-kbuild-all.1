Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69949330659
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 07:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779349634; cv=none; b=B+FTf12JF/PsMhRZ0W9lwY9onr8H0glKi23Gw+y/EFxnpVNfb8Zpjab4vgpUOPm2u4RA1NCS3RByk3OXp4H70kAIhJkAYG11SOvJseAi11M69M9Ac1+GOxi8vdj3Qz5r9vq98+40fQYAvOyCr9MMp7RiY531LkwdXSVUbrMOmEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779349634; c=relaxed/simple;
	bh=+YZMJrJl/FZtwidEtvekKNGUWrY2mYRtCx19tORN00A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jIwNqjzSkuEXjR6zLa08nRQh/+xT3UIhfzzspY3HovNwrRMAA6SdDkwxeJf5eBt6rnhh8FRrymKJTQm/bEcAlkgnh8eHXeRgoQuOJcDcHxDim83QWEE1Nsf9AifmiyJCJE6zzDpbG1W63dD11NL0R/padcDCZ1UU9Iol/NiZGCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QW8LwfP9; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QW8LwfP9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779349633; x=1810885633;
  h=date:from:to:cc:subject:message-id;
  bh=+YZMJrJl/FZtwidEtvekKNGUWrY2mYRtCx19tORN00A=;
  b=QW8LwfP9IdBuP7wt7Gi7soTWhCtRC/fHlkJK+xKlQ8zjfJhyjbNQeHMk
   PTXS1r+Ui9stfdeKh15EI5U6ws97zBx81DD2cu6+EMx2yibzjDBSqqxZ1
   NBoKKGNZXsnvcpkEz5J191H7INaAfmBbfCH7qoDlQkcrtKR/XSlRYnVjE
   jzlQLsalR5klROxOpTPWCncaUK/nyucg9wa21AvTKE3XhTaELOKRYv98m
   mgqZUmOihP5mry/ToS7QZXIcCudi6lHJsV5fmaxUlHP3NGBHIEatBX9RX
   F75iK18a9d4Nv2VG0wJ7jBU5L8PjU1uGf2nJFyBCV6HgVF6toy15z5V+i
   A==;
X-CSE-ConnectionGUID: bkfS6BBPTPimtaC1TAFgOg==
X-CSE-MsgGUID: v5LR5SoqRMiFzcF0ZdvyMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="79289950"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="79289950"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 00:47:11 -0700
X-CSE-ConnectionGUID: Eyt5ycWgTpCQsUfw62LLJQ==
X-CSE-MsgGUID: mbGAVsQhTJmN/T+MqqbEmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="244753061"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 21 May 2026 00:47:11 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPy7X-000000004bx-2Er2;
	Thu, 21 May 2026 07:47:07 +0000
Date: Thu, 21 May 2026 15:46:01 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Ehrhardt <christian.ehrhardt@codasip.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 806/1130]
 drivers/media/platform/ti/omap3isp/ispccdc.c:739:44: warning: cast to pointer
 from integer of different size
Message-ID: <202605211541.HBSsR3zc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: 9bfa34515c0f6d7c8cab91bbca085d8ee76a5a45 [806/1130] cheri: Fix compile/warnings in drivers/media/
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260521/202605211541.HBSsR3zc-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605211541.HBSsR3zc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605211541.HBSsR3zc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/ti/omap3isp/ispccdc.c: In function 'ccdc_config':
>> drivers/media/platform/ti/omap3isp/ispccdc.c:739:44: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     739 |                                            (__force void __user *)__c_fakeu(fpc.fpcaddr),
         |                                            ^


vim +739 drivers/media/platform/ti/omap3isp/ispccdc.c

   653	
   654	/*
   655	 * ccdc_config - Set CCDC configuration from userspace
   656	 * @ccdc: Pointer to ISP CCDC device.
   657	 * @ccdc_struct: Structure containing CCDC configuration sent from userspace.
   658	 *
   659	 * Returns 0 if successful, -EINVAL if the pointer to the configuration
   660	 * structure is null, or the copy_from_user function fails to copy user space
   661	 * memory to kernel space memory.
   662	 */
   663	static int ccdc_config(struct isp_ccdc_device *ccdc,
   664			       struct omap3isp_ccdc_update_config *ccdc_struct)
   665	{
   666		struct isp_device *isp = to_isp_device(ccdc);
   667		unsigned long flags;
   668	
   669		spin_lock_irqsave(&ccdc->lock, flags);
   670		ccdc->shadow_update = 1;
   671		spin_unlock_irqrestore(&ccdc->lock, flags);
   672	
   673		if (OMAP3ISP_CCDC_ALAW & ccdc_struct->update) {
   674			ccdc->alaw = !!(OMAP3ISP_CCDC_ALAW & ccdc_struct->flag);
   675			ccdc->update |= OMAP3ISP_CCDC_ALAW;
   676		}
   677	
   678		if (OMAP3ISP_CCDC_LPF & ccdc_struct->update) {
   679			ccdc->lpf = !!(OMAP3ISP_CCDC_LPF & ccdc_struct->flag);
   680			ccdc->update |= OMAP3ISP_CCDC_LPF;
   681		}
   682	
   683		if (OMAP3ISP_CCDC_BLCLAMP & ccdc_struct->update) {
   684			if (copy_from_user(&ccdc->clamp, ccdc_struct->bclamp,
   685					   sizeof(ccdc->clamp))) {
   686				ccdc->shadow_update = 0;
   687				return -EFAULT;
   688			}
   689	
   690			ccdc->obclamp = !!(OMAP3ISP_CCDC_BLCLAMP & ccdc_struct->flag);
   691			ccdc->update |= OMAP3ISP_CCDC_BLCLAMP;
   692		}
   693	
   694		if (OMAP3ISP_CCDC_BCOMP & ccdc_struct->update) {
   695			if (copy_from_user(&ccdc->blcomp, ccdc_struct->blcomp,
   696					   sizeof(ccdc->blcomp))) {
   697				ccdc->shadow_update = 0;
   698				return -EFAULT;
   699			}
   700	
   701			ccdc->update |= OMAP3ISP_CCDC_BCOMP;
   702		}
   703	
   704		ccdc->shadow_update = 0;
   705	
   706		if (OMAP3ISP_CCDC_FPC & ccdc_struct->update) {
   707			struct omap3isp_ccdc_fpc fpc;
   708			struct ispccdc_fpc fpc_old = { .addr = NULL, };
   709			struct ispccdc_fpc fpc_new;
   710			u32 size;
   711	
   712			if (ccdc->state != ISP_PIPELINE_STREAM_STOPPED)
   713				return -EBUSY;
   714	
   715			ccdc->fpc_en = !!(OMAP3ISP_CCDC_FPC & ccdc_struct->flag);
   716	
   717			if (ccdc->fpc_en) {
   718				if (copy_from_user_with_ptr(&fpc, ccdc_struct->fpc, sizeof(fpc)))
   719					return -EFAULT;
   720	
   721				size = fpc.fpnum * 4;
   722	
   723				/*
   724				 * The table address must be 64-bytes aligned, which is
   725				 * guaranteed by dma_alloc_coherent().
   726				 */
   727				fpc_new.fpnum = fpc.fpnum;
   728				fpc_new.addr = dma_alloc_coherent(isp->dev, size,
   729								  &fpc_new.dma,
   730								  GFP_KERNEL);
   731				if (fpc_new.addr == NULL)
   732					return -ENOMEM;
   733	
   734				/*
   735				 * FIXCHERI: This will not work on CHERI because
   736				 * FIXCHERI: fpcaddr is not a pointer.
   737				 */
   738				if (copy_from_user(fpc_new.addr,
 > 739						   (__force void __user *)__c_fakeu(fpc.fpcaddr),
   740						   size)) {
   741					dma_free_coherent(isp->dev, size, fpc_new.addr,
   742							  fpc_new.dma);
   743					return -EFAULT;
   744				}
   745	
   746				fpc_old = ccdc->fpc;
   747				ccdc->fpc = fpc_new;
   748			}
   749	
   750			ccdc_configure_fpc(ccdc);
   751	
   752			if (fpc_old.addr != NULL)
   753				dma_free_coherent(isp->dev, fpc_old.fpnum * 4,
   754						  fpc_old.addr, fpc_old.dma);
   755		}
   756	
   757		return ccdc_lsc_config(ccdc, ccdc_struct);
   758	}
   759	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
