Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7C21548B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Nov 2023 15:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qyg1E9J3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699717947; x=1731253947;
  h=date:from:cc:subject:message-id:mime-version;
  bh=azRCTr/s9E7k7i40qVXBrUDNi2sqQaoFpQ8Hw+4+Y+g=;
  b=Qyg1E9J3Jnj01jXM4SQ3c40/NZe+OETyzSBh97i8MuJzOBxvZw7m86fj
   MflbjQy58fUScrYLKw5XbQmg7EEG2h0zvBjdj5WepVZPYzLkeNfV5uZm2
   2Jr/Scbt9bpA8RzXcWnli5aV0BR6Fv7V6INOBtU5/AIi2DHyiSBS7862g
   4M5VJ124Ep5SrUngjiVwSSJ0kudkRXF/6MBEinBWAb0QCNFpb9bOc06DD
   vlFeBM0sL5Rx1AQxj9X/iFAtjF2LfXkN83D6EuBihTzMANVgRh1l/+pAG
   IYf88TDLFxK0Kn3oGHqrmZeIPvODySUuIC9ejJHhRGDp1m1r7pegQw9Bi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="456779421"
X-IronPort-AV: E=Sophos;i="6.03,295,1694761200"; 
   d="scan'208";a="456779421"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2023 07:52:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="767542669"
X-IronPort-AV: E=Sophos;i="6.03,295,1694761200"; 
   d="scan'208";a="767542669"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 11 Nov 2023 07:52:25 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1qHX-000AYA-00
	for oe-kbuild-all@lists.linux.dev;
	Sat, 11 Nov 2023 15:52:23 +0000
Date: Sat, 11 Nov 2023 23:51:33 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:4.19/android_t 13367/30000] drivers/of/irq.c:284:73:
 sparse: sparse: incorrect type in initializer (different base types)
Message-ID: <202311112330.3CITZjfq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_t
head:   247bc655e03e4ac3632b21081ca56b813a644dcf
commit: a323430753b95d8ac29fc0b3c2502b50f6073737 [13367/30000] ANDROID: GKI: of: irq: add helper to remap interrupts to another irqdomain
config: x86_64-randconfig-122-20230910 (https://download.01.org/0day-ci/archive/20231111/202311112330.3CITZjfq-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311112330.3CITZjfq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311112330.3CITZjfq-lkp@intel.com/

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
