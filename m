Content-Type: multipart/mixed; boundary="===============6855313768398185594=="
MIME-Version: 1.0
From: Jim Quinlan <james.quinlan@broadcom.com>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 9468/11956] drivers/pci/controller/pcie-brcmstb.c:1270 brcm_pcie_probe() warn: 'pcie->clk' not released on lines: 1237.
Date: Fri, 09 Oct 2020 13:42:13 -0400
Message-ID: <CA+-6iNwKLdgKU258XKtUByUD6TTgm0ePnXD4x0TD-FxpPA5ruQ@mail.gmail.com>
In-Reply-To: <20201009085251.GA16234@e121166-lin.cambridge.arm.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6855313768398185594==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2020 at 4:58 AM Lorenzo Pieralisi
<lorenzo.pieralisi@arm.com> wrote:
>
> On Thu, Oct 01, 2020 at 10:15:12AM -0400, Jim Quinlan wrote:
> > Of course this PCIe driver did not previously work for these Broadcom
> > STB chips, but now, w/o the DMA PR,  the PCIe probe() will be called
> > and the driver will fail in ways I haven't tested.
>
> Can you test this please ? It is just a matter of merging the PCI
> changes and test them without DMA code. Just to understand if there
> is really anything we need to do.

Hi Lorenzo,

I've tested this -- the PCIe driver fails to work properly in cases
where we need more than one DMA-offset, as only one DMA offset is
allowed w/o Christoph's patchset.    But it does not panic or anything
like that, and the bottom line is that it doesn't break any PCIe
behavior that was already working.  So I don't think it is that big of
an issue.

Regards,
Jim Quinlan
Broadcom STB
>
> Thanks,
> Lorenzo
>
> > I apologize for not making this clear sooner but I assumed you were
> > aware of the dependence.
> >
> > Regards,
> > Jim
> > >
> > > Lorenzo
> > >
> > > > Regardless, I will send a fix soon.
> > > >
> > > > Thanks,
> > > > Jim
> > > >
> > > > >
> > > > > smatch warnings:
> > > > > drivers/pci/controller/pcie-brcmstb.c:1270 brcm_pcie_probe() warn=
: 'pcie->clk' not released on lines: 1237.
> > > > >
> > > > > vim +1270 drivers/pci/controller/pcie-brcmstb.c
> > > > >
> > > > > c0452137034bda8 Jim Quinlan            2019-12-16  1176  static i=
nt brcm_pcie_probe(struct platform_device *pdev)
> > > > > c0452137034bda8 Jim Quinlan            2019-12-16  1177  {
> > > > > 40ca1bf580ef24d Jim Quinlan            2019-12-16  1178         s=
truct device_node *np =3D pdev->dev.of_node, *msi_np;
> > > > > c0452137034bda8 Jim Quinlan            2019-12-16  1179         s=
truct pci_host_bridge *bridge;
> > > > > 44331189f9082c7 Nicolas Saenz Julienne 2020-05-05  1180         s=
truct device_node *fw_np;
> > > > > 1cf1b0a6dd95250 Jim Quinlan            2020-09-11  1181         c=
onst struct pcie_cfg_data *data;
> > > > > c0452137034bda8 Jim Quinlan            2019-12-16  1182         s=
truct brcm_pcie *pcie;
> > > > > c0452137034bda8 Jim Quinlan            2019-12-16  1183         i=
nt ret;
> > > > > c0452137034bda8 Jim Quinlan            2019-12-16  1184
> > > > > 44331189f9082c7 Nicolas Saenz Julienne 2020-05-05  1185         /*
> > > > > 44331189f9082c7 Nicolas Saenz Julienne 2020-05-05  1186          =
* We have to wait for Raspberry Pi's firmware interface to be up as a
> > > > > 44331189f9082c7 Nicolas Saenz Julienne 2020-05-05  1187          =
* PCI fixup, rpi_firmware_init_vl805(), depends on it. This driver's
> > > > > 44331189f9082c7 Nicolas Saenz Julienne 2020-05-05  1188          =
* probe can race with the firmware interface's (see
> > > > > 44331189f9082c7 Nicolas Saenz Julienne 2020-05-05  1189          =
* drivers/firmware/raspberrypi.c) and potentially break the PCI fixup.
> > > > > 44331189f9082c7 Nicolas Saenz Julienne 2020-05-05  1190          =
*/
> > > > > 44331189f9082c7 Nicolas Saenz Julienne 2020-05-05  1191         f=
w_np =3D of_find_compatible_node(NULL, NULL,
> > > > > 44331189f9082c7 Nicolas Saenz Julienne 2020-05-05  1192          =
                               "raspberrypi,bcm2835-firmware");
> > > > > 44331189f9082c7 Nicolas Saenz Julienne 2020-05-05  1193         i=
f (fw_np && !rpi_firmware_get(fw_np)) {
> > > > > 44331189f9082c7 Nicolas Saenz Julienne 2020-05-05  1194          =
       of_node_put(fw_np);
> > > > > 44331189f9082c7 Nicolas Saenz Julienne 2020-05-05  1195          =
       return -EPROBE_DEFER;
> > > > > 44331189f9082c7 Nicolas Saenz Julienne 2020-05-05  1196         }
> > > > > 44331189f9082c7 Nicolas Saenz Julienne 2020-05-05  1197         o=
f_node_put(fw_np);
> > > > > 44331189f9082c7 Nicolas Saenz Julienne 2020-05-05  1198
> > > > > c0452137034bda8 Jim Quinlan            2019-12-16  1199         b=
ridge =3D devm_pci_alloc_host_bridge(&pdev->dev, sizeof(*pcie));
> > > > > c0452137034bda8 Jim Quinlan            2019-12-16  1200         i=
f (!bridge)
> > > > > c0452137034bda8 Jim Quinlan            2019-12-16  1201          =
       return -ENOMEM;
> > > > > c0452137034bda8 Jim Quinlan            2019-12-16  1202
> > > > > 1cf1b0a6dd95250 Jim Quinlan            2020-09-11  1203         d=
ata =3D of_device_get_match_data(&pdev->dev);
> > > > > 1cf1b0a6dd95250 Jim Quinlan            2020-09-11  1204         i=
f (!data) {
> > > > > 1cf1b0a6dd95250 Jim Quinlan            2020-09-11  1205          =
       pr_err("failed to look up compatible string\n");
> > > > > 1cf1b0a6dd95250 Jim Quinlan            2020-09-11  1206          =
       return -EINVAL;
> > > > > 1cf1b0a6dd95250 Jim Quinlan            2020-09-11  1207         }
> > > > > 1cf1b0a6dd95250 Jim Quinlan            2020-09-11  1208
> > > > > c0452137034bda8 Jim Quinlan            2019-12-16  1209         p=
cie =3D pci_host_bridge_priv(bridge);
> > > > > c0452137034bda8 Jim Quinlan            2019-12-16  1210         p=
cie->dev =3D &pdev->dev;
> > > > > c0452137034bda8 Jim Quinlan            2019-12-16  1211         p=
cie->np =3D np;
> > > > > 1cf1b0a6dd95250 Jim Quinlan            2020-09-11  1212         p=
cie->reg_offsets =3D data->offsets;
> > > > > 1cf1b0a6dd95250 Jim Quinlan            2020-09-11  1213         p=
cie->type =3D data->type;
> > > > > 04356ac30771091 Jim Quinlan            2020-09-11  1214         p=
cie->perst_set =3D data->perst_set;
> > > > > 04356ac30771091 Jim Quinlan            2020-09-11  1215         p=
cie->bridge_sw_init_set =3D data->bridge_sw_init_set;
> > > > > c0452137034bda8 Jim Quinlan            2019-12-16  1216
> > > > > 3cf0eead9fb895d Dejin Zheng            2020-07-08  1217         p=
cie->base =3D devm_platform_ioremap_resource(pdev, 0);
> > > > > c0452137034bda8 Jim Quinlan            2019-12-16  1218         i=
f (IS_ERR(pcie->base))
> > > > > c0452137034bda8 Jim Quinlan            2019-12-16  1219          =
       return PTR_ERR(pcie->base);
> > > > > c0452137034bda8 Jim Quinlan            2019-12-16  1220
> > > > > c0452137034bda8 Jim Quinlan            2019-12-16  1221         p=
cie->clk =3D devm_clk_get_optional(&pdev->dev, "sw_pcie");
> > > > > c0452137034bda8 Jim Quinlan            2019-12-16  1222         i=
f (IS_ERR(pcie->clk))
> > > > > c0452137034bda8 Jim Quinlan            2019-12-16  1223          =
       return PTR_ERR(pcie->clk);
> > > > > c0452137034bda8 Jim Quinlan            2019-12-16  1224
> > > > > c0452137034bda8 Jim Quinlan            2019-12-16  1225         r=
et =3D of_pci_get_max_link_speed(np);
> > > > > c0452137034bda8 Jim Quinlan            2019-12-16  1226         p=
cie->gen =3D (ret < 0) ? 0 : ret;
> > > > > c0452137034bda8 Jim Quinlan            2019-12-16  1227
> > > > > c0452137034bda8 Jim Quinlan            2019-12-16  1228         p=
cie->ssc =3D of_property_read_bool(np, "brcm,enable-ssc");
> > > > > c0452137034bda8 Jim Quinlan            2019-12-16  1229
> > > > > c0452137034bda8 Jim Quinlan            2019-12-16  1230         r=
et =3D clk_prepare_enable(pcie->clk);
> > > > > c0452137034bda8 Jim Quinlan            2019-12-16  1231         i=
f (ret) {
> > > > > c0452137034bda8 Jim Quinlan            2019-12-16  1232          =
       dev_err(&pdev->dev, "could not enable clock\n");
> > > > > c0452137034bda8 Jim Quinlan            2019-12-16  1233          =
       return ret;
> > > > > c0452137034bda8 Jim Quinlan            2019-12-16  1234         }
> > > > > b98f52bc6495110 Jim Quinlan            2020-09-11  1235         p=
cie->rescal =3D devm_reset_control_get_optional_shared(&pdev->dev, "rescal"=
);
> > > > > b98f52bc6495110 Jim Quinlan            2020-09-11  1236         i=
f (IS_ERR(pcie->rescal))
> > > > > b98f52bc6495110 Jim Quinlan            2020-09-11  1237          =
       return PTR_ERR(pcie->rescal);
> > > > >                                                                  =
       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > > > Smatch complains that some of these don't do a "goto fail;" shoul=
d do
> > > > > the clk_disable_unprepare(pcie->clk); from __brcm_pcie_remove(). =
 The
> > > > > clk is a devm_ clock.  Do devm_ clocks need to be unprepared?
> > > > >
> > > > > b98f52bc6495110 Jim Quinlan            2020-09-11  1238
> > > > > b98f52bc6495110 Jim Quinlan            2020-09-11  1239         r=
et =3D reset_control_deassert(pcie->rescal);
> > > > > b98f52bc6495110 Jim Quinlan            2020-09-11  1240         i=
f (ret)
> > > > > b98f52bc6495110 Jim Quinlan            2020-09-11  1241          =
       dev_err(&pdev->dev, "failed to deassert 'rescal'\n");
> > > > > b98f52bc6495110 Jim Quinlan            2020-09-11  1242
> > > > > b98f52bc6495110 Jim Quinlan            2020-09-11  1243         r=
et =3D brcm_phy_start(pcie);
> > > > > b98f52bc6495110 Jim Quinlan            2020-09-11  1244         i=
f (ret) {
> > > > > b98f52bc6495110 Jim Quinlan            2020-09-11  1245          =
       reset_control_assert(pcie->rescal);
> > > > > b98f52bc6495110 Jim Quinlan            2020-09-11  1246          =
       return ret;
> > > > > b98f52bc6495110 Jim Quinlan            2020-09-11  1247         }
> > > > > c0452137034bda8 Jim Quinlan            2019-12-16  1248
> > > > > c0452137034bda8 Jim Quinlan            2019-12-16  1249         r=
et =3D brcm_pcie_setup(pcie);
> > > > > c0452137034bda8 Jim Quinlan            2019-12-16  1250         i=
f (ret)
> > > > > c0452137034bda8 Jim Quinlan            2019-12-16  1251          =
       goto fail;
> > > > > c0452137034bda8 Jim Quinlan            2019-12-16  1252
> > > > > 40ca1bf580ef24d Jim Quinlan            2019-12-16  1253         m=
si_np =3D of_parse_phandle(pcie->np, "msi-parent", 0);
> > > > > 40ca1bf580ef24d Jim Quinlan            2019-12-16  1254         i=
f (pci_msi_enabled() && msi_np =3D=3D pcie->np) {
> > > > > 40ca1bf580ef24d Jim Quinlan            2019-12-16  1255          =
       ret =3D brcm_pcie_enable_msi(pcie);
> > > > > 40ca1bf580ef24d Jim Quinlan            2019-12-16  1256          =
       if (ret) {
> > > > > 40ca1bf580ef24d Jim Quinlan            2019-12-16  1257          =
               dev_err(pcie->dev, "probe of internal MSI failed");
> > > > > 40ca1bf580ef24d Jim Quinlan            2019-12-16  1258          =
               goto fail;
> > > > > 40ca1bf580ef24d Jim Quinlan            2019-12-16  1259          =
       }
> > > > > 40ca1bf580ef24d Jim Quinlan            2019-12-16  1260         }
> > > > > 40ca1bf580ef24d Jim Quinlan            2019-12-16  1261
> > > > > c0452137034bda8 Jim Quinlan            2019-12-16  1262         b=
ridge->ops =3D &brcm_pcie_ops;
> > > > > c0452137034bda8 Jim Quinlan            2019-12-16  1263         b=
ridge->sysdata =3D pcie;
> > > > > c0452137034bda8 Jim Quinlan            2019-12-16  1264
> > > > > c0452137034bda8 Jim Quinlan            2019-12-16  1265         p=
latform_set_drvdata(pdev, pcie);
> > > > > c0452137034bda8 Jim Quinlan            2019-12-16  1266
> > > > > a37571fa9c04a9e Rob Herring            2020-05-22  1267         r=
eturn pci_host_probe(bridge);
> > > > > c0452137034bda8 Jim Quinlan            2019-12-16  1268  fail:
> > > > > c0452137034bda8 Jim Quinlan            2019-12-16  1269         _=
_brcm_pcie_remove(pcie);
> > > > > c0452137034bda8 Jim Quinlan            2019-12-16 @1270         r=
eturn ret;
> > > > > c0452137034bda8 Jim Quinlan            2019-12-16  1271  }
> > > > >
> > > > > ---
> > > > > 0-DAY CI Kernel Test Service, Intel Corporation
> > > > > https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
> > >
> > >
>
>

--===============6855313768398185594==
Content-Type: application/pkcs7-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

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
mOxPm7sNHsn0TVdPryi9+T2d8fVC/kUmuEdTYP/Hdu4W4b4T9BcW57fInYrmaJ+uotS6X59rAgMB
AAGjggHRMIIBzTAOBgNVHQ8BAf8EBAMCBaAwgZ4GCCsGAQUFBwEBBIGRMIGOME0GCCsGAQUFBzAC
hkFodHRwOi8vc2VjdXJlLmdsb2JhbHNpZ24uY29tL2NhY2VydC9nc3BlcnNvbmFsc2lnbjJzaGEy
ZzNvY3NwLmNydDA9BggrBgEFBQcwAYYxaHR0cDovL29jc3AyLmdsb2JhbHNpZ24uY29tL2dzcGVy
c29uYWxzaWduMnNoYTJnMzBNBgNVHSAERjBEMEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcCARYm
aHR0cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBEBgNVHR8E
PTA7MDmgN6A1hjNodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzcGVyc29uYWxzaWduMnNoYTJn
My5jcmwwJQYDVR0RBB4wHIEaamFtZXMucXVpbmxhbkBicm9hZGNvbS5jb20wEwYDVR0lBAwwCgYI
KwYBBQUHAwQwHwYDVR0jBBgwFoAUaXKCYjFnlUSFd5GAxAQ2SZ17C2EwHQYDVR0OBBYEFNYm4GDl
4WOt3laB3gNKFfYyaM8bMA0GCSqGSIb3DQEBCwUAA4IBAQBD+XYEgpG/OqeRgXAgDF8sa+lQ/00T
wCP/3nBzwZPblTyThtDE/iaL/YZ5rdwqXwdCnSFh9cMhd/bnA+Eqw89clgTixvz9MdL9Vuo8LACI
VpHO+sxZ2Cu3bO5lpK+UVCyr21y1zumOICsOuu4MJA5mtkpzBXQiA7b/ogjGxG+5iNjt9FAMX4JP
V6GuAMmRknrzeTlxPy40UhUcRKk6Nm8mxl3Jh4KB68z7NFVpIx8G5w5I7S5ar1mLGNRjtFZ0RE4O
lcCwKVGUXRaZMgQGrIhxGVelVgrcBh2vjpndlv733VI2VKE/TvV5MxMGU18RnogYSm66AEFA/Zb+
5ztz1AtIMYICbzCCAmsCAQEwbTBdMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQR2xvYmFsU2lnbiBu
di1zYTEzMDEGA1UEAxMqR2xvYmFsU2lnbiBQZXJzb25hbFNpZ24gMiBDQSAtIFNIQTI1NiAtIEcz
AgwTv2xmtR4KOmK4QvMwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIOXUwRxiIBUQ
Az1hE6r/UFRibD3hZtCwaUTHix1ToXEqMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZI
hvcNAQkFMQ8XDTIwMTAwOTE3NDIyNFowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJ
YIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcN
AQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQBGTGUIIc4prupY/KTwtOPlab+fjJkI
EGmACcJzt4eBM6wfImWl2ZFpoqcfh2G+NdmNF3UJ2q8kJ3iu3sBU4NXbxBPNUcev2Yp+c3iirjPk
sUHORsZEQD8+Wy8CktqmLJ84ji0Tnm6ZxfXl+DXHoTFG04pyE3reBtVV+HtJhdQ3hfr8Y9NJpJUZ
Lho4mGWdfdMElDPGBgz4BVKhDcPXcXYt/CUEaM/2vTY/yuu2KrYj8Z3h//Zse5jJ7u1s6VIkPwGP
BJeKJNMu0QOgUcmNcAJ0DEl3dIdNXqK9Xp9Nmfz4t/M6rJbDNw9muKGmWM7NIiz53wBNAB+Sa9FZ
ZZ2oG0W2
--===============6855313768398185594==--

