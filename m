Content-Type: multipart/mixed; boundary="===============6058620665715230508=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [hverkuil-media:tc358840 2/4] drivers/media/i2c/tc358840.c:2867:41: sparse: sparse: incorrect type in argument 1 (different base types)
Date: Sat, 22 Feb 2020 19:24:21 +0800
Message-ID: <202002221918.q5SKlcTh%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6058620665715230508==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   git://linuxtv.org/hverkuil/media_tree.git tc358840
head:   54531afb55437b5dc44ce1bcf5f2e70889dc388d
commit: 217099c727b7a16fc643749d3bb9ddc3650315f4 [2/4] tc358840: add Toshib=
a tc358840 HDMI-to-CSI bridge.
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-173-ge0787745-dirty
        git checkout 217099c727b7a16fc643749d3bb9ddc3650315f4
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/media/i2c/tc358840.c:2867:41: sparse: sparse: incorrect type in =
argument 1 (different base types)
>> drivers/media/i2c/tc358840.c:2867:41: sparse:    expected restricted __b=
e32 const [usertype] *p
>> drivers/media/i2c/tc358840.c:2867:41: sparse:    got unsigned int const =
[usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:2868:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types)
   drivers/media/i2c/tc358840.c:2868:9: sparse:    expected restricted __be=
32 const [usertype] *p
   drivers/media/i2c/tc358840.c:2868:9: sparse:    got unsigned int const [=
usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:2873:43: sparse: sparse: incorrect type in =
argument 1 (different base types)
   drivers/media/i2c/tc358840.c:2873:43: sparse:    expected restricted __b=
e32 const [usertype] *p
   drivers/media/i2c/tc358840.c:2873:43: sparse:    got unsigned int const =
[usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:2882:40: sparse: sparse: incorrect type in =
argument 1 (different base types)
   drivers/media/i2c/tc358840.c:2882:40: sparse:    expected restricted __b=
e32 const [usertype] *p
   drivers/media/i2c/tc358840.c:2882:40: sparse:    got unsigned int const =
[usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:2883:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types)
   drivers/media/i2c/tc358840.c:2883:9: sparse:    expected restricted __be=
32 const [usertype] *p
   drivers/media/i2c/tc358840.c:2883:9: sparse:    got unsigned int const [=
usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:2888:43: sparse: sparse: incorrect type in =
argument 1 (different base types)
   drivers/media/i2c/tc358840.c:2888:43: sparse:    expected restricted __b=
e32 const [usertype] *p
   drivers/media/i2c/tc358840.c:2888:43: sparse:    got unsigned int const =
[usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:2889:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types)
   drivers/media/i2c/tc358840.c:2889:9: sparse:    expected restricted __be=
32 const [usertype] *p
   drivers/media/i2c/tc358840.c:2889:9: sparse:    got unsigned int const [=
usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:2894:43: sparse: sparse: incorrect type in =
argument 1 (different base types)
   drivers/media/i2c/tc358840.c:2894:43: sparse:    expected restricted __b=
e32 const [usertype] *p
   drivers/media/i2c/tc358840.c:2894:43: sparse:    got unsigned int const =
[usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:2895:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types)
   drivers/media/i2c/tc358840.c:2895:9: sparse:    expected restricted __be=
32 const [usertype] *p
   drivers/media/i2c/tc358840.c:2895:9: sparse:    got unsigned int const [=
usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:2900:46: sparse: sparse: incorrect type in =
argument 1 (different base types)
   drivers/media/i2c/tc358840.c:2900:46: sparse:    expected restricted __b=
e32 const [usertype] *p
   drivers/media/i2c/tc358840.c:2900:46: sparse:    got unsigned int const =
[usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:2901:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types)
   drivers/media/i2c/tc358840.c:2901:9: sparse:    expected restricted __be=
32 const [usertype] *p
   drivers/media/i2c/tc358840.c:2901:9: sparse:    got unsigned int const [=
usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:2907:45: sparse: sparse: incorrect type in =
argument 1 (different base types)
   drivers/media/i2c/tc358840.c:2907:45: sparse:    expected restricted __b=
e32 const [usertype] *p
   drivers/media/i2c/tc358840.c:2907:45: sparse:    got unsigned int const =
[usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:2908:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types)
   drivers/media/i2c/tc358840.c:2908:9: sparse:    expected restricted __be=
32 const [usertype] *p
   drivers/media/i2c/tc358840.c:2908:9: sparse:    got unsigned int const [=
usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:2914:45: sparse: sparse: incorrect type in =
argument 1 (different base types)
   drivers/media/i2c/tc358840.c:2914:45: sparse:    expected restricted __b=
e32 const [usertype] *p
   drivers/media/i2c/tc358840.c:2914:45: sparse:    got unsigned int const =
[usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:2915:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types)
   drivers/media/i2c/tc358840.c:2915:9: sparse:    expected restricted __be=
32 const [usertype] *p
   drivers/media/i2c/tc358840.c:2915:9: sparse:    got unsigned int const [=
usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:2921:39: sparse: sparse: incorrect type in =
argument 1 (different base types)
   drivers/media/i2c/tc358840.c:2921:39: sparse:    expected restricted __b=
e32 const [usertype] *p
   drivers/media/i2c/tc358840.c:2921:39: sparse:    got unsigned int const =
[usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:2922:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types)
   drivers/media/i2c/tc358840.c:2922:9: sparse:    expected restricted __be=
32 const [usertype] *p
   drivers/media/i2c/tc358840.c:2922:9: sparse:    got unsigned int const [=
usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:2927:44: sparse: sparse: incorrect type in =
argument 1 (different base types)
   drivers/media/i2c/tc358840.c:2927:44: sparse:    expected restricted __b=
e32 const [usertype] *p
   drivers/media/i2c/tc358840.c:2927:44: sparse:    got unsigned int const =
[usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:2928:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types)
   drivers/media/i2c/tc358840.c:2928:9: sparse:    expected restricted __be=
32 const [usertype] *p
   drivers/media/i2c/tc358840.c:2928:9: sparse:    got unsigned int const [=
usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:2934:44: sparse: sparse: incorrect type in =
argument 1 (different base types)
   drivers/media/i2c/tc358840.c:2934:44: sparse:    expected restricted __b=
e32 const [usertype] *p
   drivers/media/i2c/tc358840.c:2934:44: sparse:    got unsigned int const =
[usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:2935:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types)
   drivers/media/i2c/tc358840.c:2935:9: sparse:    expected restricted __be=
32 const [usertype] *p
   drivers/media/i2c/tc358840.c:2935:9: sparse:    got unsigned int const [=
usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:2941:43: sparse: sparse: incorrect type in =
argument 1 (different base types)
   drivers/media/i2c/tc358840.c:2941:43: sparse:    expected restricted __b=
e32 const [usertype] *p
   drivers/media/i2c/tc358840.c:2941:43: sparse:    got unsigned int const =
[usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:2942:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types)
   drivers/media/i2c/tc358840.c:2942:9: sparse:    expected restricted __be=
32 const [usertype] *p
   drivers/media/i2c/tc358840.c:2942:9: sparse:    got unsigned int const [=
usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:2947:38: sparse: sparse: incorrect type in =
argument 1 (different base types)
   drivers/media/i2c/tc358840.c:2947:38: sparse:    expected restricted __b=
e32 const [usertype] *p
   drivers/media/i2c/tc358840.c:2947:38: sparse:    got unsigned int const =
[usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:2948:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types)
   drivers/media/i2c/tc358840.c:2948:9: sparse:    expected restricted __be=
32 const [usertype] *p
   drivers/media/i2c/tc358840.c:2948:9: sparse:    got unsigned int const [=
usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:2953:39: sparse: sparse: incorrect type in =
argument 1 (different base types)
   drivers/media/i2c/tc358840.c:2953:39: sparse:    expected restricted __b=
e32 const [usertype] *p
   drivers/media/i2c/tc358840.c:2953:39: sparse:    got unsigned int const =
[usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:2954:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types)
   drivers/media/i2c/tc358840.c:2954:9: sparse:    expected restricted __be=
32 const [usertype] *p
   drivers/media/i2c/tc358840.c:2954:9: sparse:    got unsigned int const [=
usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:2959:39: sparse: sparse: incorrect type in =
argument 1 (different base types)
   drivers/media/i2c/tc358840.c:2959:39: sparse:    expected restricted __b=
e32 const [usertype] *p
   drivers/media/i2c/tc358840.c:2959:39: sparse:    got unsigned int const =
[usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:2960:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types)
   drivers/media/i2c/tc358840.c:2960:9: sparse:    expected restricted __be=
32 const [usertype] *p
   drivers/media/i2c/tc358840.c:2960:9: sparse:    got unsigned int const [=
usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:2965:39: sparse: sparse: incorrect type in =
argument 1 (different base types)
   drivers/media/i2c/tc358840.c:2965:39: sparse:    expected restricted __b=
e32 const [usertype] *p
   drivers/media/i2c/tc358840.c:2965:39: sparse:    got unsigned int const =
[usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:2966:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types)
   drivers/media/i2c/tc358840.c:2966:9: sparse:    expected restricted __be=
32 const [usertype] *p
   drivers/media/i2c/tc358840.c:2966:9: sparse:    got unsigned int const [=
usertype] *[assigned] property
>> drivers/media/i2c/tc358840.c:692:38: sparse: sparse: cast truncates bits=
 from constant value (ffff3fff becomes 3fff)

vim +2867 drivers/media/i2c/tc358840.c

  2838	=

  2839	static bool tc358840_parse_dt(struct tc358840_platform_data *pdata,
  2840				      struct i2c_client *client)
  2841	{
  2842		struct device_node *node =3D client->dev.of_node;
  2843		struct v4l2_fwnode_endpoint endpoint =3D { .bus_type =3D 0 };
  2844		struct device_node *ep;
  2845		const u32 *property;
  2846		int ret;
  2847	=

  2848		v4l_dbg(1, debug, client, "Device Tree Parameters:\n");
  2849	=

  2850		pdata->reset_gpio =3D of_get_named_gpio(node, "reset-gpios", 0);
  2851		if (pdata->reset_gpio =3D=3D 0)
  2852			return false;
  2853		v4l_dbg(1, debug, client, "reset_gpio =3D %d\n", pdata->reset_gpio);
  2854	=

  2855		ep =3D of_graph_get_next_endpoint(node, NULL);
  2856		if (!ep)
  2857			return false;
  2858	=

  2859		ret =3D v4l2_fwnode_endpoint_alloc_parse(of_fwnode_handle(ep), &end=
point);
  2860		if (ret)
  2861			goto put_node;
  2862		pdata->endpoint =3D endpoint;
  2863	=

  2864		property =3D of_get_property(node, "refclk_hz", NULL);
  2865		if (!property)
  2866			goto free_endpoint;
> 2867		pdata->refclk_hz =3D be32_to_cpup(property);
  2868		v4l_dbg(1, debug, client, "refclk_hz =3D %d\n", be32_to_cpup(proper=
ty));
  2869	=

  2870		property =3D of_get_property(node, "ddc5v_delay", NULL);
  2871		if (!property)
  2872			goto free_endpoint;
  2873		pdata->ddc5v_delay =3D be32_to_cpup(property);
  2874		if (pdata->ddc5v_delay > DDC5V_DELAY_MAX)
  2875			pdata->ddc5v_delay =3D DDC5V_DELAY_MAX;
  2876		v4l_dbg(1, debug, client, "ddc5v_delay =3D %d ms\n",
  2877			50 * pdata->ddc5v_delay);
  2878	=

  2879		property =3D of_get_property(node, "csi_port", NULL);
  2880		if (!property)
  2881			goto free_endpoint;
  2882		pdata->csi_port =3D be32_to_cpup(property);
  2883		v4l_dbg(1, debug, client, "csi_port =3D %d\n", be32_to_cpup(propert=
y));
  2884	=

  2885		property =3D of_get_property(node, "lineinitcnt", NULL);
  2886		if (!property)
  2887			goto free_endpoint;
  2888		pdata->lineinitcnt =3D be32_to_cpup(property);
  2889		v4l_dbg(1, debug, client, "lineinitcnt =3D %d\n", be32_to_cpup(prop=
erty));
  2890	=

  2891		property =3D of_get_property(node, "lptxtimecnt", NULL);
  2892		if (!property)
  2893			goto free_endpoint;
  2894		pdata->lptxtimecnt =3D be32_to_cpup(property);
  2895		v4l_dbg(1, debug, client, "lptxtimecnt =3D %d\n", be32_to_cpup(prop=
erty));
  2896	=

  2897		property =3D of_get_property(node, "tclk_headercnt", NULL);
  2898		if (!property)
  2899			goto free_endpoint;
  2900		pdata->tclk_headercnt =3D be32_to_cpup(property);
  2901		v4l_dbg(1, debug, client, "tclk_headercnt =3D %d\n",
  2902			be32_to_cpup(property));
  2903	=

  2904		property =3D of_get_property(node, "tclk_trailcnt", NULL);
  2905		if (!property)
  2906			goto free_endpoint;
  2907		pdata->tclk_trailcnt =3D be32_to_cpup(property);
  2908		v4l_dbg(1, debug, client, "tclk_trailcnt =3D %d\n",
  2909			be32_to_cpup(property));
  2910	=

  2911		property =3D of_get_property(node, "ths_headercnt", NULL);
  2912		if (!property)
  2913			goto free_endpoint;
  2914		pdata->ths_headercnt =3D be32_to_cpup(property);
  2915		v4l_dbg(1, debug, client, "ths_headercnt =3D %d\n",
  2916			be32_to_cpup(property));
  2917	=

  2918		property =3D of_get_property(node, "twakeup", NULL);
  2919		if (!property)
  2920			goto free_endpoint;
  2921		pdata->twakeup =3D be32_to_cpup(property);
  2922		v4l_dbg(1, debug, client, "twakeup =3D %d\n", be32_to_cpup(property=
));
  2923	=

  2924		property =3D of_get_property(node, "tclk_postcnt", NULL);
  2925		if (!property)
  2926			goto free_endpoint;
  2927		pdata->tclk_postcnt =3D be32_to_cpup(property);
  2928		v4l_dbg(1, debug, client, "tclk_postcnt =3D %d\n",
  2929			be32_to_cpup(property));
  2930	=

  2931		property =3D of_get_property(node, "ths_trailcnt", NULL);
  2932		if (!property)
  2933			goto free_endpoint;
  2934		pdata->ths_trailcnt =3D be32_to_cpup(property);
  2935		v4l_dbg(1, debug, client, "ths_trailcnt =3D %d\n",
  2936			be32_to_cpup(property));
  2937	=

  2938		property =3D of_get_property(node, "hstxvregcnt", NULL);
  2939		if (!property)
  2940			goto free_endpoint;
  2941		pdata->hstxvregcnt =3D be32_to_cpup(property);
  2942		v4l_dbg(1, debug, client, "hstxvregcnt =3D %d\n", be32_to_cpup(prop=
erty));
  2943	=

  2944		property =3D of_get_property(node, "btacnt", NULL);
  2945		if (!property)
  2946			goto free_endpoint;
  2947		pdata->btacnt =3D be32_to_cpup(property);
  2948		v4l_dbg(1, debug, client, "btacnt =3D %d\n", be32_to_cpup(property)=
);
  2949	=

  2950		property =3D of_get_property(node, "pll_prd", NULL);
  2951		if (!property)
  2952			goto free_endpoint;
  2953		pdata->pll_prd =3D be32_to_cpup(property);
  2954		v4l_dbg(1, debug, client, "pll_prd =3D %d\n", be32_to_cpup(property=
));
  2955	=

  2956		property =3D of_get_property(node, "pll_frs", NULL);
  2957		if (!property)
  2958			goto free_endpoint;
  2959		pdata->pll_frs =3D be32_to_cpup(property);
  2960		v4l_dbg(1, debug, client, "pll_frs =3D %d\n", be32_to_cpup(property=
));
  2961	=

  2962		property =3D of_get_property(node, "pll_fbd", NULL);
  2963		if (!property)
  2964			goto free_endpoint;
  2965		pdata->pll_fbd =3D be32_to_cpup(property);
  2966		v4l_dbg(1, debug, client, "pll_fbd =3D %d\n", be32_to_cpup(property=
));
  2967	=

  2968		v4l2_fwnode_endpoint_free(&endpoint);
  2969		of_node_put(ep);
  2970		return true;
  2971	free_endpoint:
  2972		v4l2_fwnode_endpoint_free(&endpoint);
  2973	put_node:
  2974		of_node_put(ep);
  2975		return false;
  2976	}
  2977	#else
  2978	static bool tc358840_parse_dt(struct tc358840_platform_data *pdata,
  2979				      struct i2c_client *client)
  2980	{
  2981		return false;
  2982	}
  2983	#endif
  2984	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6058620665715230508==--

