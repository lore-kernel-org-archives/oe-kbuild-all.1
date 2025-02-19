Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA2554918
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Feb 2025 02:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739931284; cv=none; b=oFmJ6tnKuwWTpIqsLSurt6uUza1Bk8pBq9DU7YDRLAdo5F8N0TAdRyUpxvXxhmOULxJ13YHJ5ZiNXm4ilwbXnS6E8AR/j5bt+D6pq0n//ltSDhLJyy7FofQItYPq84M7aDPiNNJuluiZcUfEQrD1Cbwk5+0YVGEDBObgkLpkJUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739931284; c=relaxed/simple;
	bh=fwwIGDmOh34qiDShSheiXE+Zt8ivpVracjoleZ7Lc/0=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h+ttCzXeVseEl+BRnPUXV64rvnbgaBe6m2XnVt1zTXqkWwJlYnO6G9FJ9KiAo/sRlY92IBW9/PE2O/CLOeEmCw8YIYPwqDuEs549PxrsJ2cX/YLHzvHsNH616sRSmtHhFseMkRmqYKoSZVUvvypVoBKR9VwYoTvzMd1i+o1LTsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bAKL2yMg; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bAKL2yMg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739931283; x=1771467283;
  h=date:from:cc:subject:message-id:mime-version;
  bh=fwwIGDmOh34qiDShSheiXE+Zt8ivpVracjoleZ7Lc/0=;
  b=bAKL2yMgqmSa6+jtotT5p0v2tsfoCwL4WwJ/gjxz68hAPL+1khCzEdao
   33v6fs5t9FYDx8IzhI+wbuWgns8QdAn8uQrXoTjHCIygegv26+6IgHyYP
   wkIdmFJGhWGgRUaqrAP9KA6fJT2eBoJfJxV86ywFY7fTVXkJI/LVnJxFS
   6pCiGTu7bA/5JTfRp0jyUGcff+ZRuext/e/qBbWENDp9KynbI8qYe0bWu
   PoE0clYVUAGzVkEre9GCEaUyTIepbRWXAaMYQ/udHjGnVpUwsg8V1emCw
   Hg4yAyzsQ4w0u7lHZliXhKKLiUNsmpq6grJSWmSxvaGW6W81YHFGJsbSL
   A==;
X-CSE-ConnectionGUID: i+7qmiHXScKhfY70fucgyw==
X-CSE-MsgGUID: /7dJnWmNRfq2lsJHbVC3Eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="39884909"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; 
   d="scan'208";a="39884909"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 18:14:42 -0800
X-CSE-ConnectionGUID: LnHEEo5YS1ixFhorUwlfIw==
X-CSE-MsgGUID: JSt5dMJPTMKRFzIyRQ/f9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119225204"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 18 Feb 2025 18:14:40 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkZbh-00018P-2C
	for oe-kbuild-all@lists.linux.dev;
	Wed, 19 Feb 2025 02:14:37 +0000
Date: Wed, 19 Feb 2025 10:13:47 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/60 1/1] lib/strncpy_from_user.c:62: Error:
 unrecognized opcode `csrs sstatus,s6', extension `zicsr' required
Message-ID: <202502191026.4G3V2ZPg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/60
head:   9e3b33a0fe250f006a2d39da8cc8f99a0101e89b
commit: 29da93fea3ea39ab9b12270cc6be1b70ef201c9e [1/1] mm/uaccess: Use 'unsigned long' to placate UBSAN warnings on older GCC versions
config: riscv-randconfig-002-20250218 (https://download.01.org/0day-ci/archive/20250219/202502191026.4G3V2ZPg-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250219/202502191026.4G3V2ZPg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502191026.4G3V2ZPg-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/strncpy_from_user.c: Assembler messages:
   lib/strncpy_from_user.c:46: Error: unrecognized opcode `csrs sstatus,a7', extension `zicsr' required
   lib/strncpy_from_user.c:46: Error: unrecognized opcode `csrc sstatus,a7', extension `zicsr' required
>> lib/strncpy_from_user.c:62: Error: unrecognized opcode `csrs sstatus,s6', extension `zicsr' required
>> lib/strncpy_from_user.c:62: Error: unrecognized opcode `csrc sstatus,s6', extension `zicsr' required


vim +62 lib/strncpy_from_user.c

2922585b93294d David S. Miller 2012-05-24  19  
2922585b93294d David S. Miller 2012-05-24  20  /*
2922585b93294d David S. Miller 2012-05-24  21   * Do a strncpy, return length of string without final '\0'.
2922585b93294d David S. Miller 2012-05-24  22   * 'count' is the user-supplied count (return 'count' if we
2922585b93294d David S. Miller 2012-05-24  23   * hit it), 'max' is the address space maximum (and we return
2922585b93294d David S. Miller 2012-05-24  24   * -EFAULT if we hit it).
2922585b93294d David S. Miller 2012-05-24  25   */
29da93fea3ea39 Peter Zijlstra  2019-04-24  26  static inline long do_strncpy_from_user(char *dst, const char __user *src,
29da93fea3ea39 Peter Zijlstra  2019-04-24  27  					unsigned long count, unsigned long max)
2922585b93294d David S. Miller 2012-05-24  28  {
36126f8f2ed816 Linus Torvalds  2012-05-26  29  	const struct word_at_a_time constants = WORD_AT_A_TIME_CONSTANTS;
29da93fea3ea39 Peter Zijlstra  2019-04-24  30  	unsigned long res = 0;
2922585b93294d David S. Miller 2012-05-24  31  
2922585b93294d David S. Miller 2012-05-24  32  	/*
2922585b93294d David S. Miller 2012-05-24  33  	 * Truncate 'max' to the user-specified limit, so that
2922585b93294d David S. Miller 2012-05-24  34  	 * we only have one limit we need to check in the loop
2922585b93294d David S. Miller 2012-05-24  35  	 */
2922585b93294d David S. Miller 2012-05-24  36  	if (max > count)
2922585b93294d David S. Miller 2012-05-24  37  		max = count;
2922585b93294d David S. Miller 2012-05-24  38  
2922585b93294d David S. Miller 2012-05-24  39  	if (IS_UNALIGNED(src, dst))
2922585b93294d David S. Miller 2012-05-24  40  		goto byte_at_a_time;
2922585b93294d David S. Miller 2012-05-24  41  
2922585b93294d David S. Miller 2012-05-24  42  	while (max >= sizeof(unsigned long)) {
36126f8f2ed816 Linus Torvalds  2012-05-26  43  		unsigned long c, data;
2922585b93294d David S. Miller 2012-05-24  44  
2922585b93294d David S. Miller 2012-05-24  45  		/* Fall back to byte-at-a-time if we get a page fault */
1bd4403d86a1c0 Linus Torvalds  2016-08-08  46  		unsafe_get_user(c, (unsigned long __user *)(src+res), byte_at_a_time);
1bd4403d86a1c0 Linus Torvalds  2016-08-08  47  
2922585b93294d David S. Miller 2012-05-24  48  		*(unsigned long *)(dst+res) = c;
36126f8f2ed816 Linus Torvalds  2012-05-26  49  		if (has_zero(c, &data, &constants)) {
36126f8f2ed816 Linus Torvalds  2012-05-26  50  			data = prep_zero_mask(c, data, &constants);
36126f8f2ed816 Linus Torvalds  2012-05-26  51  			data = create_zero_mask(data);
36126f8f2ed816 Linus Torvalds  2012-05-26  52  			return res + find_zero(data);
2922585b93294d David S. Miller 2012-05-24  53  		}
2922585b93294d David S. Miller 2012-05-24  54  		res += sizeof(unsigned long);
2922585b93294d David S. Miller 2012-05-24  55  		max -= sizeof(unsigned long);
2922585b93294d David S. Miller 2012-05-24  56  	}
2922585b93294d David S. Miller 2012-05-24  57  
2922585b93294d David S. Miller 2012-05-24  58  byte_at_a_time:
2922585b93294d David S. Miller 2012-05-24  59  	while (max) {
2922585b93294d David S. Miller 2012-05-24  60  		char c;
2922585b93294d David S. Miller 2012-05-24  61  
1bd4403d86a1c0 Linus Torvalds  2016-08-08 @62  		unsafe_get_user(c,src+res, efault);
2922585b93294d David S. Miller 2012-05-24  63  		dst[res] = c;
2922585b93294d David S. Miller 2012-05-24  64  		if (!c)
2922585b93294d David S. Miller 2012-05-24  65  			return res;
2922585b93294d David S. Miller 2012-05-24  66  		res++;
2922585b93294d David S. Miller 2012-05-24  67  		max--;
2922585b93294d David S. Miller 2012-05-24  68  	}
2922585b93294d David S. Miller 2012-05-24  69  
2922585b93294d David S. Miller 2012-05-24  70  	/*
2922585b93294d David S. Miller 2012-05-24  71  	 * Uhhuh. We hit 'max'. But was that the user-specified maximum
2922585b93294d David S. Miller 2012-05-24  72  	 * too? If so, that's ok - we got as much as the user asked for.
2922585b93294d David S. Miller 2012-05-24  73  	 */
2922585b93294d David S. Miller 2012-05-24  74  	if (res >= count)
2922585b93294d David S. Miller 2012-05-24  75  		return res;
2922585b93294d David S. Miller 2012-05-24  76  
2922585b93294d David S. Miller 2012-05-24  77  	/*
2922585b93294d David S. Miller 2012-05-24  78  	 * Nope: we hit the address space limit, and we still had more
2922585b93294d David S. Miller 2012-05-24  79  	 * characters the caller would have wanted. That's an EFAULT.
2922585b93294d David S. Miller 2012-05-24  80  	 */
1bd4403d86a1c0 Linus Torvalds  2016-08-08  81  efault:
2922585b93294d David S. Miller 2012-05-24  82  	return -EFAULT;
2922585b93294d David S. Miller 2012-05-24  83  }
2922585b93294d David S. Miller 2012-05-24  84  

:::::: The code at line 62 was first introduced by commit
:::::: 1bd4403d86a1c06cb6cc9ac87664a0c9d3413d51 unsafe_[get|put]_user: change interface to use a error target label

:::::: TO: Linus Torvalds <torvalds@linux-foundation.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
