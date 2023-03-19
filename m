Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E310EC6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Mar 2023 08:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679214486; x=1710750486;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xUpBKuyCq3zDvKFg5zoxA5YrmdR01ZE/PnMjGtfcNaU=;
  b=Dhgt2TvZ9522f9B0tA6JA6JfS60SAv3HqNj1OjOJm+2RZbXeAwqfAB16
   FCmHg2oEwu658eJUEvolWibviHT0t4GaRJzQAyx52Quri3eOJsYWt1Tbx
   JdRKXdsH3U3sYc0duaILQPNgZ484TyQy5BAqlUz6kwkjzheOaSpeSwzbq
   1JL6sS+HMbqrfrPQt2rJ+IKFkORHk5q7l79JytMWJkOJN5JzpUo1fQjkt
   vTaVRk2ycI39yNXqhxuE9uW/8P37WfYXKNoUccGvj3owuFgYy5tVwGNkG
   Eu9uExhunAwt5sZe87Uw/6VGKDMWz4lQ3h3/IMnIi7cEhZcfy24mVNzXu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="340849624"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="340849624"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2023 01:28:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="674014013"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="674014013"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 19 Mar 2023 01:28:04 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdoOZ-000ASs-14;
	Sun, 19 Mar 2023 08:28:03 +0000
Date: Sun, 19 Mar 2023 16:27:58 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Lunn <andrew@lunn.ch>,
	linux-doc@vger.kernel.org
Subject: [lunn:v6.2.0-net-next-phy-leds 2/28] htmldocs:
 Documentation/leds/leds-class.rst:217: WARNING: Inline emphasis start-string
 without end-string.
Message-ID: <202303191637.XhbORWKz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.2.0-net-next-phy-leds
head:   8a9b1a5ad5dd0e48585009020088a2ee5bdd6688
commit: d4ee8e7089227062d16b95302ae0532f578bc205 [2/28] leds: add function to configure hardware controlled LED
reproduce:
        # https://github.com/lunn/linux/commit/d4ee8e7089227062d16b95302ae0532f578bc205
        git remote add lunn https://github.com/lunn/linux.git
        git fetch --no-tags lunn v6.2.0-net-next-phy-leds
        git checkout d4ee8e7089227062d16b95302ae0532f578bc205
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303191637.XhbORWKz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/leds/leds-class.rst:217: WARNING: Inline emphasis start-string without end-string.

vim +217 Documentation/leds/leds-class.rst

   216	
 > 217	- struct led_classdev *led_cdev
   218	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
