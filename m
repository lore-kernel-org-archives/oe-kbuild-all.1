Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0D23597A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Jul 2025 02:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752806290; cv=none; b=ocrLb5qqnHdTzaqWdR4M9OdWuA1nqS8MDIjjjcRsdX+QoyOsDr3GzSIs0DiQulW/O9/SwWiKgy9K4KnsT+506HXAtiNQQ5Mqej39R+ASbFl/8vVoCYIjUnxfVt/UBj2LebTJQGwR8m96kIfwD5DRCMsrj71y0fwLYIRFaE15JJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752806290; c=relaxed/simple;
	bh=Gs84ypljp6WBH6x9y47Ht5BKU3ZtLrz3vnmoBYI/HrY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NKGI7xdjTUOW6YiAhfp9W6Y+7m8DGtSDxgRNMYdIElxN+fFr6ZrOHVF//3CPdV1NVvaTFonVNEoj5ILgbJA6dxQp5EHnEEoBvlszGvWBNpXkl2BWXy6P3+QfMp+m4gwrBXlO27bj9WZk/9IsEIpYhL++Oe893Yrd7sUqpAIO950=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TMoZRhIj; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TMoZRhIj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752806287; x=1784342287;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gs84ypljp6WBH6x9y47Ht5BKU3ZtLrz3vnmoBYI/HrY=;
  b=TMoZRhIjkeh8eBXGE6TkiPOYApS3EqVj3b1K2lvsjW7Kl8iDtwlU10/E
   9tnC8Azf2MNjTf7a5b9lWsfmj8ahct8vIXwvSAbC0r+HkK3vjUm3kSjsl
   g6rQssutPv0UHOBi3DcxUlkzla/JE3mw1w0bIqLBU+fA0T2P0sGRFDw8q
   cVs0ovvVzPNUeyMBa4lssqBuuOmeGDBvs7o7vxs715a4OVCzop0jFVOJu
   Qnzw9R8Qd3JUapujkVIEJ64YoCWgpszQbeSbJzU5N5iGqq+z3lCiB1if4
   5WuPE4qg+wpvNa1h1uZ8CN0PDZNzZXDD9hENKrfdAyVn8yNS0TbjWN1sp
   g==;
X-CSE-ConnectionGUID: tnAz/kXYQvioxHITF041iw==
X-CSE-MsgGUID: QA1BzfVjTNC4AfVxPehmJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="55242632"
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; 
   d="scan'208";a="55242632"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 19:38:07 -0700
X-CSE-ConnectionGUID: dxklxQ/HRIWiakC6b8URjw==
X-CSE-MsgGUID: QRBDrKWMQ+KXf3SH6Gq6wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; 
   d="scan'208";a="157340953"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Jul 2025 19:38:05 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucaz4-000EFP-2x;
	Fri, 18 Jul 2025 02:38:02 +0000
Date: Fri, 18 Jul 2025 10:38:02 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1732/1732]
 drivers/infiniband/hw/hns/roce-customer/rdfx_main.o: warning: objtool:
 missing symbol for section .exit.text
Message-ID: <202507181025.pTTF3TIl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   700db19c02e9c8dcf291aa7a6a29337c97ea1805
commit: 36c62c022d2ffadd5a0f2b1fc33d6abd71d4bd78 [1732/1732] RDMA/hns: Add roce dfx files
config: x86_64-buildonly-randconfig-005-20250718 (https://download.01.org/0day-ci/archive/20250718/202507181025.pTTF3TIl-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250718/202507181025.pTTF3TIl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507181025.pTTF3TIl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/infiniband/hw/hns/roce-customer/rdfx_main.c:352:13: warning: no previous prototype for function 'rdfx_exit' [-Wmissing-prototypes]
     352 | void __exit rdfx_exit(void)
         |             ^
   drivers/infiniband/hw/hns/roce-customer/rdfx_main.c:352:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     352 | void __exit rdfx_exit(void)
         | ^
         | static 
   1 warning generated.
>> drivers/infiniband/hw/hns/roce-customer/rdfx_main.o: warning: objtool: missing symbol for section .exit.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
