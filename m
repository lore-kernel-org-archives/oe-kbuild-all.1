Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891304;
	b=q+n2EyfUG2EttH/t5SMoitTjmDl4vaRmMWIWZ1+OsFAHVhGdvWajOZl8XfICFftwCIvd
	 /VAMiojXyr1iONEhtmkm7SF+eUyXj6Hh5df8J0jdnVH99wfne7Vbsq40+AR3wrevtC6WW
	 xq0wwBH8lExYwl2QkEHQaSazKNkfmjpF97/wiImlmRWCh3fAxYnMZPXLgIpFvr28SQY0J
	 64ILwTjuGD7vUkIWTETq7JxXyGGWKol/QGiSZ8TAeke7iUWezDlPkt2eAk8qyr8OwJ+xk
	 HpZru3TvQI0S6u214tPO0iPsjm9YtJzC8n9YYnyoyyWAGt72PRlmNlTCc5kD8l/IESg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891304;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=qNs5ftSnrfaP5HnuIkjYZypmIZsAXIp6VGke4UVjfPk=;
	b=a4VUjSNxumLA0UYgiiBDR4R7207PWImtqwyq6gs3XO4hjVNUbz4kL8jsM8nQHFxAgnQW
	 vZLQOdlRvwUHn7aYSMn5KVXW7uiKjU+d6nfWRG0xpjShABZVjkZo9YwqP0HOy6Vux+YFp
	 RzJb4xTJa+wzpQXeL/2hfhttYjDahoL0puOg7u9zpn4vwL2nBtu5yc4KFxA3ph/t630cv
	 PlkfkbDBeum3rejyg67I649U4IddTdCSOlC5zh/BQGVYfdX97iFOsu8MJyKZy/yH84PUX
	 C9opHtpJTzOolKCp5qbuQz19TLPN6NbRZGiW+fQ9sBHz4wf973XekFJ0oo+xccgtOWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nb+qmX2s;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF280606A326
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Nov 2026 15:08:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF280606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nb+qmX2s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793891304; x=1825427304;
  h=date:from:to:cc:subject:message-id;
  bh=ULK1M2aw1B/OpO0xfTgP7YlYygS+M1HQ8i8qH6ts4Ds=;
  b=nb+qmX2sdqwKKLrRIVKzgB4iBhPbdAvS7uFgA6bF1ccVsmxrpe8zDHR+
   US5P2PlyuTE6AYNBqlmusb+fjq0+n9/Dc+RDsvjoV+s8Edp7hIgpbgKsx
   VrwNomk1/us8ILkeaSylAHxHP9pfrmaLHGhaq7Ana0h4Qs17JrP8hnQd7
   4eOI0rZ4QqMDlPv2GB+tGZrKlJ1KI6mDL7lt9pLxwb2YNgwS6vtT86g+U
   A841dBztqQMMXRc3DPW7ldiw/3Iv4E+ly6atyizEh3BB5SvwMqBlC31D9
   B9SnIRWETxrxytKu1qWf8uADr8fx7Xcjk9a67883LsXSAPZKac5/h/cKj
   g==;
X-CSE-ConnectionGUID: H+7nvH4oTeGPWXNZSfx+kg==
X-CSE-MsgGUID: x72nPVIwQOKb7aN38Pzvdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2676387"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2676387"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 07:08:23 -0800
X-CSE-ConnectionGUID: qgLsN2LjTcCFfHoq2ABIYA==
X-CSE-MsgGUID: 6xIbKFK5RDq60+827OTfDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7205733"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 05 Nov 2026 07:08:20 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOz4c-000000009fz-2rrl;
	Thu, 05 Nov 2026 15:08:18 +0000
Date: Thu, 05 Nov 2026 16:07:26 +0100
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next 18/34]
 drivers/leds/leds-pca955x.c:544:37: error: 'client' undeclared; did you mean
 'count'?
Message-ID: <202611051619.MBISEO1w-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
head:   a379f4e0adf2de7b11aa3ef87eeb7d9c838069b3
commit: abeb74220fefe28ab68789659f554f49e3b4a51e [18/34] leds: pca955x: Take a reference on the child firmware node
config: sparc64-randconfig-2200-20261105 (https://download.01.org/0day-ci/archive/20261105/202611051619.MBISEO1w-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611051619.MBISEO1w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611051619.MBISEO1w-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/of.h:20,
                    from include/linux/irqdomain.h:14,
                    from include/linux/gpio/driver.h:9,
                    from drivers/leds/leds-pca955x.c:44:
   drivers/leds/leds-pca955x.c: In function 'pca955x_parse_fwnode':
>> drivers/leds/leds-pca955x.c:544:37: error: 'client' undeclared (first use in this function); did you mean 'count'?
     device_for_each_child_node_scoped(&client->dev, child) {
                                        ^~~~~~
   include/linux/property.h:202:30: note: in definition of macro 'device_for_each_child_node_scoped'
      device_get_next_child_node(dev, NULL);   \
                                 ^~~
   drivers/leds/leds-pca955x.c:544:37: note: each undeclared identifier is reported only once for each function it appears in
     device_for_each_child_node_scoped(&client->dev, child) {
                                        ^~~~~~
   include/linux/property.h:202:30: note: in definition of macro 'device_for_each_child_node_scoped'
      device_get_next_child_node(dev, NULL);   \
                                 ^~~
>> drivers/leds/leds-pca955x.c:562:11: warning: returning 'void *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
       return ERR_PTR(res);
              ^~~~~~~~~~~~


vim +544 drivers/leds/leds-pca955x.c

   532	
   533	static int pca955x_parse_fwnode(struct pca955x *pca955x)
   534	{
   535		struct device *dev = &pca955x->client->dev;
   536		u8 bits = pca955x->chipdef->bits;
   537		struct pca955x_led *led;
   538		int count;
   539	
   540		count = device_get_child_node_count(dev);
   541		if (count > bits)
   542			return -ENODEV;
   543	
 > 544		device_for_each_child_node_scoped(&client->dev, child) {
   545			u32 reg;
   546			int res;
   547	
   548			res = fwnode_property_read_u32(child, "reg", &reg);
   549			if ((res != 0) || (reg >= bits))
   550				continue;
   551	
   552			led = &pca955x->leds[reg];
   553			if (led->fwnode)
   554				devm_release_action(&client->dev, pca955x_fwnode_put,
   555						    led->fwnode);
   556			led->type = PCA955X_TYPE_LED;
   557			led->fwnode = fwnode_handle_get(child);
   558	
   559			res = devm_add_action_or_reset(&client->dev,
   560						       pca955x_fwnode_put, led->fwnode);
   561			if (res)
 > 562				return ERR_PTR(res);
   563	
   564			led->default_state = led_init_default_state_get(child);
   565	
   566			fwnode_property_read_u32(child, "type", &led->type);
   567		}
   568	
   569		return 0;
   570	}
   571	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
