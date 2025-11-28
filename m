Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44DE2288C81
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Nov 2025 03:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764299272; cv=none; b=QMopCkfKWAR/FCTh0N3X5IO9bBWx51S9lKn7zzAaKzvAliRXg/TR6aijUVoj40WYyzRgv7VuwChE/R31Rq+0imoNCRhfYQqQj68VWIkxDYO68ce1NYE/oQd548D81wG2DyCWThIhlNHvvX3PsKLM58YHTyVdLrrP/WLk5hTyo+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764299272; c=relaxed/simple;
	bh=qTUag67bgmaMPlObFx/vZo9H/IyTyHIAE3ekavqyJKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Or2NIe0hRoBop43fnOxuqi0TWbJtTnNGxsUt1f/Nf+jMVg29CAUc8J0yfF4vY4VTKN97DGUpjjzVFpnSIfDC68iTx7gSA25AN0LG4TaBM7cnOhG+mbf+F0LI1kDxZdYxSytMVuwNViWF6clCUoiIpK1dQ7e8Et8PZHpJtenUaJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KR6Dm6q7; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KR6Dm6q7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764299271; x=1795835271;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qTUag67bgmaMPlObFx/vZo9H/IyTyHIAE3ekavqyJKk=;
  b=KR6Dm6q7jDdQ6LRro8p5c/UU4LsuYhvEzkhGtENXohwqhs1UsglQNDWt
   twcfu/t653RP5LIpodTh4U19Ux8x398fWPenyV1lbTat1WgoI67WBGL6R
   ERKMdaISRIqbdBtNZYhqhW1dZPT7bU6gcBxDXR7nrTqRmjCnDPyE16AcG
   TUuyMvHwR6JNcbLAkWihKnc4ONp2YuvXfGN3mGOUbKAxz6VvFGYZloWXk
   xd4DzC+y4ofKzDtjATdYqws4o7Xj45kxFm1Kz9XY9XgubSgoaMouKXPqg
   8bZ/DnBsNWHZ47o1JJH28D2EB/TX+Fkrw6H3ssA8PpTnSDPUazyne5B9V
   Q==;
X-CSE-ConnectionGUID: quDLZWrGQKSUMxxOl8gk3A==
X-CSE-MsgGUID: sXioHSw4TPit/RN7wmE5DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66372718"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="66372718"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 19:07:50 -0800
X-CSE-ConnectionGUID: Z32cTFh0QSC3wuYZgRhX4w==
X-CSE-MsgGUID: iygMuW/YSLmNoZO5+1Q+xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="197536835"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 27 Nov 2025 19:07:49 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOopn-000000001uv-0F4t;
	Fri, 28 Nov 2025 03:07:47 +0000
Date: Fri, 28 Nov 2025 04:07:16 +0100
From: kernel test robot <lkp@intel.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 3/5] mm: introduce VM_FAULT_UFFD_MINOR fault reason
Message-ID: <202511280432.OrK2ulRs-lkp@intel.com>
References: <20251125183840.2368510-4-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125183840.2368510-4-rppt@kernel.org>

Hi Mike,

kernel test robot noticed the following build errors:

[auto build test ERROR on 6a23ae0a96a600d1d12557add110e0bb6e32730c]

url:    https://github.com/intel-lab-lkp/linux/commits/Mike-Rapoport/userfaultfd-move-vma_can_userfault-out-of-line/20251126-024059
base:   6a23ae0a96a600d1d12557add110e0bb6e32730c
patch link:    https://lore.kernel.org/r/20251125183840.2368510-4-rppt%40kernel.org
patch subject: [PATCH v2 3/5] mm: introduce VM_FAULT_UFFD_MINOR fault reason
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251128/202511280432.OrK2ulRs-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251128/202511280432.OrK2ulRs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511280432.OrK2ulRs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:132,
                    from include/trace/events/fs_dax.h:208,
                    from fs/dax.c:30:
   include/trace/events/fs_dax.h: In function 'trace_raw_output_dax_pmd_fault_class':
>> include/trace/stages/stage3_trace_output.h:70:37: error: expected expression before ',' token
      70 |                         { flag_array, { -1, NULL }};                    \
         |                                     ^
   include/trace/trace_events.h:219:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     219 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   include/trace/events/fs_dax.h:38:9: note: in expansion of macro 'TP_printk'
      38 |         TP_printk("dev %d:%d ino %#lx %s %s address %#lx vm_start "
         |         ^~~~~~~~~
   include/trace/events/fs_dax.h:50:17: note: in expansion of macro '__print_flags'
      50 |                 __print_flags(__entry->result, "|", VM_FAULT_RESULT_TRACE)
         |                 ^~~~~~~~~~~~~
   include/trace/events/fs_dax.h: In function 'trace_raw_output_dax_pte_fault_class':
>> include/trace/stages/stage3_trace_output.h:70:37: error: expected expression before ',' token
      70 |                         { flag_array, { -1, NULL }};                    \
         |                                     ^
   include/trace/trace_events.h:219:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     219 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   include/trace/events/fs_dax.h:126:9: note: in expansion of macro 'TP_printk'
     126 |         TP_printk("dev %d:%d ino %#lx %s %s address %#lx pgoff %#lx %s",
         |         ^~~~~~~~~
   include/trace/events/fs_dax.h:134:17: note: in expansion of macro '__print_flags'
     134 |                 __print_flags(__entry->result, "|", VM_FAULT_RESULT_TRACE)
         |                 ^~~~~~~~~~~~~
--
   In file included from include/trace/define_trace.h:132,
                    from include/trace/events/f2fs.h:2407,
                    from fs/f2fs/super.c:41:
   include/trace/events/f2fs.h: In function 'trace_raw_output_f2fs_mmap':
>> include/trace/stages/stage3_trace_output.h:70:37: error: expected expression before ',' token
      70 |                         { flag_array, { -1, NULL }};                    \
         |                                     ^
   include/trace/trace_events.h:219:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     219 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   include/trace/events/f2fs.h:1432:9: note: in expansion of macro 'TP_printk'
    1432 |         TP_printk("dev = (%d,%d), ino = %lu, index = %lu, flags: %s, ret: %s",
         |         ^~~~~~~~~
   include/trace/events/f2fs.h:1436:17: note: in expansion of macro '__print_flags'
    1436 |                 __print_flags(__entry->ret, "|", VM_FAULT_RESULT_TRACE))
         |                 ^~~~~~~~~~~~~


vim +70 include/trace/stages/stage3_trace_output.h

1bc191051dca28 include/trace/stages/stage3_defines.h Linus Torvalds          2022-03-23  65  
af6b9668e85ffd include/trace/stages/stage3_defines.h Steven Rostedt (Google  2022-03-03  66) #undef __print_flags
af6b9668e85ffd include/trace/stages/stage3_defines.h Steven Rostedt (Google  2022-03-03  67) #define __print_flags(flag, delim, flag_array...)			\
af6b9668e85ffd include/trace/stages/stage3_defines.h Steven Rostedt (Google  2022-03-03  68) 	({								\
af6b9668e85ffd include/trace/stages/stage3_defines.h Steven Rostedt (Google  2022-03-03  69) 		static const struct trace_print_flags __flags[] =	\
af6b9668e85ffd include/trace/stages/stage3_defines.h Steven Rostedt (Google  2022-03-03 @70) 			{ flag_array, { -1, NULL }};			\
af6b9668e85ffd include/trace/stages/stage3_defines.h Steven Rostedt (Google  2022-03-03  71) 		trace_print_flags_seq(p, delim, flag, __flags);	\
af6b9668e85ffd include/trace/stages/stage3_defines.h Steven Rostedt (Google  2022-03-03  72) 	})
af6b9668e85ffd include/trace/stages/stage3_defines.h Steven Rostedt (Google  2022-03-03  73) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
