Content-Type: multipart/mixed; boundary="===============3622962942453714930=="
MIME-Version: 1.0
From: Amit Kucheria <amit.kucheria@linaro.org>
To: kbuild-all@lists.01.org
Subject: Re: [thermal:next 43/50] drivers/thermal/qcom/tsens.c:385:13: warning: no previous prototype for 'tsens_critical_irq_thread'
Date: Wed, 27 May 2020 17:13:01 +0530
Message-ID: <CAP245DWLTAeO3rgm3_kfxH3si=h2T_Lk4GaZZYQ2GoKfRwFxhA@mail.gmail.com>
In-Reply-To: <202005271809.13hDHP8D%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3622962942453714930==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2020 at 4:08 PM kbuild test robot <lkp@intel.com> wrote:
>
> tree:   thermal/next
> head:   4d14235baa2b4aa64aed40805dd3db47dbc6f3b3
> commit: a7ff82976122eb6d1fd286dc34f09b6ecd756b60 [43/50] drivers: thermal=
: tsens: Merge tsens-common.c into tsens.c
> config: arm64-allyesconfig (attached as .config)
> compiler: aarch64-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout a7ff82976122eb6d1fd286dc34f09b6ecd756b60
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Darm64
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>
> >> drivers/thermal/qcom/tsens.c:385:13: warning: no previous prototype fo=
r 'tsens_critical_irq_thread' [-Wmissing-prototypes]
> 385 | irqreturn_t tsens_critical_irq_thread(int irq, void *data)
> |             ^~~~~~~~~~~~~~~~~~~~~~~~~
> >> drivers/thermal/qcom/tsens.c:455:13: warning: no previous prototype fo=
r 'tsens_irq_thread' [-Wmissing-prototypes]
> 455 | irqreturn_t tsens_irq_thread(int irq, void *data)
> |             ^~~~~~~~~~~~~~~~
> >> drivers/thermal/qcom/tsens.c:523:5: warning: no previous prototype for=
 'tsens_set_trips' [-Wmissing-prototypes]
> 523 | int tsens_set_trips(void *_sensor, int low, int high)
> |     ^~~~~~~~~~~~~~~
> >> drivers/thermal/qcom/tsens.c:560:5: warning: no previous prototype for=
 'tsens_enable_irq' [-Wmissing-prototypes]
> 560 | int tsens_enable_irq(struct tsens_priv *priv)
> |     ^~~~~~~~~~~~~~~~
> >> drivers/thermal/qcom/tsens.c:573:6: warning: no previous prototype for=
 'tsens_disable_irq' [-Wmissing-prototypes]
> 573 | void tsens_disable_irq(struct tsens_priv *priv)
> |      ^~~~~~~~~~~~~~~~~

I guess all these functions can now be marked static. Here is a patch
that does that.

Daniel, would you prefer this be a separate patch or do you want fold
this into the original patch merging tsens-common.c into tsens.c?

Regards,
Amit


> vim +/tsens_critical_irq_thread +385 drivers/thermal/qcom/tsens.c
>
>    369
>    370  /**
>    371   * tsens_critical_irq_thread() - Threaded handler for critical in=
terrupts
>    372   * @irq: irq number
>    373   * @data: tsens controller private data
>    374   *
>    375   * Check FSM watchdog bark status and clear if needed.
>    376   * Check all sensors to find ones that violated their critical th=
reshold limits.
>    377   * Clear and then re-enable the interrupt.
>    378   *
>    379   * The level-triggered interrupt might deassert if the temperatur=
e returned to
>    380   * within the threshold limits by the time the handler got schedu=
led. We
>    381   * consider the irq to have been handled in that case.
>    382   *
>    383   * Return: IRQ_HANDLED
>    384   */
>  > 385  irqreturn_t tsens_critical_irq_thread(int irq, void *data)
>    386  {
>    387          struct tsens_priv *priv =3D data;
>    388          struct tsens_irq_data d;
>    389          int temp, ret, i;
>    390          u32 wdog_status, wdog_count;
>    391
>    392          if (priv->feat->has_watchdog) {
>    393                  ret =3D regmap_field_read(priv->rf[WDOG_BARK_STAT=
US],
>    394                                          &wdog_status);
>    395                  if (ret)
>    396                          return ret;
>    397
>    398                  if (wdog_status) {
>    399                          /* Clear WDOG interrupt */
>    400                          regmap_field_write(priv->rf[WDOG_BARK_CLE=
AR], 1);
>    401                          regmap_field_write(priv->rf[WDOG_BARK_CLE=
AR], 0);
>    402                          ret =3D regmap_field_read(priv->rf[WDOG_B=
ARK_COUNT],
>    403                                                  &wdog_count);
>    404                          if (ret)
>    405                                  return ret;
>    406                          if (wdog_count)
>    407                                  dev_dbg(priv->dev, "%s: watchdog =
count: %d\n",
>    408                                          __func__, wdog_count);
>    409
>    410                          /* Fall through to handle critical interr=
upts if any */
>    411                  }
>    412          }
>    413
>    414          for (i =3D 0; i < priv->num_sensors; i++) {
>    415                  const struct tsens_sensor *s =3D &priv->sensor[i];
>    416                  u32 hw_id =3D s->hw_id;
>    417
>    418                  if (IS_ERR(s->tzd))
>    419                          continue;
>    420                  if (!tsens_threshold_violated(priv, hw_id, &d))
>    421                          continue;
>    422                  ret =3D get_temp_tsens_valid(s, &temp);
>    423                  if (ret) {
>    424                          dev_err(priv->dev, "[%u] %s: error readin=
g sensor\n",
>    425                                  hw_id, __func__);
>    426                          continue;
>    427                  }
>    428
>    429                  tsens_read_irq_state(priv, hw_id, s, &d);
>    430                  if (d.crit_viol &&
>    431                      !masked_irq(hw_id, d.crit_irq_mask, tsens_ver=
sion(priv))) {
>    432                          /* Mask critical interrupts, unused on Li=
nux */
>    433                          tsens_set_interrupt(priv, hw_id, CRITICAL=
, false);
>    434                  }
>    435          }
>    436
>    437          return IRQ_HANDLED;
>    438  }
>    439
>    440  /**
>    441   * tsens_irq_thread - Threaded interrupt handler for uplow interr=
upts
>    442   * @irq: irq number
>    443   * @data: tsens controller private data
>    444   *
>    445   * Check all sensors to find ones that violated their threshold l=
imits. If the
>    446   * temperature is still outside the limits, call thermal_zone_dev=
ice_update() to
>    447   * update the thresholds, else re-enable the interrupts.
>    448   *
>    449   * The level-triggered interrupt might deassert if the temperatur=
e returned to
>    450   * within the threshold limits by the time the handler got schedu=
led. We
>    451   * consider the irq to have been handled in that case.
>    452   *
>    453   * Return: IRQ_HANDLED
>    454   */
>  > 455  irqreturn_t tsens_irq_thread(int irq, void *data)
>    456  {
>    457          struct tsens_priv *priv =3D data;
>    458          struct tsens_irq_data d;
>    459          bool enable =3D true, disable =3D false;
>    460          unsigned long flags;
>    461          int temp, ret, i;
>    462
>    463          for (i =3D 0; i < priv->num_sensors; i++) {
>    464                  bool trigger =3D false;
>    465                  const struct tsens_sensor *s =3D &priv->sensor[i];
>    466                  u32 hw_id =3D s->hw_id;
>    467
>    468                  if (IS_ERR(s->tzd))
>    469                          continue;
>    470                  if (!tsens_threshold_violated(priv, hw_id, &d))
>    471                          continue;
>    472                  ret =3D get_temp_tsens_valid(s, &temp);
>    473                  if (ret) {
>    474                          dev_err(priv->dev, "[%u] %s: error readin=
g sensor\n",
>    475                                  hw_id, __func__);
>    476                          continue;
>    477                  }
>    478
>    479                  spin_lock_irqsave(&priv->ul_lock, flags);
>    480
>    481                  tsens_read_irq_state(priv, hw_id, s, &d);
>    482
>    483                  if (d.up_viol &&
>    484                      !masked_irq(hw_id, d.up_irq_mask, tsens_versi=
on(priv))) {
>    485                          tsens_set_interrupt(priv, hw_id, UPPER, d=
isable);
>    486                          if (d.up_thresh > temp) {
>    487                                  dev_dbg(priv->dev, "[%u] %s: re-a=
rm upper\n",
>    488                                          hw_id, __func__);
>    489                                  tsens_set_interrupt(priv, hw_id, =
UPPER, enable);
>    490                          } else {
>    491                                  trigger =3D true;
>    492                                  /* Keep irq masked */
>    493                          }
>    494                  } else if (d.low_viol &&
>    495                             !masked_irq(hw_id, d.low_irq_mask, tse=
ns_version(priv))) {
>    496                          tsens_set_interrupt(priv, hw_id, LOWER, d=
isable);
>    497                          if (d.low_thresh < temp) {
>    498                                  dev_dbg(priv->dev, "[%u] %s: re-a=
rm low\n",
>    499                                          hw_id, __func__);
>    500                                  tsens_set_interrupt(priv, hw_id, =
LOWER, enable);
>    501                          } else {
>    502                                  trigger =3D true;
>    503                                  /* Keep irq masked */
>    504                          }
>    505                  }
>    506
>    507                  spin_unlock_irqrestore(&priv->ul_lock, flags);
>    508
>    509                  if (trigger) {
>    510                          dev_dbg(priv->dev, "[%u] %s: TZ update tr=
igger (%d mC)\n",
>    511                                  hw_id, __func__, temp);
>    512                          thermal_zone_device_update(s->tzd,
>    513                                                     THERMAL_EVENT_=
UNSPECIFIED);
>    514                  } else {
>    515                          dev_dbg(priv->dev, "[%u] %s: no violation=
:  %d\n",
>    516                                  hw_id, __func__, temp);
>    517                  }
>    518          }
>    519
>    520          return IRQ_HANDLED;
>    521  }
>    522
>  > 523  int tsens_set_trips(void *_sensor, int low, int high)
>    524  {
>    525          struct tsens_sensor *s =3D _sensor;
>    526          struct tsens_priv *priv =3D s->priv;
>    527          struct device *dev =3D priv->dev;
>    528          struct tsens_irq_data d;
>    529          unsigned long flags;
>    530          int high_val, low_val, cl_high, cl_low;
>    531          u32 hw_id =3D s->hw_id;
>    532
>    533          dev_dbg(dev, "[%u] %s: proposed thresholds: (%d:%d)\n",
>    534                  hw_id, __func__, low, high);
>    535
>    536          cl_high =3D clamp_val(high, -40000, 120000);
>    537          cl_low  =3D clamp_val(low, -40000, 120000);
>    538
>    539          high_val =3D tsens_mC_to_hw(s, cl_high);
>    540          low_val  =3D tsens_mC_to_hw(s, cl_low);
>    541
>    542          spin_lock_irqsave(&priv->ul_lock, flags);
>    543
>    544          tsens_read_irq_state(priv, hw_id, s, &d);
>    545
>    546          /* Write the new thresholds and clear the status */
>    547          regmap_field_write(priv->rf[LOW_THRESH_0 + hw_id], low_va=
l);
>    548          regmap_field_write(priv->rf[UP_THRESH_0 + hw_id], high_va=
l);
>    549          tsens_set_interrupt(priv, hw_id, LOWER, true);
>    550          tsens_set_interrupt(priv, hw_id, UPPER, true);
>    551
>    552          spin_unlock_irqrestore(&priv->ul_lock, flags);
>    553
>    554          dev_dbg(dev, "[%u] %s: (%d:%d)->(%d:%d)\n",
>    555                  hw_id, __func__, d.low_thresh, d.up_thresh, cl_lo=
w, cl_high);
>    556
>    557          return 0;
>    558  }
>    559
>  > 560  int tsens_enable_irq(struct tsens_priv *priv)
>    561  {
>    562          int ret;
>    563          int val =3D tsens_version(priv) > VER_1_X ? 7 : 1;
>    564
>    565          ret =3D regmap_field_write(priv->rf[INT_EN], val);
>    566          if (ret < 0)
>    567                  dev_err(priv->dev, "%s: failed to enable interrup=
ts\n",
>    568                          __func__);
>    569
>    570          return ret;
>    571  }
>    572
>  > 573  void tsens_disable_irq(struct tsens_priv *priv)
>    574  {
>    575          regmap_field_write(priv->rf[INT_EN], 0);
>    576  }
>    577
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3622962942453714930==
Content-Type: text/x-patch
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-drivers-thermal-tsens-Mark-functions-static.patch"

RnJvbSA2NzU3YTI2ODc2YjI5OTIyOTI5YWJmNjRiMWMxMWZhM2IzMDMzZDAzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpNZXNzYWdlLUlkOiA8Njc1N2EyNjg3NmIyOTkyMjkyOWFiZjY0YjFjMTFm
YTNiMzAzM2QwMy4xNTkwNTc5NzA5LmdpdC5hbWl0Lmt1Y2hlcmlhQGxpbmFyby5vcmc+CkZyb206
IEFtaXQgS3VjaGVyaWEgPGFtaXQua3VjaGVyaWFAbGluYXJvLm9yZz4KRGF0ZTogV2VkLCAyNyBN
YXkgMjAyMCAxNjozODo0NiArMDUzMApTdWJqZWN0OiBbUEFUQ0hdIGRyaXZlcnM6IHRoZXJtYWw6
IHRzZW5zOiBNYXJrIGZ1bmN0aW9ucyBzdGF0aWMKCkFmdGVyIG1lcmdpbmcgdHNlbnMtY29tbW9u
LmMgaW50byB0c2Vucy5jLCB3ZSBjYW4gbm93IG1hcmsgc29tZQpmdW5jdGlvbnMgc3RhdGljIHNv
IHRoZXkgZG9uJ3QgbmVlZCBhbnkgcHJvdG90eXBlIGRlY2xhcmF0aW9ucy4gVGhpcwpmaXhlcyB0
aGUgZm9sbG93aW5nIGlzc3VlIHJlcG9ydGVkIGJ5IGxrcC4KCj4+IGRyaXZlcnMvdGhlcm1hbC9x
Y29tL3RzZW5zLmM6Mzg1OjEzOiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yICd0
c2Vuc19jcml0aWNhbF9pcnFfdGhyZWFkJyBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCjM4NSB8IGly
cXJldHVybl90IHRzZW5zX2NyaXRpY2FsX2lycV90aHJlYWQoaW50IGlycSwgdm9pZCAqZGF0YSkK
fCAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4+IGRyaXZlcnMvdGhlcm1h
bC9xY29tL3RzZW5zLmM6NDU1OjEzOiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9y
ICd0c2Vuc19pcnFfdGhyZWFkJyBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCjQ1NSB8IGlycXJldHVy
bl90IHRzZW5zX2lycV90aHJlYWQoaW50IGlycSwgdm9pZCAqZGF0YSkKfCAgICAgICAgICAgICBe
fn5+fn5+fn5+fn5+fn5+Cj4+IGRyaXZlcnMvdGhlcm1hbC9xY29tL3RzZW5zLmM6NTIzOjU6IHdh
cm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3IgJ3RzZW5zX3NldF90cmlwcycgWy1XbWlz
c2luZy1wcm90b3R5cGVzXQo1MjMgfCBpbnQgdHNlbnNfc2V0X3RyaXBzKHZvaWQgKl9zZW5zb3Is
IGludCBsb3csIGludCBoaWdoKQp8ICAgICBefn5+fn5+fn5+fn5+fn4KPj4gZHJpdmVycy90aGVy
bWFsL3Fjb20vdHNlbnMuYzo1NjA6NTogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZv
ciAndHNlbnNfZW5hYmxlX2lycScgWy1XbWlzc2luZy1wcm90b3R5cGVzXQo1NjAgfCBpbnQgdHNl
bnNfZW5hYmxlX2lycShzdHJ1Y3QgdHNlbnNfcHJpdiAqcHJpdikKfCAgICAgXn5+fn5+fn5+fn5+
fn5+fgo+PiBkcml2ZXJzL3RoZXJtYWwvcWNvbS90c2Vucy5jOjU3Mzo2OiB3YXJuaW5nOiBubyBw
cmV2aW91cyBwcm90b3R5cGUgZm9yICd0c2Vuc19kaXNhYmxlX2lycScgWy1XbWlzc2luZy1wcm90
b3R5cGVzXQo1NzMgfCB2b2lkIHRzZW5zX2Rpc2FibGVfaXJxKHN0cnVjdCB0c2Vuc19wcml2ICpw
cml2KQp8ICAgICAgXn5+fn5+fn5+fn5+fn5+fn4KClNpZ25lZC1vZmYtYnk6IEFtaXQgS3VjaGVy
aWEgPGFtaXQua3VjaGVyaWFAbGluYXJvLm9yZz4KUmVwb3J0ZWQtYnk6IGtidWlsZCB0ZXN0IHJv
Ym90IDxsa3BAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvdGhlcm1hbC9xY29tL3RzZW5zLmMgfCAx
MCArKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdGhlcm1hbC9xY29tL3RzZW5zLmMgYi9kcml2ZXJz
L3RoZXJtYWwvcWNvbS90c2Vucy5jCmluZGV4IDhkM2U5NGQyYTllZDQuLjM5YzQ0NjJlMzhmNjIg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdGhlcm1hbC9xY29tL3RzZW5zLmMKKysrIGIvZHJpdmVycy90
aGVybWFsL3Fjb20vdHNlbnMuYwpAQCAtMzgyLDcgKzM4Miw3IEBAIHN0YXRpYyBpbmxpbmUgdTMy
IG1hc2tlZF9pcnEodTMyIGh3X2lkLCB1MzIgbWFzaywgZW51bSB0c2Vuc192ZXIgdmVyKQogICoK
ICAqIFJldHVybjogSVJRX0hBTkRMRUQKICAqLwotaXJxcmV0dXJuX3QgdHNlbnNfY3JpdGljYWxf
aXJxX3RocmVhZChpbnQgaXJxLCB2b2lkICpkYXRhKQorc3RhdGljIGlycXJldHVybl90IHRzZW5z
X2NyaXRpY2FsX2lycV90aHJlYWQoaW50IGlycSwgdm9pZCAqZGF0YSkKIHsKIAlzdHJ1Y3QgdHNl
bnNfcHJpdiAqcHJpdiA9IGRhdGE7CiAJc3RydWN0IHRzZW5zX2lycV9kYXRhIGQ7CkBAIC00NTIs
NyArNDUyLDcgQEAgaXJxcmV0dXJuX3QgdHNlbnNfY3JpdGljYWxfaXJxX3RocmVhZChpbnQgaXJx
LCB2b2lkICpkYXRhKQogICoKICAqIFJldHVybjogSVJRX0hBTkRMRUQKICAqLwotaXJxcmV0dXJu
X3QgdHNlbnNfaXJxX3RocmVhZChpbnQgaXJxLCB2b2lkICpkYXRhKQorc3RhdGljIGlycXJldHVy
bl90IHRzZW5zX2lycV90aHJlYWQoaW50IGlycSwgdm9pZCAqZGF0YSkKIHsKIAlzdHJ1Y3QgdHNl
bnNfcHJpdiAqcHJpdiA9IGRhdGE7CiAJc3RydWN0IHRzZW5zX2lycV9kYXRhIGQ7CkBAIC01MjAs
NyArNTIwLDcgQEAgaXJxcmV0dXJuX3QgdHNlbnNfaXJxX3RocmVhZChpbnQgaXJxLCB2b2lkICpk
YXRhKQogCXJldHVybiBJUlFfSEFORExFRDsKIH0KIAotaW50IHRzZW5zX3NldF90cmlwcyh2b2lk
ICpfc2Vuc29yLCBpbnQgbG93LCBpbnQgaGlnaCkKK3N0YXRpYyBpbnQgdHNlbnNfc2V0X3RyaXBz
KHZvaWQgKl9zZW5zb3IsIGludCBsb3csIGludCBoaWdoKQogewogCXN0cnVjdCB0c2Vuc19zZW5z
b3IgKnMgPSBfc2Vuc29yOwogCXN0cnVjdCB0c2Vuc19wcml2ICpwcml2ID0gcy0+cHJpdjsKQEAg
LTU1Nyw3ICs1NTcsNyBAQCBpbnQgdHNlbnNfc2V0X3RyaXBzKHZvaWQgKl9zZW5zb3IsIGludCBs
b3csIGludCBoaWdoKQogCXJldHVybiAwOwogfQogCi1pbnQgdHNlbnNfZW5hYmxlX2lycShzdHJ1
Y3QgdHNlbnNfcHJpdiAqcHJpdikKK3N0YXRpYyBpbnQgdHNlbnNfZW5hYmxlX2lycShzdHJ1Y3Qg
dHNlbnNfcHJpdiAqcHJpdikKIHsKIAlpbnQgcmV0OwogCWludCB2YWwgPSB0c2Vuc192ZXJzaW9u
KHByaXYpID4gVkVSXzFfWCA/IDcgOiAxOwpAQCAtNTcwLDcgKzU3MCw3IEBAIGludCB0c2Vuc19l
bmFibGVfaXJxKHN0cnVjdCB0c2Vuc19wcml2ICpwcml2KQogCXJldHVybiByZXQ7CiB9CiAKLXZv
aWQgdHNlbnNfZGlzYWJsZV9pcnEoc3RydWN0IHRzZW5zX3ByaXYgKnByaXYpCitzdGF0aWMgdm9p
ZCB0c2Vuc19kaXNhYmxlX2lycShzdHJ1Y3QgdHNlbnNfcHJpdiAqcHJpdikKIHsKIAlyZWdtYXBf
ZmllbGRfd3JpdGUocHJpdi0+cmZbSU5UX0VOXSwgMCk7CiB9Ci0tIAoyLjIwLjEKCg==

--===============3622962942453714930==--

