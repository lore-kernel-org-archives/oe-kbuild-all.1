Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75498171BB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Mar 2026 23:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774568551; cv=none; b=rI4CmIzFlw+el/zEBLri1UMJvTpsVNKAYGAtwWkpHGS3QEzM3MW/FIRzRzJ0q554xjvynf4RUl9nM+xAHZZlfEUboGc0N8gycldkBHBtzL/SrH1scjVP52yJnu3qP5VDX4UCQVqXEzdFASNt67MczWerUX0IH9aYo8tKSEERLJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774568551; c=relaxed/simple;
	bh=DVgdqKnMWNFyThOMGFd/+EWXPj0UcVxJWcvBvTKWHPI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AeOAZnhXmVJC8/zJ2QRa4K0wK5BH6vKlhVmjS2pOBKYC8P7S034fPCQZ+dQn0gdLI8CGWFohkj4ZZOU1mloGn+CIiOLZH02g6MRKNC8IAsJHhpMQ5JVb7YJoZo45PnArcGb6EKhG/DdxmrzdRkzs/e4ZHLl46KSOWLvfEmcyRXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bROWFXxI; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bROWFXxI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774568549; x=1806104549;
  h=date:from:to:cc:subject:message-id;
  bh=DVgdqKnMWNFyThOMGFd/+EWXPj0UcVxJWcvBvTKWHPI=;
  b=bROWFXxImOnGWFFZ86/wYpIOwSNlUsrig7H3KwB10SQxk8L/bL8lcdsw
   dRARdewO69m0iZtUvVBoSNjHvPom1R2FPE6BkYgCy2NRfLnNCx7JIWxMn
   erqalW6/ngOVk3mt+C+yn4EMtxfvIQZYXEmVPtWeO3+Bi7fHFuwQWCS7p
   eMQcTahvZmF03LA7l91VwvdH9h1lBQkoHoEADC9GeLYSK9pracNTjc6nO
   SRFbqdQ3XvnJhHbuEcWCQfdMo5jlQBgudRtu5jxrZnrvRhd/loPPcBggU
   omhlx3kaNTSBwXfb+tWElAkzFaPsbuu9xIAZ2OggS6A2zJYb+scYeSA5Q
   w==;
X-CSE-ConnectionGUID: MFSjB5LfQAW4XYtKjELwkA==
X-CSE-MsgGUID: e63cthjhToa/NLY6d7hKtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="85946461"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="85946461"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 16:42:28 -0700
X-CSE-ConnectionGUID: 9pvTTMDBRfa1qiRN1DqsOQ==
X-CSE-MsgGUID: 2X1c2Wl1R5qmVuVJeyWqmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="226780273"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Mar 2026 16:42:26 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5uLH-000000009Uz-351P;
	Thu, 26 Mar 2026 23:42:23 +0000
Date: Fri, 27 Mar 2026 07:42:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 1/1] fs/proc/vmcore.c:131:45:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202603270746.sO3gIxTu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   767574e87d5c797ccebbf3b513b0fac4e5102be7
commit: a8a917058faf4abaec9fb614bb6d5f8fe3529ec6 [1/1] proc/vmcore: fix clearing user buffer by properly using clear_user()
config: arm-randconfig-r134-20260325 (https://download.01.org/0day-ci/archive/20260327/202603270746.sO3gIxTu-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603270746.sO3gIxTu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603270746.sO3gIxTu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/proc/vmcore.c:131:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got char *buf @@
   fs/proc/vmcore.c:131:45: sparse:     expected void [noderef] __user *to
   fs/proc/vmcore.c:131:45: sparse:     got char *buf

vim +131 fs/proc/vmcore.c

   104	
   105	/* Reads a page from the oldmem device from given offset. */
   106	ssize_t read_from_oldmem(char *buf, size_t count,
   107				 u64 *ppos, int userbuf,
   108				 bool encrypted)
   109	{
   110		unsigned long pfn, offset;
   111		size_t nr_bytes;
   112		ssize_t read = 0, tmp;
   113	
   114		if (!count)
   115			return 0;
   116	
   117		offset = (unsigned long)(*ppos % PAGE_SIZE);
   118		pfn = (unsigned long)(*ppos / PAGE_SIZE);
   119	
   120		do {
   121			if (count > (PAGE_SIZE - offset))
   122				nr_bytes = PAGE_SIZE - offset;
   123			else
   124				nr_bytes = count;
   125	
   126			/* If pfn is not ram, return zeros for sparse dump files */
   127			if (pfn_is_ram(pfn) == 0) {
   128				tmp = 0;
   129				if (!userbuf)
   130					memset(buf, 0, nr_bytes);
 > 131				else if (clear_user(buf, nr_bytes))
   132					tmp = -EFAULT;
   133			} else {
   134				if (encrypted)
   135					tmp = copy_oldmem_page_encrypted(pfn, buf,
   136									 nr_bytes,
   137									 offset,
   138									 userbuf);
   139				else
   140					tmp = copy_oldmem_page(pfn, buf, nr_bytes,
   141							       offset, userbuf);
   142			}
   143			if (tmp < 0)
   144				return tmp;
   145	
   146			*ppos += nr_bytes;
   147			count -= nr_bytes;
   148			buf += nr_bytes;
   149			read += nr_bytes;
   150			++pfn;
   151			offset = 0;
   152		} while (count);
   153	
   154		return read;
   155	}
   156	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
