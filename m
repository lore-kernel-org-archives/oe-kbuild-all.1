Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B1421638D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jul 2026 09:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783589795; cv=none; b=njc3IuOaPBxn+HjLfXa4LuBAe8AhyzfWG5lBckYA4TIlH/D7MHW5pWbvhP36ZiUldZL8O8XvamVecso5pKHE2QvEEZ7aPISdBZCLcxhzyfD+B8u9Q893SPNULC0oqooqwuzTlRC6hV8iyusmWj3Jdlp9VTq7/yfrBrYmmScdoD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783589795; c=relaxed/simple;
	bh=QE0SsoARi2Af7MC0mkEPLccfn894V3Y5Y2/fav5uCAA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LEaX32kA84tHy7/GXHdIzLgjPSaaft0yYtBuxdPXMJrJjMoozhGYdUBbyKhRTXy35vQ1TaPoLrTDlFczj+NO3tCeomgCkUfTd/n3OTPBYJUBZb43Ob/7awWnizqA3brbvyE1dyc8B3AV9boez6UWkLayMSD6fJLUIMWvyt+igts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IWWU/zpl; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IWWU/zpl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783589793; x=1815125793;
  h=date:from:to:cc:subject:message-id;
  bh=QE0SsoARi2Af7MC0mkEPLccfn894V3Y5Y2/fav5uCAA=;
  b=IWWU/zplbAUriAp+ysoC0+8+6GbZJXhTT9lyxwokd+leHt6IQOSySvLO
   gxxhBSOsnyP1+Q2vhS04tXwHNemn2dAIA60HMt3MtrhUDiWm9fHGxYOQt
   8u7kgxT4eZQbPIgHKjBU3bZtxycD9vR/nwjW4j+RMr72adH9n452Jloir
   WxVytK0g3NbhcuRIJY7o7P12xjqacw3bOGq0nIKxRfvnvSklfPDHINVUP
   Y8yUpHQNhUn0cheAU4fPY7K4t4UOj+6pmsjgFb5iF1d05NzNb7FbjodUJ
   +85dAtoXbRCPItL6GsmWJsShRk/ExRyA/W/8l3Y8Kg3B4kWwQBM4+tqNo
   A==;
X-CSE-ConnectionGUID: K2j9Uc6KTpGckD2SL33oNA==
X-CSE-MsgGUID: IXEjak3YRBKo0Z/QNNCK5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83240765"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="83240765"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 02:36:32 -0700
X-CSE-ConnectionGUID: YOrF9lqpTBeznHBx5IyhiA==
X-CSE-MsgGUID: e9a9Rp51Sh+dRcfDTD/tMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="255192002"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 09 Jul 2026 02:36:31 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whlBE-00000000HVf-0R5b;
	Thu, 09 Jul 2026 09:36:28 +0000
Date: Thu, 09 Jul 2026 17:36:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vbabka:objext_split 9/14] mm/slab.h:664:45: error: 'struct
 slabobj_ext' has no member named '_objcg'
Message-ID: <202607091705.XjP7d8IF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vlastimil,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git objext_split
head:   8bd682e28958694beba958e2a3af94c6e1789819
commit: 0be66c218c46f308612a25af648bda07e7f4c8c3 [9/14] mm/slab: abstract obj_ext.objcg access
config: arc-randconfig-002-20260709 (https://download.01.org/0day-ci/archive/20260709/202607091705.XjP7d8IF-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607091705.XjP7d8IF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607091705.XjP7d8IF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/slab_common.c:35:
   mm/slab.h: In function 'slab_obj_ext_get_objcg':
>> mm/slab.h:664:45: error: 'struct slabobj_ext' has no member named '_objcg'
     objcg = slab_obj_ext(slab, obj_exts, index)->_objcg;
                                                ^~
   mm/slab.h: In function 'slab_obj_ext_set_objcg':
   mm/slab.h:685:21: error: 'struct slabobj_ext' has no member named '_objcg'
     objcg_old = obj_ext->_objcg;
                        ^~
   mm/slab.h:688:10: error: 'struct slabobj_ext' has no member named '_objcg'
      obj_ext->_objcg = objcg_new;
             ^~


vim +664 mm/slab.h

   654	
   655	static inline struct obj_cgroup *slab_obj_ext_get_objcg(struct slab *slab,
   656						unsigned long obj_exts, void *obj)
   657	{
   658		struct obj_cgroup *objcg;
   659		unsigned int index;
   660	
   661		index = obj_to_index(slab->slab_cache, slab, obj);
   662	
   663		get_slab_obj_exts(obj_exts);
 > 664		objcg = slab_obj_ext(slab, obj_exts, index)->_objcg;
   665		put_slab_obj_exts(obj_exts);
   666	
   667		return objcg;
   668	}
   669	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
