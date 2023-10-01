Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2427037D
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Oct 2023 01:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696122125; x=1727658125;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jWv003LKc+YyE34qnr81I177t2Lf6UsXOz4eZyIUFbE=;
  b=nHu3keuL72MNWgwzZJjmGcCslK7mL57Da8WG5f63pzjk3GSLS45H6Sy5
   J4VXCGPZOHiXh5gOuO6NT8KJYJOsicckegiy3armAv2iSPGyTiniZeL9A
   hWB0B95gUgu9dvKNkUAJzQR4au+32cGjp0eavnnnXlh9oZuUEebTrNUcX
   AFsqv8OFOuslotgIRGwKBgk1aQ9PEb+5lWC+hXKpR2GBxVPnTbFlDbMzt
   izdB54p6nwcO9zOvTy9DWh1EGWZ38VPG/cL8+N0EYxzF3VERQCXRFJI7G
   Qnn0yQaZE3woLvDyewjJPFO1yBASpJbLZAHobw/93mUVRGaP2w16dAHwb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="367538403"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="367538403"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2023 18:02:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="1081292831"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="1081292831"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 30 Sep 2023 18:02:03 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmkqP-0004cj-0T;
	Sun, 01 Oct 2023 01:02:01 +0000
Date: Sun, 1 Oct 2023 09:01:20 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 13603/30000]
 drivers/of/irq.c:284:73: sparse: sparse: incorrect type in initializer
 (different base types)
Message-ID: <202310010814.Yen3i0ua-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   4d08c0d1d18d85ca933dc3194519127515828746
commit: a323430753b95d8ac29fc0b3c2502b50f6073737 [13603/30000] ANDROID: GKI: of: irq: add helper to remap interrupts to another irqdomain
config: i386-randconfig-061-20231001 (https://download.01.org/0day-ci/archive/20231001/202310010814.Yen3i0ua-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231001/202310010814.Yen3i0ua-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310010814.Yen3i0ua-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/of/irq.c:284:73: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __be32 @@     got int @@
   drivers/of/irq.c:284:73: sparse:     expected restricted __be32
   drivers/of/irq.c:284:73: sparse:     got int

vim +284 drivers/of/irq.c

   276	
   277	int of_irq_domain_map(const struct irq_fwspec *in, struct irq_fwspec *out)
   278	{
   279		char *stem_name;
   280		char *cells_name, *map_name = NULL, *mask_name = NULL;
   281		char *pass_name = NULL;
   282		struct device_node *cur, *new = NULL;
   283		const __be32 *map, *mask, *pass;
 > 284		static const __be32 dummy_mask[] = { [0 ... MAX_PHANDLE_ARGS] = ~0 };
   285		static const __be32 dummy_pass[] = { [0 ... MAX_PHANDLE_ARGS] = 0 };
   286		__be32 initial_match_array[MAX_PHANDLE_ARGS];
   287		const __be32 *match_array = initial_match_array;
   288		int i, ret, map_len, match;
   289		u32 in_size, out_size;
   290	
   291		stem_name = "";
   292		cells_name = "#interrupt-cells";
   293	
   294		ret = -ENOMEM;
   295		map_name = kasprintf(GFP_KERNEL, "irqdomain%s-map", stem_name);
   296		if (!map_name)
   297			goto free;
   298	
   299		mask_name = kasprintf(GFP_KERNEL, "irqdomain%s-map-mask", stem_name);
   300		if (!mask_name)
   301			goto free;
   302	
   303		pass_name = kasprintf(GFP_KERNEL, "irqdomain%s-map-pass-thru", stem_name);
   304		if (!pass_name)
   305			goto free;
   306	
   307		/* Get the #interrupt-cells property */
   308		cur = to_of_node(in->fwnode);
   309		ret = of_property_read_u32(cur, cells_name, &in_size);
   310		if (ret < 0)
   311			goto put;
   312	
   313		/* Precalculate the match array - this simplifies match loop */
   314		for (i = 0; i < in_size; i++)
   315			initial_match_array[i] = cpu_to_be32(in->param[i]);
   316	
   317		ret = -EINVAL;
   318		/* Get the irqdomain-map property */
   319		map = of_get_property(cur, map_name, &map_len);
   320		if (!map) {
   321			ret = 0;
   322			goto free;
   323		}
   324		map_len /= sizeof(u32);
   325	
   326		/* Get the irqdomain-map-mask property (optional) */
   327		mask = of_get_property(cur, mask_name, NULL);
   328		if (!mask)
   329			mask = dummy_mask;
   330		/* Iterate through irqdomain-map property */
   331		match = 0;
   332		while (map_len > (in_size + 1) && !match) {
   333			/* Compare specifiers */
   334			match = 1;
   335			for (i = 0; i < in_size; i++, map_len--)
   336				match &= !((match_array[i] ^ *map++) & mask[i]);
   337	
   338			of_node_put(new);
   339			new = of_find_node_by_phandle(be32_to_cpup(map));
   340			map++;
   341			map_len--;
   342	
   343			/* Check if not found */
   344			if (!new)
   345				goto put;
   346	
   347			if (!of_device_is_available(new))
   348				match = 0;
   349	
   350			ret = of_property_read_u32(new, cells_name, &out_size);
   351			if (ret)
   352				goto put;
   353	
   354			/* Check for malformed properties */
   355			if (WARN_ON(out_size > MAX_PHANDLE_ARGS))
   356				goto put;
   357			if (map_len < out_size)
   358				goto put;
   359	
   360			/* Move forward by new node's #interrupt-cells amount */
   361			map += out_size;
   362			map_len -= out_size;
   363		}
   364		if (match) {
   365			/* Get the irqdomain-map-pass-thru property (optional) */
   366			pass = of_get_property(cur, pass_name, NULL);
   367			if (!pass)
   368				pass = dummy_pass;
   369	
   370			/*
   371			 * Successfully parsed a irqdomain-map translation; copy new
   372			 * specifier into the out structure, keeping the
   373			 * bits specified in irqdomain-map-pass-thru.
   374			 */
   375			match_array = map - out_size;
   376			for (i = 0; i < out_size; i++) {
   377				__be32 val = *(map - out_size + i);
   378	
   379				out->param[i] = in->param[i];
   380				if (i < in_size) {
   381					val &= ~pass[i];
   382					val |= cpu_to_be32(out->param[i]) & pass[i];
   383				}
   384	
   385				out->param[i] = be32_to_cpu(val);
   386			}
   387			out->param_count = in_size = out_size;
   388			out->fwnode = of_node_to_fwnode(new);
   389		}
   390	put:
   391		of_node_put(cur);
   392		of_node_put(new);
   393	free:
   394		kfree(mask_name);
   395		kfree(map_name);
   396		kfree(pass_name);
   397	
   398		return ret;
   399	}
   400	EXPORT_SYMBOL(of_irq_domain_map);
   401	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
