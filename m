Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393EC1386
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jun 2023 17:43:01 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-570808d8ddeso24479697b3.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jun 2023 10:43:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687110180; x=1689702180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xLpx9nbtGApdAP3oWuubaSztjg6fg3+1+MFFJiCzVks=;
        b=Z6CTl6SYlikWeNeXrrRwJpidC2yYlDtc0ORpL3uDGMIdhq2jpdgs8m57S0uWo9yMH+
         g31pT4eG4Lfjfm6eX6yURTY2zyj/dBiSPmcjyiBfKmAeX/DWIEEuP8CyqYwn1mKABxle
         9IGjqNoweLol0bM5jj4lLmkTHD3aVi/qJbsQdiRHpqqdjSxMRCxmgtLNNQmfWcjmR/Ev
         eHI7G3d6bwp+fHcp42FJKfknIY85lTxb1qrp5hSrq+uXOmY3NqRVmaMmnaQqvvx5YcWr
         FvIAENmbRfJvl8GJNkWMozw6G4pUVwN5ZvFchAXCX6Khvp7FM5XqUs3mm0bt4NOki85F
         Rxtg==
X-Gm-Message-State: AC+VfDxqJIv5t4aphujCXgr7spdXmPAdqApgozC89QwafdfJ5MqUKeLh
	kDeLESiMIUQ5ObhLwVeeCoGW/o7EpD/eemb2
X-Google-Smtp-Source: ACHHUZ5Lu+1uSDP+IqPNHVV1G+lK/8D2zarMfwdEcT5yWnbeEuMz9Alpm+Jx8UqPsuqarKOfLAwlSQ==
X-Received: by 2002:a0d:d0c2:0:b0:570:4842:a59d with SMTP id s185-20020a0dd0c2000000b005704842a59dmr9072746ywd.22.1687110179756;
        Sun, 18 Jun 2023 10:42:59 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id t126-20020a814684000000b0057320d10542sm721643ywa.78.2023.06.18.10.42.58
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jun 2023 10:42:59 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-570114e1feaso34071247b3.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jun 2023 10:42:58 -0700 (PDT)
X-Received: by 2002:a81:a0d3:0:b0:56c:ff9d:8cd9 with SMTP id
 x202-20020a81a0d3000000b0056cff9d8cd9mr8570801ywg.7.1687110178437; Sun, 18
 Jun 2023 10:42:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230615182938.18487-4-tanure@linux.com> <202306161946.Kk7xeos8-lkp@intel.com>
In-Reply-To: <202306161946.Kk7xeos8-lkp@intel.com>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Sun, 18 Jun 2023 18:42:47 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+2Jr4CHHbzy+d5wNgrEsU__EFQr_y0PZvLdb-uEp+H6eA@mail.gmail.com>
Message-ID: <CAJX_Q+2Jr4CHHbzy+d5wNgrEsU__EFQr_y0PZvLdb-uEp+H6eA@mail.gmail.com>
Subject: Re: [PATCH 3/6] clk: meson: t7: add peripheral clock controller
To: kernel test robot <lkp@intel.com>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, oe-kbuild-all@lists.linux.dev, 
	Nick <nick@khadas.com>, Artem <art@khadas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 16, 2023 at 12:23=E2=80=AFPM kernel test robot <lkp@intel.com> =
wrote:
>
> Hi Lucas,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on robh/for-next]
> [also build test WARNING on clk/clk-next tty/tty-testing tty/tty-next tty=
/tty-linus krzk/for-next krzk-dt/for-next krzk-mem-ctrl/for-next linus/mast=
er v6.4-rc6 next-20230616]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Lucas-Tanure/dt-bi=
ndings-arm-amlogic-add-Amlogic-T7-based-Khadas-VIM4-bindings/20230616-02303=
8
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git fo=
r-next
> patch link:    https://lore.kernel.org/r/20230615182938.18487-4-tanure%40=
linux.com
> patch subject: [PATCH 3/6] clk: meson: t7: add peripheral clock controlle=
r
> config: arm64-buildonly-randconfig-r004-20230615 (https://download.01.org=
/0day-ci/archive/20230616/202306161946.Kk7xeos8-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 12.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230616/202306161946=
.Kk7xeos8-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202306161946.Kk7xeos8-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    drivers/clk/meson/t7.c:7084:51: warning: initialized field overwritten=
 [-Woverride-init]
>     7084 |                 [CLKID_VID_PLL]                 =3D &t7_vid_pl=
l.hw,
>          |                                                   ^
>    drivers/clk/meson/t7.c:7084:51: note: (near initialization for 't7_hw_=
onecell_data.hws[93]')
>    drivers/clk/meson/t7.c: In function 'meson_t7_probe':
> >> drivers/clk/meson/t7.c:7946:36: warning: variable 'mclk_data' set but =
not used [-Wunused-but-set-variable]
>     7946 |         struct meson_clk_pll_data *mclk_data;
>          |                                    ^~~~~~~~~
>    drivers/clk/meson/t7.c: At top level:
>    drivers/clk/meson/t7.c:689:37: warning: 't7_a73_dyn_clk_sel' defined b=
ut not used [-Wunused-const-variable=3D]
>      689 | static const struct clk_parent_data t7_a73_dyn_clk_sel[] =3D {
>          |                                     ^~~~~~~~~~~~~~~~~~
>    drivers/clk/meson/t7.c:93:29: warning: 'meson_pll_clk_no_ops' defined =
but not used [-Wunused-const-variable=3D]
>       93 | static const struct clk_ops meson_pll_clk_no_ops =3D {};
>          |                             ^~~~~~~~~~~~~~~~~~~~
>
>
> vim +/mclk_data +7946 drivers/clk/meson/t7.c
>
>   7939
>   7940  static int __ref meson_t7_probe(struct platform_device *pdev)
>   7941  {
>   7942          struct device *dev =3D &pdev->dev;
>   7943          struct regmap *basic_map;
>   7944          struct regmap *pll_map;
>   7945          struct regmap *cpu_clk_map;
> > 7946          struct meson_clk_pll_data *mclk_data;
>   7947          int ret, i;
>   7948
>   7949          /* Get regmap for different clock area */
>   7950          basic_map =3D t7_regmap_resource(dev, "basic");
>   7951          if (IS_ERR(basic_map)) {
>   7952                  dev_err(dev, "basic clk registers not found\n");
>   7953                  return PTR_ERR(basic_map);
>   7954          }
>   7955
>   7956          pll_map =3D t7_regmap_resource(dev, "pll");
>   7957          if (IS_ERR(pll_map)) {
>   7958                  dev_err(dev, "pll clk registers not found\n");
>   7959                  return PTR_ERR(pll_map);
>   7960          }
>   7961
>   7962          cpu_clk_map =3D t7_regmap_resource(dev, "cpu_clk");
>   7963          if (IS_ERR(cpu_clk_map)) {
>   7964                  dev_err(dev, "cpu clk registers not found\n");
>   7965                  return PTR_ERR(cpu_clk_map);
>   7966          }
>   7967
>   7968          /* Populate regmap for the regmap backed clocks */
>   7969          for (i =3D 0; i < ARRAY_SIZE(t7_clk_regmaps); i++)
>   7970                  t7_clk_regmaps[i]->map =3D basic_map;
>   7971
>   7972          for (i =3D 0; i < ARRAY_SIZE(t7_cpu_clk_regmaps); i++)
>   7973                  t7_cpu_clk_regmaps[i]->map =3D cpu_clk_map;
>   7974
>   7975          for (i =3D 0; i < ARRAY_SIZE(t7_pll_clk_regmaps); i++)
>   7976                  t7_pll_clk_regmaps[i]->map =3D pll_map;
>   7977          regmap_write(pll_map, ANACTRL_MPLL_CTRL0, 0x00000543);
>   7978
>   7979          mclk_data =3D t7_mclk_pll_dco.data;
>   7980
>   7981          for (i =3D 0; i < t7_hw_onecell_data.num; i++) {
>   7982                  /* array might be sparse */
>   7983                  if (!t7_hw_onecell_data.hws[i])
>   7984                          continue;
>   7985
>   7986                  ret =3D devm_clk_hw_register(dev, t7_hw_onecell_d=
ata.hws[i]);
>   7987                  if (ret) {
>   7988                          dev_err(dev, "Clock registration failed\n=
");
>   7989                          return ret;
>   7990                  }
>   7991          }
>   7992          meson_t7_dvfs_setup(pdev);
>   7993
>   7994
>   7995          return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell=
_get, &t7_hw_onecell_data);
>   7996  }
>   7997
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

I will drop this patch and use the S4 clock driver after it lands.
Thanks
