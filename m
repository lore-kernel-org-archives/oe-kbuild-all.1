Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E47AD22
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Feb 2024 06:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707115400; cv=none; b=pHl7s2geNdkGnQtYuwPLzK6cGyN9cv5knVPAg/orvYm4udkz2KqzlWC2jrwAlHnJoPyfmSsIG4Ji5Zv4wl1dtsmC4AQPPmAYHSy4gNxv7mJerZGpLEaC21ZQa2X2dn4K2lFMoo4CUXn7fWx8P3OSsSNKm5YLYtqmF8so49ZeyS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707115400; c=relaxed/simple;
	bh=qr5Phb6cluf+46XxJDhqHAnZK1OoE8gHSxsMIRmaII8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UEMOMet+0L9khjfz7KWGaNIKRlQ7cv2ck+rkx+20mNn2ECj1i4Mm2D9dIORC0yMIYQFMOY5C/r8l9zNIBcOQzRHRMAmm8gBRHKDOin0FeJq1sSN74kXVf3xgkA1T40FkT1fNIuBYkjW6t1oAtPCn2faRCVo2plY39MfQx0R1IHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j0fKdeae; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j0fKdeae"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707115398; x=1738651398;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qr5Phb6cluf+46XxJDhqHAnZK1OoE8gHSxsMIRmaII8=;
  b=j0fKdeaex2zfJhL+2jJ6m+zZf8FA3mACl6VkezShTHDtbwlRaG3ujQG0
   Lwg4F5/aIRb0ToXWKvMQW3Nwoe41oaT143C0XgTgWoUwHsVgchmxwefmF
   cgGbsgoNboS4wn4+9Jx7vmc0TTSp7YMTSsQNQ1/xN2PMsxiztdRXUncC/
   gmHIQ11ts8hDQi/0oHRa82sa0g22ec3gmCjhmgTLPLa1T2S1H2C9eN8eE
   ieNKwZQxdaFOUZ80+CgXyTGtOWpjz9JwhIquxYlQl6Ex2Y5DP+FCFFS09
   0eY2LU6pu1joZV+DyRrwzH+g7gCt/pPMfLCA0q8ZF+gwTuJuquGMc1McK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="712581"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="712581"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 22:43:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="5257813"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Feb 2024 22:43:14 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWshE-0000CQ-0i;
	Mon, 05 Feb 2024 06:43:12 +0000
Date: Mon, 5 Feb 2024 14:42:47 +0800
From: kernel test robot <lkp@intel.com>
To: Shuo Liu <shuo.a.liu@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	Yu Wang <yu1.wang@intel.com>, Zhao Yakui <yakui.zhao@intel.com>
Subject: [intel-lts:4.19/android_s 2641/30000]
 drivers/vhm/vhm_ioeventfd.c:287:5: error: no previous prototype for function
 'acrn_ioeventfd'
Message-ID: <202402051429.k6XmQ15I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   f2b228e8331cfde18e95b9fdeb61f16ae51d0c48
commit: 7f8e6dad0b3be85a4b5e193de231eb063cfadd8e [2641/30000] vhm: add ioeventfd support for ACRN hypervisor service module
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20240205/202402051429.k6XmQ15I-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240205/202402051429.k6XmQ15I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402051429.k6XmQ15I-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/vhm/vhm_ioeventfd.c:287:5: error: no previous prototype for function 'acrn_ioeventfd' [-Werror,-Wmissing-prototypes]
     287 | int acrn_ioeventfd(uint16_t vmid, struct acrn_ioeventfd *args)
         |     ^
   drivers/vhm/vhm_ioeventfd.c:287:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     287 | int acrn_ioeventfd(uint16_t vmid, struct acrn_ioeventfd *args)
         | ^
         | static 
>> drivers/vhm/vhm_ioeventfd.c:398:5: error: no previous prototype for function 'acrn_ioeventfd_init' [-Werror,-Wmissing-prototypes]
     398 | int acrn_ioeventfd_init(uint16_t vmid)
         |     ^
   drivers/vhm/vhm_ioeventfd.c:398:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     398 | int acrn_ioeventfd_init(uint16_t vmid)
         | ^
         | static 
>> drivers/vhm/vhm_ioeventfd.c:455:6: error: no previous prototype for function 'acrn_ioeventfd_deinit' [-Werror,-Wmissing-prototypes]
     455 | void acrn_ioeventfd_deinit(uint16_t vmid)
         |      ^
   drivers/vhm/vhm_ioeventfd.c:455:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     455 | void acrn_ioeventfd_deinit(uint16_t vmid)
         | ^
         | static 
   3 errors generated.


vim +/acrn_ioeventfd +287 drivers/vhm/vhm_ioeventfd.c

   286	
 > 287	int acrn_ioeventfd(uint16_t vmid, struct acrn_ioeventfd *args)
   288	{
   289		struct vhm_ioeventfd_info *info = NULL;
   290		int ret;
   291	
   292		info = get_ioeventfd_info_by_vm(vmid);
   293		if (!info)
   294			return -ENOENT;
   295	
   296		if (args->flags & ACRN_IOEVENTFD_FLAG_DEASSIGN)
   297			ret = acrn_deassign_ioeventfd(info, args);
   298		else
   299			ret = acrn_assign_ioeventfd(info, args);
   300	
   301		put_ioeventfd_info(info);
   302		return ret;
   303	}
   304	
   305	static struct acrn_vhm_ioeventfd *vhm_ioeventfd_match(
   306			struct vhm_ioeventfd_info *info,
   307			u64 addr, u64 data, int length, int type)
   308	{
   309		struct acrn_vhm_ioeventfd *p = NULL;
   310	
   311		/*
   312		 * Same addr/type/data will be treated as hit, otherwise ignore.
   313		 *   Register PIO[0x100~0x107] with data 0x10 as ioeventfd A, later
   314		 *   request PIO[0x100~0x103] with data 0x10 will hit A.
   315		 */
   316		list_for_each_entry(p, &info->ioeventfds, list) {
   317			if (p->type == type &&
   318				p->addr == addr &&
   319				(p->wildcard || p->data == data))
   320				return p;
   321		}
   322	
   323		return NULL;
   324	}
   325	
   326	static int acrn_ioeventfd_dispatch_ioreq(int client_id,
   327			unsigned long *ioreqs_map)
   328	{
   329		struct vhm_request *req;
   330		struct acrn_vhm_ioeventfd *p;
   331		struct vhm_ioeventfd_info *info;
   332		u64 addr;
   333		u64 val;
   334		int size;
   335		int vcpu;
   336	
   337		info = get_ioeventfd_info_by_client(client_id);
   338		if (!info)
   339			return -EINVAL;
   340	
   341		/* get req buf */
   342		if (!info->req_buf) {
   343			info->req_buf = acrn_ioreq_get_reqbuf(info->vhm_client_id);
   344			if (!info->req_buf) {
   345				pr_err("Failed to get req_buf for client %d\n",
   346						info->vhm_client_id);
   347				put_ioeventfd_info(info);
   348				return -EINVAL;
   349			}
   350		}
   351	
   352		while (1) {
   353			vcpu = find_first_bit(ioreqs_map, info->vcpu_num);
   354			if (vcpu == info->vcpu_num)
   355				break;
   356			req = &info->req_buf[vcpu];
   357			if (atomic_read(&req->processed) == REQ_STATE_PROCESSING &&
   358				req->client == client_id) {
   359				if (req->type == REQ_MMIO) {
   360					if (req->reqs.mmio_request.direction ==
   361							REQUEST_READ) {
   362						/* reading does nothing and return 0 */
   363						req->reqs.mmio_request.value = 0;
   364						goto next_ioreq;
   365					}
   366					addr = req->reqs.mmio_request.address;
   367					size = req->reqs.mmio_request.size;
   368					val = req->reqs.mmio_request.value;
   369				} else {
   370					if (req->reqs.pio_request.direction ==
   371							REQUEST_READ) {
   372						/* reading does nothing and return 0 */
   373						req->reqs.pio_request.value = 0;
   374						goto next_ioreq;
   375					}
   376					addr = req->reqs.pio_request.address;
   377					size = req->reqs.pio_request.size;
   378					val = req->reqs.pio_request.value;
   379				}
   380	
   381				mutex_lock(&info->ioeventfds_lock);
   382				p = vhm_ioeventfd_match(info, addr, val, size,
   383						req->type);
   384				if (p)
   385					eventfd_signal(p->eventfd, 1);
   386				mutex_unlock(&info->ioeventfds_lock);
   387	
   388	next_ioreq:
   389				atomic_set(&req->processed, REQ_STATE_COMPLETE);
   390				acrn_ioreq_complete_request(client_id, vcpu);
   391			}
   392		}
   393	
   394		put_ioeventfd_info(info);
   395		return 0;
   396	}
   397	
 > 398	int acrn_ioeventfd_init(uint16_t vmid)
   399	{
   400		int ret = 0;
   401		char name[16];
   402		struct vm_info vm_info;
   403		struct vhm_ioeventfd_info *info;
   404	
   405		info = get_ioeventfd_info_by_vm(vmid);
   406		if (info) {
   407			put_ioeventfd_info(info);
   408			return -EEXIST;
   409		}
   410	
   411		info = kzalloc(sizeof(struct vhm_ioeventfd_info), GFP_KERNEL);
   412		if (!info)
   413			return -ENOMEM;
   414		snprintf(name, sizeof(name), "ioeventfd-%hu", vmid);
   415		info->vhm_client_id = acrn_ioreq_create_client(vmid,
   416				acrn_ioeventfd_dispatch_ioreq, name);
   417		if (info->vhm_client_id < 0) {
   418			pr_err("Failed to create ioeventfd client for ioreq!\n");
   419			ret = -EINVAL;
   420			goto fail;
   421		}
   422	
   423		ret = vhm_get_vm_info(vmid, &vm_info);
   424		if (ret < 0) {
   425			pr_err("Failed to get vm info for vmid %d\n", vmid);
   426			goto client_fail;
   427		}
   428	
   429		info->vcpu_num = vm_info.max_vcpu;
   430	
   431		ret = acrn_ioreq_attach_client(info->vhm_client_id, 0);
   432		if (ret < 0) {
   433			pr_err("Failed to attach vhm client %d!\n",
   434					info->vhm_client_id);
   435			goto client_fail;
   436		}
   437		mutex_init(&info->ioeventfds_lock);
   438		info->vmid = vmid;
   439		info->refcnt = 1;
   440		INIT_LIST_HEAD(&info->ioeventfds);
   441	
   442		mutex_lock(&vhm_ioeventfds_mutex);
   443		list_add(&info->list, &vhm_ioeventfd_clients);
   444		mutex_unlock(&vhm_ioeventfds_mutex);
   445	
   446		pr_info("ACRN vhm ioeventfd init done!\n");
   447		return 0;
   448	client_fail:
   449		acrn_ioreq_destroy_client(info->vhm_client_id);
   450	fail:
   451		kfree(info);
   452		return ret;
   453	}
   454	
 > 455	void acrn_ioeventfd_deinit(uint16_t vmid)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
