Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9F41E7C24
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 May 2025 08:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746433380; cv=none; b=AvIWxku8DX+lr8zjHn0yA1bnvd76z3APfYchlKUhWZgKTV1pR+hRd6E6n9U3X6T4hVlUlu5tgXCl1Mquu4Z6rCJHo0PuWqVYGkRFoXT2+yr71CM3ZjxERLC7CqPftu4vmit8NzWMlDfMU9rZJT13FmptMHLNxF7NAE1VTbuxbMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746433380; c=relaxed/simple;
	bh=B8H5VcMGFVx9E30E7xiDiDlT+6m8bUxPQXqpBIsLBZc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hPvFE0KFZR5CeHeIm0ma2eRBRSqm47FJq+AafF4xL70L6zmtNZbkTJt1gOIXedAFbgdX+lUh5fP2sZN3TmZkjMiHGNE3xpKjXNEk4D7JfAJNyP/YfGNgW6LWIPXOMWYX3m3mwJ3GXKVsQyP3EV8h6fSNR04KkJNMn7WaJTxpde0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EZTFAHJc; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EZTFAHJc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746433378; x=1777969378;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B8H5VcMGFVx9E30E7xiDiDlT+6m8bUxPQXqpBIsLBZc=;
  b=EZTFAHJc7utN6+cp7IV88fOJ1O9WiHkolu3r0jPkQcGcsjimFFIzuSL0
   Ozjp1UXj0Tvz0AAM0A3InPRsBTX3G0ulCtoDiuaWOcoTblqdG/VgcP7/J
   W97vytddZoQhD4Bo5YT8BEClydF3CCjc6C0V5gGxj7sOS/M/sBerC40Lg
   weu1fwsEqkTbkySh5kfABBK+iXFHwYN3GuV87RRqtaD29etF37FDli3jB
   ANfQ+XSiP4QfSHpNq1k1OTUa7244DsP9R0ky0rloAKv5xMMNkcnOPKxWI
   HBtueU2WVVCXPC80Fp/sqJs/662rkYHci03LhC7zaRkr8qGTMYXfAMRX1
   Q==;
X-CSE-ConnectionGUID: ICXwPnlqRHiVn9AmxWf7IQ==
X-CSE-MsgGUID: aKqvWKLoQYeIMfGdNl/2vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="58689207"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="58689207"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 01:22:57 -0700
X-CSE-ConnectionGUID: VEPP1fZVT2KY3HIhbv08kg==
X-CSE-MsgGUID: lNLEjh38QNSHGf4jIifAjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="134913281"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 05 May 2025 01:22:56 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uBr6D-0005dn-2h;
	Mon, 05 May 2025 08:22:53 +0000
Date: Mon, 5 May 2025 16:22:46 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/stats_pointer 1/1]
 arch/s390/kvm/../../../virt/kvm/binary_stats.c:56: warning: Function
 parameter or struct member 'ext' not described in 'kvm_stats_read'
Message-ID: <202505051648.6scY0AUs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/stats_pointer
head:   b9a199c65702bb4d0d6bc77c88198df60cdd940f
commit: b9a199c65702bb4d0d6bc77c88198df60cdd940f [1/1] KVM: x86: PoC for shoving a subset of stats into a pointer
config: s390-randconfig-r072-20250503 (https://download.01.org/0day-ci/archive/20250505/202505051648.6scY0AUs-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250505/202505051648.6scY0AUs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505051648.6scY0AUs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/s390/kvm/../../../virt/kvm/binary_stats.c:56: warning: Function parameter or struct member 'ext' not described in 'kvm_stats_read'
>> arch/s390/kvm/../../../virt/kvm/binary_stats.c:56: warning: Function parameter or struct member 'size_ext' not described in 'kvm_stats_read'


vim +56 arch/s390/kvm/../../../virt/kvm/binary_stats.c

cb082bfab59a22 Jing Zhang          2021-06-18  12  
cb082bfab59a22 Jing Zhang          2021-06-18  13  /**
cb082bfab59a22 Jing Zhang          2021-06-18  14   * kvm_stats_read() - Common function to read from the binary statistics
cb082bfab59a22 Jing Zhang          2021-06-18  15   * file descriptor.
cb082bfab59a22 Jing Zhang          2021-06-18  16   *
cb082bfab59a22 Jing Zhang          2021-06-18  17   * @id: identification string of the stats
cb082bfab59a22 Jing Zhang          2021-06-18  18   * @header: stats header for a vm or a vcpu
cb082bfab59a22 Jing Zhang          2021-06-18  19   * @desc: start address of an array of stats descriptors for a vm or a vcpu
cb082bfab59a22 Jing Zhang          2021-06-18  20   * @stats: start address of stats data block for a vm or a vcpu
cb082bfab59a22 Jing Zhang          2021-06-18  21   * @size_stats: the size of stats data block pointed by @stats
cb082bfab59a22 Jing Zhang          2021-06-18  22   * @user_buffer: start address of userspace buffer
cb082bfab59a22 Jing Zhang          2021-06-18  23   * @size: requested read size from userspace
cb082bfab59a22 Jing Zhang          2021-06-18  24   * @offset: the start position from which the content will be read for the
cb082bfab59a22 Jing Zhang          2021-06-18  25   *          corresponding vm or vcp file descriptor
cb082bfab59a22 Jing Zhang          2021-06-18  26   *
cb082bfab59a22 Jing Zhang          2021-06-18  27   * The file content of a vm/vcpu file descriptor is now defined as below:
cb082bfab59a22 Jing Zhang          2021-06-18  28   * +-------------+
cb082bfab59a22 Jing Zhang          2021-06-18  29   * |   Header    |
cb082bfab59a22 Jing Zhang          2021-06-18  30   * +-------------+
cb082bfab59a22 Jing Zhang          2021-06-18  31   * |  id string  |
cb082bfab59a22 Jing Zhang          2021-06-18  32   * +-------------+
cb082bfab59a22 Jing Zhang          2021-06-18  33   * | Descriptors |
cb082bfab59a22 Jing Zhang          2021-06-18  34   * +-------------+
cb082bfab59a22 Jing Zhang          2021-06-18  35   * | Stats Data  |
cb082bfab59a22 Jing Zhang          2021-06-18  36   * +-------------+
cb082bfab59a22 Jing Zhang          2021-06-18  37   * Although this function allows userspace to read any amount of data (as long
cb082bfab59a22 Jing Zhang          2021-06-18  38   * as in the limit) from any position, the typical usage would follow below
cb082bfab59a22 Jing Zhang          2021-06-18  39   * steps:
cb082bfab59a22 Jing Zhang          2021-06-18  40   * 1. Read header from offset 0. Get the offset of descriptors and stats data
cb082bfab59a22 Jing Zhang          2021-06-18  41   *    and some other necessary information. This is a one-time work for the
cb082bfab59a22 Jing Zhang          2021-06-18  42   *    lifecycle of the corresponding vm/vcpu stats fd.
cb082bfab59a22 Jing Zhang          2021-06-18  43   * 2. Read id string from its offset. This is a one-time work for the lifecycle
cb082bfab59a22 Jing Zhang          2021-06-18  44   *    of the corresponding vm/vcpu stats fd.
cb082bfab59a22 Jing Zhang          2021-06-18  45   * 3. Read descriptors from its offset and discover all the stats by parsing
cb082bfab59a22 Jing Zhang          2021-06-18  46   *    descriptors. This is a one-time work for the lifecycle of the
cb082bfab59a22 Jing Zhang          2021-06-18  47   *    corresponding vm/vcpu stats fd.
cb082bfab59a22 Jing Zhang          2021-06-18  48   * 4. Periodically read stats data from its offset using pread.
cb082bfab59a22 Jing Zhang          2021-06-18  49   *
cb082bfab59a22 Jing Zhang          2021-06-18  50   * Return: the number of bytes that has been successfully read
cb082bfab59a22 Jing Zhang          2021-06-18  51   */
cb082bfab59a22 Jing Zhang          2021-06-18  52  ssize_t kvm_stats_read(char *id, const struct kvm_stats_header *header,
cb082bfab59a22 Jing Zhang          2021-06-18  53  		       const struct _kvm_stats_desc *desc,
b9a199c65702bb Sean Christopherson 2025-04-30  54  		       void *stats, size_t size_stats, void *ext, size_t size_ext,
cb082bfab59a22 Jing Zhang          2021-06-18  55  		       char __user *user_buffer, size_t size, loff_t *offset)
cb082bfab59a22 Jing Zhang          2021-06-18 @56  {

:::::: The code at line 56 was first introduced by commit
:::::: cb082bfab59a224a49ae803fed52cd03e8d6b5e0 KVM: stats: Add fd-based API to read binary stats data

:::::: TO: Jing Zhang <jingzhangos@google.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
