Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5874935972
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 02:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748314101; cv=none; b=P7f+s47yFQUey/iDKBBoT/svf6PHiwmMipL3YOoOjQRO7TsOXGX4iy2ANrQnPsJx23ZtlTRuHoe8LZhOCEFRHRTCx90KskNd+XrMGfc1letHboJckT4q2X6BArsvQ0Vn/dSuzqZjyu/j6BikLqfp3riLvHrQ/eboD8TyJYqclYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748314101; c=relaxed/simple;
	bh=JqEfbl4KLBdrVPb0IHYmoWsetf3MRmxpqh5aoLBBqKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jg+304cjk5JE0qjPtODHyG6LnFuPcnt8pdm1XELQob2EBpYAzGxJP9zK4EnYV+60RG4JB4wpz9NDtkoTTunqNqQD+A/MWEhwENuavzdyN1BlFZW8Pc4rID9S/qpEQlFMSxiQa+S9bbY30bYJJlsT8DnnHF5e+Od0h+7SQZarlyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=apGBEusq; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="apGBEusq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748314100; x=1779850100;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JqEfbl4KLBdrVPb0IHYmoWsetf3MRmxpqh5aoLBBqKQ=;
  b=apGBEusq63tfE3uY0RJynMw4lXK1deM4fphKiGF3B5HZ0B8ByEFOYeXB
   jAzcQmoL7RJvP63vz6PJl5X/t0KGILeSPZxYbNow5pfgyt7qcrqtXtnlI
   9lAFbeRXFWVrSM8UUlOs4LfCzkvqSjoNLpphw4Ek00zhC6el+hmvtW0j1
   W45hFois1H5RxnkQ3BhUcFxfXYOPLj7IdMpW2yvc5gh0loQaBqpRXQm+D
   ODo0qJpWRnYeU97mzcWgu/hur9QrR7639VAJcutmq4bZ94PmDQc/OYW+5
   chdoiofFBX4cqhr7fTS6uSkz9t4MwqiFSgMsJvUCwUQR2nTNQot7aaFju
   A==;
X-CSE-ConnectionGUID: LAsUIl01SjGkcMDWBOLadg==
X-CSE-MsgGUID: 1YtEakP8TkGXilhCApBtEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="49988254"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="49988254"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 19:48:17 -0700
X-CSE-ConnectionGUID: rKF7IFF1SUCjsvdEG1yNww==
X-CSE-MsgGUID: CyMaUhJ5TVy/zyy+zU4q7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="142577738"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 26 May 2025 19:48:14 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJkMO-000Spu-1o;
	Tue, 27 May 2025 02:48:12 +0000
Date: Tue, 27 May 2025 10:47:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 133/133]
 drivers/misc/mediatek/mtk-interconnect/core.c:370: warning: expecting
 prototype for of_icc_get(). Prototype was for of_mtk_icc_get() instead
Message-ID: <202505271041.QxGKp47v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   00e2b7e08c550ff321daba7b9956795d281bdd98
commit: eccfdd41c59e6c97a4c21756bee8492092bb7506 [133/133] CHROMIUM: mmqos: add the mtk-interconnect to support mmqos
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250527/202505271041.QxGKp47v-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250527/202505271041.QxGKp47v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505271041.QxGKp47v-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/misc/mediatek/mtk-interconnect/core.c:370: warning: expecting prototype for of_icc_get(). Prototype was for of_mtk_icc_get() instead
>> drivers/misc/mediatek/mtk-interconnect/core.c:469: warning: expecting prototype for icc_set_tag(). Prototype was for mtk_icc_set_tag() instead
>> drivers/misc/mediatek/mtk-interconnect/core.c:525: warning: expecting prototype for icc_set_bw(). Prototype was for mtk_icc_set_bw() instead
>> drivers/misc/mediatek/mtk-interconnect/core.c:593: warning: expecting prototype for icc_get(). Prototype was for mtk_icc_get() instead
>> drivers/misc/mediatek/mtk-interconnect/core.c:632: warning: expecting prototype for icc_put(). Prototype was for mtk_icc_put() instead
>> drivers/misc/mediatek/mtk-interconnect/core.c:690: warning: expecting prototype for icc_node_create(). Prototype was for mtk_icc_node_create() instead
>> drivers/misc/mediatek/mtk-interconnect/core.c:706: warning: expecting prototype for icc_node_destroy(). Prototype was for mtk_icc_node_destroy() instead
>> drivers/misc/mediatek/mtk-interconnect/core.c:740: warning: expecting prototype for icc_link_create(). Prototype was for mtk_icc_link_create() instead
>> drivers/misc/mediatek/mtk-interconnect/core.c:796: warning: expecting prototype for icc_link_destroy(). Prototype was for mtk_icc_link_destroy() instead
>> drivers/misc/mediatek/mtk-interconnect/core.c:838: warning: expecting prototype for icc_node_add(). Prototype was for mtk_icc_node_add() instead
>> drivers/misc/mediatek/mtk-interconnect/core.c:861: warning: expecting prototype for icc_node_del(). Prototype was for mtk_icc_node_del() instead
>> drivers/misc/mediatek/mtk-interconnect/core.c:875: warning: expecting prototype for icc_provider_add(). Prototype was for mtk_icc_provider_add() instead
>> drivers/misc/mediatek/mtk-interconnect/core.c:900: warning: expecting prototype for icc_provider_del(). Prototype was for mtk_icc_provider_del() instead


vim +370 drivers/misc/mediatek/mtk-interconnect/core.c

   353	
   354	/**
   355	 * of_icc_get() - get a path handle from a DT node based on name
   356	 * @dev: device pointer for the consumer device
   357	 * @name: interconnect path name
   358	 *
   359	 * This function will search for a path between two endpoints and return an
   360	 * icc_path handle on success. Use icc_put() to release constraints when they
   361	 * are not needed anymore.
   362	 * If the interconnect API is disabled, NULL is returned and the consumer
   363	 * drivers will still build. Drivers are free to handle this specifically,
   364	 * but they don't have to.
   365	 *
   366	 * Return: icc_path pointer on success or ERR_PTR() on error. NULL is returned
   367	 * when the API is disabled or the "interconnects" DT property is missing.
   368	 */
   369	struct icc_path *of_mtk_icc_get(struct device *dev, const char *name)
 > 370	{
   371		struct icc_path *path = ERR_PTR(-EPROBE_DEFER);
   372		struct of_phandle_args src_args, dst_args;
   373		struct icc_node *src_node, *dst_node;
   374		struct device_node *np = NULL;
   375		int idx = 0;
   376		int ret;
   377	
   378		if (!dev || !dev->of_node)
   379			return ERR_PTR(-ENODEV);
   380	
   381		np = dev->of_node;
   382	
   383		/*
   384		 * When the consumer DT node do not have "interconnects" property
   385		 * return a NULL path to skip setting constraints.
   386		 */
   387		if (!of_find_property(np, "interconnects", NULL))
   388			return NULL;
   389	
   390		/*
   391		 * We use a combination of phandle and specifier for endpoint. For now
   392		 * lets support only global ids and extend this in the future if needed
   393		 * without breaking DT compatibility.
   394		 */
   395		if (name) {
   396			idx = of_property_match_string(np, "interconnect-names", name);
   397			if (idx < 0)
   398				return ERR_PTR(idx);
   399		}
   400	
   401		ret = of_parse_phandle_with_args(np, "interconnects",
   402						 "#mtk-interconnect-cells", idx * 2,
   403						 &src_args);
   404		if (ret)
   405			return ERR_PTR(ret);
   406	
   407		of_node_put(src_args.np);
   408	
   409		ret = of_parse_phandle_with_args(np, "interconnects",
   410						 "#mtk-interconnect-cells", idx * 2 + 1,
   411						 &dst_args);
   412		if (ret)
   413			return ERR_PTR(ret);
   414	
   415		of_node_put(dst_args.np);
   416	
   417		src_node = of_icc_get_from_provider(&src_args);
   418	
   419		if (IS_ERR(src_node)) {
   420			if (PTR_ERR(src_node) != -EPROBE_DEFER)
   421				dev_err(dev, "error finding src node: %ld\n",
   422					PTR_ERR(src_node));
   423	
   424			return ERR_CAST(src_node);
   425		}
   426	
   427		dst_node = of_icc_get_from_provider(&dst_args);
   428	
   429		if (IS_ERR(dst_node)) {
   430			if (PTR_ERR(dst_node) != -EPROBE_DEFER)
   431				dev_err(dev, "error finding dst node: %ld\n",
   432					PTR_ERR(dst_node));
   433	
   434			return ERR_CAST(dst_node);
   435		}
   436	
   437		mutex_lock(&icc_lock);
   438		path = path_find(dev, src_node, dst_node);
   439		mutex_unlock(&icc_lock);
   440		if (IS_ERR(path)) {
   441			dev_err(dev, "%s: invalid path=%ld\n", __func__, PTR_ERR(path));
   442			return path;
   443		}
   444	
   445		if (name)
   446			path->name = kstrdup_const(name, GFP_KERNEL);
   447		else
   448			path->name = kasprintf(GFP_KERNEL, "%s-%s",
   449					       src_node->name, dst_node->name);
   450	
   451		if (!path->name) {
   452			kfree(path);
   453			return ERR_PTR(-ENOMEM);
   454		}
   455	
   456		return path;
   457	}
   458	EXPORT_SYMBOL_GPL(of_mtk_icc_get);
   459	
   460	/**
   461	 * icc_set_tag() - set an optional tag on a path
   462	 * @path: the path we want to tag
   463	 * @tag: the tag value
   464	 *
   465	 * This function allows consumers to append a tag to the requests associated
   466	 * with a path, so that a different aggregation could be done based on this tag.
   467	 */
   468	void mtk_icc_set_tag(struct icc_path *path, u32 tag)
 > 469	{
   470		int i;
   471	
   472		if (!path)
   473			return;
   474	
   475		mutex_lock(&icc_lock);
   476		for (i = 0; i < path->num_nodes; i++)
   477			path->reqs[i].tag = tag;
   478		mutex_unlock(&icc_lock);
   479	}
   480	EXPORT_SYMBOL_GPL(mtk_icc_set_tag);
   481	
   482	int mtk_icc_set_bw_not_update(struct icc_path *path, u32 avg_bw, u32 peak_bw)
   483	{
   484		struct icc_node *node;
   485		size_t i;
   486	
   487		if (IS_ERR_OR_NULL(path) || !path->num_nodes) {
   488			pr_notice("wrong path setting\n");
   489			return -EINVAL;
   490		}
   491	
   492		mutex_lock(&icc_lock);
   493		for (i = 0; i < path->num_nodes; i++) {
   494			node = path->reqs[i].node;
   495	
   496			/* update the consumer request for this path */
   497			path->reqs[i].avg_bw = avg_bw;
   498			path->reqs[i].peak_bw = peak_bw;
   499	
   500			/* aggregate requests for this node */
   501			aggregate_requests(node);
   502		}
   503		mutex_unlock(&icc_lock);
   504	
   505		return 0;
   506	}
   507	EXPORT_SYMBOL_GPL(mtk_icc_set_bw_not_update);
   508	
   509	/**
   510	 * icc_set_bw() - set bandwidth constraints on an interconnect path
   511	 * @path: reference to the path returned by icc_get()
   512	 * @avg_bw: average bandwidth in kilobytes per second
   513	 * @peak_bw: peak bandwidth in kilobytes per second
   514	 *
   515	 * This function is used by an interconnect consumer to express its own needs
   516	 * in terms of bandwidth for a previously requested path between two endpoints.
   517	 * The requests are aggregated and each node is updated accordingly. The entire
   518	 * path is locked by a mutex to ensure that the set() is completed.
   519	 * The @path can be NULL when the "interconnects" DT properties is missing,
   520	 * which will mean that no constraints will be set.
   521	 *
   522	 * Returns 0 on success, or an appropriate error code otherwise.
   523	 */
   524	int mtk_icc_set_bw(struct icc_path *path, u32 avg_bw, u32 peak_bw)
 > 525	{
   526		u32 restore_avg_bw, restore_peak_bw;
   527		struct icc_node *node;
   528		size_t i;
   529		int ret;
   530	
   531		if (IS_ERR_OR_NULL(path) || !path->num_nodes) {
   532			return 0;
   533		}
   534	
   535		mutex_lock(&icc_lock);
   536	
   537		restore_avg_bw = path->reqs[0].avg_bw;
   538		restore_peak_bw = path->reqs[0].peak_bw;
   539	
   540		aggregate_requests_v2(path, avg_bw, peak_bw);
   541	
   542		for (i = 0; i < path->num_nodes; i++) {
   543			node = path->reqs[i].node;
   544			/* update the consumer request for this path */
   545			path->reqs[i].avg_bw = avg_bw;
   546			path->reqs[i].peak_bw = peak_bw;
   547	
   548			if (log_level & 1 << log_v2_dbg)
   549				pr_notice("[mmqos][set] node:%s num:%d avg_bw:%d peak_bw:%d\n",
   550					  node->name, (int)path->num_nodes, avg_bw, peak_bw);
   551			node->avg_bw = node->v2_avg_bw;
   552			node->peak_bw = node->v2_peak_bw;
   553			trace_mtk_icc_set_bw(path, node, i, avg_bw, peak_bw);
   554		}
   555	
   556		ret = apply_constraints(path);
   557		if (ret) {
   558			pr_debug("interconnect: error applying constraints (%d)\n", ret);
   559	
   560			for (i = 0; i < path->num_nodes; i++) {
   561				node = path->reqs[i].node;
   562				path->reqs[i].avg_bw = restore_avg_bw;
   563				path->reqs[i].peak_bw = restore_peak_bw;
   564				aggregate_requests(node);
   565			}
   566	
   567			apply_constraints(path);
   568		}
   569	
   570		mutex_unlock(&icc_lock);
   571		trace_mtk_icc_set_bw_end(path, ret);
   572		return ret;
   573	}
   574	EXPORT_SYMBOL_GPL(mtk_icc_set_bw);
   575	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
