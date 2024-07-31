Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B001AAE00
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jul 2024 09:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722418476; cv=none; b=GB7SOAL8T14fa1NMFrjs8iq3P+ol/pOJjgF+zZJ2LxFZpeQjfmop3bTLhbr1oc0U3aQuUZVVyWjKk/47Uz+7OB2N7DscwPn8+5+NedM4sCNqmwUPX9UmRRZvsdPgy43AIS3dvNrltDiFRDpTEDQJqI7hE6r5JyI4w00yjXR45yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722418476; c=relaxed/simple;
	bh=KlpK0SwHaMTAMXHQEF4K/rCB8PE/T83ED3Fv9638Uko=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=roDUz2a2TXxrd3XZOnc3bygTc0YF+SdNqJ24U5uEpSqcgKyuDtK4zQzYv7LAmDdpZHviJGRBOpo2LBma+KsX2DZo/QyzRFGousG8Vz+0XHPu+d97Kgv3PDyhQJd71YyVjX+w4So0lbBYVfDygGTGZJJ8IqghbyARW5HW/tqF0uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IQNimnP+; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IQNimnP+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722418474; x=1753954474;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KlpK0SwHaMTAMXHQEF4K/rCB8PE/T83ED3Fv9638Uko=;
  b=IQNimnP+oMYNyD8w8BjYVybRweWgPTHWUaWTaKrYTCKtW/Y/jLeUqg3v
   6BbAttshdTqJh4cPeXppfFTmPCfChoU8su+gppUQTLwTOy41glMt+h4ud
   0wlbNHypucM3oITHfR+/AxtPyNtqs5x6qVmCaWdkiGYQbicdE3EH7eNzS
   j3y7toAeew5agxR4MmkDJ40J0DqUWU0C53hvvIQFRVTrZlG6/ETm6lNbV
   zS5ay5gq5USoXm0Co2wD209W+N3IhX/xkcu8FuYzBFYn7QdyO4tNEepyy
   Ho1gch/d8PLtSqk4qVcyYUu1Mp9dpSxeH1dTt6Mk8DPm0w/mycIlknuTN
   w==;
X-CSE-ConnectionGUID: WPJD4wBqQzWx3NSOytGvag==
X-CSE-MsgGUID: SgrGYlH7RCurp5QuEXEUhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="12803296"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="12803296"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 02:34:32 -0700
X-CSE-ConnectionGUID: u0bNwAomTTGlKsqUPXlhzQ==
X-CSE-MsgGUID: R6HRhkQ3Sv+oWjLBOZnPug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="54871123"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 31 Jul 2024 02:34:30 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZ5j1-000u5s-11;
	Wed, 31 Jul 2024 09:34:27 +0000
Date: Wed, 31 Jul 2024 17:34:21 +0800
From: kernel test robot <lkp@intel.com>
To: Philip Yang <Philip.Yang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Felix Kuehling <felix.kuehling@amd.com>
Subject: [linux-next:master 837/1677]
 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:107:10: warning: assignment
 makes pointer from integer without a cast
Message-ID: <202407311751.DspbODml-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   cd19ac2f903276b820f5d0d89de0c896c27036ed
commit: b049504e211e8f4dbcd40434f2dcab2215ea1039 [837/1677] drm/amdkfd: Validate user queue svm memory residency
config: x86_64-randconfig-013-20240731 (https://download.01.org/0day-ci/archive/20240731/202407311751.DspbODml-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240731/202407311751.DspbODml-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407311751.DspbODml-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c: In function 'kfd_queue_buffer_svm_get':
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:107:12: error: implicit declaration of function 'svm_range_from_addr'; did you mean 'svm_range_get_info'? [-Werror=implicit-function-declaration]
      prange = svm_range_from_addr(&p->svms, addr, NULL);
               ^~~~~~~~~~~~~~~~~~~
               svm_range_get_info
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:107:10: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
      prange = svm_range_from_addr(&p->svms, addr, NULL);
             ^
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:111:14: error: dereferencing pointer to incomplete type 'struct svm_range'
      if (!prange->mapped_to_gpu)
                 ^~
   In file included from include/linux/bits.h:22:0,
                    from include/linux/gfp_types.h:5,
                    from include/linux/gfp.h:5,
                    from include/linux/slab.h:16,
                    from drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:25:
   include/linux/compiler_types.h:451:27: error: expression in static assertion is not an integer
    #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
                              ^
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                           ^~~~
   include/linux/container_of.h:20:2: note: in expansion of macro 'static_assert'
     static_assert(__same_type(*(ptr), ((type *)0)->member) || \
     ^~~~~~~~~~~~~
   include/linux/container_of.h:20:16: note: in expansion of macro '__same_type'
     static_assert(__same_type(*(ptr), ((type *)0)->member) || \
                   ^~~~~~~~~~~
   include/linux/list.h:601:2: note: in expansion of macro 'container_of'
     container_of(ptr, type, member)
     ^~~~~~~~~~~~
   include/linux/list.h:612:2: note: in expansion of macro 'list_entry'
     list_entry((ptr)->next, type, member)
     ^~~~~~~~~~
   include/linux/list.h:778:13: note: in expansion of macro 'list_first_entry'
     for (pos = list_first_entry(head, typeof(*pos), member); \
                ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:139:2: note: in expansion of macro 'list_for_each_entry'
     list_for_each_entry(prange, &update_list, update_list)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:451:27: error: expression in static assertion is not an integer
    #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
                              ^
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                           ^~~~
   include/linux/container_of.h:20:2: note: in expansion of macro 'static_assert'
     static_assert(__same_type(*(ptr), ((type *)0)->member) || \
     ^~~~~~~~~~~~~
   include/linux/container_of.h:20:16: note: in expansion of macro '__same_type'
     static_assert(__same_type(*(ptr), ((type *)0)->member) || \
                   ^~~~~~~~~~~
   include/linux/list.h:601:2: note: in expansion of macro 'container_of'
     container_of(ptr, type, member)
     ^~~~~~~~~~~~
   include/linux/list.h:645:2: note: in expansion of macro 'list_entry'
     list_entry((pos)->member.next, typeof(*(pos)), member)
     ^~~~~~~~~~
   include/linux/list.h:780:13: note: in expansion of macro 'list_next_entry'
          pos = list_next_entry(pos, member))
                ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:139:2: note: in expansion of macro 'list_for_each_entry'
     list_for_each_entry(prange, &update_list, update_list)
     ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c: In function 'kfd_queue_buffer_svm_put':
   include/linux/container_of.h:20:47: error: dereferencing pointer to incomplete type 'struct svm_range'
     static_assert(__same_type(*(ptr), ((type *)0)->member) || \
                                                  ^
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                           ^~~~
   include/linux/container_of.h:20:2: note: in expansion of macro 'static_assert'
     static_assert(__same_type(*(ptr), ((type *)0)->member) || \
     ^~~~~~~~~~~~~
   include/linux/container_of.h:20:16: note: in expansion of macro '__same_type'
     static_assert(__same_type(*(ptr), ((type *)0)->member) || \
                   ^~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:165:12: note: in expansion of macro 'container_of'
      prange = container_of(node, struct svm_range, it_node);
               ^~~~~~~~~~~~
   include/linux/compiler_types.h:451:27: error: expression in static assertion is not an integer
    #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
                              ^
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                           ^~~~
   include/linux/container_of.h:20:2: note: in expansion of macro 'static_assert'
     static_assert(__same_type(*(ptr), ((type *)0)->member) || \
     ^~~~~~~~~~~~~
   include/linux/container_of.h:20:16: note: in expansion of macro '__same_type'
     static_assert(__same_type(*(ptr), ((type *)0)->member) || \
                   ^~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:165:12: note: in expansion of macro 'container_of'
      prange = container_of(node, struct svm_range, it_node);
               ^~~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5:0,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/uapi/linux/sysinfo.h:5,
                    from include/uapi/linux/kernel.h:5,
                    from include/linux/cache.h:5,
                    from include/linux/slab.h:15,
                    from drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:25:
   include/linux/stddef.h:16:32: error: invalid use of undefined type 'struct svm_range'
    #define offsetof(TYPE, MEMBER) __builtin_offsetof(TYPE, MEMBER)
                                   ^


vim +107 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c

    86	
    87	static int kfd_queue_buffer_svm_get(struct kfd_process_device *pdd, u64 addr, u64 size)
    88	{
    89		struct kfd_process *p = pdd->process;
    90		struct list_head update_list;
    91		struct svm_range *prange;
    92		int ret = -EINVAL;
    93	
    94		INIT_LIST_HEAD(&update_list);
    95		addr >>= PAGE_SHIFT;
    96		size >>= PAGE_SHIFT;
    97	
    98		mutex_lock(&p->svms.lock);
    99	
   100		/*
   101		 * range may split to multiple svm pranges aligned to granularity boundaery.
   102		 */
   103		while (size) {
   104			uint32_t gpuid, gpuidx;
   105			int r;
   106	
 > 107			prange = svm_range_from_addr(&p->svms, addr, NULL);
   108			if (!prange)
   109				break;
   110	
   111			if (!prange->mapped_to_gpu)
   112				break;
   113	
   114			r = kfd_process_gpuid_from_node(p, pdd->dev, &gpuid, &gpuidx);
   115			if (r < 0)
   116				break;
   117			if (!test_bit(gpuidx, prange->bitmap_access) &&
   118			    !test_bit(gpuidx, prange->bitmap_aip))
   119				break;
   120	
   121			if (!(prange->flags & KFD_IOCTL_SVM_FLAG_GPU_ALWAYS_MAPPED))
   122				break;
   123	
   124			list_add(&prange->update_list, &update_list);
   125	
   126			if (prange->last - prange->start + 1 >= size) {
   127				size = 0;
   128				break;
   129			}
   130	
   131			size -= prange->last - prange->start + 1;
   132			addr += prange->last - prange->start + 1;
   133		}
   134		if (size) {
   135			pr_debug("[0x%llx 0x%llx] not registered\n", addr, addr + size - 1);
   136			goto out_unlock;
   137		}
   138	
   139		list_for_each_entry(prange, &update_list, update_list)
   140			atomic_inc(&prange->queue_refcount);
   141		ret = 0;
   142	
   143	out_unlock:
   144		mutex_unlock(&p->svms.lock);
   145		return ret;
   146	}
   147	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
