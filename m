Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D29C30B505
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Nov 2025 22:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763765342; cv=none; b=GMkKullA85QiVRDI4cS80oSDep97SIWVnHuJjWM9XA8M4hD7LzwvLMrKcmwXtvGVhIldDCwsMhOw9Sdtiy1hkpE8OmW4SX+ER3piy0iWRRNNe1n2zbmv12z8hLTIDirbBxu1bYEtFA1DZKKjmAGgVcelv6M3ewfkriZitq7GBjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763765342; c=relaxed/simple;
	bh=UgnUuHq2aS+gVEtgh/nhTebWa2EinounUYxTLRJHn9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CjBiRsnBYqTuzsOhWc+W51tu/yt6GXzcy8lfbC/A57d2D2eAoShCJG6uWQ6Gln1F257P4W6I4IcvXRm84OACaiYAas0P+r1mo2OtWo+q6vyQdoO61frj5osr0aeshUp0LWmYbckIDGUM+48gLcCZCZA6j9YANLJuIYBqD6JUe/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G0SdAYIV; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G0SdAYIV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763765340; x=1795301340;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UgnUuHq2aS+gVEtgh/nhTebWa2EinounUYxTLRJHn9Q=;
  b=G0SdAYIV7xKAJWcIiYdNqCHxjVbGX0FH12mC2ExRkyI25V8GakvByydH
   gGz2KM7jwH1rmHHNBBhz8/i9JMt1AW3nTmxRERWstHutsIFmxUbbw20tP
   AXspjT2vES0KpuTaaLl5anC7TLr161p8TTqDz/nfvu674SaLBQOLGDaee
   fW3ZlcMpQHy1/nKjoKoYBx97OQTyY81GcEtWbiwH/gvSiu81vJ48vy4/s
   NetznPDEm9LMXhj7vgQm3qMeoqsanBdcZuQQ8ccLdxVVG14cmwZCIwgRp
   5SUwVH4OjfFtBbmm5o/7Vkr0gaq5f9ndBLDKSlxotUZC5N2QrI9N6zK4V
   w==;
X-CSE-ConnectionGUID: C1ONCxNkSealXeD/SFsKmQ==
X-CSE-MsgGUID: zMO9DV/OSu++YJZu87ZV0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65749121"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="65749121"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 14:48:53 -0800
X-CSE-ConnectionGUID: uaY+md88Q1aNsL+jL456Aw==
X-CSE-MsgGUID: ILA/ETOkQdWJkzVcfuLyLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="229105892"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 Nov 2025 14:48:51 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMZvt-0006w5-13;
	Fri, 21 Nov 2025 22:48:49 +0000
Date: Sat, 22 Nov 2025 06:48:03 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:renesas-lts/v6.18-rc6-2025-11-20-x5h-ironhide-2 41/41]
 drivers/mailbox/mailbox.c:417:27: error: implicit declaration of function
 'kcalloc'
Message-ID: <202511220645.7cecVAWH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux renesas-lts/v6.18-rc6-2025-11-20-x5h-ironhide-2
head:   2b4bb2b272501af9302a01713e7e35ec89d1297a
commit: 2b4bb2b272501af9302a01713e7e35ec89d1297a [41/41] mailbox: add new {fw/of}_xlate_with_name()
config: um-randconfig-r071-20251122 (https://download.01.org/0day-ci/archive/20251122/202511220645.7cecVAWH-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511220645.7cecVAWH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511220645.7cecVAWH-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mailbox/mailbox.c: In function 'mbox_request_channel':
>> drivers/mailbox/mailbox.c:417:27: error: implicit declaration of function 'kcalloc' [-Wimplicit-function-declaration]
     417 |         mbox_name_array = kcalloc(index + 1, sizeof(char*), GFP_KERNEL);
         |                           ^~~~~~~
>> drivers/mailbox/mailbox.c:417:25: error: assignment to 'const char **' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     417 |         mbox_name_array = kcalloc(index + 1, sizeof(char*), GFP_KERNEL);
         |                         ^
>> drivers/mailbox/mailbox.c:459:9: error: implicit declaration of function 'kfree' [-Wimplicit-function-declaration]
     459 |         kfree(mbox_name_array);
         |         ^~~~~


vim +/kcalloc +417 drivers/mailbox/mailbox.c

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
   393		const char **mbox_name_array;
   394		const char *mbox_name;
   395		unsigned int i;
   396		int ret;
   397	
   398		dev = cl->dev;
   399		if (!dev) {
   400			pr_debug("No owner device\n");
   401			return ERR_PTR(-ENODEV);
   402		}
   403	
   404		fwnode = dev_fwnode(dev);
   405		if (!fwnode) {
   406			dev_dbg(dev, "No owner fwnode\n");
   407			return ERR_PTR(-ENODEV);
   408		}
   409	
   410		ret = fwnode_property_get_reference_args(fwnode, "mboxes", "#mbox-cells",
   411							 0, index, &fwspec);
   412		if (ret) {
   413			dev_err(dev, "%s: can't parse \"%s\" property\n", __func__, "mboxes");
   414			return ERR_PTR(ret);
   415		}
   416	
 > 417		mbox_name_array = kcalloc(index + 1, sizeof(char*), GFP_KERNEL);
   418		if (!mbox_name_array)
   419			return ERR_PTR(-ENOMEM);
   420	
   421		mbox_name = NULL;
   422		ret = fwnode_property_read_string_array(fwnode, "mbox-names", mbox_name_array, index + 1);
   423		if (ret > 0)
   424			mbox_name = mbox_name_array[index];
   425	
   426		spec.np = to_of_node(fwspec.fwnode);
   427		spec.args_count = fwspec.nargs;
   428		for (i = 0; i < spec.args_count; i++)
   429			spec.args[i] = fwspec.args[i];
   430	
   431		scoped_guard(mutex, &con_mutex) {
   432			chan = ERR_PTR(-EPROBE_DEFER);
   433			list_for_each_entry(mbox, &mbox_cons, node) {
   434				if (device_match_fwnode(mbox->dev, fwspec.fwnode)) {
   435					if (mbox_name && mbox->fw_xlate_with_name)
   436						chan = mbox->fw_xlate_with_name(mbox, &fwspec, mbox_name);
   437					else if (mbox->fw_xlate)
   438						chan = mbox->fw_xlate(mbox, &fwspec);
   439					else if (mbox_name && mbox->of_xlate_with_name)
   440						chan = mbox->of_xlate_with_name(mbox, &spec, mbox_name);
   441					else if (mbox->of_xlate)
   442						chan = mbox->of_xlate(mbox, &spec);
   443	
   444					if (!IS_ERR(chan))
   445						break;
   446				}
   447			}
   448	
   449			fwnode_handle_put(fwspec.fwnode);
   450	
   451			if (IS_ERR(chan))
   452				goto end;
   453	
   454			ret = __mbox_bind_client(chan, cl);
   455			if (ret)
   456				chan = ERR_PTR(ret);
   457		}
   458	end:
 > 459		kfree(mbox_name_array);
   460	
   461		return chan;
   462	}
   463	EXPORT_SYMBOL_GPL(mbox_request_channel);
   464	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
