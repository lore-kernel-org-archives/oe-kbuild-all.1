Content-Type: multipart/mixed; boundary="===============0391046934941421728=="
MIME-Version: 1.0
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 9468/11956] drivers/pci/controller/pcie-brcmstb.c:1270 brcm_pcie_probe() warn: 'pcie->clk' not released on lines: 1237.
Date: Fri, 09 Oct 2020 09:58:14 +0100
Message-ID: <20201009085251.GA16234@e121166-lin.cambridge.arm.com>
In-Reply-To: <CA+-6iNzT5vtsg1mq1PMmgEKTCwyf+uMZeSwpsXLgUvA4x+LXPA@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0391046934941421728==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2020 at 10:15:12AM -0400, Jim Quinlan wrote:
> Of course this PCIe driver did not previously work for these Broadcom
> STB chips, but now, w/o the DMA PR,  the PCIe probe() will be called
> and the driver will fail in ways I haven't tested.

Can you test this please ? It is just a matter of merging the PCI
changes and test them without DMA code. Just to understand if there
is really anything we need to do.

Thanks,
Lorenzo

> I apologize for not making this clear sooner but I assumed you were
> aware of the dependence.
> =

> Regards,
> Jim
> >
> > Lorenzo
> >
> > > Regardless, I will send a fix soon.
> > >
> > > Thanks,
> > > Jim
> > >
> > > >
> > > > smatch warnings:
> > > > drivers/pci/controller/pcie-brcmstb.c:1270 brcm_pcie_probe() warn: =
'pcie->clk' not released on lines: 1237.
> > > >
> > > > vim +1270 drivers/pci/controller/pcie-brcmstb.c
> > > >
> > > > c0452137034bda8 Jim Quinlan            2019-12-16  1176  static int=
 brcm_pcie_probe(struct platform_device *pdev)
> > > > c0452137034bda8 Jim Quinlan            2019-12-16  1177  {
> > > > 40ca1bf580ef24d Jim Quinlan            2019-12-16  1178         str=
uct device_node *np =3D pdev->dev.of_node, *msi_np;
> > > > c0452137034bda8 Jim Quinlan            2019-12-16  1179         str=
uct pci_host_bridge *bridge;
> > > > 44331189f9082c7 Nicolas Saenz Julienne 2020-05-05  1180         str=
uct device_node *fw_np;
> > > > 1cf1b0a6dd95250 Jim Quinlan            2020-09-11  1181         con=
st struct pcie_cfg_data *data;
> > > > c0452137034bda8 Jim Quinlan            2019-12-16  1182         str=
uct brcm_pcie *pcie;
> > > > c0452137034bda8 Jim Quinlan            2019-12-16  1183         int=
 ret;
> > > > c0452137034bda8 Jim Quinlan            2019-12-16  1184
> > > > 44331189f9082c7 Nicolas Saenz Julienne 2020-05-05  1185         /*
> > > > 44331189f9082c7 Nicolas Saenz Julienne 2020-05-05  1186          * =
We have to wait for Raspberry Pi's firmware interface to be up as a
> > > > 44331189f9082c7 Nicolas Saenz Julienne 2020-05-05  1187          * =
PCI fixup, rpi_firmware_init_vl805(), depends on it. This driver's
> > > > 44331189f9082c7 Nicolas Saenz Julienne 2020-05-05  1188          * =
probe can race with the firmware interface's (see
> > > > 44331189f9082c7 Nicolas Saenz Julienne 2020-05-05  1189          * =
drivers/firmware/raspberrypi.c) and potentially break the PCI fixup.
> > > > 44331189f9082c7 Nicolas Saenz Julienne 2020-05-05  1190          */
> > > > 44331189f9082c7 Nicolas Saenz Julienne 2020-05-05  1191         fw_=
np =3D of_find_compatible_node(NULL, NULL,
> > > > 44331189f9082c7 Nicolas Saenz Julienne 2020-05-05  1192            =
                             "raspberrypi,bcm2835-firmware");
> > > > 44331189f9082c7 Nicolas Saenz Julienne 2020-05-05  1193         if =
(fw_np && !rpi_firmware_get(fw_np)) {
> > > > 44331189f9082c7 Nicolas Saenz Julienne 2020-05-05  1194            =
     of_node_put(fw_np);
> > > > 44331189f9082c7 Nicolas Saenz Julienne 2020-05-05  1195            =
     return -EPROBE_DEFER;
> > > > 44331189f9082c7 Nicolas Saenz Julienne 2020-05-05  1196         }
> > > > 44331189f9082c7 Nicolas Saenz Julienne 2020-05-05  1197         of_=
node_put(fw_np);
> > > > 44331189f9082c7 Nicolas Saenz Julienne 2020-05-05  1198
> > > > c0452137034bda8 Jim Quinlan            2019-12-16  1199         bri=
dge =3D devm_pci_alloc_host_bridge(&pdev->dev, sizeof(*pcie));
> > > > c0452137034bda8 Jim Quinlan            2019-12-16  1200         if =
(!bridge)
> > > > c0452137034bda8 Jim Quinlan            2019-12-16  1201            =
     return -ENOMEM;
> > > > c0452137034bda8 Jim Quinlan            2019-12-16  1202
> > > > 1cf1b0a6dd95250 Jim Quinlan            2020-09-11  1203         dat=
a =3D of_device_get_match_data(&pdev->dev);
> > > > 1cf1b0a6dd95250 Jim Quinlan            2020-09-11  1204         if =
(!data) {
> > > > 1cf1b0a6dd95250 Jim Quinlan            2020-09-11  1205            =
     pr_err("failed to look up compatible string\n");
> > > > 1cf1b0a6dd95250 Jim Quinlan            2020-09-11  1206            =
     return -EINVAL;
> > > > 1cf1b0a6dd95250 Jim Quinlan            2020-09-11  1207         }
> > > > 1cf1b0a6dd95250 Jim Quinlan            2020-09-11  1208
> > > > c0452137034bda8 Jim Quinlan            2019-12-16  1209         pci=
e =3D pci_host_bridge_priv(bridge);
> > > > c0452137034bda8 Jim Quinlan            2019-12-16  1210         pci=
e->dev =3D &pdev->dev;
> > > > c0452137034bda8 Jim Quinlan            2019-12-16  1211         pci=
e->np =3D np;
> > > > 1cf1b0a6dd95250 Jim Quinlan            2020-09-11  1212         pci=
e->reg_offsets =3D data->offsets;
> > > > 1cf1b0a6dd95250 Jim Quinlan            2020-09-11  1213         pci=
e->type =3D data->type;
> > > > 04356ac30771091 Jim Quinlan            2020-09-11  1214         pci=
e->perst_set =3D data->perst_set;
> > > > 04356ac30771091 Jim Quinlan            2020-09-11  1215         pci=
e->bridge_sw_init_set =3D data->bridge_sw_init_set;
> > > > c0452137034bda8 Jim Quinlan            2019-12-16  1216
> > > > 3cf0eead9fb895d Dejin Zheng            2020-07-08  1217         pci=
e->base =3D devm_platform_ioremap_resource(pdev, 0);
> > > > c0452137034bda8 Jim Quinlan            2019-12-16  1218         if =
(IS_ERR(pcie->base))
> > > > c0452137034bda8 Jim Quinlan            2019-12-16  1219            =
     return PTR_ERR(pcie->base);
> > > > c0452137034bda8 Jim Quinlan            2019-12-16  1220
> > > > c0452137034bda8 Jim Quinlan            2019-12-16  1221         pci=
e->clk =3D devm_clk_get_optional(&pdev->dev, "sw_pcie");
> > > > c0452137034bda8 Jim Quinlan            2019-12-16  1222         if =
(IS_ERR(pcie->clk))
> > > > c0452137034bda8 Jim Quinlan            2019-12-16  1223            =
     return PTR_ERR(pcie->clk);
> > > > c0452137034bda8 Jim Quinlan            2019-12-16  1224
> > > > c0452137034bda8 Jim Quinlan            2019-12-16  1225         ret=
 =3D of_pci_get_max_link_speed(np);
> > > > c0452137034bda8 Jim Quinlan            2019-12-16  1226         pci=
e->gen =3D (ret < 0) ? 0 : ret;
> > > > c0452137034bda8 Jim Quinlan            2019-12-16  1227
> > > > c0452137034bda8 Jim Quinlan            2019-12-16  1228         pci=
e->ssc =3D of_property_read_bool(np, "brcm,enable-ssc");
> > > > c0452137034bda8 Jim Quinlan            2019-12-16  1229
> > > > c0452137034bda8 Jim Quinlan            2019-12-16  1230         ret=
 =3D clk_prepare_enable(pcie->clk);
> > > > c0452137034bda8 Jim Quinlan            2019-12-16  1231         if =
(ret) {
> > > > c0452137034bda8 Jim Quinlan            2019-12-16  1232            =
     dev_err(&pdev->dev, "could not enable clock\n");
> > > > c0452137034bda8 Jim Quinlan            2019-12-16  1233            =
     return ret;
> > > > c0452137034bda8 Jim Quinlan            2019-12-16  1234         }
> > > > b98f52bc6495110 Jim Quinlan            2020-09-11  1235         pci=
e->rescal =3D devm_reset_control_get_optional_shared(&pdev->dev, "rescal");
> > > > b98f52bc6495110 Jim Quinlan            2020-09-11  1236         if =
(IS_ERR(pcie->rescal))
> > > > b98f52bc6495110 Jim Quinlan            2020-09-11  1237            =
     return PTR_ERR(pcie->rescal);
> > > >                                                                    =
     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > > Smatch complains that some of these don't do a "goto fail;" should =
do
> > > > the clk_disable_unprepare(pcie->clk); from __brcm_pcie_remove().  T=
he
> > > > clk is a devm_ clock.  Do devm_ clocks need to be unprepared?
> > > >
> > > > b98f52bc6495110 Jim Quinlan            2020-09-11  1238
> > > > b98f52bc6495110 Jim Quinlan            2020-09-11  1239         ret=
 =3D reset_control_deassert(pcie->rescal);
> > > > b98f52bc6495110 Jim Quinlan            2020-09-11  1240         if =
(ret)
> > > > b98f52bc6495110 Jim Quinlan            2020-09-11  1241            =
     dev_err(&pdev->dev, "failed to deassert 'rescal'\n");
> > > > b98f52bc6495110 Jim Quinlan            2020-09-11  1242
> > > > b98f52bc6495110 Jim Quinlan            2020-09-11  1243         ret=
 =3D brcm_phy_start(pcie);
> > > > b98f52bc6495110 Jim Quinlan            2020-09-11  1244         if =
(ret) {
> > > > b98f52bc6495110 Jim Quinlan            2020-09-11  1245            =
     reset_control_assert(pcie->rescal);
> > > > b98f52bc6495110 Jim Quinlan            2020-09-11  1246            =
     return ret;
> > > > b98f52bc6495110 Jim Quinlan            2020-09-11  1247         }
> > > > c0452137034bda8 Jim Quinlan            2019-12-16  1248
> > > > c0452137034bda8 Jim Quinlan            2019-12-16  1249         ret=
 =3D brcm_pcie_setup(pcie);
> > > > c0452137034bda8 Jim Quinlan            2019-12-16  1250         if =
(ret)
> > > > c0452137034bda8 Jim Quinlan            2019-12-16  1251            =
     goto fail;
> > > > c0452137034bda8 Jim Quinlan            2019-12-16  1252
> > > > 40ca1bf580ef24d Jim Quinlan            2019-12-16  1253         msi=
_np =3D of_parse_phandle(pcie->np, "msi-parent", 0);
> > > > 40ca1bf580ef24d Jim Quinlan            2019-12-16  1254         if =
(pci_msi_enabled() && msi_np =3D=3D pcie->np) {
> > > > 40ca1bf580ef24d Jim Quinlan            2019-12-16  1255            =
     ret =3D brcm_pcie_enable_msi(pcie);
> > > > 40ca1bf580ef24d Jim Quinlan            2019-12-16  1256            =
     if (ret) {
> > > > 40ca1bf580ef24d Jim Quinlan            2019-12-16  1257            =
             dev_err(pcie->dev, "probe of internal MSI failed");
> > > > 40ca1bf580ef24d Jim Quinlan            2019-12-16  1258            =
             goto fail;
> > > > 40ca1bf580ef24d Jim Quinlan            2019-12-16  1259            =
     }
> > > > 40ca1bf580ef24d Jim Quinlan            2019-12-16  1260         }
> > > > 40ca1bf580ef24d Jim Quinlan            2019-12-16  1261
> > > > c0452137034bda8 Jim Quinlan            2019-12-16  1262         bri=
dge->ops =3D &brcm_pcie_ops;
> > > > c0452137034bda8 Jim Quinlan            2019-12-16  1263         bri=
dge->sysdata =3D pcie;
> > > > c0452137034bda8 Jim Quinlan            2019-12-16  1264
> > > > c0452137034bda8 Jim Quinlan            2019-12-16  1265         pla=
tform_set_drvdata(pdev, pcie);
> > > > c0452137034bda8 Jim Quinlan            2019-12-16  1266
> > > > a37571fa9c04a9e Rob Herring            2020-05-22  1267         ret=
urn pci_host_probe(bridge);
> > > > c0452137034bda8 Jim Quinlan            2019-12-16  1268  fail:
> > > > c0452137034bda8 Jim Quinlan            2019-12-16  1269         __b=
rcm_pcie_remove(pcie);
> > > > c0452137034bda8 Jim Quinlan            2019-12-16 @1270         ret=
urn ret;
> > > > c0452137034bda8 Jim Quinlan            2019-12-16  1271  }
> > > >
> > > > ---
> > > > 0-DAY CI Kernel Test Service, Intel Corporation
> > > > https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
> >
> >


--===============0391046934941421728==--

