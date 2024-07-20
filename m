Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A02323D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jul 2024 01:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721439359; cv=none; b=b0DuXIvuQ2FPEwRotzmeapmkWGxTcCUWRwIwHaDZE30OzWCBjRJnCvd8uIsQlOBVMRk4bJDtSaDgWGx/UK+/xFZR7OPVhHKDXCaKFXxQzznyAogjnEDCyq6zDMFeiLWir++qJx3jbRgbt0oXDCgqXpY/RGQ/XzbcAyPRIdj5GzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721439359; c=relaxed/simple;
	bh=m+0mmqV7O3rlLYP/uVKegSLNgXXmjx3rL0kDYsxdiGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UoUMJdl1rylOnEBvb88fQsfXiMyk2D+Ct2YbTxrYGus4m3GKVlLX3kGEF3xooKteWyAn4iVUQacu+DYXIkCoRCR96uLXYy5erDIxNnhN96wE5IpfMojej5NnaiQnYat0HWs4/4FkY+o0QY6+KvoXfXDy70kAyzlLKcCZFMXGxnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b0vC61QX; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b0vC61QX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721439358; x=1752975358;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m+0mmqV7O3rlLYP/uVKegSLNgXXmjx3rL0kDYsxdiGo=;
  b=b0vC61QXvOqG7L4PvK8bGnqPU65xBOBHpn+gJLIkzqS9uspRXPI2lIQN
   59FmisekERCJsYans7iZ/q75H8XDRojb5e4f2F3nRoeRZaytD5xzkPSaI
   52rABupgH/WZYpTkzvKdOaWsXYEocM1F03zEEaJZlNf7Lxt6hID9zSAmh
   bDAKBy2AAHV+hffxBgQLeeRRDYW7SemUXniAWVh7svihPz6RAzf1TxjWs
   oKMCkY61QOEsBaqbQmiRgJDAaDBFH/Rz3O6ZmquHmMMT65JtiBkeWfDvM
   1x0xCST9oh4QqccvVLlA5sU87IGfqGmspRCVjBrDA2fkRInQiACmePG4+
   w==;
X-CSE-ConnectionGUID: fBz1yABjTXObjPC5Ct5EgQ==
X-CSE-MsgGUID: i2WShnp8SoyTeYv8ssC9Ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="29697003"
X-IronPort-AV: E=Sophos;i="6.09,222,1716274800"; 
   d="scan'208";a="29697003"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2024 18:35:56 -0700
X-CSE-ConnectionGUID: NVekY47nT8q5kT9T0N6oUQ==
X-CSE-MsgGUID: YU0j4Y4qSH+E4iXHDS3uAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,222,1716274800"; 
   d="scan'208";a="56129313"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 19 Jul 2024 18:35:54 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUz0o-000ikE-33;
	Sat, 20 Jul 2024 01:35:50 +0000
Date: Sat, 20 Jul 2024 09:35:16 +0800
From: kernel test robot <lkp@intel.com>
To: Ilias Stamatis <ilstam@amazon.com>, kvm@vger.kernel.org,
	pbonzini@redhat.com
Cc: oe-kbuild-all@lists.linux.dev, pdurrant@amazon.co.uk, dwmw@amazon.co.uk,
	nh-open-source@amazon.com, Ilias Stamatis <ilstam@amazon.com>
Subject: Re: [PATCH v2 3/6] KVM: Support poll() on coalesced mmio buffer fds
Message-ID: <202407200922.pJAJMVRk-lkp@intel.com>
References: <20240718193543.624039-4-ilstam@amazon.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240718193543.624039-4-ilstam@amazon.com>

Hi Ilias,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kvm/queue]
[also build test WARNING on next-20240719]
[cannot apply to mst-vhost/linux-next linus/master kvm/linux-next v6.10]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ilias-Stamatis/KVM-Fix-coalesced_mmio_has_room/20240719-034316
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20240718193543.624039-4-ilstam%40amazon.com
patch subject: [PATCH v2 3/6] KVM: Support poll() on coalesced mmio buffer fds
config: x86_64-randconfig-122-20240719 (https://download.01.org/0day-ci/archive/20240720/202407200922.pJAJMVRk-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240720/202407200922.pJAJMVRk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407200922.pJAJMVRk-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kvm/../../../virt/kvm/coalesced_mmio.c:241:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __poll_t [usertype] mask @@     got int @@
   arch/x86/kvm/../../../virt/kvm/coalesced_mmio.c:241:22: sparse:     expected restricted __poll_t [usertype] mask
   arch/x86/kvm/../../../virt/kvm/coalesced_mmio.c:241:22: sparse:     got int
   arch/x86/kvm/../../../virt/kvm/coalesced_mmio.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h, ...):
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false

vim +241 arch/x86/kvm/../../../virt/kvm/coalesced_mmio.c

   231	
   232	static __poll_t coalesced_mmio_buffer_poll(struct file *file, struct poll_table_struct *wait)
   233	{
   234		struct kvm_coalesced_mmio_buffer_dev *dev = file->private_data;
   235		__poll_t mask = 0;
   236	
   237		poll_wait(file, &dev->wait_queue, wait);
   238	
   239		spin_lock(&dev->ring_lock);
   240		if (dev->ring && (READ_ONCE(dev->ring->first) != READ_ONCE(dev->ring->last)))
 > 241			mask = POLLIN | POLLRDNORM;
   242		spin_unlock(&dev->ring_lock);
   243	
   244		return mask;
   245	}
   246	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
