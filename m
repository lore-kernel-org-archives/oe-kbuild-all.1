Content-Type: multipart/mixed; boundary="===============1251201540010872081=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v4 3/4] nvmem: increase the reference count of a gpio passed over config
Date: Sat, 22 Feb 2020 19:54:09 +0800
Message-ID: <202002221921.euxJGwes%lkp@intel.com>
In-Reply-To: <20200220100141.5905-4-brgl@bgdev.pl>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1251201540010872081==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

I love your patch! Yet something to improve:

[auto build test ERROR on next-20200221]
[also build test ERROR on v5.6-rc2]
[cannot apply to gpio/for-next linus/master v5.6-rc2 v5.6-rc1 v5.5]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Bartosz-Golaszewski/nvmem-=
gpio-fix-resource-management/20200222-054341
base:    bee46b309a13ca158c99c325d0408fb2f0db207f
config: sparc-defconfig (attached as .config)
compiler: sparc-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=3D7.5.0 make.cross ARCH=3Dsparc =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/nvmem/core.c: In function 'nvmem_register':
>> drivers/nvmem/core.c:352:20: error: implicit declaration of function 'gp=
iod_ref'; did you mean 'gpiod_get'? [-Werror=3Dimplicit-function-declaratio=
n]
      nvmem->wp_gpio =3D gpiod_ref(config->wp_gpio);
                       ^~~~~~~~~
                       gpiod_get
   drivers/nvmem/core.c:352:18: warning: assignment makes pointer from inte=
ger without a cast [-Wint-conversion]
      nvmem->wp_gpio =3D gpiod_ref(config->wp_gpio);
                     ^
   cc1: some warnings being treated as errors

vim +352 drivers/nvmem/core.c

   322	=

   323	/**
   324	 * nvmem_register() - Register a nvmem device for given nvmem_config.
   325	 * Also creates an binary entry in /sys/bus/nvmem/devices/dev-name/n=
vmem
   326	 *
   327	 * @config: nvmem device configuration with which nvmem device is cr=
eated.
   328	 *
   329	 * Return: Will be an ERR_PTR() on error or a valid pointer to nvmem=
_device
   330	 * on success.
   331	 */
   332	=

   333	struct nvmem_device *nvmem_register(const struct nvmem_config *confi=
g)
   334	{
   335		struct nvmem_device *nvmem;
   336		int rval;
   337	=

   338		if (!config->dev)
   339			return ERR_PTR(-EINVAL);
   340	=

   341		nvmem =3D kzalloc(sizeof(*nvmem), GFP_KERNEL);
   342		if (!nvmem)
   343			return ERR_PTR(-ENOMEM);
   344	=

   345		rval  =3D ida_simple_get(&nvmem_ida, 0, 0, GFP_KERNEL);
   346		if (rval < 0) {
   347			kfree(nvmem);
   348			return ERR_PTR(rval);
   349		}
   350	=

   351		if (config->wp_gpio)
 > 352			nvmem->wp_gpio =3D gpiod_ref(config->wp_gpio);
   353		else
   354			nvmem->wp_gpio =3D gpiod_get_optional(config->dev, "wp",
   355							    GPIOD_OUT_HIGH);
   356		if (IS_ERR(nvmem->wp_gpio)) {
   357			ida_simple_remove(&nvmem_ida, nvmem->id);
   358			kfree(nvmem);
   359			return ERR_CAST(nvmem->wp_gpio);
   360		}
   361	=

   362		kref_init(&nvmem->refcnt);
   363		INIT_LIST_HEAD(&nvmem->cells);
   364	=

   365		nvmem->id =3D rval;
   366		nvmem->owner =3D config->owner;
   367		if (!nvmem->owner && config->dev->driver)
   368			nvmem->owner =3D config->dev->driver->owner;
   369		nvmem->stride =3D config->stride ?: 1;
   370		nvmem->word_size =3D config->word_size ?: 1;
   371		nvmem->size =3D config->size;
   372		nvmem->dev.type =3D &nvmem_provider_type;
   373		nvmem->dev.bus =3D &nvmem_bus_type;
   374		nvmem->dev.parent =3D config->dev;
   375		nvmem->priv =3D config->priv;
   376		nvmem->type =3D config->type;
   377		nvmem->reg_read =3D config->reg_read;
   378		nvmem->reg_write =3D config->reg_write;
   379		if (!config->no_of_node)
   380			nvmem->dev.of_node =3D config->dev->of_node;
   381	=

   382		if (config->id =3D=3D -1 && config->name) {
   383			dev_set_name(&nvmem->dev, "%s", config->name);
   384		} else {
   385			dev_set_name(&nvmem->dev, "%s%d",
   386				     config->name ? : "nvmem",
   387				     config->name ? config->id : nvmem->id);
   388		}
   389	=

   390		nvmem->read_only =3D device_property_present(config->dev, "read-onl=
y") ||
   391				   config->read_only || !nvmem->reg_write;
   392	=

   393		nvmem->dev.groups =3D nvmem_sysfs_get_groups(nvmem, config);
   394	=

   395		device_initialize(&nvmem->dev);
   396	=

   397		dev_dbg(&nvmem->dev, "Registering nvmem device %s\n", config->name);
   398	=

   399		rval =3D device_add(&nvmem->dev);
   400		if (rval)
   401			goto err_put_device;
   402	=

   403		if (config->compat) {
   404			rval =3D nvmem_sysfs_setup_compat(nvmem, config);
   405			if (rval)
   406				goto err_device_del;
   407		}
   408	=

   409		if (config->cells) {
   410			rval =3D nvmem_add_cells(nvmem, config->cells, config->ncells);
   411			if (rval)
   412				goto err_teardown_compat;
   413		}
   414	=

   415		rval =3D nvmem_add_cells_from_table(nvmem);
   416		if (rval)
   417			goto err_remove_cells;
   418	=

   419		rval =3D nvmem_add_cells_from_of(nvmem);
   420		if (rval)
   421			goto err_remove_cells;
   422	=

   423		blocking_notifier_call_chain(&nvmem_notifier, NVMEM_ADD, nvmem);
   424	=

   425		return nvmem;
   426	=

   427	err_remove_cells:
   428		nvmem_device_remove_all_cells(nvmem);
   429	err_teardown_compat:
   430		if (config->compat)
   431			nvmem_sysfs_remove_compat(nvmem, config);
   432	err_device_del:
   433		device_del(&nvmem->dev);
   434	err_put_device:
   435		put_device(&nvmem->dev);
   436	=

   437		return ERR_PTR(rval);
   438	}
   439	EXPORT_SYMBOL_GPL(nvmem_register);
   440	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1251201540010872081==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICGYQUV4AAy5jb25maWcAnDzbcuO2ku/5ClZStTWpOjPHlmyPvVt+gECQQkQSNADq4heWx9ZM
VPFtJfkk+fttgKQEUA0ptanMjIluAA10o6+Af/npl4h8bN9eHrarx4fn57+jH8vX5fphu3yKvq+e
l/8TxSIqhI5YzPUXQM5Wrx9//Xvz/rB+jC6/XH05+7x+HEST5fp1+RzRt9fvqx8f0H319vrTLz/B
/79A48s7jLT+78j2+vxsRvj84/Ex+pRS+mv09cvllzPApKJIeFpTWnNVA+T2764JPuopk4qL4vbr
2eXZ2Q43I0W6A505Q4yJqonK61RosR/IAfAi4wU7AM2ILOqcLEasrgpecM1Jxu9ZvEfk8q6eCTmB
Fru81O7Xc7RZbj/e98sYSTFhRS2KWuWl0xuGrFkxrYlM64znXN8OB2aTWipEXvKM1ZopHa020evb
1gzc9c4EJVm33J9/xpprUrkrHlU8i2tFMu3gxywhVabrsVC6IDm7/fnT69vr8tcdgpoRh2a1UFNe
0oMG8y/V2b69FIrP6/yuYhXDW/dddkueEU3HtYUiK6ZSKFXnLBdyUROtCR3vR64Uy/jIHYxUIKbu
MJZFwLJo8/Ft8/dmu3zZsyhlBZOcWo6qsZjZgZavT9Hb916Xfg8KOz5hU1Zo1YmBXr0s1xtsmvF9
XUIvEXPqkloIA+Fx5i3bB6OQMU/HtWSq1jwHnvs4LfkH1OyYIRnLSw3DW+HfDdq1T0VWFZrIBTp1
i3WwwbSs/q0fNn9EW5g3egAaNtuH7SZ6eHx8+3jdrl5/7LdDczqpoUNNKBUwFy9Sl5CRimEaQRmw
HTA0SocmaqI00QqnUnF0U/4BlXY1klaROuQjULqoAeZSC581mwN7sdOqGmS3u+r6tyT5U+3H5ZPm
B3R9fDJmJO6xfqcKzJlPQJ55om/PL/Z854WegCJIWB9n2KxaPf6+fPoAPR19Xz5sP9bLjW1uCUWg
jtZKpahKjByjXVRJgJvOqdWqLpxvo0ns9248ONcSmpDxSh57fQume33pmNFJKWC15oxoIfHjpQAv
trrS0o7jLFSiQFmC1FOiWYwiSZaRBULpKJtA16lV+DL2DYAkOQysRCUpc9SyjOv0njuKFxpG0DDw
WrL7nHgN8/seXPS+LxxzIISum5890ydKUCZg5+pESKOt4J+cFNRTEX00BT9gUt8zCmMyBVvK4/Mr
z4AADpwcymBEMFqwJdQxGaMycWcOnrDesDkYNW6Ex5kpZToHbWGnJFnm0WCY0G9OxqQAndw3X42u
dVrteXLtrLOhLEtgk6W7IKJg0ypvokqzee8T5NsZpRQevTwtSJY4omRpchusRXIb1Bgs5/6TcEc0
uKgr2SjfDhxPuWLdljiLhUFGRErubuzEoCxy7+x1bTX8i3BrB7a7YQ6O5lNPxIDv3fToYTO8ta5L
gh9GoJPFsX9SrRZr/dNyuf7+tn55eH1cRuw/y1dQ/gT0GzXqH+ylq/D+YY9ubdO82f3a2jRPVIxP
RzQ4hI64qIx4fovKqhF2lgANdl+mrPPZ/E4ATcAkZ1yBtgO5FTmuyMZVkoBXWRIYCPYW3EVQjAEL
LxIOnnGKWlDf1933uroYcdQClkS6fqP5HDrqDD7H1trXE3NewO2da2fjwEkYGa4WMSeF08s4ebav
I6K5Y2qNh+QJ/j14O3Xs6s2d76eIDyhTTUawVxmwE85AaxzL9dvjcrN5W0fbv98b38Gzkt0Cc9yS
gKN3fnaGbBAABpdnLlOhZeij9kbBh7mFYfprG88YbIQ+XDScLz6SYNJAqsB69fgB0U+jtMEuJ7HD
Pgb61djBmublnI4dzQHmgDLoOLc7LSQ4J8av6HalKuoy9yTXCAJscYzJDJBIMmOklMgY1ksUqHAe
45Fl0uhjE729m9B0E30qKY+W28cvv+4dPDWqnGNrvuiYOCoPulDzl4MDKxMlK0CEwaLfvuyJCcxl
6chXm8c2jrZLip7Wq/806gcZF3T2i+v5xmAW4KSo87NBXVEtM3QzgnN4MSuE47+vtstHs0mfn5bv
0BlUXEe4E5NLosY9k2ZFRDT6ot9s5cja9LEQk0MBhHNiI59ajyW4sj0BHA5Am9QiSWrdHxcC91zE
bairev1mBPSv8SZhwWBguji5H+JD4AAeohSaUdCCXSTU6RERVxnEVmBprBk3VqpHBJsDdX3CRRzX
UhsjTaj2ZhUm/uapqhQwND5o76O31qLZA2PhfX0IYSFLEk65sTVJsgs/Uyqmn789bJZP0R+N5Xpf
v31fPTeh116BH0HbiXlWpbywyQFKjXt6oP5PiM3O+dTgkYFKd51/a/pVblyus96eu0e9aWr1SiYI
pihanKow8GDnBozqU0eSQnAzDsRsu9xKwC/pMAMBWws2rIWY5OhkxjrP6pwrBTZ4Hz7VPC+FDMS7
VQHSCsK0yEciw1G05HmHNzE+GBqxCOp6tBDAKKo4HIG7CiIpz09rg5uRwhfswMHSHEUBN5qlkms8
4dBhGbOCM9Fg0Dw2ybzm3ON+jUGbjfBsgl0pbIwoSXbgOZYP6+3KyHWkwap41h6m09yGL+A5m2gJ
lVIVC7VH9W0H0swS7jXvzVuPEJdP+V1rl5p0l9iH644SByQumrg3Bt3lpz8d4GQxso7+Pt/QAkbJ
HWpr/Pn2ga7liSpBl5hDSCcm0eYGwhZu1GgLPwZD+85Ablioswtse9vdYX8tHz+2D9+elzbBHVn3
fuvs04gXSa6N9vciOt/6WXc1rsCOdclUYy3avIxziJqxFJW81AfNcMwpGHdnSDOiy/QQsY0fsXx5
W/8d5Q+vDz+WL6jhTsBh8zxh0wBGJGYmqAOPzU3zlhmYnFLbDQNbo24vPKNEdxK5k//U8Mgopl7A
0AkVT8HL9MR7BOGRn1aYqBzp2u1qDiTCOOaIxfL24uzmap/6AZEsmbRmceK5lzRjcBwJCC163hMp
Cm1S3CiU5gRtvy+FwLX//ajCddO9NXSC4lm8uIvIjKM0OQi5uk1m0iwwnO1Mq7IesYKOcyInuC8Y
lBMnjebIwWQEPo5mRedjWWErlts/39Z/gKNwKGUgGxOmfdEwLTXEbZhcVAV3Mh/mC06Ix0Hb1u+9
t2YZZr/miXQE3XyBNU1Fr8mmhxyH2jYaIyQTsLPodBZFVaMaPG9OcUNlcRp5PzYIcBFidU5D9Bv3
Vbj1IpPgnLCFS3HbhM2204A+N3jZpMYoUbgFBITOhNVSgM8msVHLuizcUpb9ruMxLXuTmWaTacQP
WIsgicThZn285MeAqVG+EI7OsZSzxah1VRTMKzSpRQGKTEw4ww9S03GqeRCaiOoYbD8txl7DlJqM
XTsFDeDeeZvXtpnoJ+i3dkggtbQMzdQXJNtoRWy3My4EbTQHsI9Hy67Zp6eKy/CBtRiSzE5gGCjw
VWkp8FNmZocf02MO1w6HViPuZC86i9LBb39+/Pi2evzZHz2PL3te/E5qp1e+mE+v2rNiymJJQNQB
qUmam1Nfx2ggY9Z+ZUTjxW8xsvHib9FVSDg8nJb3Lz1Ccl5eBfu4otGjY9fqD9c7KS5IcX2wV9BW
X0mUaAMuYnCGrGeiFyVztcw0SIFVaqVJI5iUHX6qG0TLqDBcsfSqzmbNNCfQwM7iBj0ve8fR1Q/m
xgD0p4dGuodTjhc27AdTkZchpwCQE57pUKxTHgGCjoppgE6AKRrQ2jIORJYgbCgAHE+0PRsEZhhJ
HqeYObNZF6sfFHHFqm1CB5tmpKivzwbndyg4ZhR64/RldBBYEMlw3s0Hl/hQpMSD33IsQtNfQfxf
kgLnD2PMrOnyImiGbKSGL5kGAnFgFLEhLAo2acipmnFNx/hGK3MVIuCbAkUQi03Caj8vAwmLprCL
TzlWuGjb9VtKY4YvxmBkQwh7lFHbx7AKqjDtZu3YvB5ValH75bnRnedsmErWb8hVlNaNjrbLjX8t
woxcTnTKCjeNfIDeA7juuLNBJJckhrAcjW8CwhVIjpAEFixDZzypJxQL32ZcMtDIfmU+SY3wnh/s
yQ7wulw+baLtW/RtCes0Ue+TiXgj0LgWwclltC3GozZJ3bEtPpiK9O3ZfsYZh1ZcmyUTHsjlGUbc
BEJDwnE7T1k5rkOZriLBN69UoOFDt3+MB5fgMMxOdWdc6drGvU7KXQogrynn7iNgwjMxRb18psca
At3u6PZy37SV6y4qjJf/WT0uo7hfwGjrR06ppP/hVN73O0K5zSbA8UIoM1CiytwbxrZgxdEdrBQz
JhXQgzPBQ4Mor/xHyPsbEkHEugwYQLP4HNUuBnJXcTlRvZXAAkdVID9gtlJXATsDQC5wLWdgpcSD
HQsjiuOWZAyRXVZZrMN0KbQ9vr1u12/P5rLQvrLljZ1o+Ps8UOY0CKb40FWLwjs8N5Xq+QEN8XKz
+vE6e1gvLTn0DX5QH+/vb+utWws5htYQ/PC0NHV/gC6dRZlrdfvBXHooiRmIRF2aJJtZApqOOT3s
LuWLb+Zuo9nr0/vb6rVPiCmY2xtQ6PRex91Qmz9X28ff/wHr1Ky1sZrR4Pjh0dzBKJGBO1Wk5D3z
tS9brh5bdROJXR5qnzdqLmGMWVYG/F8w+jovE0zBgC0pYpJ59UAI7eyICZf5jEjWXKjt1F+yWr/8
aQTo+Q2YunbyrjNbtXIvzLC5lmQ3TlNX62M3N9+OUL/HxItJLQ/6dO3KpLa6ZAoqXrJ5tzWgZOpY
8mlw7ywCm8pAsNUgmMvL7TC1ZLkIaFOLRtSioB1yKcWIoQsKcH5X1n+ydsgThVzMdd/HdorzXQ/H
iAuwqjR0MSYtQoU7jcW0wikeiMSsLNeSMa9xIka/eQ29tB20GCPdu1/o5FilMZbI5G3VDKvYFVWW
mQ/cBWyREmxFNIY1uCF4h21Un1IxbAQvh4M57nB1yFXOMH+xA2dClPv0g9tqiwD2ctXtdR9O5aLU
ou17MGUsR+HSod2TE3A1vz5CsiSOR+I0tsSeX2Ew66naasZe/Mz+mhCAxlOcHghArUAYH+0owacW
LNX80GoW05x5ZrK/SwaO+qoAqPs+bhemuIPuL78gx5XEl4PLeQ2GC49DQFnlC1PHCwTUpNCB22+a
J7nVdygUDHYmVAWaHVTvlNOAZhuXNbjMgShfa+hXM1oO27u1KJ4Cxgcdns5kH7z82CcZrLNTqzjp
G95umGlJioC7RAd9VdHUQplRTJg/00BA5AKpjRZ+M6Tzq+MI8/nFFSobvckdYkdfz88OONa8slj+
9bCJ+Otmu/54sbcxN7+DnXuKtuuH140ZJ3pevS6jJ5Cy1bv50fX4/h+9HfaxQgmpIMxTQ1PVPqCN
PG+X64coKVMSfe8M8NPbn6/GCEcvb6Y+Hn1aL//3Y7VeAhkD+mv3RIq/bpfPUQ7M+69ovXy2r68Q
pkxBDfZio30R/sgQDlfoGBdiU4oG94Ca698UDwositRqHsQYkxEpSE3w5xfeyfcCRR57FWH4PNhc
cxOl7ezsTMcac00lF94lIEl4bB4Moa8kTAen4Gm6e5dAbYu9l7q/YWUpaKdubhh+Ajn541/R9uF9
+a+Ixp9Bmp3bhDvr4ZFFx7JpPWK3QVNgdkzJGlzRWGBR+27Y1O25aw3k7uwy4Wfj+AYyeBYlE2ka
SkVbBIjki8aVwxmnu/O16TENzlHDJK9QZyAJPeSej8Ht3yeQlHnudxol4yP45wiOLLFhuscxvTX+
5G/ezN4l9iTcQkLlggZqn2rYRwpHeDdPR8MG/zjSxSmkUTEfHMEZscERYCugw1k9h//s0QvPNC4D
KXsLhTFu5gEfskM4yikSjCobMKHHySOcfj1KgEG4OYFwc3EMIZ8eXUE+rfIjnLKlT5CLIxiS5oEU
uYUzmH6Aw3OWEqs5CzZLGZ4o3uFk8EPgOsQO5/hKSz08hTA4fi5zInV5d2S7qkSN6VFx1FwE3n9Z
EhYSz60184ccrtamzIfnN+dHZk9ikRMIbEIW1SKlccDfb9RgeUxHmhfMuMXv4CSUh2sWqNkRSVaL
/HJIr+HM4yUzi3QH5oPT+nxwjT1dcFCAE671aiHklOqK6fDm8q8jx8HQePMVr5lZjEJB4BoGz+Kv
5zdHduEgOettUVX07ng0zkV+Qg+V+fXZ2fmRSXsi4Zqinp/kRZD4ccUJ0USmTIdjp6QyV8QOTL4p
U0bnw5uL6FMCru4M/vyKubMJl8wUivCxW2BdCLVAl3p0GqesBqaJew9Qi3ZNXn5EFDF+idEGnq5c
GqrSKmRl2F1lf2NAuEQZKAfZ2zUsECLmhJqKNu4ulEHQdB6CmNx6IC+XBurzQIMKhJ5AO23e6+By
VOFEQHs9tdywr/wDvaehdEeR5f2nQJ2cy355vykMrCDyW337MLGRalLUxHnK4KW8uyLBP+zilM+Y
9K5TmvU1fns9pMK75TiFmDygXvWiHAt/dYfjkZiUmnm/VaBtMrlsmYTOVip7W4oMnTL/gDB9PjwP
3bfrOmXgXXGYfuw/U+RUKCwM87pq5t8uJpSFjKtBlqTWCrst4g6ak3v38rEH8sIy+Lw+Pz8PZtZK
I0++jehWVxVZ+1IamQWUQaE5wYHu00i33YiQ8CIiorPQnZQMtxEGgDPfQELbeoq/lRTSu4LTtNTF
6PoafZjodB5JQeLeARhd4FZ5RHOjoALPNSBUwZNcIXnRPBXFMDhYwLQvwPfJ+2kztyMWwvsLNgVB
b70FOd6nrSCickHJlFc5DhqzTNnH3U7sb5tqjcvHDoxvyw6M82cPniYnFgTOm0dX/1AjXex7Ak/M
UpaDp7pTrihNcQ9wOHDsq8rm2mvGsSu0bq/2GsR+omyAl09AFcT9KwGH45lXtPbhvxtcn6Sd3dMx
L1Hmp0KkGS4y44rMGEdB/HpwOZ/joEL76QoWChFY/z3y3ilJ8agJ2qeBu7LzUBcABO5uXpwFACmu
CH7LTzAHwskp8y+l5NM8dJVKTdLAbxeZLDBb4U4Es5BCeHKQZ/OLOhR0Z/PLsCMOUDU7Ck5mJ+jh
VPpMn6jr60tceTQgGBa/QTVR99fXFwdpYnxS0cq1oyDo4Pq3q4DAFXQ+uAAoDoYt/XoxPGHF7KwK
NAoq/BDvc48p8H1+FuBzwkhWnJiuILqdbK95mibcqVXXw+vBCVsKP5rfKOX5S2oQkNLpHL1V6w8n
RSFyXIkUPu28hvHgoBTgIubmakTfUB+OcD28OfM172ByWjqKKY+5Zwbsi974pO8qJh7FgC9OmJz2
uRIrUl74D5HH4EOChKIbu2DmOkXCT3jpJSuU+d0c6OY2mQ93xruMDEMJyLss6OPAmHNW1CHwHfpW
wiWkMtWf3HPP7ij5Cgq+X+1y4CIHexa4Dy/zk4IhY2/p8urs4oTkS2acf88eX58PbwKZdAPSAj8W
8vr86ubUZIXJlaKMk+bas0RBiuTgCnhPZJSxYf3oAunJ2B0+pMggnoM//i/ECKQSoL1ODDtPSKbi
/8fYlTU3bivrv6Kah1tJVebEWi09zANEUhJG3EyCWvzCUmTNWBXbckly3eP76y8a4AKS3ZSrkjhC
fwCxo9HoxWXVPcSa9O763Vu5qq81PJ5QEkQedyc3BjT24soccEJukRJJiZ10uwS/DsTBrZ0zDiy5
b1bczJhUoQ6HSvOEJyf4F4YuMS6aCxaGW09O1VKXRdKnsqBKwoNTkXfKOePg4h+LgT8A4sDgyY2a
bf0glLeZCg+7ttKNO68t3WZe4SwSUdlNdcqNXNUcPLVCyZ6AZUtMmNeImpyqWeaqehTIn2m0kLs1
fuRJquTj5FgLzDebUeyaP9a0rnRKuh5Ss7AA9G9debXKhll4psTBNpzeN2e2TTyv85DYiIFDTbWc
ExdfLLaUdrpm/IClm0yGhOlzGBIPJLXLkxKcLU6X6/fL8enQSeJp8WAOqMPhKVPoB0pu2sCedu/X
wxkTEK9rs0LrrCjDgM76CLr9fzTtIP4EA4LL4dC5PucoRJV1TUlMvQ1IemjhLaI5X147YhudxavK
qSp/pmFNBS/TAnn/uJJKDtwPE2PXUj/T2Qzs+OuWFpoG9imUiYtGxMphxtIjLOE1yGMi4ps6SFU4
uRzOL+Bn6QjO0H7taipdWf4AvI5U61EB/Ay2oKz4Wk11Vmgi+Nl7NbuLskDQGZbOdhow0/9inpIy
sZza5v5bUNzlklCgKyC+sxaE7LnAgOUUXMnw57kCFotgzdaoD8kSk/hUZQM5MLiQpoBsRK09zfEp
+0f9TMO4V/Z9kZQyN4wRaDrd2lgy8LbybxhiRHkssRBM4TGitVXKzRhJeUtQunKVa1pBd+SmASJo
fLcrP++AlIPglo2vBYm1WKLO7UrQDPwvZ2LvClH7MjPHTadL9sB1VNEtn59a3pB6ttSIVSwvCox4
0tMVyDs5hS2XXuRyDYKBMi7X0hBlY0u4D9AAaE8sTxNChJFNNx5T1wU+wJX+Frvzk1Km438HnboW
EdyDy6mqHdiB17vChZ1GfFYypHx8NzBmuE6U/wVxb4UnUwR5VZXDjEwBTZZHq14vtWwRW+PHpqJm
jxi1gutfjntg5NxWTGTdKIOFUwqQKARKmjPPaQq/s1cxbERKRUTkFNPHwvPuvNvDWV/q/+b8nzC8
EK5MH5D6WRFWvR+7yplMbCINP4E5l7TGfAdKZEkA/zvEay84HpmM01Bsjc9oRRcyMdP07g1H1a5n
LjiX01YlxGuxHzwGlCAonceEQjM41pOXK5+wJAcVf4Eyvq4ysgevx5nPtPw64Ky0l6DyguCsljVV
fa3Odzgfdy8YR5W1eNwb3jVy+ae374pw0dkVS4gwfFkZy7k9TX1KCUpjJF/XJ++JJoS4LWpIwiLh
ctSJSoaQR2/V81OZ/ihZwTlJaM7MEhAneCrq9bKkM9RHbO4vE6mk8lLVqEe+CjID5vqXfhLTLq8I
n3FCcyBHWJa/IW4MOaI74vE9pSSnQfNIbqxyH+Kx60Swi8FgtWXIdtSfgs2/CL0Fy65rYXwTCS42
W8hRSO/QkjyL3dQNb31Dobg/c53NLagFMg5wh2nzObfkao/Qfby2mhvFKB9+dYXz/DgPPZ5qZ9mY
RrLcbbVHYvNcLBK172oeeITAAxgkWW+cqBzJ0FZqwpL/hrhTsZU64KsXcndL6dQ3DyyzErodURIL
paur7fKal7qehe10kIx90oQb6D4mp4nDipwFdKlJVTRJ014P6jnQTT7kHW93gYZbpQmnjez5oL6t
lhI+GYG80VreWrZOVG3KxZT5Fd11SM5ew8mybQecooM5JQmRG1EKC4YSYQMG1lUbPdwwyqwNyCAJ
hkcsEtC2Y8IIbDgxurkAqdYtj1v/wQvT+QNmhaLG7uPlenx/OfwXF6uojyZNCzDIGp5P19P+9JKN
f2O05b+UTAHIYIM3lfcz2owJUMJ1Rr0NcXbDR1zKAj8OCa5gQWiIhlXtWG3vLMLO/uW0/xc15BZh
2h2OxzrGCyV9ygRqIPsgHfcYYqjd05Ny3Sn3WvXhy39MHbNmfYzqcL/p4zln0UMeUGK9Nf5yq70c
sBUROEVR5cWbuOcVPhJCF+MuF2uv+iSpEjKj4PoK0Xzh7ir3FJyb1NZWzL7vdwnV3QIiJIbiBDNM
3L+/gZD71IyBiakvIsLRY1la6BBednIIHy5T5hGa4xlmdt8d3w1xbQgTM+7NCNub/GNifN8KcIXV
mwzu6V0uw0mOudvtElrHBmbS/jnFeN/3KJYnHzaL5P+yWns3xiy0xvd9QlPAxAx67fX1hZWCahF4
aSPMvwuoJUajMS4fNjH397jdZIEJLY/mfzUm5vFwOGkvB169Bvde+5Bp0LR/Y9iYHd+P79uLWnE2
Go+I4z7HiG7vxiRaiXGv3w5Zj/uj3v2ifXlokEOg1JgyfC2rsGN2gDJLMbj6jGM+rd3EYuz+NbU8
hsKnNU+y2vwZjuZfH2975ck5k5Ig+583Awm157iKe6E44RK1cC2bkGVKjAesKSEnlGSbTe6GPXJ3
UCVYXdBKaMUs+GjQ66ahx/GaLISlvMpY+PJxQyvlhEQUaJQVI3z6J/MfU8sLKE0twCwdL3QJT/DQ
QjGiFojzCMpMxCsJ5LVaqZFt9XvEqzXQY29IWHqw6WZ41zSFruYWXthC3cYW8VABZAHmMf3+cJOK
WHLb9AwSYTwaTrrtk0Q8eJsxbg4O5NVmPMR3MzWPI/4Y+Kz1A2tv3O8ikzC3MG5bXMbVzZlDIBNi
p4+slv52bM4UA4RZ08/Pu/fn4/7SfLtbzZls39QQXOoE5bVsDq62u6PMiDzyKt4RspaZyRpnhZ0/
2MfT8SSvaEXkkz8bETjLEr6UQXu1Oe9eD51/Pn79gltf01XDbIr2PppNe2jZ7f99Of5+vnb+pyP3
qeYTZ7nOLRuCesZx22s2XDBcJeOnobmnl/YvZ/FJ3y6nF2X1//6y+8wmTHMQtQcKqy5NqyTLv27i
+fGP8R1Oj4J1/KM3NGQMN75eeMCpTy7jXAoSvxnyasHtZhtkYoVB5zb4f5QX+K3cRyJ5RyfsHySQ
es1IFhx7XISiMwdehQX9+2EP4ibI0Ah5A3g2qNuOqFQrQh09Kxo8pDUyJKAlRuSYOu6Sm6o6Ms2S
fEK0radx+WtbL9sKkjnDNw4gewx82uE2sSq72kGIqpWPnpU8sufngR/xGF8NAHE8eVPAeSBFdp0a
B2ESH8G/eO2bc8ebcuLNQtFnEc6RAFGWR79tKsCWbsqauYKwxwXyijvrOKC0HFXVtjrmAAngIFYi
OoOLxmz6yaYE6wRUseb+AtVd0j3hQxwXUbsWg+20pS7TZLmu4wcrnJfR82zOLfXE2wJxQau3hb6d
ye0TU2sDcuToeVddFVp3OpiJWnIADvSb00g5aG6fCz7hbx1oYB6Hv3EBNWQ+MPhu0DJPQ0cwd+vj
vJcCgHScsA9XdNAmiGDCEX6BABORfkYXygSetzUj0xal6SBrcKnHPoUgzUYzquOCPJ/ybMSVfkno
EnJ+NRkoqRusN3jwl1w9vUaUkf7PYNv6CcFbprvcEWJK4qLoCxDDawE3CUrgCEvDGL99AGLDfY+u
xKMTBa1NeNza8qxqWXL61pouCG+d6uxy6+b8+VMNdngW7/HGWV+8ZMtbbLCweOpyISTnUY+iCPSM
kzWXLSQnLsjkUSesQFZKFhBJbWHZtaxEDiM4EYDU82/JARTp4fPnBaLQd9zdJ+6B0g9CVeDGcvgK
7aeWcqqNnDN7Tsg5wQM9fsBAxgj4uBaP2J5HXKPkKU3q2PjOGuIh4pOLWRAOm0+5S8XJ4vK/Pp8y
H2PFInnv1nHSjQTFOleTFpYI4i2emDHZP76dr/u7byYA7CTlPKvmyhJruco7lrDIpyqg+Zk6gg7H
LayqgqEB5L6YaSc51e+rdHDghCTXPCOa6WnCHWWgh98ModbRqvG2UbzzQU1r0xquqtXkRnHeoCsm
+KZUgeBS8Bxix93+HS5xrUDwC7gJGbTXRUFwOYkJmeBi2aJFbDOadHFZQY6JJveEXKRAbAbD8S3I
qEs8DhSQeGj1B+Pb9b3Rv6E163V7N0bSCu+rIl1zGvasVC7h7GG3mD/wytScXkiv93uEG5NqDdsH
L1rJeTSpxkDQz2YvuyvEH7tdj26PkAIZkCEhITYhw5szcTQepjPmceLKZSDvB7cWR29w177EYrHs
3gt2Y6IMxuJG6wHSp+ZADhhO6puUosTeqHejJdOHwfjGTI3CoXVjacEsaF82+hm6MU1Ob9+tMLk1
Sdqe9nPMTMj/u7uxeGOfeMws2nrfv2vGHACOKT68QbRgoqY2CM1XdYeg2o+Ix6bJzIiDVopiwJsx
BMRFq6TzQZRAgsmrFWxwAMnG5nFIuQJOKNNPHuWemDFmDsg8kIyJn1Rta1Qy5ZMqz+UhHrq94/58
upx+XTuLz/fD+fuq8/vjcLlWRH2FO8h2aPlBecNoqujkHS4Y6ZpwHrj2jFNBRNYQQAt947fUW3x8
+jgTbzO52bK8PYrRAJeGooUYZTDuTgNMrMUDz0sMzrzi+VwRO+Hu90EHhUTc2t+Cap7q8Hq6Ht7P
pz26SB0vEOCdFddRQjLrQt9fL7/R8kIvzucNXmIlpzG6INmsu4jS56Ks2x/x5+V6eO0Ebx3r+fj+
Z+cCd6RfhZvwggljry+n3zI5PlmYjx+MrPPJAsHvD5GtSdXS7vNp97Q/vVL5ULpWh9iEf8/Oh8NF
3l0OnYfTmT9QhdyCKuzxP96GKqBBU8SHj92LrBpZd5RujpeViqZO0gYCTP+3UWaWKVOyXFkJOjew
zMWl+EuzoPyUChWymkUO7kXa2YAbK+ryFkTE3YvYfH2BX/PBXTa1nYXrpjYe+Lzey5Zh7yWgFcoJ
TcJ6NqPGYO9O1kHp/+R6MC6i0hgutnI3+eei+t2sTR7eHQBYyVPLS5fwxiev0T0SBYpUeSQNG5cE
VyEt5YBqH/c2Y++BNIABmMc3jgvx8Xh7ceGGpb2x74G6GeGE20RBM0mU8rIiL5t1aUGuFFbpZCMr
iI3J12YixlfEmkwMe3s6n45Pldnk21FQd0qY73YZ3OBmGOr5YlWJN6x+Fjd0zXqtwd/2Hkw2MeVE
ImqO7q7681Qu/2oWWeZUDrmxImeUV0keEIo5LvdIdWiQgFs6hAQKUEYidfFkEYqmYsSoX2Eh3rMe
/sp2uWIut5lwZPWRgOflTtZLTaFIlpBuwItxMzkMYr5JmeU2SbFjJRCfvWKkvxH9lHBMLGmDFI2v
Igvzpnl4KmO74bINkkaU95MmbWjSfAZ2eThtKlo+53O3Jeus18hZNg7tRODiZnG183RaOlWRtoMQ
LU7eIVKgc98wMfHAlEjIg6hON+Y0+MiBeBjUE5hEyOsAbhg/i/1A8JnxFGrXE7hO0HGUKyHFNAH9
5kMSCOzVEyyRZjFMF8OET6XppLJ0MGYkxiSLkVIj6yWz2z/XdBdiJC54EZhJoTVcuXP/G0JxwEIs
12HeDXEwGY3uatX8GbickCk/yhxEAxJ71mhbXiW8GvoWGsR/z5j42xe1KpbHQSwxVLetZF5yEQhk
geR7Ff5ZzRlcDh9PJxWqvtFjpTt9M2FZtVtSaaCzJNxaooqU7gU+l9PfnHeKKC9jrh052DPs0ol8
86v5UVQK++vRoIwdG/7QPYG0tlioYGcHa1R7Eax8MIiYP3foHYjZLbQZTVu0kuDlitwQW2ozpUkt
uayIeZTj+oeExQtqUrZs6eACcENuAl5L60Oa9uBvBq3UEbXhR9kny51Lp4B2kmOn063e340HCEUO
/CK9nMOgdkwYPGzjFVW7pGVoooCqd26vUJ2dOVE3qfJ71av97le8WagUOPXwnQTIRLhaYC7WVU62
6KpApH69IjaPwQZdhRpHXi4lBHv9mitr2RCszQyLVxiC+k9Z0eoHwR+WqQERJ34UVrwV6ZSW8Iwq
Mii1SDi58diM3gGocXXN7nLjIijmt+PlNB4PJ9+7xgscAORnHLWtDvr4k0AFdP8lEKH2XgGNh7hI
twbCr0410Jc+94WKjwkzghoIl5nXQF+p+IhwMVMFEQunCvpKF4zwF4kaaHIbNOl/oaTJVwZ4QrxV
VUGDL9RpTDjJAJDkumDup/ijTaWYbu8r1ZYoehKw2OKENb9RFzp/jqB7JkfQ0ydH3O4TeuLkCHqs
cwS9tHIEPYBFf9xuDGECVoHQzVkGfJwSDvlzckKSwf2bPLsJh1E5wnJcQciESogvnCQipIU5KAqY
4Lc+to24SzmvyUFzRvq3KSCRQ2im5QhugT8dwnlFjvETjl96Kt13q1EiiZbUaw1gEjHDV3Hic1ie
yJnIg3T9oM7rIjCqIVTJHFrsP87H6yf2mrd0qDA7mUwktT0nVhJTEXFC7pNjW4noia482CxYZDu+
ZCjhwm0F4VYFcbVY7RrUgOGfE3JuWQrjyR5rBprNcBnrYLSTGZo0buz9+AbPWxDc7q/P3evuLwhx
9358++uy+3WQ5Ryf/gKNnd/Qsd90Py8P57fDS+d5d346vJlh67M3Gu/wejp/do5vx+tx93L8v9yA
IR9JefGD6ltL8KlSDRcHJMlWq34pqk5IP3LwTM58Epu/UOJVysl0i0r3CrW5VXjgUAFLc4Godf58
v546ewhAfTp3ng8v72YsYQ2WzZuz0PBZXEnuNdMd08GLkdiExkuLhwvTmWmN0MyykFc4NLEJjUwB
VpmGAo1A7rWKkzVZhiHSeIiO3EzWToub7czSe+asykgJLl+tZixuJqAZFjeKB4c8aCL2QfUHjb+b
NS0RC8e3kJyoWlr48c/Lcf/938NnZ6+m2W+wI/k0d7m8+4mwbBm5Hm+oSnWsW/TIbi9fbjQrpzcc
dieNNrCP6/Ph7Xrcq6CWzptqCFh4/e/x+txhl8tpf1Qke3fdIS2zLMKrqibP28nWgsl/endh4G5J
/blifc05aD+1YWLngWPOEIueWjC5Sa3yzWGq9AheT0+m6mNetSk2D6y6fVaNLHBOqCBjR1FRuWkl
vqROdSPcMigjBzNMLTgjhtCGZpEbIhxlvuid7Toi3sDyoQBtZ5G0Di0o1a4a022xuzwXHd7oHtxl
br4DegwbkY1sZFs9VrVCtXj3+PtwuTbHPLL6PazLFKHtK5vNghHsVYaYumzp9Fpnj4a0Do6siOje
2Ry3R8oX3a26YMuttvnag+ZObg+baVwuKfW8i3Vb5Nk3FiwgCOlAiegN8btSieijrqnzTWHBus3j
V247wxGWPOz2kKZIAhHNJaN77WQIUD8NCDlWdsbMo+6kdZatQ1m5xmS2ju/PFXO/YsOMkYbI1JQw
C8oRfjLlLRsVi6xBKZgt5i5465eMC0XIBX7I4mIQsAO13CsQsSjzN2lDNHXUSLWr8Qey1Jn627ol
Ltgjw+9p+fgyN2aETmftrGs/v9BQAgU1CuU1F5udHhFLKOdeWjpXrAN04LL0st8zg97X9/Phcqlc
IIrunbmsauSXn2KP+MU8I48Jrdsid2vrJHnRegQ8xqJpwhvt3p5Orx3/4/Wfw1kr9pV23fUFAZF+
wwh1apm3PZrOc2VPhEIcXpqGGwoakEaZPznYFTugRRRuCc46lVeXRtkkML+OfAkcEUqhdRxciZrb
lb6RvRz/Oe/kDfB8+rge3xAGDBwU6i0MSddbUGMmSNIXDlGA6dV4E4Uyzk2c7TRvJpCeH7TyAsAf
nR9d9CNfYX7LKuPMchNdHHD1ohbr5pAczlfQ6pOM/kX5kL8cf7/tVAzG/fNhDx7gTUXFr8AV3m2O
cVEbUJPD3cROuTwsQavaeLvOtd/kOepb4TadRYGXq0kgENfxCSr4mU8Ed6sHQRDZHGM9C6U7i4Pu
MAur/WnJ649cicTAWYQJDuRrZeKslIskxdxiKz60Voc++Nt2Z/UbahXgcsuZbsdIVk2hNlgFYdGa
CfwJVSOmhIhSUolnFkkhCfdIM+SMxphzi7AXUf4j2zvmERYJOPzUJ5aZWp5j+dcf4XADuUfVcbo8
edD0zWMWD6/yO92MR400pXIYNrGcjQaNRBZ5WJpYJN60QYAABM1yp9ZPcxJkqUQflW1L549mhDyD
MJWEHkpxHz2GEjaPBD4g0o2eANNY5dq0ngQv1qleoUa67VXigzp2GitTEfABMBeLGg0IsgglyjWG
v7DJVRYoAJpBKMWwYtgByazNS+jc1VJUo40PhujKd6vag/nWw0QgL1fmZLDcR3AYXxHTRg/K4zD6
XUkJjA/FcrXWdjKQsPtzdLUUm35jL69KnvNDQqW+n49v13+Vbd3T6+HyG5P/h/KTYqm8OqJrOKOD
yw9cSpg5fXEhQOPKcQvx5j2JeEi4I34MCj0iObng1bFRwqCsxf9XdmS7bePAX8ljF+gG7aKvfaAl
OlIsiS4lxUlfBNcRgqCbA7Fd9PN3DsrWMaN0HwI4mgElknNxLmLz2e5TYquVCMV3hYFN0vf+Ll84
ELSN9R4w+w1uqH8j/IG+W7jS9uMp6iqeDPHHf9u/D49PQe3uCXXHz9+kNee3gdBzwkfagtysOfbc
jRLbz65ZevjoZmN88fXzp3++DAln3ZgSs5BzLePdxDSwUVpfJxYbqAELYzd3kYTdGqgE7CdAydJi
lJTJcypthEmZmBuWm1HxePetIxSaT+OK7G46HF2G12ysWWFyC7K6yBN/vAeDOqPAM3H74/jwgLGN
9Hl/eDs+tc/9yxeoCwmmKPnerWW9h6cAC+/b10+/P0tY4ZaM6QzVoBhJO+wSf37t9L9eL+xhxyYC
dq76c7Dv9JRytICpRFIgtFUsO8nqRSn2gqHnIFrTqwKvTOxz0B+t+JAVMaXRZmMGxZTDzmkcIlen
wYZGLcgTe1thaxolSMYDIiJpA1n24TBrl2IzHuWoxcO4xbWNFHduYIzMyMsZwBT1q1EOykFNkARx
wLJFzIJhZrwbuTU4rSFV+VCQcEqOSXqVjLpld1I8ItW7MrjL56ZXHcXQY/o+Ol0No4vnPZrMO8ES
nolbGPEv3Mvr/uNF9rL7eXxlfk62zw+jw0sBHAak7OQM8wEcqwpqYNAhEBWfqyt4fF5st6wwWa5e
w1dWsLFKFz0GNkkNOrsypbwfm29iG84THLmx4beJsm1+LTi8DyLv/kjtyyVmYNrR0/cIjqaW0pRF
GH28jbiIK2vXIy7hwyfGds4s/2H/+vhM/aE/XjwdD+3vFn60h93l5eVfUx2JtmRd2Vulr08gIqHI
dYTy/iB+U1pFdTICG4DAyDDPGbRQr8DOnGDIycNSZQTQVlV7q/cS32z449+xCv/HIvfGRs0L4q+p
C/R4ApXwiW1meisWdZrSEuyoHkf/ZPl/vz1sL1Dw79BXIVhGWaosRhDa78DLOVFNFRzpqFb8bGei
MC+a2FQGvRG+FmpMBoypTGn81sjD8hYVqOppAYePaplxAYBmz1InDsR4l4IICROEVaj9VkryoStc
HnzfeGYg39hK84J9NrSuieBBK2N9qpJHZPJ1JjQj2L9u33byIgXmTGM6DJZ33xdOok6+TwiUzTIz
V+UgtTpMc/yO/rmqavcH5CsUvNHLr/Zt+9AOkqjqQssOC+SGRw66dv6azV8RmQ1JEWeohUHZRu4m
TKrvtfB1gbKYiAGl0LjtAWsbYB9QcsrtKoSiQjHzP9zNBPJohugWGGmbgZMPwGUOu+erWFRwCGq7
mR8MmARIT4d3Z3dFhvYnntjbuM5lAc8rw2d0TiuThUiHV0ZKihohrACjUoowCYGOu0rTb4Sz/2AW
DpSndIMmjLoeF8L2obfGe+WgTXCsSVtmTs6LIAyPYQ+6U29mwbXICEHTWI4NMB2vlLvDEHiT63Y9
Tx6jI2oWIa/gem75M2CFBB0b2mUhyxQsddiFZmGLKMmNly0UGm2Z+ly95IUJiirGZuaj+0UCQVJe
pJrvyUSZuxmKgJNBZIAwZ1+C5o8iDLtBVASAqSbOrCie5CuyH+w/0YFk8vrNAAA=
--===============1251201540010872081==--

