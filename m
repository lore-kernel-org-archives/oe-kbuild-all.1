Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F22C219F0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jan 2024 11:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="Jltrd2oV"
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id EE9EE3F131
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jan 2024 11:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1704369222;
	bh=Ui9AhKI7oyd2ObfyAtOaT/c8Xr9k5kxzIYFHSYBTw7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=Jltrd2oVanCZDFIoac8yoFCxTeClNMDsSqXU1m5VXYm5EZCr2bucU/GMKF4q+UPjP
	 9o7Ci2zkWFLLMMo1a7lO3ArYjgGcU4BB3g7BhS8SVifBBfFKH9IYP3bOLG403ZPyCE
	 YFHo9xEc0isvbZzeiOJaWSKp54FWMu4+OwoypufiWIBjtj3+NDHbdLCbkedzgdTqSx
	 cCfUiXMSPcV1/gVu6HHmsvhjzccpD8/ZHXEXqF/7TAMVDJTK+RDnBkdUxFxhRmORsx
	 yP9JEgqdXa9aHjjo4vHDL0lqZz8xZB+ktQVNaV0x6eXRZb6k27umY+lNY3RHYVnOL9
	 EFpWj0PF/9ssw==
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4280c1c368eso3545301cf.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 04 Jan 2024 03:53:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704369221; x=1704974021;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ui9AhKI7oyd2ObfyAtOaT/c8Xr9k5kxzIYFHSYBTw7s=;
        b=WRx2A+w/AlMhoy1mAG2izdDRlbC6D+dPoeArTekCcowbI1/inDp4appqg4z16eKMvg
         tYAs8JcL48LOQruFUmejJ8bGDaJ85yuXD5d5pl0hBVqLQry0AnMKt5kSmpXXcSm8/hQe
         xpweaq4C30lAeCGt26mdN8vjHLOcdJU9z1BROlwGRio8iIkvOHO4rMGDo306CQJw1rXN
         SyyqzkGEflyyXcwvho55EHELxUnPKLbyuWENSvwFc7ljIZahSvipxT0xDfXLngn0AHta
         uvcmCq4AyBVce2bF/IcWgJgSL2ucfBZqaZCjLLOlLVIGCbRj7kftkEltwzyXaote6LD5
         3HZQ==
X-Gm-Message-State: AOJu0YxyQUnpmBgkjOcO6p/Xf3gvasQckruxsko0GmI4c3XEzz7XkSOf
	2koOIIV536DqHbq+fNWX4scxSujIsI9Leq85/12jrMFKYoU+wkQHLLRcPGWCK3l3KluMu5SGOP6
	g9imk34HBkTIbAiAKa4+259iF7/Ar4Ntq3yH4tcHSOJBXwUloenGdey4W/BU6si93Bg==
X-Received: by 2002:a05:622a:30e:b0:423:86cc:8c85 with SMTP id q14-20020a05622a030e00b0042386cc8c85mr404168qtw.35.1704369221066;
        Thu, 04 Jan 2024 03:53:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBt/pqeJiqxNv5dFC1slNr5nkNihvTqHKDffjsEcl6TKhDoio5EUncmeag6e3oVsnvkxNr34myQczvRx1YvDs=
X-Received: by 2002:a05:622a:30e:b0:423:86cc:8c85 with SMTP id
 q14-20020a05622a030e00b0042386cc8c85mr404164qtw.35.1704369220727; Thu, 04 Jan
 2024 03:53:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240103132852.298964-3-emil.renner.berthing@canonical.com> <202401041935.sjL381WZ-lkp@intel.com>
In-Reply-To: <202401041935.sjL381WZ-lkp@intel.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Thu, 4 Jan 2024 12:53:14 +0100
Message-ID: <CAJM55Z-4=suh-Q0OBJbqCv=qb9XHCVbHoAHus1pAc8NRVKEaLw@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] pinctrl: Add driver for the T-Head TH1520 SoC
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 4 Jan 2024 at 12:34, kernel test robot <lkp@intel.com> wrote:
>
> Hi Emil,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on robh/for-next]
> [also build test ERROR on linus/master v6.7-rc8]
> [cannot apply to linusw-pinctrl/devel linusw-pinctrl/for-next next-20240104]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]

Thanks! This needs to depend on OF.

/Emil

> url:    https://github.com/intel-lab-lkp/linux/commits/Emil-Renner-Berthing/dt-bindings-pinctrl-Add-thead-th1520-pinctrl-bindings/20240103-213316
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
> patch link:    https://lore.kernel.org/r/20240103132852.298964-3-emil.renner.berthing%40canonical.com
> patch subject: [PATCH v2 2/8] pinctrl: Add driver for the T-Head TH1520 SoC
> config: s390-randconfig-r121-20240104 (https://download.01.org/0day-ci/archive/20240104/202401041935.sjL381WZ-lkp@intel.com/config)
> compiler: s390-linux-gcc (GCC) 13.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20240104/202401041935.sjL381WZ-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202401041935.sjL381WZ-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    drivers/pinctrl/pinctrl-th1520.c: In function 'th1520_pinctrl_dt_node_to_map':
> >> drivers/pinctrl/pinctrl-th1520.c:454:23: error: implicit declaration of function 'pinconf_generic_parse_dt_config'; did you mean 'pinconf_generic_dump_config'? [-Werror=implicit-function-declaration]
>      454 |                 ret = pinconf_generic_parse_dt_config(child, pctldev, &configs, &nconfigs);
>          |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>          |                       pinconf_generic_dump_config
>    cc1: some warnings being treated as errors
>
>
> vim +454 drivers/pinctrl/pinctrl-th1520.c
>
>    410
>    411  static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
>    412                                           struct device_node *np,
>    413                                           struct pinctrl_map **maps,
>    414                                           unsigned int *num_maps)
>    415  {
>    416          struct th1520_pinctrl *thp = pinctrl_dev_get_drvdata(pctldev);
>    417          struct device_node *child;
>    418          struct pinctrl_map *map;
>    419          unsigned long *configs;
>    420          unsigned int nconfigs;
>    421          unsigned int nmaps;
>    422          int ret;
>    423
>    424          nmaps = 0;
>    425          for_each_available_child_of_node(np, child) {
>    426                  int npins = of_property_count_strings(child, "pins");
>    427
>    428                  if (npins <= 0) {
>    429                          of_node_put(child);
>    430                          dev_err(thp->pctl->dev, "no pins selected for %pOFn.%pOFn\n",
>    431                                  np, child);
>    432                          return -EINVAL;
>    433                  }
>    434                  nmaps += npins;
>    435                  if (of_property_present(child, "function"))
>    436                          nmaps += npins;
>    437          }
>    438
>    439          map = kcalloc(nmaps, sizeof(*map), GFP_KERNEL);
>    440          if (!map)
>    441                  return -ENOMEM;
>    442
>    443          nmaps = 0;
>    444          mutex_lock(&thp->mutex);
>    445          for_each_available_child_of_node(np, child) {
>    446                  unsigned int rollback = nmaps;
>    447                  enum th1520_muxtype muxtype;
>    448                  struct property *prop;
>    449                  const char *funcname;
>    450                  const char **pgnames;
>    451                  const char *pinname;
>    452                  int npins;
>    453
>  > 454                  ret = pinconf_generic_parse_dt_config(child, pctldev, &configs, &nconfigs);
>    455                  if (ret) {
>    456                          dev_err(thp->pctl->dev, "%pOFn.%pOFn: error parsing pin config\n",
>    457                                  np, child);
>    458                          goto put_child;
>    459                  }
>    460
>    461                  if (!of_property_read_string(child, "function", &funcname)) {
>    462                          muxtype = th1520_muxtype_get(funcname);
>    463                          if (!muxtype) {
>    464                                  dev_err(thp->pctl->dev, "%pOFn.%pOFn: unknown function '%s'\n",
>    465                                          np, child, funcname);
>    466                                  ret = -EINVAL;
>    467                                  goto free_configs;
>    468                          }
>    469
>    470                          funcname = devm_kasprintf(thp->pctl->dev, GFP_KERNEL, "%pOFn.%pOFn",
>    471                                                    np, child);
>    472                          if (!funcname) {
>    473                                  ret = -ENOMEM;
>    474                                  goto free_configs;
>    475                          }
>    476
>    477                          npins = of_property_count_strings(child, "pins");
>    478                          pgnames = devm_kcalloc(thp->pctl->dev, npins, sizeof(*pgnames), GFP_KERNEL);
>    479                          if (!pgnames) {
>    480                                  ret = -ENOMEM;
>    481                                  goto free_configs;
>    482                          }
>    483                  } else {
>    484                          funcname = NULL;
>    485                  }
>    486
>    487                  npins = 0;
>    488                  of_property_for_each_string(child, "pins", prop, pinname) {
>    489                          unsigned int i;
>    490
>    491                          for (i = 0; i < thp->desc.npins; i++) {
>    492                                  if (!strcmp(pinname, thp->desc.pins[i].name))
>    493                                          break;
>    494                          }
>    495                          if (i == thp->desc.npins) {
>    496                                  nmaps = rollback;
>    497                                  dev_err(thp->pctl->dev, "%pOFn.%pOFn: unknown pin '%s'\n",
>    498                                          np, child, pinname);
>    499                                  goto free_configs;
>    500                          }
>    501
>    502                          if (nconfigs) {
>    503                                  map[nmaps].type = PIN_MAP_TYPE_CONFIGS_PIN;
>    504                                  map[nmaps].data.configs.group_or_pin = thp->desc.pins[i].name;
>    505                                  map[nmaps].data.configs.configs = configs;
>    506                                  map[nmaps].data.configs.num_configs = nconfigs;
>    507                                  nmaps += 1;
>    508                          }
>    509                          if (funcname) {
>    510                                  pgnames[npins++] = thp->desc.pins[i].name;
>    511                                  map[nmaps].type = PIN_MAP_TYPE_MUX_GROUP;
>    512                                  map[nmaps].data.mux.function = funcname;
>    513                                  map[nmaps].data.mux.group = thp->desc.pins[i].name;
>    514                                  nmaps += 1;
>    515                          }
>    516                  }
>    517
>    518                  if (funcname) {
>    519                          ret = pinmux_generic_add_function(pctldev, funcname, pgnames,
>    520                                                            npins, (void *)muxtype);
>    521                          if (ret < 0) {
>    522                                  dev_err(thp->pctl->dev, "error adding function %s\n", funcname);
>    523                                  goto put_child;
>    524                          }
>    525                  }
>    526          }
>    527
>    528          *maps = map;
>    529          *num_maps = nmaps;
>    530          mutex_unlock(&thp->mutex);
>    531          return 0;
>    532
>    533  free_configs:
>    534          kfree(configs);
>    535  put_child:
>    536          of_node_put(child);
>    537          th1520_pinctrl_dt_free_map(pctldev, map, nmaps);
>    538          mutex_unlock(&thp->mutex);
>    539          return ret;
>    540  }
>    541
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
