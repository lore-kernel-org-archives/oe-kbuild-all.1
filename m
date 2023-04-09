Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4341FA5
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Apr 2023 09:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681032991; x=1712568991;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jx0j+VOAiq6iUYgDwdoTBeKnV4iRliT25JdQpzahmOo=;
  b=FCOp3lFTMesPN/e4GPUMPSUd6uJYiREeJsP8wor+XqDzzidonKScEkpz
   LdPQRZlO0kWt7Xkl0HdPL+xHDmz7fdU7nI9Yos/ylEHarfsOPZvzHHYnl
   1eXkKxjN5d6Cugrgxi3QeVNXiPiIC7JwxI8Pqt/5VxpzAQGmUDCD9PAnG
   AiJOIArVAriJyhv+VjpHl1c4Gp0mohsg9QkZk/ecx4tdZ8vrZxSyo6G2P
   URK8t4u20wwqzgIdz1nzeFMA6SO+0afc7/+SO6oBIX1XiMVi2/TWrRHg7
   NSf/Ok+DTfqCcikLh5lldVMoRZeV5w1jHzxxfBpBgCY4KZal/hHAhZwi7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10674"; a="408345045"
X-IronPort-AV: E=Sophos;i="5.98,331,1673942400"; 
   d="scan'208";a="408345045"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2023 02:36:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10674"; a="1017701227"
X-IronPort-AV: E=Sophos;i="5.98,331,1673942400"; 
   d="scan'208";a="1017701227"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 09 Apr 2023 02:36:28 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1plRTH-000USV-1T;
	Sun, 09 Apr 2023 09:36:27 +0000
Date: Sun, 9 Apr 2023 17:36:03 +0800
From: kernel test robot <lkp@intel.com>
To: Navneet Singh <navneet.singh@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Ben Widawsky <ben.widawsky@intel.com>,
	Dan Williams <dan.j.williams@intel.com>
Subject: [cxl:for-6.5/dcd-preview 13/15] drivers/cxl/core/mbox.c:1019:30:
 warning: format '%llx' expects argument of type 'long long unsigned int',
 but argument 4 has type 'resource_size_t' {aka 'unsigned int'}
Message-ID: <202304091759.ODzBT7wW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git for-6.5/dcd-preview
head:   f425bc34c600e2a3721d6560202962ec41622815
commit: 3113a430f1ccbad8340234cf38b00f271ccee103 [13/15] cxl/mem: Add support to handle DCD add and release capacity events.
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20230409/202304091759.ODzBT7wW-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git/commit/?id=3113a430f1ccbad8340234cf38b00f271ccee103
        git remote add cxl https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git
        git fetch --no-tags cxl for-6.5/dcd-preview
        git checkout 3113a430f1ccbad8340234cf38b00f271ccee103
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/cxl/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304091759.ODzBT7wW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:564,
                    from include/asm-generic/bug.h:22,
                    from arch/powerpc/include/asm/bug.h:159,
                    from include/linux/bug.h:5,
                    from include/linux/io.h:11,
                    from include/linux/io-64-nonatomic-lo-hi.h:5,
                    from drivers/cxl/core/mbox.c:3:
   drivers/cxl/core/mbox.c: In function 'cxl_handle_dcd_event_records':
>> drivers/cxl/core/mbox.c:1019:30: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
    1019 |                 dev_dbg(dev, "Release DC extents DPA:0x%llx LEN:%llx\n",
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:223:29: note: in definition of macro '__dynamic_func_call_cls'
     223 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:249:9: note: in expansion of macro '_dynamic_func_call_cls'
     249 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:272:9: note: in expansion of macro '_dynamic_func_call'
     272 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/cxl/core/mbox.c:1019:17: note: in expansion of macro 'dev_dbg'
    1019 |                 dev_dbg(dev, "Release DC extents DPA:0x%llx LEN:%llx\n",
         |                 ^~~~~~~
   drivers/cxl/core/mbox.c:1019:59: note: format string is defined here
    1019 |                 dev_dbg(dev, "Release DC extents DPA:0x%llx LEN:%llx\n",
         |                                                        ~~~^
         |                                                           |
         |                                                           long long unsigned int
         |                                                        %x
   drivers/cxl/core/mbox.c:1019:30: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 5 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
    1019 |                 dev_dbg(dev, "Release DC extents DPA:0x%llx LEN:%llx\n",
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:223:29: note: in definition of macro '__dynamic_func_call_cls'
     223 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:249:9: note: in expansion of macro '_dynamic_func_call_cls'
     249 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:272:9: note: in expansion of macro '_dynamic_func_call'
     272 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/cxl/core/mbox.c:1019:17: note: in expansion of macro 'dev_dbg'
    1019 |                 dev_dbg(dev, "Release DC extents DPA:0x%llx LEN:%llx\n",
         |                 ^~~~~~~
   drivers/cxl/core/mbox.c:1019:68: note: format string is defined here
    1019 |                 dev_dbg(dev, "Release DC extents DPA:0x%llx LEN:%llx\n",
         |                                                                 ~~~^
         |                                                                    |
         |                                                                    long long unsigned int
         |                                                                 %x
   In file included from include/linux/device.h:15,
                    from arch/powerpc/include/asm/io.h:27,
                    from include/linux/io.h:13:
   drivers/cxl/core/mbox.c:1023:38: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
    1023 |                         dev_err(dev, "No extent found with DPA:0x%llx\n", dpa);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/cxl/core/mbox.c:1023:25: note: in expansion of macro 'dev_err'
    1023 |                         dev_err(dev, "No extent found with DPA:0x%llx\n", dpa);
         |                         ^~~~~~~
   drivers/cxl/core/mbox.c:1023:69: note: format string is defined here
    1023 |                         dev_err(dev, "No extent found with DPA:0x%llx\n", dpa);
         |                                                                  ~~~^
         |                                                                     |
         |                                                                     long long unsigned int
         |                                                                  %x
   drivers/cxl/core/mbox.c:1035:38: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
    1035 |                         dev_dbg(dev, "withhold DC extent DPA:0x%llx LEN:%llx\n",
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:223:29: note: in definition of macro '__dynamic_func_call_cls'
     223 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:249:9: note: in expansion of macro '_dynamic_func_call_cls'
     249 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:272:9: note: in expansion of macro '_dynamic_func_call'
     272 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/cxl/core/mbox.c:1035:25: note: in expansion of macro 'dev_dbg'
    1035 |                         dev_dbg(dev, "withhold DC extent DPA:0x%llx LEN:%llx\n",
         |                         ^~~~~~~
   drivers/cxl/core/mbox.c:1035:67: note: format string is defined here
    1035 |                         dev_dbg(dev, "withhold DC extent DPA:0x%llx LEN:%llx\n",
         |                                                                ~~~^
         |                                                                   |
         |                                                                   long long unsigned int


vim +1019 drivers/cxl/core/mbox.c

   900	
   901	static int cxl_prepare_ext_list(struct cxl_mbox_dc_response **res,
   902						int *n, struct resource *extent)
   903	{
   904		struct cxl_mbox_dc_response *dc_res;
   905		unsigned int size;
   906	
   907		if (!extent)
   908			size = struct_size(dc_res, extent_list, 0);
   909		else
   910			size = struct_size(dc_res, extent_list, *n + 1);
   911	
   912		dc_res = krealloc(*res, size, GFP_KERNEL);
   913		if (!dc_res)
   914			return -ENOMEM;
   915	
   916		if (extent) {
   917			dc_res->extent_list[*n].dpa_start = cpu_to_le64(extent->start);
   918			memset(dc_res->extent_list[*n].reserved, 0, 8);
   919			dc_res->extent_list[*n].length =
   920					cpu_to_le64(resource_size(extent));
   921			(*n)++;
   922		}
   923	
   924		*res = dc_res;
   925		return 0;
   926	}
   927	/**
   928	 * cxl_handle_dcd_event_records() - Read DCD event records.
   929	 * @cxlds: The device data for the operation
   930	 *
   931	 * Returns 0 if enumerate completed successfully.
   932	 *
   933	 * CXL devices can generate DCD events to add or remove extents in the list.
   934	 */
   935	int cxl_handle_dcd_event_records(struct cxl_dev_state *cxlds, struct cxl_event_record_raw *rec)
   936	{
   937		struct cxl_mbox_dc_response *dc_res = NULL;
   938		struct device *dev = cxlds->dev;
   939		uuid_t *id = &rec->hdr.id;
   940		struct dcd_event_dyn_cap *record =
   941				(struct dcd_event_dyn_cap *)rec;
   942		int extent_size = 0, rc = 0;
   943		struct cxl_dc_extent_data *extent;
   944		struct resource alloc_dpa_res, rel_dpa_res;
   945		resource_size_t dpa, size;
   946	
   947		if (!uuid_equal(id, &dc_event_uuid))
   948			return -EINVAL;
   949	
   950		switch (record->data.event_type) {
   951		case ADD_CAPACITY:
   952			extent = devm_kzalloc(dev, sizeof(*extent), GFP_ATOMIC);
   953			if (!extent) {
   954				dev_err(dev, "No memory available\n");
   955				return -ENOMEM;
   956			}
   957	
   958			extent->dpa_start = le64_to_cpu(record->data.extent.start_dpa);
   959			extent->length = le64_to_cpu(record->data.extent.length);
   960			memcpy(extent->tag, record->data.extent.tag,
   961					sizeof(record->data.extent.tag));
   962			extent->shared_extent_seq =
   963				le16_to_cpu(record->data.extent.shared_extn_seq);
   964			dev_dbg(dev, "Add DC extent DPA:0x%llx LEN:%llx\n",
   965						extent->dpa_start, extent->length);
   966			alloc_dpa_res = (struct resource) {
   967				.start = extent->dpa_start,
   968				.end = extent->dpa_start + extent->length - 1,
   969				.flags = IORESOURCE_MEM,
   970			};
   971	
   972			rc = cxl_add_dc_extent(cxlds, &alloc_dpa_res);
   973			if (rc < 0) {
   974				dev_dbg(dev, "unconsumed DC extent DPA:0x%llx LEN:%llx\n",
   975						extent->dpa_start, extent->length);
   976				rc = cxl_prepare_ext_list(&dc_res, &extent_size, NULL);
   977				if (rc < 0){
   978					dev_err(dev, "Couldn't create extent list %d\n",
   979										rc);
   980					devm_kfree(dev, extent);
   981					return rc;
   982				}
   983	
   984				rc = cxl_send_dc_cap_response(cxlds, dc_res,
   985						extent_size, CXL_MBOX_OP_ADD_DC_RESPONSE);
   986				if (rc < 0){
   987					devm_kfree(dev, extent);
   988					goto out;
   989				}
   990	
   991				kfree(dc_res);
   992				devm_kfree(dev, extent);
   993	
   994				return 0;
   995			}
   996	
   997			rc = xa_insert(&cxlds->dc_extent_list, extent->dpa_start, extent,
   998					GFP_KERNEL);
   999			if (rc < 0)
  1000				goto out;
  1001	
  1002			cxlds->num_dc_extents++;
  1003			rc = cxl_prepare_ext_list(&dc_res, &extent_size, &alloc_dpa_res);
  1004			if (rc < 0){
  1005				dev_err(dev, "Couldn't create extent list %d\n", rc);
  1006				return rc;
  1007			}
  1008	
  1009			rc = cxl_send_dc_cap_response(cxlds, dc_res,
  1010					extent_size, CXL_MBOX_OP_ADD_DC_RESPONSE);
  1011			if (rc < 0)
  1012				goto out;
  1013	
  1014			break;
  1015	
  1016		case RELEASE_CAPACITY:
  1017			dpa = le64_to_cpu(record->data.extent.start_dpa);
  1018			size = le64_to_cpu(record->data.extent.length);
> 1019			dev_dbg(dev, "Release DC extents DPA:0x%llx LEN:%llx\n",
  1020					dpa, size);
  1021			extent = xa_load(&cxlds->dc_extent_list, dpa);
  1022			if (!extent) {
  1023				dev_err(dev, "No extent found with DPA:0x%llx\n", dpa);
  1024				return -EINVAL;
  1025			}
  1026	
  1027			rel_dpa_res = (struct resource) {
  1028				.start = dpa,
  1029				.end = dpa + size - 1,
  1030				.flags = IORESOURCE_MEM,
  1031			};
  1032	
  1033			rc = cxl_release_dc_extent(cxlds, &rel_dpa_res);
  1034			if (rc < 0) {
  1035				dev_dbg(dev, "withhold DC extent DPA:0x%llx LEN:%llx\n",
  1036										dpa, size);
  1037				return 0;
  1038			}
  1039	
  1040			xa_erase(&cxlds->dc_extent_list, dpa);
  1041			devm_kfree(dev, extent);
  1042			cxlds->num_dc_extents--;
  1043			rc = cxl_prepare_ext_list(&dc_res, &extent_size, &rel_dpa_res);
  1044			if (rc < 0){
  1045				dev_err(dev, "Couldn't create extent list %d\n", rc);
  1046				return rc;
  1047			}
  1048	
  1049			rc = cxl_send_dc_cap_response(cxlds, dc_res,
  1050					extent_size, CXL_MBOX_OP_RELEASE_DC);
  1051			if (rc < 0)
  1052				goto out;
  1053	
  1054			break;
  1055	
  1056		default:
  1057			return -EINVAL;
  1058		}
  1059	out:
  1060		kfree(dc_res);
  1061		return rc;
  1062	}
  1063	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
