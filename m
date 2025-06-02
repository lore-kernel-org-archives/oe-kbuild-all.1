Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FE63EA98
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Jun 2025 18:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748889398; cv=none; b=AafQq8198I9XWhMpVdSksgQPvxmJaI7wo5ZrjDlp1UepW4Q6OkONFAd7Ix/jUDiU7vglxWApORlAGL++YE2S1dYKYlc5IDmbvlXOnQvBJ5TYSc6Kq2iG8dhm/av6twoT0TDdcsljI2smGx/aTb+kEVVMcuQDFOe2fauRbeDM76Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748889398; c=relaxed/simple;
	bh=wzdNU0nDEuyzqsWQYyk80Bq2tze7ittQ20dXIVnfKBU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nEceYczkOBoY2SDksJ2yQ8WSli+RYFRSn+m80kDd83R0Rsm8/vu9wN9HD+sCrwxq26u7Xa6nDhxk8SlR5ZCY/COJw+ipXcV2ZztBglwVsE2u+RRL457llr56GZB7qwj/scyf2xN7O34yFxc372jnxtqrOtS8q7YiEdZ5qL5/F/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SKXKOj51; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SKXKOj51"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748889397; x=1780425397;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wzdNU0nDEuyzqsWQYyk80Bq2tze7ittQ20dXIVnfKBU=;
  b=SKXKOj51muClRNlrOer9azYUu6CVdxXE05hEqCf9u+HOfUQ482UtZptP
   D+OoTeOrV/iPJyInx4zL3eEOQ+fAq45hfWiDrlnmy/DdEJm8fSkkE5Wfx
   wFYuunmd33ciYI2rqoCH+JRxk1lnZTpm6WtMSgG9WsDYLse28XvKShdAz
   tfP50mBZ4nlgZNLajDWNK2kFuqUV09q1zLSL8fqBWQ6c4GzKMkWdsOixt
   z3KDGYvK35pMndWUqLyVMhlkgdgu8l3LPjpm4x0rTtylcpbkgAISMaupA
   8VnlG2ljkvOHoXjrSlk49D+MCdUx+AwgDIwZmjLQZ4RoeyASi8TMUU17z
   g==;
X-CSE-ConnectionGUID: X+j+UBcLSKGke7FCi8s22Q==
X-CSE-MsgGUID: hjbLM4pRQyySv+FIAY7xAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="73438827"
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; 
   d="scan'208";a="73438827"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 11:36:36 -0700
X-CSE-ConnectionGUID: QnRq81k8RjCZLf1daTxK2w==
X-CSE-MsgGUID: 1gk54sGTQNqJTQUOHxLdjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; 
   d="scan'208";a="181780088"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by orviesa001.jf.intel.com with ESMTP; 02 Jun 2025 11:36:35 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMA1Q-0001M2-31;
	Mon, 02 Jun 2025 18:36:32 +0000
Date: Tue, 3 Jun 2025 02:35:54 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/stats_pointer 1/1]
 arch/loongarch/kvm/../../../virt/kvm/binary_stats.c:56: warning: Function
 parameter or struct member 'ext' not described in 'kvm_stats_read'
Message-ID: <202506030203.CzOauHE4-lkp@intel.com>
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
config: loongarch-randconfig-2001-20250502 (https://download.01.org/0day-ci/archive/20250603/202506030203.CzOauHE4-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250603/202506030203.CzOauHE4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506030203.CzOauHE4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/loongarch/kvm/../../../virt/kvm/binary_stats.c:56: warning: Function parameter or struct member 'ext' not described in 'kvm_stats_read'
>> arch/loongarch/kvm/../../../virt/kvm/binary_stats.c:56: warning: Function parameter or struct member 'size_ext' not described in 'kvm_stats_read'


vim +56 arch/loongarch/kvm/../../../virt/kvm/binary_stats.c

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
