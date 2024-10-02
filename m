Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD18D1581E5
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 07:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727854461; cv=none; b=aj5CMxFWHenfQmUEefQfkzRMf1qa862eOLovRCPBbrq5OeTeA6VN69TJh2TQ58S88gWzFD0wQPQEoIMdx9Kje/qaHQwjKg37Jt8BEDtBLSLN8cs82K3V+WJlfQPmNkL98knIf0cjsBfWjMCKQZZYCij7RCy37EiY+HTPl7ackSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727854461; c=relaxed/simple;
	bh=JklziZqzhQJDe6Yhfq9+mN8LH32kG6EjmYRo/UIXxBE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=as0fWMqK31X1RBKLXwozVLfhaCV6P7AVnfjNNweuLr4jFu6gfKNIVl6yCyZ2zxHMbXIofwP310g2FoCS5xXTixE3uD5UdM+tskL1AAmPU1kx85DtWZNMueO1JmhZzbn1QDhd8O+Q3nSGXq3zR2bb/yRk8walj1KJmNOFixfKqkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=GqRajchA; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="GqRajchA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:subject:message-id:mime-version;
  bh=piatYEBh5yzfYu/BXvVrh0kozS3xnWQRkGBXVpU+0/E=;
  b=GqRajchAitxbhsYvaRqatAuD8nWUKmwtcEvRKiMFqwxWPfOaW+NiqPtI
   rq2I4xOp1/ylXD8VdK3BsYKFlGUdgI+XXNDWFY18HCfTPFWJS0L9b7ZId
   oefdkxd9Fe/zDKogNBKooNrJK5GBW84A3/TZm16oDgUrhrrlBOjMrt2jn
   k=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.11,170,1725314400"; 
   d="scan'208";a="186410222"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 09:34:10 +0200
Date: Wed, 2 Oct 2024 09:34:09 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Asahi Lina <lina@asahilina.net>, Janne Grunau <j@jannau.net>, 
    oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/240-isp 22/52] drivers/media/platform/apple/isp/isp-drv.c:183:1-23:
 WARNING: Function "for_each_child_of_node" should have of_node_put() before
 goto around lines 197. (fwd)
Message-ID: <9e433f24-c9e5-6d28-4a77-8d6014a8301@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Please check whether lines 197 and 201 need of_node_put.  Maybe you can
alternatively use for_each_child_of_node_scoped.

julia

---------- Forwarded message ----------
Date: Wed, 2 Oct 2024 13:55:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [asahilinux:bits/240-isp 22/52]
    drivers/media/platform/apple/isp/isp-drv.c:183:1-23: WARNING: Function
    "for_each_child_of_node" should have of_node_put() before goto around lines
    197.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Asahi Lina <lina@asahilina.net>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/240-isp
head:   2eb812826ec58e3b803055a8aa0fd857f1675f14
commit: b4d2b4922ce8a77666206a64314192e08c1aca0a [22/52] media: apple: isp: Working t602x and multiple formats and more fixes
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: arc-randconfig-r062-20241002 (https://download.01.org/0day-ci/archive/20241002/202410021337.EQ74x7c7-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410021337.EQ74x7c7-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/media/platform/apple/isp/isp-drv.c:183:1-23: WARNING: Function "for_each_child_of_node" should have of_node_put() before goto around lines 197.
   drivers/media/platform/apple/isp/isp-drv.c:183:1-23: WARNING: Function "for_each_child_of_node" should have of_node_put() before goto around lines 201.

vim +/for_each_child_of_node +183 drivers/media/platform/apple/isp/isp-drv.c

b4d2b4922ce8a7 Asahi Lina 2023-09-24  154
b4d2b4922ce8a7 Asahi Lina 2023-09-24  155  static int apple_isp_init_presets(struct apple_isp *isp)
b4d2b4922ce8a7 Asahi Lina 2023-09-24  156  {
b4d2b4922ce8a7 Asahi Lina 2023-09-24  157  	struct device *dev = isp->dev;
b4d2b4922ce8a7 Asahi Lina 2023-09-24  158  	struct device_node *np, *child;
b4d2b4922ce8a7 Asahi Lina 2023-09-24  159  	struct isp_preset *preset;
b4d2b4922ce8a7 Asahi Lina 2023-09-24  160  	int err = 0;
b4d2b4922ce8a7 Asahi Lina 2023-09-24  161
b4d2b4922ce8a7 Asahi Lina 2023-09-24  162  	np = of_get_child_by_name(dev->of_node, "sensor-presets");
b4d2b4922ce8a7 Asahi Lina 2023-09-24  163  	if (!np) {
b4d2b4922ce8a7 Asahi Lina 2023-09-24  164  		dev_err(dev, "failed to get DT node 'presets'\n");
b4d2b4922ce8a7 Asahi Lina 2023-09-24  165  		return -EINVAL;
b4d2b4922ce8a7 Asahi Lina 2023-09-24  166  	}
b4d2b4922ce8a7 Asahi Lina 2023-09-24  167
b4d2b4922ce8a7 Asahi Lina 2023-09-24  168  	isp->num_presets = of_get_child_count(np);
b4d2b4922ce8a7 Asahi Lina 2023-09-24  169  	if (!isp->num_presets) {
b4d2b4922ce8a7 Asahi Lina 2023-09-24  170  		dev_err(dev, "no sensor presets found\n");
b4d2b4922ce8a7 Asahi Lina 2023-09-24  171  		err = -EINVAL;
b4d2b4922ce8a7 Asahi Lina 2023-09-24  172  		goto err;
b4d2b4922ce8a7 Asahi Lina 2023-09-24  173  	}
b4d2b4922ce8a7 Asahi Lina 2023-09-24  174
b4d2b4922ce8a7 Asahi Lina 2023-09-24  175  	isp->presets = devm_kzalloc(
b4d2b4922ce8a7 Asahi Lina 2023-09-24  176  		dev, sizeof(*isp->presets) * isp->num_presets, GFP_KERNEL);
b4d2b4922ce8a7 Asahi Lina 2023-09-24  177  	if (!isp->presets) {
b4d2b4922ce8a7 Asahi Lina 2023-09-24  178  		err = -ENOMEM;
b4d2b4922ce8a7 Asahi Lina 2023-09-24  179  		goto err;
b4d2b4922ce8a7 Asahi Lina 2023-09-24  180  	}
b4d2b4922ce8a7 Asahi Lina 2023-09-24  181
b4d2b4922ce8a7 Asahi Lina 2023-09-24  182  	preset = isp->presets;
b4d2b4922ce8a7 Asahi Lina 2023-09-24 @183  	for_each_child_of_node(np, child) {
b4d2b4922ce8a7 Asahi Lina 2023-09-24  184  		u32 xywh[4];
b4d2b4922ce8a7 Asahi Lina 2023-09-24  185
b4d2b4922ce8a7 Asahi Lina 2023-09-24  186  		err = of_property_read_u32(child, "apple,config-index",
b4d2b4922ce8a7 Asahi Lina 2023-09-24  187  					   &preset->index);
b4d2b4922ce8a7 Asahi Lina 2023-09-24  188  		if (err) {
b4d2b4922ce8a7 Asahi Lina 2023-09-24  189  			dev_err(dev, "no apple,config-index property\n");
b4d2b4922ce8a7 Asahi Lina 2023-09-24  190  			of_node_put(child);
b4d2b4922ce8a7 Asahi Lina 2023-09-24  191  			goto err;
b4d2b4922ce8a7 Asahi Lina 2023-09-24  192  		}
b4d2b4922ce8a7 Asahi Lina 2023-09-24  193
b4d2b4922ce8a7 Asahi Lina 2023-09-24  194  		err = isp_of_read_coord(dev, child, "apple,input-size",
b4d2b4922ce8a7 Asahi Lina 2023-09-24  195  					&preset->input_dim);
b4d2b4922ce8a7 Asahi Lina 2023-09-24  196  		if (err)
b4d2b4922ce8a7 Asahi Lina 2023-09-24  197  			goto err;
b4d2b4922ce8a7 Asahi Lina 2023-09-24  198  		err = isp_of_read_coord(dev, child, "apple,output-size",
b4d2b4922ce8a7 Asahi Lina 2023-09-24  199  					&preset->output_dim);
b4d2b4922ce8a7 Asahi Lina 2023-09-24  200  		if (err)
b4d2b4922ce8a7 Asahi Lina 2023-09-24  201  			goto err;
b4d2b4922ce8a7 Asahi Lina 2023-09-24  202
b4d2b4922ce8a7 Asahi Lina 2023-09-24  203  		err = of_property_read_u32_array(child, "apple,crop", xywh, 4);
b4d2b4922ce8a7 Asahi Lina 2023-09-24  204  		if (err) {
b4d2b4922ce8a7 Asahi Lina 2023-09-24  205  			dev_err(dev, "failed to read 'apple,crop' property\n");
b4d2b4922ce8a7 Asahi Lina 2023-09-24  206  			of_node_put(child);
b4d2b4922ce8a7 Asahi Lina 2023-09-24  207  			goto err;
b4d2b4922ce8a7 Asahi Lina 2023-09-24  208  		}
b4d2b4922ce8a7 Asahi Lina 2023-09-24  209  		preset->crop_offset.x = xywh[0];
b4d2b4922ce8a7 Asahi Lina 2023-09-24  210  		preset->crop_offset.y = xywh[1];
b4d2b4922ce8a7 Asahi Lina 2023-09-24  211  		preset->crop_size.x = xywh[2];
b4d2b4922ce8a7 Asahi Lina 2023-09-24  212  		preset->crop_size.y = xywh[3];
b4d2b4922ce8a7 Asahi Lina 2023-09-24  213
b4d2b4922ce8a7 Asahi Lina 2023-09-24  214  		preset++;
b4d2b4922ce8a7 Asahi Lina 2023-09-24  215  	}
b4d2b4922ce8a7 Asahi Lina 2023-09-24  216
b4d2b4922ce8a7 Asahi Lina 2023-09-24  217  err:
b4d2b4922ce8a7 Asahi Lina 2023-09-24  218  	of_node_put(np);
b4d2b4922ce8a7 Asahi Lina 2023-09-24  219  	return err;
b4d2b4922ce8a7 Asahi Lina 2023-09-24  220  }
b4d2b4922ce8a7 Asahi Lina 2023-09-24  221

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
