Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AAA2DA76A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jan 2026 20:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767991426; cv=none; b=s47nsc0QWRkp4HTh1PhnIwB9xok9CRTA4EDE3FygEZ7ywDxvXon9J1vYKf2dA6b2U7M91fsMqUrnXIct4nT91tOSU++A+NY24NgBxuRInPj/okTznkSl8pxZzUxl0HXO8gA5KUQVtWmZtQ7gkwrkpbY9j7rgRdMQmrHS+gzOY4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767991426; c=relaxed/simple;
	bh=+Fbvgeyhai1rFzdFngRE6BAptc+eU6baD/bXvrAp9qo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FzxgwE93ZmdTo8f3PWL1dsJuM+TpfAmuP5f5duqrs58E4l0LFcpbGu47k58qsrcdvPo8x4Ltwry0T+JUX9pyswPNz/n4Si6CkwNdRrWBbYjC5W3K1nbySHdcMVTvrTLrVvwBO942qwgXWHte2aA9uAz6pbUdw+CA0c0bvyIowWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q+TwXwb7; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q+TwXwb7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767991425; x=1799527425;
  h=date:from:to:cc:subject:message-id;
  bh=+Fbvgeyhai1rFzdFngRE6BAptc+eU6baD/bXvrAp9qo=;
  b=Q+TwXwb7FNlCxlRhy1BF5/R19a7tqSyrcwoGWGObg41ZNErwJyEXOq09
   4kSRvu/CwfBKQEdy1NJypgx5ZmT31qH59WMpv1cuPc6q7+3+Q+RwAl6LH
   ioIdCfHtf5+Gbk19ytCA2vLoO0YipsbQYzDvl4dFuWefQL0c3l3mDFfSl
   EsHLrh5a3XisUL3LmnVVh03z13lkPypTGMg2J33gnJC3kbVJYyXjbpDq/
   jeNZQPVXVvRgamgOR2rLzCPVMfarwLf4U6K2KhPga3ZW3IAYShN9iBkvZ
   8ymYuMM0rJbHBKU4VXHIwIW1FnXZindUpGK7v7YIVhg2b33zQFSCJvNQ+
   Q==;
X-CSE-ConnectionGUID: biGU3O4tT+e9mfZyuy8pEg==
X-CSE-MsgGUID: f7MnLk7YQ0urOaRiAxHfXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="69111409"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; 
   d="scan'208";a="69111409"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 12:43:44 -0800
X-CSE-ConnectionGUID: uQEmWxOkR227wjimrLVkUQ==
X-CSE-MsgGUID: VsYpwi5QSTSa+ZBZVuTGBQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 09 Jan 2026 12:43:43 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veJKe-000000007i4-3duj;
	Fri, 09 Jan 2026 20:43:40 +0000
Date: Sat, 10 Jan 2026 04:43:09 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-CWF-perf-cstate-ANBZ29394 1/1]
 mm/vmalloc.c:2490:14: warning: no previous prototype for
 'get_vm_area_page_order'
Message-ID: <202601100413.jYdn3BF8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Mike,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-CWF-perf-cstate-ANBZ29394
head:   22a56eb800e9adccae1d234a42b2e3f2abd3bb1a
commit: c331f3e9d0bb0872f05c4e55269bac3b27418062 [1/1] kho: add support for preserving vmalloc allocations
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20260110/202601100413.jYdn3BF8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260110/202601100413.jYdn3BF8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601100413.jYdn3BF8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/vmalloc.c:2490:14: warning: no previous prototype for 'get_vm_area_page_order' [-Wmissing-prototypes]
    2490 | unsigned int get_vm_area_page_order(struct vm_struct *vm)
         |              ^~~~~~~~~~~~~~~~~~~~~~


vim +/get_vm_area_page_order +2490 mm/vmalloc.c

  2489	
> 2490	unsigned int get_vm_area_page_order(struct vm_struct *vm)
  2491	{
  2492		return vm_area_page_order(vm);
  2493	}
  2494	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
