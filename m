Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B3A8488
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Dec 2024 07:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734507562; cv=none; b=aY8xih19A2YG87PqMB1hxBz7OKTFYeBjzT0HZDoIaonPRbPyvVSa7fX/xUrNur6NP9D8zR9PgIb0JOObjwqh82dZNkblYwxeFxPPcQdG/Efhy56BY4MOXv1sqhrGo4/zYTdLW08dc71Z8jUTA8pW+T7CubSU7bRPUJxi3lxqUn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734507562; c=relaxed/simple;
	bh=vXyLm49jTtQ53hjS60Z7le8E+QFseOZJzAo4m9PV1W0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iPv1Py2kUJUf/lsWyEUjQbjtjxQtsM9IipJ44fRTFS2D9LC5bgLdKzX46HVww2jq+ITHJolapqlk2Tu/pnnH1pBNqAAuSJoGpZsIvhl2EFBYhWELWx3D5pcJiukXXFcTZNsITMYGjY2TmcNDR//26VUCAluFG1bijcWb5HlYq6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SfGjjM7q; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SfGjjM7q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734507561; x=1766043561;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vXyLm49jTtQ53hjS60Z7le8E+QFseOZJzAo4m9PV1W0=;
  b=SfGjjM7qKXTe6im5nR9Y43sr90VI0QaFP1+dgqkC2pLWJ2+EorhF2NG4
   CjX+0GMC0cKJMelpTnqXNEie/VQoapJCHjG1by04y3uMOdeIXXP+MsmTX
   jI0rX+mb2m3MHJywCihG/ELKmIqQQ5gpPsEFgWmXZK53xzV3WPMJNFf3M
   czeURJbIy8rUif5+75DyfxJfEI1jlOdlajCeRE+3pWv8ketM/LRllCJes
   xrjtg2FCZoNGpAqqy/qmOhEwR5/Iufud428rv1VUpm+XGp5ysROcFlJ4v
   +iuqb6nLAoxiw3WLErA7A25W2LHbTkZKcJbj9oT18GUrH24XJe2q+u/Z9
   g==;
X-CSE-ConnectionGUID: /TIPgNuqRMSaRtbIicRspA==
X-CSE-MsgGUID: C35RCq2JQaWvN0AMhtQHhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="45975375"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="45975375"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 23:39:20 -0800
X-CSE-ConnectionGUID: RCaDzEntQW22TouDrK3kIA==
X-CSE-MsgGUID: ZJJ2vZTkSZKv7ZeYKgmvOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="98357274"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Dec 2024 23:39:18 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNoeK-000GBS-14;
	Wed, 18 Dec 2024 07:39:16 +0000
Date: Wed, 18 Dec 2024 15:39:12 +0800
From: kernel test robot <lkp@intel.com>
To: Piotr =?iso-8859-1?Q?Pi=F3rkowski?= <piotr.piorkowski@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Junxiao Chang <junxiao.chang@intel.com>,
	"Zawawi, Muhammad Zul Husni" <muhammad.zul.husni.zawawi@intel.com>
Subject: [intel-lts:6.12/linux 857/985]
 drivers/gpu/drm/i915/gt/iov/selftests/selftest_mock_iov_ggtt.c:318:27:
 warning: implicit conversion from 'unsigned long long' to 'size_t' (aka
 'unsigned int') changes value from 4294967296 to 0
Message-ID: <202412181544.Py10CSwa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.12/linux
head:   cc39c53db6bcd7f04407f1cae883e5d0af6db765
commit: 9b622d237b5e58a4487cdd78f397ee43161ebab0 [857/985] drm/i915/iov: Shadow GGTT mock selftestes
config: i386-buildonly-randconfig-006-20241218 (https://download.01.org/0day-ci/archive/20241218/202412181544.Py10CSwa-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241218/202412181544.Py10CSwa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412181544.Py10CSwa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/gt/iov/intel_iov_ggtt.c:7:
   In file included from drivers/gpu/drm/i915/gt/iov/intel_iov_ggtt.h:9:
   In file included from drivers/gpu/drm/i915/gt/intel_gtt.h:19:
   In file included from include/linux/io-mapping.h:33:
   In file included from arch/x86/include/asm/iomap.h:10:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/gpu/drm/i915/gt/iov/intel_iov_ggtt.c:589:
>> drivers/gpu/drm/i915/gt/iov/selftests/selftest_mock_iov_ggtt.c:318:27: warning: implicit conversion from 'unsigned long long' to 'size_t' (aka 'unsigned int') changes value from 4294967296 to 0 [-Wconstant-conversion]
     318 |         const size_t ggtt_size = SZ_4G;
         |                      ~~~~~~~~~   ^~~~~
   include/linux/sizes.h:46:18: note: expanded from macro 'SZ_4G'
      46 | #define SZ_4G                           _AC(0x100000000, ULL)
         |                                         ^~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/const.h:21:18: note: expanded from macro '_AC'
      21 | #define _AC(X,Y)        __AC(X,Y)
         |                         ^~~~~~~~~
   include/uapi/linux/const.h:20:20: note: expanded from macro '__AC'
      20 | #define __AC(X,Y)       (X##Y)
         |                          ^~~~
   <scratch space>:53:1: note: expanded from here
      53 | 0x100000000ULL
         | ^~~~~~~~~~~~~~
   2 warnings generated.


vim +318 drivers/gpu/drm/i915/gt/iov/selftests/selftest_mock_iov_ggtt.c

   313	
   314	static int mock_ggtt_shadow_restore_new_vfid(void *arg)
   315	{
   316		struct intel_iov *iov = arg;
   317		const u64 start_ggtt = 0;
 > 318		const size_t ggtt_size = SZ_4G;
   319		const unsigned int vfid = VFID(1);
   320		const unsigned int new_vfid = VFID(2);
   321		struct drm_mm_node *old_node, *new_node;
   322		gen8_pte_t *buf, *origin_buf, *shadow_ggtt, *hw_ptes;
   323		size_t size;
   324		u64 ggtt_addr;
   325		int err;
   326	
   327		err = mock_ggtt_shadow_init_test(iov);
   328		if (err < 0)
   329			return err;
   330	
   331		old_node = mock_provisioning_ggtt_init(iov, vfid, start_ggtt, ggtt_size);
   332		new_node = mock_provisioning_ggtt_init(iov, new_vfid, start_ggtt, ggtt_size);
   333	
   334		size = ggtt_size_to_ptes_size(ggtt_size);
   335	
   336		iov->pf.ggtt.selftest.mock_update_ptes = mock_update_ptes;
   337		iov->pf.ggtt.selftest.ptes = kvzalloc(size, GFP_KERNEL);
   338		if (!iov->pf.ggtt.selftest.ptes) {
   339			err = -ENOMEM;
   340			goto out_fini;
   341		}
   342	
   343		origin_buf = kvzalloc(size, GFP_KERNEL);
   344		if (!origin_buf) {
   345			err = -ENOMEM;
   346			goto out_free_ptes;
   347		}
   348	
   349		err = intel_iov_ggtt_shadow_vf_alloc(iov, vfid, old_node);
   350		if (err < 0)
   351			goto out_free_buf;
   352	
   353		err = intel_iov_ggtt_shadow_vf_alloc(iov, new_vfid, new_node);
   354		if (err < 0)
   355			goto out_free_vf;
   356	
   357		buf = origin_buf;
   358		for_each_ggtt_page(ggtt_addr, old_node)
   359			*(buf++) = make_pte(ggtt_addr, 0);
   360	
   361		intel_iov_ggtt_shadow_restore(iov, new_vfid, origin_buf, size,
   362						   FIELD_PREP(I915_GGTT_RESTORE_PTES_VFID_MASK, new_vfid) |
   363						   I915_GGTT_RESTORE_PTES_NEW_VFID);
   364	
   365		shadow_ggtt = iov->pf.ggtt.shadows_ggtt[new_vfid].ptes;
   366		hw_ptes = iov->pf.ggtt.selftest.ptes;
   367		for_each_ggtt_page(ggtt_addr, new_node) {
   368			gen8_pte_t current_shadow_pte = *(shadow_ggtt++);
   369			gen8_pte_t current_hw_pte = *(hw_ptes++);
   370			gen8_pte_t expected_pte = make_pte(ggtt_addr, new_vfid);
   371	
   372			if (current_shadow_pte != expected_pte || current_hw_pte != expected_pte) {
   373				IOV_SELFTEST_ERROR(iov,
   374						   "PTE values for GGTT address %llx, not match with expected value, expected: %#llx from shadow GGTT: %#llx, from HW: %#llx\n",
   375						   ggtt_addr, expected_pte, current_shadow_pte,
   376						   current_hw_pte);
   377				err = -EINVAL;
   378				break;
   379			}
   380		}
   381	
   382		intel_iov_ggtt_shadow_vf_free(iov, new_vfid);
   383	out_free_vf:
   384		intel_iov_ggtt_shadow_vf_free(iov, vfid);
   385	out_free_buf:
   386		kvfree(origin_buf);
   387	out_free_ptes:
   388		kvfree(iov->pf.ggtt.selftest.ptes);
   389		iov->pf.ggtt.selftest.ptes = NULL;
   390	out_fini:
   391		mock_ggtt_shadow_fini_test(iov);
   392		return err;
   393	}
   394	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
