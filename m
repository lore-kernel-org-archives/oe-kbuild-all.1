Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570FB2EC04
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jun 2023 16:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686760611; x=1718296611;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PsOWCkZcOBs5Lf/qI2Q/IdAZ6ylgFOk6/8rb5g367sM=;
  b=AsMffXgMP3TnZqXLbzG/INfVu8+aaz9lKws05vGt0O+GRTuexXHuRRGT
   IGZ0Hrq6/XRTv/EVN7W14sQtChRaY6OW2HCatH7+cVup+jcT7mh38TBYb
   XnwV7k6naGtM5EKT8wZ5kcDgEAgAMwJV289iB8Ng7jvmc2EIdHB0usRrz
   ysoscVUV+Xgvexk7l4/UmkkSgGdwkAah5gvM06iq0T4KTCpe4rjCTqn01
   Dk1xEEvBQMcXIXmvUG3jaiO/lVGV7Ay32P6DrpVx3XY8aonewBGMy7wZS
   6t8sMnYlp8rhXzgz/WKlsvhzPPd0CwsX0y5Ea7sxNgQBX0uKn4JCBIYws
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="361145060"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="361145060"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 09:36:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="741892776"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="741892776"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 14 Jun 2023 09:36:43 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9TTX-0000rF-32;
	Wed, 14 Jun 2023 16:36:14 +0000
Date: Thu, 15 Jun 2023 00:34:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 14200/29850]
 drivers/of/irq.c:284:73: sparse: sparse: incorrect type in initializer
 (different base types)
Message-ID: <202306150040.x4kzXMJ5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   7816e65d75d3e618bc0c54a22c9af5472c44d013
commit: a323430753b95d8ac29fc0b3c2502b50f6073737 [14200/29850] ANDROID: GKI: of: irq: add helper to remap interrupts to another irqdomain
config: i386-randconfig-s052-20230614 (https://download.01.org/0day-ci/archive/20230615/202306150040.x4kzXMJ5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android-4.19-stable
        git checkout a323430753b95d8ac29fc0b3c2502b50f6073737
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/cpuidle/ drivers/of/ kernel/dma/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306150040.x4kzXMJ5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/of/irq.c:284:73: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __be32 @@     got int @@
   drivers/of/irq.c:284:73: sparse:     expected restricted __be32
   drivers/of/irq.c:284:73: sparse:     got int
   In file included from include/linux/gfp.h:6,
                    from include/linux/idr.h:16,
                    from include/linux/kernfs.h:14,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/device.h:16,
                    from drivers/of/irq.c:19:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1171:13: warning: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Waddress]
    1171 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1162:27: note: 'mem_section' declared here
    1162 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~

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
