Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F7723750
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Oct 2023 21:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gpjViSXp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698788987; x=1730324987;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=600Nvh60124lsqCSvHFqzYzSMSzi4J7+aWhMqXLTTIM=;
  b=gpjViSXpulgOkH8cLMDCXSNQWjH0nerqJXWV4chPkQqAE1JKlk1N3k2v
   39v86EdFvv+75J//5QdX4MxoWJCgawzF4BJN7/2xmE8xZx/fJGmvEcOkD
   vv3V7DIZOZv5YVenXrJoNAUHtTdhU7OvoV0Wj6vK/bfBoC7/FzvodnpkM
   WdbrVAuRMZqZlMH7jQaejYX0pru/gLWAZ89Z/0Qjau/c1FQsiYWUMUT4S
   aSyrT9kmwCyFjZXS3LqbKFh41q30dpJ15oFbrj/n+iBPU85xL/znFTPch
   P/6BlcXhTjtMDEDXmcGXXCpwtb1VyRnhJNHqxmOKCBD1/7FxMI1Gxsdk1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="454850527"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; 
   d="scan'208";a="454850527"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 14:49:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="760748094"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; 
   d="scan'208";a="760748094"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 31 Oct 2023 14:49:42 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxwcG-0000PI-0V;
	Tue, 31 Oct 2023 21:49:40 +0000
Date: Wed, 1 Nov 2023 05:49:33 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-acpi@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-media@vger.kernel.org,
	Paul Elder <paul.elder@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Julien Stephan <jstephan@baylibre.com>, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/1] device property: Add fwnode_name_eq()
Message-ID: <202311010542.1tRHV0in-lkp@intel.com>
References: <20231031135306.1106640-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231031135306.1106640-1-sakari.ailus@linux.intel.com>

Hi Sakari,

kernel test robot noticed the following build warnings:

[auto build test WARNING on driver-core/driver-core-testing]
[also build test WARNING on driver-core/driver-core-next driver-core/driver-core-linus linus/master v6.6 next-20231031]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/device-property-Add-fwnode_name_eq/20231031-224454
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20231031135306.1106640-1-sakari.ailus%40linux.intel.com
patch subject: [PATCH 1/1] device property: Add fwnode_name_eq()
config: sh-allnoconfig (https://download.01.org/0day-ci/archive/20231101/202311010542.1tRHV0in-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231101/202311010542.1tRHV0in-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311010542.1tRHV0in-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/property.c:611: warning: Function parameter or member 'fwnode' not described in 'fwnode_name_eq'


vim +611 drivers/base/property.c

   596	
   597	/**
   598	 * fwnode_name_eq - Return true if node name is equal
   599	 * @fwnode The firmware node
   600	 * @name: The name to which to compare the node name
   601	 *
   602	 * Compare the name provided as an argument to the name of the node, stopping
   603	 * the comparison to either '\0' or '@' character, whichever comes first. This
   604	 * function is generally used for comparing node names while ignoring the
   605	 * possible unit address of the node.
   606	 *
   607	 * Return: true if the node name matches with the name provided in the @name
   608	 * argument, false otherwise.
   609	 */
   610	bool fwnode_name_eq(const struct fwnode_handle *fwnode, const char *name)
 > 611	{
   612		const char *node_name;
   613		unsigned int len;
   614	
   615		node_name = fwnode_get_name(fwnode);
   616		if (!node_name)
   617			return false;
   618	
   619		len = strchrnul(node_name, '@') - node_name;
   620	
   621		return strlen(name) == len && !strncmp(node_name, name, len);
   622	}
   623	EXPORT_SYMBOL_GPL(fwnode_name_eq);
   624	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
