Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66231F5EA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Nov 2025 22:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764109462; cv=none; b=jyJvoXlOjVhTGaHXCqA5ccdm4yaagnFSOPd+2q1W2KAkGvwQs9UFzxMK87PDysWaUnm28jzoBummtuEDrarX09ciM55AOcbpr7glJVm/1D6DKIhVBsPHlV5fpHCEnB4vjr5ys/LgbQ7Oez8sHIIojtXfv9EPKJ9MlQe39hU2O/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764109462; c=relaxed/simple;
	bh=u1JrTW2IWW9xQuoP5r2uizApYf4YpWX7k7KQzpL5oa4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bnuk1lV5WzVI0tDhyUPNrK8TzZYj6IXkhf7GvA/UubIJtQsWeF/zjgIX003qm/2enOYE6ixNCKvLet5sS/7wBsvypiEQOVxtwYrNlk57K3d3+KA6R0FCeH57//YonL540wE10KR78r3X9hAQ7K28e8L6YzRN4ncxX1zbdhh7BPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g8YkhId4; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g8YkhId4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764109461; x=1795645461;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u1JrTW2IWW9xQuoP5r2uizApYf4YpWX7k7KQzpL5oa4=;
  b=g8YkhId4lubaPJID53ztPkQJ3LyW7pV2eK76vWBHC11Ns6rsqhNS9VpU
   SupTxC1YCPW9S9X9lEJ9F8QmghD6F7nh0uJDjuadHAlVNSgsW76/1L87g
   zMtPMFWrNFx3nlFV64Aj/4+i11bpYSjMC5Lpw70dNYO/HetCUIvB/wjTB
   2bA7/3kOwnadQnJC577xzro5dR0sJ/Slt8eieYE3FoR1jBWJbQ+TawwBC
   RgtHv9rwXFuB49+9epbbkeKoZ0gRMAbtWwHVI5RgmoTQabCoNZJVr+ASF
   2gTma6HyWe1+ecx6k9kC0OSLmGOijlNYLRDJKHC19Sodo+JumTTB+tjpw
   A==;
X-CSE-ConnectionGUID: I+GLDF7lSFmwX2gOBbGu+Q==
X-CSE-MsgGUID: ba5v12KJRBe+w0budJ08LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="83749069"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="83749069"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 14:24:20 -0800
X-CSE-ConnectionGUID: t6GYWIAiSceWh4JCIlovFA==
X-CSE-MsgGUID: 8ssHDMaWQqWozYv0o6d3BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="197083324"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Nov 2025 14:24:19 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vO1SK-000000002Jp-3Iiy;
	Tue, 25 Nov 2025 22:24:16 +0000
Date: Wed, 26 Nov 2025 06:23:26 +0800
From: kernel test robot <lkp@intel.com>
To: Siva Reddy Kallam <siva.kallam@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev, Leon Romanovsky <leon@kernel.org>,
	Usman Ansari <usman.ansari@broadcom.com>
Subject: [rdma-rdma:wip/leon-for-next 38/54]
 drivers/infiniband/hw/bng_re/bng_fw.c:278:9: error: implicit declaration of
 function 'prefetch'
Message-ID: <202511260607.Kuxn4NnN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git wip/leon-for-next
head:   4022c7b6342a4d9a97e1e974e27efca95e79ed20
commit: 23669ca628b3c39dc3cc43a5b4b93b4b5ab4d58c [38/54] RDMA/bng_re: Add infrastructure for enabling Firmware channel
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20251126/202511260607.Kuxn4NnN-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251126/202511260607.Kuxn4NnN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511260607.Kuxn4NnN-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/infiniband/hw/bng_re/bng_fw.c: In function 'bng_re_creq_irq':
>> drivers/infiniband/hw/bng_re/bng_fw.c:278:9: error: implicit declaration of function 'prefetch' [-Wimplicit-function-declaration]
     278 |         prefetch(bng_re_get_qe(hwq, sw_cons, NULL));
         |         ^~~~~~~~


vim +/prefetch +278 drivers/infiniband/hw/bng_re/bng_fw.c

   266	
   267	static irqreturn_t bng_re_creq_irq(int irq, void *dev_instance)
   268	{
   269		struct bng_re_rcfw *rcfw = dev_instance;
   270		struct bng_re_creq_ctx *creq;
   271		struct bng_re_hwq *hwq;
   272		u32 sw_cons;
   273	
   274		creq = &rcfw->creq;
   275		hwq = &creq->hwq;
   276		/* Prefetch the CREQ element */
   277		sw_cons = HWQ_CMP(hwq->cons, hwq);
 > 278		prefetch(bng_re_get_qe(hwq, sw_cons, NULL));
   279	
   280		tasklet_schedule(&creq->creq_tasklet);
   281	
   282		return IRQ_HANDLED;
   283	}
   284	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
