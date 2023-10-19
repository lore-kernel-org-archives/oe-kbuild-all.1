Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E46C14F7D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 08:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZS19zqIa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697705407; x=1729241407;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1jbjfA97FBAjQUczPPi7hO4oXDW7fT1dNRlyX4WG6IM=;
  b=ZS19zqIaWbsR+5JRNgt5yJ3JgJJve2zYNYAc5Elv1QR6id4+Pqg9xvz1
   /kAPc+Vu2O8gmqvIj2oBb35FKV1MSDSPhwP5tuVWL9Q17TAqFw4X5o2vf
   cbmCt48burR3aoSv/n2lMzc9MwQk2U2EqHgx45dHCUQJM+T9crLUStWFu
   xMApSam42fF5uwBNkvFFA99DG9nVGiWgy/0MsYO2mh2d501rf/3f6Xlqc
   KIsvM84zWc7YN3z0AGDfhwQFDHDZURj2kZrhrtDYTQiZx9eBLDq7xopbk
   UjLgEgp59aLuiQjMLNwa/5EAI8LY5CM/zVRUE1WARv3cVe3dOcZc3yAjJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="383425753"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="383425753"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 01:50:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="822760698"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="822760698"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 19 Oct 2023 01:50:02 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtOj9-0001t4-2M;
	Thu, 19 Oct 2023 08:49:59 +0000
Date: Thu, 19 Oct 2023 16:49:56 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH V2 2/2] xen: privcmd: Add support for ioeventfd
Message-ID: <202310191650.u6UgzG1F-lkp@intel.com>
References: <6e43e092e35a56619b0a132e78fac01b68ded94a.1696500578.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e43e092e35a56619b0a132e78fac01b68ded94a.1696500578.git.viresh.kumar@linaro.org>

Hi Viresh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on xen-tip/linux-next]
[also build test WARNING on linus/master v6.6-rc6]
[cannot apply to next-20231018]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Viresh-Kumar/xen-privcmd-Add-support-for-ioeventfd/20231005-215814
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git linux-next
patch link:    https://lore.kernel.org/r/6e43e092e35a56619b0a132e78fac01b68ded94a.1696500578.git.viresh.kumar%40linaro.org
patch subject: [PATCH V2 2/2] xen: privcmd: Add support for ioeventfd
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20231019/202310191650.u6UgzG1F-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310191650.u6UgzG1F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310191650.u6UgzG1F-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/xen/privcmd.c: In function 'alloc_ioreq':
>> drivers/xen/privcmd.c:1233:30: warning: array subscript i is outside array bounds of 'struct ioreq_port[0]' [-Warray-bounds=]
    1233 |                 kioreq->ports[i].vcpu = i;
         |                 ~~~~~~~~~~~~~^~~
   drivers/xen/privcmd.c:1118:27: note: while referencing 'ports'
    1118 |         struct ioreq_port ports[0];
         |                           ^~~~~
   drivers/xen/privcmd.c:1234:30: warning: array subscript i is outside array bounds of 'struct ioreq_port[0]' [-Warray-bounds=]
    1234 |                 kioreq->ports[i].port = ports[i];
         |                 ~~~~~~~~~~~~~^~~
   drivers/xen/privcmd.c:1118:27: note: while referencing 'ports'
    1118 |         struct ioreq_port ports[0];
         |                           ^~~~~
   drivers/xen/privcmd.c:1235:30: warning: array subscript i is outside array bounds of 'struct ioreq_port[0]' [-Warray-bounds=]
    1235 |                 kioreq->ports[i].kioreq = kioreq;
         |                 ~~~~~~~~~~~~~^~~
   drivers/xen/privcmd.c:1118:27: note: while referencing 'ports'
    1118 |         struct ioreq_port ports[0];
         |                           ^~~~~
   drivers/xen/privcmd.c:1239:33: warning: array subscript i is outside array bounds of 'struct ioreq_port[0]' [-Warray-bounds=]
    1239 |                                 &kioreq->ports[i]);
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/xen/privcmd.c:1118:27: note: while referencing 'ports'
    1118 |         struct ioreq_port ports[0];
         |                           ^~~~~
   drivers/xen/privcmd.c:1252:67: warning: array subscript i is outside array bounds of 'struct ioreq_port[0]' [-Warray-bounds=]
    1252 |                 unbind_from_irqhandler(irq_from_evtchn(ports[i]), &kioreq->ports[i]);
         |                                                                   ^~~~~~~~~~~~~~~~~
   drivers/xen/privcmd.c:1118:27: note: while referencing 'ports'
    1118 |         struct ioreq_port ports[0];
         |                           ^~~~~


vim +1233 drivers/xen/privcmd.c

  1182	
  1183	static
  1184	struct privcmd_kernel_ioreq *alloc_ioreq(struct privcmd_ioeventfd *ioeventfd)
  1185	{
  1186		struct privcmd_kernel_ioreq *kioreq;
  1187		struct mm_struct *mm = current->mm;
  1188		struct vm_area_struct *vma;
  1189		struct page **pages;
  1190		unsigned int *ports;
  1191		int ret, size, i;
  1192	
  1193		lockdep_assert_held(&ioreq_lock);
  1194	
  1195		size = struct_size(kioreq, ports, ioeventfd->vcpus);
  1196		kioreq = kzalloc(size, GFP_KERNEL);
  1197		if (!kioreq)
  1198			return ERR_PTR(-ENOMEM);
  1199	
  1200		kioreq->dom = ioeventfd->dom;
  1201		kioreq->vcpus = ioeventfd->vcpus;
  1202		kioreq->uioreq = ioeventfd->ioreq;
  1203		spin_lock_init(&kioreq->lock);
  1204		INIT_LIST_HEAD(&kioreq->ioeventfds);
  1205	
  1206		/* The memory for ioreq server must have been mapped earlier */
  1207		mmap_write_lock(mm);
  1208		vma = find_vma(mm, (unsigned long)ioeventfd->ioreq);
  1209		if (!vma) {
  1210			pr_err("Failed to find vma for ioreq page!\n");
  1211			mmap_write_unlock(mm);
  1212			ret = -EFAULT;
  1213			goto error_kfree;
  1214		}
  1215	
  1216		pages = vma->vm_private_data;
  1217		kioreq->ioreq = (struct ioreq *)(page_to_virt(pages[0]));
  1218		mmap_write_unlock(mm);
  1219	
  1220		size = sizeof(*ports) * kioreq->vcpus;
  1221		ports = kzalloc(size, GFP_KERNEL);
  1222		if (!ports) {
  1223			ret = -ENOMEM;
  1224			goto error_kfree;
  1225		}
  1226	
  1227		if (copy_from_user(ports, ioeventfd->ports, size)) {
  1228			ret = -EFAULT;
  1229			goto error_kfree_ports;
  1230		}
  1231	
  1232		for (i = 0; i < kioreq->vcpus; i++) {
> 1233			kioreq->ports[i].vcpu = i;
  1234			kioreq->ports[i].port = ports[i];
  1235			kioreq->ports[i].kioreq = kioreq;
  1236	
  1237			ret = bind_evtchn_to_irqhandler_lateeoi(ports[i],
  1238					ioeventfd_interrupt, IRQF_SHARED, "ioeventfd",
  1239					&kioreq->ports[i]);
  1240			if (ret < 0)
  1241				goto error_unbind;
  1242		}
  1243	
  1244		kfree(ports);
  1245	
  1246		list_add_tail(&kioreq->list, &ioreq_list);
  1247	
  1248		return kioreq;
  1249	
  1250	error_unbind:
  1251		while (--i >= 0)
  1252			unbind_from_irqhandler(irq_from_evtchn(ports[i]), &kioreq->ports[i]);
  1253	error_kfree_ports:
  1254		kfree(ports);
  1255	error_kfree:
  1256		kfree(kioreq);
  1257		return ERR_PTR(ret);
  1258	}
  1259	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
