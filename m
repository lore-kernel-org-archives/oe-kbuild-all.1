Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFAC1D0E3F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 20:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727901827; cv=none; b=nEymHN9sd47DWR2La84V2ZvwlyQBpT+rnOC2MMoardjfHnX55rssdBhMjrd9njgCIKv/DFBjABz9hejuh1o/Mwi9cF9jg0ZaD/qPqvdfOVZjESb1jhL/PXo8ye7h6RV+nq/e6zBInmYrOGO9SLTP9U1LS7F7WfEeM66n5d1/dNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727901827; c=relaxed/simple;
	bh=CEFdYQh8ulvtm/NOYb3dtX/yBbmlOJER8yQJgrrWdgs=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=sHHN8jO2UNfVh2GnLE1DSBz1j30YdkqtVAn12qFa38RPRSg/xdZnLKtsFQSUzXaya+4zHGXtM61iDg2E6Shx734oDbPtJRh8J7zenBqo3jVi9c8ObsoSNf9azOaQzq4eVuxq6s7glR6INOtNMse6buR/Q+JXumjh0pF+YVvNBVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=ny0LT2TI; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="ny0LT2TI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Wzd47quin4k3CRpowkZ7Mmnm4/c3m3HLT2PXIMwdKSc=;
  b=ny0LT2TIm+YVIVRCqd8Vw8jnR+d3vulr87LrjpvYzgkoZ8W4ypIcQgua
   QB65t7vRIyWmYMs8zR/V27iJFBBT6xaQhBM9Nqnl6navl56LdEG6bgew1
   8x5aXQP1DMi9u9BY1t+vFIRAZqF78bR1AigxaViot2jq3nMMSpSjRe0Eg
   M=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.11,172,1725314400"; 
   d="scan'208";a="186605521"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 22:43:41 +0200
Date: Wed, 2 Oct 2024 22:43:41 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Janne Grunau <j@jannau.net>
cc: Asahi Lina <lina@asahilina.net>, oe-kbuild-all@lists.linux.dev
Subject: Re: [asahilinux:bits/240-isp 22/52] drivers/media/platform/apple/isp/isp-drv.c:183:1-23:
 WARNING: Function "for_each_child_of_node" should have of_node_put() before
 goto around lines 197. (fwd)
In-Reply-To: <Zv2vHxEpumLBorr5@robin>
Message-ID: <alpine.DEB.2.22.394.2410022242480.3571@hadrien>
References: <9e433f24-c9e5-6d28-4a77-8d6014a8301@inria.fr> <Zv2vHxEpumLBorr5@robin>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Wed, 2 Oct 2024, Janne Grunau wrote:

> Hej,
>
> On Wed, Oct 02, 2024 at 09:34:09AM +0200, Julia Lawall wrote:
> > Please check whether lines 197 and 201 need of_node_put.  Maybe you can
> > alternatively use for_each_child_of_node_scoped.
>
> These were false positives since the called function isp_of_read_coord()
> calls of_node_put(). It was documented but is still surprising /
> unorthodox. I've replaced the loop with for_each_child_of_node_scoped
> anyway and added __free(device_node) cleanup for np to  avoid the goto.
>
> Thanks for the report. Despite being a false positive it still pointed
> to code which was more complicated than it needs to be now.

Thanks for the feedback.

julia

>
> Janne
> >
> > ---------- Forwarded message ----------
> > Date: Wed, 2 Oct 2024 13:55:07 +0800
> > From: kernel test robot <lkp@intel.com>
> > To: oe-kbuild@lists.linux.dev
> > Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
> > Subject: [asahilinux:bits/240-isp 22/52]
> >     drivers/media/platform/apple/isp/isp-drv.c:183:1-23: WARNING: Function
> >     "for_each_child_of_node" should have of_node_put() before goto around lines
> >     197.
> >
> > BCC: lkp@intel.com
> > CC: oe-kbuild-all@lists.linux.dev
> > TO: Asahi Lina <lina@asahilina.net>
> > CC: Janne Grunau <j@jannau.net>
> >
> > tree:   https://github.com/AsahiLinux/linux bits/240-isp
> > head:   2eb812826ec58e3b803055a8aa0fd857f1675f14
> > commit: b4d2b4922ce8a77666206a64314192e08c1aca0a [22/52] media: apple: isp: Working t602x and multiple formats and more fixes
> > :::::: branch date: 2 weeks ago
> > :::::: commit date: 2 weeks ago
> > config: arc-randconfig-r062-20241002 (https://download.01.org/0day-ci/archive/20241002/202410021337.EQ74x7c7-lkp@intel.com/config)
> > compiler: arc-elf-gcc (GCC) 13.2.0
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Julia Lawall <julia.lawall@inria.fr>
> > | Closes: https://lore.kernel.org/r/202410021337.EQ74x7c7-lkp@intel.com/
> >
> > cocci warnings: (new ones prefixed by >>)
> > >> drivers/media/platform/apple/isp/isp-drv.c:183:1-23: WARNING: Function "for_each_child_of_node" should have of_node_put() before goto around lines 197.
> >    drivers/media/platform/apple/isp/isp-drv.c:183:1-23: WARNING: Function "for_each_child_of_node" should have of_node_put() before goto around lines 201.
> >
> > vim +/for_each_child_of_node +183 drivers/media/platform/apple/isp/isp-drv.c
> >
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  154
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  155  static int apple_isp_init_presets(struct apple_isp *isp)
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  156  {
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  157  	struct device *dev = isp->dev;
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  158  	struct device_node *np, *child;
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  159  	struct isp_preset *preset;
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  160  	int err = 0;
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  161
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  162  	np = of_get_child_by_name(dev->of_node, "sensor-presets");
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  163  	if (!np) {
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  164  		dev_err(dev, "failed to get DT node 'presets'\n");
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  165  		return -EINVAL;
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  166  	}
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  167
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  168  	isp->num_presets = of_get_child_count(np);
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  169  	if (!isp->num_presets) {
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  170  		dev_err(dev, "no sensor presets found\n");
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  171  		err = -EINVAL;
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  172  		goto err;
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  173  	}
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  174
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  175  	isp->presets = devm_kzalloc(
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  176  		dev, sizeof(*isp->presets) * isp->num_presets, GFP_KERNEL);
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  177  	if (!isp->presets) {
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  178  		err = -ENOMEM;
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  179  		goto err;
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  180  	}
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  181
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  182  	preset = isp->presets;
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24 @183  	for_each_child_of_node(np, child) {
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  184  		u32 xywh[4];
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  185
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  186  		err = of_property_read_u32(child, "apple,config-index",
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  187  					   &preset->index);
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  188  		if (err) {
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  189  			dev_err(dev, "no apple,config-index property\n");
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  190  			of_node_put(child);
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  191  			goto err;
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  192  		}
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  193
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  194  		err = isp_of_read_coord(dev, child, "apple,input-size",
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  195  					&preset->input_dim);
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  196  		if (err)
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  197  			goto err;
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  198  		err = isp_of_read_coord(dev, child, "apple,output-size",
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  199  					&preset->output_dim);
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  200  		if (err)
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  201  			goto err;
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  202
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  203  		err = of_property_read_u32_array(child, "apple,crop", xywh, 4);
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  204  		if (err) {
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  205  			dev_err(dev, "failed to read 'apple,crop' property\n");
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  206  			of_node_put(child);
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  207  			goto err;
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  208  		}
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  209  		preset->crop_offset.x = xywh[0];
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  210  		preset->crop_offset.y = xywh[1];
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  211  		preset->crop_size.x = xywh[2];
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  212  		preset->crop_size.y = xywh[3];
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  213
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  214  		preset++;
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  215  	}
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  216
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  217  err:
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  218  	of_node_put(np);
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  219  	return err;
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  220  }
> > b4d2b4922ce8a7 Asahi Lina 2023-09-24  221
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
>
