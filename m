Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE001749C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Jun 2025 00:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750983316; cv=none; b=IvOWlnL+c7GZlch+jvIQzw7MMRxGn9t2xtYYZW7pu+CcLMfXBcqs+NV9tLUY52BJ8Wz3wBeXIb7dnu170E1PrXBRgQGESwswaQ89zo5Wa4lWEjg1ASBpLWeV6uqoCXx0krN2els124ZZZj70i53/3wyobJDeJGhOKIrYjijHi+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750983316; c=relaxed/simple;
	bh=7Xme+aDcbz86mUYNBlRfs3mqy7Ve15PaEO8RL+6rmrM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f5DJk/S5CTjBbZjmW/mQ/LvdofCQNTDo4u45W8P0BLuF7jBcHMtpgoDpgN/Ogu7EWMOEPVzCbECOEzBZf5tyXlRxLYmsvxWfdWz1C9KBRMWECqaWaf2TCqXUbsryVHS0WQO3BtoOlMggIdvhQ/kw5rpcWvBE0hL5RZAxo1EhDNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B3z4Dg6s; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B3z4Dg6s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750983314; x=1782519314;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7Xme+aDcbz86mUYNBlRfs3mqy7Ve15PaEO8RL+6rmrM=;
  b=B3z4Dg6srQOUSovvrTZ78J/fCs+ugZlSRvlEgwYKnZiJovIcP9gsNs5n
   8CE9BiZ0VPtmWr/R7w9adNrTlciU2DgtgVdeyimQ0L4GdVbwwxt/mq8ou
   zksDOoMn6D/tnuuxmKSDdnVeAIjOTChVYudFRILOceya66pdH+8Pnbilm
   K+Tc75Uy5BftZB3eFv/bo7BwsSbKbpvHrJHndPENaDfy4XIp1mK+WMmyQ
   3mreG/UZIKA1Qpct22jeTyK++c0VyjM+ILBBt7Jir/cXKC/Xfx4G/gLTt
   fep55g1RG3Q256qrrL9NhXp2dcCYAnMS7wgRF0szhdkg1eo/IoTqSn54A
   g==;
X-CSE-ConnectionGUID: P125i/hXQkaHDmaO1mbPdA==
X-CSE-MsgGUID: cAT4MlPqR7m+KozJgM+8LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="63893989"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="63893989"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 17:15:14 -0700
X-CSE-ConnectionGUID: zl8DrpcRQUSjBiTF0AxlWg==
X-CSE-MsgGUID: 3IKoR/atQZiCLdzeJnOP3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="156695905"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 26 Jun 2025 17:15:13 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUwkJ-000Veo-0N;
	Fri, 27 Jun 2025 00:15:11 +0000
Date: Fri, 27 Jun 2025 08:14:13 +0800
From: kernel test robot <lkp@intel.com>
To: Bibo Mao <maobibo@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, Huacai Chen <chenhuacai@kernel.org>
Subject: [chenhuacai-loongson:loongarch-next 9/10]
 arch/loongarch/kvm/intc/eiointc.c:818:21: warning: ignoring return value of
 'copy_from_user' declared with attribute 'warn_unused_result'
Message-ID: <202506270832.ZLyuYLpN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git loongarch-next
head:   ef59259df6956d26b949a99b9d720d83c80d1ae0
commit: 6727d355ff23b5d9752393d403a41c7d85c7f4ee [9/10] LoongArch: KVM: Check validity of "num_cpu" from user space
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250627/202506270832.ZLyuYLpN-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250627/202506270832.ZLyuYLpN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506270832.ZLyuYLpN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/loongarch/kvm/intc/eiointc.c: In function 'kvm_eiointc_ctrl_access':
>> arch/loongarch/kvm/intc/eiointc.c:818:21: warning: ignoring return value of 'copy_from_user' declared with attribute 'warn_unused_result' [-Wunused-result]
     818 |                 if (copy_from_user(&val, data, 4) < 0)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +818 arch/loongarch/kvm/intc/eiointc.c

   803	
   804	static int kvm_eiointc_ctrl_access(struct kvm_device *dev,
   805						struct kvm_device_attr *attr)
   806	{
   807		int ret = 0;
   808		unsigned long flags;
   809		unsigned long type = (unsigned long)attr->attr;
   810		u32 i, start_irq, val;
   811		void __user *data;
   812		struct loongarch_eiointc *s = dev->kvm->arch.eiointc;
   813	
   814		data = (void __user *)attr->addr;
   815		spin_lock_irqsave(&s->lock, flags);
   816		switch (type) {
   817		case KVM_DEV_LOONGARCH_EXTIOI_CTRL_INIT_NUM_CPU:
 > 818			if (copy_from_user(&val, data, 4) < 0)
   819				ret = -EFAULT;
   820			else {
   821				if (val >= EIOINTC_ROUTE_MAX_VCPUS)
   822					ret = -EINVAL;
   823				else
   824					s->num_cpu = val;
   825			}
   826			break;
   827		case KVM_DEV_LOONGARCH_EXTIOI_CTRL_INIT_FEATURE:
   828			if (copy_from_user(&s->features, data, 4))
   829				ret = -EFAULT;
   830			if (!(s->features & BIT(EIOINTC_HAS_VIRT_EXTENSION)))
   831				s->status |= BIT(EIOINTC_ENABLE);
   832			break;
   833		case KVM_DEV_LOONGARCH_EXTIOI_CTRL_LOAD_FINISHED:
   834			eiointc_set_sw_coreisr(s);
   835			for (i = 0; i < (EIOINTC_IRQS / 4); i++) {
   836				start_irq = i * 4;
   837				eiointc_update_sw_coremap(s, start_irq,
   838						s->coremap.reg_u32[i], sizeof(u32), false);
   839			}
   840			break;
   841		default:
   842			break;
   843		}
   844		spin_unlock_irqrestore(&s->lock, flags);
   845	
   846		return ret;
   847	}
   848	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
