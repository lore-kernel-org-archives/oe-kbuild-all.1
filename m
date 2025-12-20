Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739B723EAB7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 13:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766237760; cv=none; b=c5nhNsVv39CwLu8RJW7xjmRc5OqV07g6ktYpEIGsld8sPDVEufclpK6s2dpNWg8U/fF/o/jkgS1FQLvuW8oBH7i0xM4z9JMLzWBeI/ggFJtcWtf1iGNlJGgv6b3HYUSSF/iHGXGEBEqVjEkmRtA1mqYpQGm6zNAYKlU0Y+cld08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766237760; c=relaxed/simple;
	bh=910i98CWZz9xf1sI6Pth5IC7Dl4Cza5iifKj9lsU/ZE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k1ejJIVOJSdBsp6e/nEqDZLQhOcQwo8SKwPySCZAqCAy51osXGsMoiu2QfBBtbPpH6xqzThrriatGXg5jhQaOefpqg8jYg7HZMgjMg5IfSHhy32Tf5rSTU7WuDXRlY+0rcTZue+IC9xH9zkgTOVK1olO0Z95p6Vhju3yQNnyXUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J+mmKq8B; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J+mmKq8B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766237757; x=1797773757;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=910i98CWZz9xf1sI6Pth5IC7Dl4Cza5iifKj9lsU/ZE=;
  b=J+mmKq8BIxqfjrr7agnsjzY4wul2rDFiYaLnj/inW7SUQB3Yv+3UJUYO
   MBZa/ypAOH6E72t5u/D5sXLePumcM6wo+TfI3l3UYVZIuARCvyXoWDXuw
   f27ZnyBAxaWY3XHz87TEdk7zSMplV7eUAwFBjXqAxq5VGsTjBGFUx/gmn
   xKkxB4opjYDvSeHo1gIB8fMSBiTuGD4xqYxi8q0EuqL59JgbtRFTHMgf6
   tLwbsyCokipEvdm13gilHas+x0IhWBPH2uqO7uNVvpPW9j+cpyQwpmVOL
   h9MeMfRWTLrpNF7BMUnTVs5BA9IpDkaiKQzV4sK7CjYL9FeX+2lpHeIjN
   A==;
X-CSE-ConnectionGUID: onLbjx9xS8Ow0DpuR4mMTg==
X-CSE-MsgGUID: RxMu491PTdChtVPVCe6yDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="67371178"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="67371178"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 05:35:55 -0800
X-CSE-ConnectionGUID: Ws/gPN8tR1yUi9sGFtXNdA==
X-CSE-MsgGUID: zF+MAjidRbCekgL7iERHaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="204039162"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 Dec 2025 05:35:54 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWx7f-000000004Z3-3tXP;
	Sat, 20 Dec 2025 13:35:51 +0000
Date: Sat, 20 Dec 2025 21:35:46 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Qinxin Xia <xiaqinxin@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3547/3547] drivers/irqchip/irq-gic-v3.c:561:6:
 warning: no previous prototype for function 'gic_irq_set_prio'
Message-ID: <202512202109.DOPKqwQT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Qinxin,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   04473ee9ed912a16fff0d8846ad565bbf3d63c77
commit: f0f9be237c2266d30fa01c294577438a2e2ee749 [3547/3547] gic: increase the arch_timer priority to avoid hardlockup
config: arm64-randconfig-001-20251216 (https://download.01.org/0day-ci/archive/20251220/202512202109.DOPKqwQT-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202109.DOPKqwQT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202109.DOPKqwQT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-gic-v3.c:561:6: warning: no previous prototype for function 'gic_irq_set_prio' [-Wmissing-prototypes]
   void gic_irq_set_prio(struct irq_data *d, u8 prio)
        ^
   drivers/irqchip/irq-gic-v3.c:561:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void gic_irq_set_prio(struct irq_data *d, u8 prio)
   ^
   static 
   drivers/irqchip/irq-gic-v3.c:1531:6: warning: no previous prototype for function 'gic_dist_enable_ipiv' [-Wmissing-prototypes]
   void gic_dist_enable_ipiv(void)
        ^
   drivers/irqchip/irq-gic-v3.c:1531:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void gic_dist_enable_ipiv(void)
   ^
   static 
   drivers/irqchip/irq-gic-v3.c:1548:6: warning: no previous prototype for function 'gic_get_ipiv_status' [-Wmissing-prototypes]
   bool gic_get_ipiv_status(void)
        ^
   drivers/irqchip/irq-gic-v3.c:1548:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool gic_get_ipiv_status(void)
   ^
   static 
   3 warnings generated.


vim +/gic_irq_set_prio +561 drivers/irqchip/irq-gic-v3.c

   560	
 > 561	void gic_irq_set_prio(struct irq_data *d, u8 prio)
   562	{
   563		void __iomem *base = gic_dist_base(d);
   564		u32 offset, index;
   565	
   566		offset = convert_offset_index(d, GICD_IPRIORITYR, &index);
   567	
   568		writeb_relaxed(prio, base + offset + index);
   569	}
   570	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
