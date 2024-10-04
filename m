Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C6F1448DF
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Oct 2024 09:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728034395; cv=none; b=OkshtBf8OrJOGXJ4olBjtc+69kncmmgQO0+l8/GLwyGm9MhrMV3sOsP3wKKTenGa792IHVagXJzJvjeRGOkc4rWGcH5Xt1UtozU0Biqea9x8KHAk8xocBFJvn6UzBln9SkpdzimOdTr4oso93Sv23BL545022UVFVvabYq73vuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728034395; c=relaxed/simple;
	bh=qrDtkExd0SSxbEcyTCpEGO8tVqPmhvCaO0aKMA7EwZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i9DIPxkwbRcltaMyC6OwujQWY3SjRf/KJtql0C3t1F+JURAumP1GR/YBJL205+K8BDUVC/FHmrzqBL+UEVoiaepK71ll9pFjoOQWe0jQE4dxZ/EuH8kN9+tUvybbHOxHFpSHB+s+dx1U/jpJAZ2/UcG+uqfVLeMn9wMXtxHC5R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VzfiUDu0; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VzfiUDu0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728034393; x=1759570393;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qrDtkExd0SSxbEcyTCpEGO8tVqPmhvCaO0aKMA7EwZw=;
  b=VzfiUDu0Fhf+/ChNVX+rl8rfIj5siKoYEJ5HHt4maGvelKMQeh/K0m0A
   HhaYmrVPAnZyVlLXo22o1hobTebRdkh0jYGQl61mtoh3lG0mCx5EBJuLZ
   GvxbbLHWY1CIOfznmgT6yiX3ggqa1cZCNtx4cQkto2Ttd5XXgWoOkonYA
   N5suoXkQ58yCqm/Z5BBtfhtgRlwt1+ZAhMjZ7WPpeOrrQb1+vqNmnL3zi
   52M8S440GigLon9YjNCufvcOmenyt8DsosPVXBHvn3japj3xS+rfxQ5xs
   lBGFNnvH8nVjTjFghPwml3+qOVzG7GUx6LKd7iPaq3mIv+9b0F9+/DaV6
   w==;
X-CSE-ConnectionGUID: kuUwjwFrQEuk+2CdKg9Jqg==
X-CSE-MsgGUID: ugPLRmLBTySW3D7sOSysPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27135696"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="27135696"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 02:33:12 -0700
X-CSE-ConnectionGUID: DlzfAyp1T46vQOdm3O7PpQ==
X-CSE-MsgGUID: gg+HTlwvQuaISNacb4PWlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="74666496"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 04 Oct 2024 02:33:10 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swegO-0001QW-2I;
	Fri, 04 Oct 2024 09:33:08 +0000
Date: Fri, 4 Oct 2024 17:33:03 +0800
From: kernel test robot <lkp@intel.com>
To: Xiaofeng Lian <1198715581lxf@gmail.com>, stefani@seibold.net,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Xiaofeng Lian <1198715581lxf@gmail.com>
Subject: Re: [PATCH] include/linux/kfifo.h
Message-ID: <202410041700.hpvbX22r-lkp@intel.com>
References: <20241002161437.376042-1-1198715581lxf@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002161437.376042-1-1198715581lxf@gmail.com>

Hi Xiaofeng,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.12-rc1 next-20241004]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xiaofeng-Lian/include-linux-kfifo-h/20241003-002015
base:   linus/master
patch link:    https://lore.kernel.org/r/20241002161437.376042-1-1198715581lxf%40gmail.com
patch subject: [PATCH] include/linux/kfifo.h
config: sparc64-randconfig-r073-20241004 (https://download.01.org/0day-ci/archive/20241004/202410041700.hpvbX22r-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410041700.hpvbX22r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410041700.hpvbX22r-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpio/gpiolib-cdev.c:20:
   drivers/gpio/gpiolib-cdev.c: In function 'linereq_create':
>> include/linux/kfifo.h:130:49: error: 'struct gpio_v2_line_event' has no member named 'type'
     130 | #define get_stack_data_type(fifo) typeof(*(fifo)->type)
         |                                                 ^~
   include/linux/kfifo.h:61:17: note: in definition of macro '__STRUCT_KFIFO_COMMON'
      61 |                 datatype        *type; \
         |                 ^~~~~~~~
   include/linux/kfifo.h:84:16: note: in expansion of macro '__STRUCT_KFIFO_PTR'
      84 |         struct __STRUCT_KFIFO_PTR(type, 0, type)
         |                ^~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:116:41: note: in expansion of macro 'STRUCT_KFIFO_PTR'
     116 | #define DECLARE_KFIFO_PTR(fifo, type)   STRUCT_KFIFO_PTR(type) fifo
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/kfifo.h:138:17: note: in expansion of macro 'DECLARE_KFIFO_PTR'
     138 |                 DECLARE_KFIFO_PTR(__tmp_stack, get_stack_data_type(fifo));\
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:138:48: note: in expansion of macro 'get_stack_data_type'
     138 |                 DECLARE_KFIFO_PTR(__tmp_stack, get_stack_data_type(fifo));\
         |                                                ^~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:151:53: note: in expansion of macro '__STACK_SIZE'
     151 |         __kfifo->mask = __is_kfifo_ptr(__tmp) ? 0 : __STACK_SIZE(__tmp->buf) - 1;\
         |                                                     ^~~~~~~~~~~~
   drivers/gpio/gpiolib-cdev.c:1782:9: note: in expansion of macro 'INIT_KFIFO'
    1782 |         INIT_KFIFO(lr->events);
         |         ^~~~~~~~~~
>> include/linux/kfifo.h:130:49: error: 'struct gpio_v2_line_event' has no member named 'type'
     130 | #define get_stack_data_type(fifo) typeof(*(fifo)->type)
         |                                                 ^~
   include/linux/kfifo.h:62:23: note: in definition of macro '__STRUCT_KFIFO_COMMON'
      62 |                 const datatype  *const_type; \
         |                       ^~~~~~~~
   include/linux/kfifo.h:84:16: note: in expansion of macro '__STRUCT_KFIFO_PTR'
      84 |         struct __STRUCT_KFIFO_PTR(type, 0, type)
         |                ^~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:116:41: note: in expansion of macro 'STRUCT_KFIFO_PTR'
     116 | #define DECLARE_KFIFO_PTR(fifo, type)   STRUCT_KFIFO_PTR(type) fifo
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/kfifo.h:138:17: note: in expansion of macro 'DECLARE_KFIFO_PTR'
     138 |                 DECLARE_KFIFO_PTR(__tmp_stack, get_stack_data_type(fifo));\
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:138:48: note: in expansion of macro 'get_stack_data_type'
     138 |                 DECLARE_KFIFO_PTR(__tmp_stack, get_stack_data_type(fifo));\
         |                                                ^~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:151:53: note: in expansion of macro '__STACK_SIZE'
     151 |         __kfifo->mask = __is_kfifo_ptr(__tmp) ? 0 : __STACK_SIZE(__tmp->buf) - 1;\
         |                                                     ^~~~~~~~~~~~
   drivers/gpio/gpiolib-cdev.c:1782:9: note: in expansion of macro 'INIT_KFIFO'
    1782 |         INIT_KFIFO(lr->events);
         |         ^~~~~~~~~~
>> include/linux/kfifo.h:130:49: error: 'struct gpio_v2_line_event' has no member named 'type'
     130 | #define get_stack_data_type(fifo) typeof(*(fifo)->type)
         |                                                 ^~
   include/linux/kfifo.h:64:17: note: in definition of macro '__STRUCT_KFIFO_COMMON'
      64 |                 ptrtype         *ptr; \
         |                 ^~~~~~~
   include/linux/kfifo.h:84:16: note: in expansion of macro '__STRUCT_KFIFO_PTR'
      84 |         struct __STRUCT_KFIFO_PTR(type, 0, type)
         |                ^~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:116:41: note: in expansion of macro 'STRUCT_KFIFO_PTR'
     116 | #define DECLARE_KFIFO_PTR(fifo, type)   STRUCT_KFIFO_PTR(type) fifo
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/kfifo.h:138:17: note: in expansion of macro 'DECLARE_KFIFO_PTR'
     138 |                 DECLARE_KFIFO_PTR(__tmp_stack, get_stack_data_type(fifo));\
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:138:48: note: in expansion of macro 'get_stack_data_type'
     138 |                 DECLARE_KFIFO_PTR(__tmp_stack, get_stack_data_type(fifo));\
         |                                                ^~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:151:53: note: in expansion of macro '__STACK_SIZE'
     151 |         __kfifo->mask = __is_kfifo_ptr(__tmp) ? 0 : __STACK_SIZE(__tmp->buf) - 1;\
         |                                                     ^~~~~~~~~~~~
   drivers/gpio/gpiolib-cdev.c:1782:9: note: in expansion of macro 'INIT_KFIFO'
    1782 |         INIT_KFIFO(lr->events);
         |         ^~~~~~~~~~
>> include/linux/kfifo.h:130:49: error: 'struct gpio_v2_line_event' has no member named 'type'
     130 | #define get_stack_data_type(fifo) typeof(*(fifo)->type)
         |                                                 ^~
   include/linux/kfifo.h:65:17: note: in definition of macro '__STRUCT_KFIFO_COMMON'
      65 |                 ptrtype const   *ptr_const; \
         |                 ^~~~~~~
   include/linux/kfifo.h:84:16: note: in expansion of macro '__STRUCT_KFIFO_PTR'
      84 |         struct __STRUCT_KFIFO_PTR(type, 0, type)
         |                ^~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:116:41: note: in expansion of macro 'STRUCT_KFIFO_PTR'
     116 | #define DECLARE_KFIFO_PTR(fifo, type)   STRUCT_KFIFO_PTR(type) fifo
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/kfifo.h:138:17: note: in expansion of macro 'DECLARE_KFIFO_PTR'
     138 |                 DECLARE_KFIFO_PTR(__tmp_stack, get_stack_data_type(fifo));\
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:138:48: note: in expansion of macro 'get_stack_data_type'
     138 |                 DECLARE_KFIFO_PTR(__tmp_stack, get_stack_data_type(fifo));\
         |                                                ^~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:151:53: note: in expansion of macro '__STACK_SIZE'
     151 |         __kfifo->mask = __is_kfifo_ptr(__tmp) ? 0 : __STACK_SIZE(__tmp->buf) - 1;\
         |                                                     ^~~~~~~~~~~~
   drivers/gpio/gpiolib-cdev.c:1782:9: note: in expansion of macro 'INIT_KFIFO'
    1782 |         INIT_KFIFO(lr->events);
         |         ^~~~~~~~~~
>> include/linux/kfifo.h:130:49: error: 'struct gpio_v2_line_event' has no member named 'type'
     130 | #define get_stack_data_type(fifo) typeof(*(fifo)->type)
         |                                                 ^~
   include/linux/kfifo.h:80:9: note: in definition of macro '__STRUCT_KFIFO_PTR'
      80 |         type            buf[0]; \
         |         ^~~~
   include/linux/kfifo.h:116:41: note: in expansion of macro 'STRUCT_KFIFO_PTR'
     116 | #define DECLARE_KFIFO_PTR(fifo, type)   STRUCT_KFIFO_PTR(type) fifo
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/kfifo.h:138:17: note: in expansion of macro 'DECLARE_KFIFO_PTR'
     138 |                 DECLARE_KFIFO_PTR(__tmp_stack, get_stack_data_type(fifo));\
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:138:48: note: in expansion of macro 'get_stack_data_type'
     138 |                 DECLARE_KFIFO_PTR(__tmp_stack, get_stack_data_type(fifo));\
         |                                                ^~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:151:53: note: in expansion of macro '__STACK_SIZE'
     151 |         __kfifo->mask = __is_kfifo_ptr(__tmp) ? 0 : __STACK_SIZE(__tmp->buf) - 1;\
         |                                                     ^~~~~~~~~~~~
   drivers/gpio/gpiolib-cdev.c:1782:9: note: in expansion of macro 'INIT_KFIFO'
    1782 |         INIT_KFIFO(lr->events);
         |         ^~~~~~~~~~
>> include/linux/kfifo.h:130:49: error: 'struct gpio_v2_line_event' has no member named 'type'
     130 | #define get_stack_data_type(fifo) typeof(*(fifo)->type)
         |                                                 ^~
   include/linux/kfifo.h:139:66: note: in expansion of macro 'get_stack_data_type'
     139 |                 (sizeof(*(fifo)) - sizeof(__tmp_stack)) / sizeof(get_stack_data_type(fifo));\
         |                                                                  ^~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:151:53: note: in expansion of macro '__STACK_SIZE'
     151 |         __kfifo->mask = __is_kfifo_ptr(__tmp) ? 0 : __STACK_SIZE(__tmp->buf) - 1;\
         |                                                     ^~~~~~~~~~~~
   drivers/gpio/gpiolib-cdev.c:1782:9: note: in expansion of macro 'INIT_KFIFO'
    1782 |         INIT_KFIFO(lr->events);
         |         ^~~~~~~~~~
   drivers/gpio/gpiolib-cdev.c: In function 'lineevent_create':
>> include/linux/kfifo.h:130:49: error: 'struct gpioevent_data' has no member named 'type'
     130 | #define get_stack_data_type(fifo) typeof(*(fifo)->type)
         |                                                 ^~
   include/linux/kfifo.h:61:17: note: in definition of macro '__STRUCT_KFIFO_COMMON'
      61 |                 datatype        *type; \
         |                 ^~~~~~~~
   include/linux/kfifo.h:84:16: note: in expansion of macro '__STRUCT_KFIFO_PTR'
      84 |         struct __STRUCT_KFIFO_PTR(type, 0, type)
         |                ^~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:116:41: note: in expansion of macro 'STRUCT_KFIFO_PTR'
     116 | #define DECLARE_KFIFO_PTR(fifo, type)   STRUCT_KFIFO_PTR(type) fifo
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/kfifo.h:138:17: note: in expansion of macro 'DECLARE_KFIFO_PTR'
     138 |                 DECLARE_KFIFO_PTR(__tmp_stack, get_stack_data_type(fifo));\
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:138:48: note: in expansion of macro 'get_stack_data_type'
     138 |                 DECLARE_KFIFO_PTR(__tmp_stack, get_stack_data_type(fifo));\
         |                                                ^~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:151:53: note: in expansion of macro '__STACK_SIZE'
     151 |         __kfifo->mask = __is_kfifo_ptr(__tmp) ? 0 : __STACK_SIZE(__tmp->buf) - 1;\
         |                                                     ^~~~~~~~~~~~
   drivers/gpio/gpiolib-cdev.c:2245:9: note: in expansion of macro 'INIT_KFIFO'
    2245 |         INIT_KFIFO(le->events);
         |         ^~~~~~~~~~
>> include/linux/kfifo.h:130:49: error: 'struct gpioevent_data' has no member named 'type'
     130 | #define get_stack_data_type(fifo) typeof(*(fifo)->type)
         |                                                 ^~
   include/linux/kfifo.h:62:23: note: in definition of macro '__STRUCT_KFIFO_COMMON'
      62 |                 const datatype  *const_type; \
         |                       ^~~~~~~~
   include/linux/kfifo.h:84:16: note: in expansion of macro '__STRUCT_KFIFO_PTR'
      84 |         struct __STRUCT_KFIFO_PTR(type, 0, type)
         |                ^~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:116:41: note: in expansion of macro 'STRUCT_KFIFO_PTR'
     116 | #define DECLARE_KFIFO_PTR(fifo, type)   STRUCT_KFIFO_PTR(type) fifo
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/kfifo.h:138:17: note: in expansion of macro 'DECLARE_KFIFO_PTR'
     138 |                 DECLARE_KFIFO_PTR(__tmp_stack, get_stack_data_type(fifo));\
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:138:48: note: in expansion of macro 'get_stack_data_type'
     138 |                 DECLARE_KFIFO_PTR(__tmp_stack, get_stack_data_type(fifo));\
         |                                                ^~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:151:53: note: in expansion of macro '__STACK_SIZE'
     151 |         __kfifo->mask = __is_kfifo_ptr(__tmp) ? 0 : __STACK_SIZE(__tmp->buf) - 1;\
         |                                                     ^~~~~~~~~~~~
   drivers/gpio/gpiolib-cdev.c:2245:9: note: in expansion of macro 'INIT_KFIFO'
    2245 |         INIT_KFIFO(le->events);
         |         ^~~~~~~~~~
>> include/linux/kfifo.h:130:49: error: 'struct gpioevent_data' has no member named 'type'
     130 | #define get_stack_data_type(fifo) typeof(*(fifo)->type)
         |                                                 ^~
   include/linux/kfifo.h:64:17: note: in definition of macro '__STRUCT_KFIFO_COMMON'
      64 |                 ptrtype         *ptr; \
         |                 ^~~~~~~
   include/linux/kfifo.h:84:16: note: in expansion of macro '__STRUCT_KFIFO_PTR'
      84 |         struct __STRUCT_KFIFO_PTR(type, 0, type)
         |                ^~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:116:41: note: in expansion of macro 'STRUCT_KFIFO_PTR'
     116 | #define DECLARE_KFIFO_PTR(fifo, type)   STRUCT_KFIFO_PTR(type) fifo
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/kfifo.h:138:17: note: in expansion of macro 'DECLARE_KFIFO_PTR'
     138 |                 DECLARE_KFIFO_PTR(__tmp_stack, get_stack_data_type(fifo));\
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:138:48: note: in expansion of macro 'get_stack_data_type'
     138 |                 DECLARE_KFIFO_PTR(__tmp_stack, get_stack_data_type(fifo));\
         |                                                ^~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:151:53: note: in expansion of macro '__STACK_SIZE'
     151 |         __kfifo->mask = __is_kfifo_ptr(__tmp) ? 0 : __STACK_SIZE(__tmp->buf) - 1;\
         |                                                     ^~~~~~~~~~~~
   drivers/gpio/gpiolib-cdev.c:2245:9: note: in expansion of macro 'INIT_KFIFO'
    2245 |         INIT_KFIFO(le->events);
         |         ^~~~~~~~~~
>> include/linux/kfifo.h:130:49: error: 'struct gpioevent_data' has no member named 'type'
     130 | #define get_stack_data_type(fifo) typeof(*(fifo)->type)
         |                                                 ^~
   include/linux/kfifo.h:65:17: note: in definition of macro '__STRUCT_KFIFO_COMMON'
      65 |                 ptrtype const   *ptr_const; \
         |                 ^~~~~~~
   include/linux/kfifo.h:84:16: note: in expansion of macro '__STRUCT_KFIFO_PTR'
      84 |         struct __STRUCT_KFIFO_PTR(type, 0, type)
         |                ^~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:116:41: note: in expansion of macro 'STRUCT_KFIFO_PTR'
     116 | #define DECLARE_KFIFO_PTR(fifo, type)   STRUCT_KFIFO_PTR(type) fifo
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/kfifo.h:138:17: note: in expansion of macro 'DECLARE_KFIFO_PTR'
     138 |                 DECLARE_KFIFO_PTR(__tmp_stack, get_stack_data_type(fifo));\
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:138:48: note: in expansion of macro 'get_stack_data_type'
     138 |                 DECLARE_KFIFO_PTR(__tmp_stack, get_stack_data_type(fifo));\
         |                                                ^~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:151:53: note: in expansion of macro '__STACK_SIZE'
     151 |         __kfifo->mask = __is_kfifo_ptr(__tmp) ? 0 : __STACK_SIZE(__tmp->buf) - 1;\
         |                                                     ^~~~~~~~~~~~
   drivers/gpio/gpiolib-cdev.c:2245:9: note: in expansion of macro 'INIT_KFIFO'
    2245 |         INIT_KFIFO(le->events);
         |         ^~~~~~~~~~
>> include/linux/kfifo.h:130:49: error: 'struct gpioevent_data' has no member named 'type'
     130 | #define get_stack_data_type(fifo) typeof(*(fifo)->type)
         |                                                 ^~
   include/linux/kfifo.h:80:9: note: in definition of macro '__STRUCT_KFIFO_PTR'
      80 |         type            buf[0]; \
         |         ^~~~
   include/linux/kfifo.h:116:41: note: in expansion of macro 'STRUCT_KFIFO_PTR'
     116 | #define DECLARE_KFIFO_PTR(fifo, type)   STRUCT_KFIFO_PTR(type) fifo
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/kfifo.h:138:17: note: in expansion of macro 'DECLARE_KFIFO_PTR'
     138 |                 DECLARE_KFIFO_PTR(__tmp_stack, get_stack_data_type(fifo));\
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:138:48: note: in expansion of macro 'get_stack_data_type'
     138 |                 DECLARE_KFIFO_PTR(__tmp_stack, get_stack_data_type(fifo));\
         |                                                ^~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:151:53: note: in expansion of macro '__STACK_SIZE'
     151 |         __kfifo->mask = __is_kfifo_ptr(__tmp) ? 0 : __STACK_SIZE(__tmp->buf) - 1;\
         |                                                     ^~~~~~~~~~~~
   drivers/gpio/gpiolib-cdev.c:2245:9: note: in expansion of macro 'INIT_KFIFO'
    2245 |         INIT_KFIFO(le->events);
         |         ^~~~~~~~~~
>> include/linux/kfifo.h:130:49: error: 'struct gpioevent_data' has no member named 'type'
     130 | #define get_stack_data_type(fifo) typeof(*(fifo)->type)
         |                                                 ^~
   include/linux/kfifo.h:139:66: note: in expansion of macro 'get_stack_data_type'
     139 |                 (sizeof(*(fifo)) - sizeof(__tmp_stack)) / sizeof(get_stack_data_type(fifo));\
         |                                                                  ^~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:151:53: note: in expansion of macro '__STACK_SIZE'
     151 |         __kfifo->mask = __is_kfifo_ptr(__tmp) ? 0 : __STACK_SIZE(__tmp->buf) - 1;\
         |                                                     ^~~~~~~~~~~~
   drivers/gpio/gpiolib-cdev.c:2245:9: note: in expansion of macro 'INIT_KFIFO'
    2245 |         INIT_KFIFO(le->events);
         |         ^~~~~~~~~~
   drivers/gpio/gpiolib-cdev.c: In function 'gpio_chrdev_open':
>> include/linux/kfifo.h:130:49: error: 'struct gpio_v2_line_info_changed' has no member named 'type'
     130 | #define get_stack_data_type(fifo) typeof(*(fifo)->type)
         |                                                 ^~
   include/linux/kfifo.h:61:17: note: in definition of macro '__STRUCT_KFIFO_COMMON'
      61 |                 datatype        *type; \
         |                 ^~~~~~~~
   include/linux/kfifo.h:84:16: note: in expansion of macro '__STRUCT_KFIFO_PTR'
      84 |         struct __STRUCT_KFIFO_PTR(type, 0, type)
         |                ^~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:116:41: note: in expansion of macro 'STRUCT_KFIFO_PTR'
     116 | #define DECLARE_KFIFO_PTR(fifo, type)   STRUCT_KFIFO_PTR(type) fifo
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/kfifo.h:138:17: note: in expansion of macro 'DECLARE_KFIFO_PTR'
     138 |                 DECLARE_KFIFO_PTR(__tmp_stack, get_stack_data_type(fifo));\
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:138:48: note: in expansion of macro 'get_stack_data_type'
     138 |                 DECLARE_KFIFO_PTR(__tmp_stack, get_stack_data_type(fifo));\
         |                                                ^~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:151:53: note: in expansion of macro '__STACK_SIZE'
     151 |         __kfifo->mask = __is_kfifo_ptr(__tmp) ? 0 : __STACK_SIZE(__tmp->buf) - 1;\
         |                                                     ^~~~~~~~~~~~
   drivers/gpio/gpiolib-cdev.c:2777:9: note: in expansion of macro 'INIT_KFIFO'
    2777 |         INIT_KFIFO(cdev->events);
         |         ^~~~~~~~~~
>> include/linux/kfifo.h:130:49: error: 'struct gpio_v2_line_info_changed' has no member named 'type'
     130 | #define get_stack_data_type(fifo) typeof(*(fifo)->type)
         |                                                 ^~
   include/linux/kfifo.h:62:23: note: in definition of macro '__STRUCT_KFIFO_COMMON'
      62 |                 const datatype  *const_type; \
         |                       ^~~~~~~~
   include/linux/kfifo.h:84:16: note: in expansion of macro '__STRUCT_KFIFO_PTR'
      84 |         struct __STRUCT_KFIFO_PTR(type, 0, type)
         |                ^~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:116:41: note: in expansion of macro 'STRUCT_KFIFO_PTR'
     116 | #define DECLARE_KFIFO_PTR(fifo, type)   STRUCT_KFIFO_PTR(type) fifo
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/kfifo.h:138:17: note: in expansion of macro 'DECLARE_KFIFO_PTR'
     138 |                 DECLARE_KFIFO_PTR(__tmp_stack, get_stack_data_type(fifo));\
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:138:48: note: in expansion of macro 'get_stack_data_type'
     138 |                 DECLARE_KFIFO_PTR(__tmp_stack, get_stack_data_type(fifo));\
         |                                                ^~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:151:53: note: in expansion of macro '__STACK_SIZE'
     151 |         __kfifo->mask = __is_kfifo_ptr(__tmp) ? 0 : __STACK_SIZE(__tmp->buf) - 1;\
         |                                                     ^~~~~~~~~~~~
   drivers/gpio/gpiolib-cdev.c:2777:9: note: in expansion of macro 'INIT_KFIFO'
    2777 |         INIT_KFIFO(cdev->events);
         |         ^~~~~~~~~~
>> include/linux/kfifo.h:130:49: error: 'struct gpio_v2_line_info_changed' has no member named 'type'
     130 | #define get_stack_data_type(fifo) typeof(*(fifo)->type)
         |                                                 ^~
   include/linux/kfifo.h:64:17: note: in definition of macro '__STRUCT_KFIFO_COMMON'
      64 |                 ptrtype         *ptr; \
         |                 ^~~~~~~
   include/linux/kfifo.h:84:16: note: in expansion of macro '__STRUCT_KFIFO_PTR'
      84 |         struct __STRUCT_KFIFO_PTR(type, 0, type)
         |                ^~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:116:41: note: in expansion of macro 'STRUCT_KFIFO_PTR'
     116 | #define DECLARE_KFIFO_PTR(fifo, type)   STRUCT_KFIFO_PTR(type) fifo
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/kfifo.h:138:17: note: in expansion of macro 'DECLARE_KFIFO_PTR'
     138 |                 DECLARE_KFIFO_PTR(__tmp_stack, get_stack_data_type(fifo));\
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:138:48: note: in expansion of macro 'get_stack_data_type'
     138 |                 DECLARE_KFIFO_PTR(__tmp_stack, get_stack_data_type(fifo));\
         |                                                ^~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:151:53: note: in expansion of macro '__STACK_SIZE'
     151 |         __kfifo->mask = __is_kfifo_ptr(__tmp) ? 0 : __STACK_SIZE(__tmp->buf) - 1;\
         |                                                     ^~~~~~~~~~~~
   drivers/gpio/gpiolib-cdev.c:2777:9: note: in expansion of macro 'INIT_KFIFO'
    2777 |         INIT_KFIFO(cdev->events);
         |         ^~~~~~~~~~
>> include/linux/kfifo.h:130:49: error: 'struct gpio_v2_line_info_changed' has no member named 'type'
     130 | #define get_stack_data_type(fifo) typeof(*(fifo)->type)
         |                                                 ^~
   include/linux/kfifo.h:65:17: note: in definition of macro '__STRUCT_KFIFO_COMMON'
      65 |                 ptrtype const   *ptr_const; \
         |                 ^~~~~~~
   include/linux/kfifo.h:84:16: note: in expansion of macro '__STRUCT_KFIFO_PTR'
      84 |         struct __STRUCT_KFIFO_PTR(type, 0, type)
         |                ^~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:116:41: note: in expansion of macro 'STRUCT_KFIFO_PTR'
     116 | #define DECLARE_KFIFO_PTR(fifo, type)   STRUCT_KFIFO_PTR(type) fifo
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/kfifo.h:138:17: note: in expansion of macro 'DECLARE_KFIFO_PTR'
     138 |                 DECLARE_KFIFO_PTR(__tmp_stack, get_stack_data_type(fifo));\
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:138:48: note: in expansion of macro 'get_stack_data_type'
     138 |                 DECLARE_KFIFO_PTR(__tmp_stack, get_stack_data_type(fifo));\
         |                                                ^~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:151:53: note: in expansion of macro '__STACK_SIZE'
     151 |         __kfifo->mask = __is_kfifo_ptr(__tmp) ? 0 : __STACK_SIZE(__tmp->buf) - 1;\
         |                                                     ^~~~~~~~~~~~
   drivers/gpio/gpiolib-cdev.c:2777:9: note: in expansion of macro 'INIT_KFIFO'
    2777 |         INIT_KFIFO(cdev->events);
         |         ^~~~~~~~~~
>> include/linux/kfifo.h:130:49: error: 'struct gpio_v2_line_info_changed' has no member named 'type'
     130 | #define get_stack_data_type(fifo) typeof(*(fifo)->type)
         |                                                 ^~
   include/linux/kfifo.h:80:9: note: in definition of macro '__STRUCT_KFIFO_PTR'
      80 |         type            buf[0]; \
         |         ^~~~
   include/linux/kfifo.h:116:41: note: in expansion of macro 'STRUCT_KFIFO_PTR'
     116 | #define DECLARE_KFIFO_PTR(fifo, type)   STRUCT_KFIFO_PTR(type) fifo
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/kfifo.h:138:17: note: in expansion of macro 'DECLARE_KFIFO_PTR'
     138 |                 DECLARE_KFIFO_PTR(__tmp_stack, get_stack_data_type(fifo));\
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:138:48: note: in expansion of macro 'get_stack_data_type'
     138 |                 DECLARE_KFIFO_PTR(__tmp_stack, get_stack_data_type(fifo));\
         |                                                ^~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:151:53: note: in expansion of macro '__STACK_SIZE'
     151 |         __kfifo->mask = __is_kfifo_ptr(__tmp) ? 0 : __STACK_SIZE(__tmp->buf) - 1;\
         |                                                     ^~~~~~~~~~~~
   drivers/gpio/gpiolib-cdev.c:2777:9: note: in expansion of macro 'INIT_KFIFO'
    2777 |         INIT_KFIFO(cdev->events);
         |         ^~~~~~~~~~
>> include/linux/kfifo.h:130:49: error: 'struct gpio_v2_line_info_changed' has no member named 'type'
     130 | #define get_stack_data_type(fifo) typeof(*(fifo)->type)
         |                                                 ^~
   include/linux/kfifo.h:139:66: note: in expansion of macro 'get_stack_data_type'
     139 |                 (sizeof(*(fifo)) - sizeof(__tmp_stack)) / sizeof(get_stack_data_type(fifo));\
         |                                                                  ^~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:151:53: note: in expansion of macro '__STACK_SIZE'
     151 |         __kfifo->mask = __is_kfifo_ptr(__tmp) ? 0 : __STACK_SIZE(__tmp->buf) - 1;\
         |                                                     ^~~~~~~~~~~~
   drivers/gpio/gpiolib-cdev.c:2777:9: note: in expansion of macro 'INIT_KFIFO'
    2777 |         INIT_KFIFO(cdev->events);
         |         ^~~~~~~~~~
..


vim +130 include/linux/kfifo.h

   125	
   126	/**
   127	 * get_kfifo_data_type - macro to get type of kfifo's member
   128	 * @fifo: pointer of kfifo
   129	 */
 > 130	#define get_stack_data_type(fifo) typeof(*(fifo)->type)
   131	
   132	/**
   133	 * __STACK_SIZE - macro to calculate kfifo's buffer size
   134	 * @fifo: pointer of kfifo
   135	 */
   136	#define __STACK_SIZE(fifo)\
   137		({\
   138			DECLARE_KFIFO_PTR(__tmp_stack, get_stack_data_type(fifo));\
   139			(sizeof(*(fifo)) - sizeof(__tmp_stack)) / sizeof(get_stack_data_type(fifo));\
   140		 })
   141	/**
   142	 * INIT_KFIFO - Initialize a fifo declared by DECLARE_KFIFO
   143	 * @fifo: name of the declared fifo datatype
   144	 */
   145	#define INIT_KFIFO(fifo) \
   146	(void)({ \
   147		typeof(&(fifo)) __tmp = &(fifo); \
   148		struct __kfifo *__kfifo = &__tmp->kfifo; \
   149		__kfifo->in = 0; \
   150		__kfifo->out = 0; \
 > 151		__kfifo->mask = __is_kfifo_ptr(__tmp) ? 0 : __STACK_SIZE(__tmp->buf) - 1;\
   152		__kfifo->esize = sizeof(*__tmp->buf); \
   153		__kfifo->data = __is_kfifo_ptr(__tmp) ?  NULL : __tmp->buf; \
   154	})
   155	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
