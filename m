Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA2281720
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 20:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727901477; cv=none; b=rbSD5cogh/0e0QygUZxHddbpZRdxEHYBI+zif48XVjuvVE9JsbKBRPUM/RZg73PSJ1QiPU6uzQkFZYXF4VbnH987r9Teqok3jIB3mGum+aaUE9SGBwpTJ7N1z/AuBI325XpZm8oeKxsh5Gi4XmW5t32W0xG4lHGR8fOOtzsD12g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727901477; c=relaxed/simple;
	bh=OC1TKx/pLeL5SACkmaMqmXKlXdZHJMdlNgq4YHLyvRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gMmXoJfPdMuJ+U+oYIgqHqbNFjeP2yoEPEcJD+m9Y/sFFJNBWHWxh+C58H2Enf/0trpkWa1YSmglako7l+AAyBM/+ch5+nMPPyOxt1IYy6+UAz2o28R5FL44UGMX0jica/TWdkS2QUg3pQ1xn1nuKtIh3a0AS4xjUISOeG1sfnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=b3nxqlI4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MWW0zH1z; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="b3nxqlI4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MWW0zH1z"
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id D4C3913800D3;
	Wed,  2 Oct 2024 16:37:53 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Wed, 02 Oct 2024 16:37:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1727901473; x=1727987873; bh=J9BLgsPfbK
	elFXbcU/fHxBJ3p+Z4AA7P5v3V137wO7c=; b=b3nxqlI4a0U9KR+YQ11AOL05aG
	a17Qptt5eRol1VkDUeUIQ7Wz04WJpvhrdFK1eWflexR3OgoPSTKDZVdQrqoPKwoy
	bK77MZcy+OlZSIYf30Gg4B+401geHCazE0MKKfcNbjMh46dRo3UBjb8Iaw79aAy7
	rg9mVxO34GOBGMB5pct9th5pdXfI4H8tGBypZNpkXnFleTZJuhyW21hHM7J2utJZ
	G0uXdfgc0ZXIKEOfrz7xtW+jz+3s101EjPzVxlS75XB3dh80QhR3+6IhJoFKxKVh
	b06BK2knQ4h+pNCg9sUsnYyLUOzEZ2tLyWnS+Fjo4HUKFRqW0hjsjwTaLMHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1727901473; x=1727987873; bh=J9BLgsPfbKelFXbcU/fHxBJ3p+Z4
	AA7P5v3V137wO7c=; b=MWW0zH1zXsVjW0qb6VxXCYtcMZfTb9a0TP3bHbwsWnYm
	eCmRx03oSTr3OY3FaA1c/LOnnDAwlpPHZ4EkXJg/nXaJJgjdoGcHxBk3ine9zFLK
	465MSXA9cTiQW8ql3fKzaBbHpDL7dOrcbr/QVLl8iM7bEdfF4jgp0h55jJTEd4Ee
	qss/cQ0kCIRHA4DF6R2P0jwLvRVjCQ9B6qN1mhOI6RLfDZXAbzIIzzLMENTHt+dD
	kPGUtXmarH0lMjkfsV7rtMlTNN/STbl/usQDNi0OGwV1+zsPAI7/wXKQbrIpOFK5
	Y+cZcVv5cm5ea6+3DVIbdMKgGPf81cP3PN9Ka7v5Nw==
X-ME-Sender: <xms:Ia_9Zm_Xq6u_GVOveQyUPJ70xQQk20WdWK7ZnvMlylWUkyNELpxMwg>
    <xme:Ia_9ZmuQAqAPGiz2wd-K3vZuUGH0p3slGtsSJ1-jQkvMhR_VUlqCg_s7ttEAniGzG
    IUh0-7atZaLiq1sVac>
X-ME-Received: <xmr:Ia_9ZsD321JgyMMtH-Mydx-w0whjmz7ixB4e9bv04FmuXLOqXmY6BG4W5pyvmZlr8ASj9-cG18OFqL5HHGJJc0yBoZ7k_zT1xhY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdduledgudegkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttdej
    necuhfhrohhmpeflrghnnhgvucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqne
    cuggftrfgrthhtvghrnhepgeevffeltefhteeuvdefjeelvdetjeetteehheeiiefhheeh
    hffgtedvffeujeefnecuffhomhgrihhnpehgihhthhhusgdrtghomhdptddurdhorhhgpd
    hkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehjsehjrghnnhgruhdrnhgvthdpnhgspghrtghpthhtohepfedpmhhoug
    gvpehsmhhtphhouhhtpdhrtghpthhtohepjhhulhhirgdrlhgrfigrlhhlsehinhhrihgr
    rdhfrhdprhgtphhtthhopehlihhnrgesrghsrghhihhlihhnrgdrnhgvthdprhgtphhtth
    hopehovgdqkhgsuhhilhguqdgrlhhlsehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:Ia_9ZudoIhJLDVs_lVk08umZliONVri9maM8QM4Sdv2jYcvqwZcPZw>
    <xmx:Ia_9ZrP4HeYfSPPSnDEgJ8pmW6cYKdg718m_qG2FCYZA6zZ41Bvn_w>
    <xmx:Ia_9ZolSHuhimtWA4G7yWt9tfC6vWWqEz4SzNySPZJxu6elfb1XMqA>
    <xmx:Ia_9ZtvL-WnC4Rt2pzpj7Zj6tlW1mKyEhc6IYsx7EqIEG_MW_Z_AFA>
    <xmx:Ia_9ZkogoaufZnUTtYCfDZJs9qm5J8QbqGOFvIG0fIKAx_mxCjaVXm1q>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Oct 2024 16:37:52 -0400 (EDT)
Date: Wed, 2 Oct 2024 22:37:51 +0200
From: Janne Grunau <j@jannau.net>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Asahi Lina <lina@asahilina.net>, oe-kbuild-all@lists.linux.dev
Subject: Re: [asahilinux:bits/240-isp 22/52]
 drivers/media/platform/apple/isp/isp-drv.c:183:1-23: WARNING: Function
 "for_each_child_of_node" should have of_node_put() before goto around lines
 197. (fwd)
Message-ID: <Zv2vHxEpumLBorr5@robin>
References: <9e433f24-c9e5-6d28-4a77-8d6014a8301@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9e433f24-c9e5-6d28-4a77-8d6014a8301@inria.fr>

Hej,

On Wed, Oct 02, 2024 at 09:34:09AM +0200, Julia Lawall wrote:
> Please check whether lines 197 and 201 need of_node_put.  Maybe you can
> alternatively use for_each_child_of_node_scoped.

These were false positives since the called function isp_of_read_coord()
calls of_node_put(). It was documented but is still surprising /
unorthodox. I've replaced the loop with for_each_child_of_node_scoped
anyway and added __free(device_node) cleanup for np to  avoid the goto.

Thanks for the report. Despite being a false positive it still pointed
to code which was more complicated than it needs to be now.

Janne
> 
> ---------- Forwarded message ----------
> Date: Wed, 2 Oct 2024 13:55:07 +0800
> From: kernel test robot <lkp@intel.com>
> To: oe-kbuild@lists.linux.dev
> Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
> Subject: [asahilinux:bits/240-isp 22/52]
>     drivers/media/platform/apple/isp/isp-drv.c:183:1-23: WARNING: Function
>     "for_each_child_of_node" should have of_node_put() before goto around lines
>     197.
> 
> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> TO: Asahi Lina <lina@asahilina.net>
> CC: Janne Grunau <j@jannau.net>
> 
> tree:   https://github.com/AsahiLinux/linux bits/240-isp
> head:   2eb812826ec58e3b803055a8aa0fd857f1675f14
> commit: b4d2b4922ce8a77666206a64314192e08c1aca0a [22/52] media: apple: isp: Working t602x and multiple formats and more fixes
> :::::: branch date: 2 weeks ago
> :::::: commit date: 2 weeks ago
> config: arc-randconfig-r062-20241002 (https://download.01.org/0day-ci/archive/20241002/202410021337.EQ74x7c7-lkp@intel.com/config)
> compiler: arc-elf-gcc (GCC) 13.2.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Julia Lawall <julia.lawall@inria.fr>
> | Closes: https://lore.kernel.org/r/202410021337.EQ74x7c7-lkp@intel.com/
> 
> cocci warnings: (new ones prefixed by >>)
> >> drivers/media/platform/apple/isp/isp-drv.c:183:1-23: WARNING: Function "for_each_child_of_node" should have of_node_put() before goto around lines 197.
>    drivers/media/platform/apple/isp/isp-drv.c:183:1-23: WARNING: Function "for_each_child_of_node" should have of_node_put() before goto around lines 201.
> 
> vim +/for_each_child_of_node +183 drivers/media/platform/apple/isp/isp-drv.c
> 
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  154
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  155  static int apple_isp_init_presets(struct apple_isp *isp)
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  156  {
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  157  	struct device *dev = isp->dev;
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  158  	struct device_node *np, *child;
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  159  	struct isp_preset *preset;
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  160  	int err = 0;
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  161
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  162  	np = of_get_child_by_name(dev->of_node, "sensor-presets");
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  163  	if (!np) {
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  164  		dev_err(dev, "failed to get DT node 'presets'\n");
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  165  		return -EINVAL;
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  166  	}
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  167
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  168  	isp->num_presets = of_get_child_count(np);
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  169  	if (!isp->num_presets) {
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  170  		dev_err(dev, "no sensor presets found\n");
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  171  		err = -EINVAL;
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  172  		goto err;
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  173  	}
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  174
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  175  	isp->presets = devm_kzalloc(
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  176  		dev, sizeof(*isp->presets) * isp->num_presets, GFP_KERNEL);
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  177  	if (!isp->presets) {
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  178  		err = -ENOMEM;
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  179  		goto err;
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  180  	}
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  181
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  182  	preset = isp->presets;
> b4d2b4922ce8a7 Asahi Lina 2023-09-24 @183  	for_each_child_of_node(np, child) {
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  184  		u32 xywh[4];
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  185
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  186  		err = of_property_read_u32(child, "apple,config-index",
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  187  					   &preset->index);
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  188  		if (err) {
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  189  			dev_err(dev, "no apple,config-index property\n");
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  190  			of_node_put(child);
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  191  			goto err;
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  192  		}
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  193
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  194  		err = isp_of_read_coord(dev, child, "apple,input-size",
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  195  					&preset->input_dim);
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  196  		if (err)
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  197  			goto err;
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  198  		err = isp_of_read_coord(dev, child, "apple,output-size",
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  199  					&preset->output_dim);
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  200  		if (err)
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  201  			goto err;
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  202
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  203  		err = of_property_read_u32_array(child, "apple,crop", xywh, 4);
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  204  		if (err) {
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  205  			dev_err(dev, "failed to read 'apple,crop' property\n");
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  206  			of_node_put(child);
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  207  			goto err;
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  208  		}
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  209  		preset->crop_offset.x = xywh[0];
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  210  		preset->crop_offset.y = xywh[1];
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  211  		preset->crop_size.x = xywh[2];
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  212  		preset->crop_size.y = xywh[3];
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  213
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  214  		preset++;
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  215  	}
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  216
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  217  err:
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  218  	of_node_put(np);
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  219  	return err;
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  220  }
> b4d2b4922ce8a7 Asahi Lina 2023-09-24  221
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
