Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88F82C11ED
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 17:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766252916; cv=none; b=LqRDWYJW2ICvL1uAFhO+IVUiQkUBh5OYt0kVltmJo8luKuDc8hgeXXTCEhSsO4rFll9RP8iWb7qwEBdQ9HpScmQKv1dC+YULjk3uxV2z/XRoXeRoLcOj3xhELtjQbTNb8c7xqzTvmrdc/alesiVeuNgfcd0AsKkaR+wzfz+kdbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766252916; c=relaxed/simple;
	bh=lCtHJx/MjGngEdhVfEkjFdHZFu9/+5K5NFvCGyShL6E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ARhdqCmyPmw3zgBLuHlfOWGhidg4dRct8C01VPxg+mreqAOAxx2wpWK2UOoNXcFXoFZ5ow2/X+X3igcThJTWr2NGxClCiOgySdnCxXNlGm3O50HzJOEMlkQOce0A63mkD+wetnoZz8U369QbA/Qgis7PIMp+0r58TDHif4xWU8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ay1CrNqp; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ay1CrNqp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766252915; x=1797788915;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lCtHJx/MjGngEdhVfEkjFdHZFu9/+5K5NFvCGyShL6E=;
  b=ay1CrNqp1YM6qJsT7m4E6U9YNnVQRIypqeDTEcQETVZ7vQeHqon7me8k
   kjjKZd35X5UaClIReGelepjKadCTehnJUgP58Xkp3K7TynR+HDtM61UrD
   do1S7oXu7H1+ekLY82JQEWx3jk79ZYCPb8UxOss0mqWThMVYpl1Wpd6bT
   qKhwQgf/yk26xY8tGl9JND76ZiZpHXZyo50C3ttYxKW6nGHpZGhw8wUjU
   S6VcVxJbmqigSzI/eMUEGFloLiM8/zU/r5aGgqVWqCl9DV/zi2zMMlog0
   v9CArzpusk/SKoe7NeuynDAY8QLKxDK7eMmZFPCVW+4tEgHp5H5MXq8cE
   w==;
X-CSE-ConnectionGUID: itLDckZDTVeVUGd++0cnQA==
X-CSE-MsgGUID: GuQ+tF/AT36hfdODQ0G4cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="70751772"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="70751772"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 09:48:33 -0800
X-CSE-ConnectionGUID: McU3l1rjQFKjt96vo9Sccg==
X-CSE-MsgGUID: nytRfKsRTJOUR2Gh5E6khQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="198894023"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Dec 2025 09:48:32 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX14A-000000004yA-0vyK;
	Sat, 20 Dec 2025 17:48:30 +0000
Date: Sun, 21 Dec 2025 01:47:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3542/3542]
 drivers/crypto/ccp/hygon/hct.c:1333:15: warning: no previous prototype for
 function 'hct_pin_memory'
Message-ID: <202512210747.245hMJvq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   04473ee9ed912a16fff0d8846ad565bbf3d63c77
commit: c74ae2c5da57becf3f41c596d79b3dd30fa1baa6 [3542/3542] hct: add mediated ccp driver support for hygon crypto technology.
config: x86_64-randconfig-012-20251215 (https://download.01.org/0day-ci/archive/20251221/202512210747.245hMJvq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210747.245hMJvq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210747.245hMJvq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/crypto/ccp/hygon/hct.c:20:
   In file included from include/linux/vfio.h:12:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2242:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/crypto/ccp/hygon/hct.c:1333:15: warning: no previous prototype for function 'hct_pin_memory' [-Wmissing-prototypes]
    1333 | struct page **hct_pin_memory(struct hct_private *private, unsigned long uaddr,
         |               ^
   drivers/crypto/ccp/hygon/hct.c:1333:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1333 | struct page **hct_pin_memory(struct hct_private *private, unsigned long uaddr,
         | ^
         | static 
   drivers/crypto/ccp/hygon/hct.c:1730:45: error: no member named 'numa_node' in 'struct device'
    1730 |         *node = hct_data.iommu[page_idx].pdev->dev.numa_node;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   2 warnings and 1 error generated.


vim +/hct_pin_memory +1333 drivers/crypto/ccp/hygon/hct.c

  1332	
> 1333	struct page **hct_pin_memory(struct hct_private *private, unsigned long uaddr,
  1334				unsigned long ulen, unsigned long *n)
  1335	{
  1336		unsigned long npages, size;
  1337		int npinned;
  1338		struct page **pages;
  1339		unsigned long first, last;
  1340	
  1341		if (ulen == 0 || uaddr + ulen < uaddr)
  1342			return NULL;
  1343	
  1344		first = (uaddr & PAGE_MASK) >> PAGE_SHIFT;
  1345		last = ((uaddr + ulen - 1) & PAGE_MASK) >> PAGE_SHIFT;
  1346		npages = (last - first + 1);
  1347	
  1348		if (WARN_ON_ONCE(npages > INT_MAX))
  1349			return NULL;
  1350	
  1351		size = npages * sizeof(struct page *);
  1352		if (size > PAGE_SIZE)
  1353			pages = vmalloc(size);
  1354		else
  1355			pages = kmalloc(size, GFP_KERNEL);
  1356	
  1357		if (!pages)
  1358			return NULL;
  1359	
  1360		/* Pin the user virtual address. */
  1361		npinned = pin_user_pages_fast(uaddr, npages, FOLL_WRITE, pages);
  1362		if (npinned != npages)
  1363			goto err;
  1364	
  1365		*n = npages;
  1366		return pages;
  1367	
  1368	err:
  1369		if (npinned > 0)
  1370			unpin_user_pages(pages, npinned);
  1371		kvfree(pages);
  1372		return NULL;
  1373	}
  1374	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
