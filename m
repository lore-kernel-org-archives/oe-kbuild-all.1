Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D90C386
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Jan 2023 04:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674274972; x=1705810972;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aHNTj89h5+XNETrW4rSi97FSGm851+EtB61e5g3LF80=;
  b=K9i8g7oMPUZNIO74aaw6L+6wD1tNkq09JFiL08Dp2L2SG99hRuCmsXLx
   RPNEM5IUULW2QEqMFxMhXfO24eAR1deq1tysqx2VfGW+MAdeSJ8AnD/G3
   r7RErytC5jl40eMYYnoR8toiLhAY4aPUWEx1kwokX4YWUuhnY+qWFhjei
   uAVF7cZ5Bk0KGIZWSTAEoZxywQDgRQWUjv74/vnZzbXJvrEi/N7lZvJ/J
   cOkXwQi6I5S22yF2env4n1a2UfZQc3TVSeSsPlJsNyjfcET9q4VkLsAjM
   wMuoMxn39Z2ZGIKEfCBqmWqDE+jmY1a9ZfmZO/Ge3NkTQOKtypePwC9e3
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="325794583"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; 
   d="scan'208";a="325794583"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 20:22:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="834642692"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; 
   d="scan'208";a="834642692"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 20 Jan 2023 20:22:50 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJ5Oz-0003RV-0y;
	Sat, 21 Jan 2023 04:22:49 +0000
Date: Sat, 21 Jan 2023 12:22:00 +0800
From: kernel test robot <lkp@intel.com>
To: Paul M Stillwell Jr <paul.m.stillwell.jr@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-wired-lan] [PATCH net-next v7 5/5] ice: use debugfs to
 output FW log data
Message-ID: <202301211254.cpMYua1h-lkp@intel.com>
References: <20230120233511.131-6-paul.m.stillwell.jr@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230120233511.131-6-paul.m.stillwell.jr@intel.com>

Hi Paul,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tnguy-next-queue/dev-queue]
[cannot apply to net-next/master linus/master v6.2-rc4 next-20230120]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Paul-M-Stillwell-Jr/ice-remove-FW-logging-code/20230121-073744
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
patch link:    https://lore.kernel.org/r/20230120233511.131-6-paul.m.stillwell.jr%40intel.com
patch subject: [Intel-wired-lan] [PATCH net-next v7 5/5] ice: use debugfs to output FW log data
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230121/202301211254.cpMYua1h-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a540cbc88b6aa6de989fb8793df30f96f927ba3e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Paul-M-Stillwell-Jr/ice-remove-FW-logging-code/20230121-073744
        git checkout a540cbc88b6aa6de989fb8793df30f96f927ba3e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:7,
                    from include/linux/skbuff.h:31,
                    from include/net/net_namespace.h:43,
                    from include/linux/netdevice.h:38,
                    from drivers/net/ethernet/intel/ice/ice.h:12,
                    from drivers/net/ethernet/intel/ice/ice_main.c:9:
   drivers/net/ethernet/intel/ice/ice_main.c: In function 'ice_map_hw_addr':
   drivers/net/ethernet/intel/ice/ice_main.c:652:30: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 4 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
     652 |                 dev_err(dev, "%s: remap at offset %llu failed\n",
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/net/ethernet/intel/ice/ice_main.c:652:17: note: in expansion of macro 'dev_err'
     652 |                 dev_err(dev, "%s: remap at offset %llu failed\n",
         |                 ^~~~~~~
   drivers/net/ethernet/intel/ice/ice_main.c:652:54: note: format string is defined here
     652 |                 dev_err(dev, "%s: remap at offset %llu failed\n",
         |                                                   ~~~^
         |                                                      |
         |                                                      long long unsigned int
         |                                                   %u
   drivers/net/ethernet/intel/ice/ice_main.c: In function 'ice_get_fwlog_data':
   drivers/net/ethernet/intel/ice/ice_main.c:1386:17: error: implicit declaration of function 'vmalloc'; did you mean 'kvmalloc'? [-Werror=implicit-function-declaration]
    1386 |         fwlog = vmalloc(sizeof(*fwlog));
         |                 ^~~~~~~
         |                 kvmalloc
>> drivers/net/ethernet/intel/ice/ice_main.c:1386:15: warning: assignment to 'struct ice_fwlog_data *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1386 |         fwlog = vmalloc(sizeof(*fwlog));
         |               ^
   drivers/net/ethernet/intel/ice/ice_main.c:1395:23: error: implicit declaration of function 'vzalloc'; did you mean 'kvzalloc'? [-Werror=implicit-function-declaration]
    1395 |         fwlog->data = vzalloc(fwlog->data_size);
         |                       ^~~~~~~
         |                       kvzalloc
>> drivers/net/ethernet/intel/ice/ice_main.c:1395:21: warning: assignment to 'u8 *' {aka 'unsigned char *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1395 |         fwlog->data = vzalloc(fwlog->data_size);
         |                     ^
   drivers/net/ethernet/intel/ice/ice_main.c:1398:17: error: implicit declaration of function 'vfree'; did you mean 'kvfree'? [-Werror=implicit-function-declaration]
    1398 |                 vfree(fwlog);
         |                 ^~~~~
         |                 kvfree
   cc1: some warnings being treated as errors


vim +1386 drivers/net/ethernet/intel/ice/ice_main.c

  1371	
  1372	/**
  1373	 * ice_get_fwlog_data - copy the FW log data from ARQ event
  1374	 * @pf: PF that the FW log event is associated with
  1375	 * @event: event structure containing FW log data
  1376	 */
  1377	static void
  1378	ice_get_fwlog_data(struct ice_pf *pf, struct ice_rq_event_info *event)
  1379	{
  1380		struct device *dev = ice_pf_to_dev(pf);
  1381		struct ice_fwlog_data *fwlog;
  1382	
  1383		if (pf->fwlog_list_count >= ICE_FWLOG_MAX_SIZE)
  1384			return;
  1385	
> 1386		fwlog = vmalloc(sizeof(*fwlog));
  1387		if (!fwlog) {
  1388			dev_warn(dev, "Couldn't allocate memory for FWlog element\n");
  1389			return;
  1390		}
  1391	
  1392		INIT_LIST_HEAD(&fwlog->list);
  1393	
  1394		fwlog->data_size = le16_to_cpu(event->desc.datalen);
> 1395		fwlog->data = vzalloc(fwlog->data_size);
  1396		if (!fwlog->data) {
  1397			dev_warn(dev, "Couldn't allocate memory for FWlog data\n");
  1398			vfree(fwlog);
  1399			return;
  1400		}
  1401	
  1402		memcpy(fwlog->data, event->msg_buf, fwlog->data_size);
  1403	
  1404		list_add_tail(&fwlog->list, &pf->fwlog_data_list);
  1405	
  1406		pf->fwlog_list_count++;
  1407	}
  1408	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
