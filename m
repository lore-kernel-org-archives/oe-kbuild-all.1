Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9A836AF1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Feb 2024 10:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708511975; cv=none; b=d+6nWMWCf2kGKuOR39QoJq3s7n8XgdvOvoOUIIMletRL444UY6tMl8zA82QCPvDpPQ0Y53/Gwx2QJIXHh4F8NTi8jFcSHuNnWAv6qeib913q2rRvQaw7uoq4MJH/BTMr/uuY1KCp9aIA7xmHbVczKJH3JGwpy+XRAastcTH+kp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708511975; c=relaxed/simple;
	bh=xILmrnobn+p5gqFyC+n9FBC7LBi9lgVrfx/+q+USuTI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KDK8ARQlD5gENB5XNmm0hXjwv5t82B3TblzbIHJncE+wL6ubqQzDQasM8W8j3zwiLUsJvZYrhPUT3mfkJlsZZ5UCrP7SNXLUgvyt6VmMzDYdJWdq6aSa4gzF49M3Jz7FFhCVebDjYt2P7XuJxWpw4YFr+9PZ3L0fsAat8psV/ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A0KnIooJ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A0KnIooJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708511973; x=1740047973;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xILmrnobn+p5gqFyC+n9FBC7LBi9lgVrfx/+q+USuTI=;
  b=A0KnIooJnz8V4GQUazHwr4uwmjcrl1Ruy3blcW4Rj18ax0BPbf6vwlOp
   LSvZ1MJNDIwsOaS57UrgiTxPPl3yXdqDpF3o39iseJIm0Us60NWIqRSoD
   qy/Pdkm0xSg2y4Eqind42YhkjNTiVIP+Dep508ewHg1eWB5YqJl7SCCwO
   Ivz+i5MjaCDQxzfjBnq/Kpi8hU3gyZbzm5Y5p+JNTRG8z3nqYrEaqHZov
   Fb88QcDZwa3u+xaiB7urXZC+hYvJvy8BKUeoykQbKkEVt4xALKfB/EoIk
   fZ2tK0XV2uDkWdJ5GdUlfE3Uoy07/DC/SE6WamOS81nV/sh08vk4jRE8T
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="13284005"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="13284005"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 02:39:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="5456600"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 21 Feb 2024 02:39:31 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rck0U-0005G8-2l;
	Wed, 21 Feb 2024 10:39:21 +0000
Date: Wed, 21 Feb 2024 18:38:21 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gregory.price@memverge.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Gregory Price <gourry.memverge@gmail.com>
Subject: [gmprice:weighted_interleave-next 6/6] drivers/base/node.c:220:23:
 error: 'ACCESS_COORDINATE_CPU' undeclared
Message-ID: <202402211846.TzoQtcsx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gmprice/linux weighted_interleave-next
head:   8e917672b7b0fd84a6d95297abf937b61cc16015
commit: 8e917672b7b0fd84a6d95297abf937b61cc16015 [6/6] mm/mempolicy: introduce system default interleave weights
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240221/202402211846.TzoQtcsx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240221/202402211846.TzoQtcsx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402211846.TzoQtcsx-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/base/node.c: In function 'node_set_perf_attrs':
>> drivers/base/node.c:220:23: error: 'ACCESS_COORDINATE_CPU' undeclared (first use in this function)
     220 |         if (access == ACCESS_COORDINATE_CPU) {
         |                       ^~~~~~~~~~~~~~~~~~~~~
   drivers/base/node.c:220:23: note: each undeclared identifier is reported only once for each function it appears in


vim +/ACCESS_COORDINATE_CPU +220 drivers/base/node.c

   187	
   188	/**
   189	 * node_set_perf_attrs - Set the performance values for given access class
   190	 * @nid: Node identifier to be set
   191	 * @coord: Heterogeneous memory performance coordinates
   192	 * @access: The access class the for the given attributes
   193	 */
   194	void node_set_perf_attrs(unsigned int nid, struct access_coordinate *coord,
   195				 unsigned int access)
   196	{
   197		struct node_access_nodes *c;
   198		struct node *node;
   199		int i;
   200	
   201		if (WARN_ON_ONCE(!node_online(nid)))
   202			return;
   203	
   204		node = node_devices[nid];
   205		c = node_init_node_access(node, access);
   206		if (!c)
   207			return;
   208	
   209		c->coord = *coord;
   210		for (i = 0; access_attrs[i] != NULL; i++) {
   211			if (sysfs_add_file_to_group(&c->dev.kobj, access_attrs[i],
   212						    "initiators")) {
   213				pr_info("failed to add performance attribute to node %d\n",
   214					nid);
   215				break;
   216			}
   217		}
   218	
   219		/* When setting CPU access coordinates, update mempolicy */
 > 220		if (access == ACCESS_COORDINATE_CPU) {
   221			if (mempolicy_set_node_perf(nid, coord))
   222				pr_info("failed to set node%d mempolicy attrs\n", nid);
   223		}
   224	}
   225	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
