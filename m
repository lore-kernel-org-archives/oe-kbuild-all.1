Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A982522A7
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Sep 2025 22:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756766761; cv=none; b=GmCt9AKmFu34h5SiqG+ga3skDoMdi8HG4okBXAGBGdnu1XFnxWbUFyrGXCkLjLx/kiXcuhXpr/ftLxSk2ziDAMFiRZdNaYjAW+h/qb704QfwzdANbCqfbTPNDWNGi02jbdjRRnqq4lY1rvtXirb3p3tV639dDxoTdQkgRrEIF/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756766761; c=relaxed/simple;
	bh=FWHqHmNrDWcEhRHIVCw1dfZWjDy2LEc1n4bTSsbGOZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sZ26aFP4FvYZMP+Qs7V/zRbPkgA7BD9h01NjfwenbNmux0YCYAcRIfGYB8BrbPH9nY5UrnfQqoMjhXpuW/3f1CK+orxGQ6IjWQ2yQGi+aqOjLXcZiTzA8AGXe/GD+C0Vamqd1rmpK7raR9p+PdBK6CH9nG7DzE4m4BjNBCt/by0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jtjxs6NJ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jtjxs6NJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756766760; x=1788302760;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FWHqHmNrDWcEhRHIVCw1dfZWjDy2LEc1n4bTSsbGOZ0=;
  b=Jtjxs6NJKmXmwWfR3I2CkuH73SEn9XpgymhpfT16VbDjBdXxuardHOQ0
   pnuCedb09MVYXa5BUIS6RWMeiDh2qAcENZ28WFv6Usxzo91Q9N7AonVmk
   HNFme2n2hCgAP2Dm0xWA4ZJ6cbMYUTwQYoQc8XfBgIQaNU7rIt6ZGCAw/
   4I8a9QGsk1ENCEcCMUHop0oVKRr6chp3xoWSyQlAKhzetuDDgmE9pBoeR
   QmTe4xTP/wFDq9qSa4EnPvCDjFbmcXkf01CrZaXcgeFK56ns7IpSry7b/
   v32v9JO8u/7kvtq0h2MGsqkB4jkiFxQo+58eW8ro5u3KkpPWE0OkeuB1j
   Q==;
X-CSE-ConnectionGUID: UOd9AYbJSWCDhJjOquveSg==
X-CSE-MsgGUID: QyvTfq1NSYaVVxmEhuxhTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="58054665"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="58054665"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 15:45:59 -0700
X-CSE-ConnectionGUID: MwaReN4hTlqRXJYDBVW10w==
X-CSE-MsgGUID: YjRFd2pCSniWxa9J8sGrtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="175475542"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 01 Sep 2025 15:45:58 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utDHf-0001AF-1m;
	Mon, 01 Sep 2025 22:45:55 +0000
Date: Tue, 2 Sep 2025 06:45:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ze Zuo <zuoze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2833/2833] mm/mem_sampling.c:37:6: warning: no
 previous prototype for function 'mem_sampling_record_cb_register'
Message-ID: <202509020626.0JaPbty4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ze,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   79889009eb342a5b0ea9448c7b77e8ed8550a74b
commit: cc5f4f44852f9eb4feb22a40cbb4e3d1b10c36a0 [2833/2833] mm_monitor/mm_spe: Add PMU based memory sampling abstract layer
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250902/202509020626.0JaPbty4-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509020626.0JaPbty4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509020626.0JaPbty4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/mem_sampling.c:37:6: warning: no previous prototype for function 'mem_sampling_record_cb_register' [-Wmissing-prototypes]
      37 | void mem_sampling_record_cb_register(mem_sampling_record_cb_type cb)
         |      ^
   mm/mem_sampling.c:37:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      37 | void mem_sampling_record_cb_register(mem_sampling_record_cb_type cb)
         | ^
         | static 
>> mm/mem_sampling.c:54:6: warning: no previous prototype for function 'mem_sampling_record_cb_unregister' [-Wmissing-prototypes]
      54 | void mem_sampling_record_cb_unregister(mem_sampling_record_cb_type cb)
         |      ^
   mm/mem_sampling.c:54:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      54 | void mem_sampling_record_cb_unregister(mem_sampling_record_cb_type cb)
         | ^
         | static 
   mm/mem_sampling.c:67:6: warning: no previous prototype for function 'mem_sampling_process' [-Wmissing-prototypes]
      67 | void mem_sampling_process(void)
         |      ^
   mm/mem_sampling.c:67:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      67 | void mem_sampling_process(void)
         | ^
         | static 
   3 warnings generated.


vim +/mem_sampling_record_cb_register +37 mm/mem_sampling.c

    36	
  > 37	void mem_sampling_record_cb_register(mem_sampling_record_cb_type cb)
    38	{
    39		struct mem_sampling_record_cb_list_entry *cb_entry, *tmp;
    40	
    41		list_for_each_entry_safe(cb_entry, tmp, &mem_sampling_record_cb_list, list) {
    42			if (cb_entry->cb == cb)
    43				return;
    44		}
    45	
    46		cb_entry = kmalloc(sizeof(struct mem_sampling_record_cb_list_entry), GFP_KERNEL);
    47		if (!cb_entry)
    48			return;
    49	
    50		cb_entry->cb = cb;
    51		list_add(&(cb_entry->list), &mem_sampling_record_cb_list);
    52	}
    53	
  > 54	void mem_sampling_record_cb_unregister(mem_sampling_record_cb_type cb)
    55	{
    56		struct mem_sampling_record_cb_list_entry *cb_entry, *tmp;
    57	
    58		list_for_each_entry_safe(cb_entry, tmp, &mem_sampling_record_cb_list, list) {
    59			if (cb_entry->cb == cb) {
    60				list_del(&cb_entry->list);
    61				kfree(cb_entry);
    62				return;
    63			}
    64		}
    65	}
    66	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
