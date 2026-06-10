Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE54740D592
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jun 2026 22:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781131965; cv=none; b=O7ccXpn+gKpCne+OVqYpmXLpzMXXhaz7BLwantmfoEXKXZ1B9It5tnwQiUp8Lv/JaT3GcxsD8SwSkZOBjXNOO4FSSkru+xab+YZbfMabwCB8IPVr2BeMXyViJseGSDN76z6OyOBP04rQS8RhamEO5En3Hohlke1MuMxgxDPdFZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781131965; c=relaxed/simple;
	bh=Ll2hToKJyicZCRXESQAD8s5T5QwnqZBmr6M0S15UriU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ecRic3uKvI7o/UqYof2GgkCyJ5d6Wa86F+ZdSaUmRPqf2JZoe9NH6Ff6J8dpiVQBnXkNb7j8WFJQrVu/CldSi8AiYQo5JMZsx79jow60smKkX2gmM6SEzzplSYThA7HVEZXcnZ/U2egMLE+PbU8rsF8JxNmZMCjJyLRNXjEcdZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BR81lDL8; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BR81lDL8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781131964; x=1812667964;
  h=date:from:to:cc:subject:message-id;
  bh=Ll2hToKJyicZCRXESQAD8s5T5QwnqZBmr6M0S15UriU=;
  b=BR81lDL8V3s8VS8jOU+a/N0Ol6wyfX7JKhUGlJ6gQnD0zfFCKZr/nmCq
   n4Ij0ejwtqIMkBqqwC2/i3Wh0wHu668i5n/XP+YmLu0LKrsPzteBysaO3
   rp6t1yuLXbg5FV1+KWKQixV6znIdGcOx2nkezmLSd6Kcj9d5kBdg9SEi4
   ObntiBGchT9LN/5e+SLL90fO812jy+jamP/wT1j1xvh02S9sEmA7OY4W6
   ESvxzP+jc4/ZLMZC3fLLZOWVWzpBa/Kjj5/KRC6FGRYchWaxHjKlh1Fd7
   RgdWWARyZsriF4Usgl+woSWZFS9rmkog80VXfddhUVdAVrHGjs/A0jkTu
   w==;
X-CSE-ConnectionGUID: 4+2GGjzDQU2s6PQp7xXeyg==
X-CSE-MsgGUID: y9Ec6bAsTzC0hruPBlOniA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="84510626"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="84510626"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 15:52:43 -0700
X-CSE-ConnectionGUID: W/kjLGGCTiOg4BIdYGsB0A==
X-CSE-MsgGUID: M9Tf8KHhTP6FUBJvIfqm5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="246168461"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 10 Jun 2026 15:52:42 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXRmp-000000003px-1zmj;
	Wed, 10 Jun 2026 22:52:39 +0000
Date: Thu, 11 Jun 2026 00:52:03 +0200
From: kernel test robot <lkp@intel.com>
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/base/property.c:1117:31: warning: unused variable
 'ep'
Message-ID: <202606110043.IXzwVy9b-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Chen-Yu-Tsai/device-property-Add-fwnode_graph_get_port_by_id/20260610-173601
head:   54dea7fcb07184da44e32947a96eaf18f7f6972c
commit: a15f14edcda940eac696f9dd2cc820733f711d4b device property: Add fwnode_graph_get_next_port_endpoint()
date:   13 hours ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260611/202606110043.IXzwVy9b-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260611/202606110043.IXzwVy9b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606110043.IXzwVy9b-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/base/property.c: In function 'fwnode_graph_get_next_port_endpoint':
>> drivers/base/property.c:1117:31: warning: unused variable 'ep' [-Wunused-variable]
    1117 |         struct fwnode_handle *ep;
         |                               ^~


vim +/ep +1117 drivers/base/property.c

  1101	
  1102	/**
  1103	 * fwnode_graph_get_next_port_endpoint - Get next endpoint firmware node in port
  1104	 * @port: Pointer to the target port firmware node
  1105	 * @prev: Previous endpoint node or %NULL to get the first
  1106	 *
  1107	 * The caller is responsible for calling fwnode_handle_put() on the returned
  1108	 * fwnode pointer. Note that this function also puts a reference to @prev
  1109	 * unconditionally.
  1110	 *
  1111	 * Return: an endpoint firmware node pointer or %NULL if no more endpoints
  1112	 * are available.
  1113	 */
  1114	struct fwnode_handle *fwnode_graph_get_next_port_endpoint(const struct fwnode_handle *port,
  1115								  struct fwnode_handle *prev)
  1116	{
> 1117		struct fwnode_handle *ep;
  1118	
  1119		while (1) {
  1120			prev = fwnode_get_next_child_node(port, prev);
  1121			if (!prev)
  1122				break;
  1123	
  1124			if (WARN(!fwnode_name_eq(prev, "endpoint"),
  1125				 "non endpoint node is used (%pfw)", prev))
  1126				continue;
  1127	
  1128			break;
  1129		}
  1130	
  1131		return prev;
  1132	}
  1133	EXPORT_SYMBOL_GPL(fwnode_graph_get_next_port_endpoint);
  1134	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
