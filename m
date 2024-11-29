Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C80C73451
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Nov 2024 18:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732904382; cv=none; b=V9z6IXnP4vWu8QHvlbL0eanyUpvuD7sf6VRgqe3mKsQd9ztPj4MxOzZwn2sIXobaFzAb1kfKbgNQtNOHHClId/xOwXRXvtJsb+vSgiRj+lIwu50kE3/M5IBpJheXwP0RjT53UJA3tOTMrZ0HyFch/vaXSsGXMnPmDCbNiG/ypCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732904382; c=relaxed/simple;
	bh=eOb7N60E8MIQmrG8AfGP52FA7K8JfCeMvjbAS4SvG2s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KUX9uIvCrxUOI/jAMM8ix0YznaoMKS/KxvFB7c0ErAsO/E/LJ+lcrEQfp+hFe28TPfqL2KguobG4u3Qbx6alchDANyBn9fzceyr656jbL/r1admvD2ZjzSQdik3WYqYbl4c3B88odr/+rSESMkL2IqCNeYJBwqlm+SIcLp7iv5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TZ4HofqF; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TZ4HofqF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732904380; x=1764440380;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eOb7N60E8MIQmrG8AfGP52FA7K8JfCeMvjbAS4SvG2s=;
  b=TZ4HofqFpEHwJiF/umKgDUiH4Qeo8fwdaI7bMJzqcUlPTfDB05M9PcJA
   bTRa1dypYDJ8Te58lgO6pwTkBfqTTnudBIrtR89/O5DDFfROSGuDnLU7f
   HeZ4rjO3FmjSgrkRgRXLX8gijtJVqHuGfFJ/79cHJUwrJ/M078/GNCuBy
   8tGIYx0cXSrON4BxR8oHulVG1kcA/s0FUfvuINFqHcKWL1knb4wCHh3Ga
   AxgdPLA8uZ6OelwXQEz6LlKu9BwQgz7M/nghWAvVj4k1Wd06KzU0R3Gih
   jsctiVf9OoQ+bEtVHs1NiT+JC+GuiIA/OMdqei+wAuuns13Y2MSMV0K5J
   g==;
X-CSE-ConnectionGUID: vgpkavajS+uFMtGKrTwahg==
X-CSE-MsgGUID: 1cfG8EKQQbaTeR2DoQovjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="36811694"
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; 
   d="scan'208";a="36811694"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 10:19:40 -0800
X-CSE-ConnectionGUID: AdTjmTMiRUy5It+dN9CPqA==
X-CSE-MsgGUID: r81SvDvMRRmVDJY6fXTtCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; 
   d="scan'208";a="130027075"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Nov 2024 10:19:39 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tH5aa-0000bn-1C;
	Fri, 29 Nov 2024 18:19:36 +0000
Date: Sat, 30 Nov 2024 02:18:58 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xianglai Li <lixianglai@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1562/1562] arch/loongarch/kvm/exit.c:764:63:
 error: 'struct sched_info' has no member named 'run_delay'
Message-ID: <202411300227.cX0BjKzQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bibo,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   429a19874eb589d27346ba7363fa091d7e4ff99a
commit: faa35b0fcdefb1e5f2d05b0eeac12be32e69e566 [1562/1562] LoongArch: KVM: Add steal time support in kvm side
config: loongarch-randconfig-r061-20241129 (https://download.01.org/0day-ci/archive/20241130/202411300227.cX0BjKzQ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241130/202411300227.cX0BjKzQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411300227.cX0BjKzQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/loongarch/kvm/exit.c: In function 'kvm_save_notify':
>> arch/loongarch/kvm/exit.c:764:63: error: 'struct sched_info' has no member named 'run_delay'
     764 |                 vcpu->arch.st.last_steal = current->sched_info.run_delay;
         |                                                               ^
--
   arch/loongarch/kvm/vcpu.c: In function 'kvm_update_stolen_time':
>> arch/loongarch/kvm/vcpu.c:68:37: error: 'struct sched_info' has no member named 'run_delay'
      68 |         steal += current->sched_info.run_delay -
         |                                     ^
   arch/loongarch/kvm/vcpu.c:70:55: error: 'struct sched_info' has no member named 'run_delay'
      70 |         vcpu->arch.st.last_steal = current->sched_info.run_delay;
         |                                                       ^


vim +764 arch/loongarch/kvm/exit.c

   754	
   755	static int kvm_save_notify(struct kvm_vcpu *vcpu)
   756	{
   757		unsigned long id, data;
   758	
   759		id = vcpu->arch.gprs[LOONGARCH_GPR_A1];
   760		data = vcpu->arch.gprs[LOONGARCH_GPR_A2];
   761		switch (id) {
   762		case KVM_FEATURE_STEAL_TIME:
   763			vcpu->arch.st.guest_addr = data;
 > 764			vcpu->arch.st.last_steal = current->sched_info.run_delay;
   765			kvm_make_request(KVM_REQ_RECORD_STEAL, vcpu);
   766			break;
   767		default:
   768			break;
   769		};
   770	
   771		return 0;
   772	};
   773	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
