Content-Type: multipart/mixed; boundary="===============2266161956487544665=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild-all@lists.01.org
Subject: [linux-nvme:nvme-5.13 1/9] drivers/nvme/host/multipath.c:815 nvme_mpath_init_identify() warn: missing error code 'error'
Date: Fri, 14 May 2021 08:55:29 +0300
Message-ID: <202105140250.xTxn7Eqi-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2266161956487544665==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   git://git.infradead.org/nvme.git nvme-5.13
head:   e181811bd04d874fe48bbfa1165a82068b58144d
commit: 5e1f689913a4498e3081093670ef9d85b2c60920 [1/9] nvme-multipath: fix =
double initialization of ANA state
config: i386-randconfig-m021-20210513 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/nvme/host/multipath.c:815 nvme_mpath_init_identify() warn: missing =
error code 'error'

vim +/error +815 drivers/nvme/host/multipath.c

5e1f689913a449 Christoph Hellwig 2021-04-29  791  int nvme_mpath_init_ident=
ify(struct nvme_ctrl *ctrl, struct nvme_id_ctrl *id)
5e1f689913a449 Christoph Hellwig 2021-04-29  792  {
5e1f689913a449 Christoph Hellwig 2021-04-29  793  	size_t max_transfer_size=
 =3D ctrl->max_hw_sectors << SECTOR_SHIFT;
5e1f689913a449 Christoph Hellwig 2021-04-29  794  	size_t ana_log_size;
5e1f689913a449 Christoph Hellwig 2021-04-29  795  	int error =3D 0;
0d0b660f214dc4 Christoph Hellwig 2018-05-14  796  =

66b20ac0a1a107 Marta Rybczynska  2019-07-23  797  	/* check if multipath is=
 enabled and we have the capability */
92decf118f1da4 Keith Busch       2020-04-03  798  	if (!multipath || !ctrl-=
>subsys ||
92decf118f1da4 Keith Busch       2020-04-03  799  	    !(ctrl->subsys->cmic=
 & NVME_CTRL_CMIC_ANA))
0d0b660f214dc4 Christoph Hellwig 2018-05-14  800  		return 0;
0d0b660f214dc4 Christoph Hellwig 2018-05-14  801  =

0d0b660f214dc4 Christoph Hellwig 2018-05-14  802  	ctrl->anacap =3D id->ana=
cap;
0d0b660f214dc4 Christoph Hellwig 2018-05-14  803  	ctrl->anatt =3D id->anat=
t;
0d0b660f214dc4 Christoph Hellwig 2018-05-14  804  	ctrl->nanagrpid =3D le32=
_to_cpu(id->nanagrpid);
0d0b660f214dc4 Christoph Hellwig 2018-05-14  805  	ctrl->anagrpmax =3D le32=
_to_cpu(id->anagrpmax);
0d0b660f214dc4 Christoph Hellwig 2018-05-14  806  =

5e1f689913a449 Christoph Hellwig 2021-04-29  807  	ana_log_size =3D sizeof(=
struct nvme_ana_rsp_hdr) +
5e1f689913a449 Christoph Hellwig 2021-04-29  808  		ctrl->nanagrpid * sizeo=
f(struct nvme_ana_group_desc) +
5e1f689913a449 Christoph Hellwig 2021-04-29  809  		ctrl->max_namespaces * =
sizeof(__le32);
5e1f689913a449 Christoph Hellwig 2021-04-29  810  	if (ana_log_size > max_t=
ransfer_size) {
0d0b660f214dc4 Christoph Hellwig 2018-05-14  811  		dev_err(ctrl->device,
5e1f689913a449 Christoph Hellwig 2021-04-29  812  			"ANA log page size (%z=
d) larger than MDTS (%zd).\n",
5e1f689913a449 Christoph Hellwig 2021-04-29  813  			ana_log_size, max_tran=
sfer_size);
0d0b660f214dc4 Christoph Hellwig 2018-05-14  814  		dev_err(ctrl->device, "=
disabling ANA support.\n");
5e1f689913a449 Christoph Hellwig 2021-04-29 @815  		goto out_uninit;

error =3D -EINVAL?

0d0b660f214dc4 Christoph Hellwig 2018-05-14  816  	}
5e1f689913a449 Christoph Hellwig 2021-04-29  817  	if (ana_log_size > ctrl-=
>ana_log_size) {
5e1f689913a449 Christoph Hellwig 2021-04-29  818  		nvme_mpath_stop(ctrl);
3b7830904e1720 Logan Gunthorpe   2020-02-20  819  		kfree(ctrl->ana_log_buf=
);
0d0b660f214dc4 Christoph Hellwig 2018-05-14  820  		ctrl->ana_log_buf =3D k=
malloc(ctrl->ana_log_size, GFP_KERNEL);
5e1f689913a449 Christoph Hellwig 2021-04-29  821  		if (!ctrl->ana_log_buf)
5e1f689913a449 Christoph Hellwig 2021-04-29  822  			return -ENOMEM;
bb830add192e9d Susobhan Dey      2018-09-25  823  	}
5e1f689913a449 Christoph Hellwig 2021-04-29  824  	ctrl->ana_log_size =3D a=
na_log_size;
86cccfbf773faf Anton Eidelman    2019-10-18  825  	error =3D nvme_read_ana_=
log(ctrl);
0d0b660f214dc4 Christoph Hellwig 2018-05-14  826  	if (error)
5e1f689913a449 Christoph Hellwig 2021-04-29  827  		goto out_uninit;
0d0b660f214dc4 Christoph Hellwig 2018-05-14  828  	return 0;
5e1f689913a449 Christoph Hellwig 2021-04-29  829  =

5e1f689913a449 Christoph Hellwig 2021-04-29  830  out_uninit:
5e1f689913a449 Christoph Hellwig 2021-04-29  831  	nvme_mpath_uninit(ctrl);
bb830add192e9d Susobhan Dey      2018-09-25  832  	return error;
0d0b660f214dc4 Christoph Hellwig 2018-05-14  833  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2266161956487544665==--

