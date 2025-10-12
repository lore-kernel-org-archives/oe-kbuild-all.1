Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED84236453
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Oct 2025 10:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760266320; cv=none; b=PiPRgKIUxtAKDgDn9+gi3wNH/OYu7xDij/+jvl1SYyekxC33eiccg3Ac3FkUr50jihnwS6nY5+sscdz2TC5WF+Dj5K2TMrq7joH/YjQA18amZnkbiO+obue0/xaO0WJq18M6I6zPniTBugJpfVK0XhJl9o4cOJgPXRpSXetXvVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760266320; c=relaxed/simple;
	bh=AZ8A1DYQGK3D90NUqJKNVUgLdLbxXd2uNVGLjrCfqGw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zq+Rjf8mn6NY7rc7G7au2LFrxNK93SDGBrj1dBesaehBYmFpF+07Cn1cgZfHEh1XTcV8x4s0iNfRIL3UZNdr+by1S2eLJvjdcTnhRl/wsdA3U22fcOjiHyg2/wsDBed1kJRKU3CeNQ1WLoTt0Yo0TVrS6JqJ3To2p0Clq5gv01Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VijaHtRC; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VijaHtRC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760266319; x=1791802319;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AZ8A1DYQGK3D90NUqJKNVUgLdLbxXd2uNVGLjrCfqGw=;
  b=VijaHtRCKvUKqlsWFALUloDmobhKQN0JpPUyN2lRC50DFEuOQL8wnNFF
   kabWclU49u3Vi4TP4k3iM3vlQkVuaxgq6SYZJCP49vdsjtHeV5GNMyeCm
   xF692HVn96mmgP6GH93K1AmyWIpACJJgmrQmNz62Y7lFyu0nNOFQvT9Q3
   UHlmSQMyaV0duQ06ggvG8JSAJ7Sj2tpvAYqwIMUtfQBXSw6I7470sfgag
   7xgvDUQA60Ed99uHHPwKhP/h2bp5M38Ajcook0qYNqBcFRtlYM/T4oM2K
   Xn/uWnURvGJQDX93zWyvtYk83+2BkLk4th0tLZp9cpfQUUPDyxCeiTndk
   A==;
X-CSE-ConnectionGUID: eOoXAPiyTh6YM/5l4q1znA==
X-CSE-MsgGUID: tf54qoXjSrCzQj3rLFTqjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="62462440"
X-IronPort-AV: E=Sophos;i="6.19,223,1754982000"; 
   d="scan'208";a="62462440"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2025 03:51:58 -0700
X-CSE-ConnectionGUID: TyiUJQjeTwGgt2JEkHwbxg==
X-CSE-MsgGUID: 0bRyxF1tQmiIn+gljUjPfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,223,1754982000"; 
   d="scan'208";a="185369110"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Oct 2025 03:51:57 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7tgA-0004LL-1Q;
	Sun, 12 Oct 2025 10:51:54 +0000
Date: Sun, 12 Oct 2025 18:51:26 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 7/7]
 drivers/crypto/ccp/hygon/ccp-mdev.c:1141:15: warning: no previous prototype
 for function 'ccp_pin_memory'
Message-ID: <202510121841.3LOELsj2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   5336ef262bba5f735f3e10ee9db242ec2fe527fb
commit: 7d5a8373cc44b49065d18853dfbef3f16430c467 [7/7] anolis: crypto: ccp: add ccp-mdev functionality to the ccp module.
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251012/202510121841.3LOELsj2-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251012/202510121841.3LOELsj2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510121841.3LOELsj2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/ccp/hygon/ccp-mdev.c:1141:15: warning: no previous prototype for function 'ccp_pin_memory' [-Wmissing-prototypes]
    1141 | struct page **ccp_pin_memory(struct ccp_private *private, unsigned long uaddr,
         |               ^
   drivers/crypto/ccp/hygon/ccp-mdev.c:1141:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1141 | struct page **ccp_pin_memory(struct ccp_private *private, unsigned long uaddr,
         | ^
         | static 
   1 warning generated.


vim +/ccp_pin_memory +1141 drivers/crypto/ccp/hygon/ccp-mdev.c

  1140	
> 1141	struct page **ccp_pin_memory(struct ccp_private *private, unsigned long uaddr,
  1142				unsigned long ulen, unsigned long *n)
  1143	{
  1144		struct page **pages;
  1145		unsigned long npages, size;
  1146		unsigned long first, last;
  1147		int npinned;
  1148	
  1149		if (ulen == 0 || uaddr + ulen < uaddr)
  1150			return NULL;
  1151	
  1152		first = (uaddr & PAGE_MASK) >> PAGE_SHIFT;
  1153		last = ((uaddr + ulen - 1) & PAGE_MASK) >> PAGE_SHIFT;
  1154		npages = (last - first + 1);
  1155	
  1156		if (WARN_ON_ONCE(npages > INT_MAX))
  1157			return NULL;
  1158	
  1159		size = npages * sizeof(struct page *);
  1160		if (size > PAGE_SIZE)
  1161			pages = vmalloc(size);
  1162		else
  1163			pages = kmalloc(size, GFP_KERNEL);
  1164	
  1165		if (!pages)
  1166			return NULL;
  1167	
  1168		/* Pin the user virtual address. */
  1169		npinned = pin_user_pages_fast(uaddr, npages, FOLL_WRITE, pages);
  1170		if (npinned != npages)
  1171			goto err;
  1172	
  1173		*n = npages;
  1174		return pages;
  1175	
  1176	err:
  1177		if (npinned > 0)
  1178			unpin_user_pages(pages, npinned);
  1179		kvfree(pages);
  1180		return NULL;
  1181	}
  1182	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
