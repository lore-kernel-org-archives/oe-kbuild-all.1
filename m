Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D5223C0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Apr 2023 11:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681816658; x=1713352658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k/WGRpDXxJBRZwO6qUaa39zi3FrloADLUI9XfSe9noA=;
  b=dDhYpxFdYMshV24vETqXgnBDFMMHElbmhl3BV5dKyJXX9panhGSSF3+6
   KWxq4h4Y9PkaJ8JLPqJc4oYYkm7hzJssDOJIzAR8Rq4pcMkCTiRLrFje5
   3knj3EfzIBeXy9OCRJV0Lx3QZ1bEZw1afbwUOo9CIcbatd1lhIPH+e2h0
   YycKfj0fFT+RP5GHi+RjWxdmFK2hX/BEbEMeN7xPQci3KWND72SPl71wx
   xI5FKurGto4ttWaOSY3ydI0v4nFcb7ER8KCzOvEClSw6M/nW0t/CKRShX
   bErB5HxFM6I1JdvSEYe0tMbioD7yLVq9a5XGg7Suy+NiGUpEkOIcXGe9+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="324758658"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="324758658"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 04:17:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="723591727"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="723591727"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 18 Apr 2023 04:17:36 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pojL5-000dJP-1L;
	Tue, 18 Apr 2023 11:17:35 +0000
Date: Tue, 18 Apr 2023 19:17:32 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [avpatel:riscv_sbi_nested_v1 48/74] include/linux/property.h:144:54:
 warning: 'struct resource' declared inside parameter list will not be
 visible outside of this definition or declaration
Message-ID: <202304181957.4ewulPx4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_sbi_nested_v1
head:   664b96e7a3a7d1b9d6c7ede050633ada0eda4875
commit: c0fae281cc6758ccb2c2aa3361acc62fbe038a7a [48/74] device property: Add ioresource_get to fwnode operation
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230418/202304181957.4ewulPx4-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/avpatel/linux/commit/c0fae281cc6758ccb2c2aa3361acc62fbe038a7a
        git remote add avpatel https://github.com/avpatel/linux.git
        git fetch --no-tags avpatel riscv_sbi_nested_v1
        git checkout c0fae281cc6758ccb2c2aa3361acc62fbe038a7a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/input/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304181957.4ewulPx4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/property.h:14,
                    from drivers/input/touchscreen.c:9:
   include/linux/fwnode.h:167:58: warning: 'struct resource' declared inside parameter list will not be visible outside of this definition or declaration
     167 |                               unsigned int index, struct resource *res);
         |                                                          ^~~~~~~~
>> include/linux/property.h:144:54: warning: 'struct resource' declared inside parameter list will not be visible outside of this definition or declaration
     144 |                           unsigned int index, struct resource *res);
         |                                                      ^~~~~~~~


vim +144 include/linux/property.h

    12	
    13	#include <linux/bits.h>
  > 14	#include <linux/fwnode.h>
    15	#include <linux/stddef.h>
    16	#include <linux/types.h>
    17	
    18	struct device;
    19	struct net_device;
    20	
    21	enum dev_prop_type {
    22		DEV_PROP_U8,
    23		DEV_PROP_U16,
    24		DEV_PROP_U32,
    25		DEV_PROP_U64,
    26		DEV_PROP_STRING,
    27		DEV_PROP_REF,
    28	};
    29	
    30	enum dev_dma_attr {
    31		DEV_DMA_NOT_SUPPORTED,
    32		DEV_DMA_NON_COHERENT,
    33		DEV_DMA_COHERENT,
    34	};
    35	
    36	const struct fwnode_handle *__dev_fwnode_const(const struct device *dev);
    37	struct fwnode_handle *__dev_fwnode(struct device *dev);
    38	#define dev_fwnode(dev)							\
    39		_Generic((dev),							\
    40			 const struct device *: __dev_fwnode_const,	\
    41			 struct device *: __dev_fwnode)(dev)
    42	
    43	bool device_property_present(struct device *dev, const char *propname);
    44	int device_property_read_u8_array(struct device *dev, const char *propname,
    45					  u8 *val, size_t nval);
    46	int device_property_read_u16_array(struct device *dev, const char *propname,
    47					   u16 *val, size_t nval);
    48	int device_property_read_u32_array(struct device *dev, const char *propname,
    49					   u32 *val, size_t nval);
    50	int device_property_read_u64_array(struct device *dev, const char *propname,
    51					   u64 *val, size_t nval);
    52	int device_property_read_string_array(struct device *dev, const char *propname,
    53					      const char **val, size_t nval);
    54	int device_property_read_string(struct device *dev, const char *propname,
    55					const char **val);
    56	int device_property_match_string(struct device *dev,
    57					 const char *propname, const char *string);
    58	
    59	bool fwnode_property_present(const struct fwnode_handle *fwnode,
    60				     const char *propname);
    61	int fwnode_property_read_u8_array(const struct fwnode_handle *fwnode,
    62					  const char *propname, u8 *val,
    63					  size_t nval);
    64	int fwnode_property_read_u16_array(const struct fwnode_handle *fwnode,
    65					   const char *propname, u16 *val,
    66					   size_t nval);
    67	int fwnode_property_read_u32_array(const struct fwnode_handle *fwnode,
    68					   const char *propname, u32 *val,
    69					   size_t nval);
    70	int fwnode_property_read_u64_array(const struct fwnode_handle *fwnode,
    71					   const char *propname, u64 *val,
    72					   size_t nval);
    73	int fwnode_property_read_string_array(const struct fwnode_handle *fwnode,
    74					      const char *propname, const char **val,
    75					      size_t nval);
    76	int fwnode_property_read_string(const struct fwnode_handle *fwnode,
    77					const char *propname, const char **val);
    78	int fwnode_property_match_string(const struct fwnode_handle *fwnode,
    79					 const char *propname, const char *string);
    80	
    81	bool fwnode_device_is_available(const struct fwnode_handle *fwnode);
    82	
    83	static inline
    84	bool fwnode_device_is_compatible(const struct fwnode_handle *fwnode, const char *compat)
    85	{
    86		return fwnode_property_match_string(fwnode, "compatible", compat) >= 0;
    87	}
    88	
    89	int fwnode_property_get_reference_args(const struct fwnode_handle *fwnode,
    90					       const char *prop, const char *nargs_prop,
    91					       unsigned int nargs, unsigned int index,
    92					       struct fwnode_reference_args *args);
    93	
    94	struct fwnode_handle *fwnode_find_reference(const struct fwnode_handle *fwnode,
    95						    const char *name,
    96						    unsigned int index);
    97	
    98	const char *fwnode_get_name(const struct fwnode_handle *fwnode);
    99	const char *fwnode_get_name_prefix(const struct fwnode_handle *fwnode);
   100	
   101	struct fwnode_handle *fwnode_get_parent(const struct fwnode_handle *fwnode);
   102	struct fwnode_handle *fwnode_get_next_parent(struct fwnode_handle *fwnode);
   103	
   104	#define fwnode_for_each_parent_node(fwnode, parent)		\
   105		for (parent = fwnode_get_parent(fwnode); parent;	\
   106		     parent = fwnode_get_next_parent(parent))
   107	
   108	struct device *fwnode_get_next_parent_dev(struct fwnode_handle *fwnode);
   109	unsigned int fwnode_count_parents(const struct fwnode_handle *fwn);
   110	struct fwnode_handle *fwnode_get_nth_parent(struct fwnode_handle *fwn,
   111						    unsigned int depth);
   112	bool fwnode_is_ancestor_of(struct fwnode_handle *ancestor, struct fwnode_handle *child);
   113	struct fwnode_handle *fwnode_get_next_child_node(
   114		const struct fwnode_handle *fwnode, struct fwnode_handle *child);
   115	struct fwnode_handle *fwnode_get_next_available_child_node(
   116		const struct fwnode_handle *fwnode, struct fwnode_handle *child);
   117	
   118	#define fwnode_for_each_child_node(fwnode, child)			\
   119		for (child = fwnode_get_next_child_node(fwnode, NULL); child;	\
   120		     child = fwnode_get_next_child_node(fwnode, child))
   121	
   122	#define fwnode_for_each_available_child_node(fwnode, child)		       \
   123		for (child = fwnode_get_next_available_child_node(fwnode, NULL); child;\
   124		     child = fwnode_get_next_available_child_node(fwnode, child))
   125	
   126	struct fwnode_handle *device_get_next_child_node(const struct device *dev,
   127							 struct fwnode_handle *child);
   128	
   129	#define device_for_each_child_node(dev, child)				\
   130		for (child = device_get_next_child_node(dev, NULL); child;	\
   131		     child = device_get_next_child_node(dev, child))
   132	
   133	struct fwnode_handle *fwnode_get_named_child_node(const struct fwnode_handle *fwnode,
   134							  const char *childname);
   135	struct fwnode_handle *device_get_named_child_node(const struct device *dev,
   136							  const char *childname);
   137	
   138	struct fwnode_handle *fwnode_handle_get(struct fwnode_handle *fwnode);
   139	void fwnode_handle_put(struct fwnode_handle *fwnode);
   140	
   141	int fwnode_irq_get(const struct fwnode_handle *fwnode, unsigned int index);
   142	int fwnode_irq_get_byname(const struct fwnode_handle *fwnode, const char *name);
   143	int fwnode_ioresource_get(const struct fwnode_handle *fwnode,
 > 144				  unsigned int index, struct resource *res);
   145	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
