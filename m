Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DD1806
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jul 2023 02:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689300265; x=1720836265;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JAwbUnGAJoNa/KwLZGhx/wpx1A7Ey5H0gSQw2/jj9jU=;
  b=DkcZggzz8+lWqNNW0JrV6XxAqe7vPTBD0F080BFkpv5hHjh9E8Gs7eqx
   Upy0XeBYh/eY9vXdEoNXraG8SIgFqSRibb+IQKKwSG1sa+1RpZcjzQmEv
   /GMf4P32DWSxIMaWWNDsxeQpjxYXZ8gj1iptorun9kSbHIkdRzfDnaHFa
   4aKITftTfC9B85t8ZZ61fEkMGBkcb9Ja/nr3D+RELaPACGGIqAQlEaSd3
   7FzWFZrX4+Q35+glMCsvcTmASujDYLUKU/rit6WVPEtB8GTPe2t8R3oH6
   Ea1rR/OZ3XJmVwWKuiygGOr+69VRAWg/VvTjpozEHP/yVpu5kWShHtdQ8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="429132006"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="429132006"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 19:04:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="699504058"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="699504058"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 13 Jul 2023 19:04:17 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qK8AK-000745-3C;
	Fri, 14 Jul 2023 02:04:16 +0000
Date: Fri, 14 Jul 2023 10:04:07 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miles Chen <miles.chen@mediatek.com>
Subject: [stable:linux-4.19.y 1426/9999] lib/strncpy_from_user.c:39: Error:
 unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
Message-ID: <202307140902.XRj0yQ5q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christophe,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   94bffc1044d871e2ec89b2621e9a384355832988
commit: e18590b3e242638e873a61d299abf8a9df446236 [1426/9999] lib: Reduce user_access_begin() boundaries in strncpy_from_user() and strnlen_user()
config: riscv-randconfig-r024-20230712 (https://download.01.org/0day-ci/archive/20230714/202307140902.XRj0yQ5q-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307140902.XRj0yQ5q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307140902.XRj0yQ5q-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/strncpy_from_user.c: Assembler messages:
>> lib/strncpy_from_user.c:39: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
>> lib/strncpy_from_user.c:39: Error: unrecognized opcode `csrc sstatus,a4', extension `zicsr' required
   lib/strncpy_from_user.c:55: Error: unrecognized opcode `csrs sstatus,s7', extension `zicsr' required
   lib/strncpy_from_user.c:55: Error: unrecognized opcode `csrc sstatus,s7', extension `zicsr' required


vim +39 lib/strncpy_from_user.c

2922585b93294d David S. Miller 2012-05-24  19  
2922585b93294d David S. Miller 2012-05-24  20  /*
2922585b93294d David S. Miller 2012-05-24  21   * Do a strncpy, return length of string without final '\0'.
2922585b93294d David S. Miller 2012-05-24  22   * 'count' is the user-supplied count (return 'count' if we
2922585b93294d David S. Miller 2012-05-24  23   * hit it), 'max' is the address space maximum (and we return
2922585b93294d David S. Miller 2012-05-24  24   * -EFAULT if we hit it).
2922585b93294d David S. Miller 2012-05-24  25   */
189b396a2580d6 Peter Zijlstra  2019-04-24  26  static inline long do_strncpy_from_user(char *dst, const char __user *src,
189b396a2580d6 Peter Zijlstra  2019-04-24  27  					unsigned long count, unsigned long max)
2922585b93294d David S. Miller 2012-05-24  28  {
36126f8f2ed816 Linus Torvalds  2012-05-26  29  	const struct word_at_a_time constants = WORD_AT_A_TIME_CONSTANTS;
189b396a2580d6 Peter Zijlstra  2019-04-24  30  	unsigned long res = 0;
2922585b93294d David S. Miller 2012-05-24  31  
2922585b93294d David S. Miller 2012-05-24  32  	if (IS_UNALIGNED(src, dst))
2922585b93294d David S. Miller 2012-05-24  33  		goto byte_at_a_time;
2922585b93294d David S. Miller 2012-05-24  34  
2922585b93294d David S. Miller 2012-05-24  35  	while (max >= sizeof(unsigned long)) {
36126f8f2ed816 Linus Torvalds  2012-05-26  36  		unsigned long c, data;
2922585b93294d David S. Miller 2012-05-24  37  
2922585b93294d David S. Miller 2012-05-24  38  		/* Fall back to byte-at-a-time if we get a page fault */
1bd4403d86a1c0 Linus Torvalds  2016-08-08 @39  		unsafe_get_user(c, (unsigned long __user *)(src+res), byte_at_a_time);
1bd4403d86a1c0 Linus Torvalds  2016-08-08  40  
2922585b93294d David S. Miller 2012-05-24  41  		*(unsigned long *)(dst+res) = c;
36126f8f2ed816 Linus Torvalds  2012-05-26  42  		if (has_zero(c, &data, &constants)) {
36126f8f2ed816 Linus Torvalds  2012-05-26  43  			data = prep_zero_mask(c, data, &constants);
36126f8f2ed816 Linus Torvalds  2012-05-26  44  			data = create_zero_mask(data);
36126f8f2ed816 Linus Torvalds  2012-05-26  45  			return res + find_zero(data);
2922585b93294d David S. Miller 2012-05-24  46  		}
2922585b93294d David S. Miller 2012-05-24  47  		res += sizeof(unsigned long);
2922585b93294d David S. Miller 2012-05-24  48  		max -= sizeof(unsigned long);
2922585b93294d David S. Miller 2012-05-24  49  	}
2922585b93294d David S. Miller 2012-05-24  50  
2922585b93294d David S. Miller 2012-05-24  51  byte_at_a_time:
2922585b93294d David S. Miller 2012-05-24  52  	while (max) {
2922585b93294d David S. Miller 2012-05-24  53  		char c;
2922585b93294d David S. Miller 2012-05-24  54  
1bd4403d86a1c0 Linus Torvalds  2016-08-08  55  		unsafe_get_user(c,src+res, efault);
2922585b93294d David S. Miller 2012-05-24  56  		dst[res] = c;
2922585b93294d David S. Miller 2012-05-24  57  		if (!c)
2922585b93294d David S. Miller 2012-05-24  58  			return res;
2922585b93294d David S. Miller 2012-05-24  59  		res++;
2922585b93294d David S. Miller 2012-05-24  60  		max--;
2922585b93294d David S. Miller 2012-05-24  61  	}
2922585b93294d David S. Miller 2012-05-24  62  
2922585b93294d David S. Miller 2012-05-24  63  	/*
2922585b93294d David S. Miller 2012-05-24  64  	 * Uhhuh. We hit 'max'. But was that the user-specified maximum
2922585b93294d David S. Miller 2012-05-24  65  	 * too? If so, that's ok - we got as much as the user asked for.
2922585b93294d David S. Miller 2012-05-24  66  	 */
2922585b93294d David S. Miller 2012-05-24  67  	if (res >= count)
2922585b93294d David S. Miller 2012-05-24  68  		return res;
2922585b93294d David S. Miller 2012-05-24  69  
2922585b93294d David S. Miller 2012-05-24  70  	/*
2922585b93294d David S. Miller 2012-05-24  71  	 * Nope: we hit the address space limit, and we still had more
2922585b93294d David S. Miller 2012-05-24  72  	 * characters the caller would have wanted. That's an EFAULT.
2922585b93294d David S. Miller 2012-05-24  73  	 */
1bd4403d86a1c0 Linus Torvalds  2016-08-08  74  efault:
2922585b93294d David S. Miller 2012-05-24  75  	return -EFAULT;
2922585b93294d David S. Miller 2012-05-24  76  }
2922585b93294d David S. Miller 2012-05-24  77  

:::::: The code at line 39 was first introduced by commit
:::::: 1bd4403d86a1c06cb6cc9ac87664a0c9d3413d51 unsafe_[get|put]_user: change interface to use a error target label

:::::: TO: Linus Torvalds <torvalds@linux-foundation.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
