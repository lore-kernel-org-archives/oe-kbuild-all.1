Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336918C06
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Feb 2024 06:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707892526; cv=none; b=L2nhM7s4DI9v8e6JmDqILmVrTq8Jf2APNkHLknv5lhEXdCRYSkkRmIGZtXF2gpHcI6KVHfD5GbKRgt/qyK0cW4EV1Ay1jfL1z5LVlTygtxkmMdVrn2ZAJ47yGu57kd8Lg4yIK59IJ6UWPE3zl+x/Kppd4rR5djq8AL/JjMW6edg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707892526; c=relaxed/simple;
	bh=I+puxL3ELwB6xLk6EMbj9o+JP+PCUVR8uZ7mMn/QEdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IsyzR6J3UKtCsGnQSnqJ4iAXZQLAJmuRldo2yBONqGQxZyOZ0XMSCbWUWAUzNowBbZxn43MoHrHPQEMllU6EYMrelaN+iHCI/bCxJTCfiPwrlDRB6bqkuW+LqWTaugx3rQ14B2ZDNPty0MYy5cKr2iHb0SCMVkqfGPEK6mhtj+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=caXnDjej; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="caXnDjej"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707892524; x=1739428524;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I+puxL3ELwB6xLk6EMbj9o+JP+PCUVR8uZ7mMn/QEdI=;
  b=caXnDjejNpF8cEgHMsdmr+WrLu7YbRhxM6k7ZkIp2h2Umnt2gTDqCuDE
   lnWgMxE2Yc028Ajwr9i4uQhyge4cIubN2rSRRllAwTTHwab+F8BMxCYA0
   bFsUZ4A4OgzIEMfB8Y4V1fyzqQCfKKSYc+S901b4AK1ETdwZ5JH9qFHiZ
   aB6BvMKP3XdXHgFieYj6hyQmtiMElnoJ4xpFfKJlWyI5/QCYJciWVGM0E
   AHpBHJeOU9hrdx3K/JXWrbxYNLcVM5thOBkmbXt2w/Zx9s/c21aDUSQFd
   pxpvwzbKvwJ+NGFW46FYt/yLsiFID91N3/bGxNtKSN74tAfRhquJQvYFL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="5746980"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="5746980"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 22:35:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="7756425"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Feb 2024 22:35:17 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ra8rS-0008XM-0e;
	Wed, 14 Feb 2024 06:35:14 +0000
Date: Wed, 14 Feb 2024 14:34:43 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev, kent.overstreet@linux.dev,
	mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org,
	roman.gushchin@linux.dev, mgorman@suse.de, dave@stgolabs.net,
	willy@infradead.org, liam.howlett@oracle.com, corbet@lwn.net,
	void@manifault.com, peterz@infradead.org, juri.lelli@redhat.com,
	catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
	tglx@linutronix.de, mingo@redhat.com, dave.hansen@linux.intel.com,
	x86@kernel.org, peterx@redhat.com, david@redhat.com,
	axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org,
	nathan@kernel.org, dennis@kernel.org, tj@kernel.org,
	muchun.song@linux.dev
Subject: Re: [PATCH v3 13/35] lib: add allocation tagging support for memory
 allocation profiling
Message-ID: <202402141433.6RdB7XmN-lkp@intel.com>
References: <20240212213922.783301-14-surenb@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240212213922.783301-14-surenb@google.com>

Hi Suren,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-nonmm-unstable]
[also build test ERROR on linus/master v6.8-rc4]
[cannot apply to akpm-mm/mm-everything vbabka-slab/for-next next-20240213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan/lib-string_helpers-Add-flags-param-to-string_get_size/20240213-054335
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/20240212213922.783301-14-surenb%40google.com
patch subject: [PATCH v3 13/35] lib: add allocation tagging support for memory allocation profiling
config: arc-randconfig-r061-20240214 (https://download.01.org/0day-ci/archive/20240214/202402141433.6RdB7XmN-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240214/202402141433.6RdB7XmN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402141433.6RdB7XmN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:31,
                    from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/radix-tree.h:14,
                    from include/linux/idr.h:15,
                    from lib/codetag.c:3:
   lib/codetag.c: In function 'codetag_module_init':
>> lib/codetag.c:147:34: error: invalid use of undefined type 'struct module'
     147 |                         mod ? mod->name : "(built-in)");
         |                                  ^~
   include/linux/printk.h:427:33: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:508:9: note: in expansion of macro 'printk'
     508 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   lib/codetag.c:145:17: note: in expansion of macro 'pr_warn'
     145 |                 pr_warn("Failed to load code tags of type %s from the module %s\n",
         |                 ^~~~~~~
--
   In file included from ./arch/arc/include/generated/asm/percpu.h:1,
                    from include/linux/alloc_tag.h:12,
                    from lib/alloc_tag.c:2:
   include/linux/alloc_tag.h: In function '__alloc_tag_sub':
>> include/asm-generic/percpu.h:155:9: error: implicit declaration of function 'raw_local_irq_save' [-Werror=implicit-function-declaration]
     155 |         raw_local_irq_save(__flags);                                    \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:401:41: note: in expansion of macro 'this_cpu_generic_to_op'
     401 | #define this_cpu_add_1(pcp, val)        this_cpu_generic_to_op(pcp, val, +=)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:365:25: note: in expansion of macro 'this_cpu_add_1'
     365 |                 case 1: stem##1(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   include/linux/percpu-defs.h:491:41: note: in expansion of macro '__pcpu_size_call'
     491 | #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:500:41: note: in expansion of macro 'this_cpu_add'
     500 | #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, -(typeof(pcp))(val))
         |                                         ^~~~~~~~~~~~
   include/linux/alloc_tag.h:90:9: note: in expansion of macro 'this_cpu_sub'
      90 |         this_cpu_sub(tag->counters->bytes, bytes);
         |         ^~~~~~~~~~~~
>> include/asm-generic/percpu.h:157:9: error: implicit declaration of function 'raw_local_irq_restore' [-Werror=implicit-function-declaration]
     157 |         raw_local_irq_restore(__flags);                                 \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:401:41: note: in expansion of macro 'this_cpu_generic_to_op'
     401 | #define this_cpu_add_1(pcp, val)        this_cpu_generic_to_op(pcp, val, +=)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:365:25: note: in expansion of macro 'this_cpu_add_1'
     365 |                 case 1: stem##1(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   include/linux/percpu-defs.h:491:41: note: in expansion of macro '__pcpu_size_call'
     491 | #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:500:41: note: in expansion of macro 'this_cpu_add'
     500 | #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, -(typeof(pcp))(val))
         |                                         ^~~~~~~~~~~~
   include/linux/alloc_tag.h:90:9: note: in expansion of macro 'this_cpu_sub'
      90 |         this_cpu_sub(tag->counters->bytes, bytes);
         |         ^~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/raw_local_irq_save +155 include/asm-generic/percpu.h

e88d62cd4b2f0b Mark Rutland    2017-09-26  151  
eba117889ac444 Tejun Heo       2014-06-17  152  #define this_cpu_generic_to_op(pcp, val, op)				\
9c28278a24c01c Tejun Heo       2014-06-17  153  do {									\
eba117889ac444 Tejun Heo       2014-06-17  154  	unsigned long __flags;						\
eba117889ac444 Tejun Heo       2014-06-17 @155  	raw_local_irq_save(__flags);					\
1b5ca12127427c Nicholas Piggin 2016-09-22  156  	raw_cpu_generic_to_op(pcp, val, op);				\
eba117889ac444 Tejun Heo       2014-06-17 @157  	raw_local_irq_restore(__flags);					\
9c28278a24c01c Tejun Heo       2014-06-17  158  } while (0)
9c28278a24c01c Tejun Heo       2014-06-17  159  
1b5ca12127427c Nicholas Piggin 2016-09-22  160  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
