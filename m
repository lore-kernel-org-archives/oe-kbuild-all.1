Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0659631A67
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Oct 2023 19:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eHJaUw00"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698262287; x=1729798287;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wPpIQrGVGDn7z+UV9jcQLazUqVSS94/HOZfM3/WRG+0=;
  b=eHJaUw00TJiLHHk0G9Dd2H6ZUVrj7yBNV+5jkEz07EYYgb5f9U4snUZr
   ofk8k2OAcY8VhBSZ/o+TqL44VdxpESE8SWEcjTfBTaC2JAgyYo75Qln5F
   6XhV4nC96u/D6waRl3p5nzCwWXfc5naxjenGy5tzCf46+3a2S8jwkieC4
   YCpxRL47a448ChS7VTf0n0QHReQMMUerbNv50djfpaBFgO4t93xIJfZIw
   1lhy5ot1mZk8VRNvVrMefbte0fLWiu7KfJqeJmPFokfSDloiJL7/Odf0p
   fBX4607CDxLZDHEKdfvAnfRifuflC7Y3ygUnFFQHfQMP/0668UNX8vfxZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="418506576"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="418506576"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 12:31:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="875618767"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="875618767"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 25 Oct 2023 12:31:28 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvjbB-00099E-30;
	Wed, 25 Oct 2023 19:31:25 +0000
Date: Thu, 26 Oct 2023 03:30:37 +0800
From: kernel test robot <lkp@intel.com>
To: alison.schofield@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 2/3] cxl/region: Calculate a target position in a
 region interleave
Message-ID: <202310260337.UEpEsYux-lkp@intel.com>
References: <7709896423244c523e810d9f5d2ef625e7babf3b.1698254338.git.alison.schofield@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7709896423244c523e810d9f5d2ef625e7babf3b.1698254338.git.alison.schofield@intel.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8a749fd1a8720d4619c91c8b6e7528c0a355c0aa]

url:    https://github.com/intel-lab-lkp/linux/commits/alison-schofield-intel-com/cxl-region-Prepare-the-decoder-match-range-helper-for-reuse/20231026-013232
base:   8a749fd1a8720d4619c91c8b6e7528c0a355c0aa
patch link:    https://lore.kernel.org/r/7709896423244c523e810d9f5d2ef625e7babf3b.1698254338.git.alison.schofield%40intel.com
patch subject: [PATCH v3 2/3] cxl/region: Calculate a target position in a region interleave
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231026/202310260337.UEpEsYux-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231026/202310260337.UEpEsYux-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310260337.UEpEsYux-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cxl/core/region.c:1526: warning: expecting prototype for cxl_find_pos_and_ways(). Prototype was for find_pos_and_ways() instead


vim +1526 drivers/cxl/core/region.c

  1503	
  1504	/**
  1505	 * cxl_find_pos_and_ways() - find the position of a port in a parent
  1506	 *			     and the parent interleave ways
  1507	 *
  1508	 * @port: the port in search of parent info
  1509	 * @range: the hpa range that the parent must map
  1510	 * @pos: the position of @port in the parent decoder target list
  1511	 * @ways: the interleave ways of the parent decoder
  1512	 *
  1513	 * This helper function for cxl_calc_interleave_pos() provides the
  1514	 * @pos and @ways used to calculate the endpoint position in a region
  1515	 * interleave.
  1516	 *
  1517	 * Use @range to find @port's parent port and follow that to the
  1518	 * parent switch decoder. Extract @ways from the switch decoder and
  1519	 * lookup the @port @pos in the switch decoder target list.
  1520	 *
  1521	 * Returns:	0: success, @pos and @ways are updated
  1522	 *	   -ENXIO: failed to find @pos or @ways
  1523	 */
  1524	static int find_pos_and_ways(struct cxl_port *port, struct range *range,
  1525				     int *pos, int *ways)
> 1526	{
  1527		struct cxl_switch_decoder *cxlsd;
  1528		struct cxl_port *parent;
  1529		struct device *dev;
  1530		int rc = -ENXIO;
  1531	
  1532		parent = next_port(port);
  1533		if (!parent)
  1534			return rc;
  1535	
  1536		dev = device_find_child(&parent->dev, range,
  1537					match_switch_decoder_by_range);
  1538		if (!dev) {
  1539			dev_err(port->uport_dev,
  1540				"failed to find decoder mapping %#llx-%#llx\n",
  1541				range->start, range->end);
  1542			return rc;
  1543		}
  1544		cxlsd = to_cxl_switch_decoder(dev);
  1545		*ways = cxlsd->cxld.interleave_ways;
  1546	
  1547		for (int i = 0; i < *ways; i++) {
  1548			if (cxlsd->target[i] == port->parent_dport) {
  1549				*pos = i;
  1550				rc = 0;
  1551				break;
  1552			}
  1553		}
  1554		put_device(dev);
  1555	
  1556		return rc;
  1557	}
  1558	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
