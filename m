Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31BA28FD
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jun 2023 05:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685944247; x=1717480247;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jxbuns4y8ocespQH6SL7xgs/c6bIbx2RntwJ3PeKTuw=;
  b=K+f/75UKjPLHcl9o3/iXZ+YfK+jxAstJNlz39Ok5Mh579Dry21WTgm0R
   5z+1YZ63lhWQc+Gqdt5xNsY49FA7DpkbJLXJcrctBTkrCXF9Q9jSmCs7O
   PL9Ed6BIRgaeGf0ErxrzOk+jQgHsZ/VRqiQZDKDYHkmY9MLeY9Y4+ziOh
   SWWIEjFnfC5TIjhyCOB0QOjRO5GPL/4FcQ2RKXhzVcywg0Ju5n/rxkkt8
   A9RrbuJoUYJB+Pr65gIwVavcZaB9BGaLnI4UuPaeRsjqYCodp5wrSWNtR
   X8uYn37FOa3GAdEfxitmaETEqEZzSRzDTals+a9Ui+iVnYn/Vz7Q8+A1b
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="359601131"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="359601131"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2023 22:50:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="738249144"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="738249144"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 04 Jun 2023 22:50:45 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6376-0003uV-3B;
	Mon, 05 Jun 2023 05:50:44 +0000
Date: Mon, 5 Jun 2023 13:50:10 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexei Starovoitov <ast@kernel.org>
Subject: [linux-next:master 2368/6966]
 tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:330:18: warning: no
 previous prototype for 'bpf_kfunc_call_test_offset'
Message-ID: <202306051319.EihCQZPs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bc708bbd8260ee4eb3428b0109f5f3be661fae46
commit: 65eb006d85a2ac0b23464808099726bd826e9877 [2368/6966] bpf: Move kernel test kfuncs to bpf_testmod
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=65eb006d85a2ac0b23464808099726bd826e9877
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 65eb006d85a2ac0b23464808099726bd826e9877
        make O=/tmp/kselftest headers
        make O=/tmp/kselftest -C tools/testing/selftests

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306051319.EihCQZPs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:199:1: warning: no previous prototype for 'bpf_testmod_test_read' [-Wmissing-prototypes]
     199 | bpf_testmod_test_read(struct file *file, struct kobject *kobj,
         | ^~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:259:1: warning: no previous prototype for 'bpf_testmod_test_write' [-Wmissing-prototypes]
     259 | bpf_testmod_test_write(struct file *file, struct kobject *kobj,
         | ^~~~~~~~~~~~~~~~~~~~~~
>> tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:330:18: warning: no previous prototype for 'bpf_kfunc_call_test_offset' [-Wmissing-prototypes]
     330 | __bpf_kfunc void bpf_kfunc_call_test_offset(struct prog_test_ref_kfunc *p)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:336:1: warning: no previous prototype for 'bpf_kfunc_call_memb_acquire' [-Wmissing-prototypes]
     336 | bpf_kfunc_call_memb_acquire(void)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:342:18: warning: no previous prototype for 'bpf_kfunc_call_memb1_release' [-Wmissing-prototypes]
     342 | __bpf_kfunc void bpf_kfunc_call_memb1_release(struct prog_test_member1 *p)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:394:18: warning: no previous prototype for 'bpf_kfunc_call_test_fail1' [-Wmissing-prototypes]
     394 | __bpf_kfunc void bpf_kfunc_call_test_fail1(struct prog_test_fail1 *p)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
>> tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:398:18: warning: no previous prototype for 'bpf_kfunc_call_test_fail2' [-Wmissing-prototypes]
     398 | __bpf_kfunc void bpf_kfunc_call_test_fail2(struct prog_test_fail2 *p)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
>> tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:402:18: warning: no previous prototype for 'bpf_kfunc_call_test_fail3' [-Wmissing-prototypes]
     402 | __bpf_kfunc void bpf_kfunc_call_test_fail3(struct prog_test_fail3 *p)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
>> tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:410:18: warning: no previous prototype for 'bpf_kfunc_call_test_mem_len_fail1' [-Wmissing-prototypes]
     410 | __bpf_kfunc void bpf_kfunc_call_test_mem_len_fail1(void *mem, int len)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:465:14: warning: no previous prototype for 'bpf_fentry_shadow_test' [-Wmissing-prototypes]
     465 | noinline int bpf_fentry_shadow_test(int a)
         |              ^~~~~~~~~~~~~~~~~~~~~~


vim +/bpf_kfunc_call_test_offset +330 tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c

   329	
 > 330	__bpf_kfunc void bpf_kfunc_call_test_offset(struct prog_test_ref_kfunc *p)
   331	{
   332		WARN_ON_ONCE(1);
   333	}
   334	
   335	__bpf_kfunc struct prog_test_member *
 > 336	bpf_kfunc_call_memb_acquire(void)
   337	{
   338		WARN_ON_ONCE(1);
   339		return NULL;
   340	}
   341	
 > 342	__bpf_kfunc void bpf_kfunc_call_memb1_release(struct prog_test_member1 *p)
   343	{
   344		WARN_ON_ONCE(1);
   345	}
   346	
   347	static int *__bpf_kfunc_call_test_get_mem(struct prog_test_ref_kfunc *p, const int size)
   348	{
   349		if (size > 2 * sizeof(int))
   350			return NULL;
   351	
   352		return (int *)p;
   353	}
   354	
   355	__bpf_kfunc int *bpf_kfunc_call_test_get_rdwr_mem(struct prog_test_ref_kfunc *p,
   356							  const int rdwr_buf_size)
   357	{
   358		return __bpf_kfunc_call_test_get_mem(p, rdwr_buf_size);
   359	}
   360	
   361	__bpf_kfunc int *bpf_kfunc_call_test_get_rdonly_mem(struct prog_test_ref_kfunc *p,
   362							    const int rdonly_buf_size)
   363	{
   364		return __bpf_kfunc_call_test_get_mem(p, rdonly_buf_size);
   365	}
   366	
   367	/* the next 2 ones can't be really used for testing expect to ensure
   368	 * that the verifier rejects the call.
   369	 * Acquire functions must return struct pointers, so these ones are
   370	 * failing.
   371	 */
   372	__bpf_kfunc int *bpf_kfunc_call_test_acq_rdonly_mem(struct prog_test_ref_kfunc *p,
   373							    const int rdonly_buf_size)
   374	{
   375		return __bpf_kfunc_call_test_get_mem(p, rdonly_buf_size);
   376	}
   377	
   378	__bpf_kfunc void bpf_kfunc_call_int_mem_release(int *p)
   379	{
   380	}
   381	
   382	__bpf_kfunc void bpf_kfunc_call_test_pass_ctx(struct __sk_buff *skb)
   383	{
   384	}
   385	
   386	__bpf_kfunc void bpf_kfunc_call_test_pass1(struct prog_test_pass1 *p)
   387	{
   388	}
   389	
   390	__bpf_kfunc void bpf_kfunc_call_test_pass2(struct prog_test_pass2 *p)
   391	{
   392	}
   393	
 > 394	__bpf_kfunc void bpf_kfunc_call_test_fail1(struct prog_test_fail1 *p)
   395	{
   396	}
   397	
 > 398	__bpf_kfunc void bpf_kfunc_call_test_fail2(struct prog_test_fail2 *p)
   399	{
   400	}
   401	
 > 402	__bpf_kfunc void bpf_kfunc_call_test_fail3(struct prog_test_fail3 *p)
   403	{
   404	}
   405	
   406	__bpf_kfunc void bpf_kfunc_call_test_mem_len_pass1(void *mem, int mem__sz)
   407	{
   408	}
   409	
 > 410	__bpf_kfunc void bpf_kfunc_call_test_mem_len_fail1(void *mem, int len)
   411	{
   412	}
   413	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
