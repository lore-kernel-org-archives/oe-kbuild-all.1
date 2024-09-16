Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AD38C13
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Sep 2024 02:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726452441; cv=none; b=RUjfqFPjuH/FGbqT1d7JiXCKIZRVgbvyHPG6euiY8lUxA7nmwDtolQD9EDUx7ODcYqnrqJySvTGkJuO9NhGM9IjAJwDAgJ69hJYjxMx8A7sHuIdCsZOLx3vkdMCxmJvhhCUFS9tT7lRWZcPOTGmnCF6TFZvZudXDkcNT3oBhD1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726452441; c=relaxed/simple;
	bh=Q+El8txvTxMFfKHDmWMzCfb1Bc2ciGOSuOfpIp15ZD8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W4m9wmJlj6W3gjOQeiQ+M0bW5S/8ImgfVGsdxCSsDt0s7jz0mntXvopFUlCads6j8F7g4yovYpkf9TNnjubyFNBHiMimyKp46x/OY4IRFnetcqB6LOyNWKuVMglZYlRjC4UGGxh2mlOSDkUXVQ0EFuNLwhSR4oHezMYuUwVPWGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UDX6uVYh; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UDX6uVYh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726452439; x=1757988439;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q+El8txvTxMFfKHDmWMzCfb1Bc2ciGOSuOfpIp15ZD8=;
  b=UDX6uVYh0g9XzxuFtSl7CdVSz29e9+DLjSQgPB+DZx743JgR2s8uqbkD
   oLdGiqmExC4yvoVkJdKZ5HELXK0JlOfkrULqm5pgHEvwcwHmu1NbWY+Pm
   oFYXgwlb+K++a7tp9cSgDMXbqzO1B/H1NBzc0ySf7RG5WDVBSxqd7avw/
   CsXnJrab/9joaayvc96qVxbWLGTS3+mzMLxV74LUnXeyeRjbYFbilXA1Z
   GDNrvK/FnQXW17he1v+spZ1sH0ur5ShepoicCpmqHn7wivnQy8LDqm8zF
   wPU9vZaMeM719ZJiiOpLiw/nhqb1vdmnLEIIRbJrL/jqzm4dp9HQzX72j
   Q==;
X-CSE-ConnectionGUID: a6XnKwpcS5m3aUIwSgrunA==
X-CSE-MsgGUID: n8Lq5QjpQxW/2VCxJz3Ouw==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="24762712"
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="24762712"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 19:07:18 -0700
X-CSE-ConnectionGUID: LLA2dta1SSm5WTpFEouikw==
X-CSE-MsgGUID: sabJ/kA0Q6ibTKbsnNHVaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="73570111"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Sep 2024 19:07:16 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sq190-0009EU-1W;
	Mon, 16 Sep 2024 02:07:14 +0000
Date: Mon, 16 Sep 2024 10:07:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 12967/15124]
 drivers/virtio/virtio_wl.c:738:30: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202409160934.YPwmAt9t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   ad8dacd5a4263ddf51685be3c2190a341c26869b
commit: 987a5d2358202f067f74a3f35bebd3b1da289fd3 [12967/15124] CHROMIUM: virtwl: add virtwl driver
config: x86_64-randconfig-122-20240916 (https://download.01.org/0day-ci/archive/20240916/202409160934.YPwmAt9t-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240916/202409160934.YPwmAt9t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409160934.YPwmAt9t-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/virtio/virtio_wl.c:217:21: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] id @@     got restricted __le32 [usertype] vfd_id @@
   drivers/virtio/virtio_wl.c:217:21: sparse:     expected unsigned int [usertype] id
   drivers/virtio/virtio_wl.c:217:21: sparse:     got restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:243:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] size @@     got restricted __le32 [usertype] size @@
   drivers/virtio/virtio_wl.c:243:19: sparse:     expected unsigned int [usertype] size
   drivers/virtio/virtio_wl.c:243:19: sparse:     got restricted __le32 [usertype] size
   drivers/virtio/virtio_wl.c:244:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] pfn @@     got restricted __le64 [usertype] pfn @@
   drivers/virtio/virtio_wl.c:244:18: sparse:     expected unsigned long long [usertype] pfn
   drivers/virtio/virtio_wl.c:244:18: sparse:     got restricted __le64 [usertype] pfn
   drivers/virtio/virtio_wl.c:245:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] flags @@     got restricted __le32 [usertype] flags @@
   drivers/virtio/virtio_wl.c:245:20: sparse:     expected unsigned int [usertype] flags
   drivers/virtio/virtio_wl.c:245:20: sparse:     got restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:258:39: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long id @@     got restricted __le32 [usertype] vfd_id @@
   drivers/virtio/virtio_wl.c:258:39: sparse:     expected unsigned long id
   drivers/virtio/virtio_wl.c:258:39: sparse:     got restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:292:42: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long id @@     got restricted __le32 [usertype] vfd_id @@
   drivers/virtio/virtio_wl.c:292:42: sparse:     expected unsigned long id
   drivers/virtio/virtio_wl.c:292:42: sparse:     got restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:320:20: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:320:20: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:320:20: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:498:24: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:503:26: sparse: sparse: cast from restricted __le32
   drivers/virtio/virtio_wl.c:505:46: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:529:58: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:538:32: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:574:44: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:580:32: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:618:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:618:30: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:618:30: sparse:     got int
   drivers/virtio/virtio_wl.c:619:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] vfd_id @@     got unsigned int [usertype] id @@
   drivers/virtio/virtio_wl.c:619:28: sparse:     expected restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:619:28: sparse:     got unsigned int [usertype] id
>> drivers/virtio/virtio_wl.c:738:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] kind @@     got int @@
   drivers/virtio/virtio_wl.c:738:30: sparse:     expected restricted __le32 [usertype] kind
   drivers/virtio/virtio_wl.c:738:30: sparse:     got int
   drivers/virtio/virtio_wl.c:741:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] kind @@     got int @@
   drivers/virtio/virtio_wl.c:741:30: sparse:     expected restricted __le32 [usertype] kind
   drivers/virtio/virtio_wl.c:741:30: sparse:     got int
>> drivers/virtio/virtio_wl.c:742:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 [usertype] seqno @@     got restricted __le32 [usertype] @@
   drivers/virtio/virtio_wl.c:742:31: sparse:     expected restricted __le64 [usertype] seqno
   drivers/virtio/virtio_wl.c:742:31: sparse:     got restricted __le32 [usertype]
>> drivers/virtio/virtio_wl.c:780:45: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] kind @@     got unsigned int [assigned] [usertype] kind @@
   drivers/virtio/virtio_wl.c:780:45: sparse:     expected restricted __le32 [usertype] kind
   drivers/virtio/virtio_wl.c:780:45: sparse:     got unsigned int [assigned] [usertype] kind
   drivers/virtio/virtio_wl.c:783:48: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] kind @@     got unsigned int [assigned] [usertype] kind @@
   drivers/virtio/virtio_wl.c:783:48: sparse:     expected restricted __le32 [usertype] kind
   drivers/virtio/virtio_wl.c:783:48: sparse:     got unsigned int [assigned] [usertype] kind
   drivers/virtio/virtio_wl.c:905:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:905:29: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:905:29: sparse:     got int
   drivers/virtio/virtio_wl.c:917:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:917:37: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:917:37: sparse:     got int
   drivers/virtio/virtio_wl.c:929:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] vfd_id @@     got unsigned int [usertype] id @@
   drivers/virtio/virtio_wl.c:929:27: sparse:     expected restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:929:27: sparse:     got unsigned int [usertype] id
>> drivers/virtio/virtio_wl.c:930:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] vfd_count @@     got unsigned long [assigned] [usertype] vfd_count @@
   drivers/virtio/virtio_wl.c:930:30: sparse:     expected restricted __le32 [usertype] vfd_count
   drivers/virtio/virtio_wl.c:930:30: sparse:     got unsigned long [assigned] [usertype] vfd_count
   drivers/virtio/virtio_wl.c:963:45: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int type @@     got restricted __le32 [usertype] type @@
   drivers/virtio/virtio_wl.c:963:45: sparse:     expected unsigned int type
   drivers/virtio/virtio_wl.c:963:45: sparse:     got restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:998:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:998:36: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:998:36: sparse:     got int
   drivers/virtio/virtio_wl.c:999:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] vfd_id @@     got unsigned int [usertype] id @@
   drivers/virtio/virtio_wl.c:999:34: sparse:     expected restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:999:34: sparse:     got unsigned int [usertype] id
   drivers/virtio/virtio_wl.c:1000:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got unsigned int [usertype] flags @@
   drivers/virtio/virtio_wl.c:1000:33: sparse:     expected restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:1000:33: sparse:     got unsigned int [usertype] flags
   drivers/virtio/virtio_wl.c:1169:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] vfd_id @@     got unsigned int [usertype] id @@
   drivers/virtio/virtio_wl.c:1169:26: sparse:     expected restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:1169:26: sparse:     got unsigned int [usertype] id
   drivers/virtio/virtio_wl.c:1172:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:1172:36: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:1172:36: sparse:     got int
   drivers/virtio/virtio_wl.c:1173:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got int @@
   drivers/virtio/virtio_wl.c:1173:33: sparse:     expected restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:1173:33: sparse:     got int
   drivers/virtio/virtio_wl.c:1176:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:1176:36: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:1176:36: sparse:     got int
   drivers/virtio/virtio_wl.c:1177:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got int @@
   drivers/virtio/virtio_wl.c:1177:33: sparse:     expected restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:1177:33: sparse:     got int
   drivers/virtio/virtio_wl.c:1181:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:1181:36: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:1181:36: sparse:     got int
   drivers/virtio/virtio_wl.c:1182:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] size @@     got unsigned int @@
   drivers/virtio/virtio_wl.c:1182:32: sparse:     expected restricted __le32 [usertype] size
   drivers/virtio/virtio_wl.c:1182:32: sparse:     got unsigned int
   drivers/virtio/virtio_wl.c:1185:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:1185:36: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:1185:36: sparse:     got int
   drivers/virtio/virtio_wl.c:1186:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got int @@
   drivers/virtio/virtio_wl.c:1186:33: sparse:     expected restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:1186:33: sparse:     got int
   drivers/virtio/virtio_wl.c:1189:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:1189:36: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:1189:36: sparse:     got int
   drivers/virtio/virtio_wl.c:1190:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got int @@
   drivers/virtio/virtio_wl.c:1190:33: sparse:     expected restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:1190:33: sparse:     got int
   drivers/virtio/virtio_wl.c:1195:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:1195:44: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:1195:44: sparse:     got int
   drivers/virtio/virtio_wl.c:1217:44: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int type @@     got restricted __le32 [usertype] type @@
   drivers/virtio/virtio_wl.c:1217:44: sparse:     expected unsigned int type
   drivers/virtio/virtio_wl.c:1217:44: sparse:     got restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:1221:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] size @@     got restricted __le32 [usertype] size @@
   drivers/virtio/virtio_wl.c:1221:19: sparse:     expected unsigned int [usertype] size
   drivers/virtio/virtio_wl.c:1221:19: sparse:     got restricted __le32 [usertype] size
   drivers/virtio/virtio_wl.c:1222:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] pfn @@     got restricted __le64 [usertype] pfn @@
   drivers/virtio/virtio_wl.c:1222:18: sparse:     expected unsigned long long [usertype] pfn
   drivers/virtio/virtio_wl.c:1222:18: sparse:     got restricted __le64 [usertype] pfn
   drivers/virtio/virtio_wl.c:1223:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] flags @@     got restricted __le32 [usertype] flags @@
   drivers/virtio/virtio_wl.c:1223:20: sparse:     expected unsigned int [usertype] flags
   drivers/virtio/virtio_wl.c:1223:20: sparse:     got restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:1449:17: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __poll_t ( *poll )( ... ) @@     got unsigned int ( * )( ... ) @@
   drivers/virtio/virtio_wl.c:1449:17: sparse:     expected restricted __poll_t ( *poll )( ... )
   drivers/virtio/virtio_wl.c:1449:17: sparse:     got unsigned int ( * )( ... )
   drivers/virtio/virtio_wl.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression

vim +738 drivers/virtio/virtio_wl.c

   725	
   726	static int encode_fence(struct dma_fence *fence,
   727				struct virtio_wl_ctrl_vfd_send_vfd_v2 *vfd_id)
   728	{
   729		const char *name = fence->ops->get_driver_name(fence);
   730	
   731		// We only support virtgpu based fences. Since all virtgpu fences are
   732		// in the same context, merging sync_files will always reduce to a
   733		// single virtgpu fence.
   734		if (strcmp(name, "virtio_gpu") != 0)
   735			return -EBADFD;
   736	
   737		if (dma_fence_is_signaled(fence)) {
 > 738			vfd_id->kind =
   739				VIRTIO_WL_CTRL_VFD_SEND_KIND_VIRTGPU_SIGNALED_FENCE;
   740		} else {
   741			vfd_id->kind = VIRTIO_WL_CTRL_VFD_SEND_KIND_VIRTGPU_FENCE;
 > 742			vfd_id->seqno = cpu_to_le32(fence->seqno);
   743		}
   744		return 0;
   745	}
   746	
   747	static int encode_vfd_ids_foreign(struct virtwl_vfd **vfds,
   748					  struct dma_buf **virtgpu_dma_bufs,
   749					  struct dma_fence **virtgpu_dma_fence,
   750					  size_t vfd_count,
   751					  struct virtio_wl_ctrl_vfd_send_vfd *ids,
   752					  struct virtio_wl_ctrl_vfd_send_vfd_v2 *ids_v2)
   753	{
   754		size_t i;
   755		int ret;
   756	
   757		for (i = 0; i < vfd_count; i++) {
   758			uint32_t kind = UINT_MAX;
   759			uint32_t id = 0;
   760	
   761			if (vfds[i]) {
   762				kind = VIRTIO_WL_CTRL_VFD_SEND_KIND_LOCAL;
   763				id = vfds[i]->id;
   764			} else if (virtgpu_dma_bufs[i]) {
   765				ret = get_dma_buf_id(virtgpu_dma_bufs[i],
   766						     &id);
   767				if (ret)
   768					return ret;
   769				kind = VIRTIO_WL_CTRL_VFD_SEND_KIND_VIRTGPU;
   770			} else if (virtgpu_dma_fence[i]) {
   771				ret = encode_fence(virtgpu_dma_fence[i],
   772						   ids_v2 + i);
   773				if (ret)
   774					return ret;
   775			} else {
   776				return -EBADFD;
   777			}
   778			if (kind != UINT_MAX) {
   779				if (ids) {
 > 780					ids[i].kind = kind;
   781					ids[i].id = cpu_to_le32(id);
   782				} else {
   783					ids_v2[i].kind = kind;
   784					ids_v2[i].id = cpu_to_le32(id);
   785				}
   786			}
   787		}
   788		return 0;
   789	}
   790	#endif
   791	
   792	static int virtwl_vfd_send(struct file *filp, const char __user *buffer,
   793						       u32 len, int *vfd_fds)
   794	{
   795		struct virtwl_vfd *vfd = filp->private_data;
   796		struct virtwl_info *vi = vfd->vi;
   797		struct fd vfd_files[VIRTWL_SEND_MAX_ALLOCS] = { { 0 } };
   798		struct virtwl_vfd *vfds[VIRTWL_SEND_MAX_ALLOCS] = { 0 };
   799	#ifdef SEND_VIRTGPU_RESOURCES
   800		struct dma_buf *virtgpu_dma_bufs[VIRTWL_SEND_MAX_ALLOCS] = { 0 };
   801		struct dma_fence *virtgpu_dma_fence[VIRTWL_SEND_MAX_ALLOCS] = { 0 };
   802		bool foreign_id = false;
   803	#endif
   804		size_t vfd_count = 0;
   805		size_t vfd_ids_size;
   806		size_t ctrl_send_size;
   807		struct virtio_wl_ctrl_vfd_send *ctrl_send;
   808		u8 *vfd_ids;
   809		u8 *out_buffer;
   810		struct completion finish_completion;
   811		struct scatterlist out_sg;
   812		struct scatterlist in_sg;
   813		struct sg_table sgt;
   814		struct vm_struct *area;
   815		bool vmalloced;
   816		int ret;
   817		int i;
   818	
   819		if (vfd_fds) {
   820			for (i = 0; i < VIRTWL_SEND_MAX_ALLOCS; i++) {
   821				struct fd vfd_file;
   822				int fd = vfd_fds[i];
   823	
   824				if (fd < 0)
   825					break;
   826	
   827				vfd_file = fdget(vfd_fds[i]);
   828				if (!vfd_file.file) {
   829					ret = -EBADFD;
   830					goto put_files;
   831				}
   832	
   833				if (vfd_file.file->f_op == &virtwl_vfd_fops) {
   834					vfd_files[i] = vfd_file;
   835	
   836					vfds[i] = vfd_file.file->private_data;
   837					if (vfds[i] && vfds[i]->id) {
   838						vfd_count++;
   839						continue;
   840					}
   841	
   842					ret = -EINVAL;
   843					goto put_files;
   844				} else {
   845					struct dma_buf *dma_buf = ERR_PTR(-EINVAL);
   846					struct dma_fence *dma_fence = ERR_PTR(-EINVAL);
   847					bool handled = false;
   848	
   849	#ifdef SEND_VIRTGPU_RESOURCES
   850					dma_buf = dma_buf_get(vfd_fds[i]);
   851					dma_fence = vi->use_send_vfd_v2
   852						? sync_file_get_fence(vfd_fds[i])
   853						: ERR_PTR(-EINVAL);
   854					handled = !IS_ERR(dma_buf) ||
   855						  !IS_ERR(dma_fence);
   856	
   857					if (!IS_ERR(dma_buf)) {
   858						virtgpu_dma_bufs[i] = dma_buf;
   859					} else {
   860						virtgpu_dma_fence[i] = dma_fence;
   861					}
   862	
   863					foreign_id = true;
   864					vfd_count++;
   865	#endif
   866					fdput(vfd_file);
   867					if (!handled) {
   868						ret = IS_ERR(dma_buf) ?
   869							PTR_ERR(dma_buf) :
   870							PTR_ERR(dma_fence);
   871						goto put_files;
   872					}
   873				}
   874			}
   875		}
   876	
   877		/* Empty writes always succeed. */
   878		if (len == 0 && vfd_count == 0)
   879			return 0;
   880	
   881		vfd_ids_size = vfd_count * sizeof(__le32);
   882	#ifdef SEND_VIRTGPU_RESOURCES
   883		if (foreign_id) {
   884			vfd_ids_size = vfd_count * (vi->use_send_vfd_v2
   885				? sizeof(struct virtio_wl_ctrl_vfd_send_vfd_v2)
   886				: sizeof(struct virtio_wl_ctrl_vfd_send_vfd));
   887		}
   888	#endif
   889		ctrl_send_size = sizeof(*ctrl_send) + vfd_ids_size + len;
   890		vmalloced = false;
   891		if (ctrl_send_size < PAGE_SIZE)
   892			ctrl_send = kmalloc(ctrl_send_size, GFP_KERNEL);
   893		else {
   894			vmalloced = true;
   895			ctrl_send = vmalloc(ctrl_send_size);
   896		}
   897		if (!ctrl_send) {
   898			ret = -ENOMEM;
   899			goto put_files;
   900		}
   901	
   902		vfd_ids = (u8 *)ctrl_send + sizeof(*ctrl_send);
   903		out_buffer = (u8 *)ctrl_send + ctrl_send_size - len;
   904	
   905		ctrl_send->hdr.type = VIRTIO_WL_CMD_VFD_SEND;
   906		ctrl_send->hdr.flags = 0;
   907	#ifdef SEND_VIRTGPU_RESOURCES
   908		if (foreign_id) {
   909			struct virtio_wl_ctrl_vfd_send_vfd *v1 = NULL;
   910			struct virtio_wl_ctrl_vfd_send_vfd_v2 *v2 = NULL;
   911	
   912			if (vi->use_send_vfd_v2)
   913				v2 = (struct virtio_wl_ctrl_vfd_send_vfd_v2 *) vfd_ids;
   914			else
   915				v1 = (struct virtio_wl_ctrl_vfd_send_vfd *) vfd_ids;
   916	
   917			ctrl_send->hdr.type = VIRTIO_WL_CMD_VFD_SEND_FOREIGN_ID;
   918			ret = encode_vfd_ids_foreign(vfds,
   919				virtgpu_dma_bufs, virtgpu_dma_fence, vfd_count,
   920				v1, v2);
   921		} else {
   922			ret = encode_vfd_ids(vfds, vfd_count, (__le32 *)vfd_ids);
   923		}
   924	#else
   925		ret = encode_vfd_ids(vfds, vfd_count, (__le32 *)vfd_ids);
   926	#endif
   927		if (ret)
   928			goto free_ctrl_send;
   929		ctrl_send->vfd_id = vfd->id;
 > 930		ctrl_send->vfd_count = vfd_count;
   931	
   932		if (copy_from_user(out_buffer, buffer, len)) {
   933			ret = -EFAULT;
   934			goto free_ctrl_send;
   935		}
   936	
   937		init_completion(&finish_completion);
   938		if (!vmalloced) {
   939			sg_init_one(&out_sg, ctrl_send, ctrl_send_size);
   940			sg_init_one(&in_sg, ctrl_send,
   941			    sizeof(struct virtio_wl_ctrl_hdr));
   942			ret = vq_queue_out(vi, &out_sg, &in_sg, &finish_completion,
   943			    filp->f_flags & O_NONBLOCK);
   944		} else {
   945			area = find_vm_area(ctrl_send);
   946			ret = sg_alloc_table_from_pages(&sgt, area->pages,
   947			    area->nr_pages, 0, ctrl_send_size, GFP_KERNEL);
   948			if (ret)
   949				goto free_ctrl_send;
   950	
   951			sg_init_table(&in_sg, 1);
   952			sg_set_page(&in_sg, area->pages[0],
   953			    sizeof(struct virtio_wl_ctrl_hdr), 0);
   954	
   955			ret = vq_queue_out(vi, sgt.sgl, &in_sg, &finish_completion,
   956			    filp->f_flags & O_NONBLOCK);
   957		}
   958		if (ret)
   959			goto free_sgt;
   960	
   961		wait_for_completion(&finish_completion);
   962	
   963		ret = virtwl_resp_err(ctrl_send->hdr.type);
   964	
   965	free_sgt:
   966		if (vmalloced)
   967			sg_free_table(&sgt);
   968	free_ctrl_send:
   969		kvfree(ctrl_send);
   970	put_files:
   971		for (i = 0; i < VIRTWL_SEND_MAX_ALLOCS; i++) {
   972			if (vfd_files[i].file)
   973				fdput(vfd_files[i]);
   974	#ifdef SEND_VIRTGPU_RESOURCES
   975			if (virtgpu_dma_bufs[i])
   976				dma_buf_put(virtgpu_dma_bufs[i]);
   977			if (virtgpu_dma_fence[i])
   978				dma_fence_put(virtgpu_dma_fence[i]);
   979	#endif
   980		}
   981		return ret;
   982	}
   983	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
