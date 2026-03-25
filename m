Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89152EA72A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 05:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774415618; cv=none; b=pavd/9jl+wEZyNKSzKwDXnijVFqs9e0jKaV06hOaYCeLkOj5mD9xy5BVYlgplWYP8uLqyHaWeZeOlbi1PWaTHqfoOamap/S1NiOb70XPzlhwM59g5iozLwC4B53yypkd38VkUZJXNKWxkwBvAp2RR79LxoFw8lO6ifYRruvQJcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774415618; c=relaxed/simple;
	bh=vUh70uVukvlVrMmNK1snPq2VAlwgbK4FBwOI52vMfJI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K79ZtpreZE9d8qw2O19c+dYFB0sZ9avac62B7c3wobfDzfRLKGVGpRGdwTmRQhpVnxSQpz7lKjj1QoUfge8Ghhi6Z9N3A7t7q4+Ij+EEz89rdqq2DUgWAY/m7K5Ry+2RXqw8kP0ICemfWF2yz8Sl4OwVEUGvRRNbamS7nVoExsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I7p38E+k; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I7p38E+k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774415617; x=1805951617;
  h=date:from:to:cc:subject:message-id;
  bh=vUh70uVukvlVrMmNK1snPq2VAlwgbK4FBwOI52vMfJI=;
  b=I7p38E+kdINb7R0u5qvH2L6783cBOm+hIyxG0cv/6RjQyLZGwrBZ5vyQ
   BM7XrH3ECiYGyXXOrUIkP1bm2zmJoB3tBmb9EL83iebFEKKkUgAujPY4O
   9lEns9ZHuR0jDgZhEqlmLU9/h8jgDZKVKqVOlPUj9qdr7DrzxYZF+SupL
   eKoWjhZZQuIF5K9RqGQRPOHt4lXNW+MLKg3XrDbOtivvRy35jdYyS9qWQ
   xd0qcmSenL344EpLmPIUgeNVRvZbnFUyjmTl+J/iJdpvqtplPLvm98Nea
   W/xFfChCuQ/wBPna9uKIAFRldYbk2l4aSw4oyJOQsuFlT4izxxVYQtiGi
   Q==;
X-CSE-ConnectionGUID: J+Ok88AnRN+OJ6rAms78/w==
X-CSE-MsgGUID: nL5QgNn1T7SPpeekpSUdiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75332314"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="75332314"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 22:13:35 -0700
X-CSE-ConnectionGUID: nsF5g+FCSnKQWHX+Mf5Gjg==
X-CSE-MsgGUID: 6beZS92HQRipgs/9ixZ2JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="229351152"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Mar 2026 22:13:33 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5GYc-0000000067p-4AzJ;
	Wed, 25 Mar 2026 05:13:30 +0000
Date: Wed, 25 Mar 2026 13:12:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/1]
 drivers/thunderbolt/tb.c:760: warning: expecting prototype for
 tb_maximum_banwidth(). Prototype was for tb_maximum_bandwidth() instead
Message-ID: <202603251319.fwWEMU7F-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   36e33448be90aea3d2e98da271b35aac511b8dc6
commit: aed38a3eaf652230e8622ec9317998540276f61d [0/1] thunderbolt: Configure asymmetric link if needed and bandwidth allows
config: x86_64-randconfig-076-20260325 (https://download.01.org/0day-ci/archive/20260325/202603251319.fwWEMU7F-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603251319.fwWEMU7F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603251319.fwWEMU7F-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/thunderbolt/tb.c:760: warning: expecting prototype for tb_maximum_banwidth(). Prototype was for tb_maximum_bandwidth() instead


vim +760 drivers/thunderbolt/tb.c

   740	
   741	/**
   742	 * tb_maximum_banwidth() - Maximum bandwidth over a single link
   743	 * @tb: Domain structure
   744	 * @src_port: Source protocol adapter
   745	 * @dst_port: Destination protocol adapter
   746	 * @port: USB4 port the total bandwidth is calculated
   747	 * @max_up: Maximum upstream bandwidth (Mb/s)
   748	 * @max_down: Maximum downstream bandwidth (Mb/s)
   749	 * @include_asym: Include bandwidth if the link is switched from
   750	 *		  symmetric to asymmetric
   751	 *
   752	 * Returns maximum possible bandwidth in @max_up and @max_down over a
   753	 * single link at @port. If @include_asym is set then includes the
   754	 * additional banwdith if the links are transitioned into asymmetric to
   755	 * direction from @src_port to @dst_port.
   756	 */
   757	static int tb_maximum_bandwidth(struct tb *tb, struct tb_port *src_port,
   758					struct tb_port *dst_port, struct tb_port *port,
   759					int *max_up, int *max_down, bool include_asym)
 > 760	{
   761		bool downstream = tb_port_path_direction_downstream(src_port, dst_port);
   762		int link_speed, link_width, up_bw, down_bw;
   763	
   764		/*
   765		 * Can include asymmetric, only if it is actually supported by
   766		 * the lane adapter.
   767		 */
   768		if (!tb_asym_supported(src_port, dst_port, port))
   769			include_asym = false;
   770	
   771		if (tb_is_upstream_port(port)) {
   772			link_speed = port->sw->link_speed;
   773			/*
   774			 * sw->link_width is from upstream perspective so we use
   775			 * the opposite for downstream of the host router.
   776			 */
   777			if (port->sw->link_width == TB_LINK_WIDTH_ASYM_TX) {
   778				up_bw = link_speed * 3 * 1000;
   779				down_bw = link_speed * 1 * 1000;
   780			} else if (port->sw->link_width == TB_LINK_WIDTH_ASYM_RX) {
   781				up_bw = link_speed * 1 * 1000;
   782				down_bw = link_speed * 3 * 1000;
   783			} else if (include_asym) {
   784				/*
   785				 * The link is symmetric at the moment but we
   786				 * can switch it to asymmetric as needed. Report
   787				 * this bandwidth as available (even though it
   788				 * is not yet enabled).
   789				 */
   790				if (downstream) {
   791					up_bw = link_speed * 1 * 1000;
   792					down_bw = link_speed * 3 * 1000;
   793				} else {
   794					up_bw = link_speed * 3 * 1000;
   795					down_bw = link_speed * 1 * 1000;
   796				}
   797			} else {
   798				up_bw = link_speed * port->sw->link_width * 1000;
   799				down_bw = up_bw;
   800			}
   801		} else {
   802			link_speed = tb_port_get_link_speed(port);
   803			if (link_speed < 0)
   804				return link_speed;
   805	
   806			link_width = tb_port_get_link_width(port);
   807			if (link_width < 0)
   808				return link_width;
   809	
   810			if (link_width == TB_LINK_WIDTH_ASYM_TX) {
   811				up_bw = link_speed * 1 * 1000;
   812				down_bw = link_speed * 3 * 1000;
   813			} else if (link_width == TB_LINK_WIDTH_ASYM_RX) {
   814				up_bw = link_speed * 3 * 1000;
   815				down_bw = link_speed * 1 * 1000;
   816			} else if (include_asym) {
   817				/*
   818				 * The link is symmetric at the moment but we
   819				 * can switch it to asymmetric as needed. Report
   820				 * this bandwidth as available (even though it
   821				 * is not yet enabled).
   822				 */
   823				if (downstream) {
   824					up_bw = link_speed * 1 * 1000;
   825					down_bw = link_speed * 3 * 1000;
   826				} else {
   827					up_bw = link_speed * 3 * 1000;
   828					down_bw = link_speed * 1 * 1000;
   829				}
   830			} else {
   831				up_bw = link_speed * link_width * 1000;
   832				down_bw = up_bw;
   833			}
   834		}
   835	
   836		/* Leave 10% guard band */
   837		*max_up = up_bw - up_bw / 10;
   838		*max_down = down_bw - down_bw / 10;
   839	
   840		tb_port_dbg(port, "link maximum bandwidth %d/%d Mb/s\n", *max_up, *max_down);
   841		return 0;
   842	}
   843	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
