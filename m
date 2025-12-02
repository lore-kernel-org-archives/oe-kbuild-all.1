Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAED620E005
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 17:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764697607; cv=none; b=WDp7MlKZ+gvTYahx6hmI/leYqkMbg4557XTpc7pN2EB/7/mLZR2zjic6IDsK5SN2XWBwKH9Sm8MfCkHPbeF4bTRf9QHKfwvOXUfqlAFH0ibviU2rhwgf5lpnFYDNU12Za8ZWKIpwlYKK5Ig9NaSv8IU2n6Amg15xeXp51LpuK7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764697607; c=relaxed/simple;
	bh=QR+nX1vUDuUgHEr4fO4w4uZIdz4kvFsTOxHBWTMXFHs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HTwL6OzLe4yAz8euIW/0+NaNXau/PmK48D3atDlXFjYXDe7m4Mn9YxvaNGraE6+L265bUI6Y39DS6WK8FHo3JX4pPs3YmN3tMH7AlvBnGccE0BvZR7rmgs2pbEcfMB3fJH76JLmKms/szXHXc7jzhunU3KRkkIFq3wC8rh4ABR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DhN5iU45; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DhN5iU45"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764697605; x=1796233605;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QR+nX1vUDuUgHEr4fO4w4uZIdz4kvFsTOxHBWTMXFHs=;
  b=DhN5iU45FPjYWlC4A2wmJSnL91Bdezj2Lhwwq39ZG1M3mOnwVeaWus69
   hYuJdppMOatbbX/xURA3iExf48F0JH7t0Kg/GTWMwr0YwqujlU3kTrbo/
   3/KzJR7c1f//U73guD2A3SZwzDlSEjxINEWcaymJ362gyL1/uA7zhqFB8
   5VYbZOXnYdRZk+9pg5S5yTCOszUmMA6WXQ6JnNNjB8206J2axlGo8Gy1x
   XGBCrAUJCjU+M7OFVFr7U3K4/qKJl+V4Kw95m5wyHfr8ZgudyreaDHemt
   NB89JklALymStROYJrYNQCv7dehvGlE0YPxHzbBBX2q3zm5sfwZzleNLk
   g==;
X-CSE-ConnectionGUID: 5yplsMUvT0GY7L3uT/609g==
X-CSE-MsgGUID: zETHE7fjRpiU5kzFVc+9KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66565430"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="66565430"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 09:46:44 -0800
X-CSE-ConnectionGUID: RFSsJlnjRUWz7YfZGkCuVw==
X-CSE-MsgGUID: yqFqrU/xStyoOIZTFvwGVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="198618526"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 02 Dec 2025 09:46:44 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQUSX-00000000A4b-2RlW;
	Tue, 02 Dec 2025 17:46:41 +0000
Date: Wed, 3 Dec 2025 01:45:45 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:renesas-lts/v6.18.0-2025-12-01-x5h-ironhide 22/36]
 drivers/mailbox/mailbox.c:416:9: error: cleanup argument not a function
Message-ID: <202512030133.BoJjjowI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux renesas-lts/v6.18.0-2025-12-01-x5h-ironhide
head:   bac3dde4cf6e6a52813b70720d6fbd385a9cb4c0
commit: a38f29304a2545aeef3d38033e6a76fea04178d4 [22/36] mailbox: add new {fw/of}_xlate_with_name()
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251203/202512030133.BoJjjowI-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512030133.BoJjjowI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512030133.BoJjjowI-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mailbox/mailbox.c: In function 'mbox_request_channel':
>> drivers/mailbox/mailbox.c:416:9: error: cleanup argument not a function
     416 |         const char **mbox_name_array __free(kfree) = kcalloc(index + 1, sizeof(char *), GFP_KERNEL);
         |         ^~~~~
   drivers/mailbox/mailbox.c:416:54: error: implicit declaration of function 'kcalloc' [-Wimplicit-function-declaration]
     416 |         const char **mbox_name_array __free(kfree) = kcalloc(index + 1, sizeof(char *), GFP_KERNEL);
         |                                                      ^~~~~~~
>> drivers/mailbox/mailbox.c:416:54: error: initialization of 'const char **' from 'int' makes pointer from integer without a cast [-Wint-conversion]


vim +416 drivers/mailbox/mailbox.c

   367	
   368	/**
   369	 * mbox_request_channel - Request a mailbox channel.
   370	 * @cl: Identity of the client requesting the channel.
   371	 * @index: Index of mailbox specifier in 'mboxes' property.
   372	 *
   373	 * The Client specifies its requirements and capabilities while asking for
   374	 * a mailbox channel. It can't be called from atomic context.
   375	 * The channel is exclusively allocated and can't be used by another
   376	 * client before the owner calls mbox_free_channel.
   377	 * After assignment, any packet received on this channel will be
   378	 * handed over to the client via the 'rx_callback'.
   379	 * The framework holds reference to the client, so the mbox_client
   380	 * structure shouldn't be modified until the mbox_free_channel returns.
   381	 *
   382	 * Return: Pointer to the channel assigned to the client if successful.
   383	 *		ERR_PTR for request failure.
   384	 */
   385	struct mbox_chan *mbox_request_channel(struct mbox_client *cl, int index)
   386	{
   387		struct fwnode_reference_args fwspec;
   388		struct fwnode_handle *fwnode;
   389		struct mbox_controller *mbox;
   390		struct of_phandle_args spec;
   391		struct mbox_chan *chan;
   392		struct device *dev;
   393		const char *mbox_name;
   394		unsigned int i;
   395		int ret;
   396	
   397		dev = cl->dev;
   398		if (!dev) {
   399			pr_debug("No owner device\n");
   400			return ERR_PTR(-ENODEV);
   401		}
   402	
   403		fwnode = dev_fwnode(dev);
   404		if (!fwnode) {
   405			dev_dbg(dev, "No owner fwnode\n");
   406			return ERR_PTR(-ENODEV);
   407		}
   408	
   409		ret = fwnode_property_get_reference_args(fwnode, "mboxes", "#mbox-cells",
   410							 0, index, &fwspec);
   411		if (ret) {
   412			dev_err(dev, "%s: can't parse \"%s\" property\n", __func__, "mboxes");
   413			return ERR_PTR(ret);
   414		}
   415	
 > 416		const char **mbox_name_array __free(kfree) = kcalloc(index + 1, sizeof(char *), GFP_KERNEL);
   417		if (!mbox_name_array)
   418			return ERR_PTR(-ENOMEM);
   419	
   420		mbox_name = NULL;
   421		ret = fwnode_property_read_string_array(fwnode, "mbox-names", mbox_name_array, index + 1);
   422		if (ret > 0)
   423			mbox_name = mbox_name_array[index];
   424	
   425		spec.np = to_of_node(fwspec.fwnode);
   426		spec.args_count = fwspec.nargs;
   427		for (i = 0; i < spec.args_count; i++)
   428			spec.args[i] = fwspec.args[i];
   429	
   430		scoped_guard(mutex, &con_mutex) {
   431			chan = ERR_PTR(-EPROBE_DEFER);
   432			list_for_each_entry(mbox, &mbox_cons, node) {
   433				if (device_match_fwnode(mbox->dev, fwspec.fwnode)) {
   434					if (mbox_name && mbox->fw_xlate_with_name)
   435						chan = mbox->fw_xlate_with_name(mbox, &fwspec, mbox_name);
   436					else if (mbox->fw_xlate)
   437						chan = mbox->fw_xlate(mbox, &fwspec);
   438					else if (mbox_name && mbox->of_xlate_with_name)
   439						chan = mbox->of_xlate_with_name(mbox, &spec, mbox_name);
   440					else if (mbox->of_xlate)
   441						chan = mbox->of_xlate(mbox, &spec);
   442	
   443					if (!IS_ERR(chan))
   444						break;
   445				}
   446			}
   447	
   448			fwnode_handle_put(fwspec.fwnode);
   449	
   450			if (IS_ERR(chan))
   451				return chan;
   452	
   453			ret = __mbox_bind_client(chan, cl);
   454			if (ret)
   455				chan = ERR_PTR(ret);
   456		}
   457	
   458		return chan;
   459	}
   460	EXPORT_SYMBOL_GPL(mbox_request_channel);
   461	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
