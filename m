Content-Type: multipart/mixed; boundary="===============3584649934096483070=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [usb:usb-testing 18/18] drivers/usb/misc/apple-mfi-fastcharge.c:173:29: sparse: sparse: restricted __le16 degrades to integer
Date: Thu, 13 Feb 2020 15:01:00 +0800
Message-ID: <202002131558.UH2wlHsI%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3584649934096483070==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-=
testing
head:   249fa8217b846a7c031b997bd4ea70d65d3ff774
commit: 249fa8217b846a7c031b997bd4ea70d65d3ff774 [18/18] USB: Add driver to=
 control USB fast charge for iOS devices
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-166-g7e4a5b6f-dirty
        git checkout 249fa8217b846a7c031b997bd4ea70d65d3ff774
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/usb/misc/apple-mfi-fastcharge.c:173:29: sparse: sparse: restrict=
ed __le16 degrades to integer
   drivers/usb/misc/apple-mfi-fastcharge.c:174:29: sparse: sparse: restrict=
ed __le16 degrades to integer

vim +173 drivers/usb/misc/apple-mfi-fastcharge.c

   165	=

   166	static int mfi_fc_probe(struct usb_device *udev)
   167	{
   168		struct power_supply_config battery_cfg =3D {};
   169		struct mfi_device *mfi =3D NULL;
   170		int err;
   171	=

   172		/* See comment above mfi_fc_id_table[] */
 > 173		if (udev->descriptor.idProduct < 0x1200 ||
   174		    udev->descriptor.idProduct > 0x12ff) {
   175			return -ENODEV;
   176		}
   177	=

   178		mfi =3D kzalloc(sizeof(struct mfi_device), GFP_KERNEL);
   179		if (!mfi) {
   180			err =3D -ENOMEM;
   181			goto error;
   182		}
   183	=

   184		battery_cfg.drv_data =3D mfi;
   185	=

   186		mfi->charge_type =3D POWER_SUPPLY_CHARGE_TYPE_TRICKLE;
   187		mfi->battery =3D power_supply_register(&udev->dev,
   188							&apple_mfi_fc_desc,
   189							&battery_cfg);
   190		if (IS_ERR(mfi->battery)) {
   191			dev_err(&udev->dev, "Can't register battery\n");
   192			err =3D PTR_ERR(mfi->battery);
   193			goto error;
   194		}
   195	=

   196		mfi->udev =3D usb_get_dev(udev);
   197		dev_set_drvdata(&udev->dev, mfi);
   198	=

   199		return 0;
   200	=

   201	error:
   202		kfree(mfi);
   203		return err;
   204	}
   205	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3584649934096483070==--

