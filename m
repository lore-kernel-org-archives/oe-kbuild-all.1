Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEFF2EC090
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Sep 2025 18:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756749905; cv=none; b=UME07BCWsTCWlLQWYXl6sucBu7siYd44cX4ePDtDvibC58c6W61abbSEdTiTYDDjJ7L/mizWMi2fp7tLg2BUhVQV9dtxQoQ5rcrtpZ7wd/4ghryr41zgN7XGiu6PfHNJCisGv7wtmzId9WaDD1mbOI5doZ7P2OlrcKlrmzD4QeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756749905; c=relaxed/simple;
	bh=ueN/7bVllR/ebPALjdCrRr1w1EulH96nPQILyhfeLIw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p/yJK1FlSUmTHw7wjqk+2k6KkZ7R3O5dVdUflguywRRB6Blr+JxHNTu8xJOobQCvPkgco3aCWpw6lE3CdIGLWVcZVtqGaU/J3K1NUl7GLLbPr78R2/oz8BTVbBv3f76PafTNRlaLdx9P932Kf4JRwnTEB3ckFc3SYQ/3EDHlHOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lunxd+Ht; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lunxd+Ht"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756749903; x=1788285903;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ueN/7bVllR/ebPALjdCrRr1w1EulH96nPQILyhfeLIw=;
  b=lunxd+Htg6qIRc5ZUz7Bk9bl2CmFL0e8jVZ31H4Fn29dxyYh4Z381iqD
   JdH3cskkOLU5CTBI6mUNYIklQjetGVy8d4+VYXXkwdTiMUyzXZ6eUYb45
   d0SqMyKR5WC74RCfow68lI763Tzjeo+wgRZ9NOlUbEDMTLflp2f21THAa
   xMPZRtocL9sJe5mYzlMkjXWDeWu8otM2seFgS6MRx36WPUwRffPZ7wpxW
   M9DWX3hzYrcu7T5KKY4iyAvSpBCmv4RuhheWAdRvAvflz4ZbnO/bMLwA8
   Ftm4MsS1JpVYlli/wNQEFAIQZbB9OaVTGBpWBzaG5lQoIXfX8TO2T+A/k
   Q==;
X-CSE-ConnectionGUID: q6oP0N+WQvaWVY0jcAyiNA==
X-CSE-MsgGUID: wQEjQ8UnS8SCqZcc0cB9fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="58041163"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="58041163"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 11:05:02 -0700
X-CSE-ConnectionGUID: dmCPnaZdSoGc4Rwo5dKSCA==
X-CSE-MsgGUID: GAmtgawESCWj+qa6F9KB9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="208277540"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 01 Sep 2025 11:05:01 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ut8su-0000t5-1W;
	Mon, 01 Sep 2025 18:04:22 +0000
Date: Tue, 2 Sep 2025 02:03:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1740/1740] mm/mem_reliable.c:272:5:
 sparse: sparse: symbol 'reliable_debug_handler' was not declared. Should it
 be static?
Message-ID: <202509020104.GWuHy81V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   54968bf23106d2ac31ede8dca013a7fadeb3dd75
commit: 851a3ff0b4de68403c9a344c3d5378aa590705b7 [1740/1740] mm: Introduce proc interface to control memory reliable features
config: arm64-randconfig-r121-20250729 (https://download.01.org/0day-ci/archive/20250902/202509020104.GWuHy81V-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce: (https://download.01.org/0day-ci/archive/20250902/202509020104.GWuHy81V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509020104.GWuHy81V-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/mem_reliable.c:52:14: sparse: sparse: restricted gfp_t degrades to integer
   mm/mem_reliable.c:199:5: sparse: sparse: symbol 'reliable_limit_handler' was not declared. Should it be static?
>> mm/mem_reliable.c:272:5: sparse: sparse: symbol 'reliable_debug_handler' was not declared. Should it be static?
   mm/mem_reliable.c:199:5: warning: no previous prototype for 'reliable_limit_handler' [-Wmissing-prototypes]
     199 | int reliable_limit_handler(struct ctl_table *table, int write,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   mm/mem_reliable.c:272:5: warning: no previous prototype for 'reliable_debug_handler' [-Wmissing-prototypes]
     272 | int reliable_debug_handler(struct ctl_table *table, int write,
         |     ^~~~~~~~~~~~~~~~~~~~~~

vim +/reliable_debug_handler +272 mm/mem_reliable.c

   271	
 > 272	int reliable_debug_handler(struct ctl_table *table, int write,
   273		void __user *buffer, size_t *length, loff_t *ppos)
   274	{
   275		unsigned long old_ctrl_bits, new_ctrl_bits;
   276		static DEFINE_MUTEX(reliable_debug_mutex);
   277		int ret;
   278	
   279		mutex_lock(&reliable_debug_mutex);
   280		old_ctrl_bits = mem_reliable_ctrl_bits;
   281		ret = proc_doulongvec_minmax(table, write, buffer, length, ppos);
   282		if (ret == 0 && write) {
   283			if (mem_reliable_ctrl_bits > (1 << CTRL_BITS_SHIFT) - 1) {
   284				mem_reliable_ctrl_bits = old_ctrl_bits;
   285				mutex_unlock(&reliable_debug_mutex);
   286	
   287				return -EINVAL;
   288			}
   289	
   290			new_ctrl_bits = mem_reliable_ctrl_bits;
   291			mem_reliable_ctrl_bits = old_ctrl_bits;
   292			if (!!test_bit(MEM_RELIABLE_ALL, &new_ctrl_bits))
   293				mem_reliable_parse_ctrl_bits(new_ctrl_bits);
   294			else
   295				mem_reliable_disable_all();
   296		}
   297	
   298		mutex_unlock(&reliable_debug_mutex);
   299	
   300		return ret;
   301	}
   302	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
