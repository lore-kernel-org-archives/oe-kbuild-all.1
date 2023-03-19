Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3BC80F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Mar 2023 02:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679192282; x=1710728282;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jIPuaikK5WiTV8K4JvH+9NjhVzDb94XyP23TDKGgK3k=;
  b=i5eVd3FzzJqkiKW7mCDUaI2lwc74Oz/oepUX/0gRpm4OsKvmTQ0x/jy9
   YZcrTiSH1wElVY8TCXVB6f9epLkjCaAGZnhpbcmeMZEBDXLEtmJKIrRq7
   Z+BS6rxXfVxlw9XXvVgXeoOojUTyffdaJheH/PcLj18rRVf60MwQycjJT
   cs/mqzRtZuEx6z3xMib4DickHXTW4HuYlnNjc222jv132hoqZSR3em4TS
   1aWaKXK42J4mi1sTSRaOTqBUpkwtqCKFYOBUm7TgME0vIhx5fZ/GBahs7
   GhSuVtUe2MPb4Eyh8Ok48pOEae8bnkBiNvvrtFh1yeMY5orzvEYkxO8qL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="318874991"
X-IronPort-AV: E=Sophos;i="5.98,272,1673942400"; 
   d="scan'208";a="318874991"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 19:18:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="854880048"
X-IronPort-AV: E=Sophos;i="5.98,272,1673942400"; 
   d="scan'208";a="854880048"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 18 Mar 2023 19:17:59 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdicQ-000ALI-0m;
	Sun, 19 Mar 2023 02:17:58 +0000
Date: Sun, 19 Mar 2023 10:17:00 +0800
From: kernel test robot <lkp@intel.com>
To: "jingle.wu" <jingle.wu@emc.com.tw>, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, dmitry.torokhov@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, phoenix@emc.com.tw, josh.chen@emc.com.tw,
	dave.wang@emc.com.tw, "jingle.wu" <jingle.wu@emc.com.tw>
Subject: Re: [PATCH] Input: elan_i2c - Implement inhibit/uninhibit functions.
Message-ID: <202303191024.mbwWRV3A-lkp@intel.com>
References: <20230317071646.977357-1-jingle.wu@emc.com.tw>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230317071646.977357-1-jingle.wu@emc.com.tw>

Hi jingle.wu,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on dtor-input/next]
[also build test WARNING on dtor-input/for-linus hid/for-next linus/master v6.3-rc2 next-20230317]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/jingle-wu/Input-elan_i2c-Implement-inhibit-uninhibit-functions/20230317-152004
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20230317071646.977357-1-jingle.wu%40emc.com.tw
patch subject: [PATCH] Input: elan_i2c - Implement inhibit/uninhibit functions.
config: nios2-randconfig-m031-20230319 (https://download.01.org/0day-ci/archive/20230319/202303191024.mbwWRV3A-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303191024.mbwWRV3A-lkp@intel.com/

smatch warnings:
drivers/input/mouse/elan_i2c_core.c:342 elan_reactivate() warn: inconsistent indenting

vim +342 drivers/input/mouse/elan_i2c_core.c

   331	
   332	static int elan_reactivate(struct elan_tp_data *data)
   333	{
   334		struct device *dev = &data->client->dev;
   335		int ret;
   336	
   337		ret = elan_set_power(data, true);
   338		if (ret)
   339			dev_err(dev, "failed to restore power: %d\n", ret);
   340	
   341		ret = data->ops->sleep_control(data->client, false);
 > 342			if (ret) {
   343				dev_err(dev,
   344					"failed to wake device up: %d\n", ret);
   345				return ret;
   346			}
   347	
   348		return ret;
   349	}
   350	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
