Content-Type: multipart/mixed; boundary="===============8511888292274585955=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/gpu/drm/bridge/sil-sii8620.c:2355: undefined reference to `extcon_unregister_notifier'
Date: Thu, 06 May 2021 13:42:01 +0800
Message-ID: <202105061353.G3x3UcCm-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8511888292274585955==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   8404c9fbc84b741f66cff7d4934a25dd2c344452
commit: def2fbffe62c00c330c7f41584a356001179c59c kconfig: allow symbols imp=
lied by y to become m
date:   1 year, 2 months ago
config: i386-randconfig-a004-20210506 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=3D1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Ddef2fbffe62c00c330c7f41584a356001179c59c
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout def2fbffe62c00c330c7f41584a356001179c59c
        # save the attached .config to linux build tree
        make W=3D1 W=3D1 ARCH=3Di386 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/bridge/sil-sii8620.o: in function `sii8620_remove':
>> drivers/gpu/drm/bridge/sil-sii8620.c:2355: undefined reference to `extco=
n_unregister_notifier'
   ld: drivers/gpu/drm/bridge/sil-sii8620.o: in function `sii8620_extcon_in=
it':
>> drivers/gpu/drm/bridge/sil-sii8620.c:2179: undefined reference to `extco=
n_find_edev_by_node'
>> ld: drivers/gpu/drm/bridge/sil-sii8620.c:2191: undefined reference to `e=
xtcon_register_notifier'
   ld: drivers/gpu/drm/bridge/sil-sii8620.o: in function `sii8620_extcon_wo=
rk':
>> drivers/gpu/drm/bridge/sil-sii8620.c:2139: undefined reference to `extco=
n_get_state'


vim +2355 drivers/gpu/drm/bridge/sil-sii8620.c

688838442147d9 Maciej Purski    2018-02-27  2162  =

688838442147d9 Maciej Purski    2018-02-27  2163  static int sii8620_extcon=
_init(struct sii8620 *ctx)
688838442147d9 Maciej Purski    2018-02-27  2164  {
688838442147d9 Maciej Purski    2018-02-27  2165  	struct extcon_dev *edev;
688838442147d9 Maciej Purski    2018-02-27  2166  	struct device_node *musb=
, *muic;
688838442147d9 Maciej Purski    2018-02-27  2167  	int ret;
688838442147d9 Maciej Purski    2018-02-27  2168  =

688838442147d9 Maciej Purski    2018-02-27  2169  	/* get micro-USB connect=
or node */
688838442147d9 Maciej Purski    2018-02-27  2170  	musb =3D of_graph_get_re=
mote_node(ctx->dev->of_node, 1, -1);
688838442147d9 Maciej Purski    2018-02-27  2171  	/* next get micro-USB In=
terface Controller node */
688838442147d9 Maciej Purski    2018-02-27  2172  	muic =3D of_get_next_par=
ent(musb);
688838442147d9 Maciej Purski    2018-02-27  2173  =

688838442147d9 Maciej Purski    2018-02-27  2174  	if (!muic) {
688838442147d9 Maciej Purski    2018-02-27  2175  		dev_info(ctx->dev, "no =
extcon found, switching to 'always on' mode\n");
688838442147d9 Maciej Purski    2018-02-27  2176  		return 0;
688838442147d9 Maciej Purski    2018-02-27  2177  	}
688838442147d9 Maciej Purski    2018-02-27  2178  =

688838442147d9 Maciej Purski    2018-02-27 @2179  	edev =3D extcon_find_ede=
v_by_node(muic);
688838442147d9 Maciej Purski    2018-02-27  2180  	of_node_put(muic);
688838442147d9 Maciej Purski    2018-02-27  2181  	if (IS_ERR(edev)) {
688838442147d9 Maciej Purski    2018-02-27  2182  		if (PTR_ERR(edev) =3D=
=3D -EPROBE_DEFER)
688838442147d9 Maciej Purski    2018-02-27  2183  			return -EPROBE_DEFER;
688838442147d9 Maciej Purski    2018-02-27  2184  		dev_err(ctx->dev, "Inva=
lid or missing extcon\n");
688838442147d9 Maciej Purski    2018-02-27  2185  		return PTR_ERR(edev);
688838442147d9 Maciej Purski    2018-02-27  2186  	}
688838442147d9 Maciej Purski    2018-02-27  2187  =

688838442147d9 Maciej Purski    2018-02-27  2188  	ctx->extcon =3D edev;
688838442147d9 Maciej Purski    2018-02-27  2189  	ctx->extcon_nb.notifier_=
call =3D sii8620_extcon_notifier;
688838442147d9 Maciej Purski    2018-02-27  2190  	INIT_WORK(&ctx->extcon_w=
q, sii8620_extcon_work);
688838442147d9 Maciej Purski    2018-02-27 @2191  	ret =3D extcon_register_=
notifier(edev, EXTCON_DISP_MHL, &ctx->extcon_nb);
688838442147d9 Maciej Purski    2018-02-27  2192  	if (ret) {
688838442147d9 Maciej Purski    2018-02-27  2193  		dev_err(ctx->dev, "fail=
ed to register notifier for MHL\n");
688838442147d9 Maciej Purski    2018-02-27  2194  		return ret;
688838442147d9 Maciej Purski    2018-02-27  2195  	}
688838442147d9 Maciej Purski    2018-02-27  2196  =

688838442147d9 Maciej Purski    2018-02-27  2197  	return 0;
688838442147d9 Maciej Purski    2018-02-27  2198  }
688838442147d9 Maciej Purski    2018-02-27  2199  =

ce6e153f414a73 Andrzej Hajda    2016-10-10  2200  static inline struct sii8=
620 *bridge_to_sii8620(struct drm_bridge *bridge)
ce6e153f414a73 Andrzej Hajda    2016-10-10  2201  {
ce6e153f414a73 Andrzej Hajda    2016-10-10  2202  	return container_of(brid=
ge, struct sii8620, bridge);
ce6e153f414a73 Andrzej Hajda    2016-10-10  2203  }
ce6e153f414a73 Andrzej Hajda    2016-10-10  2204  =

e25f1f7c94e16d Maciej Purski    2017-08-24  2205  static int sii8620_attach=
(struct drm_bridge *bridge)
e25f1f7c94e16d Maciej Purski    2017-08-24  2206  {
e25f1f7c94e16d Maciej Purski    2017-08-24  2207  	struct sii8620 *ctx =3D =
bridge_to_sii8620(bridge);
e25f1f7c94e16d Maciej Purski    2017-08-24  2208  =

e25f1f7c94e16d Maciej Purski    2017-08-24  2209  	sii8620_init_rcp_input_d=
ev(ctx);
e25f1f7c94e16d Maciej Purski    2017-08-24  2210  =

e25f1f7c94e16d Maciej Purski    2017-08-24  2211  	return sii8620_clear_err=
or(ctx);
e25f1f7c94e16d Maciej Purski    2017-08-24  2212  }
e25f1f7c94e16d Maciej Purski    2017-08-24  2213  =

e25f1f7c94e16d Maciej Purski    2017-08-24  2214  static void sii8620_detac=
h(struct drm_bridge *bridge)
e25f1f7c94e16d Maciej Purski    2017-08-24  2215  {
e25f1f7c94e16d Maciej Purski    2017-08-24  2216  	struct sii8620 *ctx =3D =
bridge_to_sii8620(bridge);
e25f1f7c94e16d Maciej Purski    2017-08-24  2217  =

710abfe8ead247 Ronald Tschal=C3=A4r  2019-04-19  2218  	if (!IS_ENABLED(CON=
FIG_RC_CORE))
710abfe8ead247 Ronald Tschal=C3=A4r  2019-04-19  2219  		return;
710abfe8ead247 Ronald Tschal=C3=A4r  2019-04-19  2220  =

e25f1f7c94e16d Maciej Purski    2017-08-24  2221  	rc_unregister_device(ctx=
->rc_dev);
e25f1f7c94e16d Maciej Purski    2017-08-24  2222  }
e25f1f7c94e16d Maciej Purski    2017-08-24  2223  =

ecba7cfa3afbe4 Maciej Purski    2018-02-02  2224  static int sii8620_is_pac=
king_required(struct sii8620 *ctx,
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2225  				       const struct d=
rm_display_mode *mode)
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2226  {
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2227  	int max_pclk, max_pclk_p=
p_mode;
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2228  =

ecba7cfa3afbe4 Maciej Purski    2018-02-02  2229  	if (sii8620_is_mhl3(ctx)=
) {
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2230  		max_pclk =3D MHL3_MAX_P=
CLK;
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2231  		max_pclk_pp_mode =3D MH=
L3_MAX_PCLK_PP_MODE;
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2232  	} else {
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2233  		max_pclk =3D MHL1_MAX_P=
CLK;
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2234  		max_pclk_pp_mode =3D MH=
L1_MAX_PCLK_PP_MODE;
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2235  	}
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2236  =

ecba7cfa3afbe4 Maciej Purski    2018-02-02  2237  	if (mode->clock < max_pc=
lk)
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2238  		return 0;
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2239  	else if (mode->clock < m=
ax_pclk_pp_mode)
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2240  		return 1;
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2241  	else
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2242  		return -1;
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2243  }
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2244  =

e7c2e4d368e2ef Marek Szyprowski 2017-11-09  2245  static enum drm_mode_stat=
us sii8620_mode_valid(struct drm_bridge *bridge,
e7c2e4d368e2ef Marek Szyprowski 2017-11-09  2246  					 const struct drm_di=
splay_mode *mode)
e7c2e4d368e2ef Marek Szyprowski 2017-11-09  2247  {
e7c2e4d368e2ef Marek Szyprowski 2017-11-09  2248  	struct sii8620 *ctx =3D =
bridge_to_sii8620(bridge);
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2249  	int pack_required =3D si=
i8620_is_packing_required(ctx, mode);
e7c2e4d368e2ef Marek Szyprowski 2017-11-09  2250  	bool can_pack =3D ctx->d=
evcap[MHL_DCAP_VID_LINK_MODE] &
e7c2e4d368e2ef Marek Szyprowski 2017-11-09  2251  			MHL_DCAP_VID_LINK_PPIX=
EL;
e7c2e4d368e2ef Marek Szyprowski 2017-11-09  2252  =

ecba7cfa3afbe4 Maciej Purski    2018-02-02  2253  	switch (pack_required) {
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2254  	case 0:
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2255  		return MODE_OK;
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2256  	case 1:
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2257  		return (can_pack) ? MOD=
E_OK : MODE_CLOCK_HIGH;
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2258  	default:
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2259  		return MODE_CLOCK_HIGH;
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2260  	}
e7c2e4d368e2ef Marek Szyprowski 2017-11-09  2261  }
e7c2e4d368e2ef Marek Szyprowski 2017-11-09  2262  =

ce6e153f414a73 Andrzej Hajda    2016-10-10  2263  static bool sii8620_mode_=
fixup(struct drm_bridge *bridge,
ce6e153f414a73 Andrzej Hajda    2016-10-10  2264  			       const struct dr=
m_display_mode *mode,
ce6e153f414a73 Andrzej Hajda    2016-10-10  2265  			       struct drm_disp=
lay_mode *adjusted_mode)
ce6e153f414a73 Andrzej Hajda    2016-10-10  2266  {
ce6e153f414a73 Andrzej Hajda    2016-10-10  2267  	struct sii8620 *ctx =3D =
bridge_to_sii8620(bridge);
ce6e153f414a73 Andrzej Hajda    2016-10-10  2268  =

bf1722cab55a32 Andrzej Hajda    2017-02-01  2269  	mutex_lock(&ctx->lock);
ce6e153f414a73 Andrzej Hajda    2016-10-10  2270  =

ecba7cfa3afbe4 Maciej Purski    2018-02-02  2271  	ctx->use_packed_pixel =
=3D sii8620_is_packing_required(ctx, adjusted_mode);
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2272  =

ce6e153f414a73 Andrzej Hajda    2016-10-10  2273  	mutex_unlock(&ctx->lock);
ecba7cfa3afbe4 Maciej Purski    2018-02-02  2274  =

ecba7cfa3afbe4 Maciej Purski    2018-02-02  2275  	return true;
ce6e153f414a73 Andrzej Hajda    2016-10-10  2276  }
ce6e153f414a73 Andrzej Hajda    2016-10-10  2277  =

ce6e153f414a73 Andrzej Hajda    2016-10-10  2278  static const struct drm_b=
ridge_funcs sii8620_bridge_funcs =3D {
e25f1f7c94e16d Maciej Purski    2017-08-24  2279  	.attach =3D sii8620_atta=
ch,
e25f1f7c94e16d Maciej Purski    2017-08-24  2280  	.detach =3D sii8620_deta=
ch,
ce6e153f414a73 Andrzej Hajda    2016-10-10  2281  	.mode_fixup =3D sii8620_=
mode_fixup,
e7c2e4d368e2ef Marek Szyprowski 2017-11-09  2282  	.mode_valid =3D sii8620_=
mode_valid,
ce6e153f414a73 Andrzej Hajda    2016-10-10  2283  };
ce6e153f414a73 Andrzej Hajda    2016-10-10  2284  =

ce6e153f414a73 Andrzej Hajda    2016-10-10  2285  static int sii8620_probe(=
struct i2c_client *client,
ce6e153f414a73 Andrzej Hajda    2016-10-10  2286  			 const struct i2c_devi=
ce_id *id)
ce6e153f414a73 Andrzej Hajda    2016-10-10  2287  {
ce6e153f414a73 Andrzej Hajda    2016-10-10  2288  	struct device *dev =3D &=
client->dev;
ce6e153f414a73 Andrzej Hajda    2016-10-10  2289  	struct sii8620 *ctx;
ce6e153f414a73 Andrzej Hajda    2016-10-10  2290  	int ret;
ce6e153f414a73 Andrzej Hajda    2016-10-10  2291  =

ce6e153f414a73 Andrzej Hajda    2016-10-10  2292  	ctx =3D devm_kzalloc(dev=
, sizeof(*ctx), GFP_KERNEL);
ce6e153f414a73 Andrzej Hajda    2016-10-10  2293  	if (!ctx)
ce6e153f414a73 Andrzej Hajda    2016-10-10  2294  		return -ENOMEM;
ce6e153f414a73 Andrzej Hajda    2016-10-10  2295  =

ce6e153f414a73 Andrzej Hajda    2016-10-10  2296  	ctx->dev =3D dev;
ce6e153f414a73 Andrzej Hajda    2016-10-10  2297  	mutex_init(&ctx->lock);
ce6e153f414a73 Andrzej Hajda    2016-10-10  2298  	INIT_LIST_HEAD(&ctx->mt_=
queue);
ce6e153f414a73 Andrzej Hajda    2016-10-10  2299  =

ce6e153f414a73 Andrzej Hajda    2016-10-10  2300  	ctx->clk_xtal =3D devm_c=
lk_get(dev, "xtal");
ce6e153f414a73 Andrzej Hajda    2016-10-10  2301  	if (IS_ERR(ctx->clk_xtal=
)) {
ce6e153f414a73 Andrzej Hajda    2016-10-10  2302  		dev_err(dev, "failed to=
 get xtal clock from DT\n");
ce6e153f414a73 Andrzej Hajda    2016-10-10  2303  		return PTR_ERR(ctx->clk=
_xtal);
ce6e153f414a73 Andrzej Hajda    2016-10-10  2304  	}
ce6e153f414a73 Andrzej Hajda    2016-10-10  2305  =

ce6e153f414a73 Andrzej Hajda    2016-10-10  2306  	if (!client->irq) {
ce6e153f414a73 Andrzej Hajda    2016-10-10  2307  		dev_err(dev, "no irq pr=
ovided\n");
ce6e153f414a73 Andrzej Hajda    2016-10-10  2308  		return -EINVAL;
ce6e153f414a73 Andrzej Hajda    2016-10-10  2309  	}
ce6e153f414a73 Andrzej Hajda    2016-10-10  2310  	irq_set_status_flags(cli=
ent->irq, IRQ_NOAUTOEN);
ce6e153f414a73 Andrzej Hajda    2016-10-10  2311  	ret =3D devm_request_thr=
eaded_irq(dev, client->irq, NULL,
ce6e153f414a73 Andrzej Hajda    2016-10-10  2312  					sii8620_irq_thread,
ce6e153f414a73 Andrzej Hajda    2016-10-10  2313  					IRQF_TRIGGER_HIGH | =
IRQF_ONESHOT,
ce6e153f414a73 Andrzej Hajda    2016-10-10  2314  					"sii8620", ctx);
e0ba12ea5e1329 Andrzej Hajda    2017-02-22  2315  	if (ret < 0) {
e0ba12ea5e1329 Andrzej Hajda    2017-02-22  2316  		dev_err(dev, "failed to=
 install IRQ handler\n");
e0ba12ea5e1329 Andrzej Hajda    2017-02-22  2317  		return ret;
e0ba12ea5e1329 Andrzej Hajda    2017-02-22  2318  	}
ce6e153f414a73 Andrzej Hajda    2016-10-10  2319  =

ce6e153f414a73 Andrzej Hajda    2016-10-10  2320  	ctx->gpio_reset =3D devm=
_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
ce6e153f414a73 Andrzej Hajda    2016-10-10  2321  	if (IS_ERR(ctx->gpio_res=
et)) {
ce6e153f414a73 Andrzej Hajda    2016-10-10  2322  		dev_err(dev, "failed to=
 get reset gpio from DT\n");
ce6e153f414a73 Andrzej Hajda    2016-10-10  2323  		return PTR_ERR(ctx->gpi=
o_reset);
ce6e153f414a73 Andrzej Hajda    2016-10-10  2324  	}
ce6e153f414a73 Andrzej Hajda    2016-10-10  2325  =

ce6e153f414a73 Andrzej Hajda    2016-10-10  2326  	ctx->supplies[0].supply =
=3D "cvcc10";
ce6e153f414a73 Andrzej Hajda    2016-10-10  2327  	ctx->supplies[1].supply =
=3D "iovcc18";
ce6e153f414a73 Andrzej Hajda    2016-10-10  2328  	ret =3D devm_regulator_b=
ulk_get(dev, 2, ctx->supplies);
ce6e153f414a73 Andrzej Hajda    2016-10-10  2329  	if (ret)
ce6e153f414a73 Andrzej Hajda    2016-10-10  2330  		return ret;
ce6e153f414a73 Andrzej Hajda    2016-10-10  2331  =

688838442147d9 Maciej Purski    2018-02-27  2332  	ret =3D sii8620_extcon_i=
nit(ctx);
688838442147d9 Maciej Purski    2018-02-27  2333  	if (ret < 0) {
688838442147d9 Maciej Purski    2018-02-27  2334  		dev_err(ctx->dev, "fail=
ed to initialize EXTCON\n");
688838442147d9 Maciej Purski    2018-02-27  2335  		return ret;
688838442147d9 Maciej Purski    2018-02-27  2336  	}
688838442147d9 Maciej Purski    2018-02-27  2337  =

ce6e153f414a73 Andrzej Hajda    2016-10-10  2338  	i2c_set_clientdata(clien=
t, ctx);
ce6e153f414a73 Andrzej Hajda    2016-10-10  2339  =

ce6e153f414a73 Andrzej Hajda    2016-10-10  2340  	ctx->bridge.funcs =3D &s=
ii8620_bridge_funcs;
ce6e153f414a73 Andrzej Hajda    2016-10-10  2341  	ctx->bridge.of_node =3D =
dev->of_node;
ce6e153f414a73 Andrzej Hajda    2016-10-10  2342  	drm_bridge_add(&ctx->bri=
dge);
ce6e153f414a73 Andrzej Hajda    2016-10-10  2343  =

688838442147d9 Maciej Purski    2018-02-27  2344  	if (!ctx->extcon)
ce6e153f414a73 Andrzej Hajda    2016-10-10  2345  		sii8620_cable_in(ctx);
ce6e153f414a73 Andrzej Hajda    2016-10-10  2346  =

ce6e153f414a73 Andrzej Hajda    2016-10-10  2347  	return 0;
ce6e153f414a73 Andrzej Hajda    2016-10-10  2348  }
ce6e153f414a73 Andrzej Hajda    2016-10-10  2349  =

ce6e153f414a73 Andrzej Hajda    2016-10-10  2350  static int sii8620_remove=
(struct i2c_client *client)
ce6e153f414a73 Andrzej Hajda    2016-10-10  2351  {
ce6e153f414a73 Andrzej Hajda    2016-10-10  2352  	struct sii8620 *ctx =3D =
i2c_get_clientdata(client);
ce6e153f414a73 Andrzej Hajda    2016-10-10  2353  =

688838442147d9 Maciej Purski    2018-02-27  2354  	if (ctx->extcon) {
688838442147d9 Maciej Purski    2018-02-27 @2355  		extcon_unregister_notif=
ier(ctx->extcon, EXTCON_DISP_MHL,
688838442147d9 Maciej Purski    2018-02-27  2356  					   &ctx->extcon_nb);
688838442147d9 Maciej Purski    2018-02-27  2357  		flush_work(&ctx->extcon=
_wq);
688838442147d9 Maciej Purski    2018-02-27  2358  		if (ctx->cable_state > =
0)
688838442147d9 Maciej Purski    2018-02-27  2359  			sii8620_cable_out(ctx);
688838442147d9 Maciej Purski    2018-02-27  2360  	} else {
688838442147d9 Maciej Purski    2018-02-27  2361  		sii8620_cable_out(ctx);
688838442147d9 Maciej Purski    2018-02-27  2362  	}
e25f1f7c94e16d Maciej Purski    2017-08-24  2363  	drm_bridge_remove(&ctx->=
bridge);
ce6e153f414a73 Andrzej Hajda    2016-10-10  2364  =

ce6e153f414a73 Andrzej Hajda    2016-10-10  2365  	return 0;
ce6e153f414a73 Andrzej Hajda    2016-10-10  2366  }
ce6e153f414a73 Andrzej Hajda    2016-10-10  2367  =


:::::: The code at line 2355 was first introduced by commit
:::::: 688838442147d9dd94c2ef7c2c31a35cf150c5fa drm/bridge/sii8620: use mic=
ro-USB cable detection logic to detect MHL

:::::: TO: Maciej Purski <m.purski@samsung.com>
:::::: CC: Chanwoo Choi <cw00.choi@samsung.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8511888292274585955==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
Y3X/kbOv3xj2dhQo7gEA
--===============8511888292274585955==--

