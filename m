Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC5D1FCD09
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Feb 2025 12:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739796329; cv=none; b=PdxdNi+j3gax4ah7I8ldryLU3ZGuSa7I65MLlyjegFBwPlnMK/bwSFiZKmv1WkpP2zm88ngQD9vU3w+3I3wZLZod/X9nnvuOHF3Rek2+ctRyMSM3kZO5+AJD0dB3rcRfdzpPBqArmEjSDPTWRCVQblWxmTB0jyFNAnxnXM8aqlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739796329; c=relaxed/simple;
	bh=JLCthkDiujhJWvaZO4mfOYy+exv3O43V+pwlShIwWyQ=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=LV35Gxackd26SVbEN7aOsDOYJBOlzZoQ5ux5159XJwyVAypWDIoqhWHgt83ztr9RgA2XVokPlEDh4BMbTxZ46uIFaUM78zGbim7GQBQOsR5YQ+UC03GjLLasHmz8dlL1RLCWh9UBGQTqVK9wVcYV7vm0MLv18q/HFzH/OxeB+Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=MpUxES5l; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="MpUxES5l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R7KZ3Z3RVh09CVwO6uMl2Psc8lQKM6wS6pkVXMO9YJk=;
  b=MpUxES5lQA4sBXb0q2T5B+5tPst4JCHkexuF2NT6HqFOOEU6J+O3mwlO
   jt+QIJajKoPplw1jgCn0IMnck4A6y8+Jcpj9bJt0u/FZEntRdiqTwjOQC
   tFRH+XwN5bkjvjy5rX0LPenTMoZbTrnk1ay1xdXURztWUvYzfBcMxhUUH
   U=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.13,292,1732575600"; 
   d="scan'208";a="109307503"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 13:44:14 +0100
Date: Mon, 17 Feb 2025 13:44:13 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: David Lechner <dlechner@baylibre.com>
cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
    Nuno Sa <nuno.sa@analog.com>, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 2779/4577] drivers/spi/spi-offload.c:127:9-17:
 ERROR: reference preceded by free on line 126 (fwd)
Message-ID: <ddd17670-106b-a491-2bb0-658ce193a9a@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

See line 126.

julia

---------- Forwarded message ----------
Date: Mon, 17 Feb 2025 19:37:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 2779/4577] drivers/spi/spi-offload.c:127:9-17:
    ERROR: reference preceded by free on line 126

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: David Lechner <dlechner@baylibre.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Nuno Sa <nuno.sa@analog.com>

Hi David,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   253c82b3a2cec22bf9db65645f934fbe095899a3
commit: f09f140e3ea8f4c1b2990cdd72848f4083388ad8 [2779/4577] iio: adc: ad4695: Add support for SPI offload
:::::: branch date: 4 hours ago
:::::: commit date: 6 days ago
config: xtensa-randconfig-r062-20250217 (https://download.01.org/0day-ci/archive/20250217/202502171956.DsCx3n8E-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202502171956.DsCx3n8E-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/spi/spi-offload.c:127:9-17: ERROR: reference preceded by free on line 126
--
>> drivers/spi/spi-offload.c:181:15-22: ERROR: invalid reference to the index variable of the iterator on line 169

vim +127 drivers/spi/spi-offload.c

8e02d188698851 David Lechner 2025-02-07   93
8e02d188698851 David Lechner 2025-02-07   94  /**
8e02d188698851 David Lechner 2025-02-07   95   * devm_spi_offload_get() - Get an offload instance
8e02d188698851 David Lechner 2025-02-07   96   * @dev: Device for devm purposes
8e02d188698851 David Lechner 2025-02-07   97   * @spi: SPI device to use for the transfers
8e02d188698851 David Lechner 2025-02-07   98   * @config: Offload configuration
8e02d188698851 David Lechner 2025-02-07   99   *
8e02d188698851 David Lechner 2025-02-07  100   * Peripheral drivers call this function to get an offload instance that meets
8e02d188698851 David Lechner 2025-02-07  101   * the requirements specified in @config. If no suitable offload instance is
8e02d188698851 David Lechner 2025-02-07  102   * available, -ENODEV is returned.
8e02d188698851 David Lechner 2025-02-07  103   *
8e02d188698851 David Lechner 2025-02-07  104   * Return: Offload instance or error on failure.
8e02d188698851 David Lechner 2025-02-07  105   */
8e02d188698851 David Lechner 2025-02-07  106  struct spi_offload *devm_spi_offload_get(struct device *dev,
8e02d188698851 David Lechner 2025-02-07  107  					 struct spi_device *spi,
8e02d188698851 David Lechner 2025-02-07  108  					 const struct spi_offload_config *config)
8e02d188698851 David Lechner 2025-02-07  109  {
8e02d188698851 David Lechner 2025-02-07  110  	struct spi_controller_and_offload *resource;
8e02d188698851 David Lechner 2025-02-07  111  	int ret;
8e02d188698851 David Lechner 2025-02-07  112
8e02d188698851 David Lechner 2025-02-07  113  	if (!spi || !config)
8e02d188698851 David Lechner 2025-02-07  114  		return ERR_PTR(-EINVAL);
8e02d188698851 David Lechner 2025-02-07  115
8e02d188698851 David Lechner 2025-02-07  116  	if (!spi->controller->get_offload)
8e02d188698851 David Lechner 2025-02-07  117  		return ERR_PTR(-ENODEV);
8e02d188698851 David Lechner 2025-02-07  118
8e02d188698851 David Lechner 2025-02-07  119  	resource = kzalloc(sizeof(*resource), GFP_KERNEL);
8e02d188698851 David Lechner 2025-02-07  120  	if (!resource)
8e02d188698851 David Lechner 2025-02-07  121  		return ERR_PTR(-ENOMEM);
8e02d188698851 David Lechner 2025-02-07  122
8e02d188698851 David Lechner 2025-02-07  123  	resource->controller = spi->controller;
8e02d188698851 David Lechner 2025-02-07  124  	resource->offload = spi->controller->get_offload(spi, config);
8e02d188698851 David Lechner 2025-02-07  125  	if (IS_ERR(resource->offload)) {
8e02d188698851 David Lechner 2025-02-07 @126  		kfree(resource);
8e02d188698851 David Lechner 2025-02-07 @127  		return resource->offload;
8e02d188698851 David Lechner 2025-02-07  128  	}
8e02d188698851 David Lechner 2025-02-07  129
8e02d188698851 David Lechner 2025-02-07  130  	ret = devm_add_action_or_reset(dev, spi_offload_put, resource);
8e02d188698851 David Lechner 2025-02-07  131  	if (ret)
8e02d188698851 David Lechner 2025-02-07  132  		return ERR_PTR(ret);
8e02d188698851 David Lechner 2025-02-07  133
8e02d188698851 David Lechner 2025-02-07  134  	return resource->offload;
8e02d188698851 David Lechner 2025-02-07  135  }
8e02d188698851 David Lechner 2025-02-07  136  EXPORT_SYMBOL_GPL(devm_spi_offload_get);
d7231be4b4657e David Lechner 2025-02-07  137
d7231be4b4657e David Lechner 2025-02-07  138  static void spi_offload_trigger_free(struct kref *ref)
d7231be4b4657e David Lechner 2025-02-07  139  {
d7231be4b4657e David Lechner 2025-02-07  140  	struct spi_offload_trigger *trigger =
d7231be4b4657e David Lechner 2025-02-07  141  		container_of(ref, struct spi_offload_trigger, ref);
d7231be4b4657e David Lechner 2025-02-07  142
d7231be4b4657e David Lechner 2025-02-07  143  	mutex_destroy(&trigger->lock);
d7231be4b4657e David Lechner 2025-02-07  144  	fwnode_handle_put(trigger->fwnode);
d7231be4b4657e David Lechner 2025-02-07  145  	kfree(trigger);
d7231be4b4657e David Lechner 2025-02-07  146  }
d7231be4b4657e David Lechner 2025-02-07  147
d7231be4b4657e David Lechner 2025-02-07  148  static void spi_offload_trigger_put(void *data)
d7231be4b4657e David Lechner 2025-02-07  149  {
d7231be4b4657e David Lechner 2025-02-07  150  	struct spi_offload_trigger *trigger = data;
d7231be4b4657e David Lechner 2025-02-07  151
d7231be4b4657e David Lechner 2025-02-07  152  	scoped_guard(mutex, &trigger->lock)
d7231be4b4657e David Lechner 2025-02-07  153  		if (trigger->ops && trigger->ops->release)
d7231be4b4657e David Lechner 2025-02-07  154  			trigger->ops->release(trigger);
d7231be4b4657e David Lechner 2025-02-07  155
d7231be4b4657e David Lechner 2025-02-07  156  	kref_put(&trigger->ref, spi_offload_trigger_free);
d7231be4b4657e David Lechner 2025-02-07  157  }
d7231be4b4657e David Lechner 2025-02-07  158
d7231be4b4657e David Lechner 2025-02-07  159  static struct spi_offload_trigger
d7231be4b4657e David Lechner 2025-02-07  160  *spi_offload_trigger_get(enum spi_offload_trigger_type type,
d7231be4b4657e David Lechner 2025-02-07  161  			 struct fwnode_reference_args *args)
d7231be4b4657e David Lechner 2025-02-07  162  {
d7231be4b4657e David Lechner 2025-02-07  163  	struct spi_offload_trigger *trigger;
d7231be4b4657e David Lechner 2025-02-07  164  	bool match = false;
d7231be4b4657e David Lechner 2025-02-07  165  	int ret;
d7231be4b4657e David Lechner 2025-02-07  166
d7231be4b4657e David Lechner 2025-02-07  167  	guard(mutex)(&spi_offload_triggers_lock);
d7231be4b4657e David Lechner 2025-02-07  168
d7231be4b4657e David Lechner 2025-02-07 @169  	list_for_each_entry(trigger, &spi_offload_triggers, list) {
d7231be4b4657e David Lechner 2025-02-07  170  		if (trigger->fwnode != args->fwnode)
d7231be4b4657e David Lechner 2025-02-07  171  			continue;
d7231be4b4657e David Lechner 2025-02-07  172
d7231be4b4657e David Lechner 2025-02-07  173  		match = trigger->ops->match(trigger, type, args->args, args->nargs);
d7231be4b4657e David Lechner 2025-02-07  174  		if (match)
d7231be4b4657e David Lechner 2025-02-07  175  			break;
d7231be4b4657e David Lechner 2025-02-07  176  	}
d7231be4b4657e David Lechner 2025-02-07  177
d7231be4b4657e David Lechner 2025-02-07  178  	if (!match)
d7231be4b4657e David Lechner 2025-02-07  179  		return ERR_PTR(-EPROBE_DEFER);
d7231be4b4657e David Lechner 2025-02-07  180
d7231be4b4657e David Lechner 2025-02-07 @181  	guard(mutex)(&trigger->lock);
d7231be4b4657e David Lechner 2025-02-07  182
d7231be4b4657e David Lechner 2025-02-07  183  	if (!trigger->ops)
d7231be4b4657e David Lechner 2025-02-07  184  		return ERR_PTR(-ENODEV);
d7231be4b4657e David Lechner 2025-02-07  185
d7231be4b4657e David Lechner 2025-02-07  186  	if (trigger->ops->request) {
d7231be4b4657e David Lechner 2025-02-07  187  		ret = trigger->ops->request(trigger, type, args->args, args->nargs);
d7231be4b4657e David Lechner 2025-02-07  188  		if (ret)
d7231be4b4657e David Lechner 2025-02-07  189  			return ERR_PTR(ret);
d7231be4b4657e David Lechner 2025-02-07  190  	}
d7231be4b4657e David Lechner 2025-02-07  191
d7231be4b4657e David Lechner 2025-02-07  192  	kref_get(&trigger->ref);
d7231be4b4657e David Lechner 2025-02-07  193
d7231be4b4657e David Lechner 2025-02-07  194  	return trigger;
d7231be4b4657e David Lechner 2025-02-07  195  }
d7231be4b4657e David Lechner 2025-02-07  196

:::::: The code at line 127 was first introduced by commit
:::::: 8e02d188698851436f76038ea998b726193d1b10 spi: add basic support for SPI offloading

:::::: TO: David Lechner <dlechner@baylibre.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
