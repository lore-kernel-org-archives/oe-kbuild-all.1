Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03EB9635
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 00:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735344547; cv=none; b=oB9cX/OKRh3XGPOYgY3D7ZEzTYWW4k+9X6mduG6ZaRsHvOn3TOpw/tpj6LQWNshOhnQIBe/4BttkAKDHubzjYbfdAErVN/5vnsZ4xN8zPBQJfVYB/92o+YR3+zc7QgXxKUcaWLeFEWF4IXKTLYgd2fyisMJDIDBCopMB/1QWynQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735344547; c=relaxed/simple;
	bh=MLdJxF/AUU2USp5HwIiUqTyfEnpsBaip9RUhxIPF1KY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b9gazUzHIhGMs0SmO4whtxQJGZ6zGk6hTuGsPifiRx31PQw634hmrJO8ZKFCswAHyuKvg0bhqA5xpEpjWxFFFV6RQZluKJ75sudMF05DXTMqVJSEzuvZBnAXpOTmMEPE+gM2CjRKQ139RVKaCvsduM9M0ua0jZ83SB/VUqhVjZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J7F0xuzG; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J7F0xuzG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735344545; x=1766880545;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MLdJxF/AUU2USp5HwIiUqTyfEnpsBaip9RUhxIPF1KY=;
  b=J7F0xuzG5R81zH0tO1WtS5cfGRvez8lePCVx2N/weuONWgvs7iwkZxj4
   EDfZvzrYF9HaH9tIPGS/lkh6uR3HRZz5cgDj4R0lnmjaTAr495vtWhl2X
   ZPHo43RSgqGoYYKQRlJnuIkPDt8egM29AgIw13cCEA0yFfcEeh/+FmL5z
   ND+/Co7jRjAxi0ezM4XLEmZ07lGPioiWFeqgoxcCfHb7StlUqVqpi/VIA
   lfF4dOUKtgogLfQe7ZXcQWFcqwFDt2f3TP9k7ZvkFwFNz9Yjf6Le/5ncz
   YQtZWJlxgLbpH3uLkTpHdvsQN5fPFasvgQTzAnXYKzeQcQA/qq3QyZvCj
   g==;
X-CSE-ConnectionGUID: 7dny8B1MQcmmDc6GVPVWpQ==
X-CSE-MsgGUID: LuNRf+6aS6WJEbGBaETnlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="39513575"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="39513575"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 16:09:04 -0800
X-CSE-ConnectionGUID: IEUXwxsbT8a8MaL5RFyABQ==
X-CSE-MsgGUID: eGrucGTVTvmfUlXuJVFeHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="131111935"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Dec 2024 16:09:04 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRKO5-0003kC-0W;
	Sat, 28 Dec 2024 00:09:01 +0000
Date: Sat, 28 Dec 2024 08:08:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1327/1327]
 arch/x86/kernel/unwind_orc.o: warning: objtool: missing symbol for section
 .text
Message-ID: <202412280732.HThqDDS9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Shile,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   a8a9daf97ebc8e303e039402fe784e7bd4e5a9bb
commit: badd79c400ed404df871e1d035bed971d20ead4c [1327/1327] x86/unwind/orc: Remove boot-time ORC unwind tables sorting
config: x86_64-buildonly-randconfig-004-20241216 (https://download.01.org/0day-ci/archive/20241228/202412280732.HThqDDS9-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412280732.HThqDDS9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412280732.HThqDDS9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/unwind_orc.c:179:13: warning: unused function 'orc_sort_swap' [-Wunused-function]
     179 | static void orc_sort_swap(void *_a, void *_b, int size)
         |             ^~~~~~~~~~~~~
   arch/x86/kernel/unwind_orc.c:199:12: warning: unused function 'orc_sort_cmp' [-Wunused-function]
     199 | static int orc_sort_cmp(const void *_a, const void *_b)
         |            ^~~~~~~~~~~~
   2 warnings generated.
>> arch/x86/kernel/unwind_orc.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
