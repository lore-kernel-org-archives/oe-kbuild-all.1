Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7A279C2
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Apr 2023 22:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680991396; x=1712527396;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z3SF3+TBGfZAp8jidJTsBrmxQCXNlQ3ZTZrpn1Mz+U8=;
  b=FQ3Usye7CMD78gSec4J0FSbPknE3Kw3MAyThSRoGw3VtN5LChsGlBo5u
   bP0IW9uBXfu5rQeeciotxq+Ox0D/vAQZUcAwrZMemwdzit+iHQZWgpgQY
   ACCyx6b000jU8dcS3W+Szi+LReq+UgeR5GlZ5fnGIpcNvdMztybmvtG+g
   GwCj2rgjN+mqPrrYIp5jPlonPalXItGCymOUOVfC5okwKuWkSLqQq1Xcz
   CZvvSoL/WUcNLhKwa3RpJ3bgjV7lW9FVC7iGF/TXSe7/8s0bm3QYaNehP
   XSEtbTAvpo5n43st+eknKwGh+MbtzwMgQ9x9CvxdFUZq0h3cxCIlH+Hgd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10674"; a="327259167"
X-IronPort-AV: E=Sophos;i="5.98,330,1673942400"; 
   d="scan'208";a="327259167"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2023 15:03:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10674"; a="690373743"
X-IronPort-AV: E=Sophos;i="5.98,330,1673942400"; 
   d="scan'208";a="690373743"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 08 Apr 2023 15:03:14 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1plGeP-000U9B-28;
	Sat, 08 Apr 2023 22:03:13 +0000
Date: Sun, 9 Apr 2023 06:02:47 +0800
From: kernel test robot <lkp@intel.com>
To: Dexuan Cui <decui@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dcui-tdx:decui/michaelv7dda/tdx/v4-dda 4/14]
 drivers/hv/vmbus_drv.c:2178:24: warning: format '%llx' expects argument of
 type 'long long unsigned int', but argument 2 has type 'resource_size_t'
 {aka 'unsigned int'}
Message-ID: <202304090552.qRSoSAQz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/dcui/tdx decui/michaelv7dda/tdx/v4-dda
head:   ee475770ca8b9c70a2f41ec136e5d6124fd82ae9
commit: f2590983760f15765fd05ee1cfc9ec63a5bea359 [4/14] [Workaround for DDA]: hardcode MMIO _CRS in vmbus_walk_resources() for now
config: i386-randconfig-a005 (https://download.01.org/0day-ci/archive/20230409/202304090552.qRSoSAQz-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/dcui/tdx/commit/f2590983760f15765fd05ee1cfc9ec63a5bea359
        git remote add dcui-tdx https://github.com/dcui/tdx
        git fetch --no-tags dcui-tdx decui/michaelv7dda/tdx/v4-dda
        git checkout f2590983760f15765fd05ee1cfc9ec63a5bea359
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304090552.qRSoSAQz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:29,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/nospec-branch.h:14,
                    from arch/x86/include/asm/paravirt_types.h:27,
                    from arch/x86/include/asm/ptrace.h:97,
                    from arch/x86/include/asm/math_emu.h:5,
                    from arch/x86/include/asm/processor.h:13,
                    from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from drivers/hv/vmbus_drv.c:13:
   drivers/hv/vmbus_drv.c: In function 'vmbus_walk_resources':
>> drivers/hv/vmbus_drv.c:2178:24: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 2 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
    2178 |                 printk("cdx: vmbus_walk_resources: mem32: %llx, %llx\n", start, end);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  ~~~~~
         |                                                                          |
         |                                                                          resource_size_t {aka unsigned int}
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   drivers/hv/vmbus_drv.c:2178:17: note: in expansion of macro 'printk'
    2178 |                 printk("cdx: vmbus_walk_resources: mem32: %llx, %llx\n", start, end);
         |                 ^~~~~~
   drivers/hv/vmbus_drv.c:2178:62: note: format string is defined here
    2178 |                 printk("cdx: vmbus_walk_resources: mem32: %llx, %llx\n", start, end);
         |                                                           ~~~^
         |                                                              |
         |                                                              long long unsigned int
         |                                                           %x
   In file included from include/linux/kernel.h:29,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/nospec-branch.h:14,
                    from arch/x86/include/asm/paravirt_types.h:27,
                    from arch/x86/include/asm/ptrace.h:97,
                    from arch/x86/include/asm/math_emu.h:5,
                    from arch/x86/include/asm/processor.h:13,
                    from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from drivers/hv/vmbus_drv.c:13:
   drivers/hv/vmbus_drv.c:2178:24: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
    2178 |                 printk("cdx: vmbus_walk_resources: mem32: %llx, %llx\n", start, end);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~         ~~~
         |                                                                                 |
         |                                                                                 resource_size_t {aka unsigned int}
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   drivers/hv/vmbus_drv.c:2178:17: note: in expansion of macro 'printk'
    2178 |                 printk("cdx: vmbus_walk_resources: mem32: %llx, %llx\n", start, end);
         |                 ^~~~~~
   drivers/hv/vmbus_drv.c:2178:68: note: format string is defined here
    2178 |                 printk("cdx: vmbus_walk_resources: mem32: %llx, %llx\n", start, end);
         |                                                                 ~~~^
         |                                                                    |
         |                                                                    long long unsigned int
         |                                                                 %x
   In file included from include/linux/kernel.h:29,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/nospec-branch.h:14,
                    from arch/x86/include/asm/paravirt_types.h:27,
                    from arch/x86/include/asm/ptrace.h:97,
                    from arch/x86/include/asm/math_emu.h:5,
                    from arch/x86/include/asm/processor.h:13,
                    from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from drivers/hv/vmbus_drv.c:13:
   drivers/hv/vmbus_drv.c:2181:24: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 2 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
    2181 |                 printk("cdx: vmbus_walk_resources: mem32-2: %llx, %llx\n", start, end);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  ~~~~~
         |                                                                            |
         |                                                                            resource_size_t {aka unsigned int}
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   drivers/hv/vmbus_drv.c:2181:17: note: in expansion of macro 'printk'
    2181 |                 printk("cdx: vmbus_walk_resources: mem32-2: %llx, %llx\n", start, end);
         |                 ^~~~~~
   drivers/hv/vmbus_drv.c:2181:64: note: format string is defined here
    2181 |                 printk("cdx: vmbus_walk_resources: mem32-2: %llx, %llx\n", start, end);
         |                                                             ~~~^
         |                                                                |
         |                                                                long long unsigned int
         |                                                             %x
   In file included from include/linux/kernel.h:29,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/nospec-branch.h:14,
                    from arch/x86/include/asm/paravirt_types.h:27,
                    from arch/x86/include/asm/ptrace.h:97,
                    from arch/x86/include/asm/math_emu.h:5,
                    from arch/x86/include/asm/processor.h:13,
                    from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from drivers/hv/vmbus_drv.c:13:
   drivers/hv/vmbus_drv.c:2181:24: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
    2181 |                 printk("cdx: vmbus_walk_resources: mem32-2: %llx, %llx\n", start, end);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~         ~~~
         |                                                                                   |
         |                                                                                   resource_size_t {aka unsigned int}
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   drivers/hv/vmbus_drv.c:2181:17: note: in expansion of macro 'printk'
    2181 |                 printk("cdx: vmbus_walk_resources: mem32-2: %llx, %llx\n", start, end);
         |                 ^~~~~~
   drivers/hv/vmbus_drv.c:2181:70: note: format string is defined here
    2181 |                 printk("cdx: vmbus_walk_resources: mem32-2: %llx, %llx\n", start, end);
         |                                                                   ~~~^
         |                                                                      |
         |                                                                      long long unsigned int
         |                                                                   %x
   In file included from include/linux/kernel.h:29,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/nospec-branch.h:14,
                    from arch/x86/include/asm/paravirt_types.h:27,
                    from arch/x86/include/asm/ptrace.h:97,
                    from arch/x86/include/asm/math_emu.h:5,
                    from arch/x86/include/asm/processor.h:13,
                    from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from drivers/hv/vmbus_drv.c:13:
   drivers/hv/vmbus_drv.c:2187:24: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 2 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
    2187 |                 printk("cdx: vmbus_walk_resources: mem64: %llx, %llx\n", start, end);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  ~~~~~
         |                                                                          |
         |                                                                          resource_size_t {aka unsigned int}
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   drivers/hv/vmbus_drv.c:2187:17: note: in expansion of macro 'printk'
    2187 |                 printk("cdx: vmbus_walk_resources: mem64: %llx, %llx\n", start, end);
         |                 ^~~~~~
   drivers/hv/vmbus_drv.c:2187:62: note: format string is defined here
    2187 |                 printk("cdx: vmbus_walk_resources: mem64: %llx, %llx\n", start, end);
         |                                                           ~~~^
         |                                                              |
         |                                                              long long unsigned int
         |                                                           %x
   In file included from include/linux/kernel.h:29,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/nospec-branch.h:14,
                    from arch/x86/include/asm/paravirt_types.h:27,
                    from arch/x86/include/asm/ptrace.h:97,
                    from arch/x86/include/asm/math_emu.h:5,
                    from arch/x86/include/asm/processor.h:13,
                    from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from drivers/hv/vmbus_drv.c:13:
   drivers/hv/vmbus_drv.c:2187:24: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
    2187 |                 printk("cdx: vmbus_walk_resources: mem64: %llx, %llx\n", start, end);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~         ~~~
         |                                                                                 |
         |                                                                                 resource_size_t {aka unsigned int}
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   drivers/hv/vmbus_drv.c:2187:17: note: in expansion of macro 'printk'
    2187 |                 printk("cdx: vmbus_walk_resources: mem64: %llx, %llx\n", start, end);
         |                 ^~~~~~
   drivers/hv/vmbus_drv.c:2187:68: note: format string is defined here
    2187 |                 printk("cdx: vmbus_walk_resources: mem64: %llx, %llx\n", start, end);
         |                                                                 ~~~^
         |                                                                    |
         |                                                                    long long unsigned int
         |                                                                 %x
>> drivers/hv/vmbus_drv.c:2188:25: warning: unsigned conversion from 'long long int' to 'resource_size_t' {aka 'unsigned int'} changes value from '68182605824' to '3758096384' [-Woverflow]
    2188 |                 start = 0xfe0000000;
         |                         ^~~~~~~~~~~
   drivers/hv/vmbus_drv.c:2189:23: warning: unsigned conversion from 'long long int' to 'resource_size_t' {aka 'unsigned int'} changes value from '68719476735' to '4294967295' [-Woverflow]
    2189 |                 end = 0xfffffffff;
         |                       ^~~~~~~~~~~
   In file included from include/linux/kernel.h:29,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/nospec-branch.h:14,
                    from arch/x86/include/asm/paravirt_types.h:27,
                    from arch/x86/include/asm/ptrace.h:97,
                    from arch/x86/include/asm/math_emu.h:5,
                    from arch/x86/include/asm/processor.h:13,
                    from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from drivers/hv/vmbus_drv.c:13:
   drivers/hv/vmbus_drv.c:2190:24: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 2 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
    2190 |                 printk("cdx: vmbus_walk_resources: mem64-2: %llx, %llx\n", start, end);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  ~~~~~
         |                                                                            |
         |                                                                            resource_size_t {aka unsigned int}
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   drivers/hv/vmbus_drv.c:2190:17: note: in expansion of macro 'printk'
    2190 |                 printk("cdx: vmbus_walk_resources: mem64-2: %llx, %llx\n", start, end);
         |                 ^~~~~~
   drivers/hv/vmbus_drv.c:2190:64: note: format string is defined here
    2190 |                 printk("cdx: vmbus_walk_resources: mem64-2: %llx, %llx\n", start, end);
         |                                                             ~~~^
         |                                                                |
         |                                                                long long unsigned int
         |                                                             %x
   In file included from include/linux/kernel.h:29,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/nospec-branch.h:14,
                    from arch/x86/include/asm/paravirt_types.h:27,
                    from arch/x86/include/asm/ptrace.h:97,
                    from arch/x86/include/asm/math_emu.h:5,
                    from arch/x86/include/asm/processor.h:13,
                    from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from drivers/hv/vmbus_drv.c:13:
   drivers/hv/vmbus_drv.c:2190:24: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
    2190 |                 printk("cdx: vmbus_walk_resources: mem64-2: %llx, %llx\n", start, end);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~         ~~~
         |                                                                                   |
         |                                                                                   resource_size_t {aka unsigned int}
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   drivers/hv/vmbus_drv.c:2190:17: note: in expansion of macro 'printk'
    2190 |                 printk("cdx: vmbus_walk_resources: mem64-2: %llx, %llx\n", start, end);
         |                 ^~~~~~
   drivers/hv/vmbus_drv.c:2190:70: note: format string is defined here
    2190 |                 printk("cdx: vmbus_walk_resources: mem64-2: %llx, %llx\n", start, end);
         |                                                                   ~~~^
         |                                                                      |
         |                                                                      long long unsigned int
         |                                                                   %x


vim +2178 drivers/hv/vmbus_drv.c

  2153	
  2154	
  2155	/*
  2156	 * VMBUS is an acpi enumerated device. Get the information we
  2157	 * need from DSDT.
  2158	 */
  2159	static acpi_status vmbus_walk_resources(struct acpi_resource *res, void *ctx)
  2160	{
  2161		resource_size_t start = 0;
  2162		resource_size_t end = 0;
  2163		struct resource *new_res;
  2164		struct resource **old_res = &hyperv_mmio;
  2165		struct resource **prev_res = NULL;
  2166		struct resource r;
  2167	
  2168		switch (res->type) {
  2169	
  2170		/*
  2171		 * "Address" descriptors are for bus windows. Ignore
  2172		 * "memory" descriptors, which are for registers on
  2173		 * devices.
  2174		 */
  2175		case ACPI_RESOURCE_TYPE_ADDRESS32:
  2176			start = res->data.address32.address.minimum;
  2177			end = res->data.address32.address.maximum;
> 2178	                printk("cdx: vmbus_walk_resources: mem32: %llx, %llx\n", start, end);
  2179	                start = 0xf8000000;
  2180	                end = 0xffffffff;
  2181	                printk("cdx: vmbus_walk_resources: mem32-2: %llx, %llx\n", start, end);
  2182			break;
  2183	
  2184		case ACPI_RESOURCE_TYPE_ADDRESS64:
  2185			start = res->data.address64.address.minimum;
  2186			end = res->data.address64.address.maximum;
  2187	                printk("cdx: vmbus_walk_resources: mem64: %llx, %llx\n", start, end);
> 2188	                start = 0xfe0000000;
  2189	                end = 0xfffffffff;
  2190	                printk("cdx: vmbus_walk_resources: mem64-2: %llx, %llx\n", start, end);
  2191			break;
  2192	
  2193		/*
  2194		 * The IRQ information is needed only on ARM64, which Hyper-V
  2195		 * sets up in the extended format. IRQ information is present
  2196		 * on x86/x64 in the non-extended format but it is not used by
  2197		 * Linux. So don't bother checking for the non-extended format.
  2198		 */
  2199		case ACPI_RESOURCE_TYPE_EXTENDED_IRQ:
  2200			if (!acpi_dev_resource_interrupt(res, 0, &r)) {
  2201				pr_err("Unable to parse Hyper-V ACPI interrupt\n");
  2202				return AE_ERROR;
  2203			}
  2204			/* ARM64 INTID for VMbus */
  2205			vmbus_interrupt = res->data.extended_irq.interrupts[0];
  2206			/* Linux IRQ number */
  2207			vmbus_irq = r.start;
  2208	               printk("cdx: vmbus_walk_resources: irq=%d\n", vmbus_irq);
  2209			return AE_OK;
  2210	
  2211		default:
  2212			/* Unused resource type */
  2213	               printk("cdx: vmbus_walk_resources: default type=%d\n", res->type);
  2214			return AE_OK;
  2215	
  2216		}
  2217		/*
  2218		 * Ignore ranges that are below 1MB, as they're not
  2219		 * necessary or useful here.
  2220		 */
  2221		if (end < 0x100000)
  2222			return AE_OK;
  2223	
  2224		new_res = kzalloc(sizeof(*new_res), GFP_ATOMIC);
  2225		if (!new_res)
  2226			return AE_NO_MEMORY;
  2227	
  2228		/* If this range overlaps the virtual TPM, truncate it. */
  2229		if (end > VTPM_BASE_ADDRESS && start < VTPM_BASE_ADDRESS)
  2230			end = VTPM_BASE_ADDRESS;
  2231	
  2232		new_res->name = "hyperv mmio";
  2233		new_res->flags = IORESOURCE_MEM;
  2234		new_res->start = start;
  2235		new_res->end = end;
  2236	
  2237		/*
  2238		 * If two ranges are adjacent, merge them.
  2239		 */
  2240		do {
  2241			if (!*old_res) {
  2242				*old_res = new_res;
  2243				break;
  2244			}
  2245	
  2246			if (((*old_res)->end + 1) == new_res->start) {
  2247				(*old_res)->end = new_res->end;
  2248				kfree(new_res);
  2249				break;
  2250			}
  2251	
  2252			if ((*old_res)->start == new_res->end + 1) {
  2253				(*old_res)->start = new_res->start;
  2254				kfree(new_res);
  2255				break;
  2256			}
  2257	
  2258			if ((*old_res)->start > new_res->end) {
  2259				new_res->sibling = *old_res;
  2260				if (prev_res)
  2261					(*prev_res)->sibling = new_res;
  2262				*old_res = new_res;
  2263				break;
  2264			}
  2265	
  2266			prev_res = old_res;
  2267			old_res = &(*old_res)->sibling;
  2268	
  2269		} while (1);
  2270	
  2271		return AE_OK;
  2272	}
  2273	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
